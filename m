Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6F1374338
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 19:00:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123219.232401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leKs8-0002IF-Vc; Wed, 05 May 2021 16:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123219.232401; Wed, 05 May 2021 16:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leKs8-0002FE-S1; Wed, 05 May 2021 16:59:40 +0000
Received: by outflank-mailman (input) for mailman id 123219;
 Wed, 05 May 2021 16:59:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yav=KA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1leKs7-0002F2-Ff
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 16:59:39 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ed7016e-f3ee-43a5-b0d5-e479650d0adf;
 Wed, 05 May 2021 16:59:38 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 1ed7016e-f3ee-43a5-b0d5-e479650d0adf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620233978;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8eK+kRpmouApf5Duh7JudbDh0cYrXIq6t4Vf/fUsFxE=;
  b=FrM7ZbSW0PnW4gey7waUg65kSHeZelWJ+1oZijrTDfdv/xq+9c8G9h0a
   fXNPWJvfR1N8+nKk5sTbgeEDWzABVnv7x7B50ilNanPCYYVUuBJzdjQJ6
   Hgvqu7RwFokkx1Y62g3enmJ/dY4rphBlx5GyF+x6rXu+R595j5dvpmMdD
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bphG5JNCjxXQvx/Tcz2dwxlI28ydlI1SxXjwkhtwxFLuuxbtchgR94j7e1u82oSzoEv5sQJix3
 ysHOF6rETuPNDPX8BN7OLqJQpE62+UM4yXkFQn4DKnzS1WIW67R9sMaxlIDEEYiVYhAfKq48zh
 gzsQoCtkw9rKOgA5iEFpj97Z7NJMqmPYj39p6JxvG5AqAVL5iHHGtPVo8wm5zLb/3QyPnk/zt5
 +xzhoEY46abAwz7pNpjI9mKKoIWkq32XKrPrqqy+L4VjUwzSW2ImAhWlPMNGDqaxByA8HJuWrV
 c40=
X-SBRS: 5.1
X-MesageID: 43150731
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:wO9vh6PofcjTL8BcT27w55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAse9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrAHIMxbVstRQ3a
 IIScRDIfXtEFl3itv76gGkE9AmhOKK6rysmP229RdQZCtBApsQiztRIACdD0FwWU1iDZ02CJ
 KT6qN81kSdUF4Qadm2AWRAYvPKoMfFmImjTRkNARMm7wfmt0LW1JfRFR+E0hACFw5e2LtKyx
 m4ryXVxIWG98u6xBjVynPJ4/1t+efJ59NfCKW3+7MoAxr2jALAXvUGZ5Sju3QPrPir+BIWlr
 D30modFuBSz1+UQW2vuxvq3GDboUQTwlvv00WRj3emgeGRfkNDN+N7iYhUcgTU5iMb1bkWus
 87vBP6xu5qJCjNkyjn69/DWwsCrDvSnVMYnfMOlHsaaIMCadZq3P8i1XlIG5QNFj+S0vFfLM
 BSCqjnlZNrWG+BY2uclmdix8HEZAVIIj62BmIGusCTzgFMmmF4w0Yy1KUk7wc93aN4ZJ9e6+
 veNKN00JlIU88NdKp4QNwMWM2tFwX2MFzxGVPXBW6iOLAMOnrLpZKyyLIp5NuycJhN6Jcpgp
 zOXH5RqGZaQTOuNeS+mLlwtjzdSmS0WjrgjutE4YJih7H6TL33dQWeVVEHiaKb0rciK/yef8
 z2FINdAvflI2erM51OxRfCV55bLmRbeNEJu+w8R0mFrqvwW87Xn92eVMyWCKvmED4iVG+6KG
 AERiLPKMJJ6V3udWT/hDTXRnPxam3y9Z99C8Hhjqwu4blIErcJnhkeiFy/6M3OAyZFqLYKcE
 x3J66isq7TnxjwwU/4q0FSfjZNBEdc57vtF1lQoxURDk/yebEf//GWeWVY2mq7NgZyJvmmVj
 J3lhBSw+aaPpaQzSctB5aMKWSBlUYeo3qMUtM6lrCc49zmPrc1FIwvVqA0NQijLW00pS9a7E
 N4LCMUTE7WET3jzY+/ioYPOe3Zf95gxCGxIcBVrnrbnV6Gpd4mQ0YaWzLGa7/TvS8eAx5vwn
 Fh+a4Wh7SN3Ry1L3Ekveg+OFpQLFiMDKl+FwSDboVMkrXNcAV9JF363ACyulUWQC7H5k8Sjm
 vuIWmxdevQClRQgHxez53n6Uh5bGmbYkJ2ZE1rqIEVLxWyhl9DlcuwIoaj2WqYbVUPhtsQNz
 zIehM+CAJjzdLf7m/ZpB+yUVEdgrk+NO3UC7ouN4zJ0nS2MYuSiOUtBPlP5qtoM9jor84GWe
 +SYBWuMTv9Eu8lsjbl/koNCW1Rkj0JgPno0Brq4CyEx3Y5G+PVO0kjaLcBId2QhlKUD8qg4d
 Fct5YSsuSxOGmqNYLD5qHTcjJZKhTc5USxVPolrJhIvaQ08Jt/dqOrJwfg5TVi5lEZKsyxqW
 Y1BIJcy5rFMpV0f8MTdzlCl2BZ3uinHQ8OiEjOHuQ6fVsRlHfVMNOC3qrQpdMUczq8jTq1HW
 PazjZU8PjEVRaSzLI2C6o/JmJNdUg3gU4Std+qRsn1CA+wcftE80f/GnihcKVFQKztI8Rdkj
 9Kp/WJlfSQbSz2xUT5uiZ6OLtH9yKCTdmpCAyBXc5O/NrSAyXCvoKapOqyhizwUz21dgAxgp
 BEb1UZaoB7sQYZ5bdHmRSae+jQuUIqk1xX/DFhmBrM4+GdkRbmNHADFxbYjJVQVSRUKV6Sg6
 3+gLOl6Eg=
X-IronPort-AV: E=Sophos;i="5.82,276,1613451600"; 
   d="scan'208";a="43150731"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ledIrhzVEXl2tYGpS4/YKqVsVbQDbpXKVVtKu6zs4c5cNMFMLBiRtzwWpXCgxD7wddlI08E1hJTP5k4fRlX1gVzdqfGlE4d7Pt5qBoJEu54zMhJgccsM38WMqppTP2IjksutGbTB0CXUTH5+iVJcT5ifIi7UVghRtOni5DouT8nmM/kIWcL9gAPd3B8VWBZst8t43/PBi4ysAyRUtlCzh17iGF7+T3G8tbInoRb40zladKYDhXfhvDyLg6VWYprT2i/LQr5+LZo3vru9G/KPvDFXbzKlIs/k0z5v/TXvDcFnOhR8TYxtgM3ZxjDtnuBqO2YLn9HrUMtYLNaobTdDww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buUtKdNlkl53x2DMy1U2OCy8iMaD2Hvy/BHR6HUsRKU=;
 b=bpew02JQP8oAAF6knkCo7g1d6yn2vVfdtlgnZZJ6JgvgtFU3pV9g9NRkGvcjRPxHa5EOrCzAG6OQx5y1OPQp9R04wtdn+vfsqqPAX0sGkbMkGzqKcjIISZsetU7sI2NYwRTHDBSujhZEOn9UAb6XRNgCelX7bkQAtUAFmNhTY1KruOgSuXA7ZzPS/YzQ4mZ9kaYi3OxIIxtbdxIV+/ZMp00SkkRFAOBKVOk0HVPKbrM0/s7qQK4Ytt9cKDyEYLiTgPPA4DGKVxNepQvqRUIedYjTWzh0aBbt2W+7B+QQSDIF+/TadseujZcT1t8x/yulrtLftRGlHIJAluiZdPOmjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buUtKdNlkl53x2DMy1U2OCy8iMaD2Hvy/BHR6HUsRKU=;
 b=jF69TFMdNxCRrHBNspsTyLBsNh/sn8Wgl7MKrGlpNAWcbm62Jh3dAAImWQOGg96F8fcnPkJ1izJRJItLphq5tx94DpHP5ve7VH2JXGk1IuCjbNe5aG09EEkIQsiydqPiNAwoglLmTNgjzc/+6PhpeOpJUQ/Qzift1pIX59NIAOY=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210503153938.14109-1-andrew.cooper3@citrix.com>
 <20210503153938.14109-6-andrew.cooper3@citrix.com>
 <5e6511ca-83bd-8a43-202e-949b4d19b1ab@suse.com>
 <1279476a-f99d-59a4-7fed-1aee37dbe204@citrix.com>
 <d951dc24-e613-8a1d-13ea-b1e439048165@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/5] x86/cpuid: Fix handling of xsave dynamic leaves
Message-ID: <7ce89520-7cca-6c9f-f229-37515116d74c@citrix.com>
Date: Wed, 5 May 2021 17:59:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <d951dc24-e613-8a1d-13ea-b1e439048165@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0302.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::26) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c816ccc-734b-45e1-0fff-08d90fe7285d
X-MS-TrafficTypeDiagnostic: BY5PR03MB5047:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5047E5C7A54EE7EA52D224C3BA599@BY5PR03MB5047.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vUjKSV8cEgG1JdL0pQHqm3vTMBjH9e13zgcYn1lB7RUL4IHfk16FoVcv3SUtjaZ//LqjbGU/6at2BjKUJnHISeSBQovEWHmXnZCnmUD2aDbgxdXllcFJ4UHxpNZL3YW214GT31LrtP2UhLrgiycuLsbYmekrwXFtcZseVqFbFwWT/YdDC7c+Q+EmLRkUCSmcUrS+Dzi2T3a+O3XqXiIBrb1B0qlZfS+WYwJhYWcWSPRiPOSbqtaLKkI4g0WjM/WVkUXUFbb0FeCRHhOO2NaVFWa4YbeaZbtyXYZEZhEik3f1oaSOXmx4Q4dkSxxZ6gU5oTlV8If2vyQED+/pjtm6tl8eQXbaSRD2b49cDgl75rlBdImIXHw7mSR0e/I/1S7Q6lOVBvz04WABU9WInOWFI8Q7HVtmB2qLYlJ0hlWAhi2gFgOHllXAXRXkHv5mP6gOpuflTQ0uPlCZ6dlBzbPvENgluPAQ+2pVtH3WRiwei8O9FYfyf0w+pnmPY6QL16hYKhqcOZicaLFABpSTEK2SJq0xPWnw5VVclB5VMZjNFLQ3D6n+8NzwJMfK4Z1kyPKLoSHj5uMpeDxnhcSVqg/BT19H2m2OzY1IVb5CrhCxo/6Z0TVaigMNuOwzvq1xHGMc/HDHWyyMHuljzDYo+MH6HY4rkhtyeM1KOqp2DSoU8mXB9niHlv3O6eCTyZGCL5Wk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(5660300002)(8936002)(36756003)(66476007)(83380400001)(38100700002)(31686004)(2906002)(26005)(8676002)(53546011)(16576012)(4326008)(86362001)(54906003)(16526019)(6666004)(956004)(6916009)(31696002)(66556008)(498600001)(186003)(2616005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NVJZS1NBTGVrNkFYajdibHNhWGg2YXZITkt1Zmxpa2FtNXR1MzB0VCs1OWJP?=
 =?utf-8?B?V0Q5d0ZkN2xLTFN6ODVTV216ay9wYkQ3K2xPZ0NFMG5MYXFrYjRWcHRXUWtk?=
 =?utf-8?B?a0wydkErWmZHdVpySUhkUlpqZElDV3UwRTVYMG00clFzRmkybklQRDFac2Ju?=
 =?utf-8?B?VENpQjBBdjR6OWlMVWZiR0Q4aXJETGJRQXRqRS83dnlFQnhySG9wYXpDR0FK?=
 =?utf-8?B?SjNTZ3RMdTVFekZNa1RuWXlOakpvbnVEcUZLdUNESU5GQXJCV1FVUkhVQ2x3?=
 =?utf-8?B?Nm1sRXlQdC9lTzY0K0ZoODZsZFZhdjU0bWhwckVwbFJYdWdjMUt6MlUyZjFW?=
 =?utf-8?B?WGN5ZXo2b3hhN2xZWTcxN2JIS2JyTnF3WUVUbzNoTy8reUVJVFJkb3VXbVlv?=
 =?utf-8?B?Qkt3Vm1qeVVzWU1xY3hwbXZ0V0dQSGVPbGw3eGNMSGR1Q1dkaWg3dWtqQkdQ?=
 =?utf-8?B?NVVVOUVuSHVKL0hFMEhmRVRzcEVsdXRQNE5pd0R5TFZ5Si9GMDNMVzVOQml0?=
 =?utf-8?B?TkxZSXlEZzFzS2lhRXZsdjdxZVJsOHg4bmdMMWNNaDJCNjZhNTNLVHFnVzFM?=
 =?utf-8?B?ckJobkozSnRBNUxidG1tYUFNSWMrVzZMODVVeTFTVC93ZXFYWlYxVkdEVDgz?=
 =?utf-8?B?dVIxZnRBWCs1bUhlREgzV1pTL2k4Nm5PZzFPU2RJckphNzBVYmZWRC9oZ1BS?=
 =?utf-8?B?QnM1cnlrbEpRbnErZjF0dDBaaG1POXA5RkkrV3J2QUs3TVROTGQxa0d6Sms1?=
 =?utf-8?B?NCt0Q3B6aitncjd6YVhXNlJvS1BscFJwYWs0RnJkNDVIVU1iS1RoOTNxSTE0?=
 =?utf-8?B?NUJJV096MTlFZXJhYlllaUl0VWFMbEo5RlJwVU9kaWF3S21XZkRaVE9sYVl3?=
 =?utf-8?B?UytMQmlRV3VPa1hsYVRqcDRsUVU0Q0E0QkFuM1J4OElLM1BPWVYzbUd5dkl0?=
 =?utf-8?B?ZG9ZVVNybkc1anNFZVd0d1NmdkVSS2lVVEhYc1ZXekZraUd1QTB1Tm1CNDZI?=
 =?utf-8?B?NVNndnU2ZHY2S2tGODV2R2ZtL3dLU2tKVmp5ZXFjRVpJOWtUM3dVZ0QyVVFT?=
 =?utf-8?B?QnorTTZoeGVWMjgzcnBqYU5DRmhSR0o0SXFzbWtDaGlCMlNWQks1WnMrUG1D?=
 =?utf-8?B?cko2UTY5Rmp0dXRyZ2puc1JONXY3NFBXeVRKYnNTREt2VkJzUmNZL0xGOU5J?=
 =?utf-8?B?WjFvN2lhc2t4Y09YSkhVbTBuaU9BcjJRUjNGcVljN2FSMnBYczE5QmJabUhz?=
 =?utf-8?B?ZzNIS0puWXprR25aQXY1bU5iWUs2TGlFTkZCbjJ0Q1hGeVFmckJmbzNmeUpJ?=
 =?utf-8?B?NEZpT09oRlNPYlpqK2hwbmdpdnU3WXdvQWtmR1J0L1B2VXloK3IzQjI2ZU1v?=
 =?utf-8?B?TGVUTlZCTUN0a00zeXBoc05sbWJBZmlNR0N5SkVsUFBOMWsrVytkS0dCYy8z?=
 =?utf-8?B?NmdIM1BRdGtEbGRVMmNuazRiSU4ramZXbFFqS0c2bFBleTFPK1VBWC9Wb0hs?=
 =?utf-8?B?cGE2YjN0Tm9ocHFpcE00cnJjYmQ4dVNhMFZabUxIOXU3ZWFoa2JUY21CQlFD?=
 =?utf-8?B?ZW9lWDh1SmlRTG9BRXNLMkN3aWRkOHV4cng4R3oxNXF4SnBCc2dDNEtzaVdP?=
 =?utf-8?B?aHZMRTRTUWtRV2lPUGhRdy93VStCUGxCNE1MTXRWMVhtYUp5NDN2YS95dTJk?=
 =?utf-8?B?WnpiaFFUbkpWT0ZORVdVR2hja1duWTJZUngrVGpZQ1pkYnJEVnM2TnA5U2Fj?=
 =?utf-8?Q?71QJwws5TKFrQu0PPigPpTPY8k2bzx5YsNtpcL8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c816ccc-734b-45e1-0fff-08d90fe7285d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 16:59:34.3112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUdlTjfomBfbuwgI8ydSqxFLpqt4SuUxtgVJUBjzuLq0OSRxIBtojoPE6vlwzqhfsLnvM2f/aKTfhwi9aplKGK0R/X0zlqrFr1QZcvinuIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5047
X-OriginatorOrg: citrix.com

On 05/05/2021 09:33, Jan Beulich wrote:
> On 04.05.2021 16:17, Andrew Cooper wrote:
>> On 04/05/2021 13:56, Jan Beulich wrote:
>>> On 03.05.2021 17:39, Andrew Cooper wrote:
>>>> +unsigned int xstate_compressed_size(uint64_t xstates)
>>>> +{
>>>> +    unsigned int i, size =3D XSTATE_AREA_MIN_SIZE;
>>>> +
>>>> +    xstates &=3D ~XSTATE_FP_SSE;
>>>> +    for_each_set_bit ( i, &xstates, 63 )
>>>> +    {
>>>> +        if ( test_bit(i, &xstate_align) )
>>>> +            size =3D ROUNDUP(size, 64);
>>>> +
>>>> +        size +=3D xstate_sizes[i];
>>>> +    }
>>>> +
>>>> +    /* In debug builds, cross-check our calculation with hardware. */
>>>> +    if ( IS_ENABLED(CONFIG_DEBUG) )
>>>> +    {
>>>> +        unsigned int hwsize;
>>>> +
>>>> +        xstates |=3D XSTATE_FP_SSE;
>>>> +        hwsize =3D hw_compressed_size(xstates);
>>>> +
>>>> +        if ( size !=3D hwsize )
>>>> +            printk_once(XENLOG_ERR "%s(%#"PRIx64") size %#x !=3D hwsi=
ze %#x\n",
>>>> +                        __func__, xstates, size, hwsize);
>>>> +        size =3D hwsize;
>>> To be honest, already on the earlier patch I was wondering whether
>>> it does any good to override size here: That'll lead to different
>>> behavior on debug vs release builds. If the log message is not
>>> paid attention to, we'd then end up with longer term breakage.
>> Well - our options are pass hardware size, or BUG(), because getting
>> this wrong will cause memory corruption.
> I'm afraid I'm lost: Neither passing hardware size nor BUG() would
> happen in a release build, so getting this wrong does mean memory
> corruption there. And I'm of the clear opinion that debug builds
> shouldn't differ in behavior in such regards.

The point of not cross-checking with hardware in release builds is to
remove a bunch of very expensive operations from path which is hit
several times on every fork(), so isn't exactly rare.

But yes - the consequence of being wrong, for whatever reason, is memory
corruption (especially as the obvious way it goes wrong is having an
xsave_size[] of 0, so we end up under-reporting).

So one way or another, we need to ensure that every newly exposed option
is tested in a debug build first.=C2=A0 The integration is either complete,
or it isn't, so I don't think this terribly onerous to do.


As for actually having a behaviour difference between debug and release,
I'm not concerned.

Hitting this failure means "there is definitely a serious error in Xen,
needing fixing", but it will only be encountered the during development
of a new feature, so is for all practical concerns, limited to
development of the new feature in question.

BUG() gets the point across very obviously, but is unhelpful when in
practice the test system wont explode because the dom0 kernel won't be
using this new state yet.

> If there wasn't an increasing number of possible combinations I
> would be inclined to suggest that in all builds we check during
> boot that calculation and hardware provided values match for all
> possible (valid) combinations.

I was actually considering an XTF test on the matter, which would be a
cleaning up of the one generating the example in the cover letter.

As above, logic is only liable to be wrong during development of support
for a new state component, which is why it is reasonable to take away
the overhead in release builds.

>> The BUG() option is a total pain when developing new support - the first
>> version of this patch did use BUG(), but after hitting it 4 times in a
>> row (caused by issues with constants elsewhere), I decided against it.
> I can fully understand this aspect. I'm not opposed to printk_once()
> at all. My comment was purely towards the override.
>
>> If we had something which was a mix between WARN_ONCE() and a proper
>> printk() explaining what was going on, then I would have used that.=C2=
=A0
>> Maybe it's time to introduce one...
> I don't think there's a need here - what you have in terms of info
> put into the log is imo sufficient.

Well - it needs to be sufficiently obvious to people who aren't you and
me.=C2=A0 There are also other areas in Xen which would benefit from changi=
ng
their diagnostics to be as described.

~Andrew



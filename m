Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5517F33EFE7
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 12:59:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98671.187284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMUpi-0005oz-Ns; Wed, 17 Mar 2021 11:59:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98671.187284; Wed, 17 Mar 2021 11:59:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMUpi-0005oa-KT; Wed, 17 Mar 2021 11:59:26 +0000
Received: by outflank-mailman (input) for mailman id 98671;
 Wed, 17 Mar 2021 11:59:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=htWl=IP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lMUph-0005oV-OL
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 11:59:25 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07450d08-1dd8-4e1c-8e06-ffa5c3328902;
 Wed, 17 Mar 2021 11:59:24 +0000 (UTC)
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
X-Inumbo-ID: 07450d08-1dd8-4e1c-8e06-ffa5c3328902
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615982364;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hNF4kb/u3xwNeIKb+FS2d/cW9g9oKs0SmqQRrrUmjjo=;
  b=QSDdnoLKCONOqvwCntDkZinLkiUrOsOHlMdU7c2+HvRgd/QISHEhsSd1
   Sx9LNVxgLFnXQKAep/MbUdOjAmw4yFq3yO2U0QVUz8m3yULX6tixsAroj
   ZOWWqilQXr0qkVe1KHuMt5+EBoYfk29/j3uzjZ+rB+VLgCi3cd5Kb3Z9X
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: QNMgavCVX4nX2dV6qZbLIDna6bHu7klltddf9Ssub0O9eCkeYApo7jsdJSq2v+9YRrKg8JoRIc
 +D9dMrb0RNusqaj0YfTtfJGn9SaSWFxGjWLsZ++NQh5obd5l9QQmLmGg2905Dgod2F1O7Vs82D
 4Nd4o/WX2pnmD+a+cz7d1cr4nK8N3ZcEOT01y5mcmwJt5hWcUGY7hs3qP2HFnFFyWFlQPcF/iP
 t3XjCCzyislRlNTRGBPa3CIyh01zm8Bly1OeIZ4HQm0e307Er9ZBeq/w5h2dxy1qAShQGjz+9b
 +6s=
X-SBRS: 5.2
X-MesageID: 39656890
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:6dSSQKO0C8J4+sBcT27w55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAse9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrAHIMxbVstRQ3a
 IIScRDIfXtEFl3itv76gGkE9AmhOKK6rysmP229RdQZCtBApsQiDtRIACdD0FwWU1iDZ02CJ
 KT6qN81kSdUF4Qadm2AWRAYvPKoMfFmImjTRkNARMm7wfmt0LW1JfRFR+E0hACFw5e2LtKyx
 m4ryXVxIWG98u6xBjVynPJ4/1t+efJ59NfCKW3+7MoAxr2jALAXvUZZ5Sju3QPrPir+BIWlr
 D30modFuBSz1+UQW2vuxvq3GDboUQTwlvv00WRj3emgeGRfkNDN+N7iYhUcgTU5iMb1bkWus
 87vBP6xu5qJCjNkyjn69/DWwsCrDvTnVMYnfMOlHsaaIMCadZq3P8i1XlIG5QNFj+S0vFDLM
 BSCqjnlZJrWG+BY2uclmdix8HEZAVIIj62BmIGusCTzgFMmmF4w0Yy1KUk7wc93aN4ZJ9e6+
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
X-IronPort-AV: E=Sophos;i="5.81,256,1610427600"; 
   d="scan'208";a="39656890"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlRdWO6KyUXXnGBabdLSwhISvp6e5XAM/tJf9WUDJMPncVILEf5YhEJXrWPu4bVL9iuyohAiKXmIUpKtcLTRKG9Ykw8G3jyoCahTUgn1lKUXesoXx3GdeL8B9shlgy/YjIeFLmcflXAxD4kCP98GcqG1B2gZjaxStAD37x3Mw94qIVJy1OKf2+I+NcLpfDHfTsr1+2aNM4ZR4Q2Gx/7pEB/OAgS0t3ZidiE6D95CPM9AIC12VuiVGZbBLGGh9THcfPVwV3fiktgbTTZikwkpUv/zWwkN+Pib1G7U0FI6d2JKJSs94s5WWWq4GwOuKYPQpv9MGLrZNvtRW8y+A2tUdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNF4kb/u3xwNeIKb+FS2d/cW9g9oKs0SmqQRrrUmjjo=;
 b=GAomSkqZFtWZvIQkeBXjMfoUzAYQJ1+8z5hnpytdRpMtz8+LvwFmM5veETVrPAtXC6qwICBXascX6RIaLThxHtZqzYTU2DUVpQeczgYUIPYgwXbegi1CCFMSwP1dskB1ahNZCsZpoFN21txuqDjraLlZWpstxnSCnmqRB4IJmlTsL8C9ySNPMqKkuaGVZpLQP7Lln29nES1p2uuH9e/MWiDrNdYqeJwI5f0/GuQraLSlPREecA6Wava/x6BQct4T35HqPYIcql3LSSGHtU4Xz/NvuWY6nj/F/9I7b7HsYjq1NdFkixPrxoIDM1pDc3ef8vWU2P0MmYPDGYrIfbO56g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNF4kb/u3xwNeIKb+FS2d/cW9g9oKs0SmqQRrrUmjjo=;
 b=aF3SM5tElmlvwamMXNLF/hxcT8S2c+kBCPqB84LimL9Z4upyZW0y7APY4M2Fp8XSt1EJ+bOeqU10nhoIY5+aSh3UfDUCc0ZTt7z1APtipRF/x/KJaRV/Fq0bJ10fUaRPSxNHoDOz+gBg7QQDLKMEWYnISysIE4TnEZ/kxiG3HGc=
Subject: Re: [PATCH for-4.15 v2] SUPPORT.MD: Mark LiveUpdate of C XenStored
 daemon as Tech Preview
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20210317112745.15207-1-julien@xen.org>
 <cc98f580-9d92-79d4-49e7-342dc8d6a803@citrix.com>
 <87fff120-5ed8-4775-2340-3852ee7475e8@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <89c5a560-4d71-64b7-ac1d-07fc86ab3fc3@citrix.com>
Date: Wed, 17 Mar 2021 11:59:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <87fff120-5ed8-4775-2340-3852ee7475e8@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0361.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::6) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e2f00e3-e45c-4b1d-ffe8-08d8e93c1930
X-MS-TrafficTypeDiagnostic: BN3PR03MB2131:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN3PR03MB21312B258D8609CAD93CC802BA6A9@BN3PR03MB2131.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DdKBDbeF6T/Q30jg2FAFMnSTmyXsC1/iyARgaj5BVXHSo9i/fI24pnc6Cx100ZAJdlJ0Y3rlRTiMSCfusmcahOmLcb2yxcQQKAx/ASqvo88ql+lE0VL42sHPTlkjRVKqV34CQbF8nlIQTMGXmeoI6ZzORByhae4oMgt1O/ClEhPiOrkF1UutQ35LGBOs0Vshorch3VvdRuyBPhMKggRTmyoZQ9FYPOTGrHlhmvp1oDUePPhBYfigHuLTRIBXfL5rNtYlNXJEmLHcZhCWFL6CfwsTvm6OPbWdm8uOKHI148E3tn+SJzPtfisN31HwUGEgFDQjwbaqpx8F11XxAXf+6hhO4wPXLLcjn+vCiPXQaDU84iCCMP1oozhTZJ2F/pR05BU1b97t0SwJme4YuKZ8h+N7DigprqNtPr+zX35iBFaiuDQVCYYlqIAISX7c7seRQ+PsU3Ytqj8QlY5k7yIHYtkJ1WhwqKMJFBBedBUvJEcTiycxbwKez8uW0wszg3MGBRqQ156zGt2Hw2pYw2xqpg4dbwvxAh0/tcVPEy/yxCpsrTuyKIGal/XI7ItQPyNnRnH/rZuSNdXSsfGSo9ewR2Qyf6qt/Wlo2fjQglCOkjg8xgLKpuKO4Tg2mmo8XIc1OqQA/cudE11wsz7GjgWPAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(4326008)(956004)(36756003)(2616005)(16576012)(53546011)(83380400001)(316002)(16526019)(31696002)(54906003)(186003)(31686004)(6666004)(2906002)(66946007)(8676002)(5660300002)(66476007)(4744005)(66556008)(26005)(8936002)(6486002)(478600001)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c3B2SDVZSGFUUW9GcDd2eTBORWpDdTZHYlpYeDF0K2hEa2ltNFRSc0FyeW1o?=
 =?utf-8?B?aFFaN2dMTGFjRExkb2dvQ3BJQW82N3ZSVlRtaytxNjZzT05WbWY0VjF1TUh5?=
 =?utf-8?B?ZFNxalBwTWZQVllPWTdYc1A3NEpROXFyOVgvemM4cFYzdHlhQlFSbWV2T09O?=
 =?utf-8?B?TG12U0RWb3VFZkF4STBhY1gxMU5IOTBLVVJNWXhMU1RzYSszM0lCWldHaHIy?=
 =?utf-8?B?ZHdkVVlNd0NNNHYrUkI1RTVPSkkvSCs1NTFUcFpldnlKRzg4OFNGdmhUR081?=
 =?utf-8?B?NjFLUXdscjhSMHE2a00wclFHQ3F0d1RMZ1hEVklUcHRORDZINStWa2xydVVC?=
 =?utf-8?B?VGtjRXE2UGdJRzBsbGhkVndwS2xjZDNEVTlTeXpnM1pYbTZLRzdaeTg1bjVh?=
 =?utf-8?B?NHg2QUNIUmhBNnV3RWg0Vi9rYTRCWjA4NEZJaVBtNFJPRFdFQ1FZL3dzZ0xh?=
 =?utf-8?B?NnJFSGFNZVN6dTc5RHp0VDY2WWJhUDkyRkd0V25vNnBacjM5aHE2amhaZVlU?=
 =?utf-8?B?YWNMaW1BOUdPU0E5alBhcStFMjdDamxzSlIvSnpCTFp0WmdWQVZmcTZtNkwr?=
 =?utf-8?B?SHdFTEhwc3l2TGpsY0VyZE9VR000MkF6b3pzTnNvWWJBcDJERStOL2kwMTkx?=
 =?utf-8?B?M2JqSnBjL1M0Z0RSWVUydC9yYUdoajJrWDgxcWNOQ2FTNFBLYzlOQURaRXNW?=
 =?utf-8?B?WXM0VHJoNlV0WktzUDRmRDVkS1B0N0U5TWJMVDV0SlF5OW9MMHFORSthMVcz?=
 =?utf-8?B?TkdRSG5oemRaQVY3ajVNZnd0bWxQYlU5RzBidHdhVGJReUtoL3pPUmk4Wk9T?=
 =?utf-8?B?UVo0MlBINjN5RXlYaHArUTJzb1J5eGE5RHlFK2NKK3pQUU1nclVoSWU4OUdq?=
 =?utf-8?B?TEh4OXdic2YzM0xxMDdoQk9OTzJCWmJocVJoQkhiRGN1Q29iUlBab2N0WXhi?=
 =?utf-8?B?Vmg0ZHB2Wkg3bVFIbVlrLzZheGFTai9pTFVFK0dVeTlzem9Ib1RySUVBZnB4?=
 =?utf-8?B?Qk9QK1owcmFBQXF2eC83cEV3Y2t4dmhhUlZKNnBkQ0dKQjFxb0dqUE5ZNE52?=
 =?utf-8?B?MVd2aG90dHRLUU1FZUgweDZRbzVBMDlVU3Y3NkM2eUduZGQxbmtrTE5OSUN6?=
 =?utf-8?B?bjBYSmhCc2Q3VmZMV05KNzAwUk4xSDhnamsrTUs0YVRGRGxUNVlRdmpUUDYz?=
 =?utf-8?B?QlFRZ3hkcU12K1RvTXJEZ1lpZWZRR0tlSnlZTlROVWhDWFgxR3RPTWFFOGxq?=
 =?utf-8?B?TXBuWTdDYzhHbFpoSzVlTDc4QS8rek9zQXhOeTlTYnkzVXdBamhCVjhDdysv?=
 =?utf-8?B?RGZGbm5ZcGFBRGRGenlsWVpJTWYvNUtxREdIdDlwcEtKNlZTWVJlS0NJNDlC?=
 =?utf-8?B?NzZvTXFyTlB1V3J1NFJrWmp4SUJuZGt4QVk2dkRkbGVzWXRDcFpRdWhZaitU?=
 =?utf-8?B?L0R4ZmNNRllZVVVjSnlPckMzalZ1dlFDN1BtY3hJVThjK0JmYTk5MVFUNlQv?=
 =?utf-8?B?RndqVEg0SHZaWitqdUFOcDF6NWhWSStXUk5MbURxY1IrZHN5Y21lZGNUb2cy?=
 =?utf-8?B?bkc5N0JKdE9nWTVYNVVMVXc1MVVtUDRBNUVPdlRMMXlVdTVGcjdKQW9zUkkx?=
 =?utf-8?B?TGhLUzBOY0NucEVuU0wwb0hMVVR6M3hTRkk3aTdVME9oQnYvcjJtUHFjMEYr?=
 =?utf-8?B?cnZLTjRRRXVkVEhPTDVSTjNkbDN1cmxNVDFuVjFSa29wNWVqOHdzVXJGdllJ?=
 =?utf-8?Q?nySRKqefofvg/K59gBUYh+3k1UNRGjrLp8/IQ/B?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e2f00e3-e45c-4b1d-ffe8-08d8e93c1930
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 11:59:20.5874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7yJF4JNl1ijmbHIqQKnxrg0fPVj7kTjhwYiokWUILaTr4cwDP7oUfCW8wmviJE/GUS96rpKjCklEEeddGepSVLi7z9sCsxipnWNdsxEXdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2131
X-OriginatorOrg: citrix.com

On 17/03/2021 11:54, Julien Grall wrote:
> On 17/03/2021 11:49, Andrew Cooper wrote:
>> On 17/03/2021 11:27, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Support to liveupdate C XenStored daemon was added during the 4.15
>>> development cycle. Add a section in SUPPORT.MD to explain what is the
>>> support state.
>>>
>>> For now, it is a tech preview.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> What about oxenstored ?
>
> Oh, I read your answer as there is no support. I can resend a patch
> with the following title:
>
> "LiveUpdate of C/Ocaml XenStored daemon"

I'd put it at tech preview, just like Cxenstored.  In particular, it has
the same issues concerning outstanding transactions.

It might however be worth having separate line items in SUPPORT.md to
start with, just in case the different implementations progress to
supported at different times.  (More likely, as there isn't an embargo
adding urgency the work now.)

~Andrew


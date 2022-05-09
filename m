Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAE151FDEB
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 15:18:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324530.546625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no3HF-0000Zs-IG; Mon, 09 May 2022 13:18:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324530.546625; Mon, 09 May 2022 13:18:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no3HF-0000Xj-DN; Mon, 09 May 2022 13:18:17 +0000
Received: by outflank-mailman (input) for mailman id 324530;
 Mon, 09 May 2022 13:18:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qz3g=VR=citrix.com=prvs=1216f8a52=roger.pau@srs-se1.protection.inumbo.net>)
 id 1no3HD-0000Ws-M6
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 13:18:15 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a48178c-cf9a-11ec-a406-831a346695d4;
 Mon, 09 May 2022 15:18:14 +0200 (CEST)
Received: from mail-mw2nam08lp2174.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 May 2022 09:18:11 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CO2PR03MB2213.namprd03.prod.outlook.com (2603:10b6:102:e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Mon, 9 May
 2022 13:18:09 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 13:18:09 +0000
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
X-Inumbo-ID: 7a48178c-cf9a-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652102294;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GiO6rbo7xTqCqt3bQ74lzuBmepLrShCoF5uMoZEuQfY=;
  b=QPoC9sWo2RZNVM7mbJ8PwPR/webBlvzFwsTmpoi3E3IIT9Y+lwL+9mfk
   bev4/OJlm2QGmoH6QQF3BPTrIiztqtxv/2CMTQYS0cPB6tbGpENVgu/V5
   4FsALrr3Wrr1Cc3Z16WhI5nvpyi5aCxwRdTvSr++V/vLiMuxPWjcRIbsO
   o=;
X-IronPort-RemoteIP: 104.47.73.174
X-IronPort-MID: 73371252
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:sIbm+KCHONxN6hVW/+Piw5YqxClBgxIJ4kV8jS/XYbTApDt3g2YCz
 2RJUWCFPKyKY2emctslbNu19UsAupOAn4ViQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Nh09Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhM0
 thji7Kydzx4M6bwkdYwcEQbFixHaPguFL/veRBTsOS15mieLz7J/K8rC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6l9B8mcH80m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLjz3SamKWACwL6Tjas452/80FZ77L3SNeX/V/CSf+pRm1nN8
 woq+Ey8WHn2Lue32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPXOZi/Skjk+1W/pEN
 lcZvCEpqMAa60iDXtT7GRqirxaspQUAUtBdF+k77gClyafO5QudQG8eQVZpasEitcIwbSwn0
 BmOhdyBLQJotLqZWHeM7IC+pDm5OTUWBWIabCpCRgwAi/HprZsvlBvJQpBmGbSsk9zuMTjqx
 naBqy1WulkIpcsC1qH++E+dhTup/sjNVlRsuVmRWX+55ARkYoLjf5av9VXQ8fdHKsCeU0WFu
 38H3cOZ6YjiEK2wqcBEe81VdJnB2hpPGGS0bYJHd3X5ywmQxg==
IronPort-HdrOrdr: A9a23:f0SrVakjaECjSF8cGK6E/LKSwhXpDfO+imdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH42GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 P4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR4Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqWneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpf1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY3hDc5tABKnhk3izylSKITGZAVxIv7GeDlOhiWt6UkZoJgjpHFohvD2nR87hecAotd/lq
 H5259T5cBzp/8tHNxA7dg6MLuK40z2MGXx2TGpUCLa/J9uAQO/l7fHpJMI2cqNRLskiLMPpb
 WpaiIriYd1QTOlNfGz
X-IronPort-AV: E=Sophos;i="5.91,211,1647316800"; 
   d="scan'208";a="73371252"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f84cehYY0/PnrbryA6Demg2+3rJ0CHZvJE9VzDERrFfRpJglbpAgr1UB/JLzdip4JlN1ZWLyRiHgUoKHEQAvdq5GHs/2bd74uWx4Y2ZzmGo/NXAbgunOitJWWxqLn+d2ZFVm9KO26ZlbmSL1yXnYDG6cMOzt9j1DhFMSqC9n1vh5W1I+tKi6b9y7iWQ8Xel9fMkQUa1tBrp2s6tb78Twooy/0ToQ0C6oUwBuWyWiS2Vcy4I57AEb8V8/l+zZpge5iIxT+89o3Ki8vHhj3ExnwXrTKtQjUopSCJSkbIsuWGECZ3+A4PwA7gZy8ZR5AVCIhgV49ZhS1NzunmcVjNUY3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnGle4RGWx4BY466ADnhbAXUBtP+/xrcMWvgmzz2Sbw=;
 b=JRaA17EVP1CxtkGt6A2UrGak3U5aevF4amU4BJ38EDMB5c/SyLsCq+ipknusZoZISPUjKOw1+wZ9jc4WFwhbpL5IKsUDEB5VL2TeCsiltK9z1CvN9g4cJ+t6dPHqjXMLiiQXFtArk8OaKfhDYPt50YWDY0rPV7OAvp9TUBs3rxBgs/HJCEnDzQe2y67EVgXaZ4Go68ar4QDWuSoeB0OzIohI65aadzHA5lw8++O3/KUHjKeeISKsn1UvoI9KvSLQ4z6A0TKL4Jhb+68fvGiAfrpHSRCV1apM2va5Qe42gY3d+K3IqNRKw00XdSRAkZUo1Iw/VA0PpwRcvYoXuZsUHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnGle4RGWx4BY466ADnhbAXUBtP+/xrcMWvgmzz2Sbw=;
 b=P/9W7aY9XxDVOTq+/3Z/GUX8T8nc9BnLB3tWODyb8Pk2sbvieVCcGJSsSzgGC/ovzemmx0erI+81knaxNjr7DDgVVGlRU5ZNDD72+CMb7sLpnIKhHxr0bepfiMKnDrSxpukcVFfTk7QQEOMyhxm9Dktm/E1FbpA8PpoShxxHWXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 9 May 2022 15:18:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH 1/3] x86/p2m.h: Add include guards
Message-ID: <YnkUjVuRZa1EVgLY@Air-de-Roger>
References: <20220509122409.14184-1-andrew.cooper3@citrix.com>
 <20220509122409.14184-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220509122409.14184-2-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO4P123CA0460.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 572a4d1f-d0b2-4c8f-4a7d-08da31be5cb2
X-MS-TrafficTypeDiagnostic: CO2PR03MB2213:EE_
X-Microsoft-Antispam-PRVS:
	<CO2PR03MB2213D0F962226A93E312656D8FC69@CO2PR03MB2213.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6Zd90o3LjkaPCFjCZXCJpAGCibgVB0FnJqY9T43TN7d2ZBru/D5zomeGVluAfMJ6PmlfrvAF/hM4gTaviNo8kRggFC3w8BAimGjKVXQ71Q+JY0km6p3o4W4okKHkZF/4NQrgv1tJYnHOOt1GOdgfDWl9Cr+GUI9Glgd4M0V9W7A/CYj2Q0E8kMaDeHkn16r/neu7EmznW1pcCCQuVItAYIvM6fw7o7LplpAjoR+oHSdVuFdjth5K/HypuGt1E+EzKIPMw7wHC6F2T0fqyzd7I3Qk4Eyj+uqv8glvQ3XiAyAW/JzhU+tA9A3qo++aF8iQHc9ZFXlfJ4IeflhMUOXa16JupqoD3GI2Eh1xnEcIS+WJ+ZCIrWQgx13aIeIxl201ESqa1ICu9tXDkHzuEPq5yXnp3Jd+s6amHehIqcWrPX85k/HSCkyduhU3DbM+bREUTMGfufa4lfsSvUihWeNUuzS/OwRkyt2Lyu/okOOSEV1SjW0DdT2w1cEeXf+DGJ53LuZQcr6hNylPLU/YiO03F1Uhi0h6s88wxCKyuFIL3evp/bYcExa4WGKeq6A7KwTGTXhqo+J88zudCxIFKxdXmcQWEnRGn8tb28QeTMMByM6FLxNfjnWs1gPpuwRFDWKn0x4tI00n5GCb9QB9s6uol8eFc/54ppOoeISZDIc/8dcuLvteezXjvS1BIpnJ+HI/1J6fFLkwVQ0ubfOo+oO1B+ISZ5fwKTl3so5uyJknvBA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(2906002)(316002)(6666004)(6506007)(66946007)(6862004)(8676002)(4326008)(66476007)(66556008)(186003)(38100700002)(85182001)(6636002)(54906003)(5660300002)(33716001)(8936002)(82960400001)(26005)(6512007)(9686003)(6486002)(86362001)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzZsaGFUQUY5UlQ1aEFkWFNiUzd3Rm9tcVZNc0hIQTlWL1FrR3lLWU0xU3JK?=
 =?utf-8?B?NzF4YzAwdk1XUjdmSVNldS9JK0VCYmJTWUNOMCtXL0hvWkxwcWVXU3hHK04x?=
 =?utf-8?B?YlowcHU2a1ZiMll0Rlpid09kQTZ0YUhaNW4yeVpVdXpwT2dUVmRWTUNqTzlU?=
 =?utf-8?B?SE44V2lEQkdBSG9CaC9kSnd6MC8wNEt2NUZwY2haWkZmY1hhWUJxOTJ4WXRh?=
 =?utf-8?B?Q1pZSTlXUGNMekpXUC9SNk1YL0NETllQdUFEbk5udDM2OTIycjRwWnVEWE1p?=
 =?utf-8?B?Y2wrbGJxeWJjVmo4OVdPakx4blFrU0JrcXNSR1g4Z0ZESXdIUDFzZkVJWnRw?=
 =?utf-8?B?YlIwLzMvVy83WDRwaW5SL3RieWZmOWxiVmdmWDJYRFRvc1lDeUN2TFlWYTJ5?=
 =?utf-8?B?OWxuK0NBRmIrTTNGVHdGekNmYWtpeWJ1ZGwwRlhnWHp3bVR6T2lGNVVNMUE1?=
 =?utf-8?B?Q1IydEZUN0tBUnpCZ1JGRUwvTVFsNmpFT1VtbEFDNHBYRzN0NUlKRmhjaVhs?=
 =?utf-8?B?aVQvT05qM3kyeWtTU0FwWlVEM2NWaTNiaDJCYWRPOE5QUW85YVQ2cjdwY1VN?=
 =?utf-8?B?OWQrWk0wVWxmbExqYWhvb21qdnRoZ002Ym9Wc2hkbWZxTDlTbjNmT0NQWUNh?=
 =?utf-8?B?c1EyZkk1N1R3LzJtQ3hGQUxHNE9yeVZlT0tZQkR2dzRPcG1EMzgvRW9mUDJB?=
 =?utf-8?B?ZXNOREh1RFByQlpxMnVHenhHVDlJdUNhOTVNRHNERE16aW50bnl6UmxQcVpk?=
 =?utf-8?B?Z25uWndHdTRPZVNEa0c1a2NUUmZzeng0NVVqUVQ2N1BUSHF1MzIrak90c0hK?=
 =?utf-8?B?RHZBRktvb1dQRnJaK3RRSTBFYmtMZml3REpYKzNJZ2hEQVdpMTVRSFZVblRF?=
 =?utf-8?B?YWZhZVZ0UGg0S3dGWXR5YlRtbi9pUDdrQWZ1OXlFb3BjaUFMVytIS0kvS2Zr?=
 =?utf-8?B?TG4wWFB0RVBLUmtEY0NpMkJJS0F4a1p6ZEFPZ01mejJ2Z05Bd0tCMUZMc2to?=
 =?utf-8?B?Q2tPQlNmTHBDY3RsY05vL0NETG1FZXpQcnJTL0QrMXVnbVJYdVUwbG1rd2Np?=
 =?utf-8?B?YnIxTU5zSEtOenpnMGdkaC83VDVnUGl6aUR5YXJrR0NPbENMTFdmcHordGg1?=
 =?utf-8?B?S2tmc1ErbDRhOU15MUNhUTdyc1YzTS8wWUVMZ1FKS1pyVUJCR2V1RUZrZ2t6?=
 =?utf-8?B?WWxwWE5mOWpvRXF6SUwyWU5YR2phUXZ0U0pXZHE2cC9OVytRRk91WUg0Wm1x?=
 =?utf-8?B?SEJNYnBGS3ZlcVpycnNvTW0vcXdqZ1ZKSlJNZW83Yk1kam13ajU0MTJHQ2da?=
 =?utf-8?B?MlAvajlTNGpjQ1JZMHBFeUo4V3VqMWhKNVU4ekZLK1d1Z2dCdW1OemZac0do?=
 =?utf-8?B?NGx5MVB5azdaMXk2OW1aQk1SWVdzSXNMZ2hnOHhPaWJvV2UxOFdDWUNGbElQ?=
 =?utf-8?B?ZVJpanZFUDI4OVV4bWZMTWh5ckZoUzhEYXFtUEROQnR3dndrTmNPSHpTWWsy?=
 =?utf-8?B?ZVNyWlQ1UzNJT1g0Q1U5OXZtTW56OU1mVWh5ckRCNi9TVk8yMElxMVRqczRJ?=
 =?utf-8?B?Z2ZyVGUzY0hVblY0U2RLZE9NSGZjRkJ5Y1BDenFpVVJ5U3pvWndzVUlFWEZV?=
 =?utf-8?B?Zy94a3poMTRSV0NYWjZ1Z050OGxsZFZNcnk1dVVmcFZURTlTTVVxM2x5TGg2?=
 =?utf-8?B?ZGVYcDJJWGFWSTdJK3dRUzFzQjBMVnlsNDBucUk3Sm1JbkhET3hWV1A1OGZU?=
 =?utf-8?B?TU9NdC9NaVlZMUVvYnJNS3hhSnljZThZMTJpbFJjS2lGaEVhZDVPeHhIN0hv?=
 =?utf-8?B?MmdKTWY2UHFaVGRHWEJ0TmxpR1c1dGsyM2tQb0I2MTBrRnA3QUlBZ0hxNzFz?=
 =?utf-8?B?N091dVk4NHNmZGdkckJkanpkUHpMczdCcWFnTFBkYnBWUTR1N1NiS3NZcG5M?=
 =?utf-8?B?eThueTkyMUVjdVVKZUtyMFgrOVRSVTJCK04xSDJKT25Oa3BRd2pDNlg1V0FB?=
 =?utf-8?B?aVV4eWV1bkxCSHMvYndIM3Vuam1NY3FlK1IxWHFGL0paRGxleWo0Tk11Rjcx?=
 =?utf-8?B?YVJKMVd6OGVmWDhZYm9TUSsvclJORFlnTXNQUG1jRzJxc0ppOHlxa1lSdk8z?=
 =?utf-8?B?TjhPYytzMGJNdjJ6c1E3OXgzaWhMa25pcHlLNHRCV2VtdldJSW9ZNkxJNEYx?=
 =?utf-8?B?N0dtM00xR0FpNXNyTzdJVXVYUEIyZzJ5TWU0LzlaY3N6QlFUTTJxUGZGRzVI?=
 =?utf-8?B?TWp3NlBPMmxOczIzTlZLMXQwT2gwUHhKWXo0WUFxT3I4REpDckxydkk3d09o?=
 =?utf-8?B?NHR2S3lkNWFjMERQMzJVWHEzTVBDVTRIMjRDQ1ZjeUxBeDI2OGYrUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 572a4d1f-d0b2-4c8f-4a7d-08da31be5cb2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 13:18:09.7405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JMVsrgrBEzKDQvGB8avPcUKONUVjE7Js6R+sW7O7qhR2KNAH/aRE50Mj1fPmCBHIC5RtCKbmUOhM2ZKYlI2GLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2213

On Mon, May 09, 2022 at 01:24:07PM +0100, Andrew Cooper wrote:
> Spotted by Eclair MISRA scanner.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/x86/mm/p2m.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/xen/arch/x86/mm/p2m.h b/xen/arch/x86/mm/p2m.h
> index cc0f6766e4df..dc706b8e4799 100644
> --- a/xen/arch/x86/mm/p2m.h
> +++ b/xen/arch/x86/mm/p2m.h
> @@ -15,6 +15,9 @@
>   * along with this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#ifndef __ARCH_MM_P2M_H__
> +#define __ARCH_MM_P2M_H__

Do we have any guidelines regarding guard naming? Some files seem to
use __ASM_X86_, others just __ASM and some just _X86.

Thanks, Roger.


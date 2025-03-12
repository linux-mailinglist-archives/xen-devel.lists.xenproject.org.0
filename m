Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B109EA5D4FB
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 05:10:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909736.1316668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQS-0004Yi-6i; Wed, 12 Mar 2025 04:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909736.1316668; Wed, 12 Mar 2025 04:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQS-0004TJ-1H; Wed, 12 Mar 2025 04:10:36 +0000
Received: by outflank-mailman (input) for mailman id 909736;
 Wed, 12 Mar 2025 04:10:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cozV=V7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tsDQQ-0003cw-Ds
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 04:10:34 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20623.outbound.protection.outlook.com
 [2a01:111:f403:2407::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f176b3bc-fef7-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 05:10:33 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 MN0PR12MB6270.namprd12.prod.outlook.com (2603:10b6:208:3c2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 04:10:30 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 04:10:30 +0000
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
X-Inumbo-ID: f176b3bc-fef7-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2AKTkcNFY0gh2V+rVOC65UeZEJNYR7HEEW5rV72zElyRT+bAMl7Rq0Qc1eEHJVcx8tuJLLBOV8c7d7nPuLMcypk1fxFKPRnfk4eN3Iq45XMDm/k+/7nL5E1urAK7RFEjVToPIU3VMoHRyVoP51eddzhwbYm8a3KzgvdOq+zoHoNujq/zGvkZameONvBjxnItA+SKrbaSovJUwyhFbPbHC5OcUAN3sykVA7ms4lWa+eRjcQcUvR9xsMFid8faHuSu5EK93RloGOFcARtLVCXqYOv3e2/mh2WzWxHSNKFaR21v1u+YmGnf+3+CnLDS9DXi+El7ENrjPIvx9/rKvjn6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIj/6w4/3poywgpunCnKDjo05HcEVh1ccU2NarPohcU=;
 b=k4P2NkbtfdujbUDFzpHBmWvs+2201Q9gD4g48uupCIFi0zWDaDBdp39EHjoyLWzqW9KCnx+Urni4b6VWvpSMtCN64zdeHyiyGc/fHvk1P6UKVBnakxQvCIidekN+h7Z8w9juohYTQGiIYZUJQCsLltKvW5DHtV1V7tK0MvXrlfuEdbdOpD4cLIi53N15Mr7tyyb7ChnHzKP6MSG6sq9P+oBWiJy8FZgbvHDWsy0cAzu+P7VVe96JCSR+MD0Kbg34hf+9ieq5rUyBfrwTSfQrRbOrY5kzFaL89VPtIyPu9h1YGY48S0ky4Lo+M6Q5FzjFTyBRrbI6oLnOwpJdjhc7Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIj/6w4/3poywgpunCnKDjo05HcEVh1ccU2NarPohcU=;
 b=Qv3HGGFr1UZGpQ7RZxp1VJY2IH9YkweOe2IxSiCIkShl+TrvQjH7iU21YY25B2UGhBryeql/4f4djh6NVPX4HSAK+4R9B55EpQMGoN7ItwbK4d4/mAELYeYuFplKpIOem4dYsqdTnyB+0LDPAXAgC3phCgIwGgUR6v/npz9jZ64=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "Stabellini, Stefano"
	<stefano.stabellini@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, "Orzel, Michal"
	<Michal.Orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Sergiy Kibrik
	<Sergiy_Kibrik@epam.com>
Subject: RE: [PATCH v1 01/19] xen: introduce CONFIG_SYSCTL
Thread-Topic: [PATCH v1 01/19] xen: introduce CONFIG_SYSCTL
Thread-Index: AQHbkwQ2siYVTp7HZ0Ko0MkyYzyBGrNu4nmg
Date: Wed, 12 Mar 2025 04:10:29 +0000
Message-ID:
 <DM4PR12MB845105949CCBCD7780A718FFE1D02@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-2-Penny.Zheng@amd.com>
In-Reply-To: <20250312040632.2853485-2-Penny.Zheng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=5fcb949d-9f05-42cd-aa6f-eafdf0e36244;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-03-12T04:10:18Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|MN0PR12MB6270:EE_
x-ms-office365-filtering-correlation-id: 44af5575-c76f-430a-03de-08dd611bd3bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?jS+DauiYOToa9y9XjO3kHaMfkXbx0jHWPFT/RyRmFJKnARuUuLYnPNlnRY?=
 =?iso-8859-1?Q?4PSlLO8lhTD1xBKwo8lruDD631prZBGQ2FnjgSv51xCTHuTlTmu3ECjjPx?=
 =?iso-8859-1?Q?MJLw76xMIqR1EifAVbXuZQVre+S6jP5+OOrf8fNHKUvRk7Ay08qMmxRvns?=
 =?iso-8859-1?Q?vowQJ8EsuuYfh72HUxBuGO71NiDG4FivyoJNJCqCVxWuFXytugZ9+4vPua?=
 =?iso-8859-1?Q?DzRknFboEgDUslj0I01ptDgywy0LAfVx13hZwB2sAygmqVmawDy4sD+fmB?=
 =?iso-8859-1?Q?Xmgf1O/3eBsutDWLGpTcTzhojKHtkCQLLdT0141+JgHNJhBpy0ARLpTIai?=
 =?iso-8859-1?Q?wBBT9bZi7LaT2SJleVRTwuTubnLrjtxmB67xy41e10ORpP4O7pCU7wkPRU?=
 =?iso-8859-1?Q?KCC94xVTlQEauShZW+fKai18UssAz98NHmm69SrDsxjRhEaBaPCh/l/dM/?=
 =?iso-8859-1?Q?BmQNx1pyOrsUmafLRZWa4v4Ws6T+uMxTV8wpBPG2XxPza/mOa57vM4CW5B?=
 =?iso-8859-1?Q?SCpjMrt5ScyEVaWSHUef/qWJUcaoGVPHIgGAi/OAN6w0iv0XOh4aJSjQv1?=
 =?iso-8859-1?Q?IDWUIVOWnDa/yf58dyN2LIS+HSJvvYUIlvzqB4T4kf0W1jSsbOrScnGkDH?=
 =?iso-8859-1?Q?UoC54w5cJ7kLhnWkDb3++9AD30x6cwXjPt2LZl43nnNri06PIh5jedclPN?=
 =?iso-8859-1?Q?0vdUFnFa3teFjVZdjsEkqNjlPHZXL+Mb/JtvJH0CUR8e2CP3xUaTMg1MWF?=
 =?iso-8859-1?Q?1X9x1NvlBk5ZegL/GuBvrmQJ4A7jNsbA+i/RqSWSvyZ8jXdjfiDNJp81u+?=
 =?iso-8859-1?Q?WPII9n7XX8Yzv8bBMrzUVe1OLmwdentDg+I+eV9deDkHjuto5Va8tcUgEA?=
 =?iso-8859-1?Q?4C47pArHkUetvjpXqTb+PMbw4fWKUcr4h/dMjMhh58IECTh2QyLsXOfXJN?=
 =?iso-8859-1?Q?ceiQjTV6Cc8E9pGMEaO00pdu86VAYgaVbNbBowRqVceoPFvFAH47qwe+WO?=
 =?iso-8859-1?Q?TgTU/ehmiYeir4WDvIb2YHTr6YrhACd2D9zvIcg1dkGus14aAemg/Gs5DH?=
 =?iso-8859-1?Q?frdd4exgb4qiGyVKF/RCNZ/ydG/RMa4DVbPcxXFgCKSiNbDODsSsQKnFQJ?=
 =?iso-8859-1?Q?GJU5l6k69Er1w5HJ/H3pxO5ibDMONJGGOQTLtO2/pcyW/qBkflgE7TPbay?=
 =?iso-8859-1?Q?m2fRJqSM9vnjhlMrJ4qbMtD0rD9mM0n1bjEu0E+2nyM/NxcxvFGbr+XDUp?=
 =?iso-8859-1?Q?iyLM5Mx8+KbrzOZdsOwQem0X8Jkky2qUH1WJs8R11dhQ8u0hT4A+TPjhLn?=
 =?iso-8859-1?Q?uvQyDPV/0nc1YfCPSqWECorUdtMiXYyg0ZCT1pMWsyrCAL5Wy3LnL6nb+J?=
 =?iso-8859-1?Q?rRUQT+BGA6lGNyxhWLGs4NbShx3HAwnD3/u6xxtHtJONY//7WVd5r48cIX?=
 =?iso-8859-1?Q?mXGttaN35HcoDhot?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Lru+bRfbxYX8jX9EMKKbGgJfUqE1m43KjtPhqqYAOfHGIJ02GttlwVZdnV?=
 =?iso-8859-1?Q?Nb4f6inRy64/9kdKha5hIJx5tQZkXe1GguA1s7o5khnqR22hNqacVjQZeD?=
 =?iso-8859-1?Q?LADFx9AfxYD6e9JiNF+COkypzScwTK2umkNo9CORI5TpAf60I2QezOONus?=
 =?iso-8859-1?Q?0fdqewLWbOxV7EDGdKPMMhj3TnCUC4dXVDtoRzYstGOT9D7o75W4I5HjWi?=
 =?iso-8859-1?Q?qOlDMmxKqTqic69jp0VoIvSlosybR1TZVbYIWzvgIRu9S1SGm38TP1YAGU?=
 =?iso-8859-1?Q?4qnXC1Z88C2OWip7nCzXc/OoG93ANGWE/crUkSek6D2V7xTT2gshALri1+?=
 =?iso-8859-1?Q?d3BLPLR0cOiD4dEOTEFKIIxJ3vhNVTH6qapbO/VfwonyTYo+dsyXG26P1H?=
 =?iso-8859-1?Q?u/BXjqCxfs/aBhd7rkqmPMPfo8UAjq8CEpUFCHvQkvcg+yuxJs1kZDIOAN?=
 =?iso-8859-1?Q?Js+Q24q1AO/J6zX+U/j18UjzdYUa4cnEN0WGNcsbF/qS446Mm4HkGk+fig?=
 =?iso-8859-1?Q?bo1LJ1YRplrWFWYZP1UpIMs9grrgbb4QV/2cS26X18vuT1A9dgMMQSL4ZH?=
 =?iso-8859-1?Q?M3IsDFzPa++3a3Nxc4FgUz2YELrk2wm164D/dX3bxgux3oJe/suIvxpvda?=
 =?iso-8859-1?Q?/DMf1+ekoyQzzIyuJSqxvddI0Yyre3Jkoonddi88bksjF1pW3NKE/8/yfA?=
 =?iso-8859-1?Q?1iFgE6g15F9pJe+HVmRsqyhmujagb8Ze2z1PIq7PmTQ0k+aIvYGTLLaQb1?=
 =?iso-8859-1?Q?jSCwrguc5xE87PSav+hes4qMNchvyqkXl7KvKe0B4ZnU0FF3Hp0tC7lE6W?=
 =?iso-8859-1?Q?yossmi6mCGBYPYz7avIV1/aIlwmi1bQa3JhyelIWn4HmfNgEyv5yv9Y+xl?=
 =?iso-8859-1?Q?Wsd/uTr9ZIHS5hOdqMYbn9VYOVUahqpZk77tscXG4mdN4v1ZZQrL1G4Y+c?=
 =?iso-8859-1?Q?wwjy6VS2+WryMWxJZVVpV/r3bWTzXHXtTHRpLVLkMk2BQa4dnjJRVnfm1O?=
 =?iso-8859-1?Q?nWgVageU6lvy8uFrQP5Y6/boql/KeR3VNO4C7nB0uMrWHCfvc+OrtyJsC5?=
 =?iso-8859-1?Q?3qE3cQr8unf1xjw5Xd829eWKmQTUmuZAf0xhkRNkC4bILU/UDmkm3VDY/t?=
 =?iso-8859-1?Q?2SfvHq5tt0ZlP0z+6JMUV6YjpRGdZytaSizbm4ecFucNILiWemHWdeConl?=
 =?iso-8859-1?Q?juTl8FR0JGIFoe36t7mrJVnrLKaXInnW5sENKA+6O7C5ScMgAgYyUvsPJi?=
 =?iso-8859-1?Q?t7a2AGUE5NBqqdHzO8q4wxO1IRowAh3a39JwK8Hp+kFLCw5wYHD91jRtQO?=
 =?iso-8859-1?Q?Qkp3Ixje429G1l2qvq35hQ4x73eSS9KPRrj7BnnT+pfL8AVARTLyBXqPlu?=
 =?iso-8859-1?Q?HxFatO/PZpFcvo+U2mo4t+dh/NMxvR+quwQPf5udHHs6CNpRJ2zemasktx?=
 =?iso-8859-1?Q?Fs1rzDujOuK8cqwbQAc69qEolblT9OecmUcDLC0GpMKUvVS5H1hDZW3W2n?=
 =?iso-8859-1?Q?/QdzDKP94IuY39fuRKtlsY9g1F3AswBw15DaxWcdXCLsL+sLVzqDtZarlJ?=
 =?iso-8859-1?Q?F1f2ATBdLV/XdyhD1l8LdSUDibnj/7yEc7oBWhOyqlZjJX1F7NYN3Qn8dE?=
 =?iso-8859-1?Q?Ow5ahV8ox64Jw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44af5575-c76f-430a-03de-08dd611bd3bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 04:10:30.0113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5F+qy5M39HjUgYpPSML55GHGa/7bUFFB+XOAQ/3enMXqgHgsJqqmrFwqPzVOW5t02zf8pmQ06JqRj0i+ZsADIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6270

[Public]

Hi,

> -----Original Message-----
> From: Penny, Zheng <penny.zheng@amd.com>
> Sent: Wednesday, March 12, 2025 12:06 PM
> To: xen-devel@lists.xenproject.org
> Cc: Huang, Ray <Ray.Huang@amd.com>; Stabellini, Stefano
> <stefano.stabellini@amd.com>; Andrew Cooper <andrew.cooper3@citrix.com>;
> Anthony PERARD <anthony.perard@vates.tech>; Orzel, Michal
> <Michal.Orzel@amd.com>; Jan Beulich <jbeulich@suse.com>; Julien Grall
> <julien@xen.org>; Roger Pau Monn=E9 <roger.pau@citrix.com>; Stefano Stabe=
llini
> <sstabellini@kernel.org>; Sergiy Kibrik <Sergiy_Kibrik@epam.com>; Penny, =
Zheng
> <penny.zheng@amd.com>
> Subject: [PATCH v1 01/19] xen: introduce CONFIG_SYSCTL
>
> From: Stefano Stabellini <stefano.stabellini@amd.com>
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
>  xen/common/Kconfig | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig index
> 6166327f4d..72e1d7ea97 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -519,6 +519,15 @@ config TRACEBUFFER
>         to be collected at run time for debugging or performance analysis=
.
>         Memory and execution overhead when not active is minimal.
>
> +menu "Supported hypercall interfaces"
> +     visible if EXPERT
> +
> +config SYSCTL
> +     bool "Enable sysctl hypercall"
> +     depends on !PV_SHIM_EXCLUSIVE

I'm aware of the commit of "x86: provide an inverted Kconfig control for sh=
im-exclusive mode"[1]
And I'll rebase whenever it gets merged.

> +     default y
> +endmenu
> +
>  config LLC_COLORING
>       bool "Last Level Cache (LLC) coloring" if EXPERT
>       depends on HAS_LLC_COLORING
> --

[1] https://lists.xen.org/archives/html/xen-devel/2023-03/msg00040.html

> 2.34.1

Many thanks,
Penny



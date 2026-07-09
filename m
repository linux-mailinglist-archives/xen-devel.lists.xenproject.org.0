Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0JR3CP7+TmqoYgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 03:53:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7307F72BC66
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 03:53:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=g1wNoIWT;
	dmarc=pass (policy=reject) header.from=nvidia.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357449.1611854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whdwQ-0002vt-VI; Thu, 09 Jul 2026 01:52:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357449.1611854; Thu, 09 Jul 2026 01:52:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whdwQ-0002tI-S0; Thu, 09 Jul 2026 01:52:42 +0000
Received: by outflank-mailman (input) for mailman id 1357449;
 Thu, 09 Jul 2026 01:52:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ziy@nvidia.com>) id 1whdwP-0002tC-OD
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 01:52:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whdwO-00BiVk-Eo
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 03:52:40 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ziy@nvidia.com>)
 id 6a4efe88-bab6-0a2a0a5309dd-0a2a450180da-28
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 03:52:40 +0200
Received: from [52.101.61.50]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ziy@nvidia.com>)
 id 6a4efee6-400f-0a2a45010019-34653d32c39f-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 03:52:39 +0200
Received: from DS7PR12MB8371.namprd12.prod.outlook.com (2603:10b6:8:e9::18) by
 DM6PR12MB4154.namprd12.prod.outlook.com (2603:10b6:5:21d::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.15; Thu, 9 Jul 2026 01:52:25 +0000
Received: from DS7PR12MB8371.namprd12.prod.outlook.com
 ([fe80::23d7:9e07:1de8:d80a]) by DS7PR12MB8371.namprd12.prod.outlook.com
 ([fe80::23d7:9e07:1de8:d80a%3]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 01:52:24 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cjp8xPN3RUM5OddQSmxigJbi+D9CHmDgyVuA6D5RiiyGfSw/+x0Edd5zsYREEB8jTwNClG4TMOFxdQkfssfaENZIDPOsstqQTsORb4jr/HAXH/H9F3tfRR2fUKsdI45VNGFSIYyhUEV/XwHEDaRDLBjd24U8KB9vaPFU0VMP8ImgM6Bi8tlaXJM0+cILzXUpGKeu4eiD/lmsEFunmkHLmOpaHhfprjFp5xgumUf+vi7rdAgxKiA4dMtyvnPFQwQg7CtSVZvbUmLYruJWRBTXZKwn5rXQO3yludzWmBBPZHVgwWnKdIc+wARLvkdbBGbqQY1mQa0+nshUc+Q3vFl92g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgmsIUewvtgaZUDi1JMSdecE8z2jvCAGnPZP1YDwjOg=;
 b=EXjke7CUW/5f2iy9OKEz+jRG+TSwpfDGSg6WGGUk9Vv3AIBSt+R1rJ491htqPK22SCzoELEZtKwtScCFKbv6vZRo3e46NKL55QbyDm5h0b4rWYwEZLDvCNNrEUiJF/f3fJoMInWjUHAUWU8Z//NjBp5XKDUDcmlKR9FPrDSRW2RRdcid5IFcwH3iQSYiMlOMvHsWldJmTLcbONJ+8xFYEU52rraucOZAZruZZ5ZTUur0e7jWJGCRYBcjMP+uZyQyVnBnPhHNYQZLVgdH5eE8UUkgNlXUgt/SpoZK8317cPBoE8MyvFg+yT/aXufoxROR1782IGKLwoqABs4UvBCfzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgmsIUewvtgaZUDi1JMSdecE8z2jvCAGnPZP1YDwjOg=;
 b=g1wNoIWT2Fpn5YCBEHNCOakYn0IcDIJHExfw+BmzBQJigcrZQXeAzqb7fDSGvMaDdWEoapL46X/4OhaQhWRnOb/6FfcUE2/g+4ZkscFOIthx8bK9cdQSIrVVjGZaBpqOVzUANNhlhjfVu/elvjbhuENXQqdDW1pxQqCSGQgPjbSly/6cvI1vVQnHPgfCZMFhPdhUoyFaou53L/7VxqTbp1cnKuAG1EOuVGXnrbWXRJQferiE9ugGyGEQsQQzSLGjQieCUJrLcID+jjAxeRlysUA6fRFjSksQX05F4E+FJ+naWd5CiFLSQWyiaMCgWF050xtGj3uDYVFOrvyZAH8zmg==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 21:52:19 -0400
Message-Id: <DJTNXVOWGWJ4.3MDNLPMY0Y3RF@nvidia.com>
Subject: Re: [PATCH 10/13] mm/vma: convert miscellaneous uses of VMA flags
 in core mm
Cc: <akpm@linux-foundation.org>, <tsbogend@alpha.franken.de>,
 <maddy@linux.ibm.com>, <mpe@ellerman.id.au>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <l.stach@pengutronix.de>, <inki.dae@samsung.com>, <sw0312.kim@samsung.com>,
 <kyungmin.park@samsung.com>, <krzk@kernel.org>, <peter.griffin@linaro.org>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <tursulin@ursulin.net>,
 <robin.clark@oss.qualcomm.com>, <lumag@kernel.org>, <lyude@redhat.com>,
 <dakr@kernel.org>, <tomi.valkeinen@ideasonboard.com>, <hjc@rock-chips.com>,
 <heiko@sntech.de>, <andy.yan@rock-chips.com>, <thierry.reding@kernel.org>,
 <mperttunen@nvidia.com>, <jonathanh@nvidia.com>, <kraxel@redhat.com>,
 <dmitry.osipenko@collabora.com>, <zack.rusin@broadcom.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <oleksandr_andrushchenko@epam.com>, <deller@gmx.de>, <bcrl@kvack.org>,
 <viro@zeniv.linux.org.uk>, <brauner@kernel.org>, <muchun.song@linux.dev>,
 <osalvador@suse.de>, <david@kernel.org>, <baolin.wang@linux.alibaba.com>,
 <liam@infradead.org>, <npache@redhat.com>, <ryan.roberts@arm.com>,
 <dev.jain@arm.com>, <baohua@kernel.org>, <hughd@google.com>,
 <vbabka@kernel.org>, <rppt@kernel.org>, <surenb@google.com>,
 <mhocko@suse.com>, <jannh@google.com>, <pfalcato@suse.de>,
 <kees@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <dri-devel@lists.freedesktop.org>,
 <etnaviv@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-rockchip@lists.infradead.org>,
 <linux-tegra@vger.kernel.org>, <virtualization@lists.linux.dev>,
 <intel-xe@lists.freedesktop.org>, <xen-devel@lists.xenproject.org>,
 <linux-fbdev@vger.kernel.org>, <linux-aio@kvack.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-sound@vger.kernel.org>
To: "Lorenzo Stoakes" <ljs@kernel.org>, "Lance Yang" <lance.yang@linux.dev>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.21.0
References: <1e7d834c887b6a65627d730addcff13d458c6268.1782760670.git.ljs@kernel.org> <20260702131233.59026-1-lance.yang@linux.dev> <akaGxiTaJreEQn8T@lucifer>
In-Reply-To: <akaGxiTaJreEQn8T@lucifer>
X-ClientProxiedBy: YQZPR01CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::13) To DS7PR12MB8371.namprd12.prod.outlook.com
 (2603:10b6:8:e9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB8371:EE_|DM6PR12MB4154:EE_
X-MS-Office365-Filtering-Correlation-Id: bacc7942-656d-4181-e20f-08dedd5cb91a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Yd28dTy/xN9ySMyhg2uIQeY4gQAgrUnJObMIVS22bJ5VRzmoeTnNAj3462cN98HdiG2seYtR7K5OFXMblYfILyPUu/uCu/Rz7HRmbjk9gtGiEnH5qLj4BjMy4LshOkUGUl61yUNpm1dEB/vj9L35x+JcFqqOS01ylTSeSKtR9hcQHUciu3LED5xX8q7gGNbPCoVYQ1iSmJ8Vxn5xJknM6/iZWiVa+4m0F3PivDqGaU6996tnxowWFJIEAU7FdI7QqWNSIPu6de93Ych0CU6wtWi7ewgtxYm0StXUbcIA772VPhrPyXntIIn/CVND2yXt1dqOwQMGoh9Ey3mVFAEEk/S9+bqVcAYkeU4Y4LdYplZqQVDWwL7wh7NrKr6irfH0NOAVXZEqngQ34zv9OBUq5i+xRWaZVPKmWzFtc9AUZ/uE/KNVv0rL/u9rEPCf8r2viLdLX5XNG7Yd42dPn0h29jLtXpbJTeIO8FizYjpgteCBdo6h/ztWPT8koa43b3xU1TS1GUS9DdjBsXvjnkZqUmm1nIwv+Pp3vwWRZkFs3x19WsnrLwsi2bjmBVQ3pqMDnPDl36l40CU01hRUo0UkwUhuDjhh4hY1BHpF1RRR25+J0ov3CWhYB7WugenvDcU1SRxPz+rlFkz8auNamE3mow==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB8371.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THNNeExvMFhubllkUE9NcTIya3haaHpIRDVleXp2c0FTMVprU3psTzAzWmFk?=
 =?utf-8?B?WnlzQWFEVFNGT09sUFBlMGViVGZZbWxHdlQvT0xYTnI1c2dHMzd0QVY2T1Nw?=
 =?utf-8?B?Ylhudms2YWhVN0lpZ3JNc2dLWnNyWUFqb0F6TnkvWGlubENMRk1oRGVzeisw?=
 =?utf-8?B?MnZBMnBkRWVIaExuUHJLR1Q1OG03STQ2eG9GbVN0SW1RallPa05hK283a0Ir?=
 =?utf-8?B?MlpoaytmZGpYWmRhTkpKb1UrQ1E4TGk2OUVuNkNmSGx4Q2FjMmdtUUZsQi8z?=
 =?utf-8?B?b0hjMTFndmN1bWUyVGo2eGs5TVFzeTV5YnhEZGVLQk91Y1VUM2h5YTVwRjdX?=
 =?utf-8?B?WGJkYlVwbjdLaTZJSjVEZm9VWXpYY1cvOXFOK2pDZGlOZitXOVlXK241RkJt?=
 =?utf-8?B?UEhsY2lCYzIrQXIyUTVMZDFBc0l5S1dOOEdYeDRWYzV4WnRCR2xFWXJlaEdM?=
 =?utf-8?B?UlFpTGpsTnR3SUpRb1pyVnI5U2s2QkthSDI2RW9uZzAvN3MyMk5BWWR1RzBh?=
 =?utf-8?B?VWQ3R3YzTVV4NDI0UVlNZzVwS1NjTVJ6dGtybW11OGlWTW5WcVY5ZlBNSjhz?=
 =?utf-8?B?RTA5U05kdHlTQjFMVEpqRENBS1Fmc0lQS1BROGI4MUFBNUZpYTBmVzdkMU9S?=
 =?utf-8?B?VStLaVpycVJPbGxxRE45dFNKNHgzRU1hZG1Ud0FLTlZYUDJLcFZDMWlKc0Zp?=
 =?utf-8?B?eVZhOG85MDQvM1B6YUIxR0pTZStVZmFOWm91cDZuNGRsMlI2cUxzTjVOajJj?=
 =?utf-8?B?WEYvQ2NZUy9PU29zWjQ4MUMyMlNGblZjUFZXTnhPN2dpMjM3WUMxVXowb3VJ?=
 =?utf-8?B?M1B1MVpBZmxoSWVKY3JFeEFETG83ZW1yaTRQZVdPR3h4VTBPUm5tOXA2RGVi?=
 =?utf-8?B?QThXZmZuK3l3NXpCL3dLeGs1a1Q5YnR4QnRETXltRVNCOG44QVdJOFEyb24z?=
 =?utf-8?B?OGNXYnUvYWVMWGtvcVRHa29CVDMrWlhLYm91a281M3JWZURvT3pjQkpmWGUw?=
 =?utf-8?B?ei9ENHd2dDEwQUNabWNxTlVNa0xoaWdTU1AxV2FuL3hsaHdrL21RZTZXU09l?=
 =?utf-8?B?MHYwbnl0b0Iyd1BibG0xMm4zVXdjdVRDOG15NmppMzY3bVpSbWYwa1lRWDhs?=
 =?utf-8?B?V1J6UGdQMi9yNlZxaXBnOG1iVS8xTGVSc3JnRExxc1krLzBPUGg0cm1PbmR5?=
 =?utf-8?B?S3hBSUI5TzBXOTVveU5UaDd5Q3Ard1R4SEt3UkkySG83NmxveEF1eTJ5Nkda?=
 =?utf-8?B?Y2RBekRnZ0JNMXR2aU1SK2ZOVUE5RFJPWDUxSHFNTUZhTjBHT2dFR3lyZTNi?=
 =?utf-8?B?S0NPNE9FNk1IRWJWQWNrL1ZlZXllTGplazdRTjhZMHdRL3JpSXpYZDRhRks0?=
 =?utf-8?B?OGk4MUt3OFhHQklSSlJuWmM0bDRRc0dEMEZ2enIvYUZXOEJMUlNyZjF6aTFi?=
 =?utf-8?B?NlJUZ29oaUJ1a21wZVBVbXNhM0ZabUxCRm1xVnNXT1dnWXM0NnVBbk1qaVpN?=
 =?utf-8?B?bXFTZUQwNFhFWG9naUx2T2dyVWc1bXdVYVFsQzcvN1N4bXlBeWErR0Ryb2Yx?=
 =?utf-8?B?bmVMV1hHa0d3L3Jja3lRZ1lyamtlVjNOc3d6YjdDMEI1aFNwNm9UYkM5TWcz?=
 =?utf-8?B?SnllbEdSbGF1ZDB5Uyswb09Zd25JT1lZT3hwcXczZmdxbXQzUUpNL3N5aUNF?=
 =?utf-8?B?SzI4Nmk1eGRxS2dPbVNNeW5rMWhrMWh2VWhkTEJmYUVUcDlkQ3Y4UkxwOWdo?=
 =?utf-8?B?UjZoeHhLVGVDc0ZxTk12VWdCNUhWVjJGeE9JdUVyeFlsVTI5TGViSE5MSjlZ?=
 =?utf-8?B?b29jRVhwSkxKOW9SeFFJVlllRFFDbEZZQ1FyZ1NXUElEWURPS3l3djRPMGNF?=
 =?utf-8?B?THVXRUhRemx0aTlSRjhKZUJ0czF2QXRpRVpvY1RGcTBFdWlsdjMxYThiNmdS?=
 =?utf-8?B?QTV4KzJ3dkM2bmIrTXJnSEw5UE93bTFTSnNydStoRGkvMHNoQm04ekVGMFo3?=
 =?utf-8?B?ejlxemd0Slg2OFhuVnc2YTk3R0FYK25BWGphTzdPOVpFOTluaVpYTS9ZZmJW?=
 =?utf-8?B?VytmcDVkamJGMXg0cXBOckZoMzM1SFhxSk0xWWVHMzJWR21obkhtTXdjL0VF?=
 =?utf-8?B?eWMvZUNzTTRkNWo3NjVBbmxLRjc1anhPeERYUUQ4eDZTcFdac2dWTzUrVHZ1?=
 =?utf-8?B?djFxZmFVZTZMR0VTbll2eHdvRjJ2blo2K3BOeW1UVWxrb0lHbEZwMEFZUW9p?=
 =?utf-8?B?NU8yQlBJMndyZWp0bUU2dVhSVWFEMHVMSEl3VDZuVkp1blgxTXppOVAzbWxV?=
 =?utf-8?Q?QcZDKeihkt77hc+27P?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bacc7942-656d-4181-e20f-08dedd5cb91a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB8371.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 01:52:24.7416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6w7qvqU9Xvfq3rnPOcHPBkvnO4m2Fn3xJjwiOL8S5RfEjHG8pIPBVGzUoy7hQIy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4154
X-purgate-ID: tlsNG-d62444/1783561960-FE0DC1E0-B4AE4DBD/0/0
X-purgate-type: clean
X-purgate-size: 3065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-9.19 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,alpha.franken.de,linux.ibm.com,ellerman.id.au,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,redhat.com,ideasonboard.com,rock-chips.com,sntech.de,nvidia.com,collabora.com,broadcom.com,epam.com,gmx.de,kvack.org,zeniv.linux.org.uk,linux.dev,linux.alibaba.com,infradead.org,arm.com,google.com,suse.com,perex.cz,vger.kernel.org,lists.ozlabs.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:tsbogend@alpha.franken.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:l.stach@pengutronix.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:lyude@redhat.com,m:dakr@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:zack.rusin@broadcom.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:oleksandr_andrushchenko@epam.com,m:deller@gmx.de,m:bcrl@kvack.org,m:viro@zeniv.linux.org.uk,m:bra
 uner@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:baolin.wang@linux.alibaba.com,m:liam@infradead.org,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:hughd@google.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:kees@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:dri-devel@lists.freedesktop.org,m:etnaviv@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-rockchip@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:xen-devel@lists.xenproject.org,m:linux-fbdev@vger.kernel.org,m:linux-aio@kvack.org,m:linux-fsdevel
 @vger.kernel.org,m:linux-mm@kvack.org,m:linux-sound@vger.kernel.org,m:ljs@kernel.org,m:lance.yang@linux.dev,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[ziy@nvidia.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:from_mime,nvidia.com:email,nvidia.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ziy@nvidia.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_GT_50(0.00)[82];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7307F72BC66

On Thu Jul 2, 2026 at 11:46 AM EDT, Lorenzo Stoakes wrote:
> On Thu, Jul 02, 2026 at 09:12:33PM +0800, Lance Yang wrote:
>>
>> On Mon, Jun 29, 2026 at 08:25:33PM +0100, Lorenzo Stoakes wrote:
>> >Update various uses of legacy flags in vma.c and mmap.c to the new
>> >vma_flags_t type, updating comments alongside them to be consistent.
>> >
>> >Also update __install_special_mapping() to rearrange things slightly to
>> >accommodate the changes.
>> >
>> >Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
>> >---
>> [...]
>> >diff --git a/mm/vma.c b/mm/vma.c
>> >index b81c05e67a61..ab2ef0f04420 100644
>> >--- a/mm/vma.c
>> >+++ b/mm/vma.c
>> >@@ -3417,23 +3417,27 @@ struct vm_area_struct *__install_special_mappin=
g(
>> > 	vm_flags_t vm_flags, void *priv,
>> > 	const struct vm_operations_struct *ops)
>> > {
>> >-	int ret;
>> >+	vma_flags_t vma_flags =3D legacy_to_vma_flags(vm_flags);
>> > 	struct vm_area_struct *vma;
>> >+	int ret;
>> >
>> > 	vma =3D vm_area_alloc(mm);
>> >-	if (unlikely(vma =3D=3D NULL))
>> >+	if (unlikely(!vma))
>> > 		return ERR_PTR(-ENOMEM);
>> >
>> >-	vma_set_range(vma, addr, addr + len, 0);
>> >-	vm_flags |=3D vma_flags_to_legacy(mm->def_vma_flags) | VM_DONTEXPAND;
>> >+	vma_flags_set_mask(&vma_flags, mm->def_vma_flags);
>> >+	vma_flags_set(&vma_flags, VMA_DONTEXPAND_BIT);
>> > 	if (pgtable_supports_soft_dirty())
>> >-		vm_flags |=3D VM_SOFTDIRTY;
>> >-	vm_flags_init(vma, vm_flags & ~VM_LOCKED_MASK);
>> >+		vma_flags_set(&vma_flags, VMA_SOFTDIRTY_BIT);
>> >+	vma_flags_clear_mask(&vma_flags, VMA_LOCKED_MASK);
>> >+	vma->flags =3D vma_flags;
>>
>> Maybe worth a vma_flags_init() helper here to mirror vm_flags_init()?
>> With this open-coded, we lose the soft-dirty WARN_ON_ONCE sanity check.
>>
>> Might be nicer to keep that check in one place ;)
>
> I really hate all the VMA flag accessors, they conflate things horribly -=
 we
> should be explicitly taking VMA write locks when we need to (and often ki=
llable
> ones actually) not assuming that a VMA flags accessor does (they should a=
t most
> assert).
>
> This case is even more terribly egregious - you are setting flags at an
> arbitrary time, why are we asserting something about softdirty?
>
> You may update them as part of initialisation, maybe not. It's far from a
> guarantee and feels like a lazy place to put it.
>
> BUT obviously it's an oversight not to open code that here, so I'll updat=
e the
> patch to do that!

What do you want to open code here? softdirty WARN_ON_ONCE()?

vma_flags gets VMA_SOFTDIRTY_BIT just above vma->flags, why do we need a
check after that?

BTW, if you think the check is needed, patch 9 will need to be updated,
since the same pattern appears in create_init_stack_vma().

>
> I want VMA flags to be a clean stateless thing, other than the flags
> themselves. Implicit, unrelated, asserts or lock acquisitions in general =
should
> be done separately IMO.
>

Anyway,

Reviewed-by: Zi Yan <ziy@nvidia.com>

--=20
Best Regards,
Yan, Zi



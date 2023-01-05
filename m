Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CCF65F0C5
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 17:05:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472023.732122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSjr-0004hN-28; Thu, 05 Jan 2023 16:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472023.732122; Thu, 05 Jan 2023 16:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSjq-0004dw-Um; Thu, 05 Jan 2023 16:05:06 +0000
Received: by outflank-mailman (input) for mailman id 472023;
 Thu, 05 Jan 2023 16:05:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDSjp-00043x-Qx
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 16:05:06 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2074.outbound.protection.outlook.com [40.107.241.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6f04905-8d12-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 17:05:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB8046.eurprd04.prod.outlook.com (2603:10a6:102:ba::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 16:05:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 16:05:02 +0000
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
X-Inumbo-ID: b6f04905-8d12-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=duAJiTua+JHJcndxBJVume4ofnWTeM8JJbVBTrJj0HJGQa/ojDD0MvZdj+FXNKMBWIG/2JMhmlMJYajPd4PuvDS0NYByn6mcVdmlfXMklo6p7d1OUcrVPJXI85wJcO3zYChCcpdOYY3D0POhf1lJu8yjApZTHBJ6bXh5NJAAqbTgKYRJ05bI93tQhgiy0rYQMRNUClAs2Ax9lylKHvVVeadJMjd1cZlP0lbFaIMKor9GmrHn/yWVYUNFzumU90OZuizDt1ezZZwcqQJo9Ywc68sVU2No1UDRSdfq33swMHAeQ8iHwSBQYJdNr1yr+Q3w2SUYZP1RKgRsdYf1PV8fkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qf+emyh5II2V0/A5S4zzJusw1CCXBsG+DAb5LICmZYA=;
 b=IUvndegZT73HSgQRKLGacBhYnCgufztfBzZeZA2Fuhoj0G++tNuPEDDWSgtvdWGwDMqO6bhBrqM6LMvpQn4gX6EVyouMOnbqqFU+NZiakbI2DEjTWcJQ8EfaB26r3JjlO3SFKMj0n9jXPaGW1HztLCHt7q5LxYsbw5zMysG+DbAd/OeSHFw2ch4V5x8N5r90eTLaRo6q8a6P6AsFFAr3mqAjwyrXoXcIS8LnoaLsjniEVwbjdNimWKVzcrHPm6OVZVoUa9z4P6l5/Yjbkup9Y+HvmKenEyeCCjL41vc2RiWvnsqwMJ74FIdovv/b2kpN7+B4klET8d660rPvMHCNdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qf+emyh5II2V0/A5S4zzJusw1CCXBsG+DAb5LICmZYA=;
 b=vJJFZfrdRCISbegw2kzc9xX5Sdv/+Jj1Ys3IOalhX19F598fMDsJmIBwRW6Kh8rTeDzfC9zKlTFjVJIEczguch81bfG92zOD7GP4cEIvMNz+HKeyE9YsQ0ZoF/3yL/HIDpQdO7bcLwqs6zV3Q1EtzqxGyK/11OaT/w/iq4GDx7DTvOxxjkf4K0yTG57//wCX8h7ANNu+59U2tqbPG/PcXI8/H5oSJq4Ur1l1rSz1U9ePpW76J+K2BdtuFtinF3EmnrqcFdMOYGDfaaK3+ntPZkC6yHGfPt1Qm8FuKqi7Tb7KBb4+cHQGsDEmKOQwOWbZgGouA+BlGkZhqC5QgQHtLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2743393d-852d-b385-9eba-e22806b1c4af@suse.com>
Date: Thu, 5 Jan 2023 17:05:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 07/11] x86/shadow: L2H shadow type is PV32-only
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
In-Reply-To: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: f543001e-0cbd-41fc-a49d-08daef369a0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8t3hWtPV3+fLpGRwWuwYnggj1sjtO2C3j2+B9m6JD5BrgbHsCww3hExqYXv+QbV8m1AfWwvvaVUAmVpqvFkdJ62ZnjhMRpis7Fxnz121J5hWYSicvIA2Kn6cea0gKN9fUrVD6ZdanPO41E85dGjuIuG62oWTwdXICtS781UwCewduKaKROmBFY/i7t0xKhcQVkaO4wndeFjoYx22lJtsJVpO97AHTK7PMyu8dp6K7co2nnPnJ7dP+yk0svMvD/hZmJUHCh88+Lb3oyMzkclni/hzG3vpsopV6i6Y77E4ncKpRt0KJ4U/blDn8hoO1DfuY3ENRP6X7KNZm9KiVY7Aop4I4/VQvXFyZ/jgk1LNyAxw3qmgK+zMz1yeCYZcskwmTc7D0pECw4QmEWxDwxW6EuvfS3mpRM9z6XQsYOET7RYJEv+AF2y2G88FABcDaYzi/ot26ZTwYRgphCcrUGHo1C42DyQFq6fnsXmCYKKpT0iY2akGrtyP7WxY3uZNHJfSuXFDyDxI8bguExmWZin9/EG2LCz9nBgsSsTAE72gCyin1PJ4VfSb2GqpHqQj7MW4/eZGDNGdtSxcmUJQofi8+7e37lzufMQ4Ijwzh+1qr0pYbarri0vxiJBh2l8bRKI8ABXVDpY6Q49EcBvXoxbf+wWCnNtMhpdRNPOEo2DIvrn21y9/GezNM4K+nkevUezUwVloXSSfQzNZwgu1/zrSLRPXL0y/q5kS27ppQvWnzeg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(396003)(346002)(366004)(39860400002)(451199015)(38100700002)(6506007)(316002)(83380400001)(31696002)(4326008)(86362001)(66476007)(66946007)(5660300002)(8676002)(2906002)(66556008)(41300700001)(8936002)(6512007)(26005)(186003)(2616005)(6916009)(54906003)(478600001)(6486002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1hVeUlNRlZLY2N5QWtHSllXV2Z1YWtVb1VYajJpN1lqSFh2b0p1V3VrdHcv?=
 =?utf-8?B?MHkvelkzRnV0RUFtR0w0d2pxdFdKU1lZckFEMldYWDVkV2hBZTNDM0JVTGJl?=
 =?utf-8?B?YTJJTnhZVmxtbldYdXdTR3pqaW5xVW5PTlFXS1lnbnVkRjRqbXc2TzZCZWkw?=
 =?utf-8?B?YTR3bEhuYVlzK0MwUGNSd1YxTE83YXZCS1FYSW1ISWpEVktSa0wvdlk1eStF?=
 =?utf-8?B?U0RyWW9ycGZLbXhKYlNWWnA1d015M0pidzdZcnphWnpnMHgxcXMxN3V2WUIy?=
 =?utf-8?B?RlJHZitTWWVJTVF5Y0pnVVpNZUJJc0VFNUZsZjhBSWNHMXNDdzhscWtxREZr?=
 =?utf-8?B?QnEvd2pMVnJYZGs2RjRCV0ZQT3c2VFUyQlVmNG5sODlmUEhYYTFYajlOUjg1?=
 =?utf-8?B?TUp4NDB0aUQyU1hxYi82WU1vUjZmUjV4K1FVSEJUT2o2VDRJd05GTUhSQmlq?=
 =?utf-8?B?K2J4eVJndWlJQmVjdjFIc0NvMysvWkxHM1Y4azV3R2kwYm1CcTV0NWFXcTNX?=
 =?utf-8?B?SndsMWNjVitKYVU1RHlxeTYzWFNZYS9FazdKRC9xWTlzQ2hTdDdXaGZuWElo?=
 =?utf-8?B?LzQyYUdERnYwdUhKZ0c5S0VmdFllV21uQUFrb0U0MzdXeERtVW9Yc0xoUDlX?=
 =?utf-8?B?d1VvZmFTMlFwVzNBZU85Z1lDRHN5RTBMV2VHem81V0FQa0lvNUg0WWxvMW81?=
 =?utf-8?B?OWRMWmJ2Q0dxY0pqKzdDOWtFK0FjaHdMbjZDZDdHSkxGNHBOa1haNVR2T0hu?=
 =?utf-8?B?MFJzNUpMZU1mL2xlU0ltTVJ5ZFJoTWF2bDR1OHBLUVRHMXhXR0l6dVFYM3N4?=
 =?utf-8?B?ZjNhZzN6SWFWV0g2SlhmU2hVZ3pqNGtLOGppcHo4WlNZTFRlTUhodTluc1BE?=
 =?utf-8?B?eG9JOUJ2NHVKcy8zOE50YjdvZ0VPcXZQZ3p4VUs0SnZBM3dzUnpkdUlIQkE4?=
 =?utf-8?B?ejlEdm5BaW5WUEY5V3Jjem9ZTUREQS9KdTJhR3dCYndzQmwveENrZnJ5eWRI?=
 =?utf-8?B?cklkSHhVVXNzdGVFTkxTR1pWdWd6ZldmNDd1ZFE0d3dyWFZnQVFqa1QvNDNk?=
 =?utf-8?B?ZzVNNTB2NW9oaWtFU2tUWUNBa3lQUHJPdTJRbldCNVg2OEFaU1kzSVpHRnd2?=
 =?utf-8?B?b2xKRTBiNGd1VEFTcFNiL0ZBUVhFV1J6c0prek02VElLVlRFdTNSdlExcGly?=
 =?utf-8?B?Q1Qzbm9aaXJuSzRmS2U2SVlEdk9jbjJ2WWtBcXhiZ0lrT2kyV1UxeGUySGJL?=
 =?utf-8?B?SWlVaGhxVFZKZGJhVG5vemp2b1JPRE4yeVdKTkxjbTF5WXlaNXZnMUtRZVFt?=
 =?utf-8?B?a2VHeHl4U3VCSkJzZGFsQ1d0R0tCSlVJVnNqYlNpSGRGNlpwVWZwcUF4aG5L?=
 =?utf-8?B?MGJ4K0wzV3RLTzlieTBIMWNHSy9qM0lrYnBJeS93U2JzUVRackNEWmw4UUJD?=
 =?utf-8?B?c3ZoeXdmaFBGQWpnWlBNdzc4YzJzNzZTVEs5WHRUaFNyVitPOXVCY0lDRWlS?=
 =?utf-8?B?NkFZZ09sanJ6SEFSNWlDMk5KQ0xYM043bTJ4L0ZYQWx3enVYMmxQaHNVOUtH?=
 =?utf-8?B?RG1CeExWU2tDbll6NHZmNzg5WjdNQ2h5U1lOSnc2Z1VTeUxVeS9ZbUtqdHFC?=
 =?utf-8?B?bWl2MjV2UFZIczJnaGZhRWFzTTFFYVdZT1BmN0JSWC9WWDNaeVZSbTArV0I3?=
 =?utf-8?B?UGlHUGFFNmF2TnRrQmkwWWovNVAwZ2VYVUw0aFlIRVpKcng4MzRyWlFJYzA5?=
 =?utf-8?B?THh2RDNWbEd3Wkl3bHlCV1ZDSUwrQ2tDQnRQaEFINFRCbXZLYXNlaDBvSU5k?=
 =?utf-8?B?a2VkNnlMaklDV2xxb21hc002Z3JIOGUyZDhKZHZGQWFOTkZ3R05QYTd3SHFO?=
 =?utf-8?B?c3hMUUM1Nms0R3hxMnVOeXhkYWR3UUdOMWZvTGVzVk5KZ1pSSDNqcEtQR3F2?=
 =?utf-8?B?dmlDVUZ4aDBPemdUcnBYMHNMaDFVNnFSQmxNem9kWXZHbjhnNEVoWEdQZWNy?=
 =?utf-8?B?anlJT05yeWlidG95UlFLNTNCT3Z1bmRBYkc2VG5kaE9HakJ2UVA5Tk1peFo0?=
 =?utf-8?B?VkF3dTNGR0xIWm9aWnFSakc3K3ZQc0E4TkJsS3dKbWtoMnJ5Z3k4dEVnWTJZ?=
 =?utf-8?Q?6MEtkhrrzr9MphC1N+iEEbAZG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f543001e-0cbd-41fc-a49d-08daef369a0e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 16:05:02.0144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTXXaRZjnpb1VjUjcxphjU+lnjhdVmEQ5clxnF6UNL6YPmc5B/0WMfz8baRlbRRyaxVzmpVCJOoyr7DwIaYM4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8046

Like for the various HVM-only types, save a little bit of code by suitably
"masking" this type out when !PV32.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I wasn't really sure whether it would be worthwhile to also update the
"#else" part of shadow_size(). Doing so would be a little tricky, as the
type to return 0 for has no name right now; I'd need to move down the
#undef to allow for that. Thoughts?

In the 4-level variant of SHADOW_FOREACH_L2E() I was heavily inclined to
also pull out of the loop the entire loop invariant part of the
condition (part of which needs touching here anyway). But in the end I
guess this would better be a separate change.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1740,9 +1740,11 @@ void sh_destroy_shadow(struct domain *d,
     case SH_type_fl1_64_shadow:
         SHADOW_INTERNAL_NAME(sh_destroy_l1_shadow, 4)(d, smfn);
         break;
+#ifdef CONFIG_PV32
     case SH_type_l2h_64_shadow:
         ASSERT(is_pv_32bit_domain(d));
         /* Fall through... */
+#endif
     case SH_type_l2_64_shadow:
         SHADOW_INTERNAL_NAME(sh_destroy_l2_shadow, 4)(d, smfn);
         break;
@@ -2099,7 +2101,9 @@ static int sh_remove_shadow_via_pointer(
 #endif
     case SH_type_l1_64_shadow:
     case SH_type_l2_64_shadow:
+#ifdef CONFIG_PV32
     case SH_type_l2h_64_shadow:
+#endif
     case SH_type_l3_64_shadow:
     case SH_type_l4_64_shadow:
         SHADOW_INTERNAL_NAME(sh_clear_shadow_entry, 4)(d, vaddr, pmfn);
@@ -2137,7 +2141,9 @@ void sh_remove_shadows(struct domain *d,
         [SH_type_l2_pae_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 3),
 #endif
         [SH_type_l2_64_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 4),
+#ifdef CONFIG_PV32
         [SH_type_l2h_64_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 4),
+#endif
         [SH_type_l3_64_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l2_shadow, 4),
         [SH_type_l4_64_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l3_shadow, 4),
     };
@@ -2150,7 +2156,9 @@ void sh_remove_shadows(struct domain *d,
 #endif
         [SH_type_l1_64_shadow] = SHF_L2H_64 | SHF_L2_64,
         [SH_type_l2_64_shadow] = SHF_L3_64,
+#ifdef CONFIG_PV32
         [SH_type_l2h_64_shadow] = SHF_L3_64,
+#endif
         [SH_type_l3_64_shadow] = SHF_L4_64,
     };
 
@@ -2214,7 +2222,9 @@ void sh_remove_shadows(struct domain *d,
 #endif
     DO_UNSHADOW(SH_type_l4_64_shadow);
     DO_UNSHADOW(SH_type_l3_64_shadow);
+#ifdef CONFIG_PV32
     DO_UNSHADOW(SH_type_l2h_64_shadow);
+#endif
     DO_UNSHADOW(SH_type_l2_64_shadow);
     DO_UNSHADOW(SH_type_l1_64_shadow);
 
@@ -3179,7 +3189,9 @@ void shadow_audit_tables(struct vcpu *v)
         [SH_type_l1_64_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l1_table, 4),
         [SH_type_fl1_64_shadow] = SHADOW_INTERNAL_NAME(sh_audit_fl1_table, 4),
         [SH_type_l2_64_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l2_table, 4),
+# ifdef CONFIG_PV32
         [SH_type_l2h_64_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l2_table, 4),
+# endif
         [SH_type_l3_64_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l3_table, 4),
         [SH_type_l4_64_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l4_table, 4),
 #endif
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -56,7 +56,6 @@ const uint8_t sh_type_to_size[] = {
     [SH_type_l1_64_shadow]   = 1,
     [SH_type_fl1_64_shadow]  = 1,
     [SH_type_l2_64_shadow]   = 1,
-    [SH_type_l2h_64_shadow]  = 1,
     [SH_type_l3_64_shadow]   = 1,
     [SH_type_l4_64_shadow]   = 1,
     [SH_type_p2m_table]      = 1,
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -97,6 +97,13 @@ static void sh_flush_local(const struct
     flush_local(guest_flush_tlb_flags(d));
 }
 
+#if GUEST_PAGING_LEVELS >= 4 && defined(CONFIG_PV32)
+#define ASSERT_VALID_L2(t) \
+    ASSERT((t) == SH_type_l2_shadow || (t) == SH_type_l2h_shadow)
+#else
+#define ASSERT_VALID_L2(t) ASSERT((t) == SH_type_l2_shadow)
+#endif
+
 /**************************************************************************/
 /* Hash table mapping from guest pagetables to shadows
  *
@@ -337,7 +344,7 @@ static void sh_audit_gw(struct vcpu *v,
         if ( mfn_valid((smfn = get_shadow_status(d, gw->l2mfn,
                                                  SH_type_l2_shadow))) )
             sh_audit_l2_table(d, smfn, INVALID_MFN);
-#if GUEST_PAGING_LEVELS >= 4 /* 32-bit PV only */
+#if GUEST_PAGING_LEVELS >= 4 && defined(CONFIG_PV32)
         if ( mfn_valid((smfn = get_shadow_status(d, gw->l2mfn,
                                                  SH_type_l2h_shadow))) )
             sh_audit_l2_table(d, smfn, INVALID_MFN);
@@ -859,13 +866,12 @@ do {
     int _i;                                                                 \
     int _xen = !shadow_mode_external(_dom);                                 \
     shadow_l2e_t *_sp = map_domain_page((_sl2mfn));                         \
-    ASSERT(mfn_to_page(_sl2mfn)->u.sh.type == SH_type_l2_64_shadow ||\
-           mfn_to_page(_sl2mfn)->u.sh.type == SH_type_l2h_64_shadow);\
+    ASSERT_VALID_L2(mfn_to_page(_sl2mfn)->u.sh.type);                       \
     for ( _i = 0; _i < SHADOW_L2_PAGETABLE_ENTRIES; _i++ )                  \
     {                                                                       \
         if ( (!(_xen))                                                      \
              || !is_pv_32bit_domain(_dom)                                   \
-             || mfn_to_page(_sl2mfn)->u.sh.type != SH_type_l2h_64_shadow    \
+             || mfn_to_page(_sl2mfn)->u.sh.type == SH_type_l2_64_shadow     \
              || (_i < COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(_dom)) )           \
         {                                                                   \
             (_sl2e) = _sp + _i;                                             \
@@ -992,6 +998,7 @@ sh_make_shadow(struct vcpu *v, mfn_t gmf
         }
         break;
 
+#ifdef CONFIG_PV32
         case SH_type_l2h_shadow:
             BUILD_BUG_ON(sizeof(l2_pgentry_t) != sizeof(shadow_l2e_t));
             if ( is_pv_32bit_domain(d) )
@@ -1002,6 +1009,8 @@ sh_make_shadow(struct vcpu *v, mfn_t gmf
                 unmap_domain_page(l2t);
             }
             break;
+#endif
+
         default: /* Do nothing */ break;
         }
     }
@@ -1123,11 +1132,13 @@ static shadow_l2e_t * shadow_get_and_cre
         shadow_l3e_t new_sl3e;
         unsigned int t = SH_type_l2_shadow;
 
+#ifdef CONFIG_PV32
         /* Tag compat L2 containing hypervisor (m2p) mappings */
         if ( is_pv_32bit_domain(d) &&
              guest_l4_table_offset(gw->va) == 0 &&
              guest_l3_table_offset(gw->va) == 3 )
             t = SH_type_l2h_shadow;
+#endif
 
         /* No l2 shadow installed: find and install it. */
         *sl2mfn = get_shadow_status(d, gw->l2mfn, t);
@@ -1337,11 +1348,7 @@ void sh_destroy_l2_shadow(struct domain
 
     SHADOW_DEBUG(DESTROY_SHADOW, "%"PRI_mfn"\n", mfn_x(smfn));
 
-#if GUEST_PAGING_LEVELS >= 4
-    ASSERT(t == SH_type_l2_shadow || t == SH_type_l2h_shadow);
-#else
-    ASSERT(t == SH_type_l2_shadow);
-#endif
+    ASSERT_VALID_L2(t);
     ASSERT(sp->u.sh.head);
 
     /* Record that the guest page isn't shadowed any more (in this type) */
@@ -1865,7 +1872,7 @@ int
 sh_map_and_validate_gl2he(struct vcpu *v, mfn_t gl2mfn,
                            void *new_gl2p, u32 size)
 {
-#if GUEST_PAGING_LEVELS >= 4
+#if GUEST_PAGING_LEVELS >= 4 && defined(CONFIG_PV32)
     return sh_map_and_validate(v, gl2mfn, new_gl2p, size,
                                 SH_type_l2h_shadow,
                                 shadow_l2_index,
@@ -3674,7 +3681,7 @@ void sh_clear_shadow_entry(struct domain
         shadow_set_l1e(d, ep, shadow_l1e_empty(), p2m_invalid, smfn);
         break;
     case SH_type_l2_shadow:
-#if GUEST_PAGING_LEVELS >= 4
+#if GUEST_PAGING_LEVELS >= 4 && defined(CONFIG_PV32)
     case SH_type_l2h_shadow:
 #endif
         shadow_set_l2e(d, ep, shadow_l2e_empty(), smfn);
@@ -4124,14 +4131,16 @@ int cf_check sh_audit_l3_table(struct do
 
         if ( SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES_MFNS )
         {
+            unsigned int t = SH_type_l2_shadow;
+
             gfn = guest_l3e_get_gfn(*gl3e);
             mfn = shadow_l3e_get_mfn(*sl3e);
-            gmfn = get_shadow_status(d, get_gfn_query_unlocked(
-                                        d, gfn_x(gfn), &p2mt),
-                                     (is_pv_32bit_domain(d) &&
-                                      guest_index(gl3e) == 3)
-                                     ? SH_type_l2h_shadow
-                                     : SH_type_l2_shadow);
+#ifdef CONFIG_PV32
+            if ( guest_index(gl3e) == 3 && is_pv_32bit_domain(d) )
+                t = SH_type_l2h_shadow;
+#endif
+            gmfn = get_shadow_status(
+                       d, get_gfn_query_unlocked(d, gfn_x(gfn), &p2mt), t);
             if ( !mfn_eq(gmfn, mfn) )
                 AUDIT_FAIL(3, "bad translation: gfn %" SH_PRI_gfn
                            " --> %" PRI_mfn " != mfn %" PRI_mfn,
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -209,6 +209,10 @@ extern void shadow_audit_tables(struct v
 #define SH_type_unused        10U
 #endif
 
+#ifndef CONFIG_PV32 /* Unused (but uglier to #ifdef above): */
+#undef SH_type_l2h_64_shadow
+#endif
+
 /*
  * What counts as a pinnable shadow?
  */
@@ -286,7 +290,11 @@ static inline void sh_terminate_list(str
 #define SHF_L1_64   (1u << SH_type_l1_64_shadow)
 #define SHF_FL1_64  (1u << SH_type_fl1_64_shadow)
 #define SHF_L2_64   (1u << SH_type_l2_64_shadow)
+#ifdef CONFIG_PV32
 #define SHF_L2H_64  (1u << SH_type_l2h_64_shadow)
+#else
+#define SHF_L2H_64  0
+#endif
 #define SHF_L3_64   (1u << SH_type_l3_64_shadow)
 #define SHF_L4_64   (1u << SH_type_l4_64_shadow)
 



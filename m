Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4A8582A1B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 18:00:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376316.609009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGjSK-0000S0-Nq; Wed, 27 Jul 2022 16:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376316.609009; Wed, 27 Jul 2022 16:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGjSK-0000Lj-Gg; Wed, 27 Jul 2022 16:00:16 +0000
Received: by outflank-mailman (input) for mailman id 376316;
 Wed, 27 Jul 2022 16:00:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGjSI-0000JP-BU
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 16:00:14 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80049.outbound.protection.outlook.com [40.107.8.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32b20bac-0dc5-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 18:00:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7694.eurprd04.prod.outlook.com (2603:10a6:102:e7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Wed, 27 Jul
 2022 16:00:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 16:00:11 +0000
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
X-Inumbo-ID: 32b20bac-0dc5-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0fvM9kHDGc1X4J1iLxhgJNIL7jV9+I3F47+m6SWR0/TXr564JScnCjr+6nJXzkZ578gedbdF67kqD1RGHiL90u2DQEW5KMunvANIR6diDzqnlUWMa2ghHQMAt8Vn9DFOsVw4TcSHtiI0Ux8IzFGG4O6JlujMPYawHWePnobxlEDJ+kTeWfwxLFuBmTawEbHnE+RjH3JFeGbVD+FTGH/2Solq27nRI12rm4tvDw9mvShc6yWcMVSwOvR2dHle/KlkkG5h+xlAJ4nbtvDc5fj6ns4MI5VnCdb7z3eLvTRX36Sk3r9o1VcDkUjPPQLtbgIvAFwwT/BcIPFgBLctqZsLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KiKQ2q0lgHbyBHN7HUm074QjCFaoPiIZWv42M+fpFog=;
 b=QoYBePyMYhPnwVzGZEUWusbfRO5RjDcKGDLXPMU/pT1VX64QfR7OcSU4fK/zExxHD3svMzBfFBz0E1sSidWttxSmcSCTqUFre0VB7CrYFhQJVuuoteJLbMAndAxhtZDbmi2HjrTnSzlpJzuVTGdKp/zLY4IclVYwlWp47taYv7LvEs9+7oyA6dWVOUrLV9iHyVYH/14lZ8PSQ9hNxIQ+3qxPMXTznFyRB+6qqyT9rD16S9dVyMmQfV4h7HzEvaMosiFLfhxfaNN2oedywpWJ8OD2wWRvAXE16dapJZHmXAKqM2qbdZUsGR3KPDoSX/V9viK6qNNDBsXOk/2mH3tY0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiKQ2q0lgHbyBHN7HUm074QjCFaoPiIZWv42M+fpFog=;
 b=wyTMgI7Li2BBf1wggs/MpIMoJK4eTCfciJDpMA7fF1aU2Df113Pw/GbXUjHbImzockkfJrYKSJyo/6/zHNXsNxyZuP2QU9gHTAvuwgGkuSuYabg5ubICQKVYXxlaiCKgOl4svxft/V/25WRESyAqk65LKEkSLpr9yFY27Ga2R3uto4Z5GaaIRHXFC8JKq5G2J//RJ6NZWGDT5lpAGFw6TyYlU+kR2XVUAc+0LDRPHC9T8wGn42wA6QUJdzF6ipy/E1hQnGZloZOloKsGVIZWCfSgkQ8PiX1jUKmgXySFo11vmTFRPkdKYeYYYVrvHLC32o7aOzvewfNsKKE+RPS74w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cc65eb5f-310e-b51b-71c6-17b93cbe7d0d@suse.com>
Date: Wed, 27 Jul 2022 18:00:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: rework hypercall argument count table instantiation &
 use
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad7abee2-81b1-4466-612b-08da6fe915f4
X-MS-TrafficTypeDiagnostic: PA4PR04MB7694:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IfQO6NcmpFvOV13y66tQRRWLG3ej1vaDP2azbzP+wZz9sRvoykdV6z08KBqudvSY3WWPAGM7lbz82n+Vk8/jwve9lyom6nIzhi2Lzg83vRLTgaOt0QlVtzAappnql0W27Wa2uSMDeFIXp0lca15ZdKeLI5nSW6OeHpkf+SEcNfl5hpplWi2DZ7yZeJcj3ENOQwebwGZt11/bwKlOVgJjFWtXcPVqwAjJ/HuZigwzcMVQipjy4hwnQ8n5XbfZt1xFXlIbOcHQ4kyyVddRo5NEIntQSjLmUm9vWF5ly5EDgdUXg9JOKsDOWrXV6ie65UXfI1wzlrbW0cXarIKn2qmYcHdFh4k6ruutewAEZkhI2lyoIpfpE3b/9G5S/cYwMcSPHW1bluUn0lxTBfQY1T74ZNK9OZRS5mtZ2DXmQUqPsvJrbsIEVsunRGwpGvlY00w/dNLirlmCwPYbWTVseT5eUWG9ofestGI2kpT36o71FxlgU8sT4FPl1T5Kh/Afav+HCUlZVFJiV61gGsCoa9C4+tVG64iv+GF0LmtmCKnjKO2WdNch5P6oqi3uoL6p+G9VgQV8uecQEdXPPD5To/SmSC/jfPu2VJ5od2Uepy9gTjesWCBtpUnyEgIjPyGz8d0Cgw1ZWttcd/PZGCQPq/OvHmjliPIFp/3kxABrI7AtSuLEhESzZSF3dKEo0To3pIHlirZr0/A1nAZidEJf0CqOhh/6aO7djW2WDCN8qIv2O3/RGQg4OxwxneV7yHgHY9uv5s0clAnA6TkO9R/MvwGS291hLWtVSVOZXyUcfOvNMLjmlHn7bEjrrrAbjrpj0DsuWVtDp7OXPIPaWqUsP8sI6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(346002)(376002)(136003)(366004)(107886003)(186003)(83380400001)(38100700002)(2616005)(31686004)(6916009)(316002)(36756003)(54906003)(8676002)(4326008)(66476007)(66556008)(66946007)(26005)(6486002)(6512007)(6506007)(86362001)(8936002)(31696002)(478600001)(5660300002)(41300700001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUxGM1ltY0hsa00wcFVyaGxVRGxzNFRicFB4T1EwNDcyYXZHRTczWWc4MTBC?=
 =?utf-8?B?VTVKYWNSWkNvNVNCZzNjVnY2aElYQkNqWWE2Uy9UYytlUjNwbkt3R0psZC9y?=
 =?utf-8?B?eW1nSDNxTVM4M3JUb1NXR3NiaE9wb3pyeFFjN2FiTkJXSHY3MDZZRUFvdlIy?=
 =?utf-8?B?ZEFTaE1vL1NpdXlucEx5Tk9OVTNOYTgzL3JYS2thSGpBaDN5Q1VJakFFR016?=
 =?utf-8?B?VHBxTER3R1JZMzRZMnNKd1M3UWtUclNxSmh3eHdUNzVoaGkxSEx0SVcwOG5j?=
 =?utf-8?B?ZzRoS0puNGw4TXF1dkxkSXpzUmMrK2Jjem5JbUJHQ3pTQkVCUU8rT1c3L2x0?=
 =?utf-8?B?YVlTS213S2FPbG1ic2ttSi9nZURtN2hZUEY0UlBUQTh4TDlnVklzS21zNVh4?=
 =?utf-8?B?Vmg0Z04vVnUwRFd4VFpJV2x2Y3BOb3k4VjVDTUUwOEk2bmdvdndvdEg3cHNt?=
 =?utf-8?B?Q2lJMXg4eWZvOVhqUzg5Y3dUYmh2V2lYOTc0ZjluNzhPaHJRclltbGhLN3dl?=
 =?utf-8?B?bGN0aGFvOUdVUEhDb1FPV0xiRVdnN3FPUEZNa0xzMzdDbC9kbmxpekM3LzUz?=
 =?utf-8?B?NUUxeVVDemhkUFpZMUFlTXZSeGwzRS9xRW1MWUxYQlptMVl4SmFiZ2tnMzI5?=
 =?utf-8?B?cFgzOENBU2NJb0lDcHJKZitBaEVnbTE1UEp5YXg2c1V6WkJyMWJiTmFkeXF2?=
 =?utf-8?B?elA5UE1hSkVwamdWMHN6NWszWldocUd0RlhaNkFGZ1hieVhlcE1ERWhQOFky?=
 =?utf-8?B?cXcrWnpqb1pEbG1TaUpsKyt1WnhFU0JHUEJ5bFRTcTV4bXBZRWlHa3VPRUx4?=
 =?utf-8?B?bktVaFNYTDlXNDkvMzhZaEticy9uWHRQL0VNa24zd3JqQlprYm9QendldlJB?=
 =?utf-8?B?MkRaanJVS2FURGkwL2tzekJvSUYxZ2JDdXBBVXNzWVROenRGWTNQUThYYjJx?=
 =?utf-8?B?ZHRITDJvaDdCWEVwRFZuakFVMXhNQlBTbm5oZmx4TGpkRERqcUIyd3A1enJJ?=
 =?utf-8?B?b3hMei9NcGZiNG9SWk9IUVpQYnVIK281Q25waWlxU3NNK3VOTnhMeThEWkVX?=
 =?utf-8?B?YnBpeWdzcmx2OUpwckdVQWNOU3dDK1FyY0ZPM2FhODM5UmVpRms4SEhoVk4v?=
 =?utf-8?B?UGFJbWgxNHZwVUFZajUzdjFXSGk2SUpjTWZMenJVdnNTTmZWQmJKZnhtWHQ4?=
 =?utf-8?B?VzFwWWYzc3BpTTRXNUllQXpFd2pQMFVTV0Z3c0NJWEROQ1l6NUczbkxIenpp?=
 =?utf-8?B?VlJXQmVCVWZoT2Z4YlNhS3dFUGcvcU93UmJieVV2dmgrK0l3dkhRc3d4TGlo?=
 =?utf-8?B?MWxsY2liV1VSNlF5bm1QcUdNZjR1em5hSHJDcVAyL0h3VVRNZFVrTElTYVRE?=
 =?utf-8?B?TDJxTHVqbk1yZmxmc3A2c2ZiMWl2NmVGUFRhMitqcy8ySUdZVCtnMllMLzN3?=
 =?utf-8?B?aDlEdXduSm5NOXYzRVp0cjdPZDBvWjlTdmYxZFRJV2NWZHBJMmwvQ3RtcDV3?=
 =?utf-8?B?emhFV2NXbklJV0h6d2xWZGx4ZTVEcUo4NG95TDZ5MnNDV2t5a2FncnBFZFhO?=
 =?utf-8?B?QkpmVHYzVGxreVJpWmFrZGt2V1F5NEMrM2VGVGk2RVRTaTR3OURiNjViWE1M?=
 =?utf-8?B?d1VyUzFnSWY4VEE5SGtvZTNadGVRUHJJOUxpeUdJcXYyeThnbE1EN0VTaWNQ?=
 =?utf-8?B?MW9FR2hOTnFlNGc5QlJ6MThXRlYxY3prRDZ2U0Z0YlZ1T3M2bkFwZjB1Sy93?=
 =?utf-8?B?RTJNSEY2dFpmbHNQaHhpUUpCT1YzOXVnREpSMFJyZHFVQ3lscC9NdGluY0tU?=
 =?utf-8?B?cXgybWtsMEZTa1NCZmVXQ0lmdCtoRkRkRnZjSkhDSmQwenNIS3NlZUpjRDZk?=
 =?utf-8?B?TVRjSGFhZEl4dVFZeStRd3QzNmFUcXBoSG9QdUZaQmdBQ0hxMkJQTGtuMXlL?=
 =?utf-8?B?azBaTmJ6TEM0eVJwSFhwVm5UM0FyVi9KUm1lbTBhTDdGT0Z1TlZWeFJ0aE9a?=
 =?utf-8?B?RFUwbUN3dCtNUitGaHBUOEpXd0djQVUzSU9aeTkyVzFhaWNNb2Ruai9QM1h1?=
 =?utf-8?B?L0p2eDJuWDM5NDYzclpmaTJYcnk0Zm5vVGhHdVlZdW1GdVRmUmVtaThSSnor?=
 =?utf-8?Q?k+qPESH77bMMz+T9F9YqxUHSC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7abee2-81b1-4466-612b-08da6fe915f4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 16:00:11.3840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t8H7RJt95daXUzc193z2q9pElzkSXO4BPt3FySzk5BX4FULjUJA+JpVN2pDCIIOIDfuqlx26r8Q9kd00bJ7+Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7694

The initial observation were duplicate symbols that our checking warns
about. Instead of merely renaming one or both pair(s) of symbols,
reduce #ifdef-ary at the same time by moving the instantiation of the
arrays into macros (a native and a 32-bit one each, where likely more
redundancy could be eliminated, if we really wanted to). While doing the
conversion also stop open-coding array_access_nospec().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
A tentative variant with yet less redundancy (only a single macro
needed) would be

#define clobber_regs(r, n, t, b) ({ \
    static const unsigned char t ## b[] = hypercall_args_ ## t ## b; \
    clobber_regs ## b(r, array_access_nospec(t ## b, n)); \
})

with invocations then being e.g.

    clobber_regs(regs, eax, hvm, 64);

and with the clobber_regs() inline function renamed to clobber_regs64().

--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -111,11 +111,6 @@ long hvm_physdev_op(int cmd, XEN_GUEST_H
         return compat_physdev_op(cmd, arg);
 }
 
-#ifndef NDEBUG
-static const unsigned char hypercall_args_64[] = hypercall_args_hvm64;
-static const unsigned char hypercall_args_32[] = hypercall_args_hvm32;
-#endif
-
 int hvm_hypercall(struct cpu_user_regs *regs)
 {
     struct vcpu *curr = current;
@@ -177,7 +172,7 @@ int hvm_hypercall(struct cpu_user_regs *
                             regs->r10, regs->r8);
 
         if ( !curr->hcall_preempted && regs->rax != -ENOSYS )
-            clobber_regs(regs, get_nargs(hypercall_args_64, eax));
+            clobber_regs(regs, eax, hvm64);
     }
     else
     {
@@ -190,7 +185,7 @@ int hvm_hypercall(struct cpu_user_regs *
         curr->hcall_compat = false;
 
         if ( !curr->hcall_preempted && regs->eax != -ENOSYS )
-            clobber_regs32(regs, get_nargs(hypercall_args_32, eax));
+            clobber_regs32(regs, eax, hvm32);
     }
 
     hvmemul_cache_restore(curr, token);
--- a/xen/arch/x86/include/asm/hypercall.h
+++ b/xen/arch/x86/include/asm/hypercall.h
@@ -43,16 +43,6 @@ compat_common_vcpu_op(
 
 #endif /* CONFIG_COMPAT */
 
-#ifndef NDEBUG
-static inline unsigned int _get_nargs(const unsigned char *tbl, unsigned int c)
-{
-    return tbl[c];
-}
-#define get_nargs(t, c) _get_nargs(t, array_index_nospec(c, ARRAY_SIZE(t)))
-#else
-#define get_nargs(tbl, c) 0
-#endif
-
 static inline void clobber_regs(struct cpu_user_regs *regs,
                                 unsigned int nargs)
 {
@@ -69,6 +59,11 @@ static inline void clobber_regs(struct c
 #endif
 }
 
+#define clobber_regs(r, n, t) ({ \
+    static const unsigned char t[] = hypercall_args_ ## t; \
+    clobber_regs(r, array_access_nospec(t, n)); \
+})
+
 static inline void clobber_regs32(struct cpu_user_regs *regs,
                                   unsigned int nargs)
 {
@@ -85,4 +80,9 @@ static inline void clobber_regs32(struct
 #endif
 }
 
+#define clobber_regs32(r, n, t) ({ \
+    static const unsigned char t[] = hypercall_args_ ## t; \
+    clobber_regs32(r, array_access_nospec(t, n)); \
+})
+
 #endif /* __ASM_X86_HYPERCALL_H__ */
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -27,13 +27,6 @@
 #include <asm/multicall.h>
 #include <irq_vectors.h>
 
-#ifndef NDEBUG
-static const unsigned char hypercall_args_64[] = hypercall_args_pv64;
-#ifdef CONFIG_PV32
-static const unsigned char hypercall_args_32[] = hypercall_args_pv32;
-#endif
-#endif
-
 /* Forced inline to cause 'compat' to be evaluated at compile time. */
 static void always_inline
 _pv_hypercall(struct cpu_user_regs *regs, bool compat)
@@ -65,7 +58,7 @@ _pv_hypercall(struct cpu_user_regs *regs
         call_handlers_pv64(eax, regs->rax, rdi, rsi, rdx, r10, r8);
 
         if ( !curr->hcall_preempted && regs->rax != -ENOSYS )
-            clobber_regs(regs, get_nargs(hypercall_args_64, eax));
+            clobber_regs(regs, eax, pv64);
     }
 #ifdef CONFIG_PV32
     else
@@ -90,7 +83,7 @@ _pv_hypercall(struct cpu_user_regs *regs
         curr->hcall_compat = false;
 
         if ( !curr->hcall_preempted && regs->eax != -ENOSYS )
-            clobber_regs32(regs, get_nargs(hypercall_args_32, eax));
+            clobber_regs32(regs, eax, pv32);
     }
 #endif /* CONFIG_PV32 */
 


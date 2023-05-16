Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A41B7046A1
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 09:40:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534990.832536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypHx-0007YR-W0; Tue, 16 May 2023 07:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534990.832536; Tue, 16 May 2023 07:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypHx-0007XY-RZ; Tue, 16 May 2023 07:40:05 +0000
Received: by outflank-mailman (input) for mailman id 534990;
 Tue, 16 May 2023 07:40:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pypHw-0006iO-FV
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 07:40:04 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7d00::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd8e2932-f3bc-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 09:40:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8988.eurprd04.prod.outlook.com (2603:10a6:20b:40b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 07:39:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 07:39:59 +0000
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
X-Inumbo-ID: dd8e2932-f3bc-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaJ6debGa7XC2I/8Av5ed9y+TiWKLR3OBW4FrCMtGFqoX2kze3T705CgDlGzE2D8BKz6FfXKGdjIO5xuMZmleDrmpB9xms78Hx0fkp1lNDPZ1TADtmemDbAtNke4mMxgtBnn6dwrt63yzf5gwpGcMpCOYnvdl0UMRIQg5YrLwgAXiM9TDBNB2gffUrEPShhoMfoSR200YwvV9ZwFYqN0QIK2P9nJYMSmsL5dNEN3T42bdE63gN8t6/Dfl4E455O4f+oBaBLydP5VNsp52EpFHemDvc2RnK2An3N62UN77t7RRV/Vmi/OSnc9hhIKJvEb41FgNbYEJevpaiGt11SHvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZD5eFts/ElfUxmwkKvhbhBvNNzHTg69/OMKEXlE0s4=;
 b=nyvmD+SKS6auF0usbNpwcrmFBPrmUCD1d87Bfd8FU04Kq89seQoIuIyTpgKNuFQBrZ+R3KklYKrKSacnbJUZHt00UH9OECfrvQuaH/tSCrkox5PjUbdppllq5KV/Z1pc8iUNTZQ/aUmFn2L8La1nOMB8hZAuJQPBHVS3y+BK3O+u1VNNHSOz21FlXaXttGithrFdmVzHHu1EVap73ShzCKPDfruxm3Yu79FDhZ54kBKHu3h5WiA4JzjCr46rLVFmMc0Vs80p+wUD78UBV18Q6OobvzG70QK1B0pQST/kjLDIQvBfKi/g+osI7tz17L0bcqkJeqd7rHBZfw655f3efA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZD5eFts/ElfUxmwkKvhbhBvNNzHTg69/OMKEXlE0s4=;
 b=iRsBiKZLoWhsmk6gtcQS/CSfRGIWxMFFLvAUUeTYxWjSRV30hg5Gi6lSMj5zGsiUDB3JWtkMjtcZNoIXSlCN3sxdc5dVHgPjgjQa2vsh5ey7cRt1bBsJZ8AlVo8OalsFq2xNlFyCLHmu8kolLdy9ViG0HPU3nDuRikk3OYA9qKx6Ulu1YLgijY9kLmZ1D+8sWqfpDQK0HnHK5Idm4JbjAAbCWR8chA5dVePvTkhmjq/ePoFwKYswes7CKc1eHcFAUVTTRhWc3NPDX/crFC0f26uNBrGR6b7z0MLMJPXiCvoCrd+zZ8B+H+tMonxHvRF7flRJld0iYQCJP4lx3h1FLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c1145a07-1dfd-eafc-fc18-4b039e657bca@suse.com>
Date: Tue, 16 May 2023 09:39:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v3 05/12] x86/shadow: move OOS functions to their own file
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
In-Reply-To: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: fb4a8b18-8e91-4616-9dae-08db55e0bfe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ew8pWgFMpXXYVRPTtq4EkOyEdpztfCi3aZ3XuijvMyFEQ74UsP31Wa8qa1OGo1PX4dlFhaIPHx7o20RWvDo8NKwEPC61UKmJA6DEPQq7uMw7dxFmZgVBGX7l/H2yYanpftb7qn4NmgKRVMI6IT5p0v+9AcNhRTiiBdcW3JHs/tqYnGJXLIiLEw4y3b4+gR5pwCXUstzvbX/Xj5Mxgw5+nsJn8PQi5MaAvsDeyr3MgBkiUcxacdAWY4MK5j0jqcrrkze/PviNw9iFZItltAn4RbD9l4dpxI67AktSV/aIZEk9/vzqFoM9Xq5fIZvb9c450c21cbRDoMej7L/MS99aJNgWxjM5rdZFoWNX8iPtFyHgv2BxFg0ta97Lh1UL/GwvUTK86bGDG9osXNXtzby69GgQnC+mgjniquCcRrtyQG+JOp/NpVdE0SJw3CnCCFsW+P2V1qb9YAadXM0J1hgz++2SCvLUD9RL1rlhBQaeNT67hEgh+WxrqBQx2x2DdaV2fXG1sgBTwFABU2nB09wrk+XmE4DYXK46JhD3CCGEjWvbzvuJ2eLIWvndZt03GEZTqVe9dnVrx0itm33mmfSkmN51pdujNJFz0L6Gg02hNEcxKiLueJLUSw8H/Con7oalA+rbKZ7llSUYr/kPDrgL6mM6HoxSWAoAAqSUyV7fOG99g1RldGXsR7TWbweoMZQY4a+gwlYPGo/Ou6elI6iIXg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199021)(2906002)(316002)(6916009)(31686004)(66946007)(4326008)(8676002)(5660300002)(8936002)(30864003)(66556008)(66476007)(66899021)(41300700001)(86362001)(2616005)(478600001)(54906003)(6486002)(36756003)(6666004)(6506007)(186003)(31696002)(83380400001)(6512007)(26005)(38100700002)(45980500001)(43740500002)(579004)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmc3SHErZjYvZVU5SzdqR3QvY0FoL29tWHcwMGMyS0dJcjFpOUsxOThrZDUv?=
 =?utf-8?B?Z3VkTzRaNVhrS0l4QjdmMTZsdURydUVrODhPMmtCMUp2a2szZmIzbTdpS1F2?=
 =?utf-8?B?cWJhYkJ2QkszSUJkT0FuajdmbEpsVjQvQWFpeWROOE1KRmpTWmhSYm9laUsz?=
 =?utf-8?B?cHFMbVFOc3k0ajErV1FFTGIxbkdaVEloaFZnUVhmbVhhQ3huYTJtUnhJZmI4?=
 =?utf-8?B?c0RLRmp5NW5KZ3FXLzBoUCtuRFcydFFnUlZjaDY0M1R3ZFAvdXdBK1FIZ2xM?=
 =?utf-8?B?WnRnNmVwcWZvMW8rUDNxaTdnaU9xMFE4WGZTS2Uyc21NU1krRzI3Z08wZTNM?=
 =?utf-8?B?bWpNYzR1QnBWN0ZlSG1ueUtvbjJhek5KVkxxUk9Gb1YxNGkyWCtTdGY5NG01?=
 =?utf-8?B?d0U1UlNGdHpyczdZK2pUUFB3VVRpUzJoNURGL2VCMWZFbWlyV3I5Z3NZeUY1?=
 =?utf-8?B?S0ZTa0xjRXJyRWFHa3ovVTNscTc5TGpzakdtL2pKamYvQy9SUkRCc2pEaGpi?=
 =?utf-8?B?alozVklBMjlOK09yMGZISDhTNE9UMDBIaUhxaTYxc2toeGpVV1NoQklEWmJm?=
 =?utf-8?B?aUVadC9OV0d5bWZFdTgzUHM1Rm5hQjZqQkJpQ3pNWlRVL0d3Nk9WelBaNjgv?=
 =?utf-8?B?TW11eHgxYlB6R1hLYmdMcllRUC9TanJ6YndlU2t2Y3h6ZmRneTBwdzNJdHRu?=
 =?utf-8?B?YXN6Q2h2WXJkTVZJaXFNRzVzVzRoSEh1cWI1NDRKRHdYTkFrZHoxeWdGT0FY?=
 =?utf-8?B?ZDlVci9OUjlDT0dsVEljOTFNUUxrUmdra1p4bmNKTzhVUUVNdFJ4aWpJQ1No?=
 =?utf-8?B?dUxLVWtMT2w3VjcyTUNsUXN1MGZXaENMNGlHZy9DYjI0eldtZHpvR2xJUjV2?=
 =?utf-8?B?KytpdWY0SWZCQWRKMjQrOWFEWEdETVYrblltTjZIWFo5bExBcGl5Qlp0NC8w?=
 =?utf-8?B?aDN2TFR5TTY4SG5Ldjh5eHl1dlFIYVVNbzFrQWFGSFNWMFQ4bHVQWmR3OVNI?=
 =?utf-8?B?MTkrb2tDZjhXWmR3ZHVJTGF6ZnNmdWFFeUkwOExaSzBxWWhobFpha2tGNGlZ?=
 =?utf-8?B?OXFSbHJITlRJWE0rbFZHSXVzYmJjZFBRQS80UkpHWUtzbmxMTUMrVERnUmNp?=
 =?utf-8?B?U0hsYkFpTGd0b2htaFR5d1BXVkFSK3B0ZCtEMC9zWmt0SXF4V0pIR3M3Z2NM?=
 =?utf-8?B?NnU0eHk0WFUxR3JuUE8xVjhPbkxEbmFiSjI3LzJFa2owNzd2dEg3SDBveVFj?=
 =?utf-8?B?bXJRbkpydjV1Z1d0Nk1zVTBCeFFxQmNuYXlBa0UyTEt3K0M0UVNsRU9hTDUv?=
 =?utf-8?B?bllFbEJUNXkvNm1UV0cvVERQcG5MNEc5UUhnRXVybWdJUDQvdjFBc2RmWDJa?=
 =?utf-8?B?M2R1YnBsTG5MSGJGWTNDWHJsd1I2NExVYXNndGUxYkJERGJ3NU1MZDBBMmY0?=
 =?utf-8?B?RnJTcmN6NjlSRWlHRUNleHFCb3lhV3Z6NFJlVG9WKzlLK3RnNktnNWtlUUds?=
 =?utf-8?B?NTJ4MHEwTDRzUW9ZL1lDUDVZMW50bjM3VzF0TC9xZ0ZGWVp2S0pQWExXN1Fz?=
 =?utf-8?B?Zk56Qit1R1FMa0hCMjV0Z3hnOHY2dHVYb2VUUldJU2dsQm1aeW1lQlZMS09L?=
 =?utf-8?B?SzJqck81UElpMlZySTdnNjZ3ekd6azFVS1FNSHF6SG9uRWxHeFZUdWpuUW52?=
 =?utf-8?B?aWFEdU90clhzNzhyaVZLa2sycGM4T0o1ZnRIajdvazBRaDdnV3lqQXljNGdr?=
 =?utf-8?B?K0Ivek9jaUJjcXZGbVR0akgvL21waUNnNWE4K1BSMWd6NVJ2NHE5V3hsUUtu?=
 =?utf-8?B?MkJjS3M0T3RDOGtIeExFSHB3czhSL05aTEVsMDh0Z204MTVFVDhqY2REVm1R?=
 =?utf-8?B?Vks0ZFN1T2FqTWh3YjBQUEJGdmRUSWI0TUpiTUpXMTk1eFhwYzVNb1VwZW9Y?=
 =?utf-8?B?Wlo4cFVrcDQvMUdhU3lSaGNURTFVTWw3RWR4TlpJNlBNR21PVUhqSVorNGxu?=
 =?utf-8?B?ejVYSkp2bTAyVk0xMU5CMUJzNlRnOFNxZ0NuQWIyZ1V4cDVPMjlhdzV3QkFi?=
 =?utf-8?B?MldZY0lvZFR3NHAybVc5aGpqY1lYeXZOWThpaExWejdCVmJDeDdvVm5IZnkv?=
 =?utf-8?Q?Wj6Ycpxm2qfsODM+09dFwGKzi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4a8b18-8e91-4616-9dae-08db55e0bfe1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 07:39:58.9369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JhSnzmbYXB9ebWjk2ylLn8ZqiJPJF3x3mwlnAsMoqIO3+pQ71GLs8mhCJhALYtJHe3DIGrXjxctq+bewi0SgVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8988

The code has been identified as HVM-only, and its main functions are
pretty well isolated. Move them to their own file. While moving, besides
making two functions non-static, do a few style adjustments, mainly
comment formatting, but leave the code otherwise untouched.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v2: Adjust SPDX to GPL-2.0-only. A few more style adjustments.

--- a/xen/arch/x86/mm/shadow/Makefile
+++ b/xen/arch/x86/mm/shadow/Makefile
@@ -1,6 +1,6 @@
 ifeq ($(CONFIG_SHADOW_PAGING),y)
 obj-y += common.o set.o
-obj-$(CONFIG_HVM) += hvm.o guest_2.o guest_3.o guest_4.o
+obj-$(CONFIG_HVM) += hvm.o guest_2.o guest_3.o guest_4.o oos.o
 obj-$(CONFIG_PV) += pv.o guest_4.o
 else
 obj-y += none.o
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -140,576 +140,6 @@ static int __init cf_check shadow_audit_
 __initcall(shadow_audit_key_init);
 #endif /* SHADOW_AUDIT */
 
-#if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
-/**************************************************************************/
-/* Out-of-sync shadows. */
-
-/* From time to time, we let a shadowed pagetable page go out of sync
- * with its shadow: the guest is allowed to write directly to the page,
- * and those writes are not synchronously reflected in the shadow.
- * This lets us avoid many emulations if the guest is writing a lot to a
- * pagetable, but it relaxes a pretty important invariant in the shadow
- * pagetable design.  Therefore, some rules:
- *
- * 1. Only L1 pagetables may go out of sync: any page that is shadowed
- *    at at higher level must be synchronously updated.  This makes
- *    using linear shadow pagetables much less dangerous.
- *    That means that: (a) unsyncing code needs to check for higher-level
- *    shadows, and (b) promotion code needs to resync.
- *
- * 2. All shadow operations on a guest page require the page to be brought
- *    back into sync before proceeding.  This must be done under the
- *    paging lock so that the page is guaranteed to remain synced until
- *    the operation completes.
- *
- *    Exceptions to this rule: the pagefault and invlpg handlers may
- *    update only one entry on an out-of-sync page without resyncing it.
- *
- * 3. Operations on shadows that do not start from a guest page need to
- *    be aware that they may be handling an out-of-sync shadow.
- *
- * 4. Operations that do not normally take the paging lock (fast-path
- *    #PF handler, INVLPG) must fall back to a locking, syncing version
- *    if they see an out-of-sync table.
- *
- * 5. Operations corresponding to guest TLB flushes (MOV CR3, INVLPG)
- *    must explicitly resync all relevant pages or update their
- *    shadows.
- *
- * Currently out-of-sync pages are listed in a simple open-addressed
- * hash table with a second chance (must resist temptation to radically
- * over-engineer hash tables...)  The virtual address of the access
- * which caused us to unsync the page is also kept in the hash table, as
- * a hint for finding the writable mappings later.
- *
- * We keep a hash per vcpu, because we want as much as possible to do
- * the re-sync on the save vcpu we did the unsync on, so the VA hint
- * will be valid.
- */
-
-static void sh_oos_audit(struct domain *d)
-{
-    unsigned int idx, expected_idx, expected_idx_alt;
-    struct page_info *pg;
-    struct vcpu *v;
-
-    for_each_vcpu(d, v)
-    {
-        for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
-        {
-            mfn_t *oos = v->arch.paging.shadow.oos;
-            if ( mfn_eq(oos[idx], INVALID_MFN) )
-                continue;
-
-            expected_idx = mfn_x(oos[idx]) % SHADOW_OOS_PAGES;
-            expected_idx_alt = ((expected_idx + 1) % SHADOW_OOS_PAGES);
-            if ( idx != expected_idx && idx != expected_idx_alt )
-            {
-                printk("%s: idx %x contains gmfn %lx, expected at %x or %x.\n",
-                       __func__, idx, mfn_x(oos[idx]),
-                       expected_idx, expected_idx_alt);
-                BUG();
-            }
-            pg = mfn_to_page(oos[idx]);
-            if ( !(pg->count_info & PGC_shadowed_pt) )
-            {
-                printk("%s: idx %x gmfn %lx not a pt (count %lx)\n",
-                       __func__, idx, mfn_x(oos[idx]), pg->count_info);
-                BUG();
-            }
-            if ( !(pg->shadow_flags & SHF_out_of_sync) )
-            {
-                printk("%s: idx %x gmfn %lx not marked oos (flags %x)\n",
-                       __func__, idx, mfn_x(oos[idx]), pg->shadow_flags);
-                BUG();
-            }
-            if ( (pg->shadow_flags & SHF_page_type_mask & ~SHF_L1_ANY) )
-            {
-                printk("%s: idx %x gmfn %lx shadowed as non-l1 (flags %x)\n",
-                       __func__, idx, mfn_x(oos[idx]), pg->shadow_flags);
-                BUG();
-            }
-        }
-    }
-}
-
-#if SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES
-void oos_audit_hash_is_present(struct domain *d, mfn_t gmfn)
-{
-    int idx;
-    struct vcpu *v;
-    mfn_t *oos;
-
-    ASSERT(mfn_is_out_of_sync(gmfn));
-
-    for_each_vcpu(d, v)
-    {
-        oos = v->arch.paging.shadow.oos;
-        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
-        if ( !mfn_eq(oos[idx], gmfn) )
-            idx = (idx + 1) % SHADOW_OOS_PAGES;
-
-        if ( mfn_eq(oos[idx], gmfn) )
-            return;
-    }
-
-    printk(XENLOG_ERR "gmfn %"PRI_mfn" marked OOS but not in hash table\n",
-           mfn_x(gmfn));
-    BUG();
-}
-#endif
-
-/* Update the shadow, but keep the page out of sync. */
-static inline void _sh_resync_l1(struct vcpu *v, mfn_t gmfn, mfn_t snpmfn)
-{
-    struct page_info *pg = mfn_to_page(gmfn);
-
-    ASSERT(mfn_valid(gmfn));
-    ASSERT(page_is_out_of_sync(pg));
-
-    /* Call out to the appropriate per-mode resyncing function */
-    if ( pg->shadow_flags & SHF_L1_32 )
-        SHADOW_INTERNAL_NAME(sh_resync_l1, 2)(v, gmfn, snpmfn);
-    else if ( pg->shadow_flags & SHF_L1_PAE )
-        SHADOW_INTERNAL_NAME(sh_resync_l1, 3)(v, gmfn, snpmfn);
-    else if ( pg->shadow_flags & SHF_L1_64 )
-        SHADOW_INTERNAL_NAME(sh_resync_l1, 4)(v, gmfn, snpmfn);
-}
-
-static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
-                                            mfn_t smfn, unsigned long off)
-{
-    ASSERT(mfn_valid(smfn));
-    ASSERT(mfn_valid(gmfn));
-
-    switch ( mfn_to_page(smfn)->u.sh.type )
-    {
-    case SH_type_l1_32_shadow:
-    case SH_type_fl1_32_shadow:
-        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 2)
-            (d, gmfn, smfn, off);
-
-    case SH_type_l1_pae_shadow:
-    case SH_type_fl1_pae_shadow:
-        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 3)
-            (d, gmfn, smfn, off);
-
-    case SH_type_l1_64_shadow:
-    case SH_type_fl1_64_shadow:
-        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 4)
-            (d, gmfn, smfn, off);
-
-    default:
-        return 0;
-    }
-}
-
-/*
- * Fixup arrays: We limit the maximum number of writable mappings to
- * SHADOW_OOS_FIXUPS and store enough information to remove them
- * quickly on resync.
- */
-
-static inline int oos_fixup_flush_gmfn(struct vcpu *v, mfn_t gmfn,
-                                       struct oos_fixup *fixup)
-{
-    struct domain *d = v->domain;
-    int i;
-    for ( i = 0; i < SHADOW_OOS_FIXUPS; i++ )
-    {
-        if ( !mfn_eq(fixup->smfn[i], INVALID_MFN) )
-        {
-            sh_remove_write_access_from_sl1p(d, gmfn,
-                                             fixup->smfn[i],
-                                             fixup->off[i]);
-            fixup->smfn[i] = INVALID_MFN;
-        }
-    }
-
-    /* Always flush the TLBs. See comment on oos_fixup_add(). */
-    return 1;
-}
-
-void oos_fixup_add(struct domain *d, mfn_t gmfn,
-                   mfn_t smfn,  unsigned long off)
-{
-    int idx, next;
-    mfn_t *oos;
-    struct oos_fixup *oos_fixup;
-    struct vcpu *v;
-
-    perfc_incr(shadow_oos_fixup_add);
-
-    for_each_vcpu(d, v)
-    {
-        oos = v->arch.paging.shadow.oos;
-        oos_fixup = v->arch.paging.shadow.oos_fixup;
-        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
-        if ( !mfn_eq(oos[idx], gmfn) )
-            idx = (idx + 1) % SHADOW_OOS_PAGES;
-        if ( mfn_eq(oos[idx], gmfn) )
-        {
-            int i;
-            for ( i = 0; i < SHADOW_OOS_FIXUPS; i++ )
-            {
-                if ( mfn_eq(oos_fixup[idx].smfn[i], smfn)
-                     && (oos_fixup[idx].off[i] == off) )
-                    return;
-            }
-
-            next = oos_fixup[idx].next;
-
-            if ( !mfn_eq(oos_fixup[idx].smfn[next], INVALID_MFN) )
-            {
-                TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_OOS_FIXUP_EVICT);
-
-                /* Reuse this slot and remove current writable mapping. */
-                sh_remove_write_access_from_sl1p(d, gmfn,
-                                                 oos_fixup[idx].smfn[next],
-                                                 oos_fixup[idx].off[next]);
-                perfc_incr(shadow_oos_fixup_evict);
-                /* We should flush the TLBs now, because we removed a
-                   writable mapping, but since the shadow is already
-                   OOS we have no problem if another vcpu write to
-                   this page table. We just have to be very careful to
-                   *always* flush the tlbs on resync. */
-            }
-
-            oos_fixup[idx].smfn[next] = smfn;
-            oos_fixup[idx].off[next] = off;
-            oos_fixup[idx].next = (next + 1) % SHADOW_OOS_FIXUPS;
-
-            TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_OOS_FIXUP_ADD);
-            return;
-        }
-    }
-
-    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
-           mfn_x(gmfn));
-    BUG();
-}
-
-static int oos_remove_write_access(struct vcpu *v, mfn_t gmfn,
-                                   struct oos_fixup *fixup)
-{
-    struct domain *d = v->domain;
-    int ftlb = 0;
-
-    ftlb |= oos_fixup_flush_gmfn(v, gmfn, fixup);
-
-    switch ( sh_remove_write_access(d, gmfn, 0, 0) )
-    {
-    default:
-    case 0:
-        break;
-
-    case 1:
-        ftlb |= 1;
-        break;
-
-    case -1:
-        /* An unfindable writeable typecount has appeared, probably via a
-         * grant table entry: can't shoot the mapping, so try to unshadow
-         * the page.  If that doesn't work either, the guest is granting
-         * his pagetables and must be killed after all.
-         * This will flush the tlb, so we can return with no worries. */
-        shadow_remove_all_shadows(d, gmfn);
-        return 1;
-    }
-
-    if ( ftlb )
-        guest_flush_tlb_mask(d, d->dirty_cpumask);
-
-    return 0;
-}
-
-
-static inline void trace_resync(int event, mfn_t gmfn)
-{
-    if ( tb_init_done )
-    {
-        /* Convert gmfn to gfn */
-        gfn_t gfn = mfn_to_gfn(current->domain, gmfn);
-
-        __trace_var(event, 0/*!tsc*/, sizeof(gfn), &gfn);
-    }
-}
-
-/* Pull all the entries on an out-of-sync page back into sync. */
-static void _sh_resync(struct vcpu *v, mfn_t gmfn,
-                       struct oos_fixup *fixup, mfn_t snp)
-{
-    struct page_info *pg = mfn_to_page(gmfn);
-
-    ASSERT(paging_locked_by_me(v->domain));
-    ASSERT(mfn_is_out_of_sync(gmfn));
-    /* Guest page must be shadowed *only* as L1 when out of sync. */
-    ASSERT(!(mfn_to_page(gmfn)->shadow_flags & SHF_page_type_mask
-             & ~SHF_L1_ANY));
-    ASSERT(!sh_page_has_multiple_shadows(mfn_to_page(gmfn)));
-
-    SHADOW_PRINTK("%pv gmfn=%"PRI_mfn"\n", v, mfn_x(gmfn));
-
-    /* Need to pull write access so the page *stays* in sync. */
-    if ( oos_remove_write_access(v, gmfn, fixup) )
-    {
-        /* Page has been unshadowed. */
-        return;
-    }
-
-    /* No more writable mappings of this page, please */
-    pg->shadow_flags &= ~SHF_oos_may_write;
-
-    /* Update the shadows with current guest entries. */
-    _sh_resync_l1(v, gmfn, snp);
-
-    /* Now we know all the entries are synced, and will stay that way */
-    pg->shadow_flags &= ~SHF_out_of_sync;
-    perfc_incr(shadow_resync);
-    trace_resync(TRC_SHADOW_RESYNC_FULL, gmfn);
-}
-
-
-/* Add an MFN to the list of out-of-sync guest pagetables */
-static void oos_hash_add(struct vcpu *v, mfn_t gmfn)
-{
-    int i, idx, oidx, swap = 0;
-    mfn_t *oos = v->arch.paging.shadow.oos;
-    mfn_t *oos_snapshot = v->arch.paging.shadow.oos_snapshot;
-    struct oos_fixup *oos_fixup = v->arch.paging.shadow.oos_fixup;
-    struct oos_fixup fixup = { .next = 0 };
-
-    for (i = 0; i < SHADOW_OOS_FIXUPS; i++ )
-        fixup.smfn[i] = INVALID_MFN;
-
-    idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
-    oidx = idx;
-
-    if ( !mfn_eq(oos[idx], INVALID_MFN)
-         && (mfn_x(oos[idx]) % SHADOW_OOS_PAGES) == idx )
-    {
-        /* Punt the current occupant into the next slot */
-        SWAP(oos[idx], gmfn);
-        SWAP(oos_fixup[idx], fixup);
-        swap = 1;
-        idx = (idx + 1) % SHADOW_OOS_PAGES;
-    }
-    if ( !mfn_eq(oos[idx], INVALID_MFN) )
-    {
-        /* Crush the current occupant. */
-        _sh_resync(v, oos[idx], &oos_fixup[idx], oos_snapshot[idx]);
-        perfc_incr(shadow_unsync_evict);
-    }
-    oos[idx] = gmfn;
-    oos_fixup[idx] = fixup;
-
-    if ( swap )
-        SWAP(oos_snapshot[idx], oos_snapshot[oidx]);
-
-    copy_domain_page(oos_snapshot[oidx], oos[oidx]);
-}
-
-/* Remove an MFN from the list of out-of-sync guest pagetables */
-static void oos_hash_remove(struct domain *d, mfn_t gmfn)
-{
-    int idx;
-    mfn_t *oos;
-    struct vcpu *v;
-
-    SHADOW_PRINTK("d%d gmfn %lx\n", d->domain_id, mfn_x(gmfn));
-
-    for_each_vcpu(d, v)
-    {
-        oos = v->arch.paging.shadow.oos;
-        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
-        if ( !mfn_eq(oos[idx], gmfn) )
-            idx = (idx + 1) % SHADOW_OOS_PAGES;
-        if ( mfn_eq(oos[idx], gmfn) )
-        {
-            oos[idx] = INVALID_MFN;
-            return;
-        }
-    }
-
-    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
-           mfn_x(gmfn));
-    BUG();
-}
-
-mfn_t oos_snapshot_lookup(struct domain *d, mfn_t gmfn)
-{
-    int idx;
-    mfn_t *oos;
-    mfn_t *oos_snapshot;
-    struct vcpu *v;
-
-    for_each_vcpu(d, v)
-    {
-        oos = v->arch.paging.shadow.oos;
-        oos_snapshot = v->arch.paging.shadow.oos_snapshot;
-        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
-        if ( !mfn_eq(oos[idx], gmfn) )
-            idx = (idx + 1) % SHADOW_OOS_PAGES;
-        if ( mfn_eq(oos[idx], gmfn) )
-        {
-            return oos_snapshot[idx];
-        }
-    }
-
-    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
-           mfn_x(gmfn));
-    BUG();
-}
-
-/* Pull a single guest page back into sync */
-void sh_resync(struct domain *d, mfn_t gmfn)
-{
-    int idx;
-    mfn_t *oos;
-    mfn_t *oos_snapshot;
-    struct oos_fixup *oos_fixup;
-    struct vcpu *v;
-
-    for_each_vcpu(d, v)
-    {
-        oos = v->arch.paging.shadow.oos;
-        oos_fixup = v->arch.paging.shadow.oos_fixup;
-        oos_snapshot = v->arch.paging.shadow.oos_snapshot;
-        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
-        if ( !mfn_eq(oos[idx], gmfn) )
-            idx = (idx + 1) % SHADOW_OOS_PAGES;
-
-        if ( mfn_eq(oos[idx], gmfn) )
-        {
-            _sh_resync(v, gmfn, &oos_fixup[idx], oos_snapshot[idx]);
-            oos[idx] = INVALID_MFN;
-            return;
-        }
-    }
-
-    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
-           mfn_x(gmfn));
-    BUG();
-}
-
-/* Figure out whether it's definitely safe not to sync this l1 table,
- * by making a call out to the mode in which that shadow was made. */
-static int sh_skip_sync(struct vcpu *v, mfn_t gl1mfn)
-{
-    struct page_info *pg = mfn_to_page(gl1mfn);
-    if ( pg->shadow_flags & SHF_L1_32 )
-        return SHADOW_INTERNAL_NAME(sh_safe_not_to_sync, 2)(v, gl1mfn);
-    else if ( pg->shadow_flags & SHF_L1_PAE )
-        return SHADOW_INTERNAL_NAME(sh_safe_not_to_sync, 3)(v, gl1mfn);
-    else if ( pg->shadow_flags & SHF_L1_64 )
-        return SHADOW_INTERNAL_NAME(sh_safe_not_to_sync, 4)(v, gl1mfn);
-    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not shadowed as an l1\n",
-           mfn_x(gl1mfn));
-    BUG();
-}
-
-
-/* Pull all out-of-sync pages back into sync.  Pages brought out of sync
- * on other vcpus are allowed to remain out of sync, but their contents
- * will be made safe (TLB flush semantics); pages unsynced by this vcpu
- * are brought back into sync and write-protected.  If skip != 0, we try
- * to avoid resyncing at all if we think we can get away with it. */
-void sh_resync_all(struct vcpu *v, int skip, int this, int others)
-{
-    int idx;
-    struct vcpu *other;
-    mfn_t *oos = v->arch.paging.shadow.oos;
-    mfn_t *oos_snapshot = v->arch.paging.shadow.oos_snapshot;
-    struct oos_fixup *oos_fixup = v->arch.paging.shadow.oos_fixup;
-
-    SHADOW_PRINTK("%pv\n", v);
-
-    ASSERT(paging_locked_by_me(v->domain));
-
-    if ( !this )
-        goto resync_others;
-
-    /* First: resync all of this vcpu's oos pages */
-    for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
-        if ( !mfn_eq(oos[idx], INVALID_MFN) )
-        {
-            /* Write-protect and sync contents */
-            _sh_resync(v, oos[idx], &oos_fixup[idx], oos_snapshot[idx]);
-            oos[idx] = INVALID_MFN;
-        }
-
- resync_others:
-    if ( !others )
-        return;
-
-    /* Second: make all *other* vcpus' oos pages safe. */
-    for_each_vcpu(v->domain, other)
-    {
-        if ( v == other )
-            continue;
-
-        oos = other->arch.paging.shadow.oos;
-        oos_fixup = other->arch.paging.shadow.oos_fixup;
-        oos_snapshot = other->arch.paging.shadow.oos_snapshot;
-
-        for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
-        {
-            if ( mfn_eq(oos[idx], INVALID_MFN) )
-                continue;
-
-            if ( skip )
-            {
-                /* Update the shadows and leave the page OOS. */
-                if ( sh_skip_sync(v, oos[idx]) )
-                    continue;
-                trace_resync(TRC_SHADOW_RESYNC_ONLY, oos[idx]);
-                _sh_resync_l1(other, oos[idx], oos_snapshot[idx]);
-            }
-            else
-            {
-                /* Write-protect and sync contents */
-                _sh_resync(other, oos[idx], &oos_fixup[idx], oos_snapshot[idx]);
-                oos[idx] = INVALID_MFN;
-            }
-        }
-    }
-}
-
-/* Allow a shadowed page to go out of sync. Unsyncs are traced in
- * multi.c:sh_page_fault() */
-int sh_unsync(struct vcpu *v, mfn_t gmfn)
-{
-    struct page_info *pg;
-
-    ASSERT(paging_locked_by_me(v->domain));
-
-    SHADOW_PRINTK("%pv gmfn=%"PRI_mfn"\n", v, mfn_x(gmfn));
-
-    pg = mfn_to_page(gmfn);
-
-    /* Guest page must be shadowed *only* as L1 and *only* once when out
-     * of sync.  Also, get out now if it's already out of sync.
-     * Also, can't safely unsync if some vcpus have paging disabled.*/
-    if ( pg->shadow_flags &
-         ((SHF_page_type_mask & ~SHF_L1_ANY) | SHF_out_of_sync)
-         || sh_page_has_multiple_shadows(pg)
-         || !is_hvm_vcpu(v)
-         || !v->domain->arch.paging.shadow.oos_active )
-        return 0;
-
-    BUILD_BUG_ON(!(typeof(pg->shadow_flags))SHF_out_of_sync);
-    BUILD_BUG_ON(!(typeof(pg->shadow_flags))SHF_oos_may_write);
-
-    pg->shadow_flags |= SHF_out_of_sync|SHF_oos_may_write;
-    oos_hash_add(v, gmfn);
-    perfc_incr(shadow_unsync);
-    TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_UNSYNC);
-    return 1;
-}
-
-#endif /* (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC) */
-
-
 /**************************************************************************/
 /* Code for "promoting" a guest page to the point where the shadow code is
  * willing to let it be treated as a guest page table.  This generally
--- /dev/null
+++ b/xen/arch/x86/mm/shadow/oos.c
@@ -0,0 +1,606 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/******************************************************************************
+ * arch/x86/mm/shadow/oos.c
+ *
+ * Shadow code dealing with out-of-sync shadows.
+ * Parts of this code are Copyright (c) 2006 by XenSource Inc.
+ * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
+ * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
+ */
+
+#include "private.h"
+
+#if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
+
+#include <xen/trace.h>
+
+#include <asm/shadow.h>
+
+/*
+ * From time to time, we let a shadowed pagetable page go out of sync
+ * with its shadow: the guest is allowed to write directly to the page,
+ * and those writes are not synchronously reflected in the shadow.
+ * This lets us avoid many emulations if the guest is writing a lot to a
+ * pagetable, but it relaxes a pretty important invariant in the shadow
+ * pagetable design.  Therefore, some rules:
+ *
+ * 1. Only L1 pagetables may go out of sync: any page that is shadowed
+ *    at at higher level must be synchronously updated.  This makes
+ *    using linear shadow pagetables much less dangerous.
+ *    That means that: (a) unsyncing code needs to check for higher-level
+ *    shadows, and (b) promotion code needs to resync.
+ *
+ * 2. All shadow operations on a guest page require the page to be brought
+ *    back into sync before proceeding.  This must be done under the
+ *    paging lock so that the page is guaranteed to remain synced until
+ *    the operation completes.
+ *
+ *    Exceptions to this rule: the pagefault and invlpg handlers may
+ *    update only one entry on an out-of-sync page without resyncing it.
+ *
+ * 3. Operations on shadows that do not start from a guest page need to
+ *    be aware that they may be handling an out-of-sync shadow.
+ *
+ * 4. Operations that do not normally take the paging lock (fast-path
+ *    #PF handler, INVLPG) must fall back to a locking, syncing version
+ *    if they see an out-of-sync table.
+ *
+ * 5. Operations corresponding to guest TLB flushes (MOV CR3, INVLPG)
+ *    must explicitly resync all relevant pages or update their
+ *    shadows.
+ *
+ * Currently out-of-sync pages are listed in a simple open-addressed
+ * hash table with a second chance (must resist temptation to radically
+ * over-engineer hash tables...)  The virtual address of the access
+ * which caused us to unsync the page is also kept in the hash table, as
+ * a hint for finding the writable mappings later.
+ *
+ * We keep a hash per vcpu, because we want as much as possible to do
+ * the re-sync on the save vcpu we did the unsync on, so the VA hint
+ * will be valid.
+ */
+
+#if SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES_FULL
+void sh_oos_audit(struct domain *d)
+{
+    unsigned int idx, expected_idx, expected_idx_alt;
+    struct page_info *pg;
+    struct vcpu *v;
+
+    for_each_vcpu(d, v)
+    {
+        for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
+        {
+            mfn_t *oos = v->arch.paging.shadow.oos;
+
+            if ( mfn_eq(oos[idx], INVALID_MFN) )
+                continue;
+
+            expected_idx = mfn_x(oos[idx]) % SHADOW_OOS_PAGES;
+            expected_idx_alt = ((expected_idx + 1) % SHADOW_OOS_PAGES);
+            if ( idx != expected_idx && idx != expected_idx_alt )
+            {
+                printk("%s: idx %x contains gmfn %lx, expected at %x or %x.\n",
+                       __func__, idx, mfn_x(oos[idx]),
+                       expected_idx, expected_idx_alt);
+                BUG();
+            }
+            pg = mfn_to_page(oos[idx]);
+            if ( !(pg->count_info & PGC_shadowed_pt) )
+            {
+                printk("%s: idx %x gmfn %lx not a pt (count %lx)\n",
+                       __func__, idx, mfn_x(oos[idx]), pg->count_info);
+                BUG();
+            }
+            if ( !(pg->shadow_flags & SHF_out_of_sync) )
+            {
+                printk("%s: idx %x gmfn %lx not marked oos (flags %x)\n",
+                       __func__, idx, mfn_x(oos[idx]), pg->shadow_flags);
+                BUG();
+            }
+            if ( (pg->shadow_flags & SHF_page_type_mask & ~SHF_L1_ANY) )
+            {
+                printk("%s: idx %x gmfn %lx shadowed as non-l1 (flags %x)\n",
+                       __func__, idx, mfn_x(oos[idx]), pg->shadow_flags);
+                BUG();
+            }
+        }
+    }
+}
+#endif
+
+#if SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES
+void oos_audit_hash_is_present(struct domain *d, mfn_t gmfn)
+{
+    int idx;
+    struct vcpu *v;
+    mfn_t *oos;
+
+    ASSERT(mfn_is_out_of_sync(gmfn));
+
+    for_each_vcpu(d, v)
+    {
+        oos = v->arch.paging.shadow.oos;
+        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
+        if ( !mfn_eq(oos[idx], gmfn) )
+            idx = (idx + 1) % SHADOW_OOS_PAGES;
+
+        if ( mfn_eq(oos[idx], gmfn) )
+            return;
+    }
+
+    printk(XENLOG_ERR "gmfn %"PRI_mfn" marked OOS but not in hash table\n",
+           mfn_x(gmfn));
+    BUG();
+}
+#endif
+
+/* Update the shadow, but keep the page out of sync. */
+static inline void _sh_resync_l1(struct vcpu *v, mfn_t gmfn, mfn_t snpmfn)
+{
+    struct page_info *pg = mfn_to_page(gmfn);
+
+    ASSERT(mfn_valid(gmfn));
+    ASSERT(page_is_out_of_sync(pg));
+
+    /* Call out to the appropriate per-mode resyncing function */
+    if ( pg->shadow_flags & SHF_L1_32 )
+        SHADOW_INTERNAL_NAME(sh_resync_l1, 2)(v, gmfn, snpmfn);
+    else if ( pg->shadow_flags & SHF_L1_PAE )
+        SHADOW_INTERNAL_NAME(sh_resync_l1, 3)(v, gmfn, snpmfn);
+    else if ( pg->shadow_flags & SHF_L1_64 )
+        SHADOW_INTERNAL_NAME(sh_resync_l1, 4)(v, gmfn, snpmfn);
+}
+
+static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
+                                            mfn_t smfn, unsigned long off)
+{
+    ASSERT(mfn_valid(smfn));
+    ASSERT(mfn_valid(gmfn));
+
+    switch ( mfn_to_page(smfn)->u.sh.type )
+    {
+    case SH_type_l1_32_shadow:
+    case SH_type_fl1_32_shadow:
+        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 2)
+            (d, gmfn, smfn, off);
+
+    case SH_type_l1_pae_shadow:
+    case SH_type_fl1_pae_shadow:
+        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 3)
+            (d, gmfn, smfn, off);
+
+    case SH_type_l1_64_shadow:
+    case SH_type_fl1_64_shadow:
+        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 4)
+            (d, gmfn, smfn, off);
+
+    default:
+        return 0;
+    }
+}
+
+/*
+ * Fixup arrays: We limit the maximum number of writable mappings to
+ * SHADOW_OOS_FIXUPS and store enough information to remove them
+ * quickly on resync.
+ */
+
+static inline int oos_fixup_flush_gmfn(struct vcpu *v, mfn_t gmfn,
+                                       struct oos_fixup *fixup)
+{
+    struct domain *d = v->domain;
+    int i;
+    for ( i = 0; i < SHADOW_OOS_FIXUPS; i++ )
+    {
+        if ( !mfn_eq(fixup->smfn[i], INVALID_MFN) )
+        {
+            sh_remove_write_access_from_sl1p(d, gmfn,
+                                             fixup->smfn[i],
+                                             fixup->off[i]);
+            fixup->smfn[i] = INVALID_MFN;
+        }
+    }
+
+    /* Always flush the TLBs. See comment on oos_fixup_add(). */
+    return 1;
+}
+
+void oos_fixup_add(struct domain *d, mfn_t gmfn,
+                   mfn_t smfn,  unsigned long off)
+{
+    int idx, next;
+    mfn_t *oos;
+    struct oos_fixup *oos_fixup;
+    struct vcpu *v;
+
+    perfc_incr(shadow_oos_fixup_add);
+
+    for_each_vcpu(d, v)
+    {
+        oos = v->arch.paging.shadow.oos;
+        oos_fixup = v->arch.paging.shadow.oos_fixup;
+        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
+        if ( !mfn_eq(oos[idx], gmfn) )
+            idx = (idx + 1) % SHADOW_OOS_PAGES;
+        if ( mfn_eq(oos[idx], gmfn) )
+        {
+            int i;
+            for ( i = 0; i < SHADOW_OOS_FIXUPS; i++ )
+            {
+                if ( mfn_eq(oos_fixup[idx].smfn[i], smfn) &&
+                     (oos_fixup[idx].off[i] == off) )
+                    return;
+            }
+
+            next = oos_fixup[idx].next;
+
+            if ( !mfn_eq(oos_fixup[idx].smfn[next], INVALID_MFN) )
+            {
+                TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_OOS_FIXUP_EVICT);
+
+                /* Reuse this slot and remove current writable mapping. */
+                sh_remove_write_access_from_sl1p(d, gmfn,
+                                                 oos_fixup[idx].smfn[next],
+                                                 oos_fixup[idx].off[next]);
+                perfc_incr(shadow_oos_fixup_evict);
+                /*
+                 * We should flush the TLBs now, because we removed a
+                 * writable mapping, but since the shadow is already
+                 * OOS we have no problem if another vcpu write to
+                 * this page table. We just have to be very careful to
+                 * *always* flush the tlbs on resync.
+                 */
+            }
+
+            oos_fixup[idx].smfn[next] = smfn;
+            oos_fixup[idx].off[next] = off;
+            oos_fixup[idx].next = (next + 1) % SHADOW_OOS_FIXUPS;
+
+            TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_OOS_FIXUP_ADD);
+            return;
+        }
+    }
+
+    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
+           mfn_x(gmfn));
+    BUG();
+}
+
+static int oos_remove_write_access(struct vcpu *v, mfn_t gmfn,
+                                   struct oos_fixup *fixup)
+{
+    struct domain *d = v->domain;
+    int ftlb = 0;
+
+    ftlb |= oos_fixup_flush_gmfn(v, gmfn, fixup);
+
+    switch ( sh_remove_write_access(d, gmfn, 0, 0) )
+    {
+    default:
+    case 0:
+        break;
+
+    case 1:
+        ftlb |= 1;
+        break;
+
+    case -1:
+        /*
+         * An unfindable writeable typecount has appeared, probably via a
+         * grant table entry: can't shoot the mapping, so try to unshadow
+         * the page.  If that doesn't work either, the guest is granting
+         * his pagetables and must be killed after all.
+         * This will flush the tlb, so we can return with no worries.
+         */
+        shadow_remove_all_shadows(d, gmfn);
+        return 1;
+    }
+
+    if ( ftlb )
+        guest_flush_tlb_mask(d, d->dirty_cpumask);
+
+    return 0;
+}
+
+static inline void trace_resync(int event, mfn_t gmfn)
+{
+    if ( tb_init_done )
+    {
+        /* Convert gmfn to gfn */
+        gfn_t gfn = mfn_to_gfn(current->domain, gmfn);
+
+        __trace_var(event, 0/*!tsc*/, sizeof(gfn), &gfn);
+    }
+}
+
+/* Pull all the entries on an out-of-sync page back into sync. */
+static void _sh_resync(struct vcpu *v, mfn_t gmfn,
+                       struct oos_fixup *fixup, mfn_t snp)
+{
+    struct page_info *pg = mfn_to_page(gmfn);
+
+    ASSERT(paging_locked_by_me(v->domain));
+    ASSERT(mfn_is_out_of_sync(gmfn));
+    /* Guest page must be shadowed *only* as L1 when out of sync. */
+    ASSERT(!(mfn_to_page(gmfn)->shadow_flags & SHF_page_type_mask
+             & ~SHF_L1_ANY));
+    ASSERT(!sh_page_has_multiple_shadows(mfn_to_page(gmfn)));
+
+    SHADOW_PRINTK("%pv gmfn=%"PRI_mfn"\n", v, mfn_x(gmfn));
+
+    /* Need to pull write access so the page *stays* in sync. */
+    if ( oos_remove_write_access(v, gmfn, fixup) )
+    {
+        /* Page has been unshadowed. */
+        return;
+    }
+
+    /* No more writable mappings of this page, please */
+    pg->shadow_flags &= ~SHF_oos_may_write;
+
+    /* Update the shadows with current guest entries. */
+    _sh_resync_l1(v, gmfn, snp);
+
+    /* Now we know all the entries are synced, and will stay that way */
+    pg->shadow_flags &= ~SHF_out_of_sync;
+    perfc_incr(shadow_resync);
+    trace_resync(TRC_SHADOW_RESYNC_FULL, gmfn);
+}
+
+/* Add an MFN to the list of out-of-sync guest pagetables */
+static void oos_hash_add(struct vcpu *v, mfn_t gmfn)
+{
+    int i, idx, oidx, swap = 0;
+    mfn_t *oos = v->arch.paging.shadow.oos;
+    mfn_t *oos_snapshot = v->arch.paging.shadow.oos_snapshot;
+    struct oos_fixup *oos_fixup = v->arch.paging.shadow.oos_fixup;
+    struct oos_fixup fixup = { .next = 0 };
+
+    for ( i = 0; i < SHADOW_OOS_FIXUPS; i++ )
+        fixup.smfn[i] = INVALID_MFN;
+
+    idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
+    oidx = idx;
+
+    if ( !mfn_eq(oos[idx], INVALID_MFN) &&
+         (mfn_x(oos[idx]) % SHADOW_OOS_PAGES) == idx )
+    {
+        /* Punt the current occupant into the next slot */
+        SWAP(oos[idx], gmfn);
+        SWAP(oos_fixup[idx], fixup);
+        swap = 1;
+        idx = (idx + 1) % SHADOW_OOS_PAGES;
+    }
+    if ( !mfn_eq(oos[idx], INVALID_MFN) )
+    {
+        /* Crush the current occupant. */
+        _sh_resync(v, oos[idx], &oos_fixup[idx], oos_snapshot[idx]);
+        perfc_incr(shadow_unsync_evict);
+    }
+    oos[idx] = gmfn;
+    oos_fixup[idx] = fixup;
+
+    if ( swap )
+        SWAP(oos_snapshot[idx], oos_snapshot[oidx]);
+
+    copy_domain_page(oos_snapshot[oidx], oos[oidx]);
+}
+
+/* Remove an MFN from the list of out-of-sync guest pagetables */
+void oos_hash_remove(struct domain *d, mfn_t gmfn)
+{
+    int idx;
+    mfn_t *oos;
+    struct vcpu *v;
+
+    SHADOW_PRINTK("d%d gmfn %lx\n", d->domain_id, mfn_x(gmfn));
+
+    for_each_vcpu(d, v)
+    {
+        oos = v->arch.paging.shadow.oos;
+        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
+        if ( !mfn_eq(oos[idx], gmfn) )
+            idx = (idx + 1) % SHADOW_OOS_PAGES;
+        if ( mfn_eq(oos[idx], gmfn) )
+        {
+            oos[idx] = INVALID_MFN;
+            return;
+        }
+    }
+
+    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
+           mfn_x(gmfn));
+    BUG();
+}
+
+mfn_t oos_snapshot_lookup(struct domain *d, mfn_t gmfn)
+{
+    int idx;
+    mfn_t *oos;
+    mfn_t *oos_snapshot;
+    struct vcpu *v;
+
+    for_each_vcpu(d, v)
+    {
+        oos = v->arch.paging.shadow.oos;
+        oos_snapshot = v->arch.paging.shadow.oos_snapshot;
+        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
+        if ( !mfn_eq(oos[idx], gmfn) )
+            idx = (idx + 1) % SHADOW_OOS_PAGES;
+        if ( mfn_eq(oos[idx], gmfn) )
+        {
+            return oos_snapshot[idx];
+        }
+    }
+
+    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
+           mfn_x(gmfn));
+    BUG();
+}
+
+/* Pull a single guest page back into sync */
+void sh_resync(struct domain *d, mfn_t gmfn)
+{
+    int idx;
+    mfn_t *oos;
+    mfn_t *oos_snapshot;
+    struct oos_fixup *oos_fixup;
+    struct vcpu *v;
+
+    for_each_vcpu(d, v)
+    {
+        oos = v->arch.paging.shadow.oos;
+        oos_fixup = v->arch.paging.shadow.oos_fixup;
+        oos_snapshot = v->arch.paging.shadow.oos_snapshot;
+        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
+        if ( !mfn_eq(oos[idx], gmfn) )
+            idx = (idx + 1) % SHADOW_OOS_PAGES;
+
+        if ( mfn_eq(oos[idx], gmfn) )
+        {
+            _sh_resync(v, gmfn, &oos_fixup[idx], oos_snapshot[idx]);
+            oos[idx] = INVALID_MFN;
+            return;
+        }
+    }
+
+    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
+           mfn_x(gmfn));
+    BUG();
+}
+
+/*
+ * Figure out whether it's definitely safe not to sync this l1 table,
+ * by making a call out to the mode in which that shadow was made.
+ */
+static int sh_skip_sync(struct vcpu *v, mfn_t gl1mfn)
+{
+    struct page_info *pg = mfn_to_page(gl1mfn);
+
+    if ( pg->shadow_flags & SHF_L1_32 )
+        return SHADOW_INTERNAL_NAME(sh_safe_not_to_sync, 2)(v, gl1mfn);
+    else if ( pg->shadow_flags & SHF_L1_PAE )
+        return SHADOW_INTERNAL_NAME(sh_safe_not_to_sync, 3)(v, gl1mfn);
+    else if ( pg->shadow_flags & SHF_L1_64 )
+        return SHADOW_INTERNAL_NAME(sh_safe_not_to_sync, 4)(v, gl1mfn);
+
+    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not shadowed as an l1\n",
+           mfn_x(gl1mfn));
+    BUG();
+}
+
+/*
+ * Pull all out-of-sync pages back into sync.  Pages brought out of sync
+ * on other vcpus are allowed to remain out of sync, but their contents
+ * will be made safe (TLB flush semantics); pages unsynced by this vcpu
+ * are brought back into sync and write-protected.  If skip != 0, we try
+ * to avoid resyncing at all if we think we can get away with it.
+ */
+void sh_resync_all(struct vcpu *v, int skip, int this, int others)
+{
+    int idx;
+    struct vcpu *other;
+    mfn_t *oos = v->arch.paging.shadow.oos;
+    mfn_t *oos_snapshot = v->arch.paging.shadow.oos_snapshot;
+    struct oos_fixup *oos_fixup = v->arch.paging.shadow.oos_fixup;
+
+    SHADOW_PRINTK("%pv\n", v);
+
+    ASSERT(paging_locked_by_me(v->domain));
+
+    if ( !this )
+        goto resync_others;
+
+    /* First: resync all of this vcpu's oos pages */
+    for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
+        if ( !mfn_eq(oos[idx], INVALID_MFN) )
+        {
+            /* Write-protect and sync contents */
+            _sh_resync(v, oos[idx], &oos_fixup[idx], oos_snapshot[idx]);
+            oos[idx] = INVALID_MFN;
+        }
+
+ resync_others:
+    if ( !others )
+        return;
+
+    /* Second: make all *other* vcpus' oos pages safe. */
+    for_each_vcpu(v->domain, other)
+    {
+        if ( v == other )
+            continue;
+
+        oos = other->arch.paging.shadow.oos;
+        oos_fixup = other->arch.paging.shadow.oos_fixup;
+        oos_snapshot = other->arch.paging.shadow.oos_snapshot;
+
+        for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
+        {
+            if ( mfn_eq(oos[idx], INVALID_MFN) )
+                continue;
+
+            if ( skip )
+            {
+                /* Update the shadows and leave the page OOS. */
+                if ( sh_skip_sync(v, oos[idx]) )
+                    continue;
+                trace_resync(TRC_SHADOW_RESYNC_ONLY, oos[idx]);
+                _sh_resync_l1(other, oos[idx], oos_snapshot[idx]);
+            }
+            else
+            {
+                /* Write-protect and sync contents */
+                _sh_resync(other, oos[idx], &oos_fixup[idx], oos_snapshot[idx]);
+                oos[idx] = INVALID_MFN;
+            }
+        }
+    }
+}
+
+/*
+ * Allow a shadowed page to go out of sync. Unsyncs are traced in
+ * multi.c:sh_page_fault()
+ */
+int sh_unsync(struct vcpu *v, mfn_t gmfn)
+{
+    struct page_info *pg;
+
+    ASSERT(paging_locked_by_me(v->domain));
+
+    SHADOW_PRINTK("%pv gmfn=%"PRI_mfn"\n", v, mfn_x(gmfn));
+
+    pg = mfn_to_page(gmfn);
+
+    /*
+     * Guest page must be shadowed *only* as L1 and *only* once when out
+     * of sync.  Also, get out now if it's already out of sync.
+     * Also, can't safely unsync if some vcpus have paging disabled.
+     */
+    if ( (pg->shadow_flags &
+          ((SHF_page_type_mask & ~SHF_L1_ANY) | SHF_out_of_sync)) ||
+         sh_page_has_multiple_shadows(pg) ||
+         !is_hvm_vcpu(v) ||
+         !v->domain->arch.paging.shadow.oos_active )
+        return 0;
+
+    BUILD_BUG_ON(!(typeof(pg->shadow_flags))SHF_out_of_sync);
+    BUILD_BUG_ON(!(typeof(pg->shadow_flags))SHF_oos_may_write);
+
+    pg->shadow_flags |= SHF_out_of_sync|SHF_oos_may_write;
+    oos_hash_add(v, gmfn);
+    perfc_incr(shadow_unsync);
+    TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_UNSYNC);
+    return 1;
+}
+
+#endif /* (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC) */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -439,6 +439,7 @@ int sh_unsync(struct vcpu *v, mfn_t gmfn
 /* Pull an out-of-sync page back into sync. */
 void sh_resync(struct domain *d, mfn_t gmfn);
 
+void oos_hash_remove(struct domain *d, mfn_t gmfn);
 void oos_fixup_add(struct domain *d, mfn_t gmfn, mfn_t smfn, unsigned long off);
 
 /* Pull all out-of-sync shadows back into sync.  If skip != 0, we try
@@ -464,6 +465,7 @@ shadow_sync_other_vcpus(struct vcpu *v)
     sh_resync_all(v, 1 /* skip */, 0 /* this */, 1 /* others */);
 }
 
+void sh_oos_audit(struct domain *d);
 void oos_audit_hash_is_present(struct domain *d, mfn_t gmfn);
 mfn_t oos_snapshot_lookup(struct domain *d, mfn_t gmfn);
 



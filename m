Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF786D65B9
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 16:50:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517909.803893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjhz6-0008IC-FT; Tue, 04 Apr 2023 14:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517909.803893; Tue, 04 Apr 2023 14:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjhz6-0008G7-CV; Tue, 04 Apr 2023 14:50:08 +0000
Received: by outflank-mailman (input) for mailman id 517909;
 Tue, 04 Apr 2023 14:50:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjhz5-0007P6-7w
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 14:50:07 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20619.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc72725c-d2f7-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 16:50:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB9979.eurprd04.prod.outlook.com (2603:10a6:800:1da::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 14:50:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 14:50:02 +0000
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
X-Inumbo-ID: fc72725c-d2f7-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsoDCfEdy+uT5ocgTR3PmCem/D/ChYSS4+J+KKb/WUQSvJ56zE3+pqAMr1WVxA33T+a/TBw9G+pdOo0JxE6a5sOjxjGeofDneGgHGjcbA7cZCUXAgZr0H0W/JsZL2WFnqtmVWGEBD5aq5keMZlBHCdjH8HFVFNaa7fZbqrbQGE3h6VOORr5tFwV9C+Af4moMUMjF91BPm/361n6MzE0Kl6T9J4wxerZIKpmCQFnwZDpTw7m0u4ZX+vtg17lai4Av6PFuBCr++28x3Y9XOF/MVq+yCz6x9mSE4KbZw06uEDSAjlB2luYRYvDuPk/iNcg5hnp9XcfdcfmLTRyhj042QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLZS7zO17fvDUH6j59nF4hxdbd2yaRJuM4XD9fYDp0s=;
 b=FiG57S8EGwSoQrn3Nr3WreXdB5DppEJ0cHrJCyNgh/DtGpmxRKs+FEuhItLjtJWCE/KQuWQdY38OMVylHDSBum10YKjKg5I0LQxbFY5+6dbQBW80V1pV3QaTt+27/ocF5OmEdnHIupOH9zj3mjp2WuRqaBlOor1rTr1i33qPeZUDqljDdFk6i1JtT79HMp/ddyyFU43zgGdD0PecJ3ZwNrd10ZrAaBCjYQvjCL9kUPWt211PUlEInfgN/8wtbxUv6kBF4AHGCq7qIFu+Kmf/tukV7sw4GrwOfq6udTmWoad2qKJ1LdN3yhD5Mt/7TmuuX1dIb3rwLYzKlH/tw/3Myg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLZS7zO17fvDUH6j59nF4hxdbd2yaRJuM4XD9fYDp0s=;
 b=Tm2oAQR0bOwQ9ossvg11iCKg7/BXM42e9VT5HI9KBUcbQe3VbtmoN1cbMYE2ne6SqpI0VapwxZp+rlh5xJwChIEzMPLtSqJf0fcGbKm3L7xWd9zIVl1KGBO/ihpVzH11ZRm7CQvZEH4R4RHkbrcbBMBj7yxzROzoIPWV1xTVvZhhzANybmvuA4wX8lho3+PzjXh6VGPNbN3vnt8JG4Wxk4V+n/2KtEgVsthw+YCBUFgyMowOH0JYA9Y9W9f7l21784fpz3keqm2wC9D9pwzYs7uTq88yMIvu+xe54A1V/xb74PNtq1GlDnzfWB61+wP72t1zU4FnhEeR8vNelMfqAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0c2ddae9-3222-9755-b6e1-35e51410093b@suse.com>
Date: Tue, 4 Apr 2023 16:50:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH 2/9] x86emul: support WRMSRNS
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
In-Reply-To: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB9979:EE_
X-MS-Office365-Filtering-Correlation-Id: 13dd7963-161c-435c-9dc7-08db351bdf05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M9A4e083zpWr9QYF+Aeqriop/HnY/SSzwxalGvEnhx0WKi5etch1CrUHz5c4LHFvF19c/gSJYaMq2nNf6bm80AuyA/XQzGIWv2Ov9weITz1mofohMX0uHVALo2hwlsBCWjoyXI+Y/0waWfMgl9B8Eh0mCOGBJqbVnTvQeJdR7l5W43iAsMnd/zoY1ka4+Hm5FMTOgEyJwkideuGdSMc6Jczb3TdWr3YWNe7C52rGLOdHc/DKIsXJ2koHDbrf5s+9WBNG/2SbPV+HSJN1leWgYyzR0ggbVbs4XmY9+b6ywdts6igoDa4sDREtzOMyo6OunObvZKDZuYCU9T3POjxeGuBTHMzCXve/VRhxN30TqwC+ENN2726PDCd/BglxMdXiABwHVahUnJ6+Y5LpD4OE2wq9L5U7lDyA9CUOwvYFu7+21xcAIxHsEsJUaig76qEWKoKoaO7mUobwORIwaHGqTTY5g1A+gW0n/9GiNgz4SKIL3rC081mAUAq83i7Ct1kc8jO+xqVb2e2NT7z+/3DCjWsxKriFZtt23Pg+OcmwQyDWpOSTWxQ1ixPDtuH+ouBHzoQhw69g1CzUTk7KkFdnKk0ofNrz91cyR5lpkUmkynAfEYBgx0f5pu3fPO1QyCJ+AFvjVlWFtgQcXMsVoKdwdfqEicnris3TN1FbXpMDrUdGsAK64UB507eX9G7cTn//+5rraKoXCBc9/g/UReho7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(136003)(366004)(39850400004)(451199021)(83380400001)(2616005)(6486002)(6506007)(316002)(6512007)(478600001)(54906003)(2906002)(26005)(186003)(5660300002)(38100700002)(66946007)(66556008)(66476007)(41300700001)(86362001)(8676002)(31696002)(8936002)(6916009)(4326008)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzdwWjZ5ME1DaEdIRkhGTU95L1QyOXlmZDBQV3F6N3ZrK3ZocnRJemI2OEcy?=
 =?utf-8?B?L1lTSnJSYWg5R3dyVDRVWXRWNWN3d1VUSjBkdnlIOEh1cmhhaUhTVzZpQWU3?=
 =?utf-8?B?L3QzQitPNXlMa0d6WXU1cUNlR2h1R21RaStrWk8zNWM4V2hOaDREWlBJL000?=
 =?utf-8?B?eHBIMmIzcWgwVzFXNHlESnMzODRiZElXby9rQXN1UHFnNng5UzBDcHhNL2d4?=
 =?utf-8?B?ZU84c3kxN2xlS3R5V2tocVZpK2M5MXVhWVJjdnJybHQ1ekExM1FKVHNrdzh1?=
 =?utf-8?B?MXZ3SUY4U0w3QUZlejRvcDBmQWp4VVRXRTIwMElqcForYUZPVFN5TGpyaGxQ?=
 =?utf-8?B?UFdzTmpPbWRISGtMRHVYUHZnWXF3cnhwYzVNbHZNbTRlbkx1VkVPYXNTSGhp?=
 =?utf-8?B?VXdWV2NNU1V1QjV6ZHRPL3JwMVA2dkE2UWhrNEFrWHE0Mlhxck5COS9UWGN5?=
 =?utf-8?B?WmRObVZHdnNVa2JBOE1HMldUQ1NIbHN2anM4a21Mb2t6amxEYVp0N0VQSHJH?=
 =?utf-8?B?MWszZ3Q2dXA4R1Y3MXptVVJCVlNaeFc5ZCthYUp5WkxNQWsvN0o1cmhZKzZI?=
 =?utf-8?B?bUMzY1VldWNYdkkycjBZWE5wUUlwYmdkd3RLalVYczZBWGxUSXJTcEsrMlEx?=
 =?utf-8?B?VUxoM1E2RnVCQ1hyOWllb3NSSGI3a1VyVWQ4ZkZaSVV1MlMwOVBKYjJyeDF0?=
 =?utf-8?B?SlFTUm9haElheGkvczZDa29aSU9ucnVnUlc5RHhad1M4cHpwS1V5a3J2RUV1?=
 =?utf-8?B?MGdZdFNZYUc2ZGV6UkJpeTA4ZVNabm9XTFhrdys1b0thYkR0aUJmWVdkZm54?=
 =?utf-8?B?am56RCtqOGpPdUxqdWRIOHZaS01TdGN3YU9VUXcxOHp6Qml2Mi9yejZnUitT?=
 =?utf-8?B?V0JiTExtZGkwS1lNY1lNWnJSTWlRZlVPYWNkbmZNY1YxYmFzZmZvMVRmaGNL?=
 =?utf-8?B?V3RrcjEwdzJlVUpkWTZWS0JtbDVZcUdjL2c3SzB1WWJYT0oxMlRtZStHK0J4?=
 =?utf-8?B?aGEzOVIrT0pwdTVXdi93ckh2dlZBbVNJMGt6aEZzUjZzYkxvU0NXUjZsT29I?=
 =?utf-8?B?Mk5ISC8rcEIycXhNWmllakJqbFZ5ZEFjNGM0WURQV3pObGtTNkkzZXMvVmJ1?=
 =?utf-8?B?T1VhcFFySjg3Y0xjWGYrOW9lTlFjRFB6R2lSWWZhS2hwZ08rRkNXNDlsQ3lw?=
 =?utf-8?B?SnZISFN5djZRcFE1RkhsNmwzeE1rZTZwTFRENWdOZzNOTVRzZjVGaDJzTTBV?=
 =?utf-8?B?bktRdEI5VTViQXdVT3AzK0dNOEJiMUZOUEpyTFg2OFNPR0dOYzZkdlF2TFJU?=
 =?utf-8?B?ZGZraEtvQ1Z3YTU3aUR3cThnbGFWdnN1bm11VmdMclBNSWtPWmJRMmV2SmZW?=
 =?utf-8?B?QW5PRGYzeXlJbWFjbXhsOVB5NjJmMFdndDJtQUhZcUU5MXRXbTJ1WFBBdUp5?=
 =?utf-8?B?ZzVUOGp6RGFrclk5Mjgya21oY0pTRzRkUDRUSWI4U1ZuWWtsbWVkZ242MUdH?=
 =?utf-8?B?eEk1VXFhaXJ6Z0lXTWNYU0FlNWFIV3JpditFMTJHc1FvTjlsbVhUaUxpV0Fj?=
 =?utf-8?B?NE5GS1VJTGpFM3RwV2VmOE1CWWlrWDdsQklKdTZyYit1SGFtZWI2eFlXR0RH?=
 =?utf-8?B?TG1EVUVCTXM4UVlGZ1AwUmxuOVplVTZ0cEZBOXl0ODFTL3I0dUN5NG9GZXJp?=
 =?utf-8?B?cUhkN090MTRXZkFuT1JpZFgwZkwwOS9wSjFidFN2SGpLZEJuQk0yQjdWZFZR?=
 =?utf-8?B?OGhDd21GV2lNRitXNEEwMEFndk1Uc1c2N2JIVWV5azVFRk1ab2JVL1g2eVJ2?=
 =?utf-8?B?ZjRYVkl2ZHBMdDIxLzBGbVl2clRxQmthTTBsR1hxalp6OWZkby9hSFFBUllD?=
 =?utf-8?B?T2dDZC96TVk4NWlPd1BnSHM5MGhjUmY5UkN1UU12UkY0RDRXOEtEeDZLenhC?=
 =?utf-8?B?WUp5dkdZWG54amhYeFExK1VGbWlMeHpmZ1EwMVJ4MUtETktvQ3JlV2tYa0Er?=
 =?utf-8?B?MHRjUnRsS2ZUdWhIQ3Y0OE9tQlZjMmVJb2hXSmp4QTFkcUR4TW9HZ3NyZ1VW?=
 =?utf-8?B?VVRlc1Q0ZVpaY013SmprY2tBUVlDTnN0dVdKZm5ZMG9oaUhkNXlqRDRaZ21z?=
 =?utf-8?Q?O4NWMfovbM+i2gc0xoMp85nuU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13dd7963-161c-435c-9dc7-08db351bdf05
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 14:50:02.6525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8uza9ILXMWS5UDyR3d1LmgnZyLzIOwLbUR3xRITAJsl4u51eX1GpHZ4sI6hBP0wjyZZfCVEWY0zS5f6/5qq/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9979

This insn differs from WRMSR solely in the lack of serialization. Hence
the code used there can simply be used here as well, plus a feature
check of course. As there's no other infrastructure needed beyond
permitting the insn for PV privileged-op emulation (in particular no
separate new VMEXIT) we can expose the insn to guests right away.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -341,6 +341,7 @@ static const struct {
     /*{ 0x01, 0xc3 }, { 2, 2 }, F, R }, vmresume */
     { { 0x01, 0xc4 }, { 2, 2 }, F, N }, /* vmxoff */
     { { 0x01, 0xc5 }, { 2, 2 }, F, N }, /* pconfig */
+    { { 0x01, 0xc6 }, { 2, 2 }, F, N }, /* wrmsrns */
     { { 0x01, 0xc8 }, { 2, 2 }, F, N }, /* monitor */
     { { 0x01, 0xc9 }, { 2, 2 }, F, N }, /* mwait */
     { { 0x01, 0xca }, { 2, 2 }, F, N }, /* clac */
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -87,6 +87,7 @@ bool emul_test_init(void)
     cp.feat.avx512pf = cp.feat.avx512f;
     cp.feat.rdpid = true;
     cp.feat.lkgs = true;
+    cp.feat.wrmsrns = true;
     cp.extd.clzero = true;
 
     if ( cpu_has_xsave )
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1252,8 +1252,11 @@ static int cf_check validate(
     {
         unsigned int modrm_rm, modrm_reg;
 
-        if ( x86_insn_modrm(state, &modrm_rm, &modrm_reg) != 3 ||
-             (modrm_rm & 7) != 1 )
+        if ( x86_insn_modrm(state, &modrm_rm, &modrm_reg) != 3 )
+            break;
+        if ( (modrm_rm & 7) == 6 && !(modrm_reg & 7) ) /* wrmsrns, {rd,wr}msrlist */
+            return X86EMUL_OKAY;
+        if ( (modrm_rm & 7) != 1 )
             break;
         switch ( modrm_reg & 7 )
         {
--- a/xen/arch/x86/x86_emulate/0f01.c
+++ b/xen/arch/x86/x86_emulate/0f01.c
@@ -43,6 +43,20 @@ int x86emul_0f01(struct x86_emulate_stat
         struct segment_register sreg;
         uint64_t msr_val;
 
+    case 0xc6:
+        switch ( s->vex.pfx )
+        {
+        case vex_none: /* wrmsrns */
+            vcpu_must_have(wrmsrns);
+            generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
+            fail_if(!ops->write_msr);
+            rc = ops->write_msr(regs->ecx,
+                                ((uint64_t)regs->r(dx) << 32) | regs->eax,
+                                ctxt);
+            goto done;
+        }
+        generate_exception(X86_EXC_UD);
+
     case 0xca: /* clac */
     case 0xcb: /* stac */
         vcpu_must_have(smap);
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -595,6 +595,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
 #define vcpu_has_lkgs()        (ctxt->cpuid->feat.lkgs)
+#define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
 
 #define vcpu_must_have(feat) \
     generate_exception_if(!vcpu_has_##feat(), X86_EXC_UD)
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -283,7 +283,7 @@ XEN_CPUFEATURE(FSRS,         10*32+11) /
 XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
 XEN_CPUFEATURE(FRED,         10*32+17) /*   Flexible Return and Event Delivery */
 XEN_CPUFEATURE(LKGS,         10*32+18) /*S  Load Kernel GS Base */
-XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*   WRMSR Non-Serialising */
+XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*A  WRMSR Non-Serialising */
 
 /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
 XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A396E67B5D7
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 16:25:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484415.750981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKheg-0008RM-9l; Wed, 25 Jan 2023 15:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484415.750981; Wed, 25 Jan 2023 15:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKheg-0008PP-6A; Wed, 25 Jan 2023 15:25:42 +0000
Received: by outflank-mailman (input) for mailman id 484415;
 Wed, 25 Jan 2023 15:25:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8YOW=5W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKhee-0008PB-Hv
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 15:25:40 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2081.outbound.protection.outlook.com [40.107.7.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8502e035-9cc4-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 16:25:38 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9347.eurprd04.prod.outlook.com (2603:10a6:10:357::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 15:25:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 15:25:35 +0000
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
X-Inumbo-ID: 8502e035-9cc4-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkuE97FeZo59IOmaaHsSq4mfi/WArXPGMEinoOkarGnJwby13ZVTCO4+zLZKMgF/AyUFn5TkbBW4j0Ge4DpeB1w5mGAGk6kHZrNd/RQl7+P+hnSNOZZJIWJmoGDWU27IStLQA/+hjT6T2PPB2Q8AVpjU670qyJbuvH7gBF0OPx22/sfpNapjwgK/+JRISL8Lm55rDZ6TJERTpL8D6hykfuGe1Bwb0OmlhaWb/QzoaoDJMCTfWbM0LCt/aOUI94Wbr+D7ejnhJbiNmF7Vd7sj7WWD+Gbvb8iI9gzebI1tCv1JDtqqnm5ycSv2abjMbMCeHxLNv0G2sfCvVMXc2u3q1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQJ5ptgo3DhG6hsOaqhb2+eXMCyhMWsjUMcGzP04kEI=;
 b=mcipZiIfxvBrt4hAo29yT6UYstrj+54BmDs+86z2G1Crd3QSPg9hqdFcgYmlS6ZNBydpYwJDQqxBCbWv5LUuZ7MTK77dDG6PGpEqLeanPFiNVBYGI+oNUEjyBFz8tZ/VGU0j1vc868nejjNVIb4lG07azHDkxUqTSEu4M76uoQyx9xMNcs8OtpLFn+LOgWLu+XThUPhao7LevthNXGMSF1GQqZFyVuq9HBa3lhZ5bwirCkyTeVDby8OWF0YZyESrVPwxG8CpK2irQcegR5f/fhpxeKTGq/ZzE12Ske38auVSLFronW4sFv57vq/gNUqFFkyg5Cb7vmxFcUNr7GAuEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQJ5ptgo3DhG6hsOaqhb2+eXMCyhMWsjUMcGzP04kEI=;
 b=cWXtqxdk7ma7soXxvW5AnuwyYDfvH27WtAs/Vp+qhbJ6iNMujCv3q87Cgkno2DouWNJktEFs9qERw+9LMa8cE25oKSZ2qFd8Pw/yQu6fl0ITNsQ6OjBcdnyGaEr5OUDM+DDHb+j3degGkUS1p/2nKNXBanXkw4BJ9AzqOzpmrql12PkUUy0yJJ9qTnty2a+14o9NGQJFJq22K5YtQ9K6Yhs/+AyljhnusjVLxUG+i4/I0wrHkovRvsATP+7vv1F5gPd2BWBZ/YNVVzBNbCKczCdM4YQwvn9dxEUXtjdXZuKL/Wd6s3AB75+p/TmupEhGeFEYK5/VM2Zs84q8dDyf4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8ee98cc0-21d3-100a-ffcc-37cd466e7761@suse.com>
Date: Wed, 25 Jan 2023 16:25:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v3 1/4] x86/spec-ctrl: add logic to issue IBPB on exit to
 guest
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <930254a6-d0c8-4910-982a-bfd227187240@suse.com>
In-Reply-To: <930254a6-d0c8-4910-982a-bfd227187240@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9347:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bdc3063-2c0e-47b2-e53d-08dafee867f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OdJsSHxnVG0lQv9L5ANexYP3pT4K4EC/c9HG1f3JXC5Cl4p0xpXgyj3RIpZ+o+/A1qCPZvSlDD1OEvwvqxmy+2YtqyqKZhc+xfWM4cURNnF4lWBPG2NaB5hENGEkdz+FyFUiavBFN/53hqM8T3tc//GlLQ2ST9KRqgFQWzhfQL6utxrwdt9gzh3WRXoHgKYXcW75VuzVngiwM3JWjpAb0yVapK2H1ynq7xCVH0T9ICbfqsovJQ6OWBEdomLHwo8mnZRmJ9mOZpkKeEODbZlXbczB8XUHZWJcdH8YKysEyoA+1ZIPpL1NfU5Q4U+XfuY82vZbK44pEQeefMNL1n7H11+U6OuI0VuVoxYin/Ud0VGvJrJwDNRXBSqEv23Ho1xMFHgaSn5BHCmjQOTM4XbJT6rDDh4wFbTdTFoJ1oLDuVKhE8NWZo02z6Qj2CSR0g1793OeyRnQhUk3K2znzWFcHt4T9RhYptawp8nATu8TsZMki91MQgMQ1PsXKxmLvU8/JpsmaXgRH5w/WW8yXklCEzsa1sCg8R+qwdGSNONIU8hhiLwduGKJ7ZTUVsrw+MyyM2jxiT6Wjuk31cTmZ9/o49kn3YSfa3H6X+2m06p2eKSzytbAqLwM+PGR3BdMkzH8tdV86KyvKIyPG2RwK1OayXxdRZNQvE/Y8l2AbsY93UzOmPk2Tmbl1lCH8XBTYSGPhfeYoAPjv0XoLrfJPqNEbIne23RXtYxDaoGfGEtZJfc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(136003)(366004)(396003)(376002)(451199018)(38100700002)(66946007)(36756003)(31696002)(66556008)(478600001)(6486002)(54906003)(31686004)(316002)(66476007)(6916009)(4326008)(8676002)(2906002)(86362001)(6506007)(186003)(26005)(2616005)(83380400001)(41300700001)(8936002)(5660300002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cU00V3ZXMHNTT0prakhqMzhLWjVnZjJjK01oNGh2dXhLOEYrenFvdmdENEg0?=
 =?utf-8?B?NkRBaXN5ZlVLNkFBV1I5TU1UUjRzUFRXTStiTDZxY0ZrMzQycTBhREVLTi9J?=
 =?utf-8?B?RXNzL1Q4NzVTaXlHZzB1VW1md3FiSWpJVElpeXlyVXVkbWxYbUpaOWY4b3lx?=
 =?utf-8?B?bjR6TGxGOXcvckU5dDlnMEpKY1JDeDlheUJnWTE1ZmhYTVM4Q2hibFlLR01L?=
 =?utf-8?B?bVhvazcrSEw3NEU0L2NtSTd0UjhzbitVOUhhVS9RZEgyT21DenM0YlkwR0d3?=
 =?utf-8?B?YUtpUjZCaFp5UTgwRllIaUF0VXdKSFltSnZrKzRwUjFWaHk1ajhyZjlPVzZj?=
 =?utf-8?B?NFhRTldrNTZlVnYwNkpIbTJBSkdHZXRYRnRPQmFCV1FrMHJXZVA0NndCZDN5?=
 =?utf-8?B?RzBmaE5sanZnUERRaFhLbDVHb1hYc0M4eGFmMTFXNThXTkMwRWNNak9TWlgx?=
 =?utf-8?B?dXJIUEt6ekd2M1JhT3lSWGVjaEtPUll1SDRWaGlMZy9DV2M3eWpqSVZuWnN2?=
 =?utf-8?B?RFFUc0YwT0ZINTQ4NDBrcG1JY1pDSjh2SThyRGltSFIxUlEvdmhtWiszZzEy?=
 =?utf-8?B?bzhZMnVNaHoxZXVqSjRoS2RSMUdCRktuQ3B0N0NUenVOMitHNHBwN2szRUlF?=
 =?utf-8?B?YnpDSEllN1c3VVQ3cENabE1wYlB5akpTbTF4SHNYUDJUMzB6WVR0Yk41TjUz?=
 =?utf-8?B?TXMzb0tUeVcvZ2xCRnk0SXovWHJaR3hXZjJZNVZoU1pBeXlwTDBNUkRINEhF?=
 =?utf-8?B?Q2xnMThSQ05raHhoaFlnYW54aHh1VHYrWm9LTFlacWhCZkdybGV2ZjgwSGNS?=
 =?utf-8?B?eFZqakxEMkpXOVNzTmx4Z1RyT2VldWo1ajZIMjFDZG14bFF0eHpyWXFnSjhv?=
 =?utf-8?B?S0JKdXhwenVuQyszVUwxS25EYjJwVU1KZ25STE1BSXQwNHROT3phei8rN1p1?=
 =?utf-8?B?RDc2b2pqWmc5bDRIMzgzUlVnWFhBbUg2Y0svTi9XRkljenhyYjJDb3F0cThp?=
 =?utf-8?B?c1VaVFhEWU5lLzRuWDcwaEQ1TGFlZXF4NnIwRjJ5b0lxbHJyTHJLYXo2VGFu?=
 =?utf-8?B?dlFBTXZnVFdQOERCTmRHcHVLVG84MnhrbC9vbU9pb3dhNzNadGNRc3ZIVXdo?=
 =?utf-8?B?WHFOQlBReitSbVFPY05uejlwM240MlBvS3o2eEV5dHBuK2Y4R0ZHWFRBZmNT?=
 =?utf-8?B?SXdVZENLWWI4UGNXM0hCYjgrOUgyREptM0RSR1VBSDJ4RjlQb0ZJdlFTUXdr?=
 =?utf-8?B?YndqODc1ODF5bVk0WE5yc1RIWjRnczJLNjVldXZuTUNGUkVCdUl1cTVNWkh0?=
 =?utf-8?B?bkl2SFFyL2VoS3pEU0V2U2pMREtPaVBCQ1Z5bGR1VG5WN2xkbGVxay9Kays4?=
 =?utf-8?B?RDFxbmxRMXh1YVZHRXFhcERSL0ZxTVpaWGpqb0FCNmlwQXBrZTBjUUswTDND?=
 =?utf-8?B?OG9ZRHQ2emUyVStEbDBBTlI1OEMzZDlZRlJNT1RnWUhDa0U4dnJDSUR6TXZM?=
 =?utf-8?B?RTdRL2FxV2syeHAxcG8rQzZrK0E1bC8zU0lraWlEYXJvSm50NitZTHFIWUlo?=
 =?utf-8?B?bG04N2lLZW4wZlhFeGZNWnhITmIzWTZWUTF3bWxrVGNXQjZPbHF1cXUzSWdu?=
 =?utf-8?B?Yzl2eloxV0JZNWg5cjlRT0V5MFJuWnFjZHYzUDFMQlp5dXRhdlJTdUovbldy?=
 =?utf-8?B?U21MUHVlRjlhbWF6YlVJZDJBRzJjbkx1cjk2RG12VzMzdlI0UytCQzVwbW9Q?=
 =?utf-8?B?SFJIbUJLc1p2VXpVYmpGVnIzN21hZHlxQy93akJVdjFjdkgybTFoVEdKM25R?=
 =?utf-8?B?d0N1MzlxdVZ4MmgvbmljaExURm9ReWFSbmVRNFpnOFpmQXZ6RlpwcXBveUpV?=
 =?utf-8?B?Ris5dStqWXM1eWpVQytJK1pPNVdhVDdSQTBTdnBIYWlueUFZYmFuWkFVNURV?=
 =?utf-8?B?eHEvL00zeUdmMFVLTit3VTZZUGNwMk1zTDJwUGFnZkNVRml3V3dsZ0ZNT3VK?=
 =?utf-8?B?aFdSRUZ2R0lsRDRhOXdQUlF2WlBsVEpseE9LTTJxUk91SmpyRCt6ckVnVkVG?=
 =?utf-8?B?UHNOR2dwQTk4YnVudlVOOFVOWndRcHQ3eFZHUU4vL0FUcFJvRzEwWWhJRzVC?=
 =?utf-8?Q?K1LWwO54gPWXPZWW92YBDeoTl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bdc3063-2c0e-47b2-e53d-08dafee867f8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 15:25:35.8297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vASHap+7b0xjNm+kcg8lgg9XU6B3vL4Ygt9XYF68WfkO1Xc/nobvhvlcBGqCM6dUjPjYrPYPYdnt/dtBKIduA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9347

In order to be able to defer the context switch IBPB to the last
possible point, add logic to the exit-to-guest paths to issue the
barrier there, including the "IBPB doesn't flush the RSB/RAS"
workaround. Since alternatives, for now at least, can't nest, emit JMP
to skip past both constructs where both are needed. This may be more
efficient anyway, as the sequence of NOPs is pretty long.

LFENCEs are omitted - for HVM a VM entry is immanent, which already
elsewhere we deem sufficiently serializing an event. For 32-bit PV
we're going through IRET, which ought to be good enough as well. While
64-bit PV may use SYSRET, there are several more conditional branches
there which are all unprotected.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I have to admit that I'm not really certain about the placement of the
IBPB wrt the MSR_SPEC_CTRL writes. For now I've simply used "opposite of
entry".

Since we're going to run out of SCF_* bits soon and since the new flag
is meaningful only in struct cpu_info's spec_ctrl_flags, we could choose
to widen that field to 16 bits right away and then use bit 8 (or higher)
for the purpose here.
---
v3: New.

--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -75,6 +75,12 @@ __UNLIKELY_END(nsvm_hap)
         .endm
         ALTERNATIVE "", svm_vmentry_spec_ctrl, X86_FEATURE_SC_MSR_HVM
 
+        ALTERNATIVE "jmp 2f", __stringify(DO_SPEC_CTRL_EXIT_IBPB disp=(2f-1f)), \
+                    X86_FEATURE_IBPB_EXIT_HVM
+1:
+        ALTERNATIVE "", DO_OVERWRITE_RSB, X86_BUG_IBPB_NO_RET
+2:
+
         pop  %r15
         pop  %r14
         pop  %r13
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -86,7 +86,8 @@ UNLIKELY_END(realmode)
         jz .Lvmx_vmentry_restart
 
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
-        /* SPEC_CTRL_EXIT_TO_VMX   Req: %rsp=regs/cpuinfo              Clob:    */
+        /* SPEC_CTRL_EXIT_TO_VMX   Req: %rsp=regs/cpuinfo              Clob: acd */
+        ALTERNATIVE "", DO_SPEC_CTRL_EXIT_IBPB, X86_FEATURE_IBPB_EXIT_HVM
         DO_SPEC_CTRL_COND_VERW
 
         mov  VCPU_hvm_guest_cr2(%rbx),%rax
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -39,8 +39,10 @@ XEN_CPUFEATURE(XEN_LBR,           X86_SY
 XEN_CPUFEATURE(SC_VERW_IDLE,      X86_SYNTH(25)) /* VERW used by Xen for idle */
 XEN_CPUFEATURE(XEN_SHSTK,         X86_SYNTH(26)) /* Xen uses CET Shadow Stacks */
 XEN_CPUFEATURE(XEN_IBT,           X86_SYNTH(27)) /* Xen uses CET Indirect Branch Tracking */
-XEN_CPUFEATURE(IBPB_ENTRY_PV,     X86_SYNTH(28)) /* MSR_PRED_CMD used by Xen for PV */
-XEN_CPUFEATURE(IBPB_ENTRY_HVM,    X86_SYNTH(29)) /* MSR_PRED_CMD used by Xen for HVM */
+XEN_CPUFEATURE(IBPB_ENTRY_PV,     X86_SYNTH(28)) /* MSR_PRED_CMD used by Xen when entered from PV */
+XEN_CPUFEATURE(IBPB_ENTRY_HVM,    X86_SYNTH(29)) /* MSR_PRED_CMD used by Xen when entered from HVM */
+XEN_CPUFEATURE(IBPB_EXIT_PV,      X86_SYNTH(30)) /* MSR_PRED_CMD used by Xen when exiting to PV */
+XEN_CPUFEATURE(IBPB_EXIT_HVM,     X86_SYNTH(31)) /* MSR_PRED_CMD used by Xen when exiting to HVM */
 
 /* Bug words follow the synthetic words. */
 #define X86_NR_BUG 1
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -55,9 +55,13 @@ struct cpu_info {
 
     /* See asm/spec_ctrl_asm.h for usage. */
     unsigned int shadow_spec_ctrl;
+    /*
+     * spec_ctrl_flags can be accessed as a 32-bit entity and hence needs
+     * placing suitably.
+     */
+    uint8_t      spec_ctrl_flags;
     uint8_t      xen_spec_ctrl;
     uint8_t      last_spec_ctrl;
-    uint8_t      spec_ctrl_flags;
 
     /*
      * The following field controls copying of the L4 page table of 64-bit
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -36,6 +36,8 @@
 #define SCF_verw       (1 << 3)
 #define SCF_ist_ibpb   (1 << 4)
 #define SCF_entry_ibpb (1 << 5)
+#define SCF_exit_ibpb_bit 6
+#define SCF_exit_ibpb  (1 << SCF_exit_ibpb_bit)
 
 /*
  * The IST paths (NMI/#MC) can interrupt any arbitrary context.  Some
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -117,6 +117,27 @@
 .L\@_done:
 .endm
 
+.macro DO_SPEC_CTRL_EXIT_IBPB disp=0
+/*
+ * Requires %rsp=regs
+ * Clobbers %rax, %rcx, %rdx
+ *
+ * Conditionally issue IBPB if SCF_exit_ibpb is active.  The macro invocation
+ * may be followed by X86_BUG_IBPB_NO_RET workaround code.  The "disp" argument
+ * is to allow invocation sites to pass in the extra amount of code which needs
+ * skipping in case no action is necessary.
+ *
+ * The flag is a "one-shot" indicator, so it is being cleared at the same time.
+ */
+    btrl    $SCF_exit_ibpb_bit, CPUINFO_spec_ctrl_flags(%rsp)
+    jnc     .L\@_skip + (\disp)
+    mov     $MSR_PRED_CMD, %ecx
+    mov     $PRED_CMD_IBPB, %eax
+    xor     %edx, %edx
+    wrmsr
+.L\@_skip:
+.endm
+
 .macro DO_OVERWRITE_RSB tmp=rax
 /*
  * Requires nothing
@@ -272,6 +293,14 @@
 #define SPEC_CTRL_EXIT_TO_PV                                            \
     ALTERNATIVE "",                                                     \
         DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_PV;              \
+    ALTERNATIVE __stringify(jmp PASTE(.Lscexitpv_done, __LINE__)),      \
+        __stringify(DO_SPEC_CTRL_EXIT_IBPB                              \
+                    disp=(PASTE(.Lscexitpv_done, __LINE__) -            \
+                          PASTE(.Lscexitpv_rsb, __LINE__))),            \
+        X86_FEATURE_IBPB_EXIT_PV;                                       \
+PASTE(.Lscexitpv_rsb, __LINE__):                                        \
+    ALTERNATIVE "", DO_OVERWRITE_RSB, X86_BUG_IBPB_NO_RET;              \
+PASTE(.Lscexitpv_done, __LINE__):                                       \
     DO_SPEC_CTRL_COND_VERW
 
 /*
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -8,6 +8,7 @@
 #include <asm/page.h>
 #include <asm/processor.h>
 #include <asm/desc.h>
+#include <xen/lib.h>
 #include <public/xen.h>
 #include <irq_vectors.h>
 
@@ -156,7 +157,7 @@ ENTRY(compat_restore_all_guest)
         mov VCPUMSR_spec_ctrl_raw(%rax), %eax
 
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
-        SPEC_CTRL_EXIT_TO_PV    /* Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
+        SPEC_CTRL_EXIT_TO_PV    /* Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: acd */
 
         RESTORE_ALL adj=8 compat=1
 .Lft0:  iretq
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -9,6 +9,7 @@
 #include <asm/asm_defns.h>
 #include <asm/page.h>
 #include <asm/processor.h>
+#include <xen/lib.h>
 #include <public/xen.h>
 #include <irq_vectors.h>
 
@@ -187,7 +188,7 @@ restore_all_guest:
         mov   %r15d, %eax
 
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
-        SPEC_CTRL_EXIT_TO_PV    /* Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
+        SPEC_CTRL_EXIT_TO_PV    /* Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: acd */
 
         RESTORE_ALL
         testw $TRAP_syscall,4(%rsp)



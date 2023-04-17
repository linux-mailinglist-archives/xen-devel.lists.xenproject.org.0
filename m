Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0156E4794
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 14:23:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522047.811188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poNt5-0003gG-2J; Mon, 17 Apr 2023 12:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522047.811188; Mon, 17 Apr 2023 12:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poNt4-0003dB-VE; Mon, 17 Apr 2023 12:23:14 +0000
Received: by outflank-mailman (input) for mailman id 522047;
 Mon, 17 Apr 2023 12:23:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poNt4-0003d2-2B
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 12:23:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20629.outbound.protection.outlook.com
 [2a01:111:f400:7d00::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9eff3954-dd1a-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 14:23:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9203.eurprd04.prod.outlook.com (2603:10a6:102:222::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 12:23:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 12:23:10 +0000
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
X-Inumbo-ID: 9eff3954-dd1a-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GvpLhi4pyV8hQ4j5kz7PtvVAmo7RpMOfkTwbM0gl1ZN8N/Sx8Q705nuQdnQ9H+QBuW7BYFu3xWt+U2yUWjQFZ5PmzQ+xI5nfU1dfq3KhlJT+/WwjtR3wpkKFYYckJG3FJrG8IZqEf+Qkjs2lb3cGhkQIRWu6oobFgIoUD6BAjKfSPLT9L+6t80tJ2YXyFcqsFMreVaRGhYywKgZmJypyvCrtArHXLiFwe4OqsRNHehlkinAjLpF+lr2AewEG/uDdhDQed/7S+cy92ueBQdFkQ2Edv5ALTztcn6rra5sfTHXXbttGmeFQG6anhPdkIth7pYiSdNHC9DCUTG15E6tShQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MDRsRSp2EhX9RYEDn8zJnZs0T2Su6y3I5rhe+9sQRg=;
 b=hul+Q6xRx4IlInfqQZ1AJatsh/vESFLDPYPOp3wlWA4sGhVzH0ynf7wNa+idlMXpqtSDPF+ff6f/mjSkYf6zeVR7mDY4dmuA1n1YyaE9rIICTRtMWwSc6i0sr5XlpuavLuUQp4fCpdiBsgu7nL4ja1mp0ZEYZYHfDMJ6R1l4ISoO3d0zcYMW8CrBeWVW9s+yEliRSOJiey2rLTVZkCg9qJmnAbbargHblvRVGvUw7gt8QT3H+lkJMnHf169LRaapkZAFSgWAIhNdyKr/3woIE7Hl5cDIHh0hfoXsB7mkx2YTdPrXsaDb6Ydd7Y0WokPJKfGN44K2bGs4HV46+/Dcrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MDRsRSp2EhX9RYEDn8zJnZs0T2Su6y3I5rhe+9sQRg=;
 b=UxqK6wqMmx9aFSJPUddGqXjHMmw5CZtM53EJbXpo1bOCrijAeRaEN+TfvAIcPSYSIG0Dn2rkEv1ehmTKu7jnsbj0yjRS7AHrGA8ZPr/KK08fALcFyIiv6hWabHLJAfPLXN//HFfPbKJSkgkr6zQxMw+NlmqzFYXQJKXMiTJgiuh2KlrMlccxt5hnPp23GaR4xRmtdjSbqu6geBd18GD9Yp8XqqE7TkB/TMDfZ6eo3lIRXs9/PSmwE+sr7FcnLLH+a/FAuYBDr2kPOTaydg0P/TD/oHyBt8CquMFtGxcpV+LgsN0m/PeEZZiu5pJy1qnjDqAoyovGMRACAqe9xG+cjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a056a258-51c0-2721-1ef2-1e7796c85659@suse.com>
Date: Mon, 17 Apr 2023 14:23:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86emul: avoid triggering event related assertions
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9203:EE_
X-MS-Office365-Filtering-Correlation-Id: f8b57309-4107-4807-245f-08db3f3e81b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d+N1tjEJNsAA+rCmzz4WN4v/WwwGo7Q7OLqw+gi8F4drXfDWv4LPvs7ZcYvW9gDuuRglgMjn8huSBknOAd/tzkGbKBRCI8zog0ao8bL6ePrAxliE8iQt59/nXYXm5ATJOD1//9YM3/UUPwczwPfklq7X2DBD9MX1A9O9xx3HTDFMSq57fGNf8DllAbobU7NX9oDcxD9VNTElMiuepotizdXDoIujZ3ZFM4Fab+k/zEQehY1RGrIJskqnqjWOYwuzv/CcTxV1btVxF7A/ev2cbEbRUybLpRue0kcHs2QmDI9XIEDrTD4NqCHug4efe93VT3SMZiCYDLwLpo33okh4WSbdbag6J9ynfDXlq5hQOWgRi/1DBSmW35Rtd/2ay/hSq4oh6WDlaBbSwFyIODs8SICS3ifevM1WHUWkvTXgaRg6OZwoF9zEKUbvUbcccmGcHUX2KDfdhbyUhOSCOkDjq/d4KoYX97OxQYZzcSY+RTa9pl1RGuKdEwEp50zyfzs3SDqjJwmtuH2AUVCimXi3ulSHJZO9uY+kIrpWWRXQd+aiN+X0Oi7fCpuGTeCZrm+yCqnotDZMA+pbGUeDwcU6HsRPOrdr2l1G9BMm9rGxKk7VVwXNqIg/xhHKTq9KFjyhcJMfWqU2q6v2L3zlscFwwA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(39860400002)(396003)(366004)(376002)(451199021)(38100700002)(8676002)(8936002)(5660300002)(2906002)(36756003)(86362001)(31696002)(478600001)(6486002)(54906003)(31686004)(186003)(2616005)(26005)(6506007)(6512007)(66946007)(66476007)(83380400001)(316002)(41300700001)(4326008)(6916009)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUZtNmZLdVI4dUhkbVV5MWZ3Ty92SUVCMmNHNmRaRXpzNGRPNzFpM25jbDVv?=
 =?utf-8?B?d1FmbC9NbndhOGliQ1ZvNXIvSmNDaXYzSHp6cjM5NHA4akpIWmdRcGRXRi9w?=
 =?utf-8?B?VVV5M00rWmZ3S3dPcjJhY0txcHFuUE1YREE5a2l2UmZCNUpkTC81Mlpwc3Zw?=
 =?utf-8?B?MTkzZThIQVBWcnZXWkhQbDVSNUFialplUkZRUGVOdkc1cmd6clNicmlVanlo?=
 =?utf-8?B?RmZWSnRQQ2dod0xJckw4Z1lKMEdFdzIweWpOOTFDcEJSVm0yRmorVHJzbDJr?=
 =?utf-8?B?MTJ4OVhYeHJWSDErSWpyeVFHVnczbVVsUUFLZEQxVGdsTkxzSGIwRzcvWnFS?=
 =?utf-8?B?MEhaMzdTZ1ExSEMwWWtRUzhwNnlXUFk4L2dvNHQ4d21tRTVLY3pNbk14R2h3?=
 =?utf-8?B?eFBRUFB0Z0tkdW1nNksxRi9wc3Rhb29Yc2JLZGU4TzcvSHU4QlNFYUFrOHBF?=
 =?utf-8?B?UXQxM0E4ZDR2U1VjRVFkd0Z5VzAwaFVQdlVleGxEOEcwOXoya2dQeDdtNXVB?=
 =?utf-8?B?K1luWWkzVFBVTE13NmtVNkJMSm16bVFublQ1SldQTi9lRU0xL3BxYUlQQ0Z2?=
 =?utf-8?B?M3RLUFBqakppTXNpa1g1NGI0S21hRCs2WWM3WGZzS04ybXJ4a3FuWjI1NXQ5?=
 =?utf-8?B?NXFpNW1maG1NckxPdUtpOUcybGpzSHlTc1dwWjZ5ZjBDUURDN1o1SWtSUGRQ?=
 =?utf-8?B?UzV2aGh4UnJlRi82MkRrbllxY0pXblREeW1KMzRTSUcvZVExZldHakJtN0VS?=
 =?utf-8?B?VXBveHB2QUtSRGtmb29rSC9wV1NqczFlNEJVTUhyd2t5ejY2VWxySDFocGlS?=
 =?utf-8?B?YklmKzNLaXFoSWJxbXdCNXdQaUJFMnRydmhVNnhMMjdLaEx3QmZpM1FVemFK?=
 =?utf-8?B?b2VIMkFFVFlzbDNJWFpBd1dYaTJtRWh2elluaDJoUm1oelN6bmFIUUE2KzhP?=
 =?utf-8?B?U3BiNUpEalBsOHBhQ1ptaHgyY2NHSnltTERsY2owZTBmem1YakxHVzU0c3Z2?=
 =?utf-8?B?Vk9Uc0JGbExpaXhsRzZpSDQ3N1F6dTR4Z1dTVVlsSUc0cVFSZlJ5VWRjTDZD?=
 =?utf-8?B?MEQwOWZvVSs1UGExOTFJNlBoR2wwdFhka2lPMSswZDN0ck10bGMvdTlnNHB5?=
 =?utf-8?B?Z2l6MDNpd3JZdWhESnZqNTFmZStEbmdZMTdZMmppLzJIWWdLaU5ta0U0UnNq?=
 =?utf-8?B?VWQ3N1VXdGU3dVF0enMyKzZKQnM2VGJqNWs4cHJVcm4za0tRbloxWU1rcFli?=
 =?utf-8?B?d0VNckg3aG5TN2R4a2hSdnAraW0yVFowampiYnFDNkZVdFRZdmlnaHIxRnA0?=
 =?utf-8?B?VmVPRHk0dGh5MHRDUTZRZ0dQL3UwZXQvQXgvOXZNTXpOclc3dytiZXNwMlNR?=
 =?utf-8?B?NFJBY25hMjJPNlpDelpCTyt5Y1NiRVhqek5RN2tWRFVLUU90NDBpUlBiSk1K?=
 =?utf-8?B?M2NaZCt2VTdHRktDcWlEcWN3RmFCckwvbzJFekNabTdCRTlTbm5yYmxNaVpS?=
 =?utf-8?B?RWtKQTNnQXRBYUo4bmhhWFpGZ1Y5Q2F0SHBRdlRjWUZZVC9aaW1Obk9ic2lC?=
 =?utf-8?B?TDVnSEZ2Yml1MzltWUpjOGFydTdmS09ncmw4ZmpTcHFCYXFXYjJXVW5QUGlV?=
 =?utf-8?B?M2Uyem1SM2dtQ1hHTDZKTjNQME5HWlVrOXVqTmdXL0t4RUtkOFZtR2ZwSmtU?=
 =?utf-8?B?MEk3eUlwa21MRVhSQnBqTkhEVzgrMVVNTTVycHpaZHduL3VzTDZ4VjBmRUVP?=
 =?utf-8?B?QXBEclJ6NzVockhKajhua1QwMGtGQXdkQTFyRUZ6MmtTbDVJNW1CN3U2TDhh?=
 =?utf-8?B?dU03dU52RjM0YWwvQ1BkVXk5bThJMXZLN1lVeGNNeEJ3YlI3WHNNNVd0M1lV?=
 =?utf-8?B?d0lBbnptWnBwV0MweW8xM1hha2dLRmdmb210dnlDQkExaTZGWDY5MzVpczRu?=
 =?utf-8?B?NFduUHJVSzN6R1RBaE9peWtEWVdXam01MzhvSUNqaTRPQVVISkhWa0lQRFFY?=
 =?utf-8?B?Ti9JTXUxemRkY3JmWGJKSDhhTzF4YmFnRUozdlIwUitGeml2eVhqMjFtdkFN?=
 =?utf-8?B?dDFBS2Q1UDZMaVpJVUkwUXJLODY5NUF0eFJ6MlN6d1NnTjAxQ3RWYnRNZW9y?=
 =?utf-8?Q?RujD8LMDtv+t1D5iAHe8i+aO/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b57309-4107-4807-245f-08db3f3e81b8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 12:23:10.1533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0UlK7xsY1Yg5F7feleYKlqImkes4HDzbFvF9mWD2tjCitgwiGO1YczCsOqnr7tqBQcHTvIkFRjo9iINi/KM/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9203

The assertion at the end of x86_emulate_wrapper() as well as the ones
in x86_emul_{hw_exception,pagefault}() can trigger if we ignore
X86EMUL_EXCEPTION coming back from certain hook functions. Squash
exceptions when merely probing MSRs, plus on SWAPGS'es "best effort"
error handling path.

In adjust_bnd() add another assertion after the read_xcr(0, ...)
invocation, paralleling the one in x86emul_get_fpu() - XCR0 reads should
never fault when XSAVE is (implicitly) known to be available.

Also update the respective comment in x86_emulate_wrapper().

Fixes: 14a6be89ec04 ("x86emul: correct EFLAGS.TF handling")
Fixes: cb2626c75813 ("x86emul: conditionally clear BNDn for branches")
Fixes: 6eb43fcf8a0b ("x86emul: support SWAPGS")
Reported-by: AFL
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
EFER reads won't fault in any of the handlers we have, so in principle
the respective check could be omitted (and hence has no Fixes: tag).
Thoughts?

The Fixes: tags are for the commits introducing the affected code; I'm
not entirely sure whether the raising of exceptions from hook functions
actually pre-dates them, but even if not the issues were at least latent
ones already before.
---
v2: Also update the respective comment in x86_emulate_wrapper().

--- a/xen/arch/x86/x86_emulate/0f01.c
+++ b/xen/arch/x86/x86_emulate/0f01.c
@@ -200,8 +200,10 @@ int x86emul_0f01(struct x86_emulate_stat
         if ( (rc = ops->write_segment(x86_seg_gs, &sreg,
                                       ctxt)) != X86EMUL_OKAY )
         {
-            /* Best effort unwind (i.e. no error checking). */
-            ops->write_msr(MSR_SHADOW_GS_BASE, msr_val, ctxt);
+            /* Best effort unwind (i.e. no real error checking). */
+            if ( ops->write_msr(MSR_SHADOW_GS_BASE, msr_val,
+                                ctxt) == X86EMUL_EXCEPTION )
+                x86_emul_reset_event(ctxt);
             goto done;
         }
         break;
--- a/xen/arch/x86/x86_emulate/0fae.c
+++ b/xen/arch/x86/x86_emulate/0fae.c
@@ -55,7 +55,10 @@ int x86emul_0fae(struct x86_emulate_stat
                     cr4 = X86_CR4_OSFXSR;
                 if ( !ops->read_msr ||
                      ops->read_msr(MSR_EFER, &msr_val, ctxt) != X86EMUL_OKAY )
+                {
+                    x86_emul_reset_event(ctxt);
                     msr_val = 0;
+                }
                 if ( !(cr4 & X86_CR4_OSFXSR) ||
                      (mode_64bit() && mode_ring0() && (msr_val & EFER_FFXSE)) )
                     s->op_bytes = offsetof(struct x86_fxsr, xmm[0]);
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1143,10 +1143,18 @@ static bool is_branch_step(struct x86_em
                            const struct x86_emulate_ops *ops)
 {
     uint64_t debugctl;
+    int rc = X86EMUL_UNHANDLEABLE;
 
-    return ops->read_msr &&
-           ops->read_msr(MSR_IA32_DEBUGCTLMSR, &debugctl, ctxt) == X86EMUL_OKAY &&
-           (debugctl & IA32_DEBUGCTLMSR_BTF);
+    if ( !ops->read_msr ||
+         (rc = ops->read_msr(MSR_IA32_DEBUGCTLMSR, &debugctl,
+                             ctxt)) != X86EMUL_OKAY )
+    {
+        if ( rc == X86EMUL_EXCEPTION )
+            x86_emul_reset_event(ctxt);
+        debugctl = 0;
+    }
+
+    return debugctl & IA32_DEBUGCTLMSR_BTF;
 }
 
 static void adjust_bnd(struct x86_emulate_ctxt *ctxt,
@@ -1160,13 +1168,21 @@ static void adjust_bnd(struct x86_emulat
 
     if ( !ops->read_xcr || ops->read_xcr(0, &xcr0, ctxt) != X86EMUL_OKAY ||
          !(xcr0 & X86_XCR0_BNDREGS) || !(xcr0 & X86_XCR0_BNDCSR) )
+    {
+        ASSERT(!ctxt->event_pending);
         return;
+    }
 
     if ( !mode_ring0() )
         bndcfg = read_bndcfgu();
     else if ( !ops->read_msr ||
-              ops->read_msr(MSR_IA32_BNDCFGS, &bndcfg, ctxt) != X86EMUL_OKAY )
+              (rc = ops->read_msr(MSR_IA32_BNDCFGS, &bndcfg,
+                                  ctxt)) != X86EMUL_OKAY )
+    {
+        if ( rc == X86EMUL_EXCEPTION )
+            x86_emul_reset_event(ctxt);
         return;
+    }
     if ( (bndcfg & IA32_BNDCFGS_ENABLE) && !(bndcfg & IA32_BNDCFGS_PRESERVE) )
     {
         /*
@@ -8395,7 +8411,9 @@ int x86_emulate_wrapper(
      * An event being pending should exactly match returning
      * X86EMUL_EXCEPTION.  (If this trips, the chances are a codepath has
      * called hvm_inject_hw_exception() rather than using
-     * x86_emul_hw_exception().)
+     * x86_emul_hw_exception(), or the invocation of a hook has caused an
+     * exception to be raised, while the caller was only checking for
+     * success/failure.)
      */
     ASSERT(ctxt->event_pending == (rc == X86EMUL_EXCEPTION));
 


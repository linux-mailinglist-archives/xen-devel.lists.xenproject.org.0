Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCED6D9965
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 16:17:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518903.805902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkQOs-0008CK-C0; Thu, 06 Apr 2023 14:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518903.805902; Thu, 06 Apr 2023 14:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkQOs-00088x-9A; Thu, 06 Apr 2023 14:15:42 +0000
Received: by outflank-mailman (input) for mailman id 518903;
 Thu, 06 Apr 2023 14:15:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pkQOq-00088r-83
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 14:15:40 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20630.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8106c404-d485-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 16:15:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7937.eurprd04.prod.outlook.com (2603:10a6:20b:248::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.26; Thu, 6 Apr
 2023 14:15:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6277.030; Thu, 6 Apr 2023
 14:15:35 +0000
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
X-Inumbo-ID: 8106c404-d485-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sn7gxKHobU4Ut8MWGKwol4LpnWNoQlZU71kdMMIedIPd6AAm6qcsx51LVtUceaLDSuheBy05qW+gdr/kXzq6Cw6UJ7ntQnIN5A5QQP65SHCMbkxzdOZV9whg9qLbLAEnyvAWKVDKqAs58kK72F4z3YtRVCeWhY4LuI/IhmIWVE7yDWS9bIpVyvUErnutNoI0lXrNbnDyKnZufySzxikmsKSITxjSSS+t3MODt2H58PwBVKEz1XncOcdCcgtxJMFfgrBhnSHwzqJQcfAIiB0SVczkQVz2HywSJdP6BApJoCipzQNOb5QdmADr+6oMFOGGEk/jgZI53z9/rulz/JrVGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKDn1HJCVNxFcLW7Fft9AEmNPUbO0XRVtYZ2AEuomUo=;
 b=AKLNwFd5fzybubhcbxeZ0lYFNTO4vlCHCJ1QOvvb7nOCQHLYsdBcYGPdljoWOKNs2zK7gkv2x5v3EEIT/bG7QPbaum0oyulrZaVa1hvq6G04O2EnP231ZfutNWxez2WaxYL8wijSIwAIanHtCF0PlHp5euj/2ETsTe7r6VIqzRJMW+d6uDP9xsRRpsURDBYz50zPx0gifgZzSvCNi1eUlZOSJb9LybKnRSsKnsANKh8IlWA8o4ZiJbzKTnonyO3qKVFllJStWSK29KW9nVmPpDg9t8OwVouoequev9cD/voWOBLZcJQMCTcyHvMWMJzFf8HwuUy8gNWRnsu8UqQNyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKDn1HJCVNxFcLW7Fft9AEmNPUbO0XRVtYZ2AEuomUo=;
 b=kjgxikcBOA1wiZBU+Sj7LW7oQRH2AFd4dte4YDqzGNPt3DysMMd7TSKHCBvcTsrjuDdenLSKC3CPIl/cdhMjMpaI+931z69QaxyElaUBnvD3fiaI1iq3jKvBVnjAlGt9fbyggY7842tyncNnEe0IIOZRuLb/Uzg4WJCNiQ+IYA6rs9CFLOqeobNU3PvXAIJXPujTudwD/jg8vSfk9zcuIY8EDL9nTF2mKa3ReQQ2vjFGpzSEapG/zBD9H4WKzr9wTSZ725CWiWpfd9l3oXG5wkLvAv1eV5xAi2taEakW20jtimgkFhBnvEj0eXZJdpc5DGt7wjmqAQWyOSgWp51nKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e79b3b8e-666e-b94f-d2c8-1ec2f6f5453f@suse.com>
Date: Thu, 6 Apr 2023 16:15:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: avoid triggering event related assertions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: d03a05bf-ad74-47e4-1d0b-08db36a96378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kMZaGK5EFpF/mXW2Sou0hajWda6KfuGcLAjDpPl44lD8W8VoPPpJtGkHqJcIR7uDp5p/sc/Ty5HM8Stoic0S5iLqj/BVbcOlGkCvQqyBIKRNVyLbKnpiI8YdrQKI17PP2XshOBCt193yks+T27Njmnc/1MwiN1ORBXL74TIQz0rsjinPPs8vv8ATrSVGO5RTpqVde0FaTd7zw8ZHvL+hw0XqLlICoaTRGKcIsNrWfCFoLJzR48elNzLViGUj6VI7SWrrcka6RMdnz5l5h2s+Fe+6D/IMmAX/p7uem5oJByx4AksJSji1ouMI62MrcZjqbJAXGcwX4c5ZfR2+LdJMbEGO8GwszAZQ9chhkCAWMw7GHs4k6OTOegtR8jbtPZm0ZABaN0IKUbnjaF4/VN5Zdx3U46z7BYQnVarDCYNGqEwdh66qm9sLLb2JH3sDhrxyo6ga7F36Dbi0pG0d2novdDlO8n7zYJB9Yuic6HuWYvUrYfc8CopTy7uitC0HCLI+XA/vrNojpKLnXjgaOCDUU7U0UD1L6KddXj2QEAG3HTXRnHqCJ8LoRz1zxge5/zW+mgJWy2KgUODKYfRIogzcDcsbm7LWVizz5Mb+FkWw0x4QW4Qf+tnfWPEiXu/+LWXfQV/nw/5sL8AMNznuB9LgsQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(66476007)(66556008)(186003)(6916009)(8676002)(4326008)(54906003)(316002)(86362001)(478600001)(6506007)(6512007)(26005)(6486002)(66946007)(8936002)(38100700002)(5660300002)(2616005)(36756003)(2906002)(31686004)(31696002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nk5ZNmI3Szd0MzZoQklMNk9PMDA2anF1ZWJ6UTR0UUlDOVAvYk9Bd2d4N2JZ?=
 =?utf-8?B?MlUwQ3BXc0lmd21ibzgwdkVwVUR1UE9hT05RSnYvV1MxN3lnWmFBZUEvZ2xr?=
 =?utf-8?B?aVRYa0dEZGdkaXNDVEtMYkpEQ01sRnB1TWxuRUt1UWNZbTJyRnc5Si9OejEw?=
 =?utf-8?B?V3dJWW93UndTK2lWQnNJOU45ZFFqUVF2WWxWa3Nxa3RPWjVlT1lYWEQrQ0pr?=
 =?utf-8?B?NERoM041MllOanN4ckRZT3A5VHNNK1Jia0VsUnpBYUNOdlhMbThJbml0aUor?=
 =?utf-8?B?UnNzeUxTNFJ6cTZ6QlgvWFFVbkJEUndPWEt1UWVkU0RpeWF5clVXSEFFdHFM?=
 =?utf-8?B?aE9GVlUvSG1BZUJaTy9ybzlSM3BSQ1FLNXUvb2RyQmN3cEppVWw1Q2h5eTlr?=
 =?utf-8?B?REdZSE1SV2lMbVNseWtJWEt4ZTdvU3crWllOM3cvMEswZVIwTjN5Zm1PZDNF?=
 =?utf-8?B?RVhRbFE0Qm5kMi9lOWgxNmVRdUg4QXFFUmhzUzVrUnRnZTdma1JaTkkvamx1?=
 =?utf-8?B?TklWVWk4K1FwN0JYRTJwSklZTWkzRE9paTFxRDhNd0w3Y1huVVoySHpDMnpE?=
 =?utf-8?B?bk1sRU1SSThLQkVOOGVIN2NDbWdMWENsSzdhS2VpSjNYZlZpVmJCWTduRHNw?=
 =?utf-8?B?V3FwTk9yVndEcVRlWnZHS3c5YjBDeDVDcVhXZFovWnpNS0c5QVl3R29qZDQ4?=
 =?utf-8?B?Ym16WGt6eEI5bzZwMUZ4enh5UW5QVnVSSzZ5MzRrRjdhQ003L2xIb2RSaVoy?=
 =?utf-8?B?UDl5b2U5STloa0x2MW5zZEV4eGxhQ3hmWnBFRWtaQkhtWk53Uk5seWxKVkln?=
 =?utf-8?B?MzRLOWs1WC84SzhwSktabkFzUG1xTytvcUJwdFVTdWZUODROcFJMMkUrZ2NZ?=
 =?utf-8?B?akNobXMxQkdDQkpEbXBrNTU0V1lZRjYzOVVaM2VUOEdsUlBSUG9CRVpRWXc4?=
 =?utf-8?B?NFpia0xyRm1kQU1RV2czMko3Vzh6VnYveWpsRHpHbHR6VTFQSG5ibVJLSStR?=
 =?utf-8?B?SXZIUFV1VWxTY3VFRlppN1hNTzM1K2xVNXlmL2ZLeWlma21HajRNZmo5WmVS?=
 =?utf-8?B?NTdyVUx6T05BbjRaVEdNa21jZndGMmtRUU1vODhlOFlnK2ZXOFlqZmJTOWFj?=
 =?utf-8?B?Q3puOUtVeUJkSm80RkFxL2ppUzltcXhKSzF2WTM5Y3Rkd25wMWlzQThFR3BJ?=
 =?utf-8?B?SEtKRUNXbGdHYWp5M2pxVGF0KyttZ0pzdnU4L2lnK1gwY3JlWDM0Q2RxWDlN?=
 =?utf-8?B?N3ZhRHZZbk9uVisyVWNjU2xURVpVY3NLMm9RQVluRjIxeC9kTFNIbTBML2Fj?=
 =?utf-8?B?cFplVlJjN052SUhWODF0L0ZLUTI4dmJxZVVZOEVHZXZjZkkzWjB1YitWcWpr?=
 =?utf-8?B?ZVA0Qk9CamJ6Q2J5OVUrdUI4ZEpKU0Y0blNrOEVFcVFId0RtM280VldiVWJy?=
 =?utf-8?B?bjdUS09OOS93TXpYbHpOc2N2cjBTRUZVSUZYOTFhUWhpTjk3NVExNHN2dTRK?=
 =?utf-8?B?a1JqR2xnVSt1a1BCQTRMN1BNdHFVQUZ5OHpiTkpMSlRIM0hhS3gzc2RMN3Bl?=
 =?utf-8?B?d2MrTGJpbXA3SGQ3TU5wSm01eExvQnVDbWNQekt0QVlsY0RtS0tFNk4wQjcr?=
 =?utf-8?B?aXlBejJlUFZ4TnpVbzkvU29DOXZKRE9UWVY0M2N3QTV6dFJwdmY1cjloUjhS?=
 =?utf-8?B?ZXhJN1pFcjFmQmtwV09kM2RYMnNuRmNiaWRHMmxBdEVibmVBOXhVTjA2empS?=
 =?utf-8?B?UkNKeWsrZmVMTkluenR3WWFFejJvOWc1blhqUHM1TVFaZ0xmK3ZsSks2QVpV?=
 =?utf-8?B?em1zZTVWSlZ4WUtycFJaOXNYeDFlN0krWCtiWTNEWmZ0SEg2eFJFQitmaFU1?=
 =?utf-8?B?RG5JN054T1MyN2hOZDcyRU5uQnllN0F4U3NyOStWb2FITHBXRmQ5NTN5bHpJ?=
 =?utf-8?B?eFRBNVhqdHYzMzRKUnI4a1ZJZW5yTG1vdjFvWGFpcVdyVXFuWmNuYmtBMkp5?=
 =?utf-8?B?azRWM2lLQXFsQ2FyOFZoN0lTeXJSQ0VNNnhORTkwdU1yZWNOWVVkOUJhRUpY?=
 =?utf-8?B?cGVrWFNmS3k2U2JmblA5TFd6VW5SYUZlZFRuRWhOMGkvd1JFL2RheFV3OUpq?=
 =?utf-8?Q?w2QqHb21BsaD+P+OO4GBBMgrG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d03a05bf-ad74-47e4-1d0b-08db36a96378
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 14:15:35.2498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QOOChQkCN52JTcS9te/MurkdoyWj9sLm1WRZ2ldaYtE4DuQeV9SKSm049Lwq9tAMmbhIUaMEmm4yNsr/T/B/RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7937

The assertion at the end of x86_emulate_wrapper() as well as the ones
in x86_emul_{hw_exception,pagefault}() can trigger if we ignore
X86EMUL_EXCEPTION coming back from certain hook functions. Squash
exceptions when merely probing MSRs, plus on SWAPGS'es "best effort"
error handling path.

In adjust_bnd() add another assertion after the read_xcr(0, ...)
invocation, paralleling the one in x86emul_get_fpu() - XCR0 reads should
never fault when XSAVE is (implicitly) known to be available.

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

--- a/xen/arch/x86/x86_emulate/0f01.c
+++ b/xen/arch/x86/x86_emulate/0f01.c
@@ -198,8 +198,10 @@ int x86emul_0f01(struct x86_emulate_stat
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
@@ -67,7 +67,10 @@ int x86emul_0fae(struct x86_emulate_stat
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
@@ -1177,10 +1177,18 @@ static bool is_branch_step(struct x86_em
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
@@ -1194,13 +1202,21 @@ static void adjust_bnd(struct x86_emulat
 
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


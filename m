Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45500756600
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 16:14:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564611.882146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLOzE-0002Yk-Jo; Mon, 17 Jul 2023 14:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564611.882146; Mon, 17 Jul 2023 14:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLOzE-0002X5-Gj; Mon, 17 Jul 2023 14:14:04 +0000
Received: by outflank-mailman (input) for mailman id 564611;
 Mon, 17 Jul 2023 14:14:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLOzC-0002Wz-Q8
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 14:14:02 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2043.outbound.protection.outlook.com [40.107.13.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d79b58f-24ac-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 16:14:01 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8685.eurprd04.prod.outlook.com (2603:10a6:102:21c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 14:13:32 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 14:13:32 +0000
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
X-Inumbo-ID: 2d79b58f-24ac-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YiUKpPrcLXxWnlUYJJnwqozIfa8Ld9bXe5wUL/eXrzgBt4pHDvFVCsL+WA4x+vnnhhBlB/wQz8WWNVI7I+Ep14nB7HyAOyVns742FYgd2bOul3P/Ob8r/u6cMzs9NktCj1qaGohV79m9VC+2qw19LWmfJbEUgEdPguNaSNTYph2W+JBXwrM6FriF3bmocLNWHi3VBJ7lVPJi+cKonwYgEFfuT/gvpEbdQghaLS5Phllqyzkbd5m4W6NQv1HdP5nZqvxbecAoiKW8nY6adM5nXybHiiP+6y48U2dXwNqauJ5n8Zpg39YtLxBAgfRZ5dL6M5mF2lTwxBaCkkcKlJ1UXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZMrEW7j9/0Rv29bQJ4p6Vlp0AxJhC0sEjVBAeejoBw=;
 b=P02miAwgUlgWIUXmOmR4A3BRLiOoRlyol9Mo6DeZ15pfRCG4eE3SfHKyEiy1sYLxrfKFH6Cozw7sD01mhVT+83XTOn8s24NL32iJ0SR+EWbHh+91p0mkMrhhNaKMrhampeaHq2xY5IoOs15+qVJMdd49RoUqtI2t4iLjZtW+aSB5HTuWmMfLwIRZg4ReyKv7LlT7OxK8KDQTqn00vE5U9pJZk9xmtueorLoMm8EKw6R9VddaBe54Grncmb+y6ydmzEbL+RIBV6fmqLBQkjj3uZID3vToGTSH+Ee+Qg2c/cNnjs7IQe17omGGhz/FBmdQDgF/yZSBb2azoHRlYMNtwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZMrEW7j9/0Rv29bQJ4p6Vlp0AxJhC0sEjVBAeejoBw=;
 b=gnxDtPSnOvWejpN2Oz7xh3+R0FhmNrGNsm0kC9D/GXc97UD+2YN+It/FGM9pYHS+wDZykGxrFkAabFzB+GeEK8rFrO8IAmovpz700PcetB3YvEp/unFn3YsMNJUbNioozffxfV0t0xn5k72UATXpondN/UbqJk7Pj5DrIyASG2sYzxyCUrBOC2onrBHv/fMKTWTcigj41iErCvR9PPO0BdhM8as/wxTOIhVnD/SK2MXdOhJSawHI9qbB572T/LzD5oyuj+U6O9gRQ3W0eVKH0Go7YYKFZ3DAP8erOcfXnQmUgWaf6L/FQP1uv0YBHqIbBt1Yft1xk8WHlq2D2wDB7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dd24472e-757b-a398-8ece-4e353a28ed1b@suse.com>
Date: Mon, 17 Jul 2023 16:13:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: avoid Misra Rule 19.1 violations
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8685:EE_
X-MS-Office365-Filtering-Correlation-Id: 944b30c3-21d5-4f5f-9868-08db86d00063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q1fuwDae3JFnAYLtoBJ5qZ6P0cKf8vUcJqzNSsV8rkHIMOxNhhv9VwedtBsqQncMaHYd9Nl6vj1jF9+7XMl6APvvnl2Aua2Pd0+dCctGkt2xWtkYBOM5Zn14McEBQ/nBZZGnTfu+8yI+Kccoq2kduoSrSLn+4JyKw7dUkGY6zaeYXFnnxNpDcnlKnVBFSHny20Fz3tkHjTsy9U7290OkTdJ8F6r6jG6LC2JV/fZfQbG0iekfgdritprcx7EIeeT/MJlUkIxme8q9lYCTYFu48vDFK1ragnXGrxx1yUKxjse0aq+n43M9Z5Su9p2DC+6E/6Fqafqn0EKL3I63xHIrk3lKiMub72uJbCWgXeCwhMnPhY399dbscV/XB5vqs+X+MYg8uB9tko95wxHJG6aLoVpODsdmWkjYZPiTLEi4twhaTrp4NJrIh9JjDAJhGZ+f58dmn8GuJyUH4/MGM7Rc58WCSRJtfn9KKnpIf5A18OlS2cDwJ9UhiiNLpKNTkOyCieyBs+XXfFSzsC7dhV+S9hP2ZFBhGlSVFUPY23NdYOohbhVCi5mpEhrasOdYXrFgiiVgEHvhY73t1Rvi6UH7ylkSlAqbPMhGEWQ8yPq2VjROfMve7viM/g1X4CNmADY/eY3xjo2bnB/h1s8kvrHDSQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199021)(31696002)(6506007)(83380400001)(38100700002)(186003)(26005)(478600001)(6512007)(6666004)(6486002)(54906003)(8676002)(41300700001)(66476007)(2906002)(8936002)(66556008)(6916009)(66946007)(316002)(4326008)(5660300002)(36756003)(2616005)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHpnTGRmTXEvQXVBWVlRUnlBUHRNUGFadUd2TUYxaTYyRlFHT2I5YVpuSmpX?=
 =?utf-8?B?QTFOM0Q5RnAxVUE1dXI5RTEwYXVhNDU5VHl6dUFubzRoSWg0YjdicUdoQ3pi?=
 =?utf-8?B?RWxHS0QwM0lYVk9EMEc2WHBvUmpLS0JTaHpKc2tpT1pkM1pnbVNBSVBacHg2?=
 =?utf-8?B?VmF3T3IrTm5jaEo5czhBYTZhNDlXd0k5RUxQS0orTkc3N0Fad1pYL3g1VVhh?=
 =?utf-8?B?ZjhKeHlWMlZYS2RoTmxwWWlGZU0ramxFVlBobTZjTlBHYXQ0bFFHUmwvSlVt?=
 =?utf-8?B?THMvVEt4VDFyU1VvOStuRGlBRjZvY1ZwYkZRSFFmZ0ordXRteHJ6bGhURjFR?=
 =?utf-8?B?WWV0L1lIT054TXdkZ25TbjBNL3lBQytRMUIxQkNMU1A5d0Z2WC9CNzl2MlBt?=
 =?utf-8?B?REFnT1NxdnVLdVN0MG9iZHh5WHNPSENJTmNiaFpwWTI1QXR3dXZWKytMRDJk?=
 =?utf-8?B?Q25XRGg5VExtd2t0SHB4MGV0L3NtSTRGcEVCOUkrMmhlK1RCU3BLVEZDTStQ?=
 =?utf-8?B?Mmp4R3RnOU1WNVB0Qi9KSVZLZDQwZGh3VEEyUVIwa1RBT3NrMUhmVDFuNktD?=
 =?utf-8?B?ODFTVythbi9nbjFsMzlwMGFmTUZLdlFMK1Q4UGRMeVF3c0Q4R3IrRFIreWZr?=
 =?utf-8?B?Ny80TWprT2ZpRy9jS1RnczBaNTdMdkw3VFNPbHQ4SE9rNmpZeVF2V203SW1t?=
 =?utf-8?B?dEhJZEoycUxqS3I3aDdDdEdFU1oyWEszSVovSStSZWJXc1kwdng0RlRkRnVs?=
 =?utf-8?B?NjVBdVFJdTI5VlppUTNnamRCOXRhTXh4VUVGNDhYZ2JZVGpURHdRU3pyN0ZE?=
 =?utf-8?B?NXZ4OGpVbi9odGlMMGFaOWpRQ09zQ0lJY3FtQzAvSUJaaDhCTG9oU2NzSmRE?=
 =?utf-8?B?WWtZWjNFWmluKzVyRUZqN1Z3TTVMdHBhQWFhbU9KY1UxeFpNTURwSlhsbUw2?=
 =?utf-8?B?WTl3TDhxUGpLRzYvNzhDbktkb1pWVDNJTEkyci9FWXRrTGRPRkFEM3hub0tO?=
 =?utf-8?B?aW4rQlZwSzl2bTJHTjBqNjVobDd4ZWV3bTdVR2NUcmczT0RaNHRxS1JxRzFR?=
 =?utf-8?B?TUFVcUVrN3BnYVhtRkhRdW8zS284b2JsejdCY1EwVnZtNHNtQ0ZXNW5GTHIw?=
 =?utf-8?B?Nk8wMmJ4RDViajZnb0JENTJjN214VkEwN3djQVl4SzVpbnZzVVg4M0JnaEI5?=
 =?utf-8?B?alNVbHpYM1Mxak9vckhEUVVRbDBNWFA0WFZYZjdUd3FseVJPQndwNXhvbWVv?=
 =?utf-8?B?Wi93MSsxYjl4bmFPQTlDSGhraldCZ1pNVzFkeVlCck9GcG5kNTRKdys4ekxz?=
 =?utf-8?B?UHU4c3FZU3owd0Q5VjhUVkROSFNHcVpvY25iUU5sYzY1bmFJazRKZVVIb3hu?=
 =?utf-8?B?UytSSTJFYUQwL3l0Vm9TK1JHZU5IMFdPWlp5NG5ocm0rYUhFaE1rNWtndkxy?=
 =?utf-8?B?MGNPV2hIRUxvMVBIYlRuTkpLQTNtbUhKb3FPMkxudms4S2hDVGE2WU03aGo4?=
 =?utf-8?B?Z0dDMmcvbEZFN1luYzA1NmFXdnhwTDNaVEZDRGYzVUFBbDJCUG1rTVNVRkJI?=
 =?utf-8?B?UVlEaXJPWXZFOERmVkJwZXlRTVEyWjRPYnFNdnZpQ05ueFJxVzFFTU5xWkxs?=
 =?utf-8?B?SFBHdVlJZzlIK0VmSVBJK2FhNUp2UVRzN3hOcG12OGJ5SFVCaklRNzM1ejNI?=
 =?utf-8?B?MTFReHB5Q0k2OHZiVHVnbjUxbkFCQmFPZEZsajhXTFVGZlBnRVRmMCtzWEF4?=
 =?utf-8?B?cVJTVnBod21MTkE5bDVhcVEzZXgwdUVnUHBkb3dZQW1XQ2xoKzRIUnhYdE5C?=
 =?utf-8?B?MWIxaE5NL1pCSWhmMnQ0cS84NnRpNlNEenpXT3JxcjdnbzhRTDdSNkFxaWdk?=
 =?utf-8?B?WVd1WktZb0lnRzFQS2RXcXZncG01ODNES09uTnRNUjdhMTY5RDNvMzJ1bDNK?=
 =?utf-8?B?RUV1ZWdITXpUNVpVQnBRcWc0UzdrMzJyZHB6Mkk1S0Q5QlcrNW5kc0NudnJG?=
 =?utf-8?B?SDFwVko2cWpZaTNtSThiRmx2SkhsUTVUNUQ0aEFRNHgyRmowRFdnenBzU3Y1?=
 =?utf-8?B?WnRFRkJvZm56dVYyNC80T0Jpd0U2VGVqUkJMalZUMWpGUmtaNDRlWE5LVG9T?=
 =?utf-8?Q?5chXHH0eIEZm+8YWJKMs4SgdI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 944b30c3-21d5-4f5f-9868-08db86d00063
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 14:13:32.1898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXRwJxzW1Mn4+CL87uRzirdMPiVNzBsqERb4HxyY6JcYFhPJW3wlLQAwowDwretIm7+uog+6hoocM8ocp/TAxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8685

Not exactly overlapping accesses to objects on the left and right hand
sides of an assignment are generally UB, and hence disallowed by Misra.
While in the specific cases we're talking about here no actual UB can
result as long as the compiler doesn't act actively "maliciously", let's
still switch to using casts combined with exactly overlapping accesses.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Oddly enough in my (release) build using gcc12 I actually see emulator
code shrink by about 40 bytes. Diff-ing the disassembly I can't really
attribute this to the particular changes, but instead it looks like
certain scheduling, inlining, and code folding decisions are done
differently.

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3860,7 +3860,7 @@ void hvm_ud_intercept(struct cpu_user_re
 
             /* Zero the upper 32 bits of %rip if not in 64bit mode. */
             if ( !(hvm_long_mode_active(cur) && cs->l) )
-                regs->rip = regs->eip;
+                regs->rip = (uint32_t)regs->rip;
 
             add_taint(TAINT_HVM_FEP);
 
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1420,7 +1420,7 @@ static void cf_check svm_inject_event(co
      */
     if ( !((vmcb_get_efer(vmcb) & EFER_LMA) && vmcb->cs.l) )
     {
-        regs->rip = regs->eip;
+        regs->rip = (uint32_t)regs->rip;
         vmcb->nextrip = (uint32_t)vmcb->nextrip;
     }
 
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4760,7 +4760,7 @@ out:
                 regs->rip = (long)(regs->rip << (64 - VADDR_BITS)) >>
                             (64 - VADDR_BITS);
             else
-                regs->rip = regs->eip;
+                regs->rip = (uint32_t)regs->rip;
         }
         else
             domain_crash(v->domain);
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -503,8 +503,8 @@ static inline void put_loop_count(
         if ( mode_64bit() && ad_bytes == 4 )                            \
         {                                                               \
             _regs.r(cx) = 0;                                            \
-            if ( using_si ) _regs.r(si) = _regs.esi;                    \
-            if ( using_di ) _regs.r(di) = _regs.edi;                    \
+            if ( using_si ) _regs.r(si) = (uint32_t)_regs.r(si);        \
+            if ( using_di ) _regs.r(di) = (uint32_t)_regs.r(di);        \
         }                                                               \
         goto complete_insn;                                             \
     }                                                                   \
@@ -1984,9 +1984,9 @@ x86_emulate(
     case 0x98: /* cbw/cwde/cdqe */
         switch ( op_bytes )
         {
-        case 2: _regs.ax = (int8_t)_regs.al; break; /* cbw */
+        case 2: _regs.ax = (int8_t)_regs.ax; break; /* cbw */
         case 4: _regs.r(ax) = (uint32_t)(int16_t)_regs.ax; break; /* cwde */
-        case 8: _regs.r(ax) = (int32_t)_regs.eax; break; /* cdqe */
+        case 8: _regs.r(ax) = (int32_t)_regs.r(ax); break; /* cdqe */
         }
         break;
 
@@ -8377,7 +8377,7 @@ x86_emulate(
 
     /* Zero the upper 32 bits of %rip if not in 64-bit mode. */
     if ( !mode_64bit() )
-        _regs.r(ip) = _regs.eip;
+        _regs.r(ip) = (uint32_t)_regs.r(ip);
 
     /* Should a singlestep #DB be raised? */
     if ( rc == X86EMUL_OKAY && singlestep && !ctxt->retire.mov_ss )


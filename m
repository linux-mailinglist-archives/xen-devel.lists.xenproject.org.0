Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E01B787414
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 17:26:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590159.922298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZCE5-0005Fs-2r; Thu, 24 Aug 2023 15:26:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590159.922298; Thu, 24 Aug 2023 15:26:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZCE4-0005D4-WD; Thu, 24 Aug 2023 15:26:25 +0000
Received: by outflank-mailman (input) for mailman id 590159;
 Thu, 24 Aug 2023 15:26:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hMLV=EJ=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qZCE3-0003YM-Dz
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 15:26:23 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94389f11-4292-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 17:26:22 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1bf1935f6c2so144495ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Aug 2023 08:26:22 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 c11-20020a170902724b00b001b246dcffb7sm12799696pll.300.2023.08.24.08.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Aug 2023 08:26:20 -0700 (PDT)
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
X-Inumbo-ID: 94389f11-4292-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692890781; x=1693495581;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9XIsD63nwOYvc2cHhq596WUI00NwwdJtSTq9islJ9GA=;
        b=XIjQiD+mRfYMkiDvLFz9qug3HwfIw8pKDR1PbI5kTnkp0ZhN/uZFYVLTTiQ9hu3dwM
         0VkyPHun2V5x/OR+x6qCq7ABA42HgBTMJTilp5PhhMvOBZq7vX1S2X0vYxT761TUSREW
         0zpefhxvTj0SUTQL5rzgXh9EvYnpSnPl7bTQETTSVpZM5jmaKQHJMHWbPNoG9u06MCcm
         wkTxlNFNzgjMTqVNIeJ74K+La2sp46QxDLeuqfTdChqomVUvzcVXRes4ptbLAVlTT8PF
         U4/fY4RaHIVEgNjP38jV+t8uOOTKO4ehPnUfkACc2UfQNZK/6QuhgIvcxUrutnaX2Ro7
         ROig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692890781; x=1693495581;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9XIsD63nwOYvc2cHhq596WUI00NwwdJtSTq9islJ9GA=;
        b=jblZIHTWWim5bmb4tOhIsCWYU2rSQKdEkcvczdVFzGLh+Cnr/x4FNkxglgbX5Fwf3J
         ucS+wVGdm6R0ONtAy1Oig5FjL5bnHvNh2O2Xk9JADUiXlTE3NySYOq2QCOOXzGt3nNQS
         i5yCvH1RK4RsG5K8jLxitqlQqh826XHjEzPaaa+MSJTvPHoEy+REK0Jpy4Nrzw92b6Cl
         Tx8v+GKVqWhm87RBrN7CQSHr7GF52mLEHOSxtOY2L+kulaMcuwLMh7Kru7123chOhVWl
         I8q4TQ3+EEzJbs1lHyvVXF+cfPxDcQt2eWdAFZRsd+mfvvV4kInOdAfamqGDtQDDwO0J
         piiA==
X-Gm-Message-State: AOJu0YxXr7JJOsKIbM6eH3Pjh8KI6c3AU9rfT42nIWaARCAygIAkDF+z
	2YRh6yAnjLevEmdLggBtaBk=
X-Google-Smtp-Source: AGHT+IGxEBSYrq4hzPD/hY9Y+bRa7puqsL8n/2nYyhbIo31TA+CCStW6VGuCqDFo8AVVKGFXHsHbaw==
X-Received: by 2002:a17:902:e74b:b0:1bd:c32e:df59 with SMTP id p11-20020a170902e74b00b001bdc32edf59mr25309734plf.9.1692890780855;
        Thu, 24 Aug 2023 08:26:20 -0700 (PDT)
Message-ID: <dd3fcb84-399b-945b-bd4b-4bf5ce75450e@gmail.com>
Date: Fri, 25 Aug 2023 00:26:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH v2 5/8] x86: Don't assume #DB is always caused by singlestep
 if EFLAGS.TF is set
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
Content-Language: en-US
In-Reply-To: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Today, when a HVM (or PVH) guest triggers a hardware breakpoint while
EFLAGS.TF is set, Xen incorrectly assumes that this is a single stepping
exception and sets X86_DR6_BS in dr6 in addition to X86_DR6_B<n>.

This causes problems with Linux HW breakpoint handler, which ignores
X86_DR6_B<n> bits when X86_DR6_BS is set.  This prevents user-mode
debuggers from recognizing hardware breakpoints if EFLAGS.TF is set.

Fix this by not setting X86_DR6_BS in {vmx,svm}_inject_event, unless the
emulator explicitly signals the single-stepping mode via the
'pending_dbg' field of struct x86_event.

While we're at it, defer setting guest DR6 from vmx_vmexit_handler() to
vmx_inject_event() on Intel hardware.  This gives the monitor a chance
to modify the pending_dbg flags before it is applied to guest DR6.

Fixes: 8b831f4189 ("x86: single step after instruction emulation")
Signed-off-by: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>
CC: Alexandru Isaila <aisaila@bitdefender.com>
CC: Petre Pircalabu <ppircalabu@bitdefender.com>

v1 -> v2: new patch

The next patch in series adds the explanation for DR6 setting behavior
in the form of comments.  These comments are from Andrew Cooper's patch
"x86/hvm: RFC - PROBABLY BROKEN - Defer all debugging/monitor actions to
{svm,vmx}_inject_event()", which I split out because I was unsure about
how to handle authorship.  The comments are reproduced below:

> On AMD hardware, a #DB exception:
>  1) Merges new status bits into %dr6
>  2) Clears %dr7.gd and MSR_DEBUGCTL.{LBR,BTF}
>
> Item 1 is done by hardware before a #DB intercepted vmexit, but we
> may end up here from monitor so have to repeat it ourselves.
> Item 2 is done by hardware when injecting a #DB exception.

> On Intel hardware, a #DB exception:
>  1) Merges new status bits into %dr6
>  2) Clears %dr7.gd and MSR_DEBUGCTL.LBR
>
> All actions are left up to the hypervisor to perform.
---
 xen/arch/x86/hvm/svm/svm.c |  8 +++-----
 xen/arch/x86/hvm/vmx/vmx.c | 14 +++-----------
 2 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 038c8d6e7e..6f3e6b3512 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1328,11 +1328,9 @@ static void cf_check svm_inject_event(const struct x86_event *event)
     switch ( _event.vector | -(_event.type == X86_EVENTTYPE_SW_INTERRUPT) )
     {
     case X86_EXC_DB:
-        if ( regs->eflags & X86_EFLAGS_TF )
-        {
-            __restore_debug_registers(vmcb, curr);
-            vmcb_set_dr6(vmcb, vmcb_get_dr6(vmcb) | DR_STEP);
-        }
+        __restore_debug_registers(vmcb, curr);
+        vmcb_set_dr6(vmcb, vmcb_get_dr6(vmcb) | _event.pending_dbg);
+
         /* fall through */
     case X86_EXC_BP:
         if ( curr->domain->debugger_attached )
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 9b59374258..4e20fca43e 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2022,11 +2022,9 @@ static void cf_check vmx_inject_event(const struct x86_event *event)
     switch ( _event.vector | -(_event.type == X86_EVENTTYPE_SW_INTERRUPT) )
     {
     case X86_EXC_DB:
-        if ( guest_cpu_user_regs()->eflags & X86_EFLAGS_TF )
-        {
-            __restore_debug_registers(curr);
-            write_debugreg(6, read_debugreg(6) | DR_STEP);
-        }
+        __restore_debug_registers(curr);
+        write_debugreg(6, read_debugreg(6) | event->pending_dbg);
+
         if ( !nestedhvm_vcpu_in_guestmode(curr) ||
              !nvmx_intercepts_exception(curr, X86_EXC_DB, _event.error_code) )
         {
@@ -4250,14 +4248,8 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         switch ( vector )
         {
         case X86_EXC_DB:
-            /*
-             * Updates DR6 where debugger can peek (See 3B 23.2.1,
-             * Table 23-1, "Exit Qualification for Debug Exceptions").
-             */
             __vmread(EXIT_QUALIFICATION, &exit_qualification);
             HVMTRACE_1D(TRAP_DEBUG, exit_qualification);
-            __restore_debug_registers(v);
-            write_debugreg(6, exit_qualification | DR_STATUS_RESERVED_ONE);
 
             /*
              * Work around SingleStep + STI/MovSS VMEntry failures.
-- 
2.41.0



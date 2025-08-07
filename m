Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F79B1D675
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 13:17:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072833.1435798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujycO-00036c-34; Thu, 07 Aug 2025 11:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072833.1435798; Thu, 07 Aug 2025 11:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujycN-00034g-UK; Thu, 07 Aug 2025 11:17:07 +0000
Received: by outflank-mailman (input) for mailman id 1072833;
 Thu, 07 Aug 2025 11:17:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LYnK=2T=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ujycM-00030Z-Jj
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 11:17:06 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bea8958-7380-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 13:17:04 +0200 (CEST)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-458bf6d69e4so8083795e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 04:17:04 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5c84b8csm45456435e9.4.2025.08.07.04.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 04:17:00 -0700 (PDT)
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
X-Inumbo-ID: 0bea8958-7380-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754565423; x=1755170223; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYLRSCELpDf777tBe5S3x0+V8CZEK6QhYyN7G9zFspo=;
        b=OJ7AJcCDZq3jtMyspyQuzCSmJCgGbj6R182T4nCpodg0pgw5FixPUNVho70QlsYYG6
         QMVaCZtYSmXKe8G446doumTxSy0TK48MPLwCHmhotkvWgAKjEEpbcG1ysSichCIrKAUr
         xOQ0QRkOHiguOZVOTDJG0ecbvUXPYZX3/ph5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754565423; x=1755170223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYLRSCELpDf777tBe5S3x0+V8CZEK6QhYyN7G9zFspo=;
        b=sz2hfmjxvh3s/OwSdxHOWsw/UccAGEHTcBSVjt/MNq88q31u+t2oU0S+Ll27xR46Gu
         Ym1UniumZVD2vXpkuyQrp2y7WD5d4+ItIU71+xzNFgCdj11SSgPrdiCCcEV0+C2P21Ef
         1MnkQHpfIwL1cX78uP+qjdmeF/jVbad0zKF5cXEgxhJ9NszWf6/u+OyQHotmBmkGF044
         rfVd6lTH1WT4GQnacDsex0sKnEdSECPeE08WacGcOcCcwu1BPFy4ZlTyHi1SyJLqZw4i
         ObjfkHuk0fRm5S1Ih0jMFF6zJhbgHrBqDBCLiU271xrLOj7sadMW1m4mJu/WKidwR7/V
         TYMw==
X-Gm-Message-State: AOJu0YyIfUGmoYUOE/zPpbzYXuyrDg4Jcaiu9G27lRyAQxZzUMbF23f+
	i/sA2b1cPRvMnHlxeR692mGhlKQ6aoNKWSlZtNdsMqijS9OWaAt5hwHZhmybj/xbGVelLzjGqvC
	tYRXeYat0vQ==
X-Gm-Gg: ASbGncvy/JU0HvAdj0wGCafKEO96gSniGJolXDVVkiTg9y3JoB5r+E/Br1CGx9VvK5N
	LPdeMYUytYvVps1RUAgnsc7r3VurFeRxryHi2qYBiPXiIQd/5a1mLCHS/zVjNT0bCja/8PAWXHj
	Ru8xcdzdZpJnKCZkDNKYQzVPjBf4/jqY6MjDm6hw3gxG4uvjBzILf6wTl4wIn0SXsVgHdDoVIUt
	rkt/uo9NnsP0i7C3Bk/o+YFmKjvIORO1tqhUSbkMDuGVlJ/qyZrONUBZlvclFGxUVOt0ZIAyQyS
	0NgYyzk3Gmz40rLLaO4eDSgFOIfLs1kFLZ0t6G8dUG7C05Gc0+WziUTHz6d/YzKth7Vyzl1lNhH
	7nWbFXps7GKUnJl0Gfd4J+tgKxWQE0SfWhHa46tnQlAS1Pbye2J0fcMX/b+7xsfQNAWhORDvwJ3
	/r
X-Google-Smtp-Source: AGHT+IGVJwnBI/52eUaXILV0ggTlZQ6i9eke2ZF9PtnsEWbgzUIFr3VU5Ayjl5bNqFXKmGvQ/eCZ5A==
X-Received: by 2002:a05:600c:3589:b0:456:1204:e7e6 with SMTP id 5b1f17b1804b1-459e7ec7ac6mr56475535e9.11.1754565420494;
        Thu, 07 Aug 2025 04:17:00 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/4] x86/domctl: Stop using XLAT_cpu_user_regs()
Date: Thu,  7 Aug 2025 12:16:54 +0100
Message-Id: <20250807111657.201849-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250807111657.201849-1-andrew.cooper3@citrix.com>
References: <20250807111657.201849-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to support FRED, we're going to have to remove the {ds..gs} fields
from struct cpu_user_regs, meaning that it is going to have to become a
different type to the structure embedded in vcpu_guest_context_u.

In both arch_{get,set}_info_guest(), expand the memcpy()/XLAT_cpu_user_regs()
to copy the fields individually.  This will allow us to eventually make them
different types.

This does cause some minor changes in behaviour for the hypercalls.

It is specifically not the case that a toolstack could set_info(); get_info();
and get an identical bit pattern back.  Amongst other things, the
architectural sticky bits in registers are applied during setting.

Previously, XLAT_cpu_user_regs() omitted the _pad fields in the compat case
whereas the non-compat case included them owing to the single memcpy().

Omit the _pad fields in the non-compat case too; for all but the oldest of
CPUs, the segment selectors are zero-extended by hardware when pushed onto the
stack, so non-zero values here get lost naturally.  Furthermore, FRED reuses
the space above cs and ss for extra state, and a PV guest for now at least
must not be able to write the control state.

Omit the error_code and entry_vector fields too.  They're already identified
as private fields in the public API, and are stale outside of Xen's
interrupt/exception/syscall handler.  They're also a very minor information
leak of which event caused the last deschedule of a vCPU.

Finally, omit saved_upcall_mask.  Xen doesn't consume this, and only produces
it in {compat_,}create_bounce_frame(), based on the vcpu_info page and
settings about the event being injected.  Similar to error_code/entry_vector,
it is stale outside of the guest's event handler.

No change that toolstacks or guests are expected to notice or care about.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Zero memory before a partial copy, or note that it already is.
 * Omit error_code/entry_vector/saved_upcall_mask too.

I can't see why saved_upcall_mask exists in the first place, given that it is
also reflected in (v)rflags.IF.  None of MiniOS, Linux or NetBSD use it at
all.  I suspect the reflecting in IF was a slightly later addition dicovered
when running non-toy PV guests, and saved_upcall_mask got left behind as a
wart in the ABI.
---
 xen/arch/x86/domain.c | 38 ++++++++++++++++++++++++++++++++++++--
 xen/arch/x86/domctl.c | 38 ++++++++++++++++++++++++++++++++++++--
 xen/include/xlat.lst  |  2 --
 3 files changed, 72 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 56c381618712..56111eac3d94 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1233,7 +1233,24 @@ int arch_set_info_guest(
 
     if ( !compat )
     {
-        memcpy(&v->arch.user_regs, &c.nat->user_regs, sizeof(c.nat->user_regs));
+        memset(&v->arch.user_regs, 0, sizeof(v->arch.user_regs));
+        v->arch.user_regs.rbx               = c.nat->user_regs.rbx;
+        v->arch.user_regs.rcx               = c.nat->user_regs.rcx;
+        v->arch.user_regs.rdx               = c.nat->user_regs.rdx;
+        v->arch.user_regs.rsi               = c.nat->user_regs.rsi;
+        v->arch.user_regs.rdi               = c.nat->user_regs.rdi;
+        v->arch.user_regs.rbp               = c.nat->user_regs.rbp;
+        v->arch.user_regs.rax               = c.nat->user_regs.rax;
+        v->arch.user_regs.rip               = c.nat->user_regs.rip;
+        v->arch.user_regs.cs                = c.nat->user_regs.cs;
+        v->arch.user_regs.rflags            = c.nat->user_regs.rflags;
+        v->arch.user_regs.rsp               = c.nat->user_regs.rsp;
+        v->arch.user_regs.ss                = c.nat->user_regs.ss;
+        v->arch.user_regs.es                = c.nat->user_regs.es;
+        v->arch.user_regs.ds                = c.nat->user_regs.ds;
+        v->arch.user_regs.fs                = c.nat->user_regs.fs;
+        v->arch.user_regs.gs                = c.nat->user_regs.gs;
+
         if ( is_pv_domain(d) )
             memcpy(v->arch.pv.trap_ctxt, c.nat->trap_ctxt,
                    sizeof(c.nat->trap_ctxt));
@@ -1241,7 +1258,24 @@ int arch_set_info_guest(
 #ifdef CONFIG_COMPAT
     else
     {
-        XLAT_cpu_user_regs(&v->arch.user_regs, &c.cmp->user_regs);
+        memset(&v->arch.user_regs, 0, sizeof(v->arch.user_regs));
+        v->arch.user_regs.ebx               = c.cmp->user_regs.ebx;
+        v->arch.user_regs.ecx               = c.cmp->user_regs.ecx;
+        v->arch.user_regs.edx               = c.cmp->user_regs.edx;
+        v->arch.user_regs.esi               = c.cmp->user_regs.esi;
+        v->arch.user_regs.edi               = c.cmp->user_regs.edi;
+        v->arch.user_regs.ebp               = c.cmp->user_regs.ebp;
+        v->arch.user_regs.eax               = c.cmp->user_regs.eax;
+        v->arch.user_regs.eip               = c.cmp->user_regs.eip;
+        v->arch.user_regs.cs                = c.cmp->user_regs.cs;
+        v->arch.user_regs.eflags            = c.cmp->user_regs.eflags;
+        v->arch.user_regs.esp               = c.cmp->user_regs.esp;
+        v->arch.user_regs.ss                = c.cmp->user_regs.ss;
+        v->arch.user_regs.es                = c.cmp->user_regs.es;
+        v->arch.user_regs.ds                = c.cmp->user_regs.ds;
+        v->arch.user_regs.fs                = c.cmp->user_regs.fs;
+        v->arch.user_regs.gs                = c.cmp->user_regs.gs;
+
         if ( is_pv_domain(d) )
         {
             for ( i = 0; i < ARRAY_SIZE(c.cmp->trap_ctxt); ++i )
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 3044f706de1c..28fec0e12dbb 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1399,7 +1399,24 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
         c(flags |= VGCF_online);
     if ( !compat )
     {
-        memcpy(&c.nat->user_regs, &v->arch.user_regs, sizeof(c.nat->user_regs));
+        /* Backing memory is pre-zeroed. */
+        c.nat->user_regs.rbx               = v->arch.user_regs.rbx;
+        c.nat->user_regs.rcx               = v->arch.user_regs.rcx;
+        c.nat->user_regs.rdx               = v->arch.user_regs.rdx;
+        c.nat->user_regs.rsi               = v->arch.user_regs.rsi;
+        c.nat->user_regs.rdi               = v->arch.user_regs.rdi;
+        c.nat->user_regs.rbp               = v->arch.user_regs.rbp;
+        c.nat->user_regs.rax               = v->arch.user_regs.rax;
+        c.nat->user_regs.rip               = v->arch.user_regs.rip;
+        c.nat->user_regs.cs                = v->arch.user_regs.cs;
+        c.nat->user_regs.rflags            = v->arch.user_regs.rflags;
+        c.nat->user_regs.rsp               = v->arch.user_regs.rsp;
+        c.nat->user_regs.ss                = v->arch.user_regs.ss;
+        c.nat->user_regs.es                = v->arch.user_regs.es;
+        c.nat->user_regs.ds                = v->arch.user_regs.ds;
+        c.nat->user_regs.fs                = v->arch.user_regs.fs;
+        c.nat->user_regs.gs                = v->arch.user_regs.gs;
+
         if ( is_pv_domain(d) )
             memcpy(c.nat->trap_ctxt, v->arch.pv.trap_ctxt,
                    sizeof(c.nat->trap_ctxt));
@@ -1407,7 +1424,24 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
 #ifdef CONFIG_COMPAT
     else
     {
-        XLAT_cpu_user_regs(&c.cmp->user_regs, &v->arch.user_regs);
+        /* Backing memory is pre-zeroed. */
+        c.cmp->user_regs.ebx               = v->arch.user_regs.ebx;
+        c.cmp->user_regs.ecx               = v->arch.user_regs.ecx;
+        c.cmp->user_regs.edx               = v->arch.user_regs.edx;
+        c.cmp->user_regs.esi               = v->arch.user_regs.esi;
+        c.cmp->user_regs.edi               = v->arch.user_regs.edi;
+        c.cmp->user_regs.ebp               = v->arch.user_regs.ebp;
+        c.cmp->user_regs.eax               = v->arch.user_regs.eax;
+        c.cmp->user_regs.eip               = v->arch.user_regs.eip;
+        c.cmp->user_regs.cs                = v->arch.user_regs.cs;
+        c.cmp->user_regs.eflags            = v->arch.user_regs.eflags;
+        c.cmp->user_regs.esp               = v->arch.user_regs.esp;
+        c.cmp->user_regs.ss                = v->arch.user_regs.ss;
+        c.cmp->user_regs.es                = v->arch.user_regs.es;
+        c.cmp->user_regs.ds                = v->arch.user_regs.ds;
+        c.cmp->user_regs.fs                = v->arch.user_regs.fs;
+        c.cmp->user_regs.gs                = v->arch.user_regs.gs;
+
         if ( is_pv_domain(d) )
         {
             for ( i = 0; i < ARRAY_SIZE(c.cmp->trap_ctxt); ++i )
diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
index 3c7b6c6830a9..6d6c6cfab251 100644
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -34,8 +34,6 @@
 ?	pmu_intel_ctxt			arch-x86/pmu.h
 ?	pmu_regs			arch-x86/pmu.h
 
-!	cpu_user_regs			arch-x86/xen-@arch@.h
-
 ?	cpu_offline_action		arch-x86/xen-mca.h
 ?	mc				arch-x86/xen-mca.h
 !	mc_fetch			arch-x86/xen-mca.h
-- 
2.39.5



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCDAA5D179
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 22:13:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909300.1316317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6uF-0001KA-OO; Tue, 11 Mar 2025 21:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909300.1316317; Tue, 11 Mar 2025 21:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6uF-0001G3-Ix; Tue, 11 Mar 2025 21:12:55 +0000
Received: by outflank-mailman (input) for mailman id 909300;
 Tue, 11 Mar 2025 21:12:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isYZ=V6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ts6uE-0008V9-Ao
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 21:12:54 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9810a7ff-febd-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 22:12:52 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3912c09bea5so4964100f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 14:12:52 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfba9sm19480872f8f.39.2025.03.11.14.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 14:12:51 -0700 (PDT)
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
X-Inumbo-ID: 9810a7ff-febd-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741727572; x=1742332372; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=791cAS5w7eCNK6kjj4DpqvEK5as6CjUXwYOSWlAUoo8=;
        b=DiBDAtE0btf+fc+DUbZocqpDQ5yZ5Yk5j6w5FVJqD9dZJdUZEmYNdLuTCY1jw50Tlr
         xB7nRip7lXsYjykgiLu+udV47il03txlkVnonlFqRMn/K5PwQ6u37Q2HNtmJo31Neezf
         rhVpfPhhDuDoqma5Xco/3sQifYkCwWkZuYQyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741727572; x=1742332372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=791cAS5w7eCNK6kjj4DpqvEK5as6CjUXwYOSWlAUoo8=;
        b=LQEIBb2sYQkXO9FS5yynHExeibAYnd89MDG+PizpnRJe7o8tHe9tGSsEddXXfylS6B
         Phch/8HKKe+4PHNHE5ts82InF1RGYU2WYVqp7eLOyYp56h/+LVmU9lURXcPg5JCjuzq2
         4yrhdrn/YyAjoE7/FRdHK9xVHhvOuHMjTXU9bWX/iTWYv/0d3eucMffpJ66N/NvNRA+H
         OBRHV9KVTbjWEzZ/vmAMxrnDFxNPMqfAvWXBL2v65CVuKEvG0BmgDJyByXHUApNWestF
         H4UhsFEdBCmdvQjo37BkUB5j4nWoOESZgTSjfsUkSUKNqdhD0bYPZNyZ9Hc7zNZCsyPh
         8Qxw==
X-Gm-Message-State: AOJu0Yx9Utq8rhYNFW7wRy2dXyO/zqCMOoXLHh4YD5GfJXQA27j9NHqJ
	8U4drf2ny4ZbyppQRHzX1iI6FUkEdSQBE+jziGvdCRENM0pq10kZEmGaYPW0P+oOoqupF0tLhzH
	8
X-Gm-Gg: ASbGncugRHOhKVgvoFNjGJFANkkYcM3FOfIEXekj0LUXtYixfO2EzBp3Ds+IX+jCsVQ
	XEHm975RYrXa/8aUZmHT3asrvWHm43DxSLL+MdNbe50OOuApj1thwFf64JNTi/buaBrHorluvgs
	IMda4E/O2VGdBrLH7akH52nSt8+v+KUfbQbPoLyckfq5Y3NcnICNUdBObl0/OIoHZuBRRB5IC6x
	uCoEOPPZn4vPdhwDzwE+jLDO3Emfv07BWDdHpd0X4qwvkotQGrZ/yIcQXWKRuw6VG/bjdCn8mIq
	eMbbjj81n2HWWTUygsyFaEapwJlPIy7qLZkAYhgMgCG+iglSGKqwvN5vPaTw/hiurpuXOXNB09P
	j6TKPML2xfog96wZ5u/Jb3XK7
X-Google-Smtp-Source: AGHT+IH1rPMqHv3ArDgFC97Dc4ohFM/1rzWaP3B8txp72HirToLrO2N2PadTRsHbohho/nhVlJ116g==
X-Received: by 2002:a5d:6d06:0:b0:391:4231:414 with SMTP id ffacd0b85a97d-3926beec139mr6844639f8f.40.1741727571883;
        Tue, 11 Mar 2025 14:12:51 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 5/8] x86/domctl: Stop using XLAT_cpu_user_regs()
Date: Tue, 11 Mar 2025 21:10:40 +0000
Message-Id: <20250311211043.3629696-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to support FRED, we're going to have to remove the {ds..gs} fields
from struct cpu_user_regs, meaning that it is going to have to become a
different type to the structure embedded in vcpu_guest_context_u.

In both arch_{get,set}_info_guest(), expand the memcpy()/XLAT_cpu_user_regs()
to copy the fields individually.  This will allow us to eventually make them
different types.

No practical change.  The compat cases are identical, while the non-compat
cases no longer copy _pad fields.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Should we really be copying error_code/entry_vector?  They're already listed
as explicitly private fields, and I don't think anything good can come of
providing/consuming them.
---
 xen/arch/x86/domain.c | 42 ++++++++++++++++++++++++++++++++++++++++--
 xen/arch/x86/domctl.c | 42 ++++++++++++++++++++++++++++++++++++++++--
 xen/include/xlat.lst  |  2 --
 3 files changed, 80 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index a42fa5480593..bc0816c71495 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1196,7 +1196,26 @@ int arch_set_info_guest(
 
     if ( !compat )
     {
-        memcpy(&v->arch.user_regs, &c.nat->user_regs, sizeof(c.nat->user_regs));
+        v->arch.user_regs.rbx               = c.nat->user_regs.rbx;
+        v->arch.user_regs.rcx               = c.nat->user_regs.rcx;
+        v->arch.user_regs.rdx               = c.nat->user_regs.rdx;
+        v->arch.user_regs.rsi               = c.nat->user_regs.rsi;
+        v->arch.user_regs.rdi               = c.nat->user_regs.rdi;
+        v->arch.user_regs.rbp               = c.nat->user_regs.rbp;
+        v->arch.user_regs.rax               = c.nat->user_regs.rax;
+        v->arch.user_regs.error_code        = c.nat->user_regs.error_code;
+        v->arch.user_regs.entry_vector      = c.nat->user_regs.entry_vector;
+        v->arch.user_regs.rip               = c.nat->user_regs.rip;
+        v->arch.user_regs.cs                = c.nat->user_regs.cs;
+        v->arch.user_regs.saved_upcall_mask = c.nat->user_regs.saved_upcall_mask;
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
@@ -1204,7 +1223,26 @@ int arch_set_info_guest(
 #ifdef CONFIG_COMPAT
     else
     {
-        XLAT_cpu_user_regs(&v->arch.user_regs, &c.cmp->user_regs);
+        v->arch.user_regs.ebx               = c.cmp->user_regs.ebx;
+        v->arch.user_regs.ecx               = c.cmp->user_regs.ecx;
+        v->arch.user_regs.edx               = c.cmp->user_regs.edx;
+        v->arch.user_regs.esi               = c.cmp->user_regs.esi;
+        v->arch.user_regs.edi               = c.cmp->user_regs.edi;
+        v->arch.user_regs.ebp               = c.cmp->user_regs.ebp;
+        v->arch.user_regs.eax               = c.cmp->user_regs.eax;
+        v->arch.user_regs.error_code        = c.cmp->user_regs.error_code;
+        v->arch.user_regs.entry_vector      = c.cmp->user_regs.entry_vector;
+        v->arch.user_regs.eip               = c.cmp->user_regs.eip;
+        v->arch.user_regs.cs                = c.cmp->user_regs.cs;
+        v->arch.user_regs.saved_upcall_mask = c.cmp->user_regs.saved_upcall_mask;
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
index 3044f706de1c..7ab9e9176b58 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1399,7 +1399,26 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
         c(flags |= VGCF_online);
     if ( !compat )
     {
-        memcpy(&c.nat->user_regs, &v->arch.user_regs, sizeof(c.nat->user_regs));
+        c.nat->user_regs.rbx               = v->arch.user_regs.rbx;
+        c.nat->user_regs.rcx               = v->arch.user_regs.rcx;
+        c.nat->user_regs.rdx               = v->arch.user_regs.rdx;
+        c.nat->user_regs.rsi               = v->arch.user_regs.rsi;
+        c.nat->user_regs.rdi               = v->arch.user_regs.rdi;
+        c.nat->user_regs.rbp               = v->arch.user_regs.rbp;
+        c.nat->user_regs.rax               = v->arch.user_regs.rax;
+        c.nat->user_regs.error_code        = v->arch.user_regs.error_code;
+        c.nat->user_regs.entry_vector      = v->arch.user_regs.entry_vector;
+        c.nat->user_regs.rip               = v->arch.user_regs.rip;
+        c.nat->user_regs.cs                = v->arch.user_regs.cs;
+        c.nat->user_regs.saved_upcall_mask = v->arch.user_regs.saved_upcall_mask;
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
@@ -1407,7 +1426,26 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
 #ifdef CONFIG_COMPAT
     else
     {
-        XLAT_cpu_user_regs(&c.cmp->user_regs, &v->arch.user_regs);
+        c.cmp->user_regs.ebx               = v->arch.user_regs.ebx;
+        c.cmp->user_regs.ecx               = v->arch.user_regs.ecx;
+        c.cmp->user_regs.edx               = v->arch.user_regs.edx;
+        c.cmp->user_regs.esi               = v->arch.user_regs.esi;
+        c.cmp->user_regs.edi               = v->arch.user_regs.edi;
+        c.cmp->user_regs.ebp               = v->arch.user_regs.ebp;
+        c.cmp->user_regs.eax               = v->arch.user_regs.eax;
+        c.cmp->user_regs.error_code        = v->arch.user_regs.error_code;
+        c.cmp->user_regs.entry_vector      = v->arch.user_regs.entry_vector;
+        c.cmp->user_regs.eip               = v->arch.user_regs.eip;
+        c.cmp->user_regs.cs                = v->arch.user_regs.cs;
+        c.cmp->user_regs.saved_upcall_mask = v->arch.user_regs.saved_upcall_mask;
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



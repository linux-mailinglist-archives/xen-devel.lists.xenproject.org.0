Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EDD2C6A3C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 17:55:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39666.72633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kih1Q-0007F1-4C; Fri, 27 Nov 2020 16:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39666.72633; Fri, 27 Nov 2020 16:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kih1Q-0007Ee-0y; Fri, 27 Nov 2020 16:55:00 +0000
Received: by outflank-mailman (input) for mailman id 39666;
 Fri, 27 Nov 2020 16:54:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kih1O-0007EZ-Nf
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 16:54:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67ae71ff-c17c-46e0-9c0a-54e16c53547b;
 Fri, 27 Nov 2020 16:54:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9879DAC0C;
 Fri, 27 Nov 2020 16:54:56 +0000 (UTC)
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
X-Inumbo-ID: 67ae71ff-c17c-46e0-9c0a-54e16c53547b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606496096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QxFMr9113kE5SXK+sT8NwDysjdRqA9O9J29bhcLGQX0=;
	b=BHSeDi6od3LJn5VLD5KDVnUsxqyJeDvVEB2dH/6GZAJoEwQNHhAtYGUAS4brtJi3gAD/8a
	QierUdKiMkAuthZhcaB3OQoTHdjrQYH48WlNtmlRYlFysRGHMVVrAtd9LCctWDwHJdAYzE
	2eH2Fn85+5LFS6XCvcTjsA8lVBe+TyU=
Subject: [PATCH 1/2] x86: correct is_pv_domain() when !CONFIG_PV
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7c040eff-2746-59e3-b657-64f5df3c9085@suse.com>
Message-ID: <54013074-1fc4-1047-0d00-2762fcbc9ade@suse.com>
Date: Fri, 27 Nov 2020 17:54:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <7c040eff-2746-59e3-b657-64f5df3c9085@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On x86, idle and other system domains are implicitly PV. While I
couldn't spot any cases where this is actively a problem, some cases
required quite close inspection to be certain there couldn't e.g. be
some ASSERT_UNREACHABLE() that would trigger in this case. Let's be on
the safe side and make sure these always have is_pv_domain() returning
true.

For the build to still work, this requires a few adjustments elsewhere.
In particular is_pv_64bit_domain() now gains a CONFIG_PV dependency,
which means that is_pv_32bit_domain() || is_pv_64bit_domain() is no
longer guaranteed to be the same as is_pv_domain().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -568,7 +568,7 @@ int __init construct_dom0(struct domain
 
     if ( is_hvm_domain(d) )
         rc = dom0_construct_pvh(d, image, image_headroom, initrd, cmdline);
-    else if ( is_pv_domain(d) )
+    else if ( is_pv_64bit_domain(d) || is_pv_32bit_domain(d) )
         rc = dom0_construct_pv(d, image, image_headroom, initrd, cmdline);
     else
         panic("Cannot construct Dom0. No guest interface available\n");
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1544,6 +1544,7 @@ arch_do_vcpu_op(
  */
 static void load_segments(struct vcpu *n)
 {
+#ifdef CONFIG_PV
     struct cpu_user_regs *uregs = &n->arch.user_regs;
     unsigned long gsb = 0, gss = 0;
     bool compat = is_pv_32bit_vcpu(n);
@@ -1709,6 +1710,7 @@ static void load_segments(struct vcpu *n
         regs->cs            = FLAT_KERNEL_CS;
         regs->rip           = pv->failsafe_callback_eip;
     }
+#endif
 }
 
 /*
@@ -1723,6 +1725,7 @@ static void load_segments(struct vcpu *n
  */
 static void save_segments(struct vcpu *v)
 {
+#ifdef CONFIG_PV
     struct cpu_user_regs *regs = &v->arch.user_regs;
 
     read_sregs(regs);
@@ -1748,6 +1751,7 @@ static void save_segments(struct vcpu *v
         else
             v->arch.pv.gs_base_user = gs_base;
     }
+#endif
 }
 
 void paravirt_ctxt_switch_from(struct vcpu *v)
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -408,13 +408,13 @@ long arch_do_domctl(
     case XEN_DOMCTL_set_address_size:
         if ( is_hvm_domain(d) )
             ret = -EOPNOTSUPP;
+        else if ( is_pv_64bit_domain(d) && domctl->u.address_size.size == 32 )
+            ret = switch_compat(d);
         else if ( is_pv_domain(d) )
         {
             if ( ((domctl->u.address_size.size == 64) && !d->arch.pv.is_32bit) ||
                  ((domctl->u.address_size.size == 32) &&  d->arch.pv.is_32bit) )
                 ret = 0;
-            else if ( domctl->u.address_size.size == 32 )
-                ret = switch_compat(d);
             else
                 ret = -EINVAL;
         }
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -985,7 +985,7 @@ static always_inline bool is_control_dom
 
 static always_inline bool is_pv_domain(const struct domain *d)
 {
-    return IS_ENABLED(CONFIG_PV) &&
+    return IS_ENABLED(CONFIG_X86) &&
         evaluate_nospec(!(d->options & XEN_DOMCTL_CDF_hvm));
 }
 
@@ -1011,7 +1011,7 @@ static always_inline bool is_pv_32bit_vc
 
 static always_inline bool is_pv_64bit_domain(const struct domain *d)
 {
-    if ( !is_pv_domain(d) )
+    if ( !IS_ENABLED(CONFIG_PV) || !is_pv_domain(d) )
         return false;
 
 #ifdef CONFIG_PV32



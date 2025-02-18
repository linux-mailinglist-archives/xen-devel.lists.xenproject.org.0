Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CB0A3AB3E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 22:42:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892271.1301267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkVMF-0005ln-Ew; Tue, 18 Feb 2025 21:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892271.1301267; Tue, 18 Feb 2025 21:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkVMF-0005j4-Bp; Tue, 18 Feb 2025 21:42:23 +0000
Received: by outflank-mailman (input) for mailman id 892271;
 Tue, 18 Feb 2025 21:42:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qrz8=VJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tkVME-0005iy-0D
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 21:42:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a2f6d65-ee41-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 22:42:19 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EABA35C61AE;
 Tue, 18 Feb 2025 21:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E984EC4CEE8;
 Tue, 18 Feb 2025 21:42:16 +0000 (UTC)
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
X-Inumbo-ID: 3a2f6d65-ee41-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739914937;
	bh=oByOGKXwwpScja5mn7ur/6LBBdgdm77VjGsWjBFb2AI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aWMB3ITlibvgClOmJXx1PpKGV69hHQddI5Lm3Y5pM7C28P0xu7QqW+zByNfb7GMyI
	 hTtitq/P7fwiLXmVe88LGxsgswH+x377JectkY4tN/VHsdxuZmr/bj9xPntiEbb96U
	 TVDz2Mk38gut8CGMPppA5N60jnosC40GqnaQxzumBwxeEKJPShwifduDvGoYoJAWAh
	 PBTt4nsSV2vVdDcIvhAc6Lzz0E4dywu6a+pqRoqgNxWlY3oT8pHqaQvkFuT81vcXOw
	 ygn1yC5KCOI9/86joLmtx7KZX3AThvdWknjoskd4wB3VvvRppiCDS3/S+ZoqWrKNiD
	 vGU88zCYg7VAA==
Date: Tue, 18 Feb 2025 13:42:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, consulting@bugseng.com, 
    xen-devel@lists.xenproject.org
Subject: Re: xen/x86: resolve the last 3 MISRA R16.6 violations
In-Reply-To: <c24f9d41-1cf4-4cfc-ba11-6ad1d1223e9f@suse.com>
Message-ID: <alpine.DEB.2.22.394.2502181338150.1085376@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502141811180.3858257@ubuntu-linux-20-04-desktop> <daaf4284-102c-4fc4-819c-2231705ab572@suse.com> <alpine.DEB.2.22.394.2502171509330.1085376@ubuntu-linux-20-04-desktop> <c24f9d41-1cf4-4cfc-ba11-6ad1d1223e9f@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 18 Feb 2025, Jan Beulich wrote:
> On 18.02.2025 00:12, Stefano Stabellini wrote:
> > On Mon, 17 Feb 2025, Jan Beulich wrote:
> >> On 15.02.2025 03:16, Stefano Stabellini wrote:
> >>> --- a/xen/arch/x86/hvm/hvm.c
> >>> +++ b/xen/arch/x86/hvm/hvm.c
> >>> @@ -3797,22 +3797,14 @@ uint64_t hvm_get_reg(struct vcpu *v, unsigned int reg)
> >>>  {
> >>>      ASSERT(v == current || !vcpu_runnable(v));
> >>>  
> >>> -    switch ( reg )
> >>> -    {
> >>> -    default:
> >>> -        return alternative_call(hvm_funcs.get_reg, v, reg);
> >>> -    }
> >>> +    return alternative_call(hvm_funcs.get_reg, v, reg);
> >>>  }
> >>>  
> >>>  void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
> >>>  {
> >>>      ASSERT(v == current || !vcpu_runnable(v));
> >>>  
> >>> -    switch ( reg )
> >>> -    {
> >>> -    default:
> >>> -        return alternative_vcall(hvm_funcs.set_reg, v, reg, val);
> >>> -    }
> >>> +    return alternative_vcall(hvm_funcs.set_reg, v, reg, val);
> >>>  }
> >>
> >> Both of these were, iirc, deliberately written using switch(), to ease
> >> possible future changes.
> > 
> > To be honest, I do not see any value in the way they are currently
> > written. However, if you prefer, I can add a deviation for this, with
> > one SAF comment for each of these two. The reason for the deviation
> > would be "deliberate to ease possible future change". Please let me know
> > how you would like to proceed.
> 
> Well, best next thing you can do is seek input from the person who has
> written that code, i.e. Andrew.

Andrew wrote in chat that he is OK with a deviation and he can live with
a SAF deviation. Here is the patch.


---
xen/x86: resolve the last 3 MISRA R16.6 violations

MISRA R16.6 states that "Every switch statement shall have at least two
switch-clauses". There are only 3 violations left on x86 (zero on ARM).

One of them is only a violation depending on the kconfig configuration.
So deviate it instead with a SAF comment.

Two of them are deliberate to enable future additions. Deviate them as
such.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index b8a4f878ea..3d68b59169 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -92,6 +92,22 @@
         },
         {
             "id": "SAF-11-safe",
+            "analyser": {
+                "eclair": "MC3A2.R16.6"
+            },
+            "name": "Rule 16.6: single clause due to kconfig",
+            "text": "A switch statement with a single switch clause because other switch clauses are disabled in a given kconfig is safe."
+        },
+        {
+            "id": "SAF-12-safe",
+            "analyser": {
+                "eclair": "MC3A2.R16.6"
+            },
+            "name": "Rule 16.6: single clause due to future expansion",
+            "text": "A switch statement with a single switch clause to purposely enable future additions of new cases is safe."
+        },
+        {
+            "id": "SAF-13-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 39e39ce4ce..0f0630769b 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3797,6 +3797,7 @@ uint64_t hvm_get_reg(struct vcpu *v, unsigned int reg)
 {
     ASSERT(v == current || !vcpu_runnable(v));
 
+    /* SAF-12-safe */
     switch ( reg )
     {
     default:
@@ -3808,6 +3809,7 @@ void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
 {
     ASSERT(v == current || !vcpu_runnable(v));
 
+    /* SAF-12-safe */
     switch ( reg )
     {
     default:
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 87b30ce4df..dca11a613d 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -436,6 +436,7 @@ unsigned long get_stack_trace_bottom(unsigned long sp)
 
 static unsigned long get_shstk_bottom(unsigned long sp)
 {
+    /* SAF-11-safe */
     switch ( get_stack_page(sp) )
     {
 #ifdef CONFIG_XEN_SHSTK


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 799A54EDC99
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 17:19:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297022.505812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZwZ4-0004DK-A5; Thu, 31 Mar 2022 15:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297022.505812; Thu, 31 Mar 2022 15:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZwZ4-0004AR-66; Thu, 31 Mar 2022 15:18:22 +0000
Received: by outflank-mailman (input) for mailman id 297022;
 Thu, 31 Mar 2022 15:18:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dd35=UK=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nZwZ3-0004AL-7r
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 15:18:21 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca29af43-b105-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 17:18:17 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 22VFI13M076536
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 31 Mar 2022 11:18:07 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 22VFI1kM076535;
 Thu, 31 Mar 2022 08:18:01 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: ca29af43-b105-11ec-8fbc-03012f2f19d4
Date: Thu, 31 Mar 2022 08:18:01 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: OS Headers hypercall.h/hypervisor.h
Message-ID: <YkXGKWj7p2rrkH9K@mattapan.m5p.com>
References: <Yj+ekdLdRa9U7dfa@mattapan.m5p.com>
 <alpine.DEB.2.22.394.2203281523230.2910984@ubuntu-linux-20-04-desktop>
 <c999faa3-ded7-64af-7bf1-f6b8e5620425@suse.com>
 <YkUAlWH6imVV9D00@mattapan.m5p.com>
 <701a0bdc-a8d3-06c3-7e40-e741dfa45361@xen.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="SJ7EfckpMTXlr9lj"
Content-Disposition: inline
In-Reply-To: <701a0bdc-a8d3-06c3-7e40-e741dfa45361@xen.org>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com


--SJ7EfckpMTXlr9lj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 31, 2022 at 09:44:06AM +0100, Julien Grall wrote:
> 
> On 31/03/2022 02:15, Elliott Mitchell wrote:
> > On Tue, Mar 29, 2022 at 08:27:24AM +0200, Jan Beulich wrote:
> >> On 29.03.2022 00:25, Stefano Stabellini wrote:
> >>> On Sat, 26 Mar 2022, Elliott Mitchell wrote:
> >>>> The hypercalls implementation for Linux and FreeBSD have two key headers,
> >>>> hypercall.h and hypervisor.h.  I'm curious why the implementations for
> >>>> x86 and ARM* are so distinct.
> >>>>
> >>>> I found it fairly straightforward to implement ARM* versions of the x86
> >>>> _hypercall#() macros.  Once that is done, most of the wrappers in the x86
> >>>> hypercall.h can be moved to a shared hypervisor.h header.
> >>>>
> >>>> Why does Xen/ARM on Linux still have hypercall.S when merging the
> >>>> headers should reduce maintainance?
> >>>>
> >>>> Was GCC extended inline assembly language for ARM* thought too awful?
> >>>>
> >>>> I'm also curious why these headers are part of the Linux kernel, instead
> >>>> of being maintained by the Xen Project?
> >>>
> >>> I would have to dig through ancient archives to give you a full answer
> >>> but the reason was that the asm inline on ARM didn't provide enough
> >>> guarantees on ordering and registers it would use and clobber.
> >>
> >> While there may be ordering issues (albeit most ought to be taken care
> >> of by marking the asm() volatile and having it have a memory clobber),
> >> registers used / clobbered ought to always be expressable by asm() -
> >> if not by constraints covering just a single register (such frequently
> >> simply don't exist), then by using register variables tied to a
> >> particular register. Of course in all of this there's an assumption of
> >> no bugs in this area in the compilers claimed as being supported ...
> > 
> > I'm merely been working with recent versions of Clang on FreeBSD, but
> > I've got something which appears to work.
> > 
> > I would be somewhat hopeful GCC might have fewer bugs on ARM as
> > registers aren't so precious.  Yet that could well be a minefield.
> 
> Linux and Xen have already some code heavily using inline assembly for 
> the SMCCC v1.1 helpers. So, in theory, it should be possible to convert 
> the hypercall to use inline assembly helpers.
> 
> Unlike SMCCC v1.1, the hypercalls are following the AAPCS. So by using 
> the assembly wrapper we don't have to worry on what to save as the 
> compiler will automatically know what to do. Looking at 
> xen/include/public/arch-arm.h, we may be able to reduce the numbers of 
> registers to preserve. So it would be more interesting to switch to 
> inline assembly to reduce the number of instructions.
> 
> That said, we also need to be mindful of straigh-line speculation with 
> HVC instruction. With the inline version, the speculation barrier (sb or 
> dsb/isb) would need to be architecturally executed. With the assembly 
> wrapper, I believe we could only speculatively execute it by adding 
> after the ret.
> 
> Note that Linux doesn't have the speculation barrier yet. In in two mind 
> whether it should be added. In one hand, it would be good to make the 
> hypercalls safe by default (IOW the caller doesn't need to check for 
> gadget after). On the other hand, AFAIK the path would only be reachable 
> with root privileges.
> 
> That said, the security posture may be different on other OS. So if we 
> intend to share the header with other OS, then the current approach 
> might be better.

Guess I should simply send out what I've got right now.

The idea is all the HYPERVISOR_*() wrappers which both Linux and FreeBSD
have in the architecture hypercall.h could be moved to hypervisor.h.
This generates _hypercall#() wrapper macros which match the x86
_hypercall#() inline functions.  The actual underlying inline functions
are __hypercall_xen_#().

The underlying inline functions place the arguments first and op code
last.  The reason is ARM places the arguments in r0-r4/x0-x4 and the
inline function could end up emitting a bunch of instructions shuffling
these.  With the op code last the compiler may emit a move instruction
for the op code, but the arguments will pass straight through.

The attached patch is marked as FreeBSD's license, because I've been
trying to get FreeBSD running on Xen/ARM.  I'm fine with it under Xen's
license or GPL 2.0+.  This has been tested and appears to work, but I
won't be surprised if it doesn't match what people want.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



--SJ7EfckpMTXlr9lj
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-xen-arm64-implement-aarch64-Xen-hypercall-header.patch"

From 8ad5602f26a0f7b9a04cbda33330ba8004d8fcc1 Mon Sep 17 00:00:00 2001
From: Elliott Mitchell <ehem+xen@m5p.com>
Date: Mon, 7 Mar 2022 18:26:31 -0800
Subject: [PATCH] xen/arm64: implement aarch64 Xen hypercall header
To: xen-devel@lists.xenproject.org

Match the i386/AMD64 headers in doing inline functions for the Xen
hypervisor calls.  This has been heavily inspired by work done by
Julien Grall and Stefano Stabellini.

---
 sys/arm64/include/xen/hypercall.h | 148 ++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)
 create mode 100644 sys/arm64/include/xen/hypercall.h

diff --git a/sys/arm64/include/xen/hypercall.h b/sys/arm64/include/xen/hypercall.h
new file mode 100644
index 00000000000..b8e51611f26
--- /dev/null
+++ b/arm64/include/xen/hypercall.h
@@ -0,0 +1,148 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0+ OR BSD-2-Clause-FreeBSD
+ *
+ * Copyright (c) 2022 Elliott Mitchell
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
+ * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
+ * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+ * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
+ * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+ * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+ * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+ * SUCH DAMAGE.
+ */
+
+#ifndef __MACHINE_ARM64_XEN_HYPERCALL_H__
+#define __MACHINE_ARM64_XEN_HYPERCALL_H__
+__FBSDID("$FreeBSD$");
+
+#ifndef __XEN_HYPERVISOR_H__
+# error "please don't include this file directly"
+#endif
+
+/*
+ * See the Xen contrib header: xen/arch-arm.h for details on Xen's
+ * hypercall calling conventions.
+ *
+ * The hypercall number is passed in r12/x16.
+ *
+ * Input parameters are in r0-r4/x0-x4 as appropriate to the number of
+ * arguments.  Input registers are clobbered.
+ *
+ * Return is in r0/x0.
+ *
+ * The hypercall tag for Xen is 0x0EA1.
+ */
+
+#define	hypercallf(NUM, ARGS, REGVAR, REGASM)	\
+	static inline long						\
+	__hypercall_xen_##NUM(ARGS long op)				\
+	{								\
+		register long _op __asm__(OPREG) = op;			\
+		REGVAR							\
+		__asm__ volatile (					\
+			"hvc #0x0EA1;\n"				\
+			: "+r" (_op)REGASM				\
+			: /* clobbered inputs, are outputs, really */	\
+			: "memory"					\
+		);							\
+		return (_arg0);						\
+	}
+
+#ifndef __ILP32__
+#define	OPREG	"x16"
+#define	REGPRE	"x"
+#else
+#define	OPREG	"r12"
+#define	REGPRE	"r"
+#endif
+
+#define	COMMAS(...)	__VA_ARGS__
+#define	ARG(n)	long arg##n,
+#define	VAR(n)	register long _arg##n __asm__(REGPRE __STRING(n)) = arg##n;
+#define	REG(n)	, "+r" (_arg##n)
+
+
+#define	hypercall0(NUM, ARGS, REGVAR, REGASM)	\
+	hypercallf(NUM,, register long _arg0 __asm__(REGPRE"0");,	\
+		COMMAS(, "=r" (_arg0)))
+
+#define	hypercall1(NUM, ARGS, REGVAR, REGASM)	\
+	hypercallf(NUM, COMMAS(ARG(0)ARGS), VAR(0)REGVAR, COMMAS(REG(0)REGASM))
+
+#define	hypercall2(NUM, ARGS, REGVAR, REGASM)	\
+	hypercall1(NUM, COMMAS(ARG(1)ARGS), VAR(1)REGVAR, COMMAS(REG(1)REGASM))
+
+#define	hypercall3(NUM, ARGS, REGVAR, REGASM)	\
+	hypercall2(NUM, COMMAS(ARG(2)ARGS), VAR(2)REGVAR, COMMAS(REG(2)REGASM))
+
+#define	hypercall4(NUM, ARGS, REGVAR, REGASM)	\
+	hypercall3(NUM, COMMAS(ARG(3)ARGS), VAR(3)REGVAR, COMMAS(REG(3)REGASM))
+
+#define	hypercall5(NUM, ARGS, REGVAR, REGASM)	\
+	hypercall4(NUM, COMMAS(ARG(4)ARGS), VAR(4)REGVAR, COMMAS(REG(4)REGASM))
+
+#define	hypercall(NUM)	hypercall##NUM(NUM,,,)
+
+/* the actual inline function definitions */
+
+hypercall(0)
+hypercall(1)
+hypercall(2)
+hypercall(3)
+hypercall(4)
+hypercall(5)
+
+/* cleanup */
+
+#undef	hypercallf
+#undef	OPREG
+#undef	REGPRE
+#undef	COMMAS
+#undef	ARG
+#undef	VAR
+#undef	REG
+
+#undef	hypercall0
+#undef	hypercall1
+#undef	hypercall2
+#undef	hypercall3
+#undef	hypercall4
+#undef	hypercall
+
+/* the wrappers expected by hypervisor.h */
+
+#define	_hypercall0(type, name)	\
+	(type)__hypercall_xen_0(__HYPERVISOR_##name)
+#define	_hypercall1(type, name, arg0)	\
+	(type)__hypercall_xen_1((long)(arg0), __HYPERVISOR_##name)
+#define	_hypercall2(type, name, arg0, arg1)	\
+	(type)__hypercall_xen_2((long)(arg0), (long)(arg1),	\
+		__HYPERVISOR_##name)
+#define	_hypercall3(type, name, arg0, arg1, arg2)	\
+	(type)__hypercall_xen_3((long)(arg0), (long)(arg1),	\
+		(long)(arg2), __HYPERVISOR_##name)
+#define	_hypercall4(type, name, arg0, arg1, arg2, arg3)	\
+	(type)__hypercall_xen_4((long)(arg0), (long)(arg1),	\
+		(long)(arg2), (long)(arg3), __HYPERVISOR_##name)
+#define	_hypercall5(type, name, arg0, arg1, arg2, arg3, arg4)	\
+	(type)__hypercall_xen_5((long)(arg0), (long)(arg1),	\
+		(long)(arg2), (long)(arg3), (long)(arg4), __HYPERVISOR_##name)
+
+#define	privcmd_hypercall(op, arg0, arg1, arg2, arg3, arg4)	\
+	(int)__hypercall_xen_5((arg0), (arg1), (arg2), (arg3), (arg4), (op))
+
+#endif /* __MACHINE_ARM64_XEN_HYPERCALL_H__ */
-- 
2.30.2


--SJ7EfckpMTXlr9lj--


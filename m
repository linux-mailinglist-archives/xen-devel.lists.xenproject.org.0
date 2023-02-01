Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C10D685CA3
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 02:32:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487995.755845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN1xi-0001pI-R0; Wed, 01 Feb 2023 01:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487995.755845; Wed, 01 Feb 2023 01:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN1xi-0001ne-La; Wed, 01 Feb 2023 01:30:58 +0000
Received: by outflank-mailman (input) for mailman id 487995;
 Wed, 01 Feb 2023 01:30:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiZ6=55=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pN1xg-0001nY-OP
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 01:30:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 101c0c5c-a1d0-11ed-b63b-5f92e7d2e73a;
 Wed, 01 Feb 2023 02:30:52 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 826536098A;
 Wed,  1 Feb 2023 01:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D550C433D2;
 Wed,  1 Feb 2023 01:30:49 +0000 (UTC)
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
X-Inumbo-ID: 101c0c5c-a1d0-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675215050;
	bh=U/1z8e8d/tq25Kzt4j9FU3/4jdlftRctNW3sDc8LYMU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uSQYvBKeoBUcvjvW5ebm6NIqwCITlhkHHCAYxwqZhtL2Jc8SQxcEmpXq7XNJ7FNj6
	 Qp1jwa6jBJ67Fj1lqX/0u31GQEKe4sJbe11GyhWmKzl5pecUvNKXgRqF7091S2h87n
	 PUXHzXuEFGeQa+a2yLsVoUs8tLBotGI74Y028ufwpYB/GSv05mwDzKRJvcCYPuLUcd
	 ARcdWWz06MIufid0p+eAvBI5VF/RhCe5OAA6F+C4A3cr7j59Dmh+IVc0m1ZSxQ9IpX
	 avbSortQG5UZkY1JItv939cd2wVeM/b5Yf3ss2mjBxgeKFZkIhshntRqt5Duz4g5WS
	 Xrp+oBCrx+FMg==
Date: Tue, 31 Jan 2023 17:30:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Oleksii <oleksii.kurochko@gmail.com>, Julien Grall <julien@xen.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Gianluca Guida <gianluca@rivosinc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Bobby Eshleman <bobby.eshleman@gmail.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 07/14] xen/riscv: introduce exception context
In-Reply-To: <bdb8c6a8-a677-9bef-c819-904bd944e6da@suse.com>
Message-ID: <alpine.DEB.2.22.394.2301311719490.132504@ubuntu-linux-20-04-desktop>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com> <652289358975cf869e4bc0a6a70e3aba7bd2fbf6.1674818705.git.oleksii.kurochko@gmail.com> <75328420-0fbd-92ae-40c7-9fee1c31c907@suse.com> <792bc4533d3604acd4321b4b15965adec22431a4.camel@gmail.com>
 <bdb8c6a8-a677-9bef-c819-904bd944e6da@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-900873961-1675215050=:132504"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-900873961-1675215050=:132504
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 30 Jan 2023, Jan Beulich wrote:
> On 30.01.2023 12:54, Oleksii wrote:
> > Hi Jan,
> > 
> > On Fri, 2023-01-27 at 15:24 +0100, Jan Beulich wrote:
> >> On 27.01.2023 14:59, Oleksii Kurochko wrote:
> >>> --- /dev/null
> >>> +++ b/xen/arch/riscv/include/asm/processor.h
> >>> @@ -0,0 +1,82 @@
> >>> +/* SPDX-License-Identifier: MIT */
> >>> +/*****************************************************************
> >>> *************
> >>> + *
> >>> + * Copyright 2019 (C) Alistair Francis <alistair.francis@wdc.com>
> >>> + * Copyright 2021 (C) Bobby Eshleman <bobby.eshleman@gmail.com>
> >>> + * Copyright 2023 (C) Vates
> >>> + *
> >>> + */
> >>> +
> >>> +#ifndef _ASM_RISCV_PROCESSOR_H
> >>> +#define _ASM_RISCV_PROCESSOR_H
> >>> +
> >>> +#ifndef __ASSEMBLY__
> >>> +
> >>> +/* On stack VCPU state */
> >>> +struct cpu_user_regs
> >>> +{
> >>> +    unsigned long zero;
> >>> +    unsigned long ra;
> >>> +    unsigned long sp;
> >>> +    unsigned long gp;
> >>> +    unsigned long tp;
> >>> +    unsigned long t0;
> >>> +    unsigned long t1;
> >>> +    unsigned long t2;
> >>> +    unsigned long s0;
> >>> +    unsigned long s1;
> >>> +    unsigned long a0;
> >>> +    unsigned long a1;
> >>> +    unsigned long a2;
> >>> +    unsigned long a3;
> >>> +    unsigned long a4;
> >>> +    unsigned long a5;
> >>> +    unsigned long a6;
> >>> +    unsigned long a7;
> >>> +    unsigned long s2;
> >>> +    unsigned long s3;
> >>> +    unsigned long s4;
> >>> +    unsigned long s5;
> >>> +    unsigned long s6;
> >>> +    unsigned long s7;
> >>> +    unsigned long s8;
> >>> +    unsigned long s9;
> >>> +    unsigned long s10;
> >>> +    unsigned long s11;
> >>> +    unsigned long t3;
> >>> +    unsigned long t4;
> >>> +    unsigned long t5;
> >>> +    unsigned long t6;
> >>> +    unsigned long sepc;
> >>> +    unsigned long sstatus;
> >>> +    /* pointer to previous stack_cpu_regs */
> >>> +    unsigned long pregs;
> >>> +};
> >>
> >> Just to restate what I said on the earlier version: We have a struct
> >> of
> >> this name in the public interface for x86. Besides to confusion about
> >> re-using the name for something private, I'd still like to understand
> >> what the public interface plans are. This is specifically because I
> >> think it would be better to re-use suitable public interface structs
> >> internally where possible. But that of course requires spelling out
> >> such parts of the public interface first.
> >>
> > I am not sure that I get you here.
> > I greped a little bit and found out that each architecture declares
> > this structure inside arch-specific folder.
> > 
> > Mostly the usage of the cpu_user_regs is to save/restore current state
> > of CPU during traps ( exceptions/interrupts ) and context_switch().
> 
> Arm effectively duplicates the public interface struct vcpu_guest_core_regs
> and the internal struct cpu_user_regs (and this goes as far as also
> duplicating the __DECL_REG() helper). Personally I find such duplication
> odd at the first glance at least; maybe there is a specific reason for this
> in Arm. But whether the public interface struct can be re-used can likely
> only be known once it was spelled out.

struct vcpu_guest_core_regs is used as part of struct
vcpu_guest_context, which is used for VCPUOP_initialise, which is not
used on ARM and RISC-V (we use a standard firmware interface instead),
and for save/restore, which also is not going to work any time soon on
ARM and RISC-V.

This is to say that we are probably not going to need the public
interface for the next year or two, so it is difficult to tell at this
stage if it aligns well with struct cpu_user_regs. I think we'll have to
cross that bridge when we come to it.


> > Also some registers are modified during construction of a domain.
> > Thereby I prefer here to see the arch-specific register names instead
> > of common.
> 
> Not sure what meaning of "common" you imply here. Surely register names
> want to be arch-specific, and hence can't be "common" with other arch-es.

I think Oleksii misunderstood your request and believed you were asking
him to make struct cpu_user_regs common across arches.
--8323329-900873961-1675215050=:132504--


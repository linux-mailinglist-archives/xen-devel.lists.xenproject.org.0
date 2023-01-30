Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 039C0680C7C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 12:54:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486941.754389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMSjv-0004GP-9u; Mon, 30 Jan 2023 11:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486941.754389; Mon, 30 Jan 2023 11:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMSjv-0004Dx-71; Mon, 30 Jan 2023 11:54:23 +0000
Received: by outflank-mailman (input) for mailman id 486941;
 Mon, 30 Jan 2023 11:54:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdfF=53=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pMSjt-0004Dr-VM
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 11:54:22 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4fd9997-a094-11ed-9ec0-891035b88211;
 Mon, 30 Jan 2023 12:54:20 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id v13so10659124eda.11
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jan 2023 03:54:20 -0800 (PST)
Received: from pc-879.home (83.29.147.144.ipv4.supernova.orange.pl.
 [83.29.147.144]) by smtp.gmail.com with ESMTPSA id
 eo14-20020a056402530e00b0049e08f781e3sm6691931edb.3.2023.01.30.03.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 03:54:19 -0800 (PST)
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
X-Inumbo-ID: d4fd9997-a094-11ed-9ec0-891035b88211
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qSDmlF2OoJ5Q3AsZwDCdJTqMVugx7W+X3PB8E4z01XM=;
        b=QnfodsB2k2oSsLqV28vxcjdzPLACAXihEd1IaRzqLhf6Fo/RUeEg5At9AXhf7dTwCJ
         MSgzH32qBwGW7PpWqYWr8tbriRGkPuR6PBeOrqdYXDad32oiv0wfBlbTITtzol5Goa7e
         LDKGFXLAlePIEjqql91fdNbmwH1C+ZUx2RJccPJafXTrNuiQKEECjPUV8Vgk9yX1u2fU
         9Hvti6SHHGmQGFZYix4cVZEPToda/wyXLpbxwsBNECHQUhBf6njgTSNF81TSK0SIhIqI
         M9NtnKwUPvKNDzqOJVrnQMFtzjgbqTWbwsgpL7VddMAzCeDaik4CVSUApLbMhQPexpf8
         jhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qSDmlF2OoJ5Q3AsZwDCdJTqMVugx7W+X3PB8E4z01XM=;
        b=GGLKNtORhT5VqnvArZa0DGRfM188aB6DisXY0TNQ3YdQX5EXJoXoTqWM2l/ssiW9uc
         yuVwM8dp0zWKvXTcClVvoQELgwmereRtIDFEHKdqvqiwtIZvfB47bi8MySEp8Y0eKFu8
         PW1jeoQuRTcRWUCetu/va759Hhi0REpSaw4AyS3VfUKClHAY5A4xhM5f+fwZzKUaW/O1
         46j0eiCcZ90q2L1fs6HT1NUNYJQbnRI0nl/2YclXQ1xvWzjcNKGMUF9lkEQMkl6KkuKw
         kkJ4uhsqW85kxAqb2UGzholQt3bPp2h4KH3DTLZ5H4dzf9xalIs5UEUxLoqeAChJqzL2
         /PfQ==
X-Gm-Message-State: AFqh2koP0xnnL+c+0+bPYU1g85c4EBmlpfqdlR0RgzcwG5gX6hdF8RzB
	ClEKmXGznmq3jGHw0ZQ41nFWqf7SmwE=
X-Google-Smtp-Source: AMrXdXtxAle95+0/a/wgHd7z1KT/zqWqRIN401nvw7Y8v1Q0u7kILqm9Rb10v8FZX3sbjmtz2JJ3Aw==
X-Received: by 2002:a05:6402:4026:b0:49e:4786:a0e2 with SMTP id d38-20020a056402402600b0049e4786a0e2mr52987540eda.14.1675079660331;
        Mon, 30 Jan 2023 03:54:20 -0800 (PST)
Message-ID: <792bc4533d3604acd4321b4b15965adec22431a4.camel@gmail.com>
Subject: Re: [PATCH v2 07/14] xen/riscv: introduce exception context
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, Bobby Eshleman
 <bobby.eshleman@gmail.com>,  xen-devel@lists.xenproject.org
Date: Mon, 30 Jan 2023 13:54:18 +0200
In-Reply-To: <75328420-0fbd-92ae-40c7-9fee1c31c907@suse.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
	 <652289358975cf869e4bc0a6a70e3aba7bd2fbf6.1674818705.git.oleksii.kurochko@gmail.com>
	 <75328420-0fbd-92ae-40c7-9fee1c31c907@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

Hi Jan,

On Fri, 2023-01-27 at 15:24 +0100, Jan Beulich wrote:
> On 27.01.2023 14:59, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/processor.h
> > @@ -0,0 +1,82 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*****************************************************************
> > *************
> > + *
> > + * Copyright 2019 (C) Alistair Francis <alistair.francis@wdc.com>
> > + * Copyright 2021 (C) Bobby Eshleman <bobby.eshleman@gmail.com>
> > + * Copyright 2023 (C) Vates
> > + *
> > + */
> > +
> > +#ifndef _ASM_RISCV_PROCESSOR_H
> > +#define _ASM_RISCV_PROCESSOR_H
> > +
> > +#ifndef __ASSEMBLY__
> > +
> > +/* On stack VCPU state */
> > +struct cpu_user_regs
> > +{
> > +=C2=A0=C2=A0=C2=A0 unsigned long zero;
> > +=C2=A0=C2=A0=C2=A0 unsigned long ra;
> > +=C2=A0=C2=A0=C2=A0 unsigned long sp;
> > +=C2=A0=C2=A0=C2=A0 unsigned long gp;
> > +=C2=A0=C2=A0=C2=A0 unsigned long tp;
> > +=C2=A0=C2=A0=C2=A0 unsigned long t0;
> > +=C2=A0=C2=A0=C2=A0 unsigned long t1;
> > +=C2=A0=C2=A0=C2=A0 unsigned long t2;
> > +=C2=A0=C2=A0=C2=A0 unsigned long s0;
> > +=C2=A0=C2=A0=C2=A0 unsigned long s1;
> > +=C2=A0=C2=A0=C2=A0 unsigned long a0;
> > +=C2=A0=C2=A0=C2=A0 unsigned long a1;
> > +=C2=A0=C2=A0=C2=A0 unsigned long a2;
> > +=C2=A0=C2=A0=C2=A0 unsigned long a3;
> > +=C2=A0=C2=A0=C2=A0 unsigned long a4;
> > +=C2=A0=C2=A0=C2=A0 unsigned long a5;
> > +=C2=A0=C2=A0=C2=A0 unsigned long a6;
> > +=C2=A0=C2=A0=C2=A0 unsigned long a7;
> > +=C2=A0=C2=A0=C2=A0 unsigned long s2;
> > +=C2=A0=C2=A0=C2=A0 unsigned long s3;
> > +=C2=A0=C2=A0=C2=A0 unsigned long s4;
> > +=C2=A0=C2=A0=C2=A0 unsigned long s5;
> > +=C2=A0=C2=A0=C2=A0 unsigned long s6;
> > +=C2=A0=C2=A0=C2=A0 unsigned long s7;
> > +=C2=A0=C2=A0=C2=A0 unsigned long s8;
> > +=C2=A0=C2=A0=C2=A0 unsigned long s9;
> > +=C2=A0=C2=A0=C2=A0 unsigned long s10;
> > +=C2=A0=C2=A0=C2=A0 unsigned long s11;
> > +=C2=A0=C2=A0=C2=A0 unsigned long t3;
> > +=C2=A0=C2=A0=C2=A0 unsigned long t4;
> > +=C2=A0=C2=A0=C2=A0 unsigned long t5;
> > +=C2=A0=C2=A0=C2=A0 unsigned long t6;
> > +=C2=A0=C2=A0=C2=A0 unsigned long sepc;
> > +=C2=A0=C2=A0=C2=A0 unsigned long sstatus;
> > +=C2=A0=C2=A0=C2=A0 /* pointer to previous stack_cpu_regs */
> > +=C2=A0=C2=A0=C2=A0 unsigned long pregs;
> > +};
>=20
> Just to restate what I said on the earlier version: We have a struct
> of
> this name in the public interface for x86. Besides to confusion about
> re-using the name for something private, I'd still like to understand
> what the public interface plans are. This is specifically because I
> think it would be better to re-use suitable public interface structs
> internally where possible. But that of course requires spelling out
> such parts of the public interface first.
>=20
I am not sure that I get you here.
I greped a little bit and found out that each architecture declares
this structure inside arch-specific folder.

Mostly the usage of the cpu_user_regs is to save/restore current state
of CPU during traps ( exceptions/interrupts ) and context_switch().
Also some registers are modified during construction of a domain.
Thereby I prefer here to see the arch-specific register names instead
of common.

> Jan
~ Oleksii


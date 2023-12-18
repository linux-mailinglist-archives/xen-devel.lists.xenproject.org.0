Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDDE816CB4
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 12:44:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655895.1023791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFC2d-0002Ev-NG; Mon, 18 Dec 2023 11:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655895.1023791; Mon, 18 Dec 2023 11:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFC2d-0002CK-KR; Mon, 18 Dec 2023 11:44:11 +0000
Received: by outflank-mailman (input) for mailman id 655895;
 Mon, 18 Dec 2023 11:44:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f46f=H5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFC2c-0002CE-Lj
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 11:44:10 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c133d4dc-9d9a-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 12:44:08 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50e2168ab09so3060251e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 03:44:08 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 x12-20020ac259cc000000b0050e36a32b15sm357210lfn.239.2023.12.18.03.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:44:08 -0800 (PST)
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
X-Inumbo-ID: c133d4dc-9d9a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702899848; x=1703504648; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jwtWEkrks9hDrtQJ3eN3j9qk8j1ZB8qqi3LeuLEC+zM=;
        b=nGzNX0yQZY1Mt0BepmAmoGFcXQR2DeSXOhlQYLIGfosL3wzE1CNK6+tZZzo4ADfE/K
         XH6mJsQp/qAled8oCGkgaZ8rZo60o7aWrhEyDn0C+lKp59z+RdAK0lYjfiyK790WzNQ6
         PcGd1JLtB2OAEz0GyKg/jcG9xIOf95j1qe09QVI20bMmAfpnA48SG3dZP/qETmy3slhj
         CI/CIcPeaZiFyYp6EfToA7lteTPXrJtcs0xBsk6tk2YOwlwUdxkYGvHqjOiEEdc2LLFE
         VjVMS+jXG+XMtca7CzaQfmuUalS2eSvYr1TN2c5SawNPDXqEIeEIMcsiqMFWRxbusw3k
         7MBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702899848; x=1703504648;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jwtWEkrks9hDrtQJ3eN3j9qk8j1ZB8qqi3LeuLEC+zM=;
        b=jnFQFz4hTJRkVvIeJzJtTzA++7lSIaFdYC7NrxrPitHigLhj/Mpv0+7/qhakInfQyo
         lFOQIjkBacmrSjd0c5ajwvS9d5ROMiJ3NTjYyIWghQGpdpWY6KSSPkLWDfyc7dAh70uD
         JD5xLB+GkpPH2BHWbYcMdJqDVaoUFH1Uo1O3dtg9PgS0zUByIxI72dfgml4TBu1nE5KM
         Og9hOuypkbtrvX5B8PUm3BS7o3ndmrA1tV8AnON5wWqNjdrdmMWaEVo3k/Xh/jOQCtyf
         KFqZNGMtEesYjPitNo58+SvXNBYfYMu035HKZZDeS9tp/dIgWB2VE7um0WvO/kABIxvv
         mXVQ==
X-Gm-Message-State: AOJu0YwdZmejUKB8ZOuEOshc4M+922VzYKzWgRqAJcPw0JAja3wVoGdo
	Tq+ThPcn5AXFMybiC40Svfk=
X-Google-Smtp-Source: AGHT+IGVfYrZ7fchrUP0EQxwjTGK7AXHdmQfUdgEfU3Qo62DiRntudOoHB1bD0Wsaf5CHoIZUz5dYw==
X-Received: by 2002:ac2:598b:0:b0:50e:3e73:a55f with SMTP id w11-20020ac2598b000000b0050e3e73a55fmr238744lfn.73.1702899848193;
        Mon, 18 Dec 2023 03:44:08 -0800 (PST)
Message-ID: <e4186e51d0a86e63386ea40e492e862d316e75d3.camel@gmail.com>
Subject: Re: [PATCH v2 31/39] xen/riscv: add required things to asm/current.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 18 Dec 2023 13:44:07 +0200
In-Reply-To: <95431643-9f52-4723-89e6-a5e7e8b51bca@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <b6328d9b5bbb9269066dc17d7c0fcb32fa935b2b.1700761381.git.oleksii.kurochko@gmail.com>
	 <8d089dbe-a411-4083-9540-d0c95fa183cf@suse.com>
	 <2c0ac2c7d21222944052f51c3af497c53f1a1da4.camel@gmail.com>
	 <95431643-9f52-4723-89e6-a5e7e8b51bca@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2023-12-18 at 12:28 +0100, Jan Beulich wrote:
> On 18.12.2023 11:39, Oleksii wrote:
> > On Thu, 2023-12-14 at 16:55 +0100, Jan Beulich wrote:
> > > On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > > > --- a/xen/arch/riscv/include/asm/current.h
> > > > +++ b/xen/arch/riscv/include/asm/current.h
> > > > @@ -3,6 +3,22 @@
> > > > =C2=A0#ifndef __ASM_CURRENT_H
> > > > =C2=A0#define __ASM_CURRENT_H
> > > > =C2=A0
> > > > +#include <xen/percpu.h>
> > > > +#include <asm/processor.h>
> > > > +
> > > > +#ifndef __ASSEMBLY__
> > > > +
> > > > +struct vcpu;
> > >=20
> > > I don't think you need this here?
> > Shouldn't forward declaration be for the case of curr_vcpu
> > declaration
> > in the next line ?
>=20
> I don't think so. In C forward decls are needed only when an
> otherwise
> undeclared type is used as type of a function parameter. (C++ is
> different
> in this regard.)
Thanks for clarifying; in this case, it can be dropped.


~ Oleksii
> > > > +/* Which VCPU is "current" on this PCPU. */
> > > > +DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
> > > > +
> > > > +#define current=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (this_cpu(curr_vcpu))
>=20



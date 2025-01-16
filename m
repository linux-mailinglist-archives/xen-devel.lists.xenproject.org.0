Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 117A2A1439A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 21:47:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873775.1284753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYWlv-00030J-JB; Thu, 16 Jan 2025 20:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873775.1284753; Thu, 16 Jan 2025 20:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYWlv-0002xq-FI; Thu, 16 Jan 2025 20:47:23 +0000
Received: by outflank-mailman (input) for mailman id 873775;
 Thu, 16 Jan 2025 20:47:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mFzr=UI=gmail.com=milandjokic1995@srs-se1.protection.inumbo.net>)
 id 1tYWlt-0002xk-J2
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 20:47:21 +0000
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1429b003-d44b-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 21:47:20 +0100 (CET)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-6dd049b5428so13126056d6.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 12:47:20 -0800 (PST)
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
X-Inumbo-ID: 1429b003-d44b-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737060439; x=1737665239; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4WaxXi2+hLFc11CwCXtWWCzphbkvrV7PTL31qaoaOM=;
        b=c5t16SYKo3HC8ZRnZlpiQTB7a+ZoNB6TTxF/t531Yl5TmVuknVj9KGSL1TzT7iG3g+
         bMrkCVugg/gCABpK1xDUifKUeKvR3CRh/8Z3NpphgeR7h6GL+bCHSpLrVOnQVnaaYMdj
         SCLVS5yeWk+W55Lya47lPVncTO9XKwMqYv6sNvafOQxkAW3AchH/6U6e1LtzDXtcvaZb
         9AsO1gL9qn5Fh+oQwgymxlaV+w5Bfsw+GojVAPso8zWdmSUt5wCNz7D8a4Bwaqy98fTS
         Namig+HPog800cNq8yWUyXLzVxDvwufgoqEMEdqkMcD17MAZP5fkD4WyGcP7Ctn/61Je
         nXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737060439; x=1737665239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4WaxXi2+hLFc11CwCXtWWCzphbkvrV7PTL31qaoaOM=;
        b=L1J9AlLVFUw2qSp8yizjIIQHs6rD8tI4yN5SMr9Y3jJ7Tbhm2a3ESQuLpyv2Zv14Pz
         XhB73H7GRi+ozfbR8Mw+1Wp1N5s6TGbM6QUZrp/8OipV/VJk2wL+Qbcd+dkzotd4px/W
         l04jILV1X3G9Ao0dnKIZ8aKUSVGuDsokiZUYiSdGFfC3ujOEjgysYXvVftLfVr81wVay
         mmngiLuchASHS+hB0m2zqYqt5UnTZyrmvWM96CvImHxZFErigT9ZFJUV56/ZNLUD28rV
         mclwM9XnmVXRB/LmCcMdnwL0kcZ5yjzQp3epEwx7Ff/+1Z3h3d0NEFn3O8WR6Wl4rJ2i
         iV+w==
X-Forwarded-Encrypted: i=1; AJvYcCVd1yOwNRZYajYQIWpm8HdnRQJDirHkNB6c3yhrQC/nbp61X+g1fMXOg896cHUHgrosHYxF2anW7G0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzXOSaWY6P3CbzMjOx2mby5Wf/iH0jUG2gm99Wprq8QoEZGBg3
	/rCVL+uz4Gzf0KYsJPweOeO0UzsN4bg9XPHwrmY3VNhOWvsDiE7o7RW6rXWOn1GDm/9R3snCkej
	tHSYyMeq+XPLHSqXz1r54/wmmLVI=
X-Gm-Gg: ASbGnctTNJmXhT2mmyk4bon8kmfXLLW9hTYxzgHp2NTLQa2hmBE0x+8p9Z+nNHOoFI4
	S1ui8hN6rbVn3wZT3YmAIsmtnFj+JWAb59SL59Q==
X-Google-Smtp-Source: AGHT+IHkiMkxTT+D/jUmccrpj641SbpMcRFsm0/PjGiESgQXTK8ry7/fBlshiko5P+U6Wk0IaoScZJqKTAzwl10WUSs=
X-Received: by 2002:a05:6214:d67:b0:6d3:b936:60d1 with SMTP id
 6a1803df08f44-6e1b222f30dmr4145206d6.33.1737060439255; Thu, 16 Jan 2025
 12:47:19 -0800 (PST)
MIME-Version: 1.0
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com>
 <20250114-316084c962eb867c0b681043@orel> <CAKp59VFkW8F2xHsgAxiw138ZrpQJL8R5cTkF8f9vY40iEoRbWg@mail.gmail.com>
 <20250116-aa9eadde9279e66dbc01c705@orel> <D73F98QBJ4S9.3CN2ZUQ0GSMT6@ventanamicro.com>
In-Reply-To: <D73F98QBJ4S9.3CN2ZUQ0GSMT6@ventanamicro.com>
From: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Date: Thu, 16 Jan 2025 21:47:07 +0100
X-Gm-Features: AbW1kvYRLMdilN-fKQeGs9HLVXMRAcFvnbevXtEayIrgWQ6TZbBT9Zlq_f2m72k
Message-ID: <CAKp59VFN+vfdvg0jVsLiQitoTDAVg=ZsuatPJkwcLdG7RqUqMw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add initial Xen guest support for RISC-V
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	jgross@suse.com, aou@eecs.berkeley.edu, Milan.Djokic@rt-rk.com, 
	rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org, 
	oleksandr_tyshchenko@epam.com, iommu@lists.linux.dev, sstabellini@kernel.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, xen-devel@lists.xenproject.org, 
	Slavisa.Petrovic@rt-rk.com, takakura@valinux.co.jp, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 11:23=E2=80=AFAM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcm=
ar@ventanamicro.com> wrote:
>
> 2025-01-16T09:51:25+01:00, Andrew Jones <ajones@ventanamicro.com>:
> > On Wed, Jan 15, 2025 at 08:04:05PM +0100, Milan =C4=90oki=C4=87 wrote:
> >> On Tue, Jan 14, 2025 at 7:18=E2=80=AFPM Andrew Jones <ajones@ventanami=
cro.com> wrote:
> >> > On Tue, Jan 14, 2025 at 05:09:36PM +0100, Milan Djokic wrote:
> >> > > +#define SBI_ECALL 0xE
> >> >
> >> > Shouldn't this be 0xA000007, i.e. the SBI firmware specific extensio=
n
> >> > for Xen. Otherwise why refer to SBI? Note, '0xE' is an invalid, lega=
cy
> >> > extension ID in SBI.
> >> >
> >> Hypercall is triggered through SBI and we defined 0xE just as an
> >> SBI_ECALL ID on Xen side for hypercall handling (among other operation
> >> IDs), so we're not referring to some standard /legacy ID here, just
> >> utilizing SBI for hypercall handling.
> >
> > If the SBI specified EIDs and binary encoding aren't used, then the
> > hypercalls aren't "triggered through SBI", Xen is just doing its own
> > thing on an ecall. Xen doesn't have to implement SBI at all, but if
> > it wants to provide SBI services, as well as its own hypercalls, then
> > the hypercalls should be encoded in the same way as SBI functions and
> > an EID allowed by the SBI specification for hypervisor-specific
> > functions should be used. For Xen, that EID is already specified and
> > it's 0xA000007.
>
> SBI specifies a complete calling convention, but it's not necessary for
> binary compatibility.  SBI also aims to simplify caller API.
>
> Linux maintainers will want a good reason for introducing separate Xen
> SBI call functions/macros (linux already has sbi_ecall, so please try to
> use and potentially improve it), but the ECALL is guaranteed to be SBI
> compatible as long as a7=3D0xA000007.
>
> a7 is needed to denote Xen's extension space and the remaining
> input/output registers can be implemented in any way Xen wants.
Thanks for clarification. We have checked the SBI specification and
everything is clear now.
We'll fix this in the following patch revision.

BR,
Milan


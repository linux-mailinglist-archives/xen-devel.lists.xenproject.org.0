Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAECA12BAF
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 20:20:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873045.1284030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY8w1-0005L5-Is; Wed, 15 Jan 2025 19:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873045.1284030; Wed, 15 Jan 2025 19:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY8w1-0005Iv-Fm; Wed, 15 Jan 2025 19:20:13 +0000
Received: by outflank-mailman (input) for mailman id 873045;
 Wed, 15 Jan 2025 19:20:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=guqY=UH=gmail.com=milandjokic1995@srs-se1.protection.inumbo.net>)
 id 1tY8w0-0005Ip-Ep
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 19:20:12 +0000
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [2607:f8b0:4864:20::f31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd00a0df-d375-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 20:20:11 +0100 (CET)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-6dcf63155b0so1281306d6.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 11:20:11 -0800 (PST)
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
X-Inumbo-ID: bd00a0df-d375-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736968810; x=1737573610; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxOLisM/r2vqci17iimcnJ3+oT6PlH7eXAcAxS9wH8I=;
        b=KEPBTSGlJC6LEauC2mrchv/U+wDt8X7qpTAxpGvkdkb93Fvh2wetPxrbkcE8YYU6w9
         rRrKNTQKLf1VUody96LFSLG5cbsPfKXlqefpJapFz888QzW6M2rdbLz4A27zqkK4qRrA
         VJxl9F7Cb8aqe8waqPtaxtGpqMDiWh0cDvk043QtVlpR7326tJDgpGMNa2621022leZa
         QnDBTYo3AD8A/Csg4wA80MUACfwXQu++p8qURBWXhiQ0hH8txUTBAVP9udrNu5j7TWHw
         t+eJc0YCyWCcRQJDaaNUfv/qamVpJq2FfyVsBypnuoaYfI9n9U5DDPPOUnLBFhGpl87W
         gzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736968810; x=1737573610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxOLisM/r2vqci17iimcnJ3+oT6PlH7eXAcAxS9wH8I=;
        b=v+uVxBRh6mNpSkEYmBMfGXVvInNO+Kif2Oy7hsPVrj9raUYZcp8/Lav0aaG2UKDeZq
         THzZNOwbo4U364n8k4Ka8b1ySc+rE6p/1CJ9e2d0otlHh+753mFMkx31W36sXgvfWfnr
         z0y+nwlIpWEebA1rrVyhlum6chvyVqeoltEtF71CXZ01DzEXAfH9MCA3VtdBl1ovFryS
         60y7378ItTICbUMXLOUG3xZO1aoqtF58g2pKHaCbtg5OngZvbwtOG7MC4apZqeRPdSdN
         Qah3bGzySLyMnGQSOmeoKEBZQH4QSy0eAZiD8GIj4Nyzw7daLQLj310wiEE8eEWms1V/
         Ad4w==
X-Forwarded-Encrypted: i=1; AJvYcCUEvQ5RdqCBDELrJ/xr+L6lRcCfExKfiqIyyR65pMp/UJOQTIj6JpUtOPtcWVcJTnarANHhwh49KyM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAKfyIneWN9YXFkCH2LK9HYIvIlsh9eQppA26vdQOz/1EfYG+p
	cc7aKJ4VkuPYdEpDkvVL2IA70nsPCZmwIyN9xjV4m2T59xFi7jN/M4NcArcm346Y83D9cbBZqoK
	2FqwyTGpt48d7uRhh6CDHPGyiTqE=
X-Gm-Gg: ASbGnctHaliuHQxJm/28qs08pAp+aKNOekbg5oCU1BwWnnQBiLzEH1nXV1H71y/aq3D
	WM5C1ikbw3iF1N7bAAZkhGmddogBI9gNpAUzXSQ==
X-Google-Smtp-Source: AGHT+IGcOD+cwuWLZQkHOERr/i/5IgCk1JWHnGSSNWX5DKVOVQdU9aSL/egf0MIChEkPIlmVmG4Q/k0vSx6KgLYio+A=
X-Received: by 2002:a05:6214:3c8c:b0:6df:8c25:2c81 with SMTP id
 6a1803df08f44-6df9b1d0b5emr530159576d6.5.1736968810243; Wed, 15 Jan 2025
 11:20:10 -0800 (PST)
MIME-Version: 1.0
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com>
 <alpine.DEB.2.22.394.2501141554170.2684657@ubuntu-linux-20-04-desktop> <2f1432e6-0d27-48fd-b034-475284f14233@gmail.com>
In-Reply-To: <2f1432e6-0d27-48fd-b034-475284f14233@gmail.com>
From: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Date: Wed, 15 Jan 2025 20:20:00 +0100
X-Gm-Features: AbW1kvYPm3yU6yFTdo5RO9-y77hSL0M_d4qB1E2QaVvMAqTHQihGuVHlucVKfps
Message-ID: <CAKp59VEOiXo+OKwPNiomtXNCsfDURCXaDktooi5JSoTSdhc90w@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add initial Xen guest support for RISC-V
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, jgross@suse.com, 
	oleksandr_tyshchenko@epam.com, Slavisa.Petrovic@rt-rk.com, 
	Milan.Djokic@rt-rk.com, rafael.j.wysocki@intel.com, sunilvl@ventanamicro.com, 
	takakura@valinux.co.jp, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Stefano, Oleksii

On Wed, Jan 15, 2025 at 5:30=E2=80=AFPM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Hi Stefano,
>
> On 1/15/25 1:01 AM, Stefano Stabellini wrote:
>
> +Oleksii
>
> On Tue, 14 Jan 2025, Milan Djokic wrote:
>
> From: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
>
> This patch introduces initial support for running RISC-V as a Xen guest.
> It provides the necessary infrastructure and stubs for Xen-specific
> operations. Key changes include:
>
> - Modifications to the RISC-V kernel to integrate Xen-specific hypercalls
>   and interfaces, with function implementations stubbed for future work.
> - Introduction of Xen-specific headers for RISC-V, including event
>   handling, hypervisor interaction, and page management. Functions are
>   defined but not yet implemented.
> - Stub implementations for memory management, grant tables, and context
>   switching in the Xen environment, allowing further development and
>   integration.
>
> Signed-off-by: Milan Djokic <Milan.Djokic@rt-rk.com>
> Signed-off-by: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
>
> Hi Milan, Slavisa,
>
> Thank you very much for your contribution! Which Xen tree are you using
> for development?
>
> They are using [1] and have separate branches on top of latest. So we are=
 in
> sync. Also, if you are interested we have created a task/epics for this f=
eature in
> [1] so you could also check there some details:
> 1. https://gitlab.com/groups/xen-project/people/olkur/-/epics/5
> 2. https://gitlab.com/xen-project/people/olkur/xen/-/issues/12
>
>  I am asking because RISC-V support in Xen is still in
> the process of being upstreamed, and [1] is the tree that consolidates
> all patches currently on the to-be-upstreamed list.
>
> While the specific Xen tree you are using is not particularly important
> at this stage, and using [1] is not a requirement, I am asking because
> it is essential to align on the hypervisor ABI, especially regarding any
> details that have not yet been upstreamed. Specifically, is there
> anything in this patch series that relies on features not yet upstream
> in Xen?
>
> There are few features but some things which are Rt-Tk's branch in [1] co=
uld go
> without waiting for these features to be upstreamed.
>
> Thanks.
>
> ~ Oleksii
>
> [1] https://gitlab.com/xen-project/people/olkur/xen/-/tree/latest?ref_typ=
e=3Dheads

As Oleksii already explained, we are working in sync with his latest
branch where most of the risc port is done.
I would just add that this patch introduces kernel risc-v hypercall
support on which only our branch on xen tree depends on. Therefore, it
won't disrupt any functionality with current upstream Xen, it will
just introduce kernel functionality which is not used from Xen side
until our branch is merged upstream.

Best regards,
Milan


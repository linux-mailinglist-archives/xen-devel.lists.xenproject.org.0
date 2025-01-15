Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4290A12A72
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 19:08:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873005.1284000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY7oW-0000Vi-49; Wed, 15 Jan 2025 18:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873005.1284000; Wed, 15 Jan 2025 18:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY7oW-0000Ta-0c; Wed, 15 Jan 2025 18:08:24 +0000
Received: by outflank-mailman (input) for mailman id 873005;
 Wed, 15 Jan 2025 18:08:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=guqY=UH=gmail.com=milandjokic1995@srs-se1.protection.inumbo.net>)
 id 1tY7oU-0000TU-Rc
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 18:08:22 +0000
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [2607:f8b0:4864:20::f31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b44d023d-d36b-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 19:08:22 +0100 (CET)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-6dd43aa1558so1356996d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 10:08:21 -0800 (PST)
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
X-Inumbo-ID: b44d023d-d36b-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736964500; x=1737569300; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVAxd3zBy5y7f7CQ/DxNy1wYULNrzX1ZLzl4D6RE/Uo=;
        b=UdIstHW3M779gwMoA1WCA/JX3osnLyfawZFJUZO3SPvVwoV4+xgVYHXEbiScOlGP/U
         lrDy1md9PTOcA+ngR6ex/OMKjYObuoEFa9c8X9fdfwQi3Q+ln/hxd1mfk5sWeMIUWYL2
         7iPm7mp9pibC/XP8m42NFlwEq0v/C3bYvLY015r1nGqKT0k/CcQvW3G0HzA9xN/xfIDM
         qX7XBA+cj5CIcWvYuBOyOQ2GZAMFmzz+qsESQzwWlmuhKdbfbfKH1DW1RyqQe6BSXlvf
         6DzWsW8jOuHUwP1VDulSlaYNn5s7JRq4wMc27F7y4Sl3ZMr5pOWM7NX4XbFlqvNvbToJ
         V9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736964501; x=1737569301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVAxd3zBy5y7f7CQ/DxNy1wYULNrzX1ZLzl4D6RE/Uo=;
        b=NUc0zXe30CkZPRETxgzvQ1biHH8BKlCECkfA10AVSIGorLPvBPZBdS8v+2RGau+78J
         oV/ZVI1jVS7DQr2r+MFxWz6ASLmL9gZ3QDJFYaCUW+/Vc8QGH9YHtjDncm7Eau+n6YL1
         viHmJoZTJWVSVcRkFgQKgzERSAy+759C0/94pbGUmPmZHP1nyw7xz1Ptcj33U36sc0zd
         K7JDV5Tu3h4mOBncPwA7W96YHmtTV2rJwxbjjFgiYCz7c8fCvyKsxa7LFfbRR1VqPNQk
         UKdS4RVfwoPEfnza7WC7PzlgTpVFELam6yOEDJkiuKVa9UzvFkoz7ffE6umpN/5oM7MR
         wSjw==
X-Forwarded-Encrypted: i=1; AJvYcCVchR9o010LhgulcsaBDZyqsb5b+WZXIP8WXwOlT+EEtlYWC9qDIpNgRb1YVb9rr4t/0FUsdFttBpQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0K7RQmfxzN0G6+s9XGfK/0eRjTxjFvZ/MlL52ZmJmbWZhOSWA
	30sMyIxCl/HVtrW5iFvlJzfMkgIwQsZL6Q1L0vINtYpw1Xlu3rKp1UL0TFzR/sTkC+KaXFXr4Vr
	uRmkj/wqf9POvDS+q9d5I1gAh/y8=
X-Gm-Gg: ASbGncvjkEfQ9nU9qXcPzsPCDtVo+dkqFONv2GBacnt5Fbn7kz5ew+Cf5EkJRXwwxq2
	FpuqiGlq4wsvavI3MyULM3n5NHkJmfhadO7Kp3g==
X-Google-Smtp-Source: AGHT+IGFU6Cpsmr7C29OyQc7heB1EWXPIOaqr8NIc91ZyH2jiYN8FoqP3+W/ADTqDwyc+/xzyTGsbdLQtFh2zzoJMIE=
X-Received: by 2002:a05:6214:5bc2:b0:6d8:a730:110d with SMTP id
 6a1803df08f44-6df9b0eea41mr463994756d6.0.1736964500692; Wed, 15 Jan 2025
 10:08:20 -0800 (PST)
MIME-Version: 1.0
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com>
 <CAAhSdy2rfbNT6tTK7i7rV6M1kNs2bFOQtN5QZpJ2xPrJx6WXjw@mail.gmail.com>
In-Reply-To: <CAAhSdy2rfbNT6tTK7i7rV6M1kNs2bFOQtN5QZpJ2xPrJx6WXjw@mail.gmail.com>
From: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Date: Wed, 15 Jan 2025 19:08:10 +0100
X-Gm-Features: AbW1kvaLrXlpYISDcragOXfUEvYS3I_dYhZbSgLg1Ehoz_myWQJSREjiwkAvkNc
Message-ID: <CAKp59VGvJ6dOU06BhLVU30ioWTShWyo-0Ngty9MM_aH1rKYoWA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add initial Xen guest support for RISC-V
To: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, jgross@suse.com, 
	sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, 
	Slavisa.Petrovic@rt-rk.com, Milan.Djokic@rt-rk.com, 
	rafael.j.wysocki@intel.com, sunilvl@ventanamicro.com, takakura@valinux.co.jp, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 5:41=E2=80=AFPM Anup Patel <anup@brainfault.org> wr=
ote:
>
> On Tue, Jan 14, 2025 at 9:41=E2=80=AFPM Milan Djokic <milandjokic1995@gma=
il.com> wrote:
> >
> > From: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
> >
> > This patch introduces initial support for running RISC-V as a Xen guest=
.
> > It provides the necessary infrastructure and stubs for Xen-specific
> > operations. Key changes include:
> >
> > - Modifications to the RISC-V kernel to integrate Xen-specific hypercal=
ls
> >   and interfaces, with function implementations stubbed for future work=
.
> > - Introduction of Xen-specific headers for RISC-V, including event
> >   handling, hypervisor interaction, and page management. Functions are
> >   defined but not yet implemented.
> > - Stub implementations for memory management, grant tables, and context
> >   switching in the Xen environment, allowing further development and
> >   integration.
> >
> > Signed-off-by: Milan Djokic <Milan.Djokic@rt-rk.com>
> > Signed-off-by: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
>
> A single patch with many changes is hard to review.
>
> Please convert this patch into a series with smaller patches.
> Also, include a cover letter in the series explaining how to
> test Xen on RISC-V.
>
> Regards,
> Anup
>
Hello Anup,

We're currently working on patch breakdown in smaller logical parts.
Will be converted into patch series in the next revision.

BR,
Milan


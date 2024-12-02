Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9CB9E0024
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 12:21:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846545.1261716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI4Tr-0001Fk-70; Mon, 02 Dec 2024 11:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846545.1261716; Mon, 02 Dec 2024 11:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI4Tr-0001Dz-4J; Mon, 02 Dec 2024 11:20:43 +0000
Received: by outflank-mailman (input) for mailman id 846545;
 Mon, 02 Dec 2024 11:20:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n08K=S3=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tI4Tp-0001Ci-FP
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 11:20:41 +0000
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [2607:f8b0:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73fc5383-b09f-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 12:20:37 +0100 (CET)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3e916196023so2188008b6e.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 03:20:37 -0800 (PST)
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
X-Inumbo-ID: 73fc5383-b09f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjoyMmQiLCJoZWxvIjoibWFpbC1vaTEteDIyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjczZmM1MzgzLWIwOWYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMzMTM4NDM3LjI0ODg2MSwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1733138436; x=1733743236; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8q3BqTTS/DY5CM3HSTkJwixHERLzBJLNnWQsaoYXLNs=;
        b=TyZEgiIkM15Ln5nfYii6fP+VvLu3LwzXiEUmHZHtYWXiu8Bpw1IHuH0vAJddZiqJgr
         gEnqnEiyaPTRTFqVDRFnoTRIO3i0AMV7Bt+HN3OXp5YGhwaiSXBSGMH8nudcH/0VMhzK
         p3rG12q766YrNilIxXOqRDVa+GTHsppFQy+Ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733138436; x=1733743236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8q3BqTTS/DY5CM3HSTkJwixHERLzBJLNnWQsaoYXLNs=;
        b=NLRauNVRvu09nWCi/CY5vY34aYJNxiHswtT0dNQWH+0/L4ZvP32W9F8YvAeQttaet7
         ZezydkfQNTvAH+hj564MHpBNh9MxMA5t+d4g5ZdWaAIBCoW/o613eCHaLtyuAIEm6ggk
         VNcYqSzWd+nnrpF75AOB6hstFKx/CgX70ajKut9IwbiDoeT58Zk455k04xtkHWbRsFDJ
         qSVo5NfhmAhF3kwTvjzrChoom4H5R/m20xuLh8A2G0ixIg6/mSnA5nNR2YQMvKzl+A97
         3w9gRyZiWC/L8gu9Vg6ggHXNVb2PE6qXLvlsC+0IrRPulpNJdKfRaNx1sFi6+pkZ9rOB
         rB5Q==
X-Gm-Message-State: AOJu0YwTdo/GLNjyFGcOv6j1ZjdZGu+b75fUZD3/m/M83mhV57beJmHq
	0LJno8EkF7efQlIRYz9JsOJWqN5h9sARaI3XFbhqYLcFaDOxZeQBb9GGYuCDHLOM8XAFEs00BhJ
	rWdZh2iuT+geZow7qBKt3M5yZ9zQ3CA7CpqLf7p/31wziUZQ2
X-Gm-Gg: ASbGncs5nXOT594QgV7Ne0u/Eqw9deIUMQKdfXD1AnEDxhq0VQ9/EehMpWbjBdDAwT/
	E7mPDKwoMXpxPwVks4E7WGJfu1kqADJ8=
X-Google-Smtp-Source: AGHT+IFQE/MZL95ZhLtnMvGMdgvyoF3uL8JzkV8bwhrR+wFU+FtGKLXym+v7kUJxwL2ngNivfKjyJFj6H9i95X+m15c=
X-Received: by 2002:a05:6808:210d:b0:3e6:6005:e36f with SMTP id
 5614622812f47-3ea6db6082bmr20151715b6e.5.1733138435772; Mon, 02 Dec 2024
 03:20:35 -0800 (PST)
MIME-Version: 1.0
References: <20241122093358.478774-1-frediano.ziglio@cloud.com>
In-Reply-To: <20241122093358.478774-1-frediano.ziglio@cloud.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 2 Dec 2024 11:20:24 +0000
Message-ID: <CACHz=ZgOCXSkzf6eekMf+YyB2HQom0=sodQAGUM2cgB6bEY-8A@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Move some boot code from assembly to C
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping

On Fri, Nov 22, 2024 at 9:34=E2=80=AFAM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> As a continuation of this series start sorting out the issue of headers
> not compatible with 32 bit.
> Instead of having to change headers which are almost only used for 64 bit
> allows to override headers or move reusable definitions to new shared
> headers.
> This results in less changes.
>
> Changes since v1:
> - rebased (with conflicts).
>
> Frediano Ziglio (4):
>   Use an include/boot directory to override headers for boot code
>   x86/boot: Use header to allows inclusion of public xen.h header
>   x86/boot: Move some settings to C
>   x86/boot: Use external symbols from cmdline_parse_early
>
>  xen/arch/x86/boot/Makefile                |  2 +-
>  xen/arch/x86/boot/build32.lds.S           |  4 ++++
>  xen/arch/x86/boot/cmdline.c               | 14 ++++++++++--
>  xen/arch/x86/boot/head.S                  | 19 +--------------
>  xen/arch/x86/boot/reloc.c                 | 28 ++++++++++++++++++-----
>  xen/arch/x86/boot/trampoline.S            |  2 +-
>  xen/arch/x86/include/asm/guest/pvh-boot.h |  1 +
>  xen/arch/x86/include/asm/setup.h          |  2 ++
>  xen/arch/x86/include/boot/public/xen.h    | 28 +++++++++++++++++++++++
>  xen/arch/x86/include/boot/xen/cpumask.h   |  1 +
>  xen/arch/x86/include/boot/xen/string.h    | 10 ++++++++
>  11 files changed, 83 insertions(+), 28 deletions(-)
>  create mode 100644 xen/arch/x86/include/boot/public/xen.h
>  create mode 100644 xen/arch/x86/include/boot/xen/cpumask.h
>  create mode 100644 xen/arch/x86/include/boot/xen/string.h
>


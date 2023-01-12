Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C14DB66706C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 12:03:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475995.737952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFvN4-0006tG-GU; Thu, 12 Jan 2023 11:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475995.737952; Thu, 12 Jan 2023 11:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFvN4-0006qI-DH; Thu, 12 Jan 2023 11:03:46 +0000
Received: by outflank-mailman (input) for mailman id 475995;
 Thu, 12 Jan 2023 11:03:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AeS6=5J=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1pFvN3-0006Is-5A
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 11:03:45 +0000
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [2607:f8b0:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5ea41de-9268-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 12:03:42 +0100 (CET)
Received: by mail-pf1-x432.google.com with SMTP id 20so8111254pfu.13
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jan 2023 03:03:42 -0800 (PST)
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
X-Inumbo-ID: c5ea41de-9268-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRMIxmrMjxFmZ7KhnuQyQ4LQN+JFHEuz988Y3hBKhAY=;
        b=AE2aKbGlog+nDLpzx6+73PFOKcFOlk7OrHENBBiyt8FPDfJtjJp9iazQfWNk1uJlM0
         QhMv2+Ux9eLUuLYjgMZWUkvqrbE7es6WjuMPIEs60T4Ls+D9q0/MzjqYBaO5D/adYkBZ
         nLgcDr0VnC6f+kKHzeT+m/f66v9V7jsPZreL9Ref5zsYSVjUQMk+NCI/f3XlF9FD4h0p
         wOJxBBhwgklj8lzeQO0DR7laeFBaDePYrZfypE63u0O/Ijnim3Qg/vKTEBQfhWb/FDZ3
         bh9hcjDTqiCPNZ6NKrduBHZtkSr3wrmKYWvOgX+Ta+5LYTfWRaUENMdezVR8C8dPh7E4
         HGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YRMIxmrMjxFmZ7KhnuQyQ4LQN+JFHEuz988Y3hBKhAY=;
        b=MWEzk3J0pR90zo8mkEotZveLo40WJB85ILbcUHVTlUWgZ+4SW8MbxFd7GoswKgW8UP
         G8vsDzhlq4SET6nLabvoI7pM6DH2KuwX/2h2nbq7sb8qA493hEbGAMY6npR7cEv/pi8+
         gqWzbalSbgDTh2GGt3IITdzOPqkS7x2pnQm5YQuiYsPtqf5ihEvjEIcaEJBHxil24yge
         HMV7HTEdaxU5mWodBpNMkrW82HyBJE5MtPK0IpIg6gzG67ueePZ2lSBrILf8e5gRMQO+
         UVWQVU/B/OXkSfuEH3L270i8MUL4aRKXtENEW6PrXg8SwA27zBSuGj4s1mGmx/zz79lp
         L7vw==
X-Gm-Message-State: AFqh2kr8A6DC9LDR0c7I4GcW/fbwjCu1a9Yf1d+M3y6b1SRM65hNyL1N
	EPVUd6Sk2d8JmVz3ej7WwZ98x6fGGa67i9qntdHsVg==
X-Google-Smtp-Source: AMrXdXu5V4bX22nwNZjWYHOvPbmvbmEPrM5ZbLD1wZubhZ6omG79rXH/n1MH1qTGUPIgVjvQP0rVQQGio1U3g6Ik/Ao=
X-Received: by 2002:a63:e20b:0:b0:479:18a:8359 with SMTP id
 q11-20020a63e20b000000b00479018a8359mr4968225pgh.105.1673521421294; Thu, 12
 Jan 2023 03:03:41 -0800 (PST)
MIME-Version: 1.0
References: <20230110212947.34557-1-philmd@linaro.org> <d4ea8bf5-a669-eb33-6dd2-f37417dab1c7@eik.bme.hu>
In-Reply-To: <d4ea8bf5-a669-eb33-6dd2-f37417dab1c7@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2023 11:03:29 +0000
Message-ID: <CAFEAcA-5054ZzubQbZuzb8=D1QfbfKgqwnr48r2kOx5p4=Rchg@mail.gmail.com>
Subject: Re: [PATCH] bulk: Rename TARGET_FMT_plx -> HWADDR_FMT_plx
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
	qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, ale@rev.ng, 
	qemu-riscv@nongnu.org, xen-devel@lists.xenproject.org, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Jan 2023 at 22:04, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Tue, 10 Jan 2023, Philippe Mathieu-Daud=C3=A9 wrote:
> > The 'hwaddr' type is defined in "exec/hwaddr.h" as:
> >
> >    hwaddr is the type of a physical address
> >   (its size can be different from 'target_ulong').
> >
> > All definitions use the 'HWADDR_' prefix, except TARGET_FMT_plx:
> >
> > $ fgrep define include/exec/hwaddr.h
> > #define HWADDR_H
> > #define HWADDR_BITS 64
> > #define HWADDR_MAX UINT64_MAX
> > #define TARGET_FMT_plx "%016" PRIx64
> >         ^^^^^^
> > #define HWADDR_PRId PRId64
> > #define HWADDR_PRIi PRIi64
> > #define HWADDR_PRIo PRIo64
> > #define HWADDR_PRIu PRIu64
> > #define HWADDR_PRIx PRIx64
>
> Why are there both TARGET_FMT_plx and HWADDR_PRIx? Why not just use
> HWADDR_PRIx instead?

TARGET_FMT_plx is part of a family of defines for printing
target_foo types; the rest are in cpu-defs.h. These all include the
'%' character. This is more convenient to use, but it's also
out-of-line with the C standard format macros like PRIx64.
The HWADDR_* macros take the approach of aligning with how you
use the C standard format macros.

As usual in QEMU, where there are two different ways of doing
things, it's probably because one of them is a lot older than
the other and written by a different person. In theory it would
be nice to apply some consistency here but it rarely seems
worth the effort of the bulk code edit.

thanks
-- PMM


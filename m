Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E13B71956A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 10:22:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542324.846038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4dZZ-0004UD-Nh; Thu, 01 Jun 2023 08:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542324.846038; Thu, 01 Jun 2023 08:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4dZZ-0004SA-Ki; Thu, 01 Jun 2023 08:22:17 +0000
Received: by outflank-mailman (input) for mailman id 542324;
 Thu, 01 Jun 2023 08:22:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z8Gk=BV=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4dZX-0004Rm-Rn
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 08:22:15 +0000
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [2607:f8b0:4864:20::1133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69b8db35-0055-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 10:22:14 +0200 (CEST)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5689335d2b6so5063797b3.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jun 2023 01:22:15 -0700 (PDT)
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
X-Inumbo-ID: 69b8db35-0055-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685607734; x=1688199734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3q8fSv1CYQ8OeBSkoHHq8yQzPVMEdcVj1sJJBohCe0=;
        b=scnpKoycafdSA6Zmoxe64NtU1IPtpP1XoN7u6BxbHgaNpHHpBaRgfB2X/NbVQI3XUI
         S43vtnrb0VpUQFKtCtNAL2Z4eQGxKB9jkDmQzBef6OSmzPFkANcNw2nEHbBaxtIGRJFx
         F2gdbWX0/JO50BjGXzMMRjG/dVaN6/37Aaxe3j2XyiD9NBGl22snChdmfv7CpIBT4YsT
         wzEsBAOaAGJLasaxdabRza57BmBoAT7cVmGOq5aUEFhtYj/c1WejBdPyTkL2OU+y9vxz
         zNiBma0es8vOX0CahjWds9KH8J6DH6xHzp6sGGczNoDJQcyp7Q2snP8wt+QQc7Qs4GOa
         fyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685607734; x=1688199734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3q8fSv1CYQ8OeBSkoHHq8yQzPVMEdcVj1sJJBohCe0=;
        b=jK/7zikfBO0HrW8s3Ys7USYDbIE1w2mpyErdXtWmcWgDqwaC6CxT7FQZMEUCgYuuiM
         nHBjQtE0pkel+mLm9sgnimBfoohLOSTq3a9boxO1iij68IS9A8nism9FnHUVU+nCIXFz
         B6vBlrHYM+l3KBucaUECYg0UQ8Urpmto3lcAKkzDZaLB/HrcrCzSXNUmK9jWYywFm9u8
         3uBdLPEpH/wOWQtE4ALOudSE0OljiBjLA1gQduNmDr/OochyN8SzBJPT3pfrl6m01KAw
         lDYhD/R8EJq5PezKR6dXrhrb5mWKqtvfk7HYPjlOaokFrKbB6acfTefQyj2Yjtu28jRx
         Q3Ug==
X-Gm-Message-State: AC+VfDwkssz93bZvCyvzNfDuMUJGImoFDhvsK6dU81sLCIHxNzbVLi0s
	4siFAOaPcMuaKhh5UobEf00mjCqthoGt69OqtAU=
X-Google-Smtp-Source: ACHHUZ4BVGpqKx729yAA7sIpRRuJCk9B2q39qd4V84f+TNhLT6e1WTgI1mcqI+pCtHVuJpHfepvjflFti312UIm7bGk=
X-Received: by 2002:a0d:f5c2:0:b0:568:d63e:dd2c with SMTP id
 e185-20020a0df5c2000000b00568d63edd2cmr6202683ywf.11.1685607733835; Thu, 01
 Jun 2023 01:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230531213032.25338-1-vishal.moola@gmail.com>
 <20230531213032.25338-31-vishal.moola@gmail.com> <CAMuHMdU4t4ac_eCH0UaX9F+GQ5-9kYjB_=e+pSfTkxG=3b8DsA@mail.gmail.com>
 <025fc34a24e1a1c26b187f15dba86d382d9617eb.camel@physik.fu-berlin.de>
In-Reply-To: <025fc34a24e1a1c26b187f15dba86d382d9617eb.camel@physik.fu-berlin.de>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 1 Jun 2023 01:22:03 -0700
Message-ID: <CAOzc2pxnb6WXoVK5JXX42R0Q6FK59Q1uebQskK2fxLn6DuicqA@mail.gmail.com>
Subject: Re: [PATCH v3 30/34] sh: Convert pte_free_tlb() to use ptdescs
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, xen-devel@lists.xenproject.org, 
	kvm@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 1, 2023 at 12:28=E2=80=AFAM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi Geert!
>
> On Thu, 2023-06-01 at 09:20 +0200, Geert Uytterhoeven wrote:
> > On Wed, May 31, 2023 at 11:33=E2=80=AFPM Vishal Moola (Oracle)
> > <vishal.moola@gmail.com> wrote:
> > > Part of the conversions to replace pgtable constructor/destructors wi=
th
> > > ptdesc equivalents. Also cleans up some spacing issues.
> > >
> > > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> >
> > LGTM, so
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I assume this series is supposed to go through some mm tree?

Hi Adrian,
I was going to have Andrew take this through mm-unstable
once it gets enough review.


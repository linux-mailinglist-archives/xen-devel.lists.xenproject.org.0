Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC8A39AEA6
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 01:28:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136575.253156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lowk6-00038n-8S; Thu, 03 Jun 2021 23:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136575.253156; Thu, 03 Jun 2021 23:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lowk6-00035v-5E; Thu, 03 Jun 2021 23:27:14 +0000
Received: by outflank-mailman (input) for mailman id 136575;
 Thu, 03 Jun 2021 23:27:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=alxE=K5=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1lowk4-00035p-KA
 for xen-devel@lists.xenproject.org; Thu, 03 Jun 2021 23:27:12 +0000
Received: from mail-io1-xd33.google.com (unknown [2607:f8b0:4864:20::d33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4fd170c8-750a-44d7-b6a3-0fa5737ec61d;
 Thu, 03 Jun 2021 23:27:11 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id e17so8127756iol.7
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jun 2021 16:27:10 -0700 (PDT)
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
X-Inumbo-ID: 4fd170c8-750a-44d7-b6a3-0fa5737ec61d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JrxH2fg+CvzkjzCjAmjypku1/P6vAdjqgm5jiphMnUw=;
        b=pq+uFlzRymjZw+h04vKqfaJw0Q3/NUEXyc+K5x6IvYCUm5nPvya4Jt1rNc8MdiSYOA
         pmP6e7TzO1mWm13IsIHXfok/3zspsfUarenM6TsRVX864K4MLrstWPsInirw349+uFuL
         YT7ytyvh4kN8Fv4tVkp0eV/R6UDhInLXqooVXXakyAlDhHlWkpaDF3PX21fSyqQ2rw01
         vO1YEh9ZgHcYyitAI4WF0+/zmqV1LkJw16pvOrcvOt+zYt+G6o+yUplnvgjgXvcC5NjY
         oGDCbwR+PDeRClIBGyDw+Q9xK8Djo/RdotOD1c4ofLgTSltQmNN05SlDRCJ0sGDPHfrm
         aqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JrxH2fg+CvzkjzCjAmjypku1/P6vAdjqgm5jiphMnUw=;
        b=JDFU87RPBzvsBY3mwOB6wpd+o9Z7l0e340tAlZTet4vux2X3nlQ1MJob+iGwwSrvNb
         Yg9QjRAK3DkkGnYqO37DmLfJBJ8+SYmd/FlBHbvliGBDrRm5PcumIA+ZdJe01uQZZcvz
         er04mY8h94U9xMcnru5opsSKvWQR0WuDFoAB9V1ghC+2avReI+auGpJenmRGZygZb5QY
         p8zIi/ZUzC3gW/7Na3jVIlHQU6JL4G9IOKtBVVT1LnQnKfK3kCMgBxzurNymsIvQQa86
         MZbIykQXFqt3Ic44OUu8BbzIOdEtlw6CdKd/BH8m4hZArFbDUg1cbrxo6AU5CuAWQV9T
         sp6Q==
X-Gm-Message-State: AOAM531DxrqxYLmUc7kbY4sBYtiJOwuE/lrkMJKDgePkEtVWhWAl9vWP
	gHP75oEC0TMxHVeSG8qptzEZBHs6344dPDUaoDo=
X-Google-Smtp-Source: ABdhPJzZ5SyHDTTE2gJosVtarG0qhTTw9OkAhbCqpig3D9a1pMmSegDh8QjKTmfIhMpRm+6+dtWlTG7JoonFWfR1fQY=
X-Received: by 2002:a05:6638:37a6:: with SMTP id w38mr1316745jal.106.1622762830521;
 Thu, 03 Jun 2021 16:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621712830.git.connojdavis@gmail.com> <88ca49cea8dc0c44604957d42722388bb3d9e3ff.1621712830.git.connojdavis@gmail.com>
 <7d1b6d2a-641c-4508-9b29-b74db4769170@suse.com> <39a8a78c-3662-528f-fde4-d47427e64b15@gmail.com>
 <b0699bc4-5e79-7ce0-c885-b4d8dfa8b74f@gmail.com>
In-Reply-To: <b0699bc4-5e79-7ce0-c885-b4d8dfa8b74f@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 4 Jun 2021 09:26:44 +1000
Message-ID: <CAKmqyKP-PVgsu_pH5JuH2zrYv-E6ucpD_2DsuGfBFoC1nX9-Jw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] xen: Add files needed for minimal riscv build
To: Connor Davis <connojdavis@gmail.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	"open list:X86" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 1, 2021 at 12:26 PM Connor Davis <connojdavis@gmail.com> wrote:
>
>
>
> On 5/25/21 12:13 PM, Bob Eshleman wrote:
> > On 5/25/21 1:48 AM, Jan Beulich wrote:
> >> On 24.05.2021 16:34, Connor Davis wrote:
> >>> Add arch-specific makefiles and configs needed to build for
> >>> riscv. Also add a minimal head.S that is a simple infinite loop.
> >>> head.o can be built with
> >>>
> >>> $ make XEN_TARGET_ARCH=riscv SUBSYSTEMS=xen -C xen tiny64_defconfig
> >>> $ make XEN_TARGET_ARCH=riscv SUBSYSTEMS=xen -C xen TARGET=head.o
> >>>
> >>> No other TARGET is supported at the moment.
> >>>
> >>> Signed-off-by: Connor Davis <connojdavis@gmail.com>
> >>> ---
> >>>   config/riscv.mk                         |  4 +++
> >>>   xen/Makefile                            |  8 +++--
> >>>   xen/arch/riscv/Kconfig                  | 47 +++++++++++++++++++++++++
> >>>   xen/arch/riscv/Kconfig.debug            |  0
> >>>   xen/arch/riscv/Makefile                 |  0
> >>>   xen/arch/riscv/Rules.mk                 |  0
> >>>   xen/arch/riscv/arch.mk                  | 14 ++++++++
> >>>   xen/arch/riscv/asm-offsets.c            |  0
> >>>   xen/arch/riscv/configs/tiny64_defconfig | 13 +++++++
> >>>   xen/arch/riscv/head.S                   |  6 ++++
> >>>   xen/include/asm-riscv/config.h          | 47 +++++++++++++++++++++++++
> >>>   11 files changed, 137 insertions(+), 2 deletions(-)
> >>>   create mode 100644 config/riscv.mk
> >>>   create mode 100644 xen/arch/riscv/Kconfig
> >>>   create mode 100644 xen/arch/riscv/Kconfig.debug
> >>>   create mode 100644 xen/arch/riscv/Makefile
> >>>   create mode 100644 xen/arch/riscv/Rules.mk
> >>>   create mode 100644 xen/arch/riscv/arch.mk
> >>>   create mode 100644 xen/arch/riscv/asm-offsets.c
> >>>   create mode 100644 xen/arch/riscv/configs/tiny64_defconfig
> >>>   create mode 100644 xen/arch/riscv/head.S
> >>>   create mode 100644 xen/include/asm-riscv/config.h
> >> I think this wants to be accompanied by an addition to ./MAINTAINERS
> >> right away, such that future RISC-V patches can be acked by the
> >> respective designated maintainers, rather than falling under "THE REST".
> >> Question is whether you / we have settled yet who's to become arch
> >> maintainer there.
> >>
> >> Jan
> >>
> > I'd like to volunteer myself for this, as I'm slated to continue
> > with the port indefinitely and would at least like to review
> > patches.  If Connor has the time, I think it makes sense for him
> > to be listed there too.
> >
> > Until we have others (it's just us two right now), it'll be a
> > lot of us reviewing each other's arch-specific work (in addition to
> > reviewers elsewhere in the Xen project, of course).
> >
> > -Bobby
> >
> Jan: can you list Bobby as the maintainer on commit? You can list me as
> well,
> but I can't guarantee a time commitment unlike Bobby.

If you need more people you can add me as well. I don't have too much
time to spend here, but I did start the initial Xen port and have a
good understanding of the RISC-V Hypervisor extension.

Alistair

>
> Thanks,
> Connor
>


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0137C334C4F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 00:16:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96318.182100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK82r-0003MM-Q5; Wed, 10 Mar 2021 23:15:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96318.182100; Wed, 10 Mar 2021 23:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK82r-0003Lx-Mz; Wed, 10 Mar 2021 23:15:13 +0000
Received: by outflank-mailman (input) for mailman id 96318;
 Wed, 10 Mar 2021 23:15:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TK3A=II=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1lK82q-0003Ls-Ew
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 23:15:12 +0000
Received: from mail-ed1-x52f.google.com (unknown [2a00:1450:4864:20::52f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de0214ea-2e33-4f2f-a347-2035e4f2f7d5;
 Wed, 10 Mar 2021 23:15:11 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id y6so8150eds.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Mar 2021 15:15:11 -0800 (PST)
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
X-Inumbo-ID: de0214ea-2e33-4f2f-a347-2035e4f2f7d5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i/gGoI82isxh2Pj6ZZVCBtGI/GKRIG+++nG/qLnmSrk=;
        b=PnNQIXzMLgGrbA9lu6mrkyF5/SGpO4vzuXaVVwc1OjWQJ7vHnHs6acdWXT3HaZy6Yq
         bTQfbJpKHt4W+AiauhewpFQIkVMcWgN26+5SAm1c7v0vF5nGwg3UvkXjaXyN+UN6ZZkZ
         MuQ+LFnaXp3is0FopRjvZ1pb1VUxy+qtjwD3VGJdMfYjSDvyQbZwiZDDMokbNgf0Bi1S
         IgMKOyNMUoU4VIHKabubcmh+wmm/HcoFgZdrmX5dxI5RmazQW+J7mcoe+0nqEWZ1EeJ1
         RtRjY7mgFVmMYHlMLmTzcYkzmhh0V77YITJd38l1Lw1CC5fvm5e9VjQaU3TwXqaGc9Ar
         EXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i/gGoI82isxh2Pj6ZZVCBtGI/GKRIG+++nG/qLnmSrk=;
        b=Vf3vIqWzfUJaTYmGgiWzpKeu2/urgCtVIrFHdHs6MXxqpLek1RgwpFwYYUJCgwQaDs
         TltaGn4PuJ/OPUCQqX5NIrwSRszZ4me3QOvYVEstwqohM2Mi9Fv3mR2crY0cE8LoD5jJ
         QVsg1PdCG46vkfQfsO9yXEw0YKyA1PgQFnZbBO4t7OR7A6+bpLHLka68FWZlp/XfaacP
         r84jbO5MRRwfLoxjx8Woi1A+1sYbIaGZRm9rVwDhCmcOydjT5iwaBDulm2Wr9MG/ljga
         dir7Pa4vR9DaUb+hzaheXg7sYihnrxsEIkyqdkm8a8+opfjoAI2d3wl461wUArcG2OFf
         8v7w==
X-Gm-Message-State: AOAM530EmOSzHrMeE35r/YcxwqjX++7QO7D7q0I/dgCwOam439S7ZGeK
	Nndt1adhKJify65VxOmHYnwgyU0gZYaac9SMuX4=
X-Google-Smtp-Source: ABdhPJxxOj+2niVJ5YgsAIpGwnV14zXuvbZWmJZ6uNRvwZMXuzyZCS0vxkG8BlEcTbc9auRbvWOwse+wnHoMhhcIcxc=
X-Received: by 2002:a50:ec0e:: with SMTP id g14mr5841285edr.264.1615418110693;
 Wed, 10 Mar 2021 15:15:10 -0800 (PST)
MIME-Version: 1.0
References: <CAMmSBy-iwV86QB+P4OCDgevx9MND0NzwBECUVqavT6cF+bvrcA@mail.gmail.com>
In-Reply-To: <CAMmSBy-iwV86QB+P4OCDgevx9MND0NzwBECUVqavT6cF+bvrcA@mail.gmail.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Wed, 10 Mar 2021 23:14:59 +0000
Message-ID: <CAJ=z9a1_BrnCzqdZ6xoc1VwTM8V0jr1B_rv=28fW5VSe2rwG4Q@mail.gmail.com>
Subject: Re: Xen 4.14 build failing on aarch64 with GCC 10.2.1
To: Roman Shaposhnik <roman@zededa.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Mar 2021 at 21:15, Roman Shaposhnik <roman@zededa.com> wrote:
>
> Hi!

Hi,

>
> just came across this failure on aarch64:
>
> ld: prelink.o: in function `_spin_lock_cb':
> 19187(.text+0x1f26c): undefined reference to `__aarch64_ldadd4_acq_rel'
> 19188ld: prelink.o: in function `_spin_lock':
> 19189(.text+0x1f2ec): undefined reference to `__aarch64_ldadd4_acq_rel'
> 19190ld: prelink.o: in function `_spin_lock_irq':
> 19191(.text+0x1f35c): undefined reference to `__aarch64_ldadd4_acq_rel'
> 19192ld: prelink.o: in function `_spin_lock_irqsave':
> 19193(.text+0x1f3d4): undefined reference to `__aarch64_ldadd4_acq_rel'
> 19194ld: prelink.o: in function `_spin_lock_recursive':
> 19195(.text+0x1f6b0): undefined reference to `__aarch64_ldadd4_acq_rel'
>
> This, of course, goes away if I build Xen with:
>    CFLAGS=-mno-outline-atomics
>
> However, at this point I'm curious if this is going to get addressed in Xen
> proper or not.

This has already been fixed and backported to Xen 4.14 (included in
4.14.1). Are you using the latest 4.14 branch?

Cheers,


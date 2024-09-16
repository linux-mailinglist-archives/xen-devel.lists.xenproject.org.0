Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E30797A2A6
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 14:58:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799501.1209479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqBIp-0003hc-4r; Mon, 16 Sep 2024 12:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799501.1209479; Mon, 16 Sep 2024 12:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqBIp-0003el-1f; Mon, 16 Sep 2024 12:58:03 +0000
Received: by outflank-mailman (input) for mailman id 799501;
 Mon, 16 Sep 2024 12:58:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wse+=QO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sqBIn-0003ef-6w
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 12:58:01 +0000
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [2607:f8b0:4864:20::c2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c2ed5d4-742b-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 14:57:59 +0200 (CEST)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-5e1b5b617b8so1928000eaf.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 05:57:58 -0700 (PDT)
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
X-Inumbo-ID: 4c2ed5d4-742b-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726491478; x=1727096278; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLbQ5E7vsNJRyZbezrSYFwNHEKimVPtYV5udYQ9iKbs=;
        b=kF6K+Ic3UJN0NdYSOO+1FuLgTDhIZvBGNA0fcTJ/wzdrSYyyYBQ/wtbsMpA8/1BtyY
         4hAOSDPWR2UOMsTEswbZY3cAgaXuSVmmdQd6qMXNji53eLNUv5EqUc/5xA6TRc/vi39g
         GuQ/g4lOQ/Kvp5hB7jZ1SEHL1Y9SekVwKn3i0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726491478; x=1727096278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLbQ5E7vsNJRyZbezrSYFwNHEKimVPtYV5udYQ9iKbs=;
        b=TE7sOGuTY37t5ZJwOpI6H4NW86vjJ0JRHT7UHXB7R3gd+o0F0CvKL0CWg/KjAc7XjJ
         n9ZfN730a9yCWo2W9/hirWmncYRpuuazl9pS9HQiSr9lXP+vE5BPXD9uTTj49p+223Jd
         XlUuAT3xk858YeZhv6vM0Sf2rKHnOiglu3zTSc4LDz6d85oCu8KabjzVEDJq4IRnsQ7j
         H3hhmRROwUdaR73ZZr/rV+yaWvc8hNZJ+xTY/PlkHPYaMKoEtynmifG86Js/971Thkj1
         BdKn6+Vv+NETyiZI3QKX3Z4LBkDcyoJObxmibPYOpW7KB2cWoOBeTm20egGAlqmLm4Zm
         krdA==
X-Gm-Message-State: AOJu0Yz+Ud9UAZyJ+SGI4ViicS8rAzXdB8oKHcSDndgDDfP3ZC7w4tU0
	uFxVN1mzAL9EB+MQhbSdOy5h380PW72jb0rwUWeqDN3L6mKjaoDbcdP2n7TvZR8/D7IGzG98ud1
	qTib9Iuj6o3cOpsIgGMbeDrBcwekjhbt6Z2eIxg==
X-Google-Smtp-Source: AGHT+IHSURKMKJQJ8iOm14kwfS3bjvcRznZyc9Jn4SHhAS1fAp0nsTOLwO9tvLs2+BH4mEHc5nyW4ZOMcRvTHBlFqBE=
X-Received: by 2002:a05:6820:60a:b0:5e1:c6ae:d93 with SMTP id
 006d021491bc7-5e201435089mr7337284eaf.2.1726491477715; Mon, 16 Sep 2024
 05:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240916094424.74002-1-frediano.ziglio@cloud.com>
 <833668bc-6a37-4cad-98bc-7754720b7606@citrix.com> <CACHz=ZgndSWqL9QR62c9gpTisvg4CeSZu4y06J+gFprNvCDqhA@mail.gmail.com>
In-Reply-To: <CACHz=ZgndSWqL9QR62c9gpTisvg4CeSZu4y06J+gFprNvCDqhA@mail.gmail.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 16 Sep 2024 13:57:46 +0100
Message-ID: <CACHz=Zg_pPL-g09ix7tf8p+GbX1_Z6q_jRDvQ6SMrgxd_BezpQ@mail.gmail.com>
Subject: Re: [PATCH v3] x86: Put trampoline in separate .init.trampoline section
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 1:29=E2=80=AFPM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
...
> >
> > Independently, given the adjustment in this patch, we should just make
> > trampoline.o a proper object and take it out of head.S  That's one fewe=
r
> > non-standard moving parts in the build.
> >
>
> I think another hidden assumption is having the possibility to do some
> math on trampoline symbols, and that requires having the source of the
> trampoline combined with the source of head.S. But to remove the
> "think" from the previous sentence, I need to do some test.
>

Okay, there are 2 formulae that requires this, specifically
- (.Ltrampoline_gdt_end - trampoline_gdt)
- (trampoline_boot_cpu_entry - trampoline_start)

just 3 symbols to export (trampoline_start is already exported) and 2
numbers to compute somehow (either linker script exporting absolute
symbols or computing using code).

> > ~Andrew
>

Frediano


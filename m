Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE12097A2CA
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 15:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799514.1209510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqBaV-0007P9-0U; Mon, 16 Sep 2024 13:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799514.1209510; Mon, 16 Sep 2024 13:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqBaU-0007Ly-Tp; Mon, 16 Sep 2024 13:16:18 +0000
Received: by outflank-mailman (input) for mailman id 799514;
 Mon, 16 Sep 2024 13:16:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wse+=QO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sqBaS-0007Lq-JX
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 13:16:16 +0000
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [2607:f8b0:4864:20::c33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9aa3162-742d-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 15:16:15 +0200 (CEST)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5e5568f1baaso460947eaf.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 06:16:15 -0700 (PDT)
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
X-Inumbo-ID: d9aa3162-742d-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726492574; x=1727097374; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFqvCCrKAI0+uo2JzohmElrVlIe7++rQXVSHNWxLb74=;
        b=KfXSJsE5aEKlNhIoLkfmmojZEYZbX/BfuV4LJiU14nMzegFTCZivyni3cynm+PBe7L
         L3nCDw+hhuU4qFXVHJwN1S7fGynifYsyJAB4w35x1HfGRKlyr03g1uRAGb4Cv8dUVfNz
         zxs2H39wf27oQcsCKPRB5FZqUSlvIYXN7sRuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726492574; x=1727097374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFqvCCrKAI0+uo2JzohmElrVlIe7++rQXVSHNWxLb74=;
        b=sIgfteow27qhUyd6c/XNfqS5hjB/jWzluU56oPTgHnYk6rmEfhOYQF/OYX7HDnU70d
         OvIWMuwdbKUMdNtZwhbHmlg+YKnw8TYzQMI9tdqGVBnxW2fdNo2JbKqwUd2ywMRlIQH5
         0kSahLbvIA/TbQn3vD1Tj56T5KMiULuCJ37FRQsCXXKdL/DqlVUT94jn8BWBNAUtmLOW
         AjPYHWOdrhurhMyff5EfzwPr7Zac0E4rAJHHQjy4xkWyrX3mpdwLNNK2iigbM8X2FgsQ
         ICYbYi0PbleoiMAmnt3bQ+cKiO47KjuD9k5TDvD75/MNkHPq/rxsU5/PbP2c3T/j7ppS
         JH2g==
X-Gm-Message-State: AOJu0Yw/Kb2wVhq5OEp/OqDDfBzx0EO02gYFthoSGq+KPf3WrR9q/t9l
	iueDwJika97Gw5OFAe1vH5UOr96SlS90+3bTw1ZgYNWqAyx1G6V/FtN2Bk3Phzuitu+uVW2LRRy
	gh5LT77eyTZ54rgNIB0rxYvsvhKMP8BGzO63fjw==
X-Google-Smtp-Source: AGHT+IH+E2CGeZe8XB1DPr5tdcjJxNypRa6APSh/4gOPp4OgFK6bnUxyHtnDdEJQL03J0cDVw1mxyjPQTHM4VNofyWk=
X-Received: by 2002:a05:6820:552:b0:5e1:d741:6f04 with SMTP id
 006d021491bc7-5e201420246mr7907152eaf.3.1726492574031; Mon, 16 Sep 2024
 06:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240916115811.2076392-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240916115811.2076392-1-andrew.cooper3@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 16 Sep 2024 14:16:03 +0100
Message-ID: <CACHz=ZiemNMMBk7GT9+Y=WLN5zm-M7-QDwa-H760Ca=THPvkNw@mail.gmail.com>
Subject: Re: [PATCH] x86/boot: Drop stale comment about zeroing the stack
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 12:58=E2=80=AFPM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> This used to be true, but was altered by commit 37786b23b027 ("x86/cet: R=
emove
> writeable mapping of the BSPs shadow stack") which moved cpu0_stack into
> .init.bss.stack_aligned.
>
> Fixes: 37786b23b027 ("x86/cet: Remove writeable mapping of the BSPs shado=
w stack")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/arch/x86/boot/head.S | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index 12bbb97f33d4..cfc5a7b47d29 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -652,11 +652,7 @@ trampoline_setup:
>          cmpb    $0, sym_esi(efi_platform)
>          jnz     1f
>
> -        /*
> -         * Initialise the BSS.
> -         *
> -         * !!! WARNING - also zeroes the current stack !!!
> -         */
> +        /* Initialise the BSS. */
>          lea     sym_esi(__bss_start), %edi
>          lea     sym_esi(__bss_end), %ecx
>          sub     %edi,%ecx
>
> base-commit: a8bf14f6f331d4f428010b4277b67c33f561ed19

Nice to know!

Acked-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Frediano


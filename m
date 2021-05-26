Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15921391E10
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 19:24:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132659.247368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llxGF-0005oJ-NR; Wed, 26 May 2021 17:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132659.247368; Wed, 26 May 2021 17:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llxGF-0005mS-J5; Wed, 26 May 2021 17:24:03 +0000
Received: by outflank-mailman (input) for mailman id 132659;
 Wed, 26 May 2021 17:24:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JqRz=KV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1llxGD-0005mK-LK
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 17:24:01 +0000
Received: from mail-lj1-x22b.google.com (unknown [2a00:1450:4864:20::22b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e7add9d-a836-44b3-8762-feaa079bf9c4;
 Wed, 26 May 2021 17:24:00 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id a4so2689712ljd.5
 for <xen-devel@lists.xenproject.org>; Wed, 26 May 2021 10:24:00 -0700 (PDT)
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
X-Inumbo-ID: 3e7add9d-a836-44b3-8762-feaa079bf9c4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ptbYf6+VtJZPBOlExjwvlvDDRPFS5hF2G30LNOycenM=;
        b=NLr+x7NpFSYauH+pJzUK+pbPs1Gb99ObTSjoaPFEuuiFDHlxxld42kIqbwveHzQ1Mr
         3RPc5S/1L6XFosUyu5SindGfWSDD8nSzA2JHRZCmbry2XBf18cftDNhlIdcpAmMsZpkW
         f1ZzRKbJa+ylA0Yn+0qtqHytbklEIBrgEmmmf5iUHH9Z4U4Bk6XYbIPtJFLaWlRI6UOK
         xfklCTZumL9pk5lBrx57w9EceGfTUzFzqexVuTHfK0eBzfADMtJAVBGVom0onKQam9kp
         FwmgJMS4mR0WUZPyd7OfM4/Za4C1xE20S6MJ9loAbz+58EDkuP1qmlIJik20Jv/YWDx8
         9JRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ptbYf6+VtJZPBOlExjwvlvDDRPFS5hF2G30LNOycenM=;
        b=QQOjlhqnEpDHOZfQfrvb6TfUHWVDQKef4xOT+t5F6YOddTi5w4AlRvoubGKFqwW69u
         dskT4bnAQZCVWZTl50H7jEAkhCrsoJ3zddRWOzXvqM6ePZfNGuBtXUi7W0P4FvUeZUye
         Vo1SizZX+ipnemV5WP+Dkc3kuQkbcKzg+GwtnYAhpAbupG1wpPu17g/3khhT3rSskSbW
         mTx7Jv/liy7chtUtmeiTqFj4OG12hA7T6F+qtIJGEWXYFWGLLV8iI6ZcYYrKdQV5dimY
         ZZd527K2tPmhCqapV21xX3x6kbXDr97sqqdQRQufX05LbSxb9fnq3PnkE7yyqos3vOvy
         KOoA==
X-Gm-Message-State: AOAM5323+/rbEvfr3TAIHeIKPZPgk62ZciT5fA8NjWMqXhYDzfS2MraT
	/ccW2ZPFKHOnyXlJv+5cJYlLE3JxUduPibcyFu0=
X-Google-Smtp-Source: ABdhPJwcPMD6iJ3xDap8EDEamqU9zO97yN9kyZAHpx5m5BIzxWdXvqrQiXVXSVDr6gqVQR6WqvZDSUu4DK6Uu6ZKMtA=
X-Received: by 2002:a05:651c:1a7:: with SMTP id c7mr3020551ljn.77.1622049839778;
 Wed, 26 May 2021 10:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <ca7a78e5-2ee9-4109-7905-3b9186475f3d@suse.com>
In-Reply-To: <ca7a78e5-2ee9-4109-7905-3b9186475f3d@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 26 May 2021 13:23:48 -0400
Message-ID: <CAKf6xptQaLw74y5pYuSo9ZXVDoFmCaNByNuKi6vwZ4LnSDoa=w@mail.gmail.com>
Subject: Re: [PATCH] x86: make hypervisor build with gcc11
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 11:40 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> Gcc 11 looks to make incorrect assumptions about valid ranges that
> pointers may be used for addressing when they are derived from e.g. a
> plain constant. See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D100680=
.
>
> Utilize RELOC_HIDE() to work around the issue, which for x86 manifests
> in at least
> - mpparse.c:efi_check_config(),
> - tboot.c:tboot_probe(),
> - tboot.c:tboot_gen_frametable_integrity(),
> - x86_emulate.c:x86_emulate() (at -O2 only).
> The last case is particularly odd not just because it only triggers at
> higher optimization levels, but also because it only affects one of at
> least three similar constructs. Various "note" diagnostics claim the
> valid index range to be [0, 2=E2=81=B6=C2=B3-1].
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Tested-by: Jason Andryuk <jandryuk@gmail.com>

Needed on Fedora 34.

Thanks,
Jason


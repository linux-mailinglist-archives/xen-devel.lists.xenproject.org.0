Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F61371677
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 16:14:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121632.229404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldZKu-0001kv-Sx; Mon, 03 May 2021 14:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121632.229404; Mon, 03 May 2021 14:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldZKu-0001kW-Pb; Mon, 03 May 2021 14:14:12 +0000
Received: by outflank-mailman (input) for mailman id 121632;
 Mon, 03 May 2021 14:14:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1Q=J6=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ldZKs-0001kQ-Su
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 14:14:10 +0000
Received: from mail-lj1-x22e.google.com (unknown [2a00:1450:4864:20::22e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf206946-606c-4f7e-88b4-5f043f76fbab;
 Mon, 03 May 2021 14:14:09 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id a36so6927102ljq.8
 for <xen-devel@lists.xenproject.org>; Mon, 03 May 2021 07:14:09 -0700 (PDT)
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
X-Inumbo-ID: bf206946-606c-4f7e-88b4-5f043f76fbab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kJVI2bPr4asnrjKn10q9IGKWJGDWc3UWQSKC9TQfcNg=;
        b=KI6PNqEw2xMoiOslciapKHd8xGLlFF3wfpomZqOdCyXQ/eWk4JSDMMBAKazRAVd9mN
         j6kKloReNvs4RhYBjO+UeVF++/jAH0DoMzoBnE7lXouPcRfYiAunuBz6we0zAH68hy8k
         /Q3OEqgl9yZYbQECWTf1GFcBpixZQOBUAShzAa4xdHZBcm5gYUYQ+k2h+sACngU6vHaf
         IxSwMvUvtN904MrqgLUSCnVJuWk+WBHIAXXdY5jdp/KQUnuhhvEFBDHkM82uQj33lSsf
         M5C3Ma7bvnMNr7A7DyOrhkXvu+BAg4/1hDi8iyPxy/gxG8MAvFnsJWpI602RsRcdQduh
         mZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kJVI2bPr4asnrjKn10q9IGKWJGDWc3UWQSKC9TQfcNg=;
        b=Wkp9+0h96eVQsMnaLdxENCpCW3BQ6d4r8GZsH4kZwnhrq7h12mSdlyfb9Miq2VT/4p
         U7B/RkLNthy0IouaVR8DhijBrEn3c3OavNSlX33YelD5QWCCMVwB3cyzZYaNUpCzlRj3
         YHIF8RGp0t3sdWw/9uJlofG2PIK3IYrYoXg5v0bu7gADmejOY64XDDt7YeRmWZDBqir7
         wLMI/vDmjSIuA9S/rH4gCY38gdON4HzVliPTEt/EQqdotY9GViVY4DTB1ud5Co1F1jru
         kq3+6vIOhky5vUZQnfVggzPWU5kexPAUXpjR8WKJ0TDfa7oSpQQOKOQAxoG7WWI7Xv/i
         vj7Q==
X-Gm-Message-State: AOAM530eqS140i8DM7C8aeHtt8a+OuyBQkxF/aTbBpuW8j3uEWrmcMLC
	l+9hforrrHW0iu7pJXnuREjUYwF9R9BN/BZoYvk=
X-Google-Smtp-Source: ABdhPJyIFJwaKOIF8lg4ByhHypta3OQA3ZshsYGa8p5IG4g1DqB9Uku1elV7Y6KtTNgg54nbNpn038V9vLxOGHTbeFM=
X-Received: by 2002:a2e:7f14:: with SMTP id a20mr14167556ljd.489.1620051248583;
 Mon, 03 May 2021 07:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210423161558.224367-1-anthony.perard@citrix.com>
In-Reply-To: <20210423161558.224367-1-anthony.perard@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 3 May 2021 10:13:57 -0400
Message-ID: <CAKf6xpt_xkpnNwcq2-WS3SN+Qj8gcz33MaGdfCW=30HzfqrWng@mail.gmail.com>
Subject: Re: [XEN PATCH 0/8] Fix libxl with QEMU 6.0 + remove some more
 deprecated usages.
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, 
	Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 23, 2021 at 12:16 PM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> Patch series available in this git branch:
> https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.deprecated-qemu-qmp-and-cmd-v1
>
> The Xen 4.15 release that went out just before QEMU 6.0 won't be compaptible
> with the latter. This patch series fixes libxl to replace use of QMP commands
> that have been removed from QEMU and to fix usage of deprecated command and
> parameters that well be remove from QEMU in the future.
>
> All of the series should be backported to at least Xen 4.15 or it won't be
> possible to migrate, hotplug cpu or change cdrom on HVM guest when QEMU 6.0 and
> newer is used. QEMU 6.0 is about to be release, within a week.
>
> Backport: 4.15
>
> Anthony PERARD (8):
>   libxl: Replace deprecated QMP command by "query-cpus-fast"
>   libxl: Replace QEMU's command line short-form boolean option
>   libxl: Replace deprecated "cpu-add" QMP command by "device_add"
>   libxl: Use -device for cd-rom drives
>   libxl: Assert qmp_ev's state in qmp_ev_qemu_compare_version
>   libxl: Export libxl__qmp_ev_qemu_compare_version
>   libxl: Use `id` with the "eject" QMP command
>   libxl: Replace QMP command "change" by "blockdev-change-media"

For the rest of the series besides
libxl: Replace deprecated QMP command by "query-cpus-fast"
and
libxl: Replace deprecated "cpu-add" QMP command by "device_add"

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>


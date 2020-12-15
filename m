Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 621F82DA64B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 03:36:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52815.92166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp0BU-0006w4-4y; Tue, 15 Dec 2020 02:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52815.92166; Tue, 15 Dec 2020 02:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp0BU-0006vf-1o; Tue, 15 Dec 2020 02:35:28 +0000
Received: by outflank-mailman (input) for mailman id 52815;
 Tue, 15 Dec 2020 02:35:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1f4I=FT=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1kp0BS-0006va-Kd
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 02:35:26 +0000
Received: from mail-qk1-x729.google.com (unknown [2607:f8b0:4864:20::729])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76d2e616-f61a-4945-9ead-b31f519c853f;
 Tue, 15 Dec 2020 02:35:25 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id c7so17825539qke.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Dec 2020 18:35:25 -0800 (PST)
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
X-Inumbo-ID: 76d2e616-f61a-4945-9ead-b31f519c853f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FPaR7CVrzngNMt+LKvxWdO+M2sng7xDIlm/Ym2ZB9wI=;
        b=bBeoEX7PQRKWF5zld0qC4gpyVMjY9/5NA8+oYLI7AqXug23ER9p3LZKypQeXwETCTR
         GokDoKqaQt8yOCGLdxEB0hjijRfl0+Jv8VR5jlRUSJ19Tfmwg/ppEBN1gPtkDP7vdF4w
         mTHEfriUgq4Q0unnUSQvM/Qfw/OGNawdBprmB+j93h8IQMcfs5/pE2JF8ISex43s4aOu
         budF7iMaU/lRYIYyeowk6C2rrTXRMSH2FhoFTY0Uy9krGatwSZ7hhKBCJnEehuG6nah8
         C2m48zyHYdJrsvEcUd8e4WRBVr7FmNFPHgx5UQ51WeOlsaTeb7XUN4/H3kNVQjjSwNjx
         9g6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FPaR7CVrzngNMt+LKvxWdO+M2sng7xDIlm/Ym2ZB9wI=;
        b=PebRCYzO8Oxfz1PoJmjhNsG2HtZ2k3mvfhKKvfmY94cZY9q2mEF2e/Ebd5rpqYTu+5
         v5Z3V5O3DB/Y8axbRAH4AEhHf9w3ufOWNITrhnt2BjByC1P4M5bBETX8CQFwTwoqwBS1
         ihcSdhW4DnYRz3bLSJDk6p9OuD4nVFmqYRm+OfrwZ3EzYjpV8k7gNIe+IZ3OAN0GAjcx
         +8exgXhsPj1PYlRVXyO/xA9F2lr1Mfh607CzwRhIidfna+n3VWeLLXyDBFgxOrVmO7QO
         cRU0zTAIZZLGsWZ/9tiVYLF/kQFCRp9P6ouds1XBmY1UDzOnY8jrnu7mMqMAK/248B9t
         kgTA==
X-Gm-Message-State: AOAM532rvbmcJxJTwHvrgobBybQI6Kw7bSvqHNgXZd/TEY6N61ZMGFHU
	CgW+ceLsxfAHeNvJT4N8jR2Jp8r9PPnXzQPJk+UtHg==
X-Google-Smtp-Source: ABdhPJwz50lTMXTem38wwR1TpX1qxg3CP2Je0lRujFtDDfQ6VuSzDgo+W1fpfRS5l2/b3jC7wcS7v6x07EZLmf6N4hk=
X-Received: by 2002:a37:8081:: with SMTP id b123mr36385936qkd.157.1607999725376;
 Mon, 14 Dec 2020 18:35:25 -0800 (PST)
MIME-Version: 1.0
References: <X9gcZu5uJpXx8wNn@mattapan.m5p.com>
In-Reply-To: <X9gcZu5uJpXx8wNn@mattapan.m5p.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 14 Dec 2020 18:35:14 -0800
Message-ID: <CAMmSBy_8+PRWiSQxwRN2oB9mLmOnyoCr0mH4L-uUYhm=1GK7Xg@mail.gmail.com>
Subject: Re: Xen-ARM DomUs
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 14, 2020 at 6:16 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
>
> Finally getting to the truly productive stages of my project with Xen on
> ARM.
>
> How many of the OSes which function as x86 DomUs for Xen, function as
> ARM DomUs?  Getting Linux operational was straightforward, but what of
> others?

On EVE we have Windows running as a pretty much a customer-facing demo:
    https://wiki.lfedge.org/display/EVE/How+get+Windows+10+running+on+a+Raspberry+Pi

> The available examples seem geared towards Linux DomUs.  I'm looking at a
> FreeBSD installation image and it appears to expect an EFI firmware.
> Beyond having a bunch of files appearing oriented towards booting on EFI
> I can't say much about (booting) FreeBSD/ARM DomUs.

Personally I'm about to make Plan9 (well 9front really) run as well ;-)

Thanks,
Roman.


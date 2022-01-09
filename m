Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD417488B7F
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jan 2022 19:10:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255175.437283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6ce6-0002A1-Qi; Sun, 09 Jan 2022 18:10:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255175.437283; Sun, 09 Jan 2022 18:10:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6ce6-00027k-Nc; Sun, 09 Jan 2022 18:10:22 +0000
Received: by outflank-mailman (input) for mailman id 255175;
 Sun, 09 Jan 2022 18:10:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/oUG=RZ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1n6ce5-00027e-JJ
 for xen-devel@lists.xenproject.org; Sun, 09 Jan 2022 18:10:21 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67d0aab2-7177-11ec-81c1-a30af7de8005;
 Sun, 09 Jan 2022 19:10:20 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id x7so36418727lfu.8
 for <xen-devel@lists.xenproject.org>; Sun, 09 Jan 2022 10:10:19 -0800 (PST)
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
X-Inumbo-ID: 67d0aab2-7177-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TdLe/UsDeoWDHkHlHG077RHOXF/Je0GzlO1+IuEc6hA=;
        b=i3X1mn5eACmEucbBIooNBn6bjAXnvpf0ybqDNLTLTZuWEOxbDW1GzF/7DXFgjNILEJ
         P0kICo2aecz/aPq86cUAms2zrxXBj/20lxg2UMSYQ2fbzMi0XDhUFeUNQmzzk0fDQ7H1
         3hY0VPSRLlz9Qr21aa/wbL+/0jUF545/2QhvsDMbL+YmjYbFWXIcfinikxgt9y++n0Yx
         HIz1hqnCe98mxq8BuiAiinu0TgLpn9zQhamQ9Kfq3tU9OVstXhS4YN4t3oRjfDgKLQR0
         yOS26lfrR1dNpOFpDD/yQgnb+CufJn1eMS4hjfLY4vDHBgPn+BcKDWlISS1qz8oMcfPb
         3XKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TdLe/UsDeoWDHkHlHG077RHOXF/Je0GzlO1+IuEc6hA=;
        b=t/67VSqtiCt1F4+T5gY/ikaqQCOIOoyWC00laZGMwjrk0lucTjZeQEsB6QVcNju+5v
         i9k+wlZncG/V4BixHzsRQ93R5LwQ2GqFxuPAjwIGhhar3p4kiY4RxQ3f754BXyAxJhVz
         5aJOLidy0VRXhl93/9Ii4QdURqKgzruh3NqRSysDzWpPW9ATdx8LpDbG6pMRmgnzFHIn
         70GqCjExu08aAkPR9QVq7gApiFhvggMWLzIFJM04eM/wvmx+wp9le/jWy+StJb3yns+m
         7Nf8KopdYTg+12s3W4cUrahpkPFkr423LjBP2XSztzVd8F10q1sQge/Suh6nxis2Y7Bi
         NWMA==
X-Gm-Message-State: AOAM530WoNiyw1w4mAKIGBuJl/py8E5dSmyQWwYJmmm5DJuKcjZucC7u
	5YKZtoWGi1Qq60Eyk9KkLAj1jbna5xY8EhNtmT4=
X-Google-Smtp-Source: ABdhPJyn/lbtuFmdmluHsk9x6hIuIzqF5yzKd7hNO8qBuLdBjk6p90RJ9Mru/6b6tqTNuwCaGYNeF86PpV7TdpFnHUM=
X-Received: by 2002:a05:6512:3054:: with SMTP id b20mr62514152lfb.359.1641751819176;
 Sun, 09 Jan 2022 10:10:19 -0800 (PST)
MIME-Version: 1.0
References: <20220109100133.19731-1-jgross@suse.com>
In-Reply-To: <20220109100133.19731-1-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sun, 9 Jan 2022 13:10:07 -0500
Message-ID: <CAKf6xpt3gfxFzwZgZfAseMHTg+X5xJ_CZNsOrYvEPtpMndFJ2Q@mail.gmail.com>
Subject: Re: [PATCH] build: fix make distclean
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Elena Ufimtseva <elena.ufimtseva@oracle.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 9, 2022 at 5:02 AM Juergen Gross <jgross@suse.com> wrote:
>
> "make distclean" will complain that "-c" is no supported flag for make.
>
> Fix that by using "-C".
>
> The error has been present for a long time, but it was uncovered only
> recently.
>
> Fixes: 2400a9a365c5619 ("tools/debugger: Allow make to recurse into debugger/")
> Fixes: f9c9b127753e9ed ("tools: fix make distclean")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Tested-by: Jason Andryuk <jandryuk@gmail.com>

I just hit this.  Thanks.

-Jason


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5E897EB6D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 14:20:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802030.1212130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssi1z-0000DQ-Om; Mon, 23 Sep 2024 12:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802030.1212130; Mon, 23 Sep 2024 12:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssi1z-0000Bu-Kq; Mon, 23 Sep 2024 12:19:07 +0000
Received: by outflank-mailman (input) for mailman id 802030;
 Mon, 23 Sep 2024 12:19:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qfp8=QV=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1ssi1x-0000Bo-KW
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 12:19:05 +0000
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [2607:f8b0:4864:20::c32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05730731-79a6-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 14:19:04 +0200 (CEST)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-5da686531d3so2441213eaf.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 05:19:04 -0700 (PDT)
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
X-Inumbo-ID: 05730731-79a6-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727093943; x=1727698743; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUtqMkA0974TSt7gflFq9IYwDBu1X0fa07wYN0750VU=;
        b=MbfSEkNJhZN4ED7sqQjxd9phvXng6Lh0nEKPAPVv+r6NU6+1HrprH/vz7aIbsO35h7
         EFweykj6hIBGMCda1rMrq0yrVEfnk1V1ak+R5Szx1sbAWUHdgcWavoS75wriWRcMGgFG
         x/QJW2HYq4GRTL/iaZHGMjf84x8frK5OW5OuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727093943; x=1727698743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUtqMkA0974TSt7gflFq9IYwDBu1X0fa07wYN0750VU=;
        b=qUUvuyVJOxnXusl19BYM2iPZBwFlXzty+a+TZ1uQO2yx62XUFmMHGcxlavQkJ9yn+u
         RXPcks/xDtMV3AZkOgl6UjpUc8i7D4Nk/0GhBVjQs0NZSVTDm447Pj9jT54w8t9DXxRC
         mom5nzNqgGS55ICqkvh+6vH/BfZM6GM+XIbfLKaPDgnlZqih7028k5yXD4LXgAy6eN1e
         ShmwohUK2tgxddd0Wu3ae4sI1Bkhm14L2GYs3ps4uXvI1NfJCSMkoVMp9EJpXByazd6p
         RYsbwzd/NRwNRVxv+XcB9PYqjq+sGbbfxef+nXvlSCT/Vc0DYNZu4HAWUL5U4yq7LobZ
         v5pQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7fIhxC5M1Hxb1i6J0rf/B6vSGDy0leMiKWG/V0SmfAN3zeTKkjeuoutsivw4vx01bVgU1i50erlw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzn8KMQpNu6wi17hnxr8vRDttrECxpR6Zr/gn5VrVouPwR7aKjv
	O90vnjdBgdPq2kIspfn4jAmuVjH4Xmo6DBU26NskBv/WsaWYYzn8WDCYSorw3hUWUn+X5BWfbVp
	h60p9IobhDe7rchgXYu5ZYLm7C5c4+c6ypKKOSw==
X-Google-Smtp-Source: AGHT+IFKD6lAgjK7lRaqk3HjfWJx39u6Hh4arTBkjHMAlotNBHrnlNgGwckEtwQXvVCoZSyJZQCFeiUU+sJW/UdhYhM=
X-Received: by 2002:a05:6820:2208:b0:5e5:732d:51e2 with SMTP id
 006d021491bc7-5e58ba9aeb0mr6180424eaf.8.1727093942903; Mon, 23 Sep 2024
 05:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240916115811.2076392-1-andrew.cooper3@citrix.com>
 <CACHz=ZiemNMMBk7GT9+Y=WLN5zm-M7-QDwa-H760Ca=THPvkNw@mail.gmail.com> <81afd5ee-8372-413c-ac54-39193836915b@suse.com>
In-Reply-To: <81afd5ee-8372-413c-ac54-39193836915b@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 23 Sep 2024 13:18:52 +0100
Message-ID: <CACHz=ZhwmfSGTFmrLp-pK1zF85p3iBva07C2zzxpXsXVY4gS0g@mail.gmail.com>
Subject: Re: [PATCH] x86/boot: Drop stale comment about zeroing the stack
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 12:32=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
...
> >
> > Acked-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>
> Frediano, just FYI on the formal aspects here (which we don't always foll=
ow to
> the letter, but still): If you had offered Reviewed-by:, Andrew would hav=
e been
> fine to commit with just that. You can't just ack anything you're not
> maintainer for (or really: you can, but formally it has no meaning).
>
> Jan

It makes sense, thanks

Frediano


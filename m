Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5828C34D86E
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 21:42:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103254.197029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQxlu-0005Ky-Js; Mon, 29 Mar 2021 19:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103254.197029; Mon, 29 Mar 2021 19:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQxlu-0005KZ-Ga; Mon, 29 Mar 2021 19:41:58 +0000
Received: by outflank-mailman (input) for mailman id 103254;
 Mon, 29 Mar 2021 19:41:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wUqM=I3=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1lQxls-0005KU-VK
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 19:41:57 +0000
Received: from mail-ej1-x630.google.com (unknown [2a00:1450:4864:20::630])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7439ef1-727f-4efa-823c-78dac536d8aa;
 Mon, 29 Mar 2021 19:41:56 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id hq27so21237890ejc.9
 for <xen-devel@lists.xenproject.org>; Mon, 29 Mar 2021 12:41:56 -0700 (PDT)
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
X-Inumbo-ID: c7439ef1-727f-4efa-823c-78dac536d8aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LNwciN1+aKLrfAajIeX8oyDJ4fRN7O1tEYVPKp96JTU=;
        b=JebqtA6n0mG+MR0mx55xMpdLlg48O7eh2STrYuDILb8Z8OYveDo/4LmB43bLCzO746
         +5/8i7PfhJo8y66NoIqsdQZYLdwGUSERrZ30x+L7fQzHBE1L7X2B6VqjevHtDkF+WwAE
         NlUanZih8N+tOmHLPhFJ71R79cQ+pNY55VLwZRh6f1cz/Fp8hXEWQwSewCUMua8/YBIq
         fRgEyO5ps9QegstpWuKrQV8VBPJoecHBGlpVbLRoEe88VhOYxGZC3yDS1MkIkz9P+k2/
         gGbQMAb2FasCkHgUoiuELj3+KYq9WoXylS60kRrgABmWX+WRCwrI+YAb9HpqxWlptQBq
         y5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LNwciN1+aKLrfAajIeX8oyDJ4fRN7O1tEYVPKp96JTU=;
        b=mxc0r5ePaPt04Yp88I7C+wVsb++eA7ZzNAUMZQngkfjr2x9sqnJCNDrRh8Req0KQ0x
         wRujIKp+pa4R0rs/0hjMQhjMXV6KVh7rnevmFBTwbdayvb4SxnQ+CwLN66sJN3Nb738O
         TJTcT024/NznB0O1sfdGJw72oFoiyWh8CVxqyToqWKoMAUVap5Q/t6m1C7ErogD0p1yB
         Ut3PQCFQsY2AuT6Lq3yl8SwX1arcOE0rQ/S7z4dnc0jQe83777tx/TwMkfcQ8EG3Z1c6
         C80DVJlps/DE2AoDI0618iVw+/Lk+9K9CC92t6JA385jYZsQ9AoU7moXwrlLQlfH52K7
         QEjw==
X-Gm-Message-State: AOAM531uoRxdtotdWGjkU3mDlW6W59wNl5P2q89FCXlyEFe2Pt2cJQom
	u3k5seP0W2a11gtZQfg5MyJudAf/9Et5uP8fjxsPoA==
X-Google-Smtp-Source: ABdhPJxWJO2Uv9tI4iJCeNNkMldIGTiuNbrnyUesdunReGr7gRstV/EjgM3FksR6BGNwGI2LBvxiKhPDhEOH/IHjt9U=
X-Received: by 2002:a17:906:c301:: with SMTP id s1mr29332463ejz.382.1617046915270;
 Mon, 29 Mar 2021 12:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAKqicRBsCxFY=A=RD6kHaZa7bFag+hmUkwAJc-LSYy8XvsbGPg@mail.gmail.com>
 <889B1827-1FEB-4AC0-9002-278337D19ED5@citrix.com> <CAKqicRCiahd5bt1Qo=Mdh4DYRQbGWf410gF=CG51J9AD=4YwmA@mail.gmail.com>
In-Reply-To: <CAKqicRCiahd5bt1Qo=Mdh4DYRQbGWf410gF=CG51J9AD=4YwmA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Mar 2021 19:41:24 +0000
Message-ID: <CAFEAcA-bYZnxwCtOJxoDWsMxtjPqgc5n6Mq8Z5gbjDCqi6t_Hg@mail.gmail.com>
Subject: Re: An error due to installation that require binutils package
To: John Simpson <ttr9droid@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, "open list:X86" <xen-devel@lists.xenproject.org>, 
	"gcc-help@gcc.gnu.org" <gcc-help@gcc.gnu.org>, Community Manager <community.manager@xenproject.org>, 
	George Dunlap <George.Dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Mar 2021 at 20:20, John Simpson <ttr9droid@gmail.com> wrote:
>
> Hello,
>
> Kindly ask you to have a look at this bug.
> Thank you for your replies.

>> > On Sun, Mar 28, 2021 at 12:55:23PM +0300, John Simpson via Binutils wrote:
>> > >   BUILD   pc-bios/optionrom/kvmvapic.img
>> > > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)

This is a known issue when trying to compile with newer binutils,
fixed in QEMU commit bbd2d5a8120771, which will be in 5.2.1 and 6.0.

thanks
-- PMM


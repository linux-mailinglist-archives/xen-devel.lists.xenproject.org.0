Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1953AB6CE
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 17:02:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144034.265191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lttWv-000408-Vq; Thu, 17 Jun 2021 15:02:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144034.265191; Thu, 17 Jun 2021 15:02:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lttWv-0003xW-Sq; Thu, 17 Jun 2021 15:02:05 +0000
Received: by outflank-mailman (input) for mailman id 144034;
 Thu, 17 Jun 2021 15:02:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/B9P=LL=linuxfoundation.org=torvalds@srs-us1.protection.inumbo.net>)
 id 1lttWu-0003xQ-GH
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 15:02:04 +0000
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efa04bd8-6e8a-406b-904e-d58e041f691d;
 Thu, 17 Jun 2021 15:02:03 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id m21so11008458lfg.13
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jun 2021 08:02:03 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54])
 by smtp.gmail.com with ESMTPSA id bp29sm253627lfb.206.2021.06.17.08.02.01
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 08:02:01 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id p7so10995478lfg.4
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jun 2021 08:02:01 -0700 (PDT)
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
X-Inumbo-ID: efa04bd8-6e8a-406b-904e-d58e041f691d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gffjb4M/ANAqzeNlRTmLWG4NfOIBWBpaTeKu6FSOXY4=;
        b=e2pya7mjwKyFA8vanJytXcFh7uxmGZPAlpPiR4xcGsuhpU8OpojtLamxouDGkOAAMZ
         IwsLcVvossuqnXnFhoiFkeYFbsstgBxSGF9e3AJISi2nxNC5XwHJyzfUP8NkIXRymNUQ
         UxNen6DuR0XCy7bVfX0EYRyv6AW8cQOVq9as4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gffjb4M/ANAqzeNlRTmLWG4NfOIBWBpaTeKu6FSOXY4=;
        b=Aq7XB4rzu22gwE+Js0aH2YHRPjrKNIR4hBqlQ2YQB9zBgJMTw/lwH+p9qeCGzdAINf
         3MblYddyxpcTDFcDP3OFX9Ij11IKwLFc0jPyKTtqum5xpwFAewVPGxw4ZQzdvSxDjgwM
         w+kIPs9lFnXPJFhS7Jv2zzSYgluxi4NpGAtXwsLNEgIWXw5gKOIFDhdgrkjfSA4/FDie
         M3EsePbLL4u9BzCNlE+B8qng+zfFYCPuA7mhZvEehmr9pYq//ACvN5EfRu5WKs1Rfra9
         rZ7ccq6cWxHUEXf0MV8eAecSmkh9p5YSXcDrDRDDjRWzoKQRkWWTpbtqWwAHTk7sVvoH
         ER0g==
X-Gm-Message-State: AOAM5306rzoP+Ajs9CAyDVgfQa7nl+AspfXmJuhr+ffk0R5qPR0WnbUk
	JIqeKyFYWh3moM22A62bWHVSYwnZhf2m463lwB0=
X-Google-Smtp-Source: ABdhPJyLznj2Woaiag9v/7GAIgtCmjWedgZerHcjlR2OJu45By/QjxhUZcXR2ia64umDd3QJWqrotw==
X-Received: by 2002:ac2:4909:: with SMTP id n9mr4220011lfi.177.1623942121866;
        Thu, 17 Jun 2021 08:02:01 -0700 (PDT)
X-Received: by 2002:a05:6512:3f82:: with SMTP id x2mr4241418lfa.421.1623942120465;
 Thu, 17 Jun 2021 08:02:00 -0700 (PDT)
MIME-Version: 1.0
References: <ee8bf04c-6e55-1d9b-7bdb-25e6108e8e1e@eikelenboom.it>
In-Reply-To: <ee8bf04c-6e55-1d9b-7bdb-25e6108e8e1e@eikelenboom.it>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 17 Jun 2021 08:01:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjgg67NMBNG99naEQ1cM0mXBBzdhCJaYFH-kC+mLK+J2g@mail.gmail.com>
Message-ID: <CAHk-=wjgg67NMBNG99naEQ1cM0mXBBzdhCJaYFH-kC+mLK+J2g@mail.gmail.com>
Subject: Re: Linux 5.13-rc6 regression to 5.12.x: kernel OOM and panic during
 kernel boot in low memory Xen VM's (256MB assigned memory).
To: Sander Eikelenboom <linux@eikelenboom.it>, Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 17, 2021 at 2:26 AM Sander Eikelenboom <linux@eikelenboom.it> wrote:
>
> I just tried to upgrade and test the linux kernel going from the 5.12 kernel series to 5.13-rc6 on my homeserver with Xen, but ran in some trouble.
>
> Some VM's boot fine (with more than 256MB memory assigned), but the smaller (memory wise) PVH ones crash during kernel boot due to OOM.
> Booting VM's with 5.12(.9) kernel still works fine, also when dom0 is running 5.13-rc6 (but it has more memory assigned, so that is not unexpected).

Adding Rasmus to the cc, because this looks kind of like the async
roofs population thing that caused some other oom issues too.

Rasmus? Original report here:

   https://lore.kernel.org/lkml/ee8bf04c-6e55-1d9b-7bdb-25e6108e8e1e@eikelenboom.it/

I do find it odd that we'd be running out of memory so early..

        Linus


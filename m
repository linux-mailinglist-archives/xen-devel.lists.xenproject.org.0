Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E88A2DF7F1
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 04:06:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57261.100167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krBVI-0002dN-36; Mon, 21 Dec 2020 03:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57261.100167; Mon, 21 Dec 2020 03:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krBVH-0002d5-QS; Mon, 21 Dec 2020 03:04:55 +0000
Received: by outflank-mailman (input) for mailman id 57261;
 Mon, 21 Dec 2020 03:04:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AzP2=FZ=gmail.com=kevin.buckley.ecs.vuw.ac.nz@srs-us1.protection.inumbo.net>)
 id 1krBVG-0002d0-TJ
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 03:04:54 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff476e8f-aef1-46b0-abf8-7355d1fe1bba;
 Mon, 21 Dec 2020 03:04:53 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id i9so9546810wrc.4
 for <xen-devel@lists.xenproject.org>; Sun, 20 Dec 2020 19:04:53 -0800 (PST)
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
X-Inumbo-ID: ff476e8f-aef1-46b0-abf8-7355d1fe1bba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=nwx2mUO40C+7qjRtFbvvWHuOupNKcHjJrQkqcUPlN9E=;
        b=TAzHn5bldj1nVZWXd0uD6LvnDPeIW1rpoZTanLDw29b+thlusA93aiCTCL9QUz2rF8
         37F3RvCbZFfjttnmwMOsfJBBn8np51lDhdWyNElcdNa8Zaes1SFhHU1/EBHDiDCBByhp
         nm0cmhNMTYdwHILgPdi61qmI2WyeHj+z9a5iyP9krHWB3Yj81+cD18vaYPB8IjO0HYTl
         INOebF/3Ou4KUmKt76hEV2Lf+aqFnt1IA5cHlHNbwM354mG7eNG4aCo0qQhqtTLLVWsx
         hoB+i1Uo22AwX4zuei1U3+7oCtRcPU9Kdv2kMx4odJz4v4Oq0hQtMX7nGGG9wMIm50Ky
         dHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=nwx2mUO40C+7qjRtFbvvWHuOupNKcHjJrQkqcUPlN9E=;
        b=iDeKRsSCNJqxZ7wfQizBHiXGbyThUqMwc+a3rJ8QUYf/Uu/4eTDoMMPqT7ccnTFdxx
         1giIYx+b+SFg5HWUPcEkBXWEGHVZ7T4Li8lRyxGRcBv428ZYWP+pMINvCxDNKXyoTY9o
         cR3xSStwsQzOV5XTpgOWXDxmc/vjB0Vr0b6ln+ndnOanMkD4pypNNzDY3+TB4eOa4SZD
         4ejPlt2bKjZyMLJq+lVwGhLZpequA8+NI3CObOxe9Qjt4BrYVShGc9Vna30ttnLH3JeM
         TAwBeQQ0G8mERdphvXnF7Wk3Q0G5S3+78PAn5zi3ivQ6dDcUXu6gPzQH//oUjkMpfUXy
         9ZCA==
X-Gm-Message-State: AOAM530nR5GDwo16x7n29EtIWrpTXrAI92bHjOFizAz1SIRWUEFdx3jN
	Br3+wB90zUhPMnWz5sOloKE+qedxZUS0PU8iBEZJFEOWsEwfDQ==
X-Google-Smtp-Source: ABdhPJwrKCLYjmrB+VOzoyk0Idg/4QvUG1nw5Xvs2jBbiQMXOCym5fyuv1nIYMnWhNi7eMZVANt3d0ZPlR880S9jxpY=
X-Received: by 2002:adf:e443:: with SMTP id t3mr16118884wrm.366.1608519892747;
 Sun, 20 Dec 2020 19:04:52 -0800 (PST)
MIME-Version: 1.0
References: <CABwOO=dLaL-BLf+GDo71_Btq1R8L5=XmofSs+oHE+P-qx+M49A@mail.gmail.com>
In-Reply-To: <CABwOO=dLaL-BLf+GDo71_Btq1R8L5=XmofSs+oHE+P-qx+M49A@mail.gmail.com>
From: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Date: Mon, 21 Dec 2020 11:04:41 +0800
Message-ID: <CABwOO=c8FYYYEPc5VCiDAyF-PG++2OQbNhv7sKPkWJ9X1gO34Q@mail.gmail.com>
Subject: Re: Xen Release 4.14.0: Couple of "all warnings being treated as
 errors" issues and ongoing docs/man issue in make world
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 20 Dec 2020 at 10:54, Kevin Buckley
<kevin.buckley.ecs.vuw.ac.nz@gmail.com> wrote:
>
> Looking to build 4.14.0 on an LFS 10.0 system, so with GCC 10.2.0.
>
> The "all warnings being treated as errors" I'm sure, will have been
> picked up by now, but the issue with the man pages is something
> I have been seeing for a while now.
>
> ...
> After that point, the build gets as far as
>
> make[2]: Leaving directory '/usr/src/xen/xen-4.14.0/tools'
> make -C docs install
> make[2]: Entering directory '/usr/src/xen/xen-4.14.0/docs'
> /usr/bin/pod2man --release=4.14.0 --name=xenhypfs -s 1 -c "Xen"
> man/xenhypfs.1.pod man1/xenhypfs.1
> Can't write-open man1/xenhypfs.1: No such file or directory at
> /usr/bin/pod2man line 69.
> make[2]: *** [Makefile:176: man1/xenhypfs.1] Error 2
> make[2]: Leaving directory '/usr/src/xen/xen-4.14.0/docs'
> make[1]: *** [Makefile:153: install-docs] Error 2
> make[1]: Leaving directory '/usr/src/xen/xen-4.14.0'
> make: *** [Makefile:170: world] Error 2
>
> and this is the interesting bit.
>
> Firstly, nothing that the make ins being run from the top-level
> docs directory, looking at
>
> pkg xen:xen-4.14.0> ls docs/
> INDEX            configure.ac       man/
> Makefile         designs/           misc/
> README.colo      features/          parse-support-md*
> README.remus     figs/              process/
> README.source    gen-html-index     specs/
> admin-guide/     glossary.rst       support-matrix-generate*
> conf.py          guest-guide/       xen-headers*
> config.status*   hypervisor-guide/
> configure*       index.rst
>
>
> shows that there isn't a man1 subdir within the source tree?

Please ignore the above issue with the man pages.

This has turned out to be a problem at my end, resulting from a
wrapper around the "install" utility that has been failing silently
for years.

Bugger!


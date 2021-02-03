Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4802B30E3CB
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 21:07:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81048.149010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7OQj-0008WG-Vx; Wed, 03 Feb 2021 20:07:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81048.149010; Wed, 03 Feb 2021 20:07:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7OQj-0008Vv-Sd; Wed, 03 Feb 2021 20:07:13 +0000
Received: by outflank-mailman (input) for mailman id 81048;
 Wed, 03 Feb 2021 20:07:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nuD1=HF=linuxfoundation.org=torvalds@srs-us1.protection.inumbo.net>)
 id 1l7OQi-0008VX-0S
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 20:07:12 +0000
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d5ebe7d-8693-4de2-b060-390a9d736581;
 Wed, 03 Feb 2021 20:07:11 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id a8so984478lfi.8
 for <xen-devel@lists.xenproject.org>; Wed, 03 Feb 2021 12:07:11 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48])
 by smtp.gmail.com with ESMTPSA id c9sm357961ljk.130.2021.02.03.12.07.08
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 12:07:08 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id d3so962664lfg.10
 for <xen-devel@lists.xenproject.org>; Wed, 03 Feb 2021 12:07:08 -0800 (PST)
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
X-Inumbo-ID: 0d5ebe7d-8693-4de2-b060-390a9d736581
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kpfh9SxqhbXVAvduWXLkt3nG5WWOIvz3WkEIu4NNz7c=;
        b=O9vxx80gl/k9keknQ6fiZPXocJOOncAcdeIZ6akawRcVRBFNzF5hhkdAGj3EKxTDVO
         0tXEKP9WD5HDHhwvfLBaLBjdXeGl1DsU5Pi/lyCQ2ckXXfJb/LYkljHjpjOKECkyDWdg
         3Go0y3vjTAMTEfVdFupLN71dukSnZnXC92wMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kpfh9SxqhbXVAvduWXLkt3nG5WWOIvz3WkEIu4NNz7c=;
        b=ct6sXJw1Ux8TcZBjOOwjjOTRPs+63bLPw0gUIygi8b940K0P9g7ChRDOpSxUiNgP8S
         Bh/IRLYbdhqSbKrzUsihbEVEYswEkHTnYovZu1+9edXb1pjMpsgC4EqQ3aBe1Yj8GsK1
         RJzdcFG6Xf/1sJoZZnXnG8B3SSIwT8BDvinagEv6f2hnr7tkUe8zEFVNPWGNwS76oGL4
         2Wws8WNa5YCQun1GWTmbQJTMY9LxIyfp4wTiOYkBzPLU9y90fPdf738VwjH170VkHbha
         a0KzWqLJnM2e2lFkdV95z8coRGYPKRkxGxspkZrj85dQlPxHjPm7uYfkKxucXFlHGI2U
         PZEQ==
X-Gm-Message-State: AOAM5321JyVOGdDmsa3xE+bMPVmVKnXmKYEErmyOQ5uAYWOuhALnkuwD
	FCKp0lR78nEavaFiHDIsQ+Zt+tfT9QZ4Gw==
X-Google-Smtp-Source: ABdhPJzGMVr+Z8LSgxgfvQaDmIC06doQ+30XqakYuconezfOfNK3a/iobo/yl3PYEafyUQ8eDuvWdQ==
X-Received: by 2002:a19:8156:: with SMTP id c83mr2688027lfd.546.1612382829590;
        Wed, 03 Feb 2021 12:07:09 -0800 (PST)
X-Received: by 2002:ac2:4436:: with SMTP id w22mr2548053lfl.41.1612382828438;
 Wed, 03 Feb 2021 12:07:08 -0800 (PST)
MIME-Version: 1.0
References: <8a358ee4-56bc-8e64-3176-88fd0d66176f@linuxfoundation.org>
In-Reply-To: <8a358ee4-56bc-8e64-3176-88fd0d66176f@linuxfoundation.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 3 Feb 2021 12:06:52 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg983RfAiSSo4zLMADEfzLEuoBi+rye30Zrq7Bor8zg_Q@mail.gmail.com>
Message-ID: <CAHk-=wg983RfAiSSo4zLMADEfzLEuoBi+rye30Zrq7Bor8zg_Q@mail.gmail.com>
Subject: Re: Linux 5.11-rc6 compile error
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 3, 2021 at 11:58 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> ld: arch/x86/built-in.a: member arch/x86/kernel/pci-swiotlb.o in archive
> is not an object
> make: *** [Makefile:1170: vmlinux] Error 1

That honestly sounds like something went wrong earlier - things like
doing a system upgrade in the middle of the build, or perhaps running
out of disk space or similar.

I've not seen any other reports of the same, and google doesn't find
anything like that either.

Does it keep happening if you do a "git clean -dqfx" to make sure you
have no old corrupt object files sound and re-do the whole build?

            Linus


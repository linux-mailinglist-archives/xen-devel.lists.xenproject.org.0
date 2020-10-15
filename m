Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA67A28F6F4
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:39:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7566.19893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6HY-00046M-9a; Thu, 15 Oct 2020 16:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7566.19893; Thu, 15 Oct 2020 16:39:12 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6HY-00045x-6G; Thu, 15 Oct 2020 16:39:12 +0000
Received: by outflank-mailman (input) for mailman id 7566;
 Thu, 15 Oct 2020 16:39:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VKkI=DW=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1kT6HW-00045r-R8
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:39:10 +0000
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80e109db-455d-485e-896b-56324b9a02b6;
 Thu, 15 Oct 2020 16:39:10 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id d3so4453774wma.4
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:39:10 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VKkI=DW=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
	id 1kT6HW-00045r-R8
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:39:10 +0000
X-Inumbo-ID: 80e109db-455d-485e-896b-56324b9a02b6
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 80e109db-455d-485e-896b-56324b9a02b6;
	Thu, 15 Oct 2020 16:39:10 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id d3so4453774wma.4
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4t3gw4yWmAQOQyd6UUTc0220EM21Rw8nlfAG9nvqlYk=;
        b=bvxmMSh9hdYzR5Aai56AVw9UTe98y68mbRJMHnMNLxpagXf7jNetayLprkr9u3aoLw
         mTgInE8Yz/DERCDve3upRRQpxjv0058NrIBd+ILJvR4KAPc1XLH8/8m6Gn02Sq9XDbBg
         HISI3+7vFYpCiyL0Uz8gaU9F7EssFKTlKP/jEo3/lnk2t7WA2+7h70P23hl/Go/g4jKt
         a7YyVV8bjqzLR6b7Y6c/mFYzx/dykfXA9RSFuPnIbnQVQbIiZ7Z0DOzmS7Wis85Eec1d
         ELv2+xSjCv3OflZ9CVajGZm1AqK5e/XjEpcRwMQ0IXyUXEEbty9sFP9S0JDwvuBmNk6x
         Kakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4t3gw4yWmAQOQyd6UUTc0220EM21Rw8nlfAG9nvqlYk=;
        b=ayZNxeTpScOlF6wP3f19aGiZxXso0Lr0OP8DmlGRbR18ih9DYKZk2PW72DfH5BFKFR
         4ngPuH84V7ywMhMdzM4EYWoi8YHf5SD3gMxZ5R3Is3Y6zgHNv9zR4MOK72tvm7jFJwLS
         gV5BAWWPAEyiSBlwvU/4JbjhKXKy+mFxuBb+fSd+GdrOKEF2VYwmbZpONfhnDwC9Vk/C
         CM4wjBWrjFDP+hQNPGIYrqtlkk7/VwEe+/PLYcg+qEE4LoX9apoXgaJetLL0dd2VCAWV
         rn6H3xvONcRC6Hj+1OPPkkrswREpYUbkMcUxO9+c2imvV2dvuM037e7xVbl1C+hWmBFv
         Z3YA==
X-Gm-Message-State: AOAM5302T8v9F2KWCmq8RBtTdFhgScc5AWixgxaoSPS0HNCSjDD9G6uA
	QDGnT6gZWNZkWrSUSaIhZ0L1Z4JxXoD5+OzhwrE=
X-Google-Smtp-Source: ABdhPJx5MLKwCgbdSGo9DPo2IbDvS7j6x2uRxd46dPkJThVy3wsb/cRbLucl0ZdGavyJb23nk5v5sYWMFwecz0ziIqc=
X-Received: by 2002:a1c:32c6:: with SMTP id y189mr5145549wmy.51.1602779949175;
 Thu, 15 Oct 2020 09:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAKf6xpv-LRCuo-qHHWMuukYtvJiR-i+-YhLUOZeqoAFd-=swEQ@mail.gmail.com>
 <1a3b90f4-564e-84d3-fd6a-3454e8753579@citrix.com> <20201015113109.GA68032@Air-de-Roger>
 <CAKf6xpsJYT7VCeaf6TxPNK1QD+3U9E8ST7E+mWtfDjw0k9L9dA@mail.gmail.com>
In-Reply-To: <CAKf6xpsJYT7VCeaf6TxPNK1QD+3U9E8ST7E+mWtfDjw0k9L9dA@mail.gmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 15 Oct 2020 12:38:33 -0400
Message-ID: <CABfawhnwdkB01LKYbcNhyyhFXF2LbLFFmeN5kqh7VaYPevjzuw@mail.gmail.com>
Subject: Re: i915 dma faults on Xen
To: Jason Andryuk <jandryuk@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

> > Can you paste the memory map as printed by Xen when booting, and what
> > command line are you using to boot Xen.
>
> So this is OpenXT, and it's booting EFI -> xen -> tboot -> xen

Unrelated comment: since tboot now has a PE build
(http://hg.code.sf.net/p/tboot/code/rev/5c68f0963a78) I think it would
be time for OpenXT to drop the weird efi->xen->tboot->xen flow and
just do efi->tboot->xen. Only reason we did efi->xen->tboot was
because tboot didn't have a PE build at the time. It's a very hackish
solution that's no longer needed.

Tamas


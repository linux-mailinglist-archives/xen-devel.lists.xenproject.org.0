Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA2B2EC593
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 22:18:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62696.111145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxGCM-0007Lu-5p; Wed, 06 Jan 2021 21:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62696.111145; Wed, 06 Jan 2021 21:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxGCM-0007LV-2S; Wed, 06 Jan 2021 21:18:30 +0000
Received: by outflank-mailman (input) for mailman id 62696;
 Wed, 06 Jan 2021 21:18:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4R3a=GJ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kxGCJ-0007LQ-Qv
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 21:18:27 +0000
Received: from mail-wm1-f48.google.com (unknown [209.85.128.48])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 822922d4-6303-4bdf-bfc6-aa8c9edb6545;
 Wed, 06 Jan 2021 21:18:27 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id a6so3522294wmc.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jan 2021 13:18:27 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id w8sm4441178wrl.91.2021.01.06.13.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 13:18:25 -0800 (PST)
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
X-Inumbo-ID: 822922d4-6303-4bdf-bfc6-aa8c9edb6545
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vR0nrfBoxKYCkIDqP1X65lnvm+UZzYiScDsQj14aRTA=;
        b=a8ifJXCFXl7dNjunIzmznLB+fVhwtZFOjNOByPHYp52uNLuqLyDb0gzHl1inCykPQS
         U2+CMJb+kt9bHmbQsleCJm6TIqsThU9iXI2WurCGy3TjVzFL+4cdzoHTYqmAT+1llkd6
         N7n26a+cBdkyekTZjSm3X5nltcoCedanocK9kmRDavs1YGUncXdTZFC4g3gQlCEXTrDh
         dn5ADONZ2LoV84ldz4Vzr4TN1+IBw5I6Knbri9b1XC4IWO6QvOFgi14Yo6Nn29ARdTh/
         mgutNg3TvscRQS7OFk5+8fswbMZbLn4GQs7zhtrP1MjcYm4xlxtN67QqrOMIugyDvFWK
         geQg==
X-Gm-Message-State: AOAM533cfD3GLT11fiLH9QgoVimIVkxu09ZfwHYe7i8M9nGYGSn/UTxL
	+X+Sx7+VmO1xwI+34UmG27s=
X-Google-Smtp-Source: ABdhPJy9Sv9XTmGW3Hyx1leiimX6hdwt6Va1qI6Xy48K6b7dmZssBqYPkKlfPVnF8AfH5p+aJHTl6A==
X-Received: by 2002:a7b:c35a:: with SMTP id l26mr5137131wmj.182.1609967906225;
        Wed, 06 Jan 2021 13:18:26 -0800 (PST)
Date: Wed, 6 Jan 2021 21:18:24 +0000
From: Wei Liu <wl@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, cardoe@cardoe.com, wl@xen.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/3] automation: build qemu-system-aarch64 and use it for
 tests
Message-ID: <20210106211824.5e6hx3ms5a6xhy6o@liuwe-devbox-debian-v2>
References: <alpine.DEB.2.21.2101051452480.4307@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2101051452480.4307@sstabellini-ThinkPad-T480s>
User-Agent: NeoMutt/20180716

On Tue, Jan 05, 2021 at 02:58:38PM -0800, Stefano Stabellini wrote:
> Hi all,
> 
> Currently we are using Debian's qemu-system-aarch64 for our tests.
> However, sometimes it crashes. See for instance
> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/939556527. It
> is hard to debug and even harder to apply any fixes to it.
> 
> Instead, build our own QEMU as one of our test-artifacts, which are only
> built once, then imported into each pipeline via phony jobs. Use the
> provided qemu-system-aarch64 binary for our arm64 tests.
> 
> 
> Stefano Stabellini (3):
>       automation: add qemu-system-aarch64 to test-artifacts
>       automation: add a job to import qemu-system-aarch64 into the pipeline
>       automation: use test-artifacts/qemu-system-aarch64 instead of Debian's

Acked-by: Wei Liu <wl@xen.org>

I do wonder if there is a way to not build QEMU during every pipeline
run though...


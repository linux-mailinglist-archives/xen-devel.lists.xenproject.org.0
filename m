Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4693264C7
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 16:33:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90411.171139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFf7E-0001ij-9x; Fri, 26 Feb 2021 15:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90411.171139; Fri, 26 Feb 2021 15:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFf7E-0001iL-5x; Fri, 26 Feb 2021 15:33:16 +0000
Received: by outflank-mailman (input) for mailman id 90411;
 Fri, 26 Feb 2021 15:33:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ro2M=H4=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1lFf7C-0001iG-Lz
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 15:33:14 +0000
Received: from mail-pl1-x62b.google.com (unknown [2607:f8b0:4864:20::62b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c8ab0b9-3fa0-49c8-9e6d-934efea98b8a;
 Fri, 26 Feb 2021 15:33:13 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id a24so5466551plm.11
 for <xen-devel@lists.xenproject.org>; Fri, 26 Feb 2021 07:33:13 -0800 (PST)
Received: from ?IPv6:2601:1c2:4f80:d230::5? ([2601:1c2:4f80:d230::5])
 by smtp.gmail.com with ESMTPSA id v129sm9955277pfc.110.2021.02.26.07.33.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 07:33:11 -0800 (PST)
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
X-Inumbo-ID: 7c8ab0b9-3fa0-49c8-9e6d-934efea98b8a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Kdw3Sjv+WXzbm/SAcdz2KeQ0wofI8c3b0xhYkexR8PM=;
        b=Pogd6tvRaDBWAjFxqTsWv4pxN5mC26G7WTyBMWjoH5vyzg7WCxLe5k4jC4m2lSEUAl
         7aPLoxdTllnmop78hTvyzZxfRZFCzM2AahO/55MTyRn27x69uYue3l/PXECOF93mJsjl
         11CD/h/WvpU2iLQIRHbF5wj2UHyIK377HarrqxU4cQ1gZ3h1M/AjMQml1R6JHSSXQO8W
         lrE/ZGOrL1ZDm4jeBjp88/geCwVaDGvOjPeHgcTke08GnI9NV9pFUCQ/0kMbBUjX2egZ
         w5eaB6W+V4jN3NeheCAK9suM5QhVtx6Ie5kOP+hEc65MhcNQurs9GTuHeOBvz6F7tgNc
         RasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Kdw3Sjv+WXzbm/SAcdz2KeQ0wofI8c3b0xhYkexR8PM=;
        b=LAkrfUZ9sEBFbhNUG0T/jtaFvvWPCsGuWHaddieM6Ka9fGI0PboESp62nY+Tf+BM8d
         xmYVaV/5+iZrj9Wu4OHeqVrYE8TaWX+M40egpR2PaabzSbZVbqoyua3PBizGy9ln5y7+
         caqfsmZ6qJxre/RGjNRYA8gYG8REhiawcaOuUfz8Xuc2DMQDZAUGH5OgdQdE92+5jowT
         4oCBqaQ3hHWSZutqRwhAOM5mwfh8Rb6wKF9i48GXg/di2Xl8EsiiKYwqZb/kurXT7FGh
         /BWZFf7pBDKzsw3ys2w+766XyfYvolxpBxo81yziiBT7PNzwpcOQHbN0zz6qscz/Hvby
         X6IA==
X-Gm-Message-State: AOAM533Bv4gmjdbyWQaUTyiYkO6Bu6tGjxVykj+u9TVqyU1rIFYqBYpj
	r/BqyJG/BKwUJpINQEjAafo=
X-Google-Smtp-Source: ABdhPJyPy00Gja5UfZEBdttwHCJ/qYuf5xI7H4KJe4eyVXZV4zll+H/+sHr7dFiIMXEBXukngKd05Q==
X-Received: by 2002:a17:90b:4d05:: with SMTP id mw5mr3990126pjb.217.1614353592838;
        Fri, 26 Feb 2021 07:33:12 -0800 (PST)
Subject: Re: [PATCH for-next 5/6] xen: Add files needed for minimal riscv
 build
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <cover.1614265718.git.connojdavis@gmail.com>
 <7652ce3486c026a3a9f7d850170ea81ba8a18bdb.1614265718.git.connojdavis@gmail.com>
 <9b441529-c5a4-4299-1155-869bcdab06b0@citrix.com>
From: Bob Eshleman <bobbyeshleman@gmail.com>
Organization: Vates SAS
Message-ID: <0d58bca1-0998-1114-d023-0d8a5a193961@gmail.com>
Date: Fri, 26 Feb 2021 07:30:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <9b441529-c5a4-4299-1155-869bcdab06b0@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2/25/21 3:14 PM, Andrew Cooper wrote:
> 
> Well - this is orders of magnitude more complicated than it ought to
> be.  An empty head.S doesn't (well - shouldn't) need the overwhelming
> majority of this.
> 
> Do you know how all of this is being pulled in?  Is it from attempting
> to compile common/ by any chance?
> 
> Now is also an excellent opportunity to nuke the x86isms which have
> escaped into common code (debugger and xenoprof in particular), and
> rethink some of our common/arch split.
> 
> When it comes to header files specifically, I want to start using
> xen/arch/$ARCH/include/asm/ and retrofit this to x86 and ARM.  It has
> two important properties - first, that you don't need to symlink the
> tree to make compilation work, and second that patches touching multiple
> architectures have hunks ordered in a more logical way.
> 
> ~Andrew
> 

I think we may have envisioned different things here....  I was under
the impression that we wanted to implicate common, so that changes
there that broke the RISC-V build would present themselves on CI...
and to demonstrate which "arch_*" calls common expects to exist.

It sounds like you'd prefer no common to start and none of the
arch_* calls it relies on?


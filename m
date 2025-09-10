Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F97B523EE
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 23:59:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118844.1464497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwSpI-00068i-BH; Wed, 10 Sep 2025 21:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118844.1464497; Wed, 10 Sep 2025 21:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwSpI-00065Z-7H; Wed, 10 Sep 2025 21:58:04 +0000
Received: by outflank-mailman (input) for mailman id 1118844;
 Wed, 10 Sep 2025 21:58:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kMwI=3V=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uwSpH-00065S-7T
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 21:58:03 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37ea44c2-8e91-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 23:58:01 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45df0cde41bso448055e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 14:58:01 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7521c9a2esm9136460f8f.14.2025.09.10.14.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 14:57:59 -0700 (PDT)
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
X-Inumbo-ID: 37ea44c2-8e91-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757541480; x=1758146280; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gMcZ5/Z8eru/CYsg9zyRNPxYeOwt+OeYK1yBmcLCv4s=;
        b=LwzIz4R6ZLuEOsS93163GcDx8nHaqR+BwyQ6SL833nvCrT8Yjr/jj1u87BtFa9przU
         +iRw2iQTeLP311qYIdvf5B0U+4vFBOPofE8Ef829lccoAYg5ud5uu4e+NuTfARUv600G
         R7Ufy5F+LhoPOTcKVfF7kA287WeQdJMV8CRKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757541480; x=1758146280;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMcZ5/Z8eru/CYsg9zyRNPxYeOwt+OeYK1yBmcLCv4s=;
        b=HbkJJnKvNKVq5Bd8ETHMzlE2dNfPCtV+g/Lf9b9v7yc3WUFGqTjU3GVgnE4KNY7d3D
         pEE0Jh6/oBM+GV/O7nJCDtMYQvxzduxWnF0vEc3a26HRS5yegzDdgVh1tw1CpZ7JzW+k
         y+b4dkwj1V1O0Wrg/qgWmKmnI3iuvD+IuFIva6o2WuevO6Up8LBpFxcAffTdPbJ5JPYZ
         qg6Lswo4T/4Fd8cP4Nuj3ArFRHtQwsrD8tV7y5WuTbi9hoHEfiZtoFLcS9FQE/L7qumj
         id4bmgRomA0G/PoaUfZb9+C6Z2DhUeseO8PQnQSBl2aDhut/PKUh4MbVPga15SkUi3D9
         z9ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLa3NnHYlGHfeqEvYjq2pQZOtTq9v302LPEgYl1l+ec+vbq06Mk7+zgjo9ql2Z6QX3XukFy/eKQn4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNa0fopqdErVvwnOpcKbsrOjLgLDehkiibcHHU+8ZGq88pay7I
	y2X9wVgqdAQ1HYkoOCOYvXfbEjh2iXD8vwP7DeA1xgJn+aaW3lv+cXuT5p9Et1r8fNc=
X-Gm-Gg: ASbGncvdFzPNUASN88pIlD0Or4zjuBg1nXiaMRSpPZbEvp2ZkSvxg0TtKfU9XsyEvzQ
	VivzxHKjfTl7jfGm3zwherL4mT/wrFZvuc+oq9CUBUMOO2UYPB6Ujgpvp9s04J0wyIbfm8sAySY
	co2/fUU35NRBe+NuHj4MdGSgDCS0qwz7S97WyHIRmIKzq+cxDiscRf8zRq26B1Slg4t7zXUpSNX
	RqH/5vtCGsjNt0oZydHZmAXmDwfvuR12ClCOJVByHo/zRIcDe1D/GkNudGOqc/Yu3Cj2pOnbPld
	MymBCiUfl3Opp7Tmxshwyc+IX7+83B/tdmruQaGUAsyObYCsJ2tWW9gcVk5ViLWUcWsGWKsmKUY
	uy+n8OPDD/vhjUL/uOkLl7uln2JhQUu/hsRJGqOjM2kbkDhIjm+qMeyAFXDnU+4F+IgPn
X-Google-Smtp-Source: AGHT+IFQCJGdRhWzE+OAbnCcJ0g0+6rJ7r01ntPR+RRqL/jUtSvV5WSRQYST35o+xHknpjs8D86iUA==
X-Received: by 2002:a05:600c:198a:b0:456:13b6:4b18 with SMTP id 5b1f17b1804b1-45dddedd746mr166251105e9.31.1757541480256;
        Wed, 10 Sep 2025 14:58:00 -0700 (PDT)
Message-ID: <d81b0c13-853e-479a-ad11-9b9990b723a3@citrix.com>
Date: Wed, 10 Sep 2025 22:57:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: domU reboot claim failed
To: Jason Andryuk <jason.andryuk@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <fae4b58f-c6ff-4db1-8198-1a5f76868d4d@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <fae4b58f-c6ff-4db1-8198-1a5f76868d4d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/09/2025 7:58 pm, Jason Andryuk wrote:
> Hi,
>
> We're running Android as a guest and it's running the Compatibility
> Test Suite.  During the CTS, the Android domU is rebooted multiple times.
>
> In the middle of the CTS, we've seen reboot fail.  xl -vvv shows:
> domainbuilder: detail: Could not allocate memory for HVM guest as we
> cannot claim memory!
> xc: error: panic: xg_dom_boot.c:119: xc_dom_boot_mem_init: can't
> allocate low memory for domain: Out of memory
> libxl: error: libxl_dom.c:581:libxl__build_dom: xc_dom_boot_mem_init
> failed: Cannot allocate memory
> domainbuilder: detail: xc_dom_release: called
>
> So the claim failed.  The system has enough memory since we're just
> rebooting the same VM.  As a work around, I added sleep(1) + retry,
> which works.
>
> The curious part is the memory allocation.  For d2 to d5, we have:
> domainbuilder: detail: range: start=0x0 end=0xf0000000
> domainbuilder: detail: range: start=0x100000000 end=0x1af000000
> xc: detail: PHYSICAL MEMORY ALLOCATION:
> xc: detail:   4KB PAGES: 0x0000000000000000
> xc: detail:   2MB PAGES: 0x00000000000006f8
> xc: detail:   1GB PAGES: 0x0000000000000003
>
> But when we have to retry the claim for d6, there are no 1GB pages used:
> domainbuilder: detail: range: start=0x0 end=0xf0000000
> domainbuilder: detail: range: start=0x100000000 end=0x1af000000
> domainbuilder: detail: HVM claim failed! attempt 0
> xc: detail: PHYSICAL MEMORY ALLOCATION:
> xc: detail:   4KB PAGES: 0x0000000000002800
> xc: detail:   2MB PAGES: 0x0000000000000ce4
> xc: detail:   1GB PAGES: 0x0000000000000000
>
> But subsequent reboots for d7 and d8 go back to using 1GB pages.
>
> Does the change in memory allocation stick out to anyone?
>
> Unfortunately, I don't have insight into what the failing test is doing.
>
> Xen doesn't seem set up to track the claim across reboot.  Retrying
> the claim works in our scenario since we have a controlled configuration.

This looks to me like a known phenomenon.  Ages back, a change was made
in how Xen scrubs memory, from being synchronous in domain_kill(), to
being asynchronous in the idle loop.

The consequence being that, on an idle system, you can shutdown and
reboot the domain faster, but on a busy system you end up trying to
allocate the new domain while memory from the old domain is still dirty.

It is a classic example of a false optimisation, which looks great on an
idle system only because the idle CPUs are swallowing the work.

This impacts the ability to find a 1G aligned block of free memory to
allocate a superpage with, and by the sounds of it, claims (which
predate this behaviour change) aren't aware of the "to be scrubbed"
queue and fail instead.

I thought OpenXT had a revert of this.  IIRC it was considered a
material regression in being able to know when a domain has gone away.

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2008CAB3A4F
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 16:20:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981530.1367929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEU0o-000579-TE; Mon, 12 May 2025 14:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981530.1367929; Mon, 12 May 2025 14:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEU0o-00054h-Pi; Mon, 12 May 2025 14:20:10 +0000
Received: by outflank-mailman (input) for mailman id 981530;
 Mon, 12 May 2025 14:20:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zSlO=X4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uEU0n-00054b-GQ
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 14:20:09 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33bf10fd-2f3c-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 16:20:07 +0200 (CEST)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-7426c44e014so829096b3a.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 07:20:07 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-742377610a7sm6054992b3a.84.2025.05.12.07.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 07:20:04 -0700 (PDT)
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
X-Inumbo-ID: 33bf10fd-2f3c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747059605; x=1747664405; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bn8IEfgic51WP+0k51mBI9b7UOmqTdbdkAuOzjnGVkc=;
        b=MbyydqVpShniGWlP4Z/gXqc4+3IKughx5fmKQ+UbmslOxOgSDYnHHS3k8Y+TjVNYo4
         IhRjN/ahxIQdwFY8rW76/9bt1+ylq34zCIq12ZcbNMrHzlixbAot3+8zv5TwY7/v37bB
         T3BeA3SMOxHP0e2fIBPU7ZZbCBBQpuHpQDsIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059605; x=1747664405;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bn8IEfgic51WP+0k51mBI9b7UOmqTdbdkAuOzjnGVkc=;
        b=rFFn7REnqy3eupXoR1HJcnccBwIno6Yzlp1fv4v3EfmTwyK5NlHQY6zZriZ0aZ8u3B
         nmPc+B7OlIBI8qW8YET0aXbRd2fABtBmPFJw1X6rdYlppBtdD4ccp7zjK6jlAYQjKOuX
         /dc3UHdhtftKW9ynkuR6DeMOtsL+3BpfY5I9O0tz0Izxo2iSWErNZyPR4ug5u09pCOJo
         Rpr7FrVwCOqFsWvnc4UxqgYhtE+o59Y1Xyj+N/74uIBZvJRYFb1y/ZRsgnugZ5x3j6X6
         ebKGscfdyd5OYxK7wASZHpT9YXG5BYZ22enItcmpoN6iM5KorT9pV2mGB0sr0iWAM3Bq
         XZNg==
X-Gm-Message-State: AOJu0Yyo43pCHLR6PphRiEVTUFEmyeS6kMcgG676D2vioirmU4V/Ons4
	ezO+b07dxJTQtf85UJMRa6+mVGheSUlbq1BqfwiPXQ4IbXfpB9XeRfB754TRACU=
X-Gm-Gg: ASbGncva7GFAQQOjDplUFw2xRk7RECV5Ohu01dF2foTSsUxUvhh+cZQzUIAbdci8dXE
	lRtjn4bYIJYrz/Z6/RxZa6AEc2xBn2flpm58pGy1i8yqz9qKORHq4Aes0le5a/rwia2RJa+kZi3
	SX42tOtUv1520nTDO24gKD95edApCVN63f98FqM09I6eDTmeuhzY93hiMN09MIjhn5BuJcjyndj
	RE0FaljHSknjLo7ToAx2uP7lFNUxxhNlk7ZDQRv02D+Bs/I6IZQj6a/UNbQKxHZreHq+l1NnRxh
	qeRql5krwv8sucWueYpIbQJ0rn3XIhE7vCUOslohzeWttweAP9qltRI/
X-Google-Smtp-Source: AGHT+IEfnY1+wLmw/GCrFhIhgcGUoMjTdTbCu4G6P5PWxINX4XUojfai4QMD2pAtwfza5ECo1HzVXg==
X-Received: by 2002:a05:6a00:190f:b0:736:a6e0:e66d with SMTP id d2e1a72fcca58-7423bc58f29mr17474916b3a.6.1747059605148;
        Mon, 12 May 2025 07:20:05 -0700 (PDT)
Date: Mon, 12 May 2025 16:19:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Issues on Zen4 (hw12) runner
Message-ID: <aCIDj_8tDcjR1nUS@macbook.lan>
References: <aB0XtEor2rCxBKWR@mail-itl>
 <aCHMwWd7cq-ZIMOl@macbook.lan>
 <aCH4MnNQ7IzhJfkl@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCH4MnNQ7IzhJfkl@mail-itl>

On Mon, May 12, 2025 at 03:31:19PM +0200, Marek Marczykowski-Górecki wrote:
> On Mon, May 12, 2025 at 12:26:09PM +0200, Roger Pau Monné wrote:
> > On Thu, May 08, 2025 at 10:44:36PM +0200, Marek Marczykowski-Górecki wrote:
> > > Hi,
> > > 
> > > I wanted to post another revision of the series adding hw12 runner,
> > > hoping that all known issues are fixed now, but unfortunately there is
> > > still something broken. I've rebased my series on top of staging
> > > (ed9488a0d) and got this pipeline:
> > > 
> > > https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1807819142
> > > (note due to some added debugging, some tests are incorrectly marked as
> > > success even if they failed...)
> > > 
> > > 1. USB ethernet doesn't work on PVH dom0: https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9978694739
> > > There supposed to be an USB ethernet device connected to the USB
> > > controller at c3:00.4. In the PV dom0 case it's detected as:
> > > 
> > >     [    3.911555] usb 7-1.4: new high-speed USB device number 3 using xhci_hcd
> > >     [    4.004201] usb 7-1.4: New USB device found, idVendor=0bda, idProduct=8153, bcdDevice=30.00
> > >     [    4.004675] usb 7-1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=6
> > >     [    4.005079] usb 7-1.4: Product: USB 10/100/1000 LAN
> > >     [    4.005349] usb 7-1.4: Manufacturer: Realtek
> > >     [    4.005599] usb 7-1.4: SerialNumber: 684D35
> > > 
> > > But it's not there on PVH. The USB controller itself is detected, just
> > > not device(s) connected to it. This applies to other controllers too
> > > (there should be about 3 or 4 other USB devices - none of them show up).
> > > 
> > > 2. There is a bunch of "unhandled memory read" errors during PVH dom0
> > > startup: https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9978694739
> > > 
> > >     (XEN) [    4.026323] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory read from 0xfedc0020 size 1
> > >     (XEN) [    4.026789] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory read from 0xfedc0021 size 1
> > >     (XEN) [    4.027247] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory read from 0xfedc0020 size 1
> > >     (XEN) [    4.027671] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory read from 0xfedc0021 size 1
> > >     ...
> > > 
> > > This repeats several times. Could be related to the USB issue above?
> > 
> > Can you try with dom0=pf-fixup?  Those unhandled accesses might be the
> > cause of the USB issues.
> 
> It did got rid of those messages, but USB still doesn't work:
> https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/10006580289

Hm, is it possible that the usage of console=xhci is interfering with
USB devices?  Could you try to boot without console=xhci and see if
you can still reproduce the issue?  You will need the physical device
by your side, which I'm not sure it's possible.  Don't know if you
host those remotely somewhere.

> > > There is also, likely related:
> > > 
> > >     (XEN) [    5.002036] arch/x86/hvm/vmsi.c:845:d0v9 0000:c1:00.1: PIRQ 2484: unsupported address 0
> > >     (XEN) [    5.002365] arch/x86/hvm/vmsi.c:845:d0v9 0000:c1:00.1: PIRQ 2484: unsupported address 0
> > >     (XEN) [    5.002693] arch/x86/hvm/vmsi.c:845:d0v9 0000:c1:00.1: PIRQ 2484: unsupported address 0
> > 
> > Is this at shutdown? (doesn't look like by the timestamps).  There are
> > cases where Linux zeroes the MSR entries while the capability is still
> > enabled, and that results in those messages.  They are usually benign.
> 
> That's not shutdown. But also it's a different device than I care the
> most, so I guess I can ignore it for now.

Even if you see those messages the device might work OK - it's just
that at some point Linux has set the MSI address field as 0.  Xen
won't print anything when the address is switched from 0 (invalid) to
a valid value.

Thanks, Roger.


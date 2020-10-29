Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D746829F6F8
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 22:35:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15064.37711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYFZn-0005Uh-TJ; Thu, 29 Oct 2020 21:35:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15064.37711; Thu, 29 Oct 2020 21:35:19 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYFZn-0005UH-Pl; Thu, 29 Oct 2020 21:35:19 +0000
Received: by outflank-mailman (input) for mailman id 15064;
 Thu, 29 Oct 2020 21:35:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFbr=EE=gmail.com=niveditas98@srs-us1.protection.inumbo.net>)
 id 1kYFZl-0005Sn-US
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 21:35:18 +0000
Received: from mail-io1-xd2a.google.com (unknown [2607:f8b0:4864:20::d2a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae8c061d-e4c8-4757-95d7-5ce69e755c05;
 Thu, 29 Oct 2020 21:35:16 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id y20so5310965iod.5
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 14:35:16 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
 by smtp.gmail.com with ESMTPSA id r3sm3065346iog.55.2020.10.29.14.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 14:35:15 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=iFbr=EE=gmail.com=niveditas98@srs-us1.protection.inumbo.net>)
	id 1kYFZl-0005Sn-US
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 21:35:18 +0000
X-Inumbo-ID: ae8c061d-e4c8-4757-95d7-5ce69e755c05
Received: from mail-io1-xd2a.google.com (unknown [2607:f8b0:4864:20::d2a])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ae8c061d-e4c8-4757-95d7-5ce69e755c05;
	Thu, 29 Oct 2020 21:35:16 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id y20so5310965iod.5
        for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 14:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=o/fZRhurDRoh3x2KXwZGFT2Yi8JsbQLcBDCy2LAivAY=;
        b=gGuTqV/6UjMeGtDxjXYhwQPHTl/X7tzC8nyDkopIigNmkrO3mCPbuH/1MhlZEXs368
         ilsmPmjF8/8PcamJS4tzXcIssUUJKuowmvAaZpvnATyfAuLpyzByye2ob5V27GVE8qIT
         KZP17N/xFAWoIKkVe0RuMkFayeP8BWuJYRQfihoxN9IcITuyVnsNMyFFHot0k3ChkDxn
         nFZSLwwceJfQxsoqw1O2SZk7WDZNX5WeTFIk5dkyBtO3OtvmEbw8mG/eVrbi8eoLhfOn
         0GZOx0BOnNgBQieydv87h3zVPKI0C/CSIt6VEOi3C7rjEkzw5bkznPJoY5+aGh/Uu3xA
         /g8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=o/fZRhurDRoh3x2KXwZGFT2Yi8JsbQLcBDCy2LAivAY=;
        b=tbSeA/sjjQRG8FMXsZnNz6xN23wihzTrxhUHz2gtIbzV3vG5cdAuglQoDGbD5h9T1x
         EiDvZcYVq3GCT24NOWXh2nhkrB0/sfVdURs1YTXpiZbIDtweCfbkibrmjGagNYnuQYYo
         DMtAfo+RI+xyN2nb+FqkGjsrB0UIrn0uLnyTycgqIhi+VkFUDBLdUeFQvEZ7nGWvd9W7
         HxY+FIjKtB1cEkoY4zKHalsdtW6Il7tPR+tbq0fFL6OEMyeyjiyJBi8Ii/GZA8d7PkF7
         64JqKUzKsiS/5F1MyhWPxc8X9jBBM5aNsFlJbA+FSh9TYeDfF4LjeBv1geFmKXJPPsP9
         n50g==
X-Gm-Message-State: AOAM531UCF/XMYJYG8fLvC1x7y7avh8qRxhwRbEYD0EBSEMtpQj8Oeea
	pOzXzQeLd6JaIjSJIrb7WmE=
X-Google-Smtp-Source: ABdhPJyTkgnuu9ypsiIO3xCkmwdOh4o3IIPvbsxF62gfZSdk4g2zCe1B1vFwKdXsPs4FzLAVBSR7HA==
X-Received: by 2002:a05:6602:22cf:: with SMTP id e15mr5087695ioe.1.1604007316212;
        Thu, 29 Oct 2020 14:35:16 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id r3sm3065346iog.55.2020.10.29.14.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 14:35:15 -0700 (PDT)
Sender: Arvind Sankar <niveditas98@gmail.com>
From: Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date: Thu, 29 Oct 2020 17:35:12 -0400
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Arvind Sankar <nivedita@alum.mit.edu>,
	David Laight <David.Laight@ACULAB.COM>,
	'Arnd Bergmann' <arnd@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
Subject: Re: [PATCH] [v2] x86: apic: avoid -Wshadow warning in header
Message-ID: <20201029213512.GA34524@rani.riverdale.lan>
References: <20201028212417.3715575-1-arnd@kernel.org>
 <38b11ed3fec64ebd82d6a92834a4bebe@AcuMS.aculab.com>
 <20201029165611.GA2557691@rani.riverdale.lan>
 <93180c2d-268c-3c33-7c54-4221dfe0d7ad@redhat.com>
 <87v9esojdi.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87v9esojdi.fsf@nanos.tec.linutronix.de>

On Thu, Oct 29, 2020 at 09:41:13PM +0100, Thomas Gleixner wrote:
> On Thu, Oct 29 2020 at 17:59, Paolo Bonzini wrote:
> > On 29/10/20 17:56, Arvind Sankar wrote:
> >>> For those two just add:
> >>> 	struct apic *apic = x86_system_apic;
> >>> before all the assignments.
> >>> Less churn and much better code.
> >>>
> >> Why would it be better code?
> >> 
> >
> > I think he means the compiler produces better code, because it won't
> > read the global variable repeatedly.  Not sure if that's true,(*) but I
> > think I do prefer that version if Arnd wants to do that tweak.
> 
> It's not true.
> 
>      foo *p = bar;
> 
>      p->a = 1;
>      p->b = 2;
> 
> The compiler is free to reload bar after accessing p->a and with
> 
>     bar->a = 1;
>     bar->b = 1;
> 
> it can either cache bar in a register or reread it after bar->a
> 
> The generated code is the same as long as there is no reason to reload,
> e.g. register pressure.
> 
> Thanks,
> 
>         tglx

It's not quite the same.

https://godbolt.org/z/4dzPbM

With -fno-strict-aliasing, the compiler reloads the pointer if you write
to the start of what it points to, but not if you write to later
elements.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4D329F65B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 21:41:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14716.36410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYEjW-0001un-4G; Thu, 29 Oct 2020 20:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14716.36410; Thu, 29 Oct 2020 20:41:18 +0000
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
	id 1kYEjW-0001uO-13; Thu, 29 Oct 2020 20:41:18 +0000
Received: by outflank-mailman (input) for mailman id 14716;
 Thu, 29 Oct 2020 20:41:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l+xb=EE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kYEjV-0001uJ-05
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:41:17 +0000
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a434d79-33f8-4cc0-8048-6e6dde7f122e;
 Thu, 29 Oct 2020 20:41:15 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l+xb=EE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
	id 1kYEjV-0001uJ-05
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:41:17 +0000
X-Inumbo-ID: 8a434d79-33f8-4cc0-8048-6e6dde7f122e
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8a434d79-33f8-4cc0-8048-6e6dde7f122e;
	Thu, 29 Oct 2020 20:41:15 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1604004074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=atBWSsg54EdElpQmxIGprMythfayvCfZuL6C0LobpJM=;
	b=zq8OmPxEES1sHwpepW8vzEe0jYTTlYtXV12+hxY9jzb3tYWHhm/ZdTBMeg3suW0uXnI22o
	QRfyl9qohhkGLsu5YphvfKNBGVVDQawQCEUKIkYyS9kHIx+egw2JhKwPfjRd0CQcLbf0Ma
	0+PC2RmqmSccZCm0+EePmF3HtanM8DIlixTveKLP2V0Ksru8Qhe9ajxfSPkPPl0uWvBwkU
	CZwbIAvCZIttVS0GI97ynyZTPYQQIOv8hYusYoSjZ4dO50yoSQ3YCiIbnrq6RPIo7I7h9P
	itJ4XgJrsTvo9TskPmCZoEXzffgEzSJ6VbIxGy8NcIttwKKxU5XG9VypabrK6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1604004074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=atBWSsg54EdElpQmxIGprMythfayvCfZuL6C0LobpJM=;
	b=0iX007DAMCgsp9VjWAMG/D89r7Kujao6BFenyKLGjjTNx6nxedksxtcAkjsrsCDNJr2Ram
	K5nPYTQvIUbyR9CA==
To: Paolo Bonzini <pbonzini@redhat.com>, Arvind Sankar <nivedita@alum.mit.edu>, David Laight <David.Laight@ACULAB.COM>
Cc: 'Arnd Bergmann' <arnd@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "x86\@kernel.org" <x86@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, "linux-hyperv\@vger.kernel.org" <linux-hyperv@vger.kernel.org>, "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm\@vger.kernel.org" <kvm@vger.kernel.org>, "platform-driver-x86\@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "iommu\@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
Subject: Re: [PATCH] [v2] x86: apic: avoid -Wshadow warning in header
In-Reply-To: <93180c2d-268c-3c33-7c54-4221dfe0d7ad@redhat.com>
References: <20201028212417.3715575-1-arnd@kernel.org> <38b11ed3fec64ebd82d6a92834a4bebe@AcuMS.aculab.com> <20201029165611.GA2557691@rani.riverdale.lan> <93180c2d-268c-3c33-7c54-4221dfe0d7ad@redhat.com>
Date: Thu, 29 Oct 2020 21:41:13 +0100
Message-ID: <87v9esojdi.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Oct 29 2020 at 17:59, Paolo Bonzini wrote:
> On 29/10/20 17:56, Arvind Sankar wrote:
>>> For those two just add:
>>> 	struct apic *apic = x86_system_apic;
>>> before all the assignments.
>>> Less churn and much better code.
>>>
>> Why would it be better code?
>> 
>
> I think he means the compiler produces better code, because it won't
> read the global variable repeatedly.  Not sure if that's true,(*) but I
> think I do prefer that version if Arnd wants to do that tweak.

It's not true.

     foo *p = bar;

     p->a = 1;
     p->b = 2;

The compiler is free to reload bar after accessing p->a and with

    bar->a = 1;
    bar->b = 1;

it can either cache bar in a register or reread it after bar->a

The generated code is the same as long as there is no reason to reload,
e.g. register pressure.

Thanks,

        tglx


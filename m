Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D9829F23D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 17:52:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14349.35482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBA4-00086b-LH; Thu, 29 Oct 2020 16:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14349.35482; Thu, 29 Oct 2020 16:52:28 +0000
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
	id 1kYBA4-00086C-Hq; Thu, 29 Oct 2020 16:52:28 +0000
Received: by outflank-mailman (input) for mailman id 14349;
 Thu, 29 Oct 2020 16:52:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l+xb=EE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kYBA3-000867-6X
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 16:52:27 +0000
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d14fa99-2859-4e0d-8132-154096b25fb1;
 Thu, 29 Oct 2020 16:52:24 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l+xb=EE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
	id 1kYBA3-000867-6X
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 16:52:27 +0000
X-Inumbo-ID: 8d14fa99-2859-4e0d-8132-154096b25fb1
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8d14fa99-2859-4e0d-8132-154096b25fb1;
	Thu, 29 Oct 2020 16:52:24 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1603990343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=BwThNbQsIy31JmqgarQ4wUhEb+UzdV725F922IlA/F4=;
	b=2FkT5gzjoyr+ccyJHCtb4QbofbUucrdb26XfUpdE+rdknukTxAg72GjxOZ5n41jAnKkYB/
	nOpJkfACWzeDMF9Gf28Vi+9nUZMt6JCdJF214EEVoZ1yZcMxqCTQCc46rL/vBXNOjbaYLf
	f+eXkQpHbUsq3GQII9gW2a6gC/yzaVGRhIDCe7QC8qE2NXhN+gqydOhJhoyJkPdfEZ6A3H
	521AeFSdgq1ad66a8zBLLVOR40MhLsMZO/mD5DBZk0Zoq9X1/sGoa8LUpdsu3PsEqtSaUm
	fd5d4g1zK5WhugYvwd0KaIDhMulezjPfh4Q5hU2OhBCUeaAlgqLTDOppSiEmsg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1603990343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=BwThNbQsIy31JmqgarQ4wUhEb+UzdV725F922IlA/F4=;
	b=PgpLqCB/8RWNfhP0PSdbieEqqU4kgNwBJgx4lowNSAaj/HnR/wMahgJJLuQXXytVePuRe9
	Nfyl8b5dIoAH1xCQ==
To: Arnd Bergmann <arnd@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, the arch/x86 maintainers <x86@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, linux-hyperv@vger.kernel.org, "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>, kvm list <kvm@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, "open list\:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>
Subject: Re: [PATCH] [v2] x86: apic: avoid -Wshadow warning in header
In-Reply-To: <CAK8P3a0e0YAkh_9S1ZG5FW3QozZnp1CwXUfWx9VHWkY=h+FVxw@mail.gmail.com>
Date: Thu, 29 Oct 2020 17:52:22 +0100
Message-ID: <871rhhotyx.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain

Arnd,

On Thu, Oct 29 2020 at 10:51, Arnd Bergmann wrote:
> On Thu, Oct 29, 2020 at 8:04 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>> On 28/10/20 22:20, Arnd Bergmann wrote:
>> > Avoid this by renaming the global 'apic' variable to the more descriptive
>> > 'x86_system_apic'. It was originally called 'genapic', but both that
>> > and the current 'apic' seem to be a little overly generic for a global
>> > variable.
>>
>> The 'apic' affects only the current CPU, so one of 'x86_local_apic',
>> 'x86_lapic' or 'x86_apic' is probably preferrable.
>
> Ok, I'll change it to x86_local_apic then, unless someone else has
> a preference between them.

x86_local_apic is fine with me.

> I think ideally there would be no global variable, withall accesses
> encapsulated in function calls, possibly using static_call() optimizations
> if any of them are performance critical.

There are a bunch, yes.

> It doesn't seem hard to do, but I'd rather leave that change to
> an x86 person ;-)

It's not hard, but I'm not really sure whether it buys much.

Can you please redo that against tip x86/apic. Much of what you are
touching got a major overhaul.

Thanks,

        tglx


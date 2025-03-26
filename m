Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11597A7125C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 09:14:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927269.1330029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txLuG-0005jp-NU; Wed, 26 Mar 2025 08:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927269.1330029; Wed, 26 Mar 2025 08:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txLuG-0005hx-KG; Wed, 26 Mar 2025 08:14:36 +0000
Received: by outflank-mailman (input) for mailman id 927269;
 Wed, 26 Mar 2025 08:14:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ly6i=WN=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1txLuF-0005hr-Bb
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 08:14:35 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5889486d-0a1a-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 09:14:32 +0100 (CET)
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
X-Inumbo-ID: 5889486d-0a1a-11f0-9ffa-bf95429c2676
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1742976871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fKcMiwg131TmW5oikumSj99JLfzIDAkNS32OxdtAXEk=;
	b=miqIZvAdfz9A0oXzn4AFAoacHJhs3i5TmQQYeqKcGNg3b3PYTpMfZpCLhq3rcNLtbpFykb
	//mge/g1ERF/HEnyZSx8GFU8S8itHQgOWMiqijBBJm0v5Xb6xN71F5fbH90t+REvgw27nk
	yV0pjXd3ON/XsOI5bAkoJYIUQS0bELPb6rbrIcGOx6eP0ebWCQczSZ7H2v406DUJtSjsqT
	7wpYmQuXBJFtdMjrFzR3w07Kp4KKgHK0JJLh2SHQ9FCKzQjpT6K7/vJZAoRayWt0wNbUpw
	beaaSQiVCkCGljV6iH/MUqAdfCi7CRVpVjtzo2J+SOCaIWKFV7b556ebFiVmww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1742976871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fKcMiwg131TmW5oikumSj99JLfzIDAkNS32OxdtAXEk=;
	b=Z74KjXxaq9z8YvoCfDYk+wS2LQPfyuRxNWP5wyKollJxrr/dAX/8yLGcNhPHwsclteOzcJ
	8+DUDm2TmMgPcjBQ==
To: Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Daniel Gomez <da.gomez@kernel.org>, =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Bjorn
 Helgaas <helgaas@kernel.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org, Bjorn Helgaas
 <bhelgaas@google.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 3/3] PCI/MSI: Convert pci_msi_ignore_mask to per MSI
 domain flag
In-Reply-To: <Z-KLhBHoNBB_lr7y@macbook.local>
References: <20250320210741.GA1099701@bhelgaas>
 <846c80f8-b80f-49fd-8a50-3fe8a473b8ec@suse.com>
 <qn7fzggcj6qe6r6gdbwcz23pzdz2jx64aldccmsuheabhmjgrt@tawf5nfwuvw7>
 <Z-GbuiIYEdqVRsHj@macbook.local>
 <kp372led6jcryd4ubpyglc4h7b3erramgzsjl2slahxdk7w575@jganskuwkfvb>
 <Z-Gv6TG9dwKI-fvz@macbook.local> <87y0wtzg0z.ffs@tglx>
 <87v7rxzct0.ffs@tglx> <Z-KDyCzeovpFGiVu@macbook.local>
 <87sen1z9p4.ffs@tglx> <Z-KLhBHoNBB_lr7y@macbook.local>
Date: Wed, 26 Mar 2025 09:14:30 +0100
Message-ID: <87msd8yzrt.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25 2025 at 11:55, Roger Pau Monn=C3=A9 wrote:
> On Tue, Mar 25, 2025 at 11:27:51AM +0100, Thomas Gleixner wrote:
>> On Tue, Mar 25 2025 at 11:22, Roger Pau Monn=C3=A9 wrote:
>> > On Tue, Mar 25, 2025 at 10:20:43AM +0100, Thomas Gleixner wrote:
>> > I'm a bit confused by what msi_create_device_irq_domain() does, as it
>> > does allocate an irq_domain with an associated msi_domain_info
>> > structure, however that irq_domain is set in
>> > dev->msi.data->__domains[domid].domain rather than dev->msi.domain,
>> > and doesn't override the default irq_domain set by
>> > pcibios_device_add().
>>=20
>> The default irq domain is a parent domain in that case on top of which
>> the per device domains are built. And those are private to the device.
>
> Sorry to ask, but shouldn't dev_get_msi_domain() return the specific
> device domain rather than the parent one?  Otherwise I feel the
> function should rather be named dev_get_parent_msi_domain().

The function returns the MSI domain pointer which is associated to the
device. That can be either a global MSI domain or a parent MSI domain.

The few places which actually care about it have the proper checks in
place and until we consolidate the MSI handling to per device domains,
this will unfortunately remain slightly confusing.

>> The XEN variant uses the original global PCI/MSI domain concept with
>> this outrageous domain wrapper hack. A crime committed by some tglx
>> dude.
>
> I see.  So the proper way would be for Xen to not override the default
> x86 irq_domain in dev->msi.domain (so don't have a Xen PV specific
> version of x86_init.irqs.create_pci_msi_domain) and instead do
> something similar to what VMD does?

No. Xen should override it as it provides the default domain for the
system. VMD is a special case as it provides it's own magic on top.

If XEN would not override it as the global default, then you'd need a
lot of extra hackery to do the override at the end.

Thanks,

        tglx


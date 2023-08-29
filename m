Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE7378CFAB
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 00:54:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592501.925226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb7bR-0003hl-8Y; Tue, 29 Aug 2023 22:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592501.925226; Tue, 29 Aug 2023 22:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb7bR-0003fq-61; Tue, 29 Aug 2023 22:54:29 +0000
Received: by outflank-mailman (input) for mailman id 592501;
 Tue, 29 Aug 2023 22:54:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aAEd=EO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1qb7bP-0003fk-1A
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 22:54:27 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff596c83-46be-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 00:54:24 +0200 (CEST)
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
X-Inumbo-ID: ff596c83-46be-11ee-9b0d-b553b5be7939
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1693349662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cTxcTv29Q1+kRj/CEgk7fvIwsEjeCKuuJCYEhn3X+iA=;
	b=wtD6sB1heLOQH4Iyb/G5VFmrk4ZAjhcWBwfP5IK58EGpCtZI64b9PbUJDSu9dKv/sPx0O5
	+PaBQvDadH1eyByHizPH9kd7h54CrbddSSuyGvXDV1pUn42O4U9yW/apqhzmjLaeZQkWb/
	sA6vdBZFa1qS2uNWKq5SVDru8s097vqgAgeL0jkR+M1qmKAPtXrMasAVhPsOUouK8mcZ6E
	hKRYqFYac4/775Mo7t5OMuVS2CCF98FRd16+kWI4fd3z+5fbZpEOxU5vIatLc9I2zKKP7q
	G9VLw0lcrOUnzihneZgk8pyudG2gtmfbvw9h47WhjBwfsp5kHQvTXK5QM+dA6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1693349662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cTxcTv29Q1+kRj/CEgk7fvIwsEjeCKuuJCYEhn3X+iA=;
	b=ccKUUyYcuJIwKhutgnYRdl4rrX+jiJs32E5xlTriZ3d8u2C0VlZXAUK+pPFjY/n3xUcm34
	A0AYg/BqOAr4yHCw==
To: Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Simon Gaiser
 <simon@invisiblethingslab.com>
Cc: Wei Liu <wl@xen.org>, Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
In-Reply-To: <ZO3_0GKvEk-qoaoa@MacBook-Air-de-Roger.local>
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <0bd3583c-a55d-9a68-55b1-c383499d46d8@suse.com>
 <2c97ff5b-03b0-3c17-c7f0-9bc8c9317762@invisiblethingslab.com>
 <cecbeec3-57cb-c8de-be06-bf8f6e9cc5f5@suse.com>
 <298af911-f4f0-165d-c493-90407d649945@citrix.com>
 <cfc853dc-0512-da20-5bf3-968a38d7a759@suse.com>
 <635f0055-7001-f68c-9274-6c078d07a22a@citrix.com>
 <26c50dc7-adf3-dbf1-253b-ce333d31911c@suse.com> <87jztga3sg.ffs@tglx>
 <ZO3_0GKvEk-qoaoa@MacBook-Air-de-Roger.local>
Date: Wed, 30 Aug 2023 00:54:21 +0200
Message-ID: <874jkh7942.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29 2023 at 16:25, Roger Pau Monn=C3=A9 wrote:
> On Sun, Aug 27, 2023 at 05:44:15PM +0200, Thomas Gleixner wrote:
>> The APIC/X2APIC description of MADT specifies flags:
>>=20
>> Enabled        	If this bit is set the processor is ready for use. If
>> 		this bit is clear and the Online Capable bit is set,
>> 		system hardware supports enabling this processor during
>> 		OS runtime. If this bit is clear and the Online Capable
>> 		bit is also clear, this processor is unusable, and OSPM
>> 		shall ignore the contents of the Processor Local APIC
>> 		Structure.
>>=20
>> Online Capable	The information conveyed by this bit depends on the
>> 		value of the Enabled bit. If the Enabled bit is set,
>> 		this bit is reserved and must be zero. Otherwise, if
>> 		this this bit is set, system hardware supports enabling
>> 		this processor during OS runtime.
>
> Sadly this flag is only present starting with MADT v5.

Correct. The difference between pre v5 MADT and v5+ is that the latter
allows the OS to make more informed decisions, but the lack of this flag
does not make the claim that randomly assigning APIC IDs after the
initial parsing is a valid approach any more correct. Why?

Simply because the other relationships vs. processor UIDs and SRAT/SLIT
are not magically going away due to the lack of that flag.

>> Otherwise you'd end up with a CPU hotplugged which is outside of the
>> resource space allocated during init.
>
> It's my understating that ACPI UIDs 0xff and 0xfffffff for local ACPI
> and x2APIC structures respectively are invalid, as that's the
> broadcast value used by the local (x2)APIC NMI Structures.

Correct. These IDs are invalid independent of any flag value.=20

> I think Jan's point (if I understood correctly) is that Processor or
> Device objects can have a _MAT method that returns updated MADT
> entries, and some ACPI implementations might modify the original
> entries on the MADT and return them from that method when CPU
> hotplug takes place.  The spec notes that "OSPM does not expect the
> information provided in this table to be updated if the processor
> information changes during the lifespan of an OS boot." so that the
> MADT doesn't need to be updated when CPU hotplug happens, but I don't
> see that sentence as preventing the MADT to be updated if CPU hotplug
> takes place, it's just not required.

Right. But if you read carefully what I wrote then you will figure out
that any randomly made up APIC ID post MADT enumeration cannot work.

> I don't see anywhere in the spec that states that APIC IDs 0xff and
> 0xffffffff are invalid and entries using those IDs should be ignored,
> but I do think that any system that supports CPU hotplug better has
> those IDs defined since boot.  Also it seems vendors have started
> relying on using 0xff and 0xffffffff APIC IDs to signal non-present
> CPUs, and Linux has been ignoring such entries for quite some time
> already  without reported issues.

There is no requirement for the ACPI spec to state this simply because
these APIC IDs are invalid to address a processor at the architectural
level. ACPI does not care about architectural restrictions unless really
required, e.g. like the LAPIC vs. X2APIC exclusiveness.

Thanks,

        tglx


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAA578D738
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 17:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593108.926025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbNN7-0003yU-5L; Wed, 30 Aug 2023 15:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593108.926025; Wed, 30 Aug 2023 15:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbNN7-0003wQ-2M; Wed, 30 Aug 2023 15:44:45 +0000
Received: by outflank-mailman (input) for mailman id 593108;
 Wed, 30 Aug 2023 15:44:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p4MI=EP=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1qbNN5-0003wF-Qf
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 15:44:43 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2225dc8b-474c-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 17:44:41 +0200 (CEST)
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
X-Inumbo-ID: 2225dc8b-474c-11ee-9b0d-b553b5be7939
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1693410280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=cdwFmZ7D8mpWU8Hib7GE6FvaHKrWVrWQIDhVrFBfq54=;
	b=W3YEnGK3P0Vjg6J4XCd4Sgw6m85okpFhPzsHJqX2U92HkGkosXtZMv1pEL3PoWakkFovUU
	sCCp2P90d4jswYBJgI0cwndirQmb4cqZVNjmfudBwo34fF5Vy89cDYAA9j7CrOMjkOC7Ql
	mSYHpXLQIgQFc1OvgzkcnIVY7MfsDdJnhBYg0TSL6tlpGcPbORj+9wrWdfpbeF1L+Ypjm5
	cgV/ntV5X9bllcKe3xBCMf0lNxgYprcQzLEAoSAA2CAcaVcJZkswqCVLxVxO9WTj7UUw4q
	5Y/kT3nfU7f0UjFLlwHkQJt1l3VOSh0qDREpcf/Qo77sPJe+0ou74fg3yMJDag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1693410280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=cdwFmZ7D8mpWU8Hib7GE6FvaHKrWVrWQIDhVrFBfq54=;
	b=DUYVtX0vgyQOijhXHoPGB3WC2sToK+VSAZQLFb/vrGSkuluHND2mo+Glk8uAxCn3UaiVmO
	92XLJuZ7WzGzbUAQ==
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Simon
 Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
In-Reply-To: <05d7f850-3d56-4a5b-1e0f-ef0f2a7e5a07@suse.com>
Date: Wed, 30 Aug 2023 17:44:40 +0200
Message-ID: <87leds5yc7.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Jan!

On Wed, Aug 30 2023 at 09:20, Jan Beulich wrote:
> On 30.08.2023 00:54, Thomas Gleixner wrote:
>> On Tue, Aug 29 2023 at 16:25, Roger Pau Monn=C3=A9 wrote:
>>=20
>> Correct. These IDs are invalid independent of any flag value.=20
>
> What we apparently agree on is these special UID values to be invalid,
> and that UIDs can't change. But that's not the same for the APIC IDs;
> see below. (As a side note, Xen range-checks UID against its
> implementation limit MAX_MADT_ENTRIES, so it's more than just the
> all-ones values which we'd reject. Not really correct, I know. Looks
> like Linux has done away with the simple x86_acpiid_to_apicid[]
> translation mechanism. This being a statically sized array requires
> this restriction in Xen, for the time being.)

Linux ignores entries too once the the maximum number of CPUs is reached.

>>> I think Jan's point (if I understood correctly) is that Processor or
>>> Device objects can have a _MAT method that returns updated MADT
>>> entries, and some ACPI implementations might modify the original
>>> entries on the MADT and return them from that method when CPU
>>> hotplug takes place.
>
> Just to mention it: It's not just "might". I've seen DSDT code doing
> so on more than one occasion.

That does not make it more correct or better.

> As stated before, unless putting in place extra restrictions, I can't
> even see how firmware would be able to up front determine APIC IDs for
> unpopulated sockets: It simply can't know the topology of a package
> that's not there yet. Requiring all packages to have identical
> topology might be a restriction OSes put in place, but I'd be inclined
> to call firmware buggy if it did (short of me being aware of there
> being anything in the spec putting in place such a restriction).

The ACPI specification does not care about restrictions which are in the
realm of hardware. You simply cannot mix random CPUs in a system just as
you see fit.

But that aside. ACPI based hotplug is purely used by virtualization. The
efforts to support real physical hotplug have never advanced beyond the
proof of concept state as the required complexity turned out to be just
not worth the potential benefit.

Of course virtualization people might think that everything which is
imaginable and not explicitly forbidden by some specification is
something which should be supported. That's just a recipe for disaster
as it needlessly expands the complexity space for absolutely zero value.

In reality most OSes will require that all possible APIC IDs are
enumerated during initialization in order to size things correctly and
to make system wide decisions correctly during boot or they will either
fail to accept hot-added CPUs later on or end up in a situation where
after accepting a hot-added CPU it turns out that system wide boot time
decisions are wrong or data is sized incorrectly, which means it is
pretty much up a creek without a paddle.

So in order to avoid these hard to handle, hard to debug and diagnose
failure cases, it's sensible when OSes mandate enumeration requirements
which have been omitted from the specification for whatever reason.

Linux expects this today and in case the expectation is not met it has
issues due to the non-enforcement, which cause hard to diagnose
malfunction. Those issues might be fixable by some definition of
fixable, but the value of doing that is close to zero. In fact it'd be a
net negative because the increased complexity will just put a
maintainability burden on the code base which is completely
unjustifiable.

Coming back to the specification issues. As of v6.3 the Online Capable
flag was added with the following rationale (paraphrased):

     Operating systems need to size resources at boot time and therefore
     they count the APIC IDs which have the enabled flag cleared to size
     correctly for potential hotplug operations.

     But that has diametral effects on bare metal because the OS is not
     able to distinguish between hot-plugable APIC ID and truly disabled
     entries. That results in overallocation or suboptimal distribution
     of multi-queue devices.

The benefit (verbatim):

     The proposed =E2=80=9COnline Capable=E2=80=9D flag will allow OSPM to =
unequivocally
     discern the platform=E2=80=99s intention regarding processors that are=
 not
     enabled at OS boot-time.

Now look at the outcome:

Enabled:

        If this bit is set the processor is ready for use. If this bit
        is clear and the Online Capable bit is set, system hardware
        supports enabling this processor during OS runtime. If this bit
        is clear and the Online Capable bit is also clear, this
        processor is unusable, and OSPM shall ignore the contents of the
        Processor Local APIC Structure.

So while I conceed that this does not expressis verbis mandate that
hot-pluggable CPUs must be enumerated it's not far fetched to interpret
it this way. The key is 'OSPM shall ignore the contents...'

As MADT is the only source of information from which an OS can deduce
sizing and also topology information during early boot, ignoring the
contents boils down to not allocating resources and if such an APIC ID
magically surfaces later on via hot-add, then the OS can rightfully
refuse to add it.

Having that information is simply a correctness requirement and there is
absolutely no justification to support made up ivory tower
configurations which try to explore the gaps and bluryness of the ACPI
specification.

Of course we can't rely on that flag yet if the table is not
implementing v6.3+, but from my testing there is no fallout from
refusing to hot-add CPUs which have not been enumerated in MADT during
early boot. The issue addressed by the Online Capable bit
vs. overallocation is obviosly still there when the enumerated
"disabled" APIC IDs can never be hot-added.

Feel free to disagree, but Linux will enforce that _all_ possible APIC
IDs are enumerated in MADT during early boot in the near future. This
makes a lot of things correct, simpler and more robust.

Thanks,

        tglx


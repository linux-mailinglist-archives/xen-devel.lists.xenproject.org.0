Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 675DC27B0FE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 17:35:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMvBO-0000jQ-D4; Mon, 28 Sep 2020 15:35:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMvBN-0000jL-C0
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 15:35:17 +0000
X-Inumbo-ID: 1d767b75-f63f-45d9-9d52-966186bf425a
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d767b75-f63f-45d9-9d52-966186bf425a;
 Mon, 28 Sep 2020 15:35:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601307315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eMHlmJEWFtDL5UZvXlK3DdQI4u4cjYainkeCciD0gsY=;
 b=W9RXzr7r5muZAp+Ndv514F/1HvqD4JrU1okalLtaQGn/MqZY7kPeAlSH35GB168efcKcSF
 sPeuKdfAakTNhzwuy99MerBCjdxKJUd9dNnDAb9nI+gJtHYiCGd74KFnypZ4Xz4i1eyj4V
 Nx/bE+xT3q/VjbyzQbpw+8WP1C3U3UE=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EFB8DAD5F;
 Mon, 28 Sep 2020 15:35:14 +0000 (UTC)
Subject: Re: [PATCH 3/3] x86/pv: Inject #UD for missing SYSCALL callbacks
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Andy Lutomirski <luto@kernel.org>,
 Manuel Bouyer <bouyer@antioche.eu.org>
References: <20200923101848.29049-1-andrew.cooper3@citrix.com>
 <20200923101848.29049-4-andrew.cooper3@citrix.com>
 <ed891c94-63a4-496c-6817-1b88ac4c004b@suse.com>
 <0a4f11a4-efe7-0a58-1e25-b394a1a10b3c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3060be1b-b036-92f6-02fa-a31933c76a63@suse.com>
Date: Mon, 28 Sep 2020 17:35:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0a4f11a4-efe7-0a58-1e25-b394a1a10b3c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.09.2020 15:05, Andrew Cooper wrote:
> On 24/09/2020 15:56, Jan Beulich wrote:
>> On 23.09.2020 12:18, Andrew Cooper wrote:
>>> Despite appearing to be a deliberate design choice of early PV64, the
>>> resulting behaviour for unregistered SYSCALL callbacks creates an untenable
>>> testability problem for Xen.  Furthermore, the behaviour is undocumented,
>>> bizarre, and inconsistent with related behaviour in Xen, and very liable
>>> introduce a security vulnerability into a PV guest if the author hasn't
>>> studied Xen's assembly code in detail.
>>>
>>> There are two different bugs here.
>>>
>>> 1) The current logic confuses the registered entrypoints, and may deliver a
>>>    SYSCALL from 32bit userspace to the 64bit entry, when only a 64bit
>>>    entrypoint is registered.
>>>
>>>    This has been the case ever since 2007 (c/s cd75d47348b) but up until
>>>    2018 (c/s dba899de14) the wrong selectors would be handed to the guest for
>>>    a 32bit SYSCALL entry, making it appear as if it a 64bit entry all along.
>> I'm not sure what you derive the last half sentence from. To a 32-bit
>> PV guest, nothing can make things look like being 64-bit.
> 
> Right, but what part of this discussion is relevant to 32bit PV guests,
> when we're discussing junk data being passed to the 64bit SYSCALL entry?

To me your text doesn't make it clear that you only talk about 64-bit
guests there. Talking about 32-bit user space doesn't imply a 64-bit
kernel to me.

>> And as you
>> did say in your 2018 change, FLAT_KERNEL_SS == FLAT_USER_SS32.
> 
> And? Mode is determined by CS, not SS.  A kernel suffering this failure
> will find a CS claiming to be FLAT_RING1_DS/RPL3, and not
> FLAT_COMPAT_USER_CS.

Yet how does this make anyone looking think of this being a 64-bit
entry then?

As to CS vs SS - I think the canonical CPL is SS.DPL, and since
for SS DPL == RPL, also SS.RPL. At least that's what we use in a
number of places.

> Even if we presume for a moment that multiplexing was a sensible plan,
> there were 13 years where you couldn't rationally distinguish the two
> conditions.
> 
> Considering the very obvious chaos which occurs when you try to
> HYPERCALL_iret with the bogus frame, either noone ever encountered it,
> or everyone used the Linux way which was to blindly overwrite Xen's
> selectors with the knowledge (and by this, I mean expectation) that the
> two entrypoints distinguished the originating mode.
> 
> Linux doesn't go wrong because it registers both entrypoints, but
> anything else using similar logic (and only one registered entrypoint)
> would end up returning to 32bit userspace in 64bit mode.
> 
>> As to the "confusion" of entry points - before the compat mode entry
>> path was introduced, a 64-bit guest could only register a single
>> entry point.
> 
> The fact that MSR_LSTAR and MSR_CSTAR are separate in the AMD64 spec is
> a very good hint that that is how software should/would expect things to
> behave.
> 
> The timing and content of c/s 02410e06fea7, which introduced the first
> use of SYSCALL, looks suspiciously like it was designed to the Intel
> manual, seeing as it failed to configure MSR_CSTAR entirely.
> 
> The CSTAR "fix" came later in c/s 6c94cfd1491 "Various bug fixes", which
> introduced the confusion of the two entrypoints, and still hadn't been
> tested on AMD as it would return to 32bit userspace in 64bit mode.
> 
> c/s 091e799a840c was the commit which introduced the syscall entrypoint.
> 
>> Hence guests at the time had to multiplex 32- and 64-bit
>> user mode entry from this one code path. In order to avoid regressing
>> any such guest, the falling back to using the 64-bit entry point was
>> chosen. Effectively what you propose is to regress such guests now,
>> rather than back then.
> 
> I completely believe that you deliberately avoided changing the existing
> behaviour at the time.
> 
> I just don't find it credible that the multiplexing was a deliberate and
> informed design choice originally, when it looks very much like an
> accident, and was so broken for more than a decade following.

The problem here is once again the lack of documentation of the ABI.
As such, the behavior of the implementation, of however good or bad
intent, has been the reference. And hence I don't see us changing the
behavior as a viable thing.

If you can get e.g. Roger to support your position and provide an
ack to this change, I guess I'm willing to accept the change going in
as it is. But I'm afraid I can't give it my R-b.

>>> This change does constitute a change in the PV ABI, for corner cases of a PV
>>> guest kernel registering neither callback, or not registering the 32bit
>>> callback when running on AMD/Hygon hardware.
>>>
>>> It brings the behaviour in line with PV32 SYSCALL/SYSENTER, and PV64
>>> SYSENTER (safe by default, until explicitly enabled), as well as native
>>> hardware (always delivered to the single applicable callback).
>> Albeit an OS running natively and setting EFER.SCE is obliged to set both
>> entry points; they can't have one without the other (and not be vulnerable).
>> Since it's unclear what the PV equivalent of EFER.SCE is, I don't think
>> comparing this particular aspect of the behavior makes a lot of sense.
> 
> A 32bit PV guest doesn't have EFER.SCE, but the act of registering the
> SYSCALL32 entry point "enables" a 32bit SYSCALL to work (i.e. not #GP).
> 
> Neither type of PV guest has MSR_SYSENTER_CS, but the act of registering
> the SYSENTER entry point "enables" SYSENTER to work (i.e. not #GP, if
> you can call the fairly bogus resulting state "working".)
> 
> The asymmetry here is that a 64bit PV guest will be DoS'd before it
> registers at least one of the two SYSCALL entry points.

Well, that's the part of the change that we look to agree to make. Our
disagreement is merely about what is to happen when only a 64-bit
entry point gets registered. I was wondering whether you wouldn't be
willing to split the change, so that the uncontroversial part can go
in. But I do realize that's extra work on your part, which
- considering the position you take - you may view as pointless effort.

Jan


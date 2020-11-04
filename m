Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F22D2A6289
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 11:52:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19017.44208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaGNa-0000Xz-Ux; Wed, 04 Nov 2020 10:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19017.44208; Wed, 04 Nov 2020 10:51:02 +0000
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
	id 1kaGNa-0000Xa-RQ; Wed, 04 Nov 2020 10:51:02 +0000
Received: by outflank-mailman (input) for mailman id 19017;
 Wed, 04 Nov 2020 10:51:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gnt3=EK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kaGNZ-0000XV-So
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 10:51:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b08df39-0b5d-43a5-863b-9c0f669047ce;
 Wed, 04 Nov 2020 10:50:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AFE8DABAE;
 Wed,  4 Nov 2020 10:50:58 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gnt3=EK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kaGNZ-0000XV-So
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 10:51:01 +0000
X-Inumbo-ID: 1b08df39-0b5d-43a5-863b-9c0f669047ce
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1b08df39-0b5d-43a5-863b-9c0f669047ce;
	Wed, 04 Nov 2020 10:50:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604487058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nqi+uR4cKB94poUEzycGIYagU6ii3GpB8CPi8XSd7WU=;
	b=LFV2Fu7QFlo0ktNlIfmHRPVPLuP/dAWnImZnZIAfS27heEwxJtU4scRxMQJNL7XlYrUYIR
	RXFYWKSVGjRfCPWrays7u7YiTzcB65Mm+Yb/3+/2vqkycrxUxrqLlRxhiDTZPhsR+hckP0
	4dB5v7yVX//BH3mMdrAmid/8H5vJ+Us=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AFE8DABAE;
	Wed,  4 Nov 2020 10:50:58 +0000 (UTC)
Subject: Re: [PATCH] x86/PV: conditionally avoid raising #GP for early guest
 MSR accesses
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7e69db81-cee7-3c7b-be64-4f5ff50fbe9c@suse.com>
 <cf814663-0319-6a30-f3a2-dc43432eedb1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cf24a63e-afe9-be6a-3ab9-cc65e19a7a0f@suse.com>
Date: Wed, 4 Nov 2020 11:50:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <cf814663-0319-6a30-f3a2-dc43432eedb1@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03.11.2020 18:31, Andrew Cooper wrote:
> On 03/11/2020 17:06, Jan Beulich wrote:
>> Prior to 4.15 Linux, when running in PV mode, did not install a #GP
>> handler early enough to cover for example the rdmsrl_safe() of
>> MSR_K8_TSEG_ADDR in bsp_init_amd() (not to speak of the unguarded read
>> of MSR_K7_HWCR later in the same function). The respective change
>> (42b3a4cb5609 "x86/xen: Support early interrupts in xen pv guests") was
>> backported to 4.14, but no further - presumably since it wasn't really
>> easy because of other dependencies.
>>
>> Therefore, to prevent our change in the handling of guest MSR accesses
>> to render PV Linux 4.13 and older unusable on at least AMD systems, make
>> the raising of #GP on these paths conditional upon the guest having
>> installed a handler. Producing zero for reads and discarding writes
>> isn't necessarily correct and may trip code trying to detect presence of
>> MSRs early, but since such detection logic won't work without a #GP
>> handler anyway, this ought to be a fair workaround.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I appreciate that we probably have to do something, but I don't think
> this is a wise move.

I wouldn't call it wise either, but I'm afraid something along
these lines is necessary.

> Linux is fundamentally buggy.  It is deliberately looking for a
> potential #GP fault given its use of rdmsrl_safe().  The reason this bug
> stayed hidden for so long was as a consequence of Xen's inappropriate
> MSR handling for guests, and the reasons for changing Xen's behaviour
> still stand.

I agree.

> This change, in particular, does not apply to any explicitly handled
> MSRs, and therefore is not a comprehensive fix.

But it's intentional that this deals with the situation in a
generic way, not on a per-MSR basis. If we did as you suggest
further down, we'd have to audit all Linux versions up to 4.14
for similar issues with other MSRs. I don't think this would
be a practical thing to do, and I also don't think that leaving
things as they are until we have concrete reports of problems
is a viable option either.

Adding explicit handling for the two offending MSRs (and any
possible further ones we discover) would imo only be to avoid
issuing the respective log messages.

>  Nor is it robust to
> someone adding code to explicitly handling the impacted MSRs at a later
> date (which are are likely to need to do for HWCR), and which would
> reintroduce this failure to boot.

I'm afraid I don't understand. Looking at the two functions
the patch alters, only X86EMUL_OKAY is used in return statements
other than the final one. If this model is to be followed by
future additions (which I think it ought to be; perhaps we
should add comments to this effect), the code introduced here
will take care of the situation nevertheless.

> We should have the impacted MSRs handled explicitly, with a note stating
> this was a bug in Linux 4.14 and older.  We already have workaround for
> similar bugs in Windows, and it also gives us a timeline to eventually
> removing support for obsolete workarounds, rather than having a "now and
> in the future, we'll explicitly tolerate broken PV behaviour for one bug
> back in ancient linux".

Comparing with Windows isn't very helpful; the patch here is
specifically about PV, and would help other OSes as well in
case they would have missed setting up exceptions early in
just the PV-on-Xen case. For the HVM case I'd indeed rather
see us go the route we've gone for Windows, if need be.

There's one adjustment to the logic here that I've been
considering, but I'm still undecided due to the downsides:
Without exposing the value, we could make the decision to zap
the #GP dependent upon us being able to read the MSR.

The other possible adjustment would be to avoid issuing two
log messages for the same operation (affecting debug builds
only). But the code structure (which isn't really consistent
about when the pre-existing message would get issued)
doesn't directly lend itself to such an adjustment without
altering the behavior for some of the MSRs explicitly
handled.

As a tangent, while discussing this situation, please let's
not forget about this code in Linux:

static u64 xen_read_msr(unsigned int msr)
{
	/*
	 * This will silently swallow a #GP from RDMSR.  It may be worth
	 * changing that.
	 */
	int err;

	return xen_read_msr_safe(msr, &err);
}

static void xen_write_msr(unsigned int msr, unsigned low, unsigned high)
{
	/*
	 * This will silently swallow a #GP from WRMSR.  It may be worth
	 * changing that.
	 */
	xen_write_msr_safe(msr, low, high);
}

Imo this "silent swallowing" has always been the wrong thing
to do, and hence ought to be dropped. Of course right now it
saves the kernel from dying on the HWCR read.

Jan


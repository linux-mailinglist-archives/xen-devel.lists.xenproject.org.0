Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 562A33726D9
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 09:59:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121969.230004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldpwF-0001L5-9Q; Tue, 04 May 2021 07:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121969.230004; Tue, 04 May 2021 07:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldpwF-0001Kg-5q; Tue, 04 May 2021 07:57:51 +0000
Received: by outflank-mailman (input) for mailman id 121969;
 Tue, 04 May 2021 07:57:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldpwE-0001Kb-1f
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 07:57:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a264c15-80b5-4ca9-ac6c-bc694c5ec9e1;
 Tue, 04 May 2021 07:57:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A7B4FAECB;
 Tue,  4 May 2021 07:57:47 +0000 (UTC)
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
X-Inumbo-ID: 4a264c15-80b5-4ca9-ac6c-bc694c5ec9e1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620115067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=njW/EeGF5q23c7VSb2H2+m0T4TKq3MoSFSByja5muxE=;
	b=mgC7IuhH4+JuoL9JL9fFiaPmYBobYdkuhLhFS/1xlwJSYJ8jTmxF4DEInErKarwewLW70y
	QPuUt5h54NBF0EOUwdmvEyJ0na1KZp7kQt9dVmiaSavOqZiT0WeAls81kzG7PPd4GKqqfU
	V1kCujWbbbIIuP2TzCviLyNZd3QGqrU=
Subject: Re: [PATCH v3 05/22] x86/xstate: drop xstate_offsets[] and
 xstate_sizes[]
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
 <434705ef-1c34-581d-b956-2322b4413232@suse.com>
 <f3a9b372-c927-70e3-a2ba-fef2bb2c7d7a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ebf0945a-db78-66de-2f64-860c5067220d@suse.com>
Date: Tue, 4 May 2021 09:57:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <f3a9b372-c927-70e3-a2ba-fef2bb2c7d7a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03.05.2021 18:10, Andrew Cooper wrote:
> On 22/04/2021 15:45, Jan Beulich wrote:
>> They're redundant with respective fields from the raw CPUID policy; no
>> need to keep two copies of the same data.
> 
> So before I read this patch of yours, I had a separate cleanup patch
> turning the two arrays into static const.
> 
>> This also breaks
>> recalculate_xstate()'s dependency on xstate_init(),
> 
> It doesn't, because you've retained the reference to xstate_align, which
> is calculated in xstate_init().

Good point - s/breaks/eliminates some of/.

>  I've posted "[PATCH 4/5] x86/cpuid:
> Simplify recalculate_xstate()" which goes rather further.

I'll see to take a look soonish.

> xstate_align, and xstate_xfd as you've got later in the series, don't
> need to be variables.  They're constants, just like the offset/size
> information, because they're all a description of the XSAVE ISA
> instruction behaviour.

Hmm, I think there are multiple views possible - for xfd_mask even more
than for xstate_align: XFD is, according to my understanding of the
spec, not a prereq feature to AMX. IOW AMX would function fine without
XFD, just that lazy state saving space allocation then wouldn't be
possible. And I also can't, in principle, see any reason why largish
components like the AVX512 ones couldn't become XFD-sensitive (in
hardware, we of course can't mimic this in software).

(I could take as proof sde reporting AMX but not XFD with -spr, but I
rather suspect this to be an oversight in their CPUID data. I've posted
a respective question in their forum.)

If there really was a strict static relationship, I'm having trouble
seeing why the information would need expressing in CPUID at all. It
would at least feel like over-engineering then.

> We never turn on states we don't understand, which means we don't
> actually need to refer to any component subleaf, other than to cross-check.
> 
> I'm still on the fence as to whether it is better to compile in the
> constants, or to just use the raw policy.  Absolutely nothing good will
> come of the constants changing, and one of my backup plans for dealing
> with the size of cpuid_policy if it becomes a problem was to not store
> these leaves, and generate them dynamically on request.

Actually it is my understanding that the reason the offsets are
expressed via CPUID is that originally it was meant for them to be
able to vary between implementations (see in particular the placement
of the LWP component, which has resulted in a curious 128-byte gap
ahead of the MPX components). Until it was realized what implications
this would have on migration.

>> allowing host CPUID
>> policy calculation to be moved together with that of the raw one (which
>> a subsequent change will require anyway).
> 
> While breaking up the host/raw calculations from the rest, we really
> need to group the MSR policy calculations with their CPUID counterparts.

But that's orthogonal to the change here, i.e. if at all for this
series subject of a separate patch. Plus I have to admit I'm not
sure I see what your plan here would be - cpuid.c and msr.c so far
don't cross reference one another. And I thought this separation
was intentional.

Jan


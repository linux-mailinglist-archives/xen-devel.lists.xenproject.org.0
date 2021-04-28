Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EAC36D493
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 11:11:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119115.225466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbgEB-0008Da-BZ; Wed, 28 Apr 2021 09:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119115.225466; Wed, 28 Apr 2021 09:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbgEB-0008DB-8M; Wed, 28 Apr 2021 09:11:27 +0000
Received: by outflank-mailman (input) for mailman id 119115;
 Wed, 28 Apr 2021 09:11:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+xa=JZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbgE9-0008D6-NZ
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 09:11:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f677f27b-155a-46da-aed5-32d98747eec3;
 Wed, 28 Apr 2021 09:11:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C0121AFE2;
 Wed, 28 Apr 2021 09:11:23 +0000 (UTC)
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
X-Inumbo-ID: f677f27b-155a-46da-aed5-32d98747eec3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619601083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7bZDrMwaZBomTURa/fISaXQuoY9dA/cWiu2EPmuEx9Y=;
	b=l0x40CPAoD1VhCO6T0Z/hlYeMiwdThRaT6Fqkp7QFxxnRB946tNGoXLVCyeef+dJADPfo7
	5iPCd8Jxa9Q2VCoKwPqn0XYs/ww3e3bmnHAz69CifHg3dzIQj748GmF/HO8iOmgMmCrTzP
	rkb4IdnX+klgZawJ7z8MHHAVaaFr9CI=
Subject: Re: [PATCH 1/3] x86/hvm: Introduce experimental guest CET support
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210426175421.30497-1-andrew.cooper3@citrix.com>
 <20210426175421.30497-2-andrew.cooper3@citrix.com>
 <d8bd932d-071a-4a5b-747c-02cbd5e296cd@suse.com>
 <86cf1d97-2034-7791-071a-48208b6ba54b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <28d7b7a9-9dd2-1664-e946-d7e4a330da0f@suse.com>
Date: Wed, 28 Apr 2021 11:11:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <86cf1d97-2034-7791-071a-48208b6ba54b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.04.2021 19:39, Andrew Cooper wrote:
> On 27/04/2021 16:47, Jan Beulich wrote:
>> On 26.04.2021 19:54, Andrew Cooper wrote:
>>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>>> @@ -232,7 +232,7 @@ XEN_CPUFEATURE(UMIP,          6*32+ 2) /*S  User Mode Instruction Prevention */
>>>  XEN_CPUFEATURE(PKU,           6*32+ 3) /*H  Protection Keys for Userspace */
>>>  XEN_CPUFEATURE(OSPKE,         6*32+ 4) /*!  OS Protection Keys Enable */
>>>  XEN_CPUFEATURE(AVX512_VBMI2,  6*32+ 6) /*A  Additional AVX-512 Vector Byte Manipulation Instrs */
>>> -XEN_CPUFEATURE(CET_SS,        6*32+ 7) /*   CET - Shadow Stacks */
>>> +XEN_CPUFEATURE(CET_SS,        6*32+ 7) /*h  CET - Shadow Stacks */
>>>  XEN_CPUFEATURE(GFNI,          6*32+ 8) /*A  Galois Field Instrs */
>>>  XEN_CPUFEATURE(VAES,          6*32+ 9) /*A  Vector AES Instrs */
>>>  XEN_CPUFEATURE(VPCLMULQDQ,    6*32+10) /*A  Vector Carry-less Multiplication Instrs */
>>> @@ -267,7 +267,7 @@ XEN_CPUFEATURE(SRBDS_CTRL,    9*32+ 9) /*   MSR_MCU_OPT_CTRL and RNGDS_MITG_DIS.
>>>  XEN_CPUFEATURE(MD_CLEAR,      9*32+10) /*A  VERW clears microarchitectural buffers */
>>>  XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABORT */
>>>  XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*a  SERIALIZE insn */
>>> -XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
>>> +XEN_CPUFEATURE(CET_IBT,       9*32+20) /*h  CET - Indirect Branch Tracking */
>>>  XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
>>>  XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
>>>  XEN_CPUFEATURE(L1D_FLUSH,     9*32+28) /*S  MSR_FLUSH_CMD and L1D flush. */
>> If by the time 4.16 finishes up the various todo items haven't been
>> taken care of, should we take note to undo these markings? I would
>> have suggested allowing them for debug builds only, but that's kind
>> of ugly to achieve in a public header.
> 
> TBH, I still don't think this should be a public header.  If I would
> have forseen how much of a PITA is it, I would have argued harder
> against it.
> 
> It is, at best, tools-only (via SYSCTL_get_featureset), and I don't
> intend that interface to survive the tools ABI stabilisation  work, as
> it has been fully superseded by the cpu_policy interfaces and libx86.

Well - what features we expose is part of the (or at least something
like an) ABI. The actual numbering of course isn't (or shouldn't be).
I'm in no way opposed to moving the header out of public/ (and until
now I was of the impression that it was you who put it there), but if
we do I think we will want an alternative way of expressing which
extended features we support. I say this in particular because I think
SUPPORT.md doesn't lend itself to documenting support status at this
level of granularity. I'd much rather see that file refer to this
header, even if this may mean some difficulty to non-programmers.

> As for the max markings themselves, I'm not sure they ought to be
> debug-only.  Its important aspect of making guest support "tech preview"
> to ensure the logic works irrespective of CONFIG_DEBUG, and I think it
> is entirely fine for an experimental feature to be of status "your VM
> will explode if you enable this right now", even if that spills over
> into 4.17.

For a release I consider this undesirable. If a feature is in such a
state at the point of entering the RC phase, I think such markings
ought to be undone.

> In reality, once we've got {U,S}_CET context switching working at the
> Xen level, and {RD,WR}MSR plumbing done, it ought to be safe to people
> to turn on an experiment with.  At this point, we're in the position of
> "expected to work correctly in a subset of usecases".  I'd ideally like
> to get to this point before 4.16 releases, but that will be very subject
> to other work.

At _that_ point I could see the markings getting introduced outside
of debug builds, but still lower-case.

> All the emulator work is for cases that a VM won't encounter by default
> (Task Switch too, as Minix in the Intel Management Engine is the only
> known 32-bit CET-SS implementation).

Right, this is what is a prereq for the markings to become upper-case
ones (if - not specifically for the features here, but as a general
remark - we want them to become so ever in the first place) and the
features fully supported.

Jan

> Obviously, we want to get the checklist complete before enabling by
> default, but give the complexities in the emulator, I suspect we'll have
> a long gap between "believed can be used safely in a subset of cases",
> and "believed safe to use in general", and a long list of people happy
> to use it in a "doesn't work under introspection yet" state.
> 
> ~Andrew
> 



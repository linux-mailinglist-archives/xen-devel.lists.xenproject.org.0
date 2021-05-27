Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A52F7393193
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 16:57:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133539.248868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmHRg-0000U4-6y; Thu, 27 May 2021 14:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133539.248868; Thu, 27 May 2021 14:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmHRg-0000Rz-2y; Thu, 27 May 2021 14:57:12 +0000
Received: by outflank-mailman (input) for mailman id 133539;
 Thu, 27 May 2021 14:57:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmHRe-0000Rt-Hw
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 14:57:10 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 897c66c2-5982-4cc6-b08a-9f631f976dd1;
 Thu, 27 May 2021 14:57:09 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A83962190B;
 Thu, 27 May 2021 14:57:08 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 8785111A98;
 Thu, 27 May 2021 14:57:08 +0000 (UTC)
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
X-Inumbo-ID: 897c66c2-5982-4cc6-b08a-9f631f976dd1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622127428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=edcpG4jE4xc4ni/h6DdRIUcGzf0HxMC9hpuohG03o20=;
	b=t6DSoQuL5DpOBCpotCCpswGH/tcK3Zxyc6QR5jzKtnhnuol8sw722nghm0GgA+5I5DUFtL
	VLgxe57DS/TDTFDBbE75tBBXBzbpBDlBziUozNCZ4Q0EN6t7ILZlqQR87w4qsoYa5woNKw
	mONmev4Ah/F2Wykcr4uaqTYcxZ7GuOU=
Subject: Re: [PATCH] x86/AMD: expose SYSCFG, TOM, and TOM2 to Dom0
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Olaf Hering <olaf@aepfle.de>
References: <c5764274-1257-809e-a2a7-d87b9d0fe675@suse.com>
 <YK9ZXJuPk1G5SGnK@Air-de-Roger>
 <b6693807-95cb-7925-587d-1e1e2db8c798@suse.com>
 <YK+dNgom3cVzkcFF@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ca774a12-c054-3383-5f38-2c09b66be681@suse.com>
Date: Thu, 27 May 2021 16:57:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YK+dNgom3cVzkcFF@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.05.2021 15:23, Roger Pau Monné wrote:
> On Thu, May 27, 2021 at 12:41:51PM +0200, Jan Beulich wrote:
>> On 27.05.2021 10:33, Roger Pau Monné wrote:
>>> On Wed, May 26, 2021 at 02:59:00PM +0200, Jan Beulich wrote:
>>>> Sufficiently old Linux (3.12-ish) accesses these MSRs in an unguarded
>>>> manner. Furthermore these MSRs, at least on Fam11 and older CPUs, are
>>>> also consulted by modern Linux, and their (bogus) built-in zapping of
>>>> #GP faults from MSR accesses leads to it effectively reading zero
>>>> instead of the intended values, which are relevant for PCI BAR placement
>>>> (which ought to all live in MMIO-type space, not in DRAM-type one).
>>>>
>>>> For SYSCFG, only certain bits get exposed. In fact, whether to expose
>>>> MtrrVarDramEn is debatable: It controls use of not just TOM, but also
>>>> the IORRs. Introduce (consistently named) constants for the bits we're
>>>> interested in and use them in pre-existing code as well.
>>>
>>> I think we should also allow access to the IORRs MSRs for coherency
>>> (c001001{6,9}) for the hardware domain.
>>
>> Hmm, originally I was under the impression that these could conceivably
>> be written by OSes, and hence would want dealing with separately. But
>> upon re-reading I see that they are supposed to be set by the BIOS alone.
>> So yes, let me add them for read access, taking care of the limitation
>> that I had to spell out.
>>
>> This raises the question then though whether to also include SMMAddr
>> and SMMMask in the set - the former does get accessed by Linux as well,
>> and was one of the reasons for needing 6eef0a99262c ("x86/PV:
>> conditionally avoid raising #GP for early guest MSR reads").
> 
> That seems fine, we might also want SMM_BASE?

That's pretty unrelated to the topic here - there's no memory type
or DRAM vs MMIO decision associated with that register. I'm also
having trouble seeing what an OS would want to use SMM's CS value
for.

>> Especially for SMMAddr, and maybe also for IORR_BASE, returning zero
>> for DomU-s might be acceptable. The respective masks, however, can
>> imo not sensibly be returned as zero. Hence even there I'd leave DomU
>> side handling (see below) for a later time.
> 
> Sure. I think for consistency we should however enable reading the
> hardware IORR MSRs for the hardware domain, or else returning
> MtrrVarDramEn set is likely to cause trouble as the guest could assume
> IORRs to be unconditionally present.

Well, yes, I've added IORRs already, as I was under the impression
that we were agreeing already that we want to expose them to Dom0.

>>>> As a welcome side effect, verbosity on/of debug builds gets (perhaps
>>>> significantly) reduced.
>>>>
>>>> Note that at least as far as those MSR accesses by Linux are concerned,
>>>> there's no similar issue for DomU-s, as the accesses sit behind PCI
>>>> device matching logic. The checked for devices would never be exposed to
>>>> DomU-s in the first place. Nevertheless I think that at least for HVM we
>>>> should return sensible values, not 0 (as svm_msr_read_intercept() does
>>>> right now). The intended values may, however, need to be determined by
>>>> hvmloader, and then get made known to Xen.
>>>
>>> Could we maybe come up with a fixed memory layout that hvmloader had
>>> to respect?
>>>
>>> Ie: DRAM from 0 to 3G, MMIO from 3G to 4G, and then the remaining
>>> DRAM from 4G in a contiguous single block?
>>>
>>> hvmloader would have to place BARs that don't fit in the 3G-4G hole at
>>> the end of DRAM (ie: after TOM2).
>>
>> Such a fixed scheme may be too limiting, I'm afraid.
> 
> Maybe, I guess a possible broken scenario would be for a guest to be
> setup with a set of 32bit BARs that cannot possibly fit in the 3-4G
> hole, but I think that's unlikely.

Can't one (almost) arbitrarily size the amount of VRAM of the emulated
VGA? I wouldn't be surprised if this can't be placed above 4Gb.

Jan


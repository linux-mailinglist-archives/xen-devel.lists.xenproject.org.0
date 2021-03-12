Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A47338EED
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 14:35:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97125.184329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKhwN-0003VJ-1I; Fri, 12 Mar 2021 13:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97125.184329; Fri, 12 Mar 2021 13:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKhwM-0003Uu-Tw; Fri, 12 Mar 2021 13:34:54 +0000
Received: by outflank-mailman (input) for mailman id 97125;
 Fri, 12 Mar 2021 13:34:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F/Rg=IK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKhwM-0003Up-BN
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 13:34:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61a7c494-ef73-4297-9d95-5fadc8e905bb;
 Fri, 12 Mar 2021 13:34:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1DC5EB034;
 Fri, 12 Mar 2021 13:34:52 +0000 (UTC)
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
X-Inumbo-ID: 61a7c494-ef73-4297-9d95-5fadc8e905bb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615556092; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fsOOmVOBABtxanD9QlgqtucNM8425swHUVRB7f2ll4M=;
	b=Lw1TyaZNuh3VPuznwgAbCQVpxgnkMfd5H2eKAk4yxQztjLRjdnCEdoTG8lijkSjLQn/VPa
	K3cNziUl63LTlfNK+CO3Vkc7F/ODV/Xp9veWrEMmcbFjif69wpBNKfGGXIbMBgAAWQfH8E
	MctENzAm5GGt7cVxK04zrF2U5kg7SFM=
Subject: Re: [PATCH v3 1/2][4.15] x86/PV: conditionally avoid raising #GP for
 early guest MSR reads
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7a84bc56-0045-2111-6888-8db830335ad1@suse.com>
 <90f87aa8-09da-1453-bd82-c722465c2881@suse.com>
 <7504b027-f106-33e1-214a-eecf8ea5ff5d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e551fbbd-b0b4-e7fb-260c-4d7eb7b74c20@suse.com>
Date: Fri, 12 Mar 2021 14:34:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <7504b027-f106-33e1-214a-eecf8ea5ff5d@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12.03.2021 12:19, Andrew Cooper wrote:
> On 12/03/2021 07:54, Jan Beulich wrote:
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
>> the raising of #GP on this paths conditional upon the guest having
>> installed a handler, provided of course the MSR can be read in the first
>> place (we would have raised #GP in that case even before). Producing
>> zero for reads isn't necessarily correct and may trip code trying to
>> detect presence of MSRs early, but since such detection logic won't work
>> without a #GP handler anyway, this ought to be a fair workaround.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> I am still of the firm belief that this is the wrong course of action.
> 
> It is deliberately papering over error handling bugs which, in the
> NetBSD case, literally created memory corruption scenarios.  (Yes - that
> was a WRMSR not RDMSR, but the general point still stands, particularly
> in light of your expectation to do the same to the WRMSR).
> 
> It is one thing to not realise that we have a trainwreck here.  Its
> totally another to take wilful action to keep current and all future
> guests broken in the same way.
> 
> The *only* case where it is acceptable to skip error handling is if the
> VM admin has specifically signed their life away to say that they'll
> accept the, now discovered, potential-memory-corrupion consequences.
> 
> Rogers patch already does this.

With _much_ bigger impact - it requires changing the behavior for the
entire lifetime of the domain, rather than just very early boot. And
as you may have seen, despite my fear that it may not be enough, Roger
and I have agreed to leave the WRMSR path alone.

Jan


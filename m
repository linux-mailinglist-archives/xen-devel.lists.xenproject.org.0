Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2217C3298A2
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 10:59:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92229.174001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH1of-0006xs-Tm; Tue, 02 Mar 2021 09:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92229.174001; Tue, 02 Mar 2021 09:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH1of-0006xT-Qc; Tue, 02 Mar 2021 09:59:45 +0000
Received: by outflank-mailman (input) for mailman id 92229;
 Tue, 02 Mar 2021 09:59:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lH1oe-0006xO-0i
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 09:59:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 204ac472-efce-46a1-a494-63e22654fb5c;
 Tue, 02 Mar 2021 09:59:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DBA4FAAC5;
 Tue,  2 Mar 2021 09:59:37 +0000 (UTC)
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
X-Inumbo-ID: 204ac472-efce-46a1-a494-63e22654fb5c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614679178; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jIvbhuwtHC10Th47xyFwLVZVOw7nEaNqt4wmiMaGGS8=;
	b=fthk2TpRcXcrzEjET/AjTBCaAn1CrujaYRJFOSYHUenB2AXcXw+lTfF1gMvlZLBWkNuT8d
	RVEXlISfQLv2u1fpFJsg7bBz3f4ld4qTq4Jod+NpD9ctQiDOCriO/RGauvMDdI5L9eReUV
	nmfHKN7y04yj4mc+eGgn3jewRTrKyY8=
Subject: Re: [PATCH 2/2][4.15?] x86: fix build when NR_CPUS == 1
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <ad59eaf9-747c-f60e-16b7-121c9f86a1e0@suse.com>
 <1d8d5089-32a9-9c42-5949-8f9cd20f33e0@suse.com>
 <YDzzt1CXau8vKCn1@Air-de-Roger>
 <a0664115-2b36-7a56-2814-bb234fb379cf@suse.com>
 <YD0rtgJgIN2FxEex@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9b0a5689-fced-d986-3bfb-9ade47cf3635@suse.com>
Date: Tue, 2 Mar 2021 10:59:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YD0rtgJgIN2FxEex@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.03.2021 19:00, Roger Pau Monné wrote:
> On Mon, Mar 01, 2021 at 04:14:26PM +0100, Jan Beulich wrote:
>> On 01.03.2021 15:01, Roger Pau Monné wrote:
>>> On Mon, Mar 01, 2021 at 09:31:07AM +0100, Jan Beulich wrote:
>>>> In this case the compiler is recognizing that no valid array indexes
>>>> remain (in x2apic_cluster()'s access to per_cpu(cpu_2_logical_apicid,
>>>> ...)), but oddly enough isn't really consistent about the checking it
>>>> does (see the code comment).
>>>
>>> I assume this is because of the underlying per_cpu access to
>>> __per_cpu_offset using cpu as the index, in which case wouldn't it be
>>> better to place the BUG_ON there?
>>
>> Not sure, to be honest. It seemed more logical to me to place it
>> next to where the issue is.
> 
> I'm not sure whether I would prefer to place it in per_cpu directly to
> avoid similar issues popping up in other parts of the code in the
> future?

That's going to be a lot of BUG_ON(), and hence a lot of "ud2"
instances. Not something I'm keen on having. The more that it's
not the per_cpu() which triggers the warning, but separate
conditionals allowing the compiler to deduce value ranges of
variables.

> Maybe that's not likely. TBH it seems kind of random to be placing
> this BUG_ON conditionals to make the compilers happy, but maybe
> there's no other option.

In principle I agree - hence the longish comment.

>>> Also I wonder why the accesses the same function does to the per_cpu
>>> area before the modified chunk using this_cpu as index don't also
>>> trigger such warnings.
>>
>> The compiler appears to be issuing the warning when it can prove
>> that no legitimate index can make it to a respective use. in this
>> case it means that is is
>>
>>         if ( this_cpu == cpu )
>>             continue;
>>
>> which makes it possible for the compiler to know that what gets
>> past this would be an out of bounds access, since for NR_CPUS=1
>> both this_cpu and cpu can only validly both be zero. (This also
>> plays into my choice of placement, because it is not
>> x2apic_cluster() on its own which has this issue.)
> 
> I see, thanks for the explanation. It makes me wonder whether other
> random issues like this will pop up in other parts of the code. We
> should have a gitlab build with NR_CPUS=1 in order to assert we don't
> regress it. Speaking for myself I certainly won't be able to detect
> whether something broke this support in the future.

I guess I'll carry on having such a build test locally.

Jan


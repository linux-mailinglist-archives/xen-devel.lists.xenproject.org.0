Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7459F30875E
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 10:33:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77834.141254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Q9w-0007FT-W1; Fri, 29 Jan 2021 09:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77834.141254; Fri, 29 Jan 2021 09:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Q9w-0007Eu-RX; Fri, 29 Jan 2021 09:33:44 +0000
Received: by outflank-mailman (input) for mailman id 77834;
 Fri, 29 Jan 2021 09:33:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5Q9v-0007Em-PW
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 09:33:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 435d8385-a2cb-419f-93b4-ad9d0f52f1d8;
 Fri, 29 Jan 2021 09:33:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C379AD78;
 Fri, 29 Jan 2021 09:33:41 +0000 (UTC)
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
X-Inumbo-ID: 435d8385-a2cb-419f-93b4-ad9d0f52f1d8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611912821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T5qs1abywbWk1Bl02KuLP2UuuhoAWnVf8NxdEO4H1ZA=;
	b=qlVo0goPC2o7ZInNp4JDmzAUhdPEjb1AXsXp0C6zRgh9pRxWlu7DekQ/2Cosgup+SbMxRr
	Fp0pTxWAsa5nZwhW8p0vS61CSPk9m1KHUWG9ZSpthCHpN1mjF4CH3KJ6A/TLN110QIUT8u
	4AIEQmsthHzRdatZFT88zLlFmn3gzKY=
Subject: Re: [PATCH v3 1/7] xen/gnttab: Rework resource acquisition
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210112194841.1537-1-andrew.cooper3@citrix.com>
 <20210112194841.1537-2-andrew.cooper3@citrix.com>
 <6321bce7-1826-be38-622e-088d492fb0c9@suse.com>
 <a96bed35-df20-e77b-1b98-593aa5649ad9@citrix.com>
 <57895dd4-10c7-18cb-bc44-25a45cb688a7@suse.com>
 <d85313ae-295e-d3d1-f041-67d6814b959c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <94faed88-5323-a6a2-6627-4ef3a6a07d78@suse.com>
Date: Fri, 29 Jan 2021 10:33:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <d85313ae-295e-d3d1-f041-67d6814b959c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.01.2021 23:56, Andrew Cooper wrote:
> On 18/01/2021 08:23, Jan Beulich wrote:
>> On 15.01.2021 17:57, Andrew Cooper wrote:
>>> On 15/01/2021 11:56, Jan Beulich wrote:
>>>>> +    /* Grow table if necessary. */
>>>>> +    grant_write_lock(gt);
>>>>> +    rc = -EINVAL;
>>>>> +    switch ( id )
>>>>> +    {
>>>>> +    case XENMEM_resource_grant_table_id_shared:
>>>>> +        vaddrs = gt->shared_raw;
>>>>> +        rc = gnttab_get_shared_frame_mfn(d, tot_frames - 1, &tmp);
>>>> ... this will degenerate (and still cause an error) when frame
>>>> is also zero, and will cause undue growing of the table when
>>>> frame is non-zero yet not overly large.
>>> Urgh, yes - that is why I had the check.
>>>
>>> In which case I retract my change between v2 and v3 here.
>>>
>>>> As indicated before, I'm of the clear opinion that here - like
>>>> elsewhere - a number of zero frames requested means that no
>>>> action be taken at all, and success be returned.
>>> The general world we work in (POSIX) agrees with my opinion over yours
>>> when it comes to this matter.
>> I assume you are referring to mmap()? I ask because I think there
>> are numerous counter examples (some even in the C standard):
>> malloc() & friends allow for either behavior. memcpy() / memmove()
>> ...
> 
> This entire infrastructure lives behind an mmap() (or equivalent) system
> call.  Other specs are not relevant.

With this you're implying restrictions on what callers might
use this for. I don't see why a ring-0 only environment
would necessarily have anything like mmap().

Anyway, I'm not going to further comment on any of the below.
I'm not going to either ack or nak this change, so if you
have the agreement of others feel free to put in.

Jan

> Any request for a zero sized mapping is a bug.  It is either a buggy
> caller, or buggy continuation logic.
> 
>>> I spent a lot of time and effort getting this logic correct in v2, and I
>>> do not have any further time to waste adding complexity to support a
>>> non-existent corner case, nor is it reasonable to further delay all the
>>> work which is depending on this series.  This entire mess is already too
>>> damn complicated, without taking extra complexity.
>>>
>>> Entertaining the idea of supporting 0 length requests is really not as
>>> simple as you seem to think it is, and is a large part of why I'm
>>> stubbornly refusing to do so.
>> I'd be really happy to be educated of the complications; sadly
>> so far you've only claimed ones would exist without actually
>> going into sufficient detail. In particular I don't view placing 
>>
>>     if ( size == 0 )
>>         return 0;
>>
>> suitably early coming anywhere near "complexity". Even more so
>> that as per your reply you mean to undo removal of a respective
>> check, just that in your version it'll return an error instead
>> of success.
> 
> I am not being a belligerent arse for the sake of it.  I've got far
> better things I ought to be doing with my time.
> 
> I spent a lot of time getting this working, and with sufficient testing
> to demonstrate it working in practice, particularly in continuation cases.
> 
> You've spent a lot of time and effort insisting that I reintroduce
> support a fundamentally broken corner case, despite my best attempts to
> demonstrate why it will livelock in the hypervisor because of the mess
> which is the double looping between the compat and native handlers.
> 
> You've also spent a lot of time obfuscating the overflow checks and
> breaking them in the process.
> 
> You are welcome, in your own time - and not mine, to use the testing
> infrastructure I've already provided to discover why the compat mess has
> a habit of livelocking in certain continuation cases.  (It won't
> actually livelock if you switch to using return 0.  You'll instead hit
> the ASSERT_UNREACHABLE() I put in a failsafe path specifically to avoid
> bugs in this are turning back into XSAs.)
> 
> Combined with the fact that 0 length requests are buggy in all
> circumstances, I chose to implement logic which is robust even in the
> case of failure, because the compat logic is almost intractable and
> borderline untestable because noone runs 32bit kernels in anger these
> days.  I can't commit my test infrastructure which spots the problems,
> because we obviously can't have a hypercall which panics when the input
> buffer doesn't match the test pattern.
> 
> I am not inclined to adopt an approach which is fundamentally more
> likely to contain security vulnerabilities in a fragile and untestable
> area of code.  You are going to have to come up with a far more
> compelling argument that "because I want to support 0 length mapping
> requests" to change my mind.
> 
> ~Andrew
> 



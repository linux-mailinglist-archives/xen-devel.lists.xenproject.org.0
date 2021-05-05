Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4A13735B2
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 09:40:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122812.231652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leC7b-0002B7-DN; Wed, 05 May 2021 07:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122812.231652; Wed, 05 May 2021 07:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leC7b-00028a-9z; Wed, 05 May 2021 07:39:03 +0000
Received: by outflank-mailman (input) for mailman id 122812;
 Wed, 05 May 2021 07:39:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6083=KA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1leC7a-00028U-1R
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 07:39:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d129cc43-c15c-41b4-bcb6-3c6dc79fb36b;
 Wed, 05 May 2021 07:39:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 14D49AFB1;
 Wed,  5 May 2021 07:39:00 +0000 (UTC)
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
X-Inumbo-ID: d129cc43-c15c-41b4-bcb6-3c6dc79fb36b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620200340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4HW9WrgK6dvz0OuYcED+vbJDOMECKjTtfnLHOgyY0xE=;
	b=qL2CXqgHfBn5ahfIjh28uS2e1Fi+8cOpsDhpl/1nv8hraITM23Yx4nmekvLFu/ua0DThbV
	lRWra5HIr0ldMhIa2RADkI7hjPmnyqTyxqN6urf6drBfG6tzB9w69X4lkkkRMRnoUKry28
	n+ou1qrXNegKPk6EHcKbRMbaKFq5vpE=
Subject: Re: [PATCH v3 03/13] libs/guest: allow fetching a specific MSR entry
 from a cpu policy
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20210430155211.3709-1-roger.pau@citrix.com>
 <20210430155211.3709-4-roger.pau@citrix.com>
 <273ba6f9-dee9-00db-407b-10325d21afae@suse.com>
 <YJEoS6P1S6NbySFd@Air-de-Roger>
 <54c48a0f-075f-c379-eeb4-60b4439d8907@suse.com>
 <YJE20/M+OCER2vPn@Air-de-Roger>
 <66d6596b-5d90-7bf8-a383-ce2b6b1fe03f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <05b49cd5-31cb-1bf7-c678-846c18a88fbc@suse.com>
Date: Wed, 5 May 2021 09:38:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <66d6596b-5d90-7bf8-a383-ce2b6b1fe03f@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.05.2021 19:11, Andrew Cooper wrote:
> On 04/05/2021 12:58, Roger Pau Monné wrote:
>> On Tue, May 04, 2021 at 01:40:11PM +0200, Jan Beulich wrote:
>>> On 04.05.2021 12:56, Roger Pau Monné wrote:
>>>> On Mon, May 03, 2021 at 12:41:29PM +0200, Jan Beulich wrote:
>>>>> On 30.04.2021 17:52, Roger Pau Monne wrote:
>>>>>> --- a/tools/libs/guest/xg_cpuid_x86.c
>>>>>> +++ b/tools/libs/guest/xg_cpuid_x86.c
>>>>>> @@ -850,3 +850,45 @@ int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t policy,
>>>>>>      *out = *tmp;
>>>>>>      return 0;
>>>>>>  }
>>>>>> +
>>>>>> +static int compare_entries(const void *l, const void *r)
>>>>>> +{
>>>>>> +    const xen_msr_entry_t *lhs = l;
>>>>>> +    const xen_msr_entry_t *rhs = r;
>>>>>> +
>>>>>> +    if ( lhs->idx == rhs->idx )
>>>>>> +        return 0;
>>>>>> +    return lhs->idx < rhs->idx ? -1 : 1;
>>>>>> +}
>>>>>> +
>>>>>> +static xen_msr_entry_t *find_entry(xen_msr_entry_t *entries,
>>>>>> +                                   unsigned int nr_entries, unsigned int index)
>>>>>> +{
>>>>>> +    const xen_msr_entry_t key = { index };
>>>>>> +
>>>>>> +    return bsearch(&key, entries, nr_entries, sizeof(*entries), compare_entries);
>>>>>> +}
>>>>> Isn't "entries" / "entry" a little too generic a name here, considering
>>>>> the CPUID equivalents use "leaves" / "leaf"? (Noticed really while looking
>>>>> at patch 7.)
>>>> Would you be fine with naming the function find_msr and leaving the
>>>> rest of the parameters names as-is?
>>> Yes. But recall I'm not the maintainer of this code anyway.
> 
> This file in particular has been entirely within the x86 remit for
> multiple years now, as have the other cpuid bits in misc/ and libxl.

Well, it's somewhere in the middle imo: Its maintainers have kind of
permanently delegated to the x86 maintainers. Which still doesn't
make it part of "X86 ARCHITECTURE" until such time as the file gets
actually named there. Note how e.g. tools/misc/xen-cpuid.c already is.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F631FD135
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 17:48:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlaHC-0000kb-6a; Wed, 17 Jun 2020 15:46:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RQSQ=76=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jlaHA-0000kW-So
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 15:46:56 +0000
X-Inumbo-ID: c2d0a776-b0b1-11ea-b9f7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2d0a776-b0b1-11ea-b9f7-12813bfff9fa;
 Wed, 17 Jun 2020 15:46:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B1CC5AB76;
 Wed, 17 Jun 2020 15:46:54 +0000 (UTC)
Subject: Re: [PATCH for-4.14] x86/hap: use get_gfn_type in
 hap_update_paging_modes
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <6a2ae3bae4a4ad32bc7caecd8af2655a76a9fb19.1592335579.git.tamas.lengyel@intel.com>
 <a35d0df9-ca56-1d64-99a0-d2d744ab2186@suse.com>
 <CABfawhnXg+-HZzOhVyYreQtc6BE1xAyS5rJdQkE+1QNZA=iOnw@mail.gmail.com>
 <4b06e4f3-2b23-359a-9d80-c881016c0d91@suse.com>
 <CABfawh=AkBQ6iCOdWpjGvyXykePc7wVC-SZEn13_=q+P-zW4JA@mail.gmail.com>
 <47abe61b-76e1-4491-f539-60c427c2ffc8@suse.com>
 <CABfawhki5+wv9cfivbxRhMurqYD4Ls4o5OUG9e-cV5SPzeG9jw@mail.gmail.com>
 <17dab1c9-175a-3faa-3937-9102e09f72b0@suse.com>
 <CABfawhk4N9MsjWqf87hPpyEHP27E=SpiHUSC+bVhAh4xW9-n8w@mail.gmail.com>
 <15ff55e0-2b75-b1dd-9fa5-3b50f7aa8d9c@suse.com>
 <CABfawhk=hk4qWjQQpamQO+EiZO=7=2j4_aezjr5a+YFmYfHjsw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fce071de-336e-ddf0-0513-f2357b1937e9@suse.com>
Date: Wed, 17 Jun 2020 17:46:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CABfawhk=hk4qWjQQpamQO+EiZO=7=2j4_aezjr5a+YFmYfHjsw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.06.2020 16:49, Tamas K Lengyel wrote:
> On Wed, Jun 17, 2020 at 8:24 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 17.06.2020 15:43, Tamas K Lengyel wrote:
>>> On Wed, Jun 17, 2020 at 7:36 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 17.06.2020 15:31, Tamas K Lengyel wrote:
>>>>> On Wed, Jun 17, 2020 at 7:28 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>
>>>>>> On 17.06.2020 15:21, Tamas K Lengyel wrote:
>>>>>>> On Wed, Jun 17, 2020 at 7:04 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>>>
>>>>>>>> On 17.06.2020 15:00, Tamas K Lengyel wrote:
>>>>>>>>> On Wed, Jun 17, 2020 at 3:59 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>>>>> If there are code paths of both kinds, which approach to use in
>>>>>>>>>> vmx_load_pdptrs() may need to be chosen based on what
>>>>>>>>>> paging_locked_by_me() returns. Or perhaps an unlocked query is
>>>>>>>>>> fine in either case?
>>>>>>>>>
>>>>>>>>> Perhaps adjusting vmx_load_pdptrs to chose the unlocked query would be
>>>>>>>>> fine. But at that point what is the reason for having the lock
>>>>>>>>> ordering at all? Why not just have a single recursive lock and avoid
>>>>>>>>> issues like this altogether?
>>>>>>>>
>>>>>>>> With just a single lock, contention problems we already know we
>>>>>>>> have would be even worse. When the current locking model was
>>>>>>>> introduced, there was actually a plan to make gfn_lock() more
>>>>>>>> fine-grained (i.e. not simply "de-generate" to p2m_lock()), for
>>>>>>>> example.
>>>>>>>
>>>>>>> Sigh. Well, I've been checking and adjust vmx_load_pdptrs to use an
>>>>>>> unlocked query doesn't seem as straightforward because, well, there is
>>>>>>> no unlocked version of p2m_get_page_from_gfn which would also do the
>>>>>>> "fixups".
>>>>>>
>>>>>> Which fixups do we need here, in particular? Of course, whenever
>>>>>> any fixups get done, the operation can't be lock-less.
>>>>>>
>>>>>>> What seems redundant to me though is that
>>>>>>> hap_update_paging_modes takes both the p2m_lock via get_gfn PLUS the
>>>>>>> paging_lock. Does it really need to take the paging_lock?
>>>>>>
>>>>>> From mm-locks.h's comments:
>>>>>>
>>>>>>  * For HAP, it protects the NPT/EPT tables and mode changes.
>>>>>
>>>>> We do the population of the EPT as part of fork_page() if there was a
>>>>> hole in the p2m when the query was issued using P2M_ALLOC (or
>>>>> P2M_UNSHARE). I checked and without the paging lock held it throws up
>>>>> at hap_alloc's ASSERT.. So yea, currently I don't think we have a
>>>>> better route then what I currently sent in.
>>>>
>>>> You didn't answer my question regarding the "fixups" needed, so
>>>> for the moment it's not clear to me yet whether indeed there's
>>>> no better way.
>>>
>>> Umm, I did. The fixups entail populating the EPT from the parent as I
>>> described above.
>>
>> Isn't this taken care of by the new call to get_gfn_type() which you add?
>> As said before, I think at the point we want to obtain the PDPTs all
>> other adjustments and arrangements should have been done already, by
>> higher layers. This code should have no need to do anything beyond a
>> simple lookup.
> 
> I don't really know what else to say. There are multiple paths leading
> to vmx_load_pdptrs, some take the paging_lock while some don't. In
> this particular case we can do the fixups earlier as I do in this
> patch because there happens to be a lookup before the paging_lock is
> taken but in other cases there isn't such a route so removing
> P2M_UNSHARE from vmx_load_pdptrs is not an option.

I disagree (because such missing unshare requests could be put
elsewhere), but let me ask another question then: Why is it that
vmx_load_pdptrs() needs to unshare? The function only reads from
the page. Even if the page's content changed later on, we wouldn't
care, as there's no coherence of the PDPTRs once loaded.

Jan


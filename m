Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7861BDD24
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 15:07:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTmQQ-0005la-Gc; Wed, 29 Apr 2020 13:06:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fvgr=6N=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jTmQP-0005lP-3a
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 13:06:53 +0000
X-Inumbo-ID: 4a4d6b09-8a1a-11ea-9943-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a4d6b09-8a1a-11ea-9943-12813bfff9fa;
 Wed, 29 Apr 2020 13:06:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E4468ACD0;
 Wed, 29 Apr 2020 13:06:49 +0000 (UTC)
Subject: Re: [PATCH] tools/xenstore: don't store domU's mfn of ring page in
 xensotred
To: Igor Druzhinin <igor.druzhinin@citrix.com>, Julien Grall
 <julien@xen.org>, Julien Grall <julien.grall.oss@gmail.com>
References: <20200428155144.8253-1-jgross@suse.com>
 <CAJ=z9a0WfWQs+UJ-t4Kt6PGGdNnA2kMeK5p8bNnDT_eFcpDiiQ@mail.gmail.com>
 <d1c41bd7-676e-c50a-416d-c62efcbdd41d@suse.com>
 <76ed29d6-e2fc-cd48-6de7-e0032daaa2e9@xen.org>
 <3fd79cb1-e18f-1987-69ff-94f1bd15c66f@citrix.com>
 <3dcbe001-c66c-13a6-7a28-ef24b05eefa0@suse.com>
 <c07e5106-d8de-f6a7-e406-b25ee9ff6d49@citrix.com>
 <f80aff47-8617-8f59-0d34-bf0385128b62@suse.com>
 <a23c3d72-f5c8-5c3f-2c2f-5a9ca1065d1f@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0f553a2e-9541-8d47-c354-0e8273b4b783@suse.com>
Date: Wed, 29 Apr 2020 15:06:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a23c3d72-f5c8-5c3f-2c2f-5a9ca1065d1f@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.04.20 14:49, Igor Druzhinin wrote:
> On 29/04/2020 13:29, Jürgen Groß wrote:
>> On 29.04.20 13:04, Igor Druzhinin wrote:
>>> On 29/04/2020 11:49, Jürgen Groß wrote:
>>>> On 29.04.20 12:39, Igor Druzhinin wrote:
>>>>> On 29/04/2020 10:22, Julien Grall wrote:
>>>>>> Hi Juergen,
>>>>>>
>>>>>> On 29/04/2020 06:51, Jürgen Groß wrote:
>>>>>>>
>>>>>>> Recreating the event channel would be fine, but I don't see why it
>>>>>>> would ever be needed. And XS_INTRODUCE is called only at domain creation
>>>>>>> time today, so there is obviously no need for repeating this call.
>>>>>>>
>>>>>>> Maybe the idea was to do this after sending a XS_RESUME command, which
>>>>>>> isn't used anywhere in Xen and is another part of Xenstore which doesn't
>>>>>>> make any sense today.
>>>>>>
>>>>>> Commit f6cc37ea8ac71385b60507c034519f304da75f4c "tools/oxenstored: port XS_INTRODUCE evtchn rebind function from cxenstored" added the exact same behavior in the OCaml XenStored last year.
>>>>>>
>>>>>> This was introduced 12 years after C XenStored, so surely someone think this is useful. We should check why this was introduced in OCaml XenStored (I have CCed the author of the patch).
>>>>>>
>>>>>> If we still think this is not useful, then you should add an explanation in the commit message why the two implementations diverge and possibly update the spec.
>>>>>
>>>>> Thanks for CC, Julien.
>>>>>
>>>>> We indeed already use this functionality in our toolstack for guest kdump
>>>>> functions. It's not possible in XAPI to adopt libxl model where almost everything
>>>>> is restarted for a domain entering kdump, so we have to use this message to
>>>>> rebind xenstore evtchn after soft reset without shutting down backends and
>>>>> recreating the whole subtree (frontends reconnect fine after that).
>>>>>
>>>>> We obviously only require it for now to be present in oxenstored only.
>>>>> Please don't remove this functionality if possible.
>>>>
>>>> If I read handling in libxl correctly, in the soft reset case XS_RELEASE
>>>> is issued before doing another XS_INTRODUCE. XS_RELEASE will result in
>>>> xenstored throwing away its related struct domain, so XS_INTRODUCE will
>>>> be possible again.
>>>
>>>   From what I remember it was not possible to keep xenstored data for a domain
>>> and at the same time perform release-introduce cycle (at least in oxenstored).
>>> It also involved firing @releaseDomain which caused havoc in other part of
>>> the toolstack.
>>
>> Wei, Ian, can you please tell me where I'm wrong?
>>
>> A soft reset should restart the domain in a clean state. AFAIK libxl is
>> handling that by doing kind of in-place save-restore, including calling
>> xs_release_domain() and later xs_introduce_domain(). This should result
>> in xenstored throwing away all state it has regarding the domain and
>> then restarting with a new (internal) domain instance.
>>
>> Is XAPI doing soft reset differently? Why should there be a need for
>> keeping xenstored data across a soft reset?
> 
> Yes, XAPI is doing soft reset differently from libxl. You need to keep xenstore
> data to at least keep backends working without the need to reinitialize them
> before entering kdump kernel. We do the same thing while entering crash kernel
> in Windows after BSOD (CC Paul as he recommended this approach).
> There are other reasons to not reset xenstore data.
> 
> I considered XS_INTRODUCE functionality to be part of xenstored ABI and we built
> a lot of infrastructure on top of that. So I don't think it could be easily removed now.

Nobody wants to remove XS_INTRODUCE. It was just questioned there is a
need to call XS_INTRODUCE multiple times for a domain without a call of
XS_RELEASE in between.

In case there is such a need this means we either should just drop the
test for the mfn to match and recreate the event-channel (which will do
no harm IMO), or we need to keep the mfn in the live-update state record
with the knowledge that it is far from being a good indicator for the
test whether a domain is known already or not (two HVM domains using a
similar configuration with the very same kernel will use the same gfn
probably).

As only dom0 is allowed to use XS_INTRODUCE and I'm not aware of any
problems with neither XS_INTRODUCE failing due to illegal calls (no mfn
match), nor with potentially recreating the event channel for a "wrong"
domain, I suggest to just allow XS_INTRODUCE to be called as often as
the toolstack wants to.

In the end that was the primary reason to write this patch: to remove
the need to have the mfn in the live-update state record.

Thoughts?


Juergen


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A806B2745F4
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 18:01:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKkjL-0001Vr-J7; Tue, 22 Sep 2020 16:01:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kKkjJ-0001Vm-P4
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 16:01:21 +0000
X-Inumbo-ID: 46de4eeb-aaaf-4310-9c37-a84be665022b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46de4eeb-aaaf-4310-9c37-a84be665022b;
 Tue, 22 Sep 2020 16:01:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600790479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T5dqHXmfDecfQKmJbZUMvwQyW2ogqJ3VEw8d6Ga4Aoo=;
 b=YbdhQY0HYoeKm1edc+/fk/DI/eraHs4x0I+he3La0CBlhRVpGjIRENuXEpGPnMmSC/Gnim
 7KOItjMZ4E+4QW63KBem9Re7zC4yJlvwjOwy6sVuNuEYGuiuJBVe2j1eU9Hzisos49kcYN
 qCzJzddibacPbdmEW3lsc2zaVZBK+4s=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9870AAD33;
 Tue, 22 Sep 2020 16:01:56 +0000 (UTC)
Subject: Re: [PATCH 2/5] xen/gnttab: Rework resource acquisition
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-3-andrew.cooper3@citrix.com>
 <784bf5c1-be13-2c09-5494-6eb64c400473@suse.com>
 <17123e43-ca3e-4075-ad36-45e324bb6214@citrix.com>
 <cab7113e-9d0a-954c-c62d-115d7f734787@suse.com>
 <b6180c01-9d85-6ae0-6122-7ca688c86b10@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <241032c4-d76c-57f1-8405-dae12e6729c9@suse.com>
Date: Tue, 22 Sep 2020 18:01:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b6180c01-9d85-6ae0-6122-7ca688c86b10@citrix.com>
Content-Type: text/plain; charset=utf-8
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.09.2020 16:50, Andrew Cooper wrote:
> On 22/09/2020 14:34, Jan Beulich wrote:
>> On 22.09.2020 15:10, Andrew Cooper wrote:
>>> On 29/07/2020 21:02, Jan Beulich wrote:
>>>> On 28.07.2020 13:37, Andrew Cooper wrote:
>>>>> --- a/xen/common/grant_table.c
>>>>> +++ b/xen/common/grant_table.c
>>>>> @@ -4013,6 +4013,72 @@ static int gnttab_get_shared_frame_mfn(struct
>>>>> domain *d,
>>>>>       return 0;
>>>>>   }
>>>>>   +int gnttab_acquire_resource(
>>>>> +    struct domain *d, unsigned int id, unsigned long frame,
>>>>> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
>>>>> +{
>>>>> +    struct grant_table *gt = d->grant_table;
>>>>> +    unsigned int i = nr_frames, tot_frames;
>>>>> +    void **vaddrs;
>>>>> +    int rc = 0;
>>>>> +
>>>>> +    /* Input sanity. */
>>>>> +    if ( !nr_frames )
>>>>> +        return -EINVAL;
>>>> I can't seem to be able to find an equivalent of this in the old logic,
>>>> and hence this looks like an unwarranted change in behavior to me. We
>>>> have quite a few hypercall ops where some count being zero is simply
>>>> a no-op, i.e. yielding success without doing anything.
>>> There is no possible circumstance when getting here requesting 0 is
>>> legitimate.
>>>
>>> Tolerating a zero input for a mapping request is a very expensive way of
>>> hiding caller bugs.
>> That's just one possible view.
> 
> ... that is fully enforced in the ecosystem we work in.
> 
> You can't get a 0 to here in the first place.

Would you mind pointing me at why this is? All I can see is

    if ( xmar.nr_frames > ARRAY_SIZE(mfn_list) )
        return -E2BIG;

as far as the caller's argument checking goes here. And
acquire_grant_table(), which is what you're replacing, also is dealing
with zero quite fine afaics. As is arch_acquire_resource().

> However, when it comes to the XLAT and the chunking fixes, getting 0
> here is a hard error, and I'm not interested in breaking the that logic
> for a non-existent corner case.

I don't share this view. It's also interesting that you had to address
similar questions by Paul, isn't it?

Jan


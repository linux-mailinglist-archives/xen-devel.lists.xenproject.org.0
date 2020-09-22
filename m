Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7E8274336
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 15:34:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKiRN-0001Ws-6T; Tue, 22 Sep 2020 13:34:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kKiRL-0001Wn-JT
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 13:34:39 +0000
X-Inumbo-ID: f60715e5-070d-477b-a004-7562d8aa980c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f60715e5-070d-477b-a004-7562d8aa980c;
 Tue, 22 Sep 2020 13:34:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600781677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l4ivjV8nKacoi6cHxlUi030omQdVFl2KqUBN0eyAD/8=;
 b=WGC0Zuhz7IEbTanDnLyGD8s3FV/NDtAMMe+iuR3jef76Nigncfy9SruhMK+emL4FlDcJcG
 ovg3GIBeb+ENP07rL0nBCQ2TEK+p9uGhjlagI3ppzmmbYvb2cet/gtKTdywCv5v46GoyQw
 po39uRXx+n6JUTdw4fl0aq+VH4QuXcE=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 92A20AC65;
 Tue, 22 Sep 2020 13:35:14 +0000 (UTC)
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cab7113e-9d0a-954c-c62d-115d7f734787@suse.com>
Date: Tue, 22 Sep 2020 15:34:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <17123e43-ca3e-4075-ad36-45e324bb6214@citrix.com>
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

On 22.09.2020 15:10, Andrew Cooper wrote:
> On 29/07/2020 21:02, Jan Beulich wrote:
>> On 28.07.2020 13:37, Andrew Cooper wrote:
>>> --- a/xen/common/grant_table.c
>>> +++ b/xen/common/grant_table.c
>>> @@ -4013,6 +4013,72 @@ static int gnttab_get_shared_frame_mfn(struct
>>> domain *d,
>>>       return 0;
>>>   }
>>>   +int gnttab_acquire_resource(
>>> +    struct domain *d, unsigned int id, unsigned long frame,
>>> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
>>> +{
>>> +    struct grant_table *gt = d->grant_table;
>>> +    unsigned int i = nr_frames, tot_frames;
>>> +    void **vaddrs;
>>> +    int rc = 0;
>>> +
>>> +    /* Input sanity. */
>>> +    if ( !nr_frames )
>>> +        return -EINVAL;
>>
>> I can't seem to be able to find an equivalent of this in the old logic,
>> and hence this looks like an unwarranted change in behavior to me. We
>> have quite a few hypercall ops where some count being zero is simply
>> a no-op, i.e. yielding success without doing anything.
> 
> There is no possible circumstance when getting here requesting 0 is
> legitimate.
> 
> Tolerating a zero input for a mapping request is a very expensive way of
> hiding caller bugs.

That's just one possible view. There are people thinking that
some extra runtime overhead doesn't outweigh the "clutter" of
extra conditionals in their code, and hence would rather avoid
checking if some calculation of theirs yielded zero before
making a hypercall. I think we should try to consistently
regard counts of zero as "nothing to do" in all our hypercalls.

> Most importantly however, the correctness of the logic does depends on
> nr_frames being nonzero.

I didn't mean to ask to drop the conditional if it's needed;
all I'm opposed to is raising an error in this case.

Jan


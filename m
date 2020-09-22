Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 220842742B9
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 15:13:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKi6O-0007eh-00; Tue, 22 Sep 2020 13:13:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J35V=C7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKi6N-0007ec-AI
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 13:12:59 +0000
X-Inumbo-ID: d0f2bd9a-07ed-45cd-b2ad-eec58a52c2ce
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0f2bd9a-07ed-45cd-b2ad-eec58a52c2ce;
 Tue, 22 Sep 2020 13:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600780378;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=FYgj1VEQPUemY32Hi4e4dgBECJLH6eHprjqhID6NS0o=;
 b=W3gTSHovAsCnEkP4r2OucmuRWcPXeMuz12CnrhCiKhSsGx87UelJgoS2
 z/geBMjfADEhJEFzllnTfaCUL0cN6/KuPacBFIrLFLUg4FVQLNyIFeY/R
 j7xxcvdo3cY9DdwaGxwcIxvJQR3WiEsR3i34t8laPFaBJE6ow9gvkM+5G 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: pe3pUhcvGgKT4f3ms30G8x5jr7Ktw6jIGvNeZbFFHnG6ySNjo50mVcTtExBj5OXu1kO9kTfpP5
 S8UozOUfBvL0BVbf+Ug7ZtI/a5vQOt9Ke8rWLtvy4uWahML/8RxIlt/3Wdn/czZHE/ADoamFGq
 QhESiqdxm44H7AozTNxi+vvmTssCrQ7yB2z9qFTX6tDwdc4CSq24GG4hmGhPYx0MdBNwYzLHKO
 a46XweF3eddYWrNKQOMh6TBQIFyRLAsIXgWzYagQLMiNdZ64uwN0VJaUCT3O8kF5pD68YMqkCJ
 avc=
X-SBRS: 2.7
X-MesageID: 27258497
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,290,1596513600"; d="scan'208";a="27258497"
Subject: Re: [PATCH 2/5] xen/gnttab: Rework resource acquisition
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@citrix.com>, "Konrad
 Rzeszutek Wilk" <konrad.wilk@oracle.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 "Hubert Jasudowicz" <hubert.jasudowicz@cert.pl>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-3-andrew.cooper3@citrix.com>
 <784bf5c1-be13-2c09-5494-6eb64c400473@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <17123e43-ca3e-4075-ad36-45e324bb6214@citrix.com>
Date: Tue, 22 Sep 2020 14:10:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <784bf5c1-be13-2c09-5494-6eb64c400473@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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

On 29/07/2020 21:02, Jan Beulich wrote:
> On 28.07.2020 13:37, Andrew Cooper wrote:
>> The existing logic doesn't function in the general case for mapping a
>> guests
>> grant table, due to arbitrary 32 frame limit, and the default grant
>> table
>> limit being 64.
>>
>> In order to start addressing this, rework the existing grant table
>> logic by
>> implementing a single gnttab_acquire_resource().  This is far more
>> efficient
>> than the previous acquire_grant_table() in memory.c because it
>> doesn't take
>> the grant table write lock, and attempt to grow the table, for every
>> single
>> frame.
>
> Among the code you replace there is a comment "Iterate backwards in case
> table needs to grow" explaining why what you say about growing the grant
> table didn't actually happen.

What I have said is accurate.

Iterating backwards caused it to actually grow once, but every iteration
still takes the lock and attempts to grow the table.

>
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -4013,6 +4013,72 @@ static int gnttab_get_shared_frame_mfn(struct
>> domain *d,
>>       return 0;
>>   }
>>   +int gnttab_acquire_resource(
>> +    struct domain *d, unsigned int id, unsigned long frame,
>> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
>> +{
>> +    struct grant_table *gt = d->grant_table;
>> +    unsigned int i = nr_frames, tot_frames;
>> +    void **vaddrs;
>> +    int rc = 0;
>> +
>> +    /* Input sanity. */
>> +    if ( !nr_frames )
>> +        return -EINVAL;
>
> I can't seem to be able to find an equivalent of this in the old logic,
> and hence this looks like an unwarranted change in behavior to me. We
> have quite a few hypercall ops where some count being zero is simply
> a no-op, i.e. yielding success without doing anything.

There is no possible circumstance when getting here requesting 0 is
legitimate.

Tolerating a zero input for a mapping request is a very expensive way of
hiding caller bugs.

Most importantly however, the correctness of the logic does depends on
nr_frames being nonzero.

>
>> +    /* Overflow checks */
>> +    if ( frame + nr_frames < frame )
>> +        return -EINVAL;
>> +
>> +    tot_frames = frame + nr_frames;
>> +    if ( tot_frames != frame + nr_frames )
>> +        return -EINVAL;
>
> I find the naming here quite confusing. I realize part of this stems
> from the code you replace, but anyway: "unsigned long frame" typically
> represents a memory frame number of some sort, making the calculation
> look as if it was wrong. (Initially I merely meant to ask whether this
> check isn't redundant with the prior one, or vice versa.)

Both checks are strictly necessary.  The top one checks 64bit wrapping,
while the second is checking 32bit truncation.

This code is horrible, both in terms of the acquire_resource API, and
the grant API being off by one compared to normal, and needing the
max_frame index, not the number of frames.

~Andrew


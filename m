Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14E92F9B29
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 09:24:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69427.124223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1PpP-0006gI-KQ; Mon, 18 Jan 2021 08:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69427.124223; Mon, 18 Jan 2021 08:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1PpP-0006ft-Gm; Mon, 18 Jan 2021 08:23:59 +0000
Received: by outflank-mailman (input) for mailman id 69427;
 Mon, 18 Jan 2021 08:23:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d36Q=GV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1PpO-0006fo-Ci
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 08:23:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6cc614f1-54c0-44e5-8c20-6d128329e174;
 Mon, 18 Jan 2021 08:23:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6A35BAC6E;
 Mon, 18 Jan 2021 08:23:54 +0000 (UTC)
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
X-Inumbo-ID: 6cc614f1-54c0-44e5-8c20-6d128329e174
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610958234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LHJjg1rLr6ETwEQpo7CFn1M5j206llQzkpkudgpOfwc=;
	b=c80LZqbs4zLqKA7U9LO5CPvuzcKACNivTwkgaXivg6byW77BZzoNte2GAvrvDGbjhndkVo
	SJisrVg3EZFu/gEn6oRR9MDnfUYbl8xj3fpoDXykcB+l3QxZB9VLsPqJMIyK18tOYLYehZ
	h6BVpnSrFAb8k6knIyQhW27eQIO/zdE=
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <57895dd4-10c7-18cb-bc44-25a45cb688a7@suse.com>
Date: Mon, 18 Jan 2021 09:23:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <a96bed35-df20-e77b-1b98-593aa5649ad9@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.01.2021 17:57, Andrew Cooper wrote:
> On 15/01/2021 11:56, Jan Beulich wrote:
>>> +    /* Grow table if necessary. */
>>> +    grant_write_lock(gt);
>>> +    rc = -EINVAL;
>>> +    switch ( id )
>>> +    {
>>> +    case XENMEM_resource_grant_table_id_shared:
>>> +        vaddrs = gt->shared_raw;
>>> +        rc = gnttab_get_shared_frame_mfn(d, tot_frames - 1, &tmp);
>> ... this will degenerate (and still cause an error) when frame
>> is also zero, and will cause undue growing of the table when
>> frame is non-zero yet not overly large.
> 
> Urgh, yes - that is why I had the check.
> 
> In which case I retract my change between v2 and v3 here.
> 
>> As indicated before, I'm of the clear opinion that here - like
>> elsewhere - a number of zero frames requested means that no
>> action be taken at all, and success be returned.
> 
> The general world we work in (POSIX) agrees with my opinion over yours
> when it comes to this matter.

I assume you are referring to mmap()? I ask because I think there
are numerous counter examples (some even in the C standard):
malloc() & friends allow for either behavior. memcpy() / memmove()
happily do nothing when passed a zero size. read() / write()
are at least allowed to read/write nothing (and return success)
when told so. Otoh I notice that a zero vector count passed to
readv() / writev() is indeed an error, yet nothing is said at all
about individual vector elements specifying zero size.

Plus of course I don't think POSIX is the main reference point
here, when the rest of the hypercalls allowing for some form of
batching permit empty batches.

> I spent a lot of time and effort getting this logic correct in v2, and I
> do not have any further time to waste adding complexity to support a
> non-existent corner case, nor is it reasonable to further delay all the
> work which is depending on this series.  This entire mess is already too
> damn complicated, without taking extra complexity.
> 
> Entertaining the idea of supporting 0 length requests is really not as
> simple as you seem to think it is, and is a large part of why I'm
> stubbornly refusing to do so.

I'd be really happy to be educated of the complications; sadly
so far you've only claimed ones would exist without actually
going into sufficient detail. In particular I don't view placing 

    if ( size == 0 )
        return 0;

suitably early coming anywhere near "complexity". Even more so
that as per your reply you mean to undo removal of a respective
check, just that in your version it'll return an error instead
of success.

> I am going to commit this patch (with some of the other minor adjustments).

I'm not concerned enough of the introduced inconsistency to
outright veto you doing so, but I still don't think this is an
appropriate step to take under the present conditions.

Jan


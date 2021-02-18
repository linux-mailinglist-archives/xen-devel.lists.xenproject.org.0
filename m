Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAFA31E908
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 12:31:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86540.162614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lChX4-0007Rz-Dh; Thu, 18 Feb 2021 11:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86540.162614; Thu, 18 Feb 2021 11:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lChX4-0007Ra-AI; Thu, 18 Feb 2021 11:31:42 +0000
Received: by outflank-mailman (input) for mailman id 86540;
 Thu, 18 Feb 2021 11:31:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x3vz=HU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lChX3-0007RV-Gh
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 11:31:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc69c32a-09f4-4a16-a659-07b3b6161685;
 Thu, 18 Feb 2021 11:31:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6334EAF0B;
 Thu, 18 Feb 2021 11:31:39 +0000 (UTC)
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
X-Inumbo-ID: cc69c32a-09f4-4a16-a659-07b3b6161685
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613647899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dQ7Bmw3qV/Mx0DUjr1xZLIgeHRg07uwzun2XAH/yTdM=;
	b=J6bkn30ZJlMhpujoLJ46dQEVIAD1UttsLvtLsiAaGE95xiy19w/YbPkpRtwcAQRhKm0LXb
	o87nzZmK4icCye6F0ZzQEu4hD/TFIuAokLYU1SpKv5jJNlSEfcgy2/g5IYGEi8VAXr+e16
	V9+j4/Mag2qKM7pj/3anQe+y5mQMOBc=
Subject: Re: [PATCH 1/3] gnttab: never permit mapping transitive grants
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <156559d5-853a-5bb9-942b-f623627e0907@suse.com>
 <3620b977-4182-db2c-e2f9-71e1c6c4e721@suse.com>
 <6423c7ef-66d2-8867-50a0-b75ae63aaef6@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0c918000-c5aa-e297-569e-621e6d5c5d3b@suse.com>
Date: Thu, 18 Feb 2021 12:31:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6423c7ef-66d2-8867-50a0-b75ae63aaef6@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.02.2021 11:25, Julien Grall wrote:
> On 17/02/2021 10:46, Jan Beulich wrote:
>> Transitive grants allow an intermediate domain I to grant a target
>> domain T access to a page which origin domain O did grant I access to.
>> As an implementation restriction, T is not allowed to map such a grant.
>> This restriction is currently tried to be enforced by marking active
>> entries resulting from transitive grants as is-sub-page; sub-page grants
>> for obvious reasons don't allow mapping. However, marking (and checking)
>> only active entries is insufficient, as a map attempt may also occur on
>> a grant not otherwise in use. When not presently in use (pin count zero)
>> the grant type itself needs checking. Otherwise T may be able to map an
>> unrelated page owned by I. This is because the "transitive" sub-
>> structure of the v2 union would end up being interpreted as "full_page"
>> sub-structure instead. The low 32 bits of the GFN used would match the
>> grant reference specified in I's transitive grant entry, while the upper
>> 32 bits could be random (depending on how exactly I sets up its grant
>> table entries).
>>
>> Note that if one mapping already exists and the granting domain _then_
>> changes the grant to GTF_transitive (which the domain is not supposed to
>> do), the changed type will only be honored after the pin count has gone
>> back to zero. This is no different from e.g. GTF_readonly or
>> GTF_sub_page becoming set when a grant is already in use.
>>
>> While adjusting the implementation, also adjust commentary in the public
>> header to better reflect reality.
>>
>> Fixes: 3672ce675c93 ("Transitive grant support")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> The change in grant_table.c looks good to me:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks.

>> --- a/xen/include/public/grant_table.h
>> +++ b/xen/include/public/grant_table.h
>> @@ -166,11 +166,13 @@ typedef struct grant_entry_v1 grant_entr
>>   #define GTF_type_mask       (3U<<0)
>>   
>>   /*
>> - * Subflags for GTF_permit_access.
>> + * Subflags for GTF_permit_access and GTF_transitive.
>>    *  GTF_readonly: Restrict @domid to read-only mappings and accesses. [GST]
>>    *  GTF_reading: Grant entry is currently mapped for reading by @domid. [XEN]
>>    *  GTF_writing: Grant entry is currently mapped for writing by @domid. [XEN]
>> - *  GTF_PAT, GTF_PWT, GTF_PCD: (x86) cache attribute flags for the grant [GST]
>> + * Further subflags for GTF_permit_access only.
>> + *  GTF_PAT, GTF_PWT, GTF_PCD: (x86) cache attribute flags to be used for
>> + *                             mappings of the grant [GST]
>>    *  GTF_sub_page: Grant access to only a subrange of the page.  @domid
>>    *                will only be allowed to copy from the grant, and not
>>    *                map it. [GST]
> 
> Do we have any check preventing GTF_sub_page and GTF_transitive to be 
> set together?

No, and I also don't think we need one. For one transitive grants
get implicitly treated as sub-page ones (I admit this is an
implementation detail, not really an ABI aspect) and the flag is
simply ignored in this case. Much like - see patch 3 - the flag
ought to also be ignored for v1 grants.

Jan


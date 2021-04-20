Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1243658DA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 14:25:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113594.216481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpRS-0006GY-6O; Tue, 20 Apr 2021 12:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113594.216481; Tue, 20 Apr 2021 12:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpRS-0006G9-2k; Tue, 20 Apr 2021 12:25:22 +0000
Received: by outflank-mailman (input) for mailman id 113594;
 Tue, 20 Apr 2021 12:25:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lYpRR-0006G4-2n
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 12:25:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b702b8bb-5fdb-43fb-8b1c-d08452c4b0ca;
 Tue, 20 Apr 2021 12:25:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CBE21B1C8;
 Tue, 20 Apr 2021 12:25:18 +0000 (UTC)
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
X-Inumbo-ID: b702b8bb-5fdb-43fb-8b1c-d08452c4b0ca
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618921518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/wNjX459WkUJ9/R/swWQqsYVVM5tsoev69GCjDWOFg0=;
	b=eqOdScP1iX/mI22pUE5ScyIpeIbzZlg52XNiBk54XMs11AfiIgtRwPu5GHfU0XDz/GxhWT
	a67PLXlHHkan6q2faQk9PtICoNurvKS8dqaheGE4UtgN4pJpfIXfwDst7yVc5KJXGG8A3k
	C6z++0CJhQ6MAJX1WJfnnODw3VfnuYk=
Subject: Re: [PATCH v2] VT-d: Don't assume register-based invalidation is
 always supported
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org,
 Chao Gao <chao.gao@intel.com>
References: <20200401200606.48752-1-chao.gao@intel.com>
 <f4b3ad3b-16b9-5e42-c7a6-0c5c81b1f392@suse.com>
 <148ad77f-d447-0800-d48b-9ba8c758b905@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b89c8443-4df6-485b-2b5b-d89360a6969a@suse.com>
Date: Tue, 20 Apr 2021 14:25:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <148ad77f-d447-0800-d48b-9ba8c758b905@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.04.2021 14:14, Julien Grall wrote:
> Hi,
> 
> It is not really my area of expertise but I wanted to jump on one 
> comment below...
> 
> On 20/04/2021 12:38, Jan Beulich wrote:
>> On 01.04.2020 22:06, Chao Gao wrote:
>>> ---
>>> Changes in v2:
>>>   - verify system suspension and resumption with this patch applied
>>>   - don't fall back to register-based interface if enabling qinval failed.
>>>     see the change in init_vtd_hw().
>>>   - remove unnecessary "queued_inval_supported" variable
>>>   - constify the "struct vtd_iommu *" of has_register_based_invalidation()
>>>   - coding-style changes
>>
>> ... while this suggests this is v2 of a recently sent patch, the
>> submission is dated a little over a year ago. This is confusing.
>> It is additionally confusing that there were two copies of it in
>> my inbox, despite mails coming from a list normally getting
>> de-duplicated somewhere at our end (I believe).
>>
>>> --- a/xen/drivers/passthrough/vtd/iommu.c
>>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>>> @@ -1193,6 +1193,14 @@ int __init iommu_alloc(struct acpi_drhd_unit *drhd)
>>>   
>>>       iommu->cap = dmar_readq(iommu->reg, DMAR_CAP_REG);
>>>       iommu->ecap = dmar_readq(iommu->reg, DMAR_ECAP_REG);
>>> +    iommu->version = dmar_readl(iommu->reg, DMAR_VER_REG);
>>> +
>>> +    if ( !iommu_qinval && !has_register_based_invalidation(iommu) )
>>> +    {
>>> +        printk(XENLOG_WARNING VTDPREFIX "IOMMU %d: cannot disable Queued Invalidation.\n",
>>> +               iommu->index);
>>
>> Here (and at least once more yet further down): We don't normally end
>> log messages with a full stop. Easily addressable while committing, of
>> course.
> 
> I can find a large number of cases where log messages are ended with a 
> full stop... Actually it looks more natural to me than your suggestion.

Interesting. From purely a language perspective it indeed looks more
natural, I agree. But when considering (serial) console bandwidth, we
ought to try to eliminate _any_ output that's there without conveying
information or making the conveyed information understandable. In fact
I recall a number of cases (without having commit hashes to hand)
where we deliberately dropped full stops. (The messages here aren't at
risk of causing bandwidth issues, but as with any such generic item I
think the goal ought to be consistency, and hence either full stops
everywhere, or nowhere. If bandwidth was an issue here, I might also
have suggested to shorten "Queued Invalidation" to just "QI".)

Also, when you say "large number" - did you compare to the number of
cases where there are no full stops? (I sincerely hope we don't have
that many full stops left.)

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 018543658C3
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 14:14:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113578.216441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpGl-0004zc-K0; Tue, 20 Apr 2021 12:14:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113578.216441; Tue, 20 Apr 2021 12:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpGl-0004zD-Gu; Tue, 20 Apr 2021 12:14:19 +0000
Received: by outflank-mailman (input) for mailman id 113578;
 Tue, 20 Apr 2021 12:14:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lYpGj-0004z8-M8
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 12:14:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYpGg-0000NB-3Q; Tue, 20 Apr 2021 12:14:14 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYpGf-00045F-Q7; Tue, 20 Apr 2021 12:14:13 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=QDcuO5Mcis7ZmlgNi2zO7XmSLa4hHxPbkBvAXhYEbCE=; b=waNtOfOYlhlTUEb0N6xUDDEDPl
	IFhKNQ7SR9/sL+rEvU+aWYvU28C2P8PsU+8KropWVIZYv9ZA6IDy1735lU0PoFmWYfioOa1lqDObd
	h0Da4laidGaYKhaD+bFbT7WiTNoV55bDDv2JH7Q3OyuT/AOuz8C9G95vtZACmtivPmRM=;
Subject: Re: [PATCH v2] VT-d: Don't assume register-based invalidation is
 always supported
To: Jan Beulich <jbeulich@suse.com>, Chao Gao <chao.gao@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20200401200606.48752-1-chao.gao@intel.com>
 <f4b3ad3b-16b9-5e42-c7a6-0c5c81b1f392@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <148ad77f-d447-0800-d48b-9ba8c758b905@xen.org>
Date: Tue, 20 Apr 2021 13:14:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <f4b3ad3b-16b9-5e42-c7a6-0c5c81b1f392@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

It is not really my area of expertise but I wanted to jump on one 
comment below...

On 20/04/2021 12:38, Jan Beulich wrote:
> On 01.04.2020 22:06, Chao Gao wrote:
>> ---
>> Changes in v2:
>>   - verify system suspension and resumption with this patch applied
>>   - don't fall back to register-based interface if enabling qinval failed.
>>     see the change in init_vtd_hw().
>>   - remove unnecessary "queued_inval_supported" variable
>>   - constify the "struct vtd_iommu *" of has_register_based_invalidation()
>>   - coding-style changes
> 
> ... while this suggests this is v2 of a recently sent patch, the
> submission is dated a little over a year ago. This is confusing.
> It is additionally confusing that there were two copies of it in
> my inbox, despite mails coming from a list normally getting
> de-duplicated somewhere at our end (I believe).
> 
>> --- a/xen/drivers/passthrough/vtd/iommu.c
>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>> @@ -1193,6 +1193,14 @@ int __init iommu_alloc(struct acpi_drhd_unit *drhd)
>>   
>>       iommu->cap = dmar_readq(iommu->reg, DMAR_CAP_REG);
>>       iommu->ecap = dmar_readq(iommu->reg, DMAR_ECAP_REG);
>> +    iommu->version = dmar_readl(iommu->reg, DMAR_VER_REG);
>> +
>> +    if ( !iommu_qinval && !has_register_based_invalidation(iommu) )
>> +    {
>> +        printk(XENLOG_WARNING VTDPREFIX "IOMMU %d: cannot disable Queued Invalidation.\n",
>> +               iommu->index);
> 
> Here (and at least once more yet further down): We don't normally end
> log messages with a full stop. Easily addressable while committing, of
> course.

I can find a large number of cases where log messages are ended with a 
full stop... Actually it looks more natural to me than your suggestion.

Cheers,

-- 
Julien Grall


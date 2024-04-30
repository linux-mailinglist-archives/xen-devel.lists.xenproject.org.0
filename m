Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1518B6F93
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 12:23:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714712.1116010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1kdR-0004ak-6m; Tue, 30 Apr 2024 10:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714712.1116010; Tue, 30 Apr 2024 10:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1kdR-0004ZD-3l; Tue, 30 Apr 2024 10:22:53 +0000
Received: by outflank-mailman (input) for mailman id 714712;
 Tue, 30 Apr 2024 10:22:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BVXM=MD=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1s1kdP-0004Z7-4a
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 10:22:51 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96ee0b51-06db-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 12:22:48 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1714472561259780.4559753637509;
 Tue, 30 Apr 2024 03:22:41 -0700 (PDT)
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
X-Inumbo-ID: 96ee0b51-06db-11ef-909b-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; t=1714472562; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UzsPn0SuaSo80QcW/G0daI7QsAYNvFASS3ws0ebFAwDCbM80nWsjUqgejPlM+U1X0EjUe1a+A4nyIRtlxawCCXl0cDk8EqX46x2+4UC5wHSK8mqGV2vaD9tqrwBHasw/6/HURuXWtiULs+2xNTxaTKFxcZcIIVfJ2bLeS4/npu4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1714472562; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0SmidHBiFenbflTJ2/wOXDPN9LPimJo7cxQVCutDFfA=; 
	b=mYB1Qo4wORKh7sOWSfezvDmVAovbzYlENmCPOVPIaSQsnjlNP3CKA0jb3cjK1fBC8eTDG5CVDyPfkTdUwqdyQHTi95QX9oaG0dM9v6FCvM3BT/IC2E2JjfSxA4zKN7XLyS3R0JclnuOSH8AsHUYSBmeJdwXYbrGmDTmbatJP6Co=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1714472562;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=0SmidHBiFenbflTJ2/wOXDPN9LPimJo7cxQVCutDFfA=;
	b=rXfiPZlwVPy96DiLsT3+HKXI4Lx46a44mVLkawKo3HnP/tPS9VlAEHLCBq7uxvHx
	x0OPXktI45Njz5wcm30lLhRRs1jTVFXJlomMRdU94MOW+h7mSOyYJukw75zgs2LrxaS
	6k2XLhqv42Th5CGTVgF/MGTMkfzdyCDeSgrbZyQI=
Message-ID: <3054018d-1ae4-43c5-b44a-2ecf1b4cdfc7@apertussolutions.com>
Date: Tue, 30 Apr 2024 06:22:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/arm/dom0less-build: Alloc magic pages for
 Dom0less DomUs from hypervisor
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>
References: <20240426031455.579637-1-xin.wang2@amd.com>
 <20240426031455.579637-2-xin.wang2@amd.com>
 <ee507cf7-b5e8-4141-85b6-c81955bcc348@apertussolutions.com>
 <03357204-0308-46a2-a215-142d681d2b6a@amd.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <03357204-0308-46a2-a215-142d681d2b6a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/29/24 22:55, Henry Wang wrote:
> Hi Daniel,
> 
> On 4/30/2024 8:27 AM, Daniel P. Smith wrote:
>> On 4/25/24 23:14, Henry Wang wrote:
>>> There are use cases (for example using the PV driver) in Dom0less
>>> setup that require Dom0less DomUs start immediately with Dom0, but
>>> initialize XenStore later after Dom0's successful boot and call to
>>> the init-dom0less application.
>>>
>>> An error message can seen from the init-dom0less application on
>>> 1:1 direct-mapped domains:
>>> ```
>>> Allocating magic pages
>>> memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
>>> Error on alloc magic pages
>>> ```
>>> This is because currently the magic pages for Dom0less DomUs are
>>> populated by the init-dom0less app through populate_physmap(), and
>>> populate_physmap() automatically assumes gfn == mfn for 1:1 direct
>>> mapped domains. This cannot be true for the magic pages that are
>>> allocated later from the init-dom0less application executed in Dom0.
>>> For domain using statically allocated memory but not 1:1 direct-mapped,
>>> similar error "failed to retrieve a reserved page" can be seen as the
>>> reserved memory list is empty at that time.
>>>
>>> To solve above issue, this commit allocates the magic pages for
>>> Dom0less DomUs at the domain construction time. The base address/PFN
>>> of the magic page region will be noted and communicated to the
>>> init-dom0less application in Dom0.
>>
>> Might I suggest we not refer to these as magic pages? I would consider 
>> them as hypervisor reserved pages for the VM to have access to virtual 
>> platform capabilities. We may see this expand in the future for some 
>> unforeseen, new capability.
> 
> I think magic page is a specific terminology to refer to these pages, 
> see alloc_magic_pages() for both x86 and Arm. I will reword the last 
> paragraph of the commit message to refer them as "hypervisor reserved 
> pages (currently used as magic pages on Arm)" if this sounds good to you.

I would highlight that is a term used in the toolstack, while is 
probably not the best, there is no reason to change in there, but the 
hypervisor does not carry that terminology. IMHO we should not introduce 
it there and be explicit about why the pages are getting reserved.

v/r,
dps



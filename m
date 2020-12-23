Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDF42E1F83
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 17:35:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58506.102989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks76o-0000sL-NB; Wed, 23 Dec 2020 16:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58506.102989; Wed, 23 Dec 2020 16:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks76o-0000rd-IM; Wed, 23 Dec 2020 16:35:30 +0000
Received: by outflank-mailman (input) for mailman id 58506;
 Wed, 23 Dec 2020 16:35:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zN8f=F3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ks76n-0000XT-H5
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 16:35:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ee3d01c-77a8-4965-b640-66e607890d7e;
 Wed, 23 Dec 2020 16:35:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3562EAD18;
 Wed, 23 Dec 2020 16:35:19 +0000 (UTC)
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
X-Inumbo-ID: 9ee3d01c-77a8-4965-b640-66e607890d7e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608741319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yvT1r/O+a0xjJdQM9X5N+I06mHebAFYu2G8LdS1zrvo=;
	b=Deh5vWhwJOAalWM+GwsbG5eN8oxG0h4QNZfvSVdOP41VbYwrTpXYG/2xLhPIPbWB7P+9S5
	F+34Vnkk3xgIKvtGJvKeuy+SomDSuV1pag2r3ubNFDodWcZqxUnmFqxjBffv/qVhSnzkao
	lw+0s6SyEcrhlYl0agZ0e9G8oTQUxNw=
Subject: Re: [PATCH for-4.15 4/4] xen/iommu: x86: Don't leak the IOMMU
 page-tables
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20201222154338.9459-1-julien@xen.org>
 <20201222154338.9459-5-julien@xen.org>
 <beb22b59-701e-462c-5080-e99033079204@suse.com>
 <d62f8851-b417-b22a-4527-c2c43b536446@xen.org>
 <e897e1bf-9c17-f8a9-274a-673ff7f1a009@suse.com>
 <0ff629b1-25e6-6ce4-43ab-d50af52ecb8c@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a22f7364-518f-ea5f-3b87-5c0462cfc193@suse.com>
Date: Wed, 23 Dec 2020 17:35:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <0ff629b1-25e6-6ce4-43ab-d50af52ecb8c@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.12.2020 17:19, Julien Grall wrote:
> On 23/12/2020 16:15, Jan Beulich wrote:
>> On 23.12.2020 17:07, Julien Grall wrote:
>>> I think I prefer the small race introduced (the pages will still be
>>> freed) over this solution.
>>
>> The "will still be freed" is because of the 2nd round of freeing
>> you add in an earlier patch? I'd prefer to avoid the race to in
>> turn avoid that 2nd round of freeing.
> 
> The "2nd round" of freeing is necessary at least for the domain creation 
> failure case (it would be the 1rst round).
> 
> If we can avoid IOMMU page-table allocation in the domain creation path, 
> then yes I agree that we want to avoid that "2nd round". Otherwise, I 
> think it is best to take advantage of it.

Well, I'm not really certain either way here. If it's really just
VMX'es APIC access page that's the problem here, custom cleanup
of this "fallout" from VMX code would certainly be an option.
Furthermore I consider it wrong to insert this page in the IOMMU
page tables in the first place. This page overlaps with the MSI
special address range, and hence accesses will be dealt with by
interrupt remapping machinery (if enabled). If interrupt
remapping is disabled, this page should be no different for I/O
purposes than all other pages in this window - they shouldn't
be mapped at all.

Perhaps, along the lines of epte_get_entry_emt(), ept_set_entry()
should gain an is_special_page() check to prevent propagation to
the IOMMU for such pages (we can't do anything about them in
shared-page-table setups)? See also the (PV related) comment in
cleanup_page_mappings(), a few lines ahead of a respective use of
is_special_page(),

Jan


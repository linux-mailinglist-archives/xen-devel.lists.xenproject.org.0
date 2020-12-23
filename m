Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 695142E1DAE
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 16:01:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58424.102719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks5d4-0007FX-IN; Wed, 23 Dec 2020 15:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58424.102719; Wed, 23 Dec 2020 15:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks5d4-0007FB-FD; Wed, 23 Dec 2020 15:00:42 +0000
Received: by outflank-mailman (input) for mailman id 58424;
 Wed, 23 Dec 2020 15:00:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zN8f=F3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ks5d3-0007F6-GB
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 15:00:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fecfb620-1ff5-4294-9c87-422eff58cbba;
 Wed, 23 Dec 2020 15:00:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A713EACBA;
 Wed, 23 Dec 2020 15:00:39 +0000 (UTC)
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
X-Inumbo-ID: fecfb620-1ff5-4294-9c87-422eff58cbba
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608735639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HLGlKqxjqShMYThO4kOZ0yk7rC0zmMl3vfcvbrku7gs=;
	b=X5HWsfk+dWUj10totkHVf+rJAowTRuNl8y30yF/bhKteolkyBDwmng1UDHIDS9ZhBLhjIh
	1GqKXgZf/Z42GhocZeStDLcljgWMFt0uWsuQKiwe8KC4haPAGELM/ByGJ12p0CbnF4Fn9E
	HY94GBeU1NVSrek4KwZQRdJyZvipNns=
Subject: Re: [PATCH for-4.15 3/4] [RFC] xen/iommu: x86: Clear the root
 page-table before freeing the page-tables
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, Julien Grall <jgrall@amazon.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20201222154338.9459-1-julien@xen.org>
 <20201222154338.9459-4-julien@xen.org>
 <499e6d5a-e8ac-56db-1af9-70469b6a06b9@suse.com>
 <8b394c44-5bdb-9d82-b211-5a4ee3473568@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <19e92d90-ed9a-4bd6-79f4-b761b5a039c6@suse.com>
Date: Wed, 23 Dec 2020 16:00:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <8b394c44-5bdb-9d82-b211-5a4ee3473568@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.12.2020 15:56, Julien Grall wrote:
> On 23/12/2020 14:12, Jan Beulich wrote:
>> On 22.12.2020 16:43, Julien Grall wrote:
>>> This is an RFC because it would break AMD IOMMU driver. One option would
>>> be to move the call to the teardown callback earlier on. Any opinions?
>>
>> We already have
>>
>> static void amd_iommu_domain_destroy(struct domain *d)
>> {
>>      dom_iommu(d)->arch.amd.root_table = NULL;
>> }
>>
>> and this function is AMD's teardown handler. Hence I suppose
>> doing the same for VT-d would be quite reasonable. And really
>> VT-d's iommu_domain_teardown() also already has
>>
>>      hd->arch.vtd.pgd_maddr = 0;
> 
> Let me have a look if that works.
> 
>>
>> I guess what's missing is prevention of the root table
>> getting re-setup. 
> 
> This is taken care in the follow-up patch by forbidding page-table 
> allocation. I can mention it in the commit message.

My expectation is that with that subsequent change the change here
(or any variant of it) would become unnecessary.

Jan


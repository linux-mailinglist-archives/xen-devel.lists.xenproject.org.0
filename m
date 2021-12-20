Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DF147A8AA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 12:28:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249572.429985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzGpG-0003hS-8S; Mon, 20 Dec 2021 11:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249572.429985; Mon, 20 Dec 2021 11:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzGpG-0003ff-5G; Mon, 20 Dec 2021 11:27:30 +0000
Received: by outflank-mailman (input) for mailman id 249572;
 Mon, 20 Dec 2021 11:27:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1mzGpD-0003fZ-RD
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 11:27:28 +0000
Received: from sender4-of-o55.zoho.com (sender4-of-o55.zoho.com
 [136.143.188.55]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd788c62-6187-11ec-9e60-abaf8a552007;
 Mon, 20 Dec 2021 12:27:25 +0100 (CET)
Received: from [10.10.1.134] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1639999637782645.8866626246403;
 Mon, 20 Dec 2021 03:27:17 -0800 (PST)
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
X-Inumbo-ID: cd788c62-6187-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; t=1639999640; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XF2uHJqOzyJHyCdY7fyNmThjBXIiRpXIh96P0WVGw5L67Oe3XTXgo/AIwP1J7HU1odW62PnOlyEnaV2jzrO/XXyc7n62IbMkX7NmbRkQ5szhYjoRYneUEIHMp+c4No3qS3u0epA1dpn+ak7fGRhsZki9LyrHqqBV8t0TDmwfWgM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1639999640; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Hv+H1s+UslAGqxdcjNXqFCh6/8E+pjLOZ/BlnDB3hxs=; 
	b=mtsmzKsN9NvsnWBwGARNY0hXUemNlDykV9Z4O4oayE7OUH9aR3uYaRJGKHKHPB/Osp2d1sS4BYtogGbjXvwr53Z8INX+uO/c4HJkMNx1QZ0H2a+DB+oqBSpP0tbpgpTBEQtiaK5UyafIydQwOU5gIGK0EPSkUx7BwAA23eT4+XE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1639999640;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Hv+H1s+UslAGqxdcjNXqFCh6/8E+pjLOZ/BlnDB3hxs=;
	b=gip956wRS2yKELRaSyF0gQ1lXTHvF+/n1bOonTlay0Rn7bDIySfa9GFJ3+jkJ/a5
	T42PpJP40aSe3qqnua+GTgGg3V7P6eX8FMbxbhO2zYjcfUUejBejtHjdtZCI1l09ck0
	uBWJ1JBPrhfpzQOrUxgHfZAqLG7uAQsl95sruVK0=
Subject: Re: [RFC 02/10] is_system_domain: replace open-coded instances
To: Andrew Cooper <amc96@srcf.net>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20211217233437.13791-1-dpsmith@apertussolutions.com>
 <20211217233437.13791-3-dpsmith@apertussolutions.com>
 <4382c02a-4207-729b-67b8-c9a8bf65b921@srcf.net>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <a3daa13e-cf30-e83d-2b14-427ee060ced8@apertussolutions.com>
Date: Mon, 20 Dec 2021 06:26:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <4382c02a-4207-729b-67b8-c9a8bf65b921@srcf.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 12/17/21 2:50 PM, Andrew Cooper wrote:
> On 17/12/2021 23:34, Daniel P. Smith wrote:
>> From: Christopher Clark <christopher.w.clark@gmail.com>
>>
>> There were several instances of open-coded domid range checking. This commit
>> replaces those with the is_system_domain inline function.
>>
>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Ah - probably my fault.  When I added is_system_domain(), I didn't think
> to scan for other opencodes - I was guts deep in the domain creation logic.
> 
> In addition to the ones you've got here...
> 
> xen/arch/x86/cpu/mcheck/mce.c:1521
> xen/common/domain.c:586
> common/domctl.c:55, 411 and 421
> 
> according to `git grep DOMID_FIRST_RESERVED`

confirmed and replaced

>> diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
>> index 8ec4547bed..179f3dcc5a 100644
>> --- a/xen/arch/x86/cpu/vpmu.c
>> +++ b/xen/arch/x86/cpu/vpmu.c
>> @@ -188,7 +188,7 @@ void vpmu_do_interrupt(struct cpu_user_regs *regs)
>>        * in XENPMU_MODE_ALL, for everyone.
>>        */
>>       if ( (vpmu_mode & XENPMU_MODE_ALL) ||
>> -         (sampled->domain->domain_id >= DOMID_FIRST_RESERVED) )
>> +         (is_system_domain(sampled->domain)) )
> 
> Can drop one set of brackets now.

ack

>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>> index 28146ee404..1df09bcb77 100644
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -613,6 +613,11 @@ extern struct vcpu *idle_vcpu[NR_CPUS];
>>   #define is_idle_domain(d) ((d)->domain_id == DOMID_IDLE)
>>   #define is_idle_vcpu(v)   (is_idle_domain((v)->domain))
>>   
>> +static inline bool is_system_domain_id(domid_t id)
>> +{
>> +    return (id >= DOMID_FIRST_RESERVED);
>> +}
>> +
>>   static inline bool is_system_domain(const struct domain *d)
>>   {
>>       return d->domain_id >= DOMID_FIRST_RESERVED;
> 
> is_system_domain() wants implementing in terms of is_system_domain_id().

ack

> That said, could I talk you into is_system_domid() as a better name?

ack

> This is all sufficiently trivial that I'm tempted to fix on commit if
> you'd like.  This patch is cleanup that stands on its own merit, and
> isn't tied to hyperlaunch specifically.

I will send the revised version later today as a standalone patch.

v/r,
dps


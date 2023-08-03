Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8B076EED4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 17:59:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576481.902665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRaig-0005V9-8u; Thu, 03 Aug 2023 15:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576481.902665; Thu, 03 Aug 2023 15:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRaig-0005SY-5T; Thu, 03 Aug 2023 15:58:34 +0000
Received: by outflank-mailman (input) for mailman id 576481;
 Thu, 03 Aug 2023 15:58:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0usr=DU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qRaie-0005SO-KE
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 15:58:32 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96b613cb-3216-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 17:58:31 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691078305145440.71844765958383;
 Thu, 3 Aug 2023 08:58:25 -0700 (PDT)
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
X-Inumbo-ID: 96b613cb-3216-11ee-b268-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1691078307; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jBTmvow01AHF+vVYEiaumQ4VBM7Xqg3GDhID528w12gJ/KImu2W8xCUcvcGHuM7XrRGxK0/pKVWbEuUG8FjEg+p9S7XIE/64fipd/2OLTfoeZSd6mswvoXWnHCldAo+1OS13SHjNfUpIKvmvEnWi6d4jRzcmexTZlOBty9CIzoU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691078307; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=f/NEKVxmYeOoBO1Aj3ft9iK1B2vxUt4/FmnzD0CucWk=; 
	b=FnpYAiTM2H69prk5J7Qp+1+GH/SOlN4vvH1ZwI/xIJj0UHtJEL/Lx2xxQmZaq6Sll+aDoODiBzeVO18Y8nGQmtXnIRpxPUeXf4PEpBqHKOhTSzDxqhqQe/Qf8IKRrWDvDlxWm8cbujEkFrk+BjjrMdtlejy9nwO8sN1zLk2ZKQQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691078307;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=f/NEKVxmYeOoBO1Aj3ft9iK1B2vxUt4/FmnzD0CucWk=;
	b=PwmSrlffQ2ISBk11TIAGxzyFxF4l3FagMe/GhcK80t5A0vaD50WU2u5VFZ0l9ZT7
	76o6aToz6Bw9+nSfg6udiOcXVvTT53g1jDF33KZsvEhWwWsIYZhaKKoVT9y0/EKMZ8Z
	XvToCVLrd5EQphqaeyf8mdO+YdSeqxsD9oQPU6tM=
Message-ID: <d1538191-12e7-0c60-787d-b85bceb6d938@apertussolutions.com>
Date: Thu, 3 Aug 2023 11:58:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 1/6] dom0: replace explict zero checks
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-2-dpsmith@apertussolutions.com>
 <fa9799bf-1a74-48a8-f4f4-3d2c563f0b13@suse.com>
 <97319344-02d2-4fa4-9325-fbcd74364bdf@apertussolutions.com>
 <da257167-683f-4a2b-a14e-b55ae208bd7e@xen.org>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <da257167-683f-4a2b-a14e-b55ae208bd7e@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 8/3/23 09:36, Julien Grall wrote:
> Hi Daniel,

Hey Julien,

> On 03/08/2023 14:33, Daniel P. Smith wrote:
>> On 8/2/23 03:46, Jan Beulich wrote:
>>> On 01.08.2023 22:20, Daniel P. Smith wrote:
>>>> A legacy concept is that the initial domain will have a domain id of 
>>>> zero. As a
>>>> result there are places where a check that a domain is the inital 
>>>> domain is
>>>> determined by an explicit check that the domid is zero.
>>>
>>> It might help if you at least outlined here why/how this is going to
>>> change.
>>
>> Okay, I will try expanding on this further.
>>
>>>> --- a/xen/include/xen/sched.h
>>>> +++ b/xen/include/xen/sched.h
>>>> @@ -1058,6 +1058,13 @@ void scheduler_disable(void);
>>>>   void watchdog_domain_init(struct domain *d);
>>>>   void watchdog_domain_destroy(struct domain *d);
>>>> +static always_inline bool is_initial_domain(const struct domain *d)
>>>> +{
>>>> +    static int init_domain_id = 0;
>>>
>>> This may then also help with the question on why you use a static
>>> variable here. (In any event the type of this variable wants to
>>> be correct; plain int isn't appropriate ...
>>
>> Ah, so this is a dated patch that I brought because of the abstraction 
>> it made. The intent in the original series for making it static was in 
>> preparation to handle the shim case where init_domid() would have 
>> return a non-zero value.
>>
>> So the static can be dropped and changed to domid_t.
> 
> Looking at one of the follow-up patch, I see:
> 
>   static always_inline bool is_initial_domain(const struct domain *d)
>   {
> -    static int init_domain_id = 0;
> -
> -    return d->domain_id == init_domain_id;
> +    return d->role & ROLE_UNBOUNDED_DOMAIN;
>   }
> 
> So is there any point to have the local variable? IOW, can't this simply 
> be "d->domain_id == 0"?

Nope, you are right. All need for it drops with the static gone.

v/r,
dps


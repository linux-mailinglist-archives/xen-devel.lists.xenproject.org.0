Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D486076EAC1
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 15:36:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576384.902455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRYV4-00052r-Rn; Thu, 03 Aug 2023 13:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576384.902455; Thu, 03 Aug 2023 13:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRYV4-00050U-OA; Thu, 03 Aug 2023 13:36:22 +0000
Received: by outflank-mailman (input) for mailman id 576384;
 Thu, 03 Aug 2023 13:36:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRYV3-00050O-Lz
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 13:36:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRYUx-0007Rw-KE; Thu, 03 Aug 2023 13:36:15 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.22.21]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRYUx-0007VQ-DO; Thu, 03 Aug 2023 13:36:15 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=M9kx6ktWiLuSAUESx8zDJ4d5/ShxILEjEUccuRaSgU4=; b=FNJCDzZ2NfQ6yOOgKz/pJEhpcR
	NbSUJ4robBR5lWxtQLrDGGNq0VXfl1a0VazHvqxQ2OPDY8Ie1uLH2SlsDDvFnDMR5RKrOlMoLl8f0
	0GI/DBbx0PX+d84GtFD/vAa3+LgwtiVsfqgGcya9OtvGsiSKMns62gQPfxy/sqinM0KU=;
Message-ID: <da257167-683f-4a2b-a14e-b55ae208bd7e@xen.org>
Date: Thu, 3 Aug 2023 14:36:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/6] dom0: replace explict zero checks
Content-Language: en-GB
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jan Beulich <jbeulich@suse.com>
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <97319344-02d2-4fa4-9325-fbcd74364bdf@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Daniel,

On 03/08/2023 14:33, Daniel P. Smith wrote:
> On 8/2/23 03:46, Jan Beulich wrote:
>> On 01.08.2023 22:20, Daniel P. Smith wrote:
>>> A legacy concept is that the initial domain will have a domain id of 
>>> zero. As a
>>> result there are places where a check that a domain is the inital 
>>> domain is
>>> determined by an explicit check that the domid is zero.
>>
>> It might help if you at least outlined here why/how this is going to
>> change.
> 
> Okay, I will try expanding on this further.
> 
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -1058,6 +1058,13 @@ void scheduler_disable(void);
>>>   void watchdog_domain_init(struct domain *d);
>>>   void watchdog_domain_destroy(struct domain *d);
>>> +static always_inline bool is_initial_domain(const struct domain *d)
>>> +{
>>> +    static int init_domain_id = 0;
>>
>> This may then also help with the question on why you use a static
>> variable here. (In any event the type of this variable wants to
>> be correct; plain int isn't appropriate ...
> 
> Ah, so this is a dated patch that I brought because of the abstraction 
> it made. The intent in the original series for making it static was in 
> preparation to handle the shim case where init_domid() would have return 
> a non-zero value.
> 
> So the static can be dropped and changed to domid_t.

Looking at one of the follow-up patch, I see:

  static always_inline bool is_initial_domain(const struct domain *d)
  {
-    static int init_domain_id = 0;
-
-    return d->domain_id == init_domain_id;
+    return d->role & ROLE_UNBOUNDED_DOMAIN;
  }

So is there any point to have the local variable? IOW, can't this simply 
be "d->domain_id == 0"?

Cheers,

-- 
Julien Grall


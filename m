Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4CF4F3352
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 15:15:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299044.509409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbj0d-0007Uu-VU; Tue, 05 Apr 2022 13:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299044.509409; Tue, 05 Apr 2022 13:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbj0d-0007Rw-R3; Tue, 05 Apr 2022 13:14:11 +0000
Received: by outflank-mailman (input) for mailman id 299044;
 Tue, 05 Apr 2022 13:14:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FxJD=UP=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nbj0c-0007Rq-GJ
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 13:14:10 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45d020dd-b4e2-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 15:14:08 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1649164442540753.2553172609371;
 Tue, 5 Apr 2022 06:14:02 -0700 (PDT)
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
X-Inumbo-ID: 45d020dd-b4e2-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1649164443; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mg5267UnM7WXh/N70WrNDHnpd4W+YjTEY1qM92V7y2Nkpzx9ewR+UU2vdVqVibCrPte3K1Ara6OFOiCI1dLLn9/rjCeI1+hkfHICv3TzxWsuVcsnFgHI2wgcyl8BGD+XE0shzANGTZ0easqOU4JyU1tUB0hiyCD4ZptxoFYB/Pg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1649164443; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=rrO5+QU9QPNy/h5i5VmmGW/q+AsY/3yLxFeX1M9sdHY=; 
	b=lZ60eJL91SkAescWg8PYFneb+YpL9CUGtf6HNnSzl07AfSUFf8bAKcP5CSq1/d2kYhT1dROiJFcF64ZxCp7nYE4Tc/iXTby4lFahrlokEjEqrze/YnXFaiNn81ln3J6Er0hMcsJ6V4jQ8SA357pdiTtM4qpg0Ho5ha7hnAj7TQg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649164443;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=rrO5+QU9QPNy/h5i5VmmGW/q+AsY/3yLxFeX1M9sdHY=;
	b=LIwX/lwmM5SoL4ZMC9Uaagb91nPKJZcJ3kSafWSC0kqBdGbriiA40yeSE7h73pk5
	U/Ayu1moQTIiRz3LS6Vh781XtMp0hURet6CYyBf5/sgKK6YDmbgkNeAxLjvijMMnyZ9
	BIOxmJCt8nwNm8BB3blZZNWvaJr7inl8gtIVb1Wk=
Message-ID: <903c1c73-c310-d7c0-a95e-0f84c77b02f1@apertussolutions.com>
Date: Tue, 5 Apr 2022 09:13:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220330181734.30319-1-jandryuk@gmail.com>
 <f5225d49-fcc5-c02c-2e48-cd96cc2bd940@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] x86/irq: Skip unmap_domain_pirq XSM during destruction
In-Reply-To: <f5225d49-fcc5-c02c-2e48-cd96cc2bd940@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/5/22 04:18, Jan Beulich wrote:
> On 30.03.2022 20:17, Jason Andryuk wrote:
>> xsm_unmap_domain_irq was seen denying unmap_domain_pirq when called from
>> complete_domain_destroy as an RCU callback.  The source context was an
>> unexpected, random domain.  Since this is a xen-internal operation,
>> we don't want the XSM hook denying the operation.
>>
>> Check d->is_dying and skip the check when the domain is dead.  The RCU
>> callback runs when a domain is in that state.
> 
> One question which has always been puzzling me (perhaps to Daniel): While
> I can see why mapping of an IRQ needs to be subject to an XSM check, it's
> not really clear to me why unmapping would need to be, at least as long
> as it's the domain itself which requests the unmap (and which I would
> view to extend to the domain being cleaned up). But maybe that's why it's
> XSM_HOOK ...

There are situations for instance where there is a flask-based system
with one or more domains (v-platform-mgr) that are each responsible for
the management of a subset of domains and are responsible for
hotplugging in and out a device, i.e. granting the privilege to a
v-platform-mgr to call PHYSDEVOP_map_pirq/PHYSDEVOP_unmap_pirq, for the
domains each one is managing.

>> ---
>> Dan wants to change current to point at DOMID_IDLE when the RCU callback
>> runs.  I think Juergen's commit 53594c7bd197 "rcu: don't use
>> stop_machine_run() for rcu_barrier()" may have changed this since it
>> mentions stop_machine_run scheduled the idle vcpus to run the callbacks
>> for the old code.
>>
>> Would that be as easy as changing rcu_do_batch() to do:
>>
>> +        /* Run as "Xen" not a random domain's vcpu. */
>> +        vcpu = get_current();
>> +        set_current(idle_vcpu[smp_processor_id()]);
>>          list->func(list);
>> +        set_current(vcpu);
>>
>> or is using set_current() only acceptable as part of context_switch?
> 
> Indeed I would question any uses outside of context_switch() (and
> system bringup).

I am not familiar with the details of the scheduler, but from a higher
level, conceptual perspective, I do not understand why an idle domain
task is being executed without an explicit context switch to the idle
domain to ensure the current world view is consistent with the task
execution scope. Just seems to me like this is creating a situation
where things have the potential to go sideways/wrong.

v/r,
dps


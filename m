Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D232236F649
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 09:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120325.227567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcNNL-0002Rb-I9; Fri, 30 Apr 2021 07:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120325.227567; Fri, 30 Apr 2021 07:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcNNL-0002RC-Eu; Fri, 30 Apr 2021 07:15:47 +0000
Received: by outflank-mailman (input) for mailman id 120325;
 Fri, 30 Apr 2021 07:15:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T1Xz=J3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lcNNJ-0002R7-DC
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 07:15:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b35afb90-87dd-46e8-9376-32700131ee9c;
 Fri, 30 Apr 2021 07:15:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 72C85AF5B;
 Fri, 30 Apr 2021 07:15:43 +0000 (UTC)
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
X-Inumbo-ID: b35afb90-87dd-46e8-9376-32700131ee9c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619766943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0XjVmHj3MbE84koE11ssAbkBVMI2IbbCKpyNWsexKNs=;
	b=qxsZGqf+E+bmAAjm6BrOK+Y+bWreHOLEIhEFwtnskDLHH8AJBLiWIiRuWVAZnIfxsiRWOo
	Oa9DlbOGTPyNfvkKPji5qpzEqaa0NQ8/KJ2dLbXHYe9SXn4MwqDhlnJFLDUceZJ83cBt1S
	OzJO96H5Q6wtpFMndlrsPbiywsrIM+0=
Subject: Re: [RFC PATCH] iommu: make no-quarantine mean no-quarantine
To: Scott Davis <scott.davis@starlab.io>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "paul@xen.org" <paul@xen.org>
References: <0a292d952ff71dbfed5234d27b42a05f7b49a1fe.1619451434.git.scott.davis@starlab.io>
 <cea1d2d0-fd69-a4cd-6653-dd881d07b96a@suse.com>
 <56F61E81-511E-4ECA-B2A0-B91F250804D7@starlab.io>
 <237ad45b-b68d-9d31-0fbc-1af52dfca808@suse.com>
 <dc6556ae-c653-8519-1a81-9524e4472f26@xen.org>
 <2A65573D-2DD6-49C7-B34C-27B15FD620B2@starlab.io>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ec0cc346-3d56-afec-7414-bce81e9eea1d@suse.com>
Date: Fri, 30 Apr 2021 09:15:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <2A65573D-2DD6-49C7-B34C-27B15FD620B2@starlab.io>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.04.2021 23:04, Scott Davis wrote:
> On 4/28/21, 3:20 AM, Paul Durrant wrote:
>>> Following the extension to the command line option I'm putting in place
>>> in "IOMMU: make DMA containment of quarantined devices optional" (which
>>> I still need to get around to address review feedback for and resubmit),
>>> I'd be inclined to suggest "iommu=quarantine=always" or
>>> "iommu=quarantine=on-assign". Unless of course we'd prefer to have the
>>> caller of the assignment operation have full control over the behavior
>>> here anyway (in which case a command line option control simply is not
>>> necessary).
>>
>> I'm still not entirely sure why not quarantining on is a problem, other
>> than it triggering an as-yet undiagnosed issue in QEMU, but I agree that
>> that the expectation of 'no-quarantine' meaning just that (i.e. the old
>> dom0->domU and domU->dom0 transitions are re-instated) is reasonable. Do
>> we really want yet more command line options?
> 
> Regarding the problem in QEMU, I traced the crash trigger down to a
> write to the IQ tail register during the mapping operation into dom_io
> (backtrace below). Along the way I noticed that, since a non-present
> entry was being flushed, flush_context_qi only performs this
> invalidation on an IOMMU with caching mode enabled (i.e. a software
> IOMMU). Therefore this issue is probably only hittable when nesting.
> Disabling caching mode on the QEMU vIOMMU was enough to prevent the
> crash and give me a working system.
> 
> (gdb) si
> 0xffff82d04025b68b  72  in qinval.c
>    0xffff82d04025b687 <qinval_update_qtail+43>: ... shl    $0x4,%r12
> => 0xffff82d04025b68b <qinval_update_qtail+47>: ... mov    %r12,0x88(%rax)
> (gdb) bt
> #0  0xffff82d04025b68b in qinval_update_qtail (...) at qinval.c:72
> #1  0xffff82d04025baa7 in queue_invalidate_context_sync (...) at qinval.c:101
> #2  flush_context_qi (...) at qinval.c:341
> #3  0xffff82d040259125 in iommu_flush_context_device (...) at iommu.c:400
> #4  domain_context_mapping_one (...) at iommu.c:1436
> #5  0xffff82d040259351 in domain_context_mapping (...) at iommu.c:1510
> #6  0xffff82d040259d20 in reassign_device_ownership (...) at iommu.c:2412
> #7  0xffff82d040259f19 in intel_iommu_assign_device (...) at iommu.c:2476
> #8  0xffff82d040267154 in assign_device (...) at pci.c:1545
> #9  iommu_do_pci_domctl (...) at pci.c:1732
> #10 0xffff82d040264de3 in iommu_do_domctl (...) at iommu.c:539
> #11 0xffff82d040322ca5 in arch_do_domctl (...) at domctl.c:1496
> #12 0xffff82d040205a19 in do_domctl (...) at domctl.c:956
> #13 0xffff82d040319476 in pv_hypercall (...) at hypercall.c:155
> #14 0xffff82d040390432 in lstar_enter () at entry.S:271
> #15 0x0000000000000000 in ?? ()

Interesting. This then leaves the question whether we submit a bogus
command, or whether qemu can't deal (correctly) with a valid one here.
So far you didn't tell us what the actual crash was. I guess it's not
even clear to me whether it's Xen or qemu that did crash for you. But
I have to also admit that until now it wasn't really clear to me that
you ran Xen _under_ qemu - instead I was assuming there was an
interaction problem with a qemu serving a guest.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E47ED4E797A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 17:55:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294855.501581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXnDz-0001dM-DE; Fri, 25 Mar 2022 16:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294855.501581; Fri, 25 Mar 2022 16:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXnDz-0001ag-A0; Fri, 25 Mar 2022 16:55:43 +0000
Received: by outflank-mailman (input) for mailman id 294855;
 Fri, 25 Mar 2022 16:55:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nXnDx-0001aI-It
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 16:55:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXnDw-0007Pj-Fb; Fri, 25 Mar 2022 16:55:40 +0000
Received: from [54.239.6.185] (helo=[192.168.14.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXnDw-0004Ph-8E; Fri, 25 Mar 2022 16:55:40 +0000
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
	bh=ZYKelxMqoYXp5nROzK/duNJ/+FTEhsyxsMFRh5kdYNs=; b=5UCPZL1MOs138Kr4h0NqROqKHY
	Oz7/2Qld3TBDPjs091dZFUXt46ehvnd63SBii12Y/TW10+gbY15kE/pMU2ulx1oHoa0MKj6fdaiMc
	ZgzW55iSfIufDp2v2FcWjhWg2R8aw+xVH5p3VtuG4F2Ocr18VmByBh8h86uskIMRsaew=;
Message-ID: <820bf8f6-543d-5b2f-fda5-720cf5f476c7@xen.org>
Date: Fri, 25 Mar 2022 16:55:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/5] xen: make evtchn_alloc_unbound public
To: "Daniel P. Smith" <dpsmith.dev@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
 Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
 <20220128213307.2822078-2-sstabellini@kernel.org>
 <2f05e63a-96c3-e78f-f7e4-36fd17fcd58c@gmail.com>
 <alpine.DEB.2.22.394.2203221711110.2910984@ubuntu-linux-20-04-desktop>
 <c57dc9a9-e2ca-74c6-4fde-e2a6f1400de5@suse.com>
 <alpine.DEB.2.22.394.2203241522510.2910984@ubuntu-linux-20-04-desktop>
 <ccb85826-feb8-7c26-64e3-0a459bdaf8b6@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ccb85826-feb8-7c26-64e3-0a459bdaf8b6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 25/03/2022 15:45, Daniel P. Smith wrote:
>>>> The existing XSM check in evtchn_alloc_unbound cannot work and should
>>>> not work: it is based on the current domain having enough privileges to
>>>> create the event channel. In this case, we have no current domain at
>>>> all. The current domain is Xen itself.
>>>
>>> And DOM_XEN cannot be given the appropriate permission, perhaps
>>> explicitly when using a real policy and by default in dummy and SILO
>>> modes?
>>
>> The issue is that the check is based on "current", not one of the
>> domains passed as an argument to evtchn_alloc_unbound. Otherwise,
>> passing DOMID_XEN would be straightforward.
>>
>> We would need to use a hack (like Daniel wrote in the other email) to
>> set the idle_domain temporarily as a privileged domain only for the sake
>> of passing an irrelevant (irrelevant as in "not relevant to this case")
>> XSM check. That cannot be an improvement. Also, setting current to a
>> "fake" domain is not great either.
> 
> My suggestion was not to intended to be simply a hack but looking at the
> larger issue instead of simply doing a targeted fix for this one
> instnace. While I cannot give an example right off hand, the reality is,
> at least for hyperlaunch, that we cannot say for certain there will not
> be further resource allocations that is protected by the security
> framework and will require preliminary handling by the construction
> logic in the hypervisor. The low-complexity approach is to address each
> one in a case-by-case fashion using direct calls that go around the
> security framework. A more security conscience, and higher complexity,
> approach would be to consider a least-privilege approach and look at
> introducing the ability to do controlled switching of contexts, i.e.
> moving `current` from DOMID_IDLE to DOMID_CONSTRUCT, to one that is
> granted only the necessary privileges to do the resource allocations in
> which it is limited.
> 
> This is also not the first time this issue has come up, I don't recall
> the exact thread but several months ago someone ran into the issue they
> need to make a call to a resource function and was blocked by XSM
> because DOMID_IDLE has no privileges.

This was in the context of Live-Updating Xen. We are trying to re-use as 
much as possible the code used by the hypercalls. Those functions may 
contain xsm check that would fail because current would be an idle vCPU.

For the full context:

https://lore.kernel.org/xen-devel/bfd645cf42ef7786183be15c222ad04beed362c0.camel@xen.org/

> The reality is that the idea of
> monolithic high-privileged entities is being dropped in favor of
> least-privilege, and where possible hardware enforced, constraint. This
> can be seen with Intel de-privileging SMM and running SMI handlers in
> constrained ring 3. Arm is gaining capability pointers, CHERI, that will
> enable the possibility for constrained, least-privileged kernel
> subsystems. Would it not be advantageous for Xen to start moving in such
> a direction that would enable it to provide a new level of safety and
> security for consumers of Xen?
> 
> Coming back to the short-term, I would advocate for introducing the
> concept and abstraction of constrained context switching through a set
> of function calls, which would likely be under XSM to allow policy
> enforcement. Likely the introductory implementation would just mask the
> fact that it is just setting `is_privileged` for DOMID_IDLE. Future
> evolution of the capability could see the introduction of new
> "contexts", whether they are represented by a domain could be determined
> then, and the ability to do controlled switching based on policy.

+1 with this idea.

Cheers,

-- 
Julien Grall


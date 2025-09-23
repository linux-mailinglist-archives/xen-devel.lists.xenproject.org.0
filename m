Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE12B9737B
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 20:41:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128659.1468945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v17xM-0000X5-Lu; Tue, 23 Sep 2025 18:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128659.1468945; Tue, 23 Sep 2025 18:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v17xM-0000VL-JG; Tue, 23 Sep 2025 18:41:40 +0000
Received: by outflank-mailman (input) for mailman id 1128659;
 Tue, 23 Sep 2025 18:41:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1v17xK-0000VF-Oh
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 18:41:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1v17xF-006RMu-36;
 Tue, 23 Sep 2025 18:41:33 +0000
Received: from [2a02:8012:3a1:0:5196:5816:243d:dc7b]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1v17xF-009r5P-38;
 Tue, 23 Sep 2025 18:41:33 +0000
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
	bh=XQoMntzr3jRn5Fio9xgaseIZXKZnlh/BYdakeFBwYy8=; b=J145cdboYr3cRczGKlqSQTVevH
	rdj6KlBft1VqmPVf5EBdOoxEvXyHELymLIZfj8YZF6wkuMpNmN1FZ+s8OtKSbCxbnwlh30GviUucq
	nRnb3lFzqXiH53iWsRMcHBL6x14WXgSXNrSjUK2Id3C9KCENKYEuwMZRZki8403l8XPc=;
Message-ID: <7a12dbe0-c3dd-4e26-b52d-610e065236da@xen.org>
Date: Tue, 23 Sep 2025 19:41:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] arm/sysctl: Implement cpu hotplug ops
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1758197507.git.mykyta_poturai@epam.com>
 <34c9b488ad949cbcd93bd8578dd5bc180fab8738.1758197507.git.mykyta_poturai@epam.com>
 <ddce2b69-3ba3-4c04-ab82-092ce2c98cf3@xen.org>
 <c05674a4-2090-4453-98a8-8f4cc0f54c5c@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c05674a4-2090-4453-98a8-8f4cc0f54c5c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 18/09/2025 15:51, Jan Beulich wrote:
> On 18.09.2025 15:35, Julien Grall wrote:
>> On 18/09/2025 13:16, Mykyta Poturai wrote:
>>> +static long cpu_hotplug_sysctl(struct xen_sysctl_cpu_hotplug *hotplug)
>>> +{
>>> +    bool up;
>>> +
>>> +    switch (hotplug->op) {
>>> +        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
>>> +            if ( hotplug->cpu == 0 )
>>
>> I can't find a similar check on x86. Do you have any pointer?
> 
> When CPU 0 cannot be brought down (see cpu_down()), tryin to bring it up
> is kind of pointless, and hence can perhaps be short circuited like this?

Thanks for the clarification, I missed the check in cpu_down(). That 
said, I don't see any value to short circuit it. In fact, I see this as 
more a risk because if we ever decide to allow CPU 0 to be offlined, 
then it would be more difficult to find places where we short circuit it.

So I would rather prefer if we remove the checks.

Cheers,

-- 
Julien Grall



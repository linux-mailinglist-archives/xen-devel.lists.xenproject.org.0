Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8364699D0
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 16:01:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239199.414587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFUP-0007Lt-3S; Mon, 06 Dec 2021 15:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239199.414587; Mon, 06 Dec 2021 15:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFUO-0007K1-Vm; Mon, 06 Dec 2021 15:01:12 +0000
Received: by outflank-mailman (input) for mailman id 239199;
 Mon, 06 Dec 2021 15:01:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w5uy=QX=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1muFUM-0007Jv-P2
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 15:01:10 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5629dce5-56a5-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 16:01:05 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DC701042;
 Mon,  6 Dec 2021 07:01:05 -0800 (PST)
Received: from [10.57.4.16] (unknown [10.57.4.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 493993F5A1;
 Mon,  6 Dec 2021 07:01:04 -0800 (PST)
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
X-Inumbo-ID: 5629dce5-56a5-11ec-8a4d-196798b21f7b
Subject: Re: [PATCH] xen/arm: Do not include in the image functions...
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211206141923.26757-1-michal.orzel@arm.com>
 <61a730e2-fe20-ae74-bf47-a283c5efc717@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <e149b283-23bd-9d8f-4be4-4a26722f0ed6@arm.com>
Date: Mon, 6 Dec 2021 16:00:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <61a730e2-fe20-ae74-bf47-a283c5efc717@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Julien,

On 06.12.2021 15:39, Julien Grall wrote:
> Hi Michal,
> 
> On 06/12/2021 14:19, Michal Orzel wrote:
>> vtimer_update_irqs, vtimer_update_irq and vcpu_update_evtchn_irq if
>> CONFIG_NEW_VGIC is not set.
>>
>> enter_hypervisor_from_guest is protecting calls to these functions
>> with CONFIG_NEW_VGIC but their definitions and declarations are not > protected. This means that we are including them in the image even
>> though we are not making use of them. Fix that.
> 
> While I agree, they are only used by the new vGIC, the implementation of the functions are not. So I don't think they should be protected by CONFIG_NEW_VGIC.
> 
> Actually, I am not convinced they should be protected. But I guess you did that for a reason. Would you be able to clarify what is your reason?
> 
From what I know + what the commit introducing these fucntions states (b9db96f71a74), the current vGIC does not handle level-triggered vIRQs.
The functionality of these functions is only related to new VGIC implementation which can handle level triggered vIRQs.
So I do not think that these functions are generic and thus I believe they should be protected.
> Cheers,
> 

Cheers,
Michal


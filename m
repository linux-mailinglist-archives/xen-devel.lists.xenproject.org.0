Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDD23089C3
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 16:12:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78231.142235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5VRc-0007d9-Up; Fri, 29 Jan 2021 15:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78231.142235; Fri, 29 Jan 2021 15:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5VRc-0007cq-RY; Fri, 29 Jan 2021 15:12:20 +0000
Received: by outflank-mailman (input) for mailman id 78231;
 Fri, 29 Jan 2021 15:12:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l5VRb-0007ck-8J
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 15:12:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5VRZ-0008Ht-Hu; Fri, 29 Jan 2021 15:12:17 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5VRZ-0007V7-Az; Fri, 29 Jan 2021 15:12:17 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=443y3A00IJv6E4B/j4BjN0KQZ2tv8+8FEFvGM7/VKCc=; b=B9vB7QxpAgMqcVsvQ6qE6Tssd/
	jmT0oZiFUL7Z94+/rtzIypD9UPkei9iNmlVx90s0kvCs5YUeSNTNYJjJ/aZMr/oVucWw2sxQMY51o
	CrsgtM1D2Bww+MPTqni3LzyXZ2SCYZvfW0H3+h9f8bhh1ChkXjFKyJAiU1XCs9FuKPaw=;
Subject: Re: [PATCH] xen/arm: smmuv3: Disable the SMMUv3 driver when ACPI is
 enabled.
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
References: <1a228e438f405c376d6fc36e4625c6c09f9d78f3.1611916545.git.rahul.singh@arm.com>
 <57F5188D-2151-4790-9DEA-FC88C487692B@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <648db3d5-5fca-0875-3b6a-6617ee0d9694@xen.org>
Date: Fri, 29 Jan 2021 15:12:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <57F5188D-2151-4790-9DEA-FC88C487692B@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 29/01/2021 14:19, Bertrand Marquis wrote:
> Hi Rahul,
> 
>> On 29 Jan 2021, at 10:47, Rahul Singh <Rahul.Singh@arm.com> wrote:
>>
>> SMMUv3 driver does not support ACPI device probe.If APCI is enabled with
>> SMMUv3 driver compiler will throw an error.
>>
>> Disable SMMUv3 driver when ACPI is enabled in kconfig to fix compilation
>> error.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

I will commit it later today.

Cheers,

-- 
Julien Grall


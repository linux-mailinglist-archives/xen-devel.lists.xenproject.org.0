Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3DDA30BC5
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 13:33:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885514.1295323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thpRh-0003wQ-1Q; Tue, 11 Feb 2025 12:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885514.1295323; Tue, 11 Feb 2025 12:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thpRg-0003uL-V6; Tue, 11 Feb 2025 12:32:56 +0000
Received: by outflank-mailman (input) for mailman id 885514;
 Tue, 11 Feb 2025 12:32:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1thpRf-0003uF-BI
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 12:32:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1thpRe-00D4y2-1A;
 Tue, 11 Feb 2025 12:32:54 +0000
Received: from [2a02:8012:3a1:0:6936:5dcd:97cd:143f]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1thpRd-0057l5-2Y;
 Tue, 11 Feb 2025 12:32:53 +0000
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
	bh=ygqXgTzwfHWEQEqCV3QUGFlvjPHQk5Io6/bt+qo3t9I=; b=vwXu66pXzp0fl3yYA6r6wAJFR0
	dagitFA/FdQjU2f9U+3t89AEfS0FtC/CxhA9UM9GlhtX3b7EkZZsitCGyrnmC3ZtX7PKmIK6PrnI1
	08T7pNCRRWPw/7j2BQBaK1eWL9AKpI1DuRJSNY3RaJBjTqGKgcJG0Pe5g15DMl6xAyJM=;
Message-ID: <e1c5fcb3-4647-483f-b600-deae9f68da78@xen.org>
Date: Tue, 11 Feb 2025 12:32:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] device-tree: optimize dt_device_for_passthrough()
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Grygorii Strashko <gragst.linux@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <20250211111853.2199764-1-grygorii_strashko@epam.com>
 <d5f00c3a-81a8-4221-acc2-de90fb92deee@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d5f00c3a-81a8-4221-acc2-de90fb92deee@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/02/2025 11:57, Orzel, Michal wrote:
> On 11/02/2025 12:18, Grygorii Strashko wrote:
>>
>>
>> The dt_device_for_passthrough() is called many times during Xen
>> initialization and Dom0 creation. On every call it traverses struct
>> dt_device_node properties list and compares compares properties name with
> double "compares"
> 
>> "xen,passthrough" which is runtime overhead. This can be optimized by
> Are you sure? Looking at the calls, it's almost only used at boot except for dt
> overlay.
> 
>> marking dt_device_node as passthrough while unflattening DT.
>>
>> This patch introduced new struct dt_device_node property "is_passthrough"
>> which is filled if "xen,passthrough" property is present while unflattening
>> DT and dt_device_for_passthrough() just return it's value.
> In the past we were skeptical about adding new fields to the dt_device_node
> structure for use cases like this one. I would say this optimization is not
> worth it. Also, why would you optimize dt_device_for_passthrough but not
> e.g. dt_device_is_available.

So we are trading speed with memory usage. It looks like we may be using 
a padding, although I didn't check whether the existing structure could 
be packed...

> 
> You can check with other Arm maintainers.

Before forging an opinion, I'd like to see some numbers showing the 
performance improvement. Also, is this impacting only boot?

Also, I agree with Michal, if this is a concern for 
dt_device_device_for_passthrough(). Then it would be a concern for a few 
others calls using dt_find_property(). Are you going to modify all of them?

Cheers,

-- 
Julien Grall



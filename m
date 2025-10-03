Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95523BB66F5
	for <lists+xen-devel@lfdr.de>; Fri, 03 Oct 2025 12:15:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136531.1473078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4cob-0000fV-8L; Fri, 03 Oct 2025 10:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136531.1473078; Fri, 03 Oct 2025 10:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4cob-0000dW-5X; Fri, 03 Oct 2025 10:15:05 +0000
Received: by outflank-mailman (input) for mailman id 1136531;
 Fri, 03 Oct 2025 10:15:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1v4coZ-0000dQ-9Y
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 10:15:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1v4coY-006gih-0f;
 Fri, 03 Oct 2025 10:15:02 +0000
Received: from [2a02:8012:3a1:0:edd5:683d:374:f8b7]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1v4coY-00Erka-0u;
 Fri, 03 Oct 2025 10:15:02 +0000
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
	bh=QHqsSaa0tp3OBKD00tQQgJQcfnDo6U5pd0oPTSU72AA=; b=uhuB+0QxkiexY2yunALUaTXGhq
	nHMN2cR+W1EDQa7onNa0lJ/JDOscvxj0I1AFdAEnfsFs4AorqutXfhU0XHc0gXqujxiW804jKmIDp
	64uZ7UyfdRaCBvIYIwK5QOde5DC/ZwFvBSEOyvCO4jsD0LQRRhdQXVf0ayN86t2gkC3I=;
Message-ID: <55d156c9-5a05-4cb7-9b29-93adaaede5d0@xen.org>
Date: Fri, 3 Oct 2025 11:14:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: XEN_DOMCTL_get_address_size hypercall support
Content-Language: en-GB
To: Demi Marie Obenour <demiobenour@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 alejandro.garciavallejo@amd.com
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <39511522aae7dab5766ef2ebfed1d13abec8610e.1759324344.git.milan_djokic@epam.com>
 <bf042eea-ed2d-431e-b1f0-7be0c09194ef@citrix.com>
 <967b62ca-8aed-4abf-8fa5-30769f46a5ff@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <967b62ca-8aed-4abf-8fa5-30769f46a5ff@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Demi,

On 02/10/2025 19:27, Demi Marie Obenour wrote:
> On 10/2/25 06:10, Andrew Cooper wrote:
>> On 01/10/2025 9:01 pm, Milan Djokic wrote:
>>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>>>
>>> ---
>>> XEN_DOMCTL_get_address_size hypercall is not implemented for arm (only for x86)
>>> It would be useful to have this hypercall supported for arm64, in order to get
>>> current guest addressing mode and also to verify that XEN_DOMCTL_set_address_size
>>> performs switch to target addressing mode (instead of relying on its returned error code only).
>>
>> Please don't copy this misfeature of x86 PV guests into ARM.
>>
>> Letting domains be of variable bitness after domain create leads to a
>> whole lot of bugs, many security relevant.
>>
>> 32bit vs 64bit should be an input to domain_create(), not something that
>> is edited after the domain has been constructed.
> 
> Does this mean that Xen guests cannot support multiarch?

I can't speak for x86. But for Arm, the endianess of EL1 (OS) is fixed 
when the vCPU is booting. You could in theory have a domain with a mix 
of 64-bit and 32-bit vCPUs. But that's not supported by Xen (all vCPUs 
should have the same bitness) and also I am not aware of any mainstream 
OS able to deal with multiple bitness. Most likely, you will need to run 
two OSes and create your custom OS.

Also, I believe XEN_DOMCTL_get_address_size would not be suitable for 
such setup.

Cheers,

-- 
Julien Grall



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D145641862
	for <lists+xen-devel@lfdr.de>; Sat,  3 Dec 2022 19:11:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452710.710481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1WyO-0008C0-MZ; Sat, 03 Dec 2022 18:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452710.710481; Sat, 03 Dec 2022 18:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1WyO-000892-Jk; Sat, 03 Dec 2022 18:10:48 +0000
Received: by outflank-mailman (input) for mailman id 452710;
 Sat, 03 Dec 2022 18:10:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p1WyN-00088w-Bf
 for xen-devel@lists.xenproject.org; Sat, 03 Dec 2022 18:10:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1WyM-0008CX-PI; Sat, 03 Dec 2022 18:10:46 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1WyM-0005Gp-IV; Sat, 03 Dec 2022 18:10:46 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=t5xUt+Abme8KPoMQk7u5Wdch+LLdsSuvFSoDlQ2xwfY=; b=usraWWip8gtGdhj89f8GDsPL9R
	CIwpiQvuQdnKMy6kxV6GJcQb6xdcAHCWBXFrw6uWl8A8nwU4F/8bLqjNcQzIWmHAdWk7JP7u7vhWe
	ivoPH7C+Ne5PvuCzg/54L/cX6GFXoE8Ok9orWutwLHyltUjMlenn03VaT02gjJljJIOE=;
Message-ID: <3890dac6-6c66-ca70-3596-aa5c654879e1@xen.org>
Date: Sat, 3 Dec 2022 18:10:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] Arm64: make setup_virt_paging()'s pa_range_info[] static
From: Julien Grall <julien@xen.org>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <5a249b00-5467-1733-cab0-fd6d55765e20@suse.com>
 <4a93a89a-7d00-491d-766e-fd9a524d96c0@xen.org>
In-Reply-To: <4a93a89a-7d00-491d-766e-fd9a524d96c0@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/11/2022 16:01, Julien Grall wrote:
> Hi Jan,
> 
> On 29/11/2022 15:39, Jan Beulich wrote:
>> While not as inefficient as it would be on x86 (due to suitable constant
>> loading and register pair storing instructions being available to fill
>> some of the fields), having the compiler construct an array of constants
>> on the stack still looks odd to me.
> 
> The function is only called once at boot. So this seems more a 
> micro-optimization than anything else.
> 
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

I have now committed the patch.

Cheers,

-- 
Julien Grall


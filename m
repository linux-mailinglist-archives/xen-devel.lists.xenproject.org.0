Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 364D8498735
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 18:48:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259943.448777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC3Rw-0005H4-Tj; Mon, 24 Jan 2022 17:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259943.448777; Mon, 24 Jan 2022 17:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC3Rw-0005FE-Pw; Mon, 24 Jan 2022 17:48:16 +0000
Received: by outflank-mailman (input) for mailman id 259943;
 Mon, 24 Jan 2022 17:48:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nC3Rv-0005F8-SK
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 17:48:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nC3Rv-0006ij-Ob; Mon, 24 Jan 2022 17:48:15 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[10.85.42.33])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nC3Rv-0006mv-Hz; Mon, 24 Jan 2022 17:48:15 +0000
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
	bh=oK4GVNwrpW3Z8T8/lob69LF98KHBWPmLAUjlHuQ8Ca4=; b=SR5riG3c/j+uzbOVwDZGqaghEw
	D2m1n4cMdgeC39EOogVisIHj0m2EHQuFAM+oHn9PytWLPf7YNspJQ+3aG6z8Pm0WIgfWzC+wu5J0W
	V6pv0nd4fxgIBM+cdCig8Y4xQX8+zju4k1MxwkFoe/KuTp6j4t3i4hYnmp5ciWVBG7KU=;
Message-ID: <80649611-3644-518b-d779-68fa0080ff70@xen.org>
Date: Mon, 24 Jan 2022 17:48:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v4 05/11] xen/arm: introduce direct-map for domUs
To: Stefano Stabellini <sstabellini@kernel.org>,
 Penny Zheng <penny.zheng@arm.com>
Cc: xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20211220052123.969876-1-penny.zheng@arm.com>
 <20211220052123.969876-6-penny.zheng@arm.com>
 <alpine.DEB.2.22.394.2201131447520.19362@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2201131447520.19362@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/01/2022 22:53, Stefano Stabellini wrote:
>> +    kinfo->mem.nr_banks = nr_banks;
>> +
>> +    /*
>> +     * The property 'memory' should match the amount of memory given to
>> +     * the guest.
>> +     * Currently, it is only possible to either acquire static memory or
>> +     * let Xen allocate. *Mixing* is not supported.
>> +     */
>> +    if ( kinfo->unassigned_mem != 0 )
>> +    {
>> +        printk(XENLOG_ERR
>> +               "Size of \"memory\" property doesn't match up with the sum-up of \"xen,static-mem\". Unsupported configuration.\n");
> 
> This line would benefit from being broken down, but I am also OK if we
> leave it as is

We usually keep the message in a single line because (even if it is more 
than 80 characters) because it helps to find the line afterwards.

Looking at the message, I would drop "Unsupported configuration" because 
it implies that this is because some code is missing (IOW it will be 
supported in the future). However, this is a requirement.

Cheers,

-- 
Julien Grall


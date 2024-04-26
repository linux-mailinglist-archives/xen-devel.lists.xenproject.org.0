Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 336B38B3F48
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 20:32:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713051.1114010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0QLz-00088P-UD; Fri, 26 Apr 2024 18:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713051.1114010; Fri, 26 Apr 2024 18:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0QLz-00086P-Rg; Fri, 26 Apr 2024 18:31:23 +0000
Received: by outflank-mailman (input) for mailman id 713051;
 Fri, 26 Apr 2024 18:31:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s0QLy-00086J-Hi
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 18:31:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s0QLy-0005R3-86; Fri, 26 Apr 2024 18:31:22 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s0QLy-0001kY-0g; Fri, 26 Apr 2024 18:31:22 +0000
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
	bh=d+kOHxXaXx6eMmWHfl/MwbalhN6nQtd6jWqgUZKe9Go=; b=guVe3JuSV7IMcC/BasNLbpLxhm
	MKmmeORd/1qhfdKMJOTDC9i3QiMAVT+7+JqBAX0rh6LBSRVyjH9xY73zSdKhv/MRX2mriEaHv5efl
	PSqYKOHlTiJ17bqRgnrWf/Rdl4dnSM6JyBauGFJPa7oBgUwFQ1CaQEGoD0P0ftr3c6A8=;
Message-ID: <8b436c60-4ca3-4323-ab45-3af72ef60f7f@xen.org>
Date: Fri, 26 Apr 2024 19:31:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 5/5] xen/arm: ffa: support notification
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "patches@linaro.org" <patches@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240426084723.4149648-1-jens.wiklander@linaro.org>
 <20240426084723.4149648-6-jens.wiklander@linaro.org>
 <A0908DCC-6E15-406B-8E29-F241B6EA8BE1@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <A0908DCC-6E15-406B-8E29-F241B6EA8BE1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 26/04/2024 10:20, Bertrand Marquis wrote:
>> +static inline struct domain *ffa_get_domain_by_vm_id(uint16_t vm_id)
>> +{
>> +    /* -1 to match ffa_get_vm_id() */
>> +    return get_domain_by_id(vm_id - 1);
>> +}
>> +
> 
> I think there is a global discussion to have on using get_domain_by_vm_id
> or rcu_lock_live_remote_domain_by_id to make sure the domain is not
> dying when we try to do something with it.
> 
> It does not need to be done here as there are other places to adapt but
> i wanted to raise the question.
> 
> I would like to know what you and also other maintainers think here.
> @Julien/Michal/Stefano ?

Good question. I think the intention is get_domain_by_id() should be 
called when you need a reference for longer.

I would consider to involve the REST in this discussion.

Cheers,

-- 
Julien Grall


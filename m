Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDB94BAA28
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 20:47:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274984.470644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKmk9-0002r0-HU; Thu, 17 Feb 2022 19:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274984.470644; Thu, 17 Feb 2022 19:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKmk9-0002or-EL; Thu, 17 Feb 2022 19:47:09 +0000
Received: by outflank-mailman (input) for mailman id 274984;
 Thu, 17 Feb 2022 19:47:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nKmk8-0002ol-6Q
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 19:47:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nKmk7-0004kG-TJ; Thu, 17 Feb 2022 19:47:07 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nKmk7-0001Mx-Nm; Thu, 17 Feb 2022 19:47:07 +0000
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
	bh=R8vjhRB9J2oZT2Tu2BwVDR8D2Dttl7pUedpYcP58Zxg=; b=67/6P/mUT6zvgmoocy3XbtnEXB
	alNxlYncGkJ/mlVZGr8/ClFFqwLomK4Mu33pfRG2oJ76m/dat/CVtcaVTCEvfVMWViB1LQM0s9KWv
	ZyOtWkSSQocycc/CWRjonh4E7jJtSNsxDN/Y5HSGPQ2IT7QULvYBxhYEWt9rpghFUgwc=;
Message-ID: <32c0c8f9-6e34-1a1a-3638-d3f68b7d6819@xen.org>
Date: Thu, 17 Feb 2022 19:47:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v6 02/11] xen: introduce CDF_directmap
From: Julien Grall <julien@xen.org>
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org
References: <20220214031956.3726764-1-penny.zheng@arm.com>
 <20220214031956.3726764-3-penny.zheng@arm.com>
 <eb39c5a6-f5b1-ccf3-8d2b-802ae7da68d0@xen.org>
 <cdaf49b1-e64a-c104-3b79-a1633a67ee07@suse.com>
 <7d934fd7-b1e2-8a9e-10dd-a213db93c689@xen.org>
In-Reply-To: <7d934fd7-b1e2-8a9e-10dd-a213db93c689@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 17/02/2022 11:01, Julien Grall wrote:
> On 16/02/2022 09:34, Jan Beulich wrote:
>> On 15.02.2022 21:26, Julien Grall wrote:
>>> (+ Jan)
>>>
>>> Hi Penny,
>>>
>>> I am CCing Jan to give him a chance to...
>>
>> Thanks, but ...
>>
>>> On 14/02/2022 03:19, Penny Zheng wrote:
>>>> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
>>>> index cfb0b47f13..24eb4cc7d3 100644
>>>> --- a/xen/include/xen/domain.h
>>>> +++ b/xen/include/xen/domain.h
>>>> @@ -31,6 +31,10 @@ void arch_get_domain_info(const struct domain *d,
>>>>    /* CDF_* constant. Internal flags for domain creation. */
>>>>    /* Is this a privileged domain? */
>>>>    #define CDF_privileged           (1U << 0)
>>>> +#ifdef CONFIG_ARM
>>>> +/* Should domain memory be directly mapped? */
>>>> +#define CDF_directmap            (1U << 1)
>>>> +#endif
>>>
>>> ... comment on this approach. I would be happy to switch to an ASSERT()
>>> if that's preferred.
>>
>> ... I think I did signal agreement with this approach beforehand.
> 
> You raised a concern and it wasn't 100% obvious whether you would still 
> be happy if we merged it as-is.
> 
> So I preferred to ask rather than merging it and getting an angry 
> e-mail/message afterwards :).
> 
> Anyway, this series is now fully acked. So I will commit the series in a 
> bit.

Well, I forgot to explicitely Acked this patch. So:

Acked-by: Julien Grall <jgrall@amazon.com>

This series is now fully committed. Thank you for your contribution!

Cheers,

-- 
Julien Grall


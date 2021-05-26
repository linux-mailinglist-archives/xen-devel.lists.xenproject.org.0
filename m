Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34452391CD1
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 18:18:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132631.247323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llwE9-0005r5-5S; Wed, 26 May 2021 16:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132631.247323; Wed, 26 May 2021 16:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llwE9-0005o9-22; Wed, 26 May 2021 16:17:49 +0000
Received: by outflank-mailman (input) for mailman id 132631;
 Wed, 26 May 2021 16:17:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1llwE7-0005o3-7L
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 16:17:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1llwE6-0004m2-6e; Wed, 26 May 2021 16:17:46 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1llwE6-0003TH-0E; Wed, 26 May 2021 16:17:46 +0000
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
	bh=6D2khYCGcXGlAAyl9wXAEwQtH497WAI1bltKzTZdh+o=; b=vAyWuGf/oDtnm0H4PesELsvIq7
	d0ooTnQ8XT9VXhIp7PUDt4pnZAdQtXQ0SDAk+YOjCfjaxLzvpTTuOj9/6heXyPXj/hZlJXBNovrEv
	wXjHjP356Xysb4k0T6SD6GDLFKkUE59KABx3d1xNxU/fbbFILdZYMJVl7BxHkscSaRgI=;
Subject: Re: [XEN PATCH v1] libxl: use getrandom() syscall for random data
 extraction
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
References: <20210524085858.1902-1-Sergiy_Kibrik@epam.com>
 <13bde708-1d87-a2c7-077f-f08db597ae15@xen.org>
 <AM9PR03MB68362CAC724A6BEE4A50B96AF0249@AM9PR03MB6836.eurprd03.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6f6c29e1-09dc-d7ea-6126-4649100c149d@xen.org>
Date: Wed, 26 May 2021 17:17:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <AM9PR03MB68362CAC724A6BEE4A50B96AF0249@AM9PR03MB6836.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 26/05/2021 10:31, Sergiy Kibrik wrote:
> Hi Julien,
> 
>>
>>   From the man:
>>
>> VERSIONS
>>          getrandom() was introduced in version 3.17 of the Linux kernel.
>>    Support was added to glibc in version 2.25.
>>
>> If I am not mistaken glibc 2.25 was released in 2017. Also, the call was only
>> introduced in FreeBSD 12.
>>
>> So I think we want to check if getrandom() can be used. We may also want to
>> consider to fallback to read /dev/urandom if the call return ENOSYS.
>>
> 
> You mean its availability should be checked both at build and runtime?

Correct. You can have a libc suporting getrandom() but a kernel that 
doesn't provide the syscall.

Cheers,

-- 
Julien Grall


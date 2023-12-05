Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8108E80601E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 22:05:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648285.1012502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAcay-0001uF-2e; Tue, 05 Dec 2023 21:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648285.1012502; Tue, 05 Dec 2023 21:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAcax-0001sa-Vw; Tue, 05 Dec 2023 21:04:43 +0000
Received: by outflank-mailman (input) for mailman id 648285;
 Tue, 05 Dec 2023 21:04:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rAcaw-0001sU-7u
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 21:04:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAcau-0007CR-D6; Tue, 05 Dec 2023 21:04:40 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[10.95.100.251]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAcau-0006Dx-4x; Tue, 05 Dec 2023 21:04:40 +0000
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
	bh=DJrtkDS6FAY3NSHz+F0ui5sDuJYlotcflRLymdFLTn4=; b=iddVAPXESLyVkRsxdv10gzQSh8
	hUAEkZvMUWwi613upPVLXoqvo9BggHqcnUpTgJzV3lljwLEgms1UJG2yScUqyu104OILHJgVNUNnH
	AsoYiQP5ESKxXYzzwG+0PwzG/BSrggHBzMQblAQCUGlnPjnub7MFr6Kbrs1rFNc9g4J8=;
Message-ID: <24d9a3cd-04cb-4023-804d-b93891c51c78@xen.org>
Date: Tue, 5 Dec 2023 21:04:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Only compile the hypervisor with
 -Wdeclaration-after-statement
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>,
 Juergen Gross <jgross@suse.com>, Alexander Kanavin <alex@linutronix.de>
References: <20231205183226.26636-1-julien@xen.org>
 <fcf00090-304a-49f7-8a61-a54347e90a3b@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <fcf00090-304a-49f7-8a61-a54347e90a3b@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 05/12/2023 19:49, Andrew Cooper wrote:
> On 05/12/2023 6:32 pm, Julien Grall wrote:
>> diff --git a/xen/Makefile b/xen/Makefile
>> index ca571103c868..360fb6dcae57 100644
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -393,6 +393,7 @@ CFLAGS-$(CONFIG_CC_SPLIT_SECTIONS) += -ffunction-sections -fdata-sections
>>   
>>   CFLAGS += -nostdinc -fno-builtin -fno-common
>>   CFLAGS += -Werror -Wredundant-decls -Wwrite-strings -Wno-pointer-arith
>> +$(call cc-option-add,CFLAGS,CC,-Wdeclaration-after-statement)
> 
> I agree with the direction of the patch, but this should be a plain
> CFLAGS +=
> 
> All compilers we support, even on x86, know
> -Wdeclaration-after-statement so it doesn't need a toolchain-check to
> activate.

That's good to know, I wasn't sure and..

> 
> https://godbolt.org/z/PM7bb1d55

.. I keep forgetting godbolt.org can help to check old compilers.

I will update the patch in my tree.

> 
> With that fixed, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks!

Cheers,

-- 
Julien Grall


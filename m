Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B415856AD
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 23:54:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377868.611157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHXva-0001Nc-9b; Fri, 29 Jul 2022 21:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377868.611157; Fri, 29 Jul 2022 21:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHXva-0001L7-6O; Fri, 29 Jul 2022 21:53:50 +0000
Received: by outflank-mailman (input) for mailman id 377868;
 Fri, 29 Jul 2022 21:53:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oHXvY-0001L1-P0
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 21:53:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oHXvT-000459-Ss; Fri, 29 Jul 2022 21:53:43 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oHXvT-0004KU-Mt; Fri, 29 Jul 2022 21:53:43 +0000
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
	bh=BCA0y1weyRIq79mO4Dv43/KSclJqDmErh7Si8sAyLNo=; b=flepE9ala46oljY3vQ5G1vb/JK
	NJdtmu1jqZzhAeXTMcwJE66JhC7kxerSegjTCwQb1hxKjThNbD8oIHToOnxEU/FOlR72tyHmbCtQF
	dAjisKECL7sF1zcl466DpJ2l0d5ccviaM/qCf/mt3QRVQJwgSnjfhfgvJZDGzNUM00IU=;
Message-ID: <59433009-26de-4bac-d7cd-c57e64171262@xen.org>
Date: Fri, 29 Jul 2022 22:53:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/5] xen: Rename CONFIG_DOMAIN_PAGE to
 CONFIG_ARCH_MAP_DOMAIN_PAGE and...
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220720184459.51582-1-julien@xen.org>
 <20220720184459.51582-4-julien@xen.org>
 <414dcf57-b18f-8a88-b143-e275b5311079@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <414dcf57-b18f-8a88-b143-e275b5311079@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 25/07/2022 16:51, Jan Beulich wrote:
> On 20.07.2022 20:44, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> move it to Kconfig.
>>
>> The define CONFIG_DOMAIN_PAGE indicates whether the architecture provide
>> helpers to map/unmap a domain page. Rename it to the define to
>> CONFIG_ARCH_MAP_DOMAIN_PAGE so it is clearer that this will not remove
>> support for domain page (this is not a concept that Xen can't get
>> away with).
> 
> Especially the part in parentheses reads odd, if not backwards.

Indeed. I tweaked the sentence to:

Rename it to CONFIG_ARCH_MAP_DOMAIN_PAGE so it is clearer that support 
for domain page is not something that can be disabled in Xen.

> 
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -371,7 +371,7 @@ void clear_fixmap(unsigned int map)
>>       BUG_ON(res != 0);
>>   }
>>   
>> -#ifdef CONFIG_DOMAIN_PAGE
>> +#ifdef CONFIG_ARCH_MAP_DOMAIN_PAGE
>>   /*
>>    * Prepare the area that will be used to map domheap pages. They are
>>    * mapped in 2MB chunks, so we need to allocate the page-tables up to
> 
> What about the other #ifdef in build_assertions()? With that also
> converted (and preferably with the description adjusted)

Good catch. I update the patch.

> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks for the review!

Cheers,

-- 
Julien Grall


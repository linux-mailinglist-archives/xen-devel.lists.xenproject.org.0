Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A84C1654ED2
	for <lists+xen-devel@lfdr.de>; Fri, 23 Dec 2022 10:52:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468856.728038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8eiP-0000XP-58; Fri, 23 Dec 2022 09:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468856.728038; Fri, 23 Dec 2022 09:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8eiP-0000VR-2P; Fri, 23 Dec 2022 09:51:45 +0000
Received: by outflank-mailman (input) for mailman id 468856;
 Fri, 23 Dec 2022 09:51:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p8eiO-0000VL-4F
 for xen-devel@lists.xenproject.org; Fri, 23 Dec 2022 09:51:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p8eiJ-0000eH-6L; Fri, 23 Dec 2022 09:51:39 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.3.230]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p8eiI-0004me-V2; Fri, 23 Dec 2022 09:51:39 +0000
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
	bh=i9aPbCSwORvQJ98S0zvt9Pe84hwz4CqiEDfLULfZUlU=; b=sp9gk/QYhvBmLthKs4hYeVIhU3
	w6hf5AGl2KxbT5MQdRlcQnyqJT6sCy7Y85wuSahW9eVR5dAawHdr6vUAFI8UXRQVLj8PZTTZTIezn
	oTCJSEZR2pUp6XB7Dhkf2zKsvjwbssaJSV3XVwz9dWgkMxm5BDAE86rZ610JiIt7x99U=;
Message-ID: <9b7d8ea3-110a-44e0-7b06-c27a1278eb17@xen.org>
Date: Fri, 23 Dec 2022 09:51:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 02/22] x86/setup: move vm_init() before acpi calls
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 David Woodhouse <dwmw2@amazon.com>, Hongyan Xia <hongyxia@amazon.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-3-julien@xen.org>
 <92d82899-4e74-8638-4a60-09104ba16c9a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <92d82899-4e74-8638-4a60-09104ba16c9a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 20/12/2022 15:08, Jan Beulich wrote:
> On 16.12.2022 12:48, Julien Grall wrote:
>> From: Wei Liu <wei.liu2@citrix.com>
>>
>> After the direct map removal, pages from the boot allocator are not
>> mapped at all in the direct map. Although we have map_domain_page, they
> 
> Nit: "will not be mapped" or "are not going to be mapped", or else this
> sounds like there's a bug somewhere.
> 
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -870,6 +870,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>       unsigned long eb_start, eb_end;
>>       bool acpi_boot_table_init_done = false, relocated = false;
>>       int ret;
>> +    bool vm_init_done = false;
> 
> Can this please be grouped with the other bool-s (even visible in context)?

This can't fit on the same line. So I went with:

bool acpi_boot_table_init_done = false, relocated = false;
bool vm_init_done = false;

I prefer this over the below:

bool acpi_boot_table_init_done = false, relocated false,
      vm_init_done = false;

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEA7A6C622
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 23:58:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924628.1327746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvlJ0-0000kv-Q9; Fri, 21 Mar 2025 22:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924628.1327746; Fri, 21 Mar 2025 22:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvlJ0-0000j9-NK; Fri, 21 Mar 2025 22:57:34 +0000
Received: by outflank-mailman (input) for mailman id 924628;
 Fri, 21 Mar 2025 22:57:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tvlIy-0000j3-Sv
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 22:57:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tvlIu-00HHLe-1j;
 Fri, 21 Mar 2025 22:57:28 +0000
Received: from [2a02:8012:3a1:0:d473:3eed:4e56:a8b]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tvlIu-00FKav-0G;
 Fri, 21 Mar 2025 22:57:28 +0000
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
	bh=Mbe5/muYVoZIYjVpjb4z6k0z8D9I/XAaYCkKhGQxO8c=; b=zzWK/8/EM9uBln3kQVFhoVB30l
	jalavIdFajqb67mOOAm96jZ6QUFPGVLYO7QigRH0V3JqwMkogxEbtofzOpvKCJB7arO5lX8iL4+UT
	KAAWIr9jpKz3x29XP1hkG7Si7ogIfMnEfWb3IchJZaBV8hIz72pkwsdJCkX3o349U2HQ=;
Message-ID: <b79b8ab9-def7-4ac1-b51d-82e9566f9134@xen.org>
Date: Fri, 21 Mar 2025 22:57:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] xen: add libafl-qemu fuzzer support
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>
References: <20250315003544.1101488-1-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.22.394.2503211517130.2325679@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2503211517130.2325679@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano, Volodymyr,

On 21/03/2025 22:32, Stefano Stabellini wrote:
>> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
>> index b6860a7760..c7a51a1144 100644
>> --- a/xen/arch/arm/psci.c
>> +++ b/xen/arch/arm/psci.c
>> @@ -17,6 +17,7 @@
>>   #include <asm/cpufeature.h>
>>   #include <asm/psci.h>
>>   #include <asm/acpi.h>
>> +#include <asm/libafl_qemu.h>
>>   
>>   /*
>>    * While a 64-bit OS can make calls with SMC32 calling conventions, for
>> @@ -49,6 +50,10 @@ int call_psci_cpu_on(int cpu)
>>   
>>   void call_psci_cpu_off(void)
>>   {
>> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
>> +    libafl_qemu_end(LIBAFL_QEMU_END_OK);
>> +#endif
> 
> As discussed, please add a wrapper with an empty implementation in the
> regular case and the call to libafl_qemu_end when the fuzzer is enabled.
> So that here it becomes just something like:
> 
>    fuzzer_success();
> 
> Other than that, the code changes to Xen look OK to me

I am a bit surprised this was resent without addressing the licensing 
issue pointed out by Andrew [1] (I don't see a reply). And if there is 
no issue, then I would have a least expected a mention in the commit 
message why this is ok.

Cheers,

[1] https://lore.kernel.org/ae2dbe98-57cf-4aba-bc48-6d7212cfc859@citrix.com

-- 
Julien Grall



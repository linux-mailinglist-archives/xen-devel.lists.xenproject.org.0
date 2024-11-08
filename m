Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D439E9C2625
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 21:06:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832840.1248179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9VEy-0007dN-CI; Fri, 08 Nov 2024 20:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832840.1248179; Fri, 08 Nov 2024 20:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9VEy-0007bt-9X; Fri, 08 Nov 2024 20:05:56 +0000
Received: by outflank-mailman (input) for mailman id 832840;
 Fri, 08 Nov 2024 20:05:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHpy=SD=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t9VEw-0007bl-QE
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 20:05:54 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8e3f15c-9e0c-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 21:05:50 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1731096342991134.0728993380519;
 Fri, 8 Nov 2024 12:05:42 -0800 (PST)
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
X-Inumbo-ID: d8e3f15c-9e0c-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQ4ZTNmMTVjLTllMGMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDk2MzUwLjYxNjM4Mywic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1731096345; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nzhANqHmNoKzjMbqhbvJ7IXY64E/1L8nXcDHQHyLjGj3sKyAii/uE3mOAEf/CMbEDorRuza11J59KBytea5LClhkCQXv35e7l/faD0vY91DUyVhgu899QIgDvEa/E8qIy+7CJYuJZ5yPIC4cbrrGM0F33eljcX86UFFrZ2eCrVo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731096345; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=M0+chFa0tl4CltlsCBW9R5wavRfypjHKFXHtpCWUpzY=; 
	b=jqjCEy669AO+kKXnCbu99SuHAzMf3VAPoQvdJydHsxlPSJkq71nsOTzosNujwm3PSj5j+R1/2oPjmpPN8+LcU2bjXzyKbxV3umYZvM0N/hf2mijG9vI3+CSwSFFHFe13+7LDRBWRaWoIYE32d7l9ihDXxnfAabKhRY4cdBSV4lI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731096345;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=M0+chFa0tl4CltlsCBW9R5wavRfypjHKFXHtpCWUpzY=;
	b=Z1mjPuuhzq1HPgdE3zUu7zB2dgm4jssAstGeQPCI/vBCJPG/BzFStURNgwqF/sZt
	6vEmNK3j76Y36j7VYTICSvXzDfK0IWSDc+ZJ7JYikloKvwSCbi7JNdLPgbqtvUmtR23
	uvMAaCpbkzbTvvhaFTfu5i+goShXlwiWlLV7W+Ag=
Message-ID: <1aa86ca0-bcda-4fc9-8bfa-207699313723@apertussolutions.com>
Date: Fri, 8 Nov 2024 15:05:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] x86/boot: add cmdline to struct boot_domain
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-13-dpsmith@apertussolutions.com>
 <1a7d3d9a-0100-4dcc-9e2a-727a3061cd74@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <1a7d3d9a-0100-4dcc-9e2a-727a3061cd74@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/7/24 16:12, Jason Andryuk wrote:
> On 2024-11-02 13:25, Daniel P. Smith wrote:
>> Add a container for the "cooked" command line for a domain. This 
>> provides for
>> the backing memory to be directly associated with the domain being 
>> constructed.
>> This is done in anticipation that the domain construction path may 
>> need to be
>> invoked multiple times, thus ensuring each instance had a distinct memory
>> allocation.
> 
> Is the area only used at domain construction time?  If that runs 
> sequentially, then only a single cmdline buffer would be needed. 
> cmdline_pa can keep pointing to individual cmdlines.  Unless the multi- 
> domain builder needs to keep multiple?  But that could maybe keep 
> cmdline_pa pointing into the device tree?

It turns out that 1024 may not be large enough for all use cases. 
Instead of trying to make an educated guess, this is being switched to 
dynamic allocation for v9.

>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>> Changes since v7:
>> - updated commit message to expand on intent and purpose
>> ---
>>   xen/arch/x86/include/asm/bootdomain.h |  4 ++++
>>   xen/arch/x86/include/asm/dom0_build.h |  1 +
>>   xen/arch/x86/pv/dom0_build.c          |  4 ++--
>>   xen/arch/x86/setup.c                  | 18 ++++++++----------
>>   4 files changed, 15 insertions(+), 12 deletions(-)
>>
>> diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/ 
>> include/asm/bootdomain.h
>> index 3873f916f854..bc51f04a1df6 100644
>> --- a/xen/arch/x86/include/asm/bootdomain.h
>> +++ b/xen/arch/x86/include/asm/bootdomain.h
>> @@ -8,10 +8,14 @@
>>   #ifndef __XEN_X86_BOOTDOMAIN_H__
>>   #define __XEN_X86_BOOTDOMAIN_H__
>> +#include <public/xen.h>
>> +
>>   struct boot_module;
>>   struct domain;
>>   struct boot_domain {
>> +    char cmdline[MAX_GUEST_CMDLINE];
>> +
> 
> You might want to put the 1024 byte chars at the end of the structure. 
> Having the other pointers at the start is probably more useful.

OBE.

>>       domid_t domid;
>>       struct boot_module *kernel;
> 
>> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
>> index 28257bf13127..2c84af52de3e 100644
>> --- a/xen/arch/x86/pv/dom0_build.c
>> +++ b/xen/arch/x86/pv/dom0_build.c
>> @@ -960,8 +960,8 @@ static int __init dom0_construct(struct 
>> boot_domain *bd)
>>       }
>>       memset(si->cmd_line, 0, sizeof(si->cmd_line));
>> -    if ( cmdline != NULL )
>> -        strlcpy((char *)si->cmd_line, cmdline, sizeof(si->cmd_line));
>> +    if ( cmdline[0] != '\0' )
> 
> Shouldn't this check bd->cmdline[0] ?  There is a const char *cmdline in 
> this function that should probably be removed.

This was caught in the switch to dynamic allocation and the local var 
was dropped.

v/r,
dps


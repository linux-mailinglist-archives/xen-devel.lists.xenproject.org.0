Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 639299ED039
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 16:46:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854921.1267994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLOur-00020P-BC; Wed, 11 Dec 2024 15:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854921.1267994; Wed, 11 Dec 2024 15:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLOur-0001yw-8J; Wed, 11 Dec 2024 15:46:21 +0000
Received: by outflank-mailman (input) for mailman id 854921;
 Wed, 11 Dec 2024 15:46:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLOuq-0001yi-3q
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 15:46:20 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f8c5fba-b7d7-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 16:46:19 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733931971433723.1442856793576;
 Wed, 11 Dec 2024 07:46:11 -0800 (PST)
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
X-Inumbo-ID: 0f8c5fba-b7d7-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1733931974; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mpQs8stcLn/6BtVsQcrvcZN9JW09FG1GNJMJ/fIl5Sy4Ey8Y/aXU56XuUmrolnKKsyanB3977q+t+NFCY4poR1+DqYcrbpXF9YM0CcsvHA3FS6YJmBJX3UKUdX9qs1h0AXld4a+mNnHPxc0rAwmFWkn/+uH9zKwv8d3HfO3NXPw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733931974; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jZZ4ULguLTW7jlwVwf7sQnKBcPkBv2PSOMsKjNnRy+M=; 
	b=LdsjtHwW2qTGo4Z4drEvt+FDYSG50Ki3OydITkRk+ultpsYWWBjwnvulHEomYCqgVQN3g+Ad6znzXejvBNjzihJwX8XWe9yZzpIzNvsp5WXehFxU2Ici1+r13NJ791jGwdpw5rJIUoMxpox3rinrfXfGVt/eKTN0j0iJhE8ODG8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733931974;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=jZZ4ULguLTW7jlwVwf7sQnKBcPkBv2PSOMsKjNnRy+M=;
	b=jYQHXuE1dGSc5z3tQThcZzz9nFwyhjpwj/2BwGXXeBRjQr7iJFHP+m4+EQRCDJaT
	hhBxerUTdTfHLCh3oU8SHXOgQtJGTxulP9jADj4D6hg/zaCVF2bfHYBBnZILmPUkJEe
	Smv39Q13YCcngsqc4Y5qGosZI+IdoWXncEIAM0ss=
Message-ID: <e735e4cf-e6c8-453c-8491-e010d9dfdc82@apertussolutions.com>
Date: Wed, 11 Dec 2024 10:46:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/15] x86/hyperlaunch: obtain cmdline from device tree
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-10-dpsmith@apertussolutions.com>
 <b5799558-c9fd-4e45-819e-15157e4451fe@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <b5799558-c9fd-4e45-819e-15157e4451fe@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/25/24 18:12, Jason Andryuk wrote:
> On 2024-11-23 13:20, Daniel P. Smith wrote:
>> If a command line is not provided through the bootloader's mechanism, 
>> e.g.
>> muiltboot module string field, then use one from the device tree if 
>> present.
>> The device tree command line is located in the bootargs property of the
>> `multiboot,kernel` node.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/domain_builder/core.c       | 28 +++++++++++++++++++
>>   xen/arch/x86/domain_builder/fdt.c        | 34 ++++++++++++++++++++++++
>>   xen/arch/x86/domain_builder/fdt.h        | 24 +++++++++++++++++
>>   xen/arch/x86/include/asm/bootinfo.h      |  6 +++--
>>   xen/arch/x86/include/asm/domainbuilder.h |  4 +++
>>   xen/arch/x86/setup.c                     | 10 +++++--
>>   6 files changed, 102 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/x86/domain_builder/core.c b/xen/arch/x86/ 
>> domain_builder/core.c
>> index 9335f3a9ebef..95cab06e6159 100644
>> --- a/xen/arch/x86/domain_builder/core.c
>> +++ b/xen/arch/x86/domain_builder/core.c
>> @@ -8,9 +8,37 @@
>>   #include <xen/lib.h>
>>   #include <asm/bootinfo.h>
>> +#include <asm/setup.h>
>>   #include "fdt.h"
>> +size_t __init builder_get_cmdline_size(struct boot_info *bi, int offset)
>> +{
>> +#ifdef CONFIG_DOMAIN_BUILDER
> 
> I wasnted to suggest:
> 
> if ( !IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
>      return 0;
> 
> but that fails to compile for a missing fdt_cmdline_prop_size().

Yes, I wanted to do the same as well.

>> +    const void *fdt = bootstrap_map_bm(&bi- 
>> >mods[HYPERLAUNCH_MODULE_IDX]);
>> +    int size = fdt_cmdline_prop_size(fdt, offset);
>> +
>> +    bootstrap_unmap();
>> +    return size < 0 ? 0 : (size_t) size;
>> +#else
>> +    return 0;
>> +#endif
>> +}
>> +
>> +int __init builder_get_cmdline(
>> +    struct boot_info *bi, int offset, char *cmdline, size_t size)
>> +{
>> +#ifdef CONFIG_DOMAIN_BUILDER
> 
> and here fdt_cmdline_prop_copy().  I'm not sure the addition of more 
> stubs offsets these ifdefs, so:
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks!

v/r,
dps



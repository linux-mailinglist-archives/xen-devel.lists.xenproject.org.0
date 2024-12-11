Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C81F9ECAE9
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 12:14:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854608.1267776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLKfp-0005DX-MN; Wed, 11 Dec 2024 11:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854608.1267776; Wed, 11 Dec 2024 11:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLKfp-0005Bx-Jk; Wed, 11 Dec 2024 11:14:33 +0000
Received: by outflank-mailman (input) for mailman id 854608;
 Wed, 11 Dec 2024 11:14:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLKfn-0005Br-NI
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 11:14:31 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15db968a-b7b1-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 12:14:29 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733915660137679.3236455454473;
 Wed, 11 Dec 2024 03:14:20 -0800 (PST)
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
X-Inumbo-ID: 15db968a-b7b1-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1733915663; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V/OB6RMlhL4pXjbn9JWIe+DC/Vdbi3x9JySlvENYDEKO1XBbk2iXbbRyj7cD+UiyggVlSNTkdd5nJK+dLyYPx9fDDMJstD+1F7yZc6ylU4apq36daZoDhLGFFpaUJTqXogw51hu7wvVkOH1gqiamqrfyOJIsyo9bk7r1ZtNxXw8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733915663; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3TgrnbL4CAatymIXhWuE2IW+ubJfSKB9fy+QUWuG6bs=; 
	b=XuC0icdz3qqVM6Zoevk+q4RjiCQgLRY/pUZNjtDceWrnYxjzheMBj9CYQMzfiCiXts5w+UZcnYScrsil9vXbc5PRu3yjyQKR4pl6GEm4JywY+Hl0l3uJyOfRGyn5ckw2f6eYUx4+MizKnqvCDaTpXWpthrV53GWbp/Z3B9VPKew=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733915663;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3TgrnbL4CAatymIXhWuE2IW+ubJfSKB9fy+QUWuG6bs=;
	b=KaejwQyxWxNTCj00AEaIhmng0zIecdmhx0Dk2THCjDeYXlg2jIrwYl5ybtER3/96
	EPYuh2dhFPD2EsHwRWxdq/a2jLzKlclOdzXfVpgq9WfG6nBwf8x8StOClnV5+gbciBe
	+oTgPONEVNIiLgtMLvu2IDlUYHDdXFWG2b4aVHWA=
Message-ID: <f9e767ef-4742-4685-82c6-4d3abfc610b6@apertussolutions.com>
Date: Wed, 11 Dec 2024 06:14:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] x86/hyperlaunch: introduce the domain builder
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-7-dpsmith@apertussolutions.com>
 <f8f375d6-2b77-4d76-ac69-89d850ac4733@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <f8f375d6-2b77-4d76-ac69-89d850ac4733@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/25/24 12:52, Jason Andryuk wrote:
> On 2024-11-23 13:20, Daniel P. Smith wrote:
>> Introduce the domain builder which is capable of consuming a device 
>> tree as the
>> first boot module. If it finds a device tree as the first boot module, 
>> it will
>> set its type to BOOTMOD_FDT. This change only detects the boot module and
>> continues to boot with slight change to the boot convention that the dom0
>> kernel is no longer first boot module but is the second.
>>
>> No functional change intended.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

<snip/>

>> +            bi->hyperlaunch_enabled = false;
>> +            bi->mods[0].type = BOOTMOD_FDT;
>> +            break;
>> +        default:
>> +            printk("Unknown error (%d) occured checking for 
>> hyperlaunch device tree\n",
>> +                   ret);
>> +            bi->hyperlaunch_enabled = false;
>> +        }
>> +
> 
> Stray blank line

ack.

>> +    }
>> +}
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * tab-width: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/x86/domain_builder/fdt.c b/xen/arch/x86/ 
>> domain_builder/fdt.c
>> new file mode 100644
>> index 000000000000..3f9dda8c34c3
>> --- /dev/null
>> +++ b/xen/arch/x86/domain_builder/fdt.c
>> @@ -0,0 +1,38 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2024, Apertus Solutions, LLC
>> + */
>> +#include <xen/err.h>
>> +#include <xen/init.h>
>> +#include <xen/lib.h>
>> +#include <xen/libfdt/libfdt.h>
>> +#include <xen/rangeset.h> /* required for asm/setup.h */
> 
> Should asm/setup.h just be changed?

Will drop per the follow-

>> +
>> +#include <asm/bootinfo.h>
>> +#include <asm/page.h>
>> +#include <asm/setup.h>
>> +
>> +#include "fdt.h"
>> +
> 
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index e6580382d247..8041aeb3dcfd 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
> 
>> @@ -1591,7 +1596,8 @@ void asmlinkage __init noreturn __start_xen(void)
>>   #endif
>>       }
>> -    if ( bi->mods[0].headroom && !bi->mods[0].relocated )
>> +    i = first_boot_module_index(bi, BOOTMOD_KERNEL);
>> +    if ( bi->mods[i].headroom && !bi->mods[0].relocated )
> 
> Switch .relocated index to i?

ack.

v//r,
dps


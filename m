Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 471ABA9D4F7
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 00:04:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968639.1358140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8R96-0004fn-Sk; Fri, 25 Apr 2025 22:03:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968639.1358140; Fri, 25 Apr 2025 22:03:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8R96-0004dQ-Pc; Fri, 25 Apr 2025 22:03:44 +0000
Received: by outflank-mailman (input) for mailman id 968639;
 Fri, 25 Apr 2025 22:03:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJEZ=XL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u8R95-0004dJ-IN
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 22:03:43 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25105ea8-2221-11f0-9eb3-5ba50f476ded;
 Sat, 26 Apr 2025 00:03:41 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745618612368821.5806116792763;
 Fri, 25 Apr 2025 15:03:32 -0700 (PDT)
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
X-Inumbo-ID: 25105ea8-2221-11f0-9eb3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1745618616; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=evI6MKSjsVsutlEu79e6ibX7crQgoy/JjRoy8N1JXZQtOmnMgbuoToMLD35OGYQGd287UbXORmYaIkgPe73d8jc7HsDyDNoBmTzzUs7Uak78T43oQZk1susSPWEzVXYcVXuqbpc2tdXixs+Q8g985TzZa0lRziFpuL8Q4rWhuD8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745618616; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=17fOna45Vf4cdsQbeSDglIkcphxduibXtzgvkgQo3tM=; 
	b=Dwe9C8dcTRaLrjKmIrUOdTUZC0Zk2pkc0NvKzIn3HMCFfNbZyZfi9G4jic/Gd/smdH/uo5jmHGaIcpuG/HlGZgJCPxx0irn/OAsdUQQxyuKFKjhbvHhPSS8K0RJNsrcFQM2FCZRljodzR1ofsg0Yc1y8KuvDYhOQPKI1D1aDZ8M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745618616;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=17fOna45Vf4cdsQbeSDglIkcphxduibXtzgvkgQo3tM=;
	b=gXH2YDhWb9r5dQjqfUFx2i5aq6E+wy4CqwLDVnk8/UvtsH1xMBWMRipIjWVUY0AQ
	ow71lkj9gWYSLDjzvjgo+CZ9oExgldqHWC00sqyzTViGmeqpKbqCbA11nApL74ywTkR
	TSIuUeM4lVSoi10ICNjzR0xInnQOEXzG57EWj2bU=
Message-ID: <c7e8090b-6a48-4f08-87fb-64877e89b417@apertussolutions.com>
Date: Fri, 25 Apr 2025 18:03:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 03/38] x86/hyperlaunch: convert max vcpu determination to
 domain builder
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: stefano.stabellini@amd.com, agarciav@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
 <20250419220820.4234-4-dpsmith@apertussolutions.com>
 <b3069950-ac03-4603-866c-27c6166bfecf@amd.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <b3069950-ac03-4603-866c-27c6166bfecf@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 4/22/25 16:36, Jason Andryuk wrote:
> On 2025-04-19 18:07, Daniel P. Smith wrote:
>> The domain configuration may request more vcpus than are present in 
>> the system.
>> For dom0, the function dom0_max_vcpus() was used to clamp down to 
>> physically
>> available vcpus. Here we are introducing a generalized version,
>> dom_max_vcpus(), that takes a boot domain and sets the max vcpus based 
>> on the
>> lesser of the requested max and the available vcpus.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
> 
>> diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/ 
>> domain-builder/domain.c
>> new file mode 100644
>> index 000000000000..f2277b9e3cf3
>> --- /dev/null
>> +++ b/xen/arch/x86/domain-builder/domain.c
>> @@ -0,0 +1,38 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2024, Apertus Solutions, LLC
>> + */
>> +
>> +#include <xen/cpumask.h>
>> +#include <xen/domain.h>
>> +#include <xen/init.h>
>> +#include <xen/sched.h>
>> +
>> +#include <asm/bootinfo.h>
>> +
>> +unsigned int __init dom_max_vcpus(struct boot_domain *bd)
>> +{
>> +    unsigned int limit = bd->mode & BUILD_MODE_PARAVIRT ?
>> +                                    MAX_VIRT_CPUS : HVM_MAX_VCPUS;
>> +
>> +    if ( bd->capabilities & BUILD_CAPS_CONTROL )
> 
> I added xen/include/public/bootfdt.h with DOMAIN_CAPS_CONTROL and the 
> other capabilities to provide common values.
> 
>> +        limit = dom0_max_vcpus();
> 
> dom0_max_vcpus() applies Xen's dom0_max_vcpus command line option.  That 
> is desirable for a traditional dom0.  For a disaggregated, Hyperlaunch 
> system, I'm not sure it's appropriate.  Considering there can multiple 
> control domains, it's more questionable.
> 
> Might it be better to only apply Xen "dom0" command line options to non- 
> hyperlaunch dom0?  Or a domain with all of BUILD_CAPS_CONTROL/HARDWARE/ 
> XENSTORE?
> 
> I guess it could stay as-is, but it seems unusual.

The larger issue is that the cmdline params are going to need to be 
addressed. I see three approaches, first would be to only apply the 
params when there is a single domain with ctrl/hw/xs all set, or the 
second approach would be to change the params to support multiple domain 
statements. Though the second approach has the issue of the need to 
decide how to support the legacy params

v/r,
dps


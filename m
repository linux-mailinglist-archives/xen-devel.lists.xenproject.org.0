Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF8C9ED6DB
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 20:56:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855288.1268270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLSoz-00057b-Un; Wed, 11 Dec 2024 19:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855288.1268270; Wed, 11 Dec 2024 19:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLSoz-00054p-SD; Wed, 11 Dec 2024 19:56:33 +0000
Received: by outflank-mailman (input) for mailman id 855288;
 Wed, 11 Dec 2024 19:56:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLSoy-000541-MK
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 19:56:32 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02deb21a-b7fa-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 20:56:30 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733946980799737.5198303639822;
 Wed, 11 Dec 2024 11:56:20 -0800 (PST)
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
X-Inumbo-ID: 02deb21a-b7fa-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1733946983; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CUuV3w9UlJAfvPEPk5RJUwPsuVrfWuw+sDEqQqAwPHXy5lrQMcvSOCq2GNk5COl4N77poakJ2WWpea6D49MFibsiEi6FI+4oPU7on2F8cH3jw7kRrL9UVykv3qBHrY9WjqhD3xtK40ZnyUNB2anPMpkYcDcEUw5NeRjgi+rIq6Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733946983; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yAsunI+vC/1qmV0Cgw5h2c+aVx89BeUOLRPKJtqyYDI=; 
	b=QCzSTdxPlEqCc4Hz8c2baIerkP4J9KySTmttAgInV93IHA2/Ke4aA1B5TcSdp7Hhq2NoV+oVvoskLDquo+MEzqRZ6AUB2MWup7WNrkgafk42tIrlN0BIWMeHbLOpsn8XYk/s6X/VQ3CKonEzGIFb9ZlwnHUrA7PkqIVPzOJgqXk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733946983;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=yAsunI+vC/1qmV0Cgw5h2c+aVx89BeUOLRPKJtqyYDI=;
	b=eYPKbAaceFspZXQz+//1nq8FogSU6s1rW9PIkOXmFuGAOb2tfA0oG3yq0tFBndJD
	F4Gliu39xZGMNec+j11R0U4JN9Poa5G77/OjXWLRxEbsmKWVvtN9vkN1yKlQnxrVFSN
	sYYUs6BZEwoe6EQf4Hx3f0sYrKxP3dk9sS6bANqo=
Message-ID: <16a6944d-4ac5-4016-bafe-1bd8b6a4fa4d@apertussolutions.com>
Date: Wed, 11 Dec 2024 14:56:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/15] x86/hyperlaunch: add capabilities to boot domain
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-16-dpsmith@apertussolutions.com>
 <84bc7854-7935-4f36-b574-d19dde775673@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <84bc7854-7935-4f36-b574-d19dde775673@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/2/24 07:23, Jan Beulich wrote:
> On 23.11.2024 19:20, Daniel P. Smith wrote:
>> --- a/xen/arch/x86/domain_builder/fdt.c
>> +++ b/xen/arch/x86/domain_builder/fdt.c
>> @@ -209,6 +209,19 @@ static int __init process_domain_node(
>>               bd->max_vcpus = val;
>>               printk("  max vcpus: %d\n", bd->max_vcpus);
>>           }
>> +        if ( match_fdt_property(fdt, prop, "capabilities" ) )
>> +        {
>> +            if ( fdt_prop_as_u32(prop, &bd->capabilities) != 0 )
>> +            {
>> +                printk("  failed processing domain id for domain %s\n",
>> +                       name == NULL ? "unknown" : name);
>> +                return -EINVAL;
>> +            }
>> +            printk("  caps: ");
>> +            if ( bd->capabilities & BUILD_CAPS_CONTROL )
>> +                printk("c");
>> +            printk("\n");
>> +        }
> 
> What if any of the other bits is set?

I'm not sure what you are getting at, but there is another cap added 
later for HARDWARE and it will print an 'h' next to the 'c' if set.

>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -992,6 +992,7 @@ static size_t __init domain_cmdline_size(
>>   static struct domain *__init create_dom0(struct boot_info *bi)
>>   {
>>       char *cmdline = NULL;
>> +    int create_flags = 0;
> 
> Once again unsigned int please.

ack.

>> @@ -1023,7 +1024,10 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>>       /* Create initial domain.  Not d0 for pvshim. */
>>       if ( bd->domid == DOMID_INVALID )
>>           bd->domid = get_initial_domain_id();
>> -    d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
>> +    if ( bd->capabilities & BUILD_CAPS_CONTROL )
>> +            create_flags |= CDF_privileged;
> 
> Nit: Indentation.

ack.

v/r,
dps



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4192A9ED0C9
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 17:06:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854946.1268014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLPEN-0007gy-3C; Wed, 11 Dec 2024 16:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854946.1268014; Wed, 11 Dec 2024 16:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLPEN-0007fU-0T; Wed, 11 Dec 2024 16:06:31 +0000
Received: by outflank-mailman (input) for mailman id 854946;
 Wed, 11 Dec 2024 16:06:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLPEM-0007fO-3W
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 16:06:30 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df121664-b7d9-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 17:06:26 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733933174271379.75298590475563;
 Wed, 11 Dec 2024 08:06:14 -0800 (PST)
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
X-Inumbo-ID: df121664-b7d9-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1733933180; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kwgOH+8Gtei6ABFK2o6pwDYwaTkeWm4XFakyNcgYWHfvVlhO4ZTr7YUjsK1IcO0YaUMENj4gryMbVZpNAB37O4+ofvzo1oYI8exsAiqdwutz2tJnT32jDHQEQOycouc9NRzrGdbsKs4wL8GjVYJAgfBvDj8R106t7Na2SIoFNSM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733933180; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UaUToRm0uKeJR+eRCN+VEks07UMpYz/py7jkWfWWj7I=; 
	b=B00TddP9HREk6B5r3ct+PKRLsQJBD9rN+xiLdybDpB3RoBEfy23nhAZjV2GEtuopFMbAxx5nnT5Mwpdf+x0skdYMav5VJYK78uJiGn7aMRGKdtd9ck1VOC7IEJl6m0SIFxapsZMC1mceZURH9O88lvVdWQsPQvNIFnhWOnWUfqc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733933180;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=UaUToRm0uKeJR+eRCN+VEks07UMpYz/py7jkWfWWj7I=;
	b=USP8cIfDruvZ5myUKsauI1hSzuZMfkqDYnNfcSDyjZM8Ne+PfIo3D2Z1Pmwxb+5N
	B50R1l3srj3NLj6lGrwmQOBzH+ys1waF2OPl9Y4d4unpk2XGTtTo+FticVI/zaHTesC
	d/TW0bjDQT/h7agphdtavsi/261f1gyv+HddDkqY=
Message-ID: <c74b7ff3-9128-495c-a1b3-138af3ced527@apertussolutions.com>
Date: Wed, 11 Dec 2024 11:06:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] x86/hyperlaunch: add domain id parsing to domain
 config
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-12-dpsmith@apertussolutions.com>
 <99177823-38d9-4aca-af84-150ae6f37a25@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <99177823-38d9-4aca-af84-150ae6f37a25@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/25/24 18:45, Jason Andryuk wrote:
> On 2024-11-23 13:20, Daniel P. Smith wrote:
>> Introduce the ability to specify the desired domain id for the domain
>> definition. The domain id will be populated in the domid property of 
>> the domain
>> node in the device tree configuration.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/domain_builder/fdt.c | 31 ++++++++++++++++++++++++++++++-
>>   xen/arch/x86/domain_builder/fdt.h | 18 ++++++++++++++++++
>>   xen/arch/x86/setup.c              |  3 ++-
>>   3 files changed, 50 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/domain_builder/fdt.c b/xen/arch/x86/ 
>> domain_builder/fdt.c
>> index bc8054a80ec1..3a6b4fbc09a9 100644
>> --- a/xen/arch/x86/domain_builder/fdt.c
>> +++ b/xen/arch/x86/domain_builder/fdt.c
> 
>> @@ -120,6 +121,28 @@ static int __init process_domain_node(
>>           return -EINVAL;
>>       }
>> +    fdt_for_each_property_offset(property, fdt, dom_node)
>> +    {
>> +        const struct fdt_property *prop;
>> +
>> +        prop = fdt_get_property_by_offset(fdt, property, NULL);
>> +        if ( !prop )
>> +            continue; /* silently skip */
>> +
>> +        if ( match_fdt_property(fdt, prop, "domid" ) )
>> +        {
>> +            uint32_t val = DOMID_INVALID;
>> +            if ( fdt_prop_as_u32(prop, &val) != 0 )
>> +            {
>> +                printk("  failed processing domain id for domain %s\n",
>> +                       name == NULL ? "unknown" : name);
>> +                return -EINVAL;
>> +            }
> 
> Bounds check against DOMID_FIRST_RESERVED?

Yah, that would be good.

>> +            bd->domid = (domid_t)val;
>> +            printk("  domid: %d\n", bd->domid);
>> +        }
>> +    }
>> +
>>       fdt_for_each_subnode(node, fdt, dom_node)
>>       {
>>           if ( fdt_node_check_compatible(fdt, node, 
>> "multiboot,kernel") == 0 )
>> @@ -186,6 +209,12 @@ static int __init process_domain_node(
>>           return -EFAULT;
>>       }
>> +    if ( bd->domid == DOMID_INVALID )
>> +        bd->domid = get_initial_domain_id();
>> +    else
>> +        if ( bd->domid != get_initial_domain_id() )
> 
> single line "else if"?

Yep.

>> +            printk(XENLOG_WARNING "WARN: unsuported booting not using 
>> initial domid\n");
> 
> "unsupported"
> 
> Maybe "Booting without initial domid not supported"?

I am good with that phrasing.

>> +
>>       return 0;
>>   }
>> diff --git a/xen/arch/x86/domain_builder/fdt.h b/xen/arch/x86/ 
>> domain_builder/fdt.h
>> index ab2b43872e25..06ead05a2583 100644
>> --- a/xen/arch/x86/domain_builder/fdt.h
>> +++ b/xen/arch/x86/domain_builder/fdt.h
>> @@ -27,6 +27,24 @@ static inline int __init fdt_cell_as_u64(const 
>> fdt32_t *cell, uint64_t *val)
> 
>> +static inline bool __init match_fdt_property(
>> +    const void *fdt, const struct fdt_property *prop, const char *s)
>> +{
>> +    int slen, len = strlen(s);
>> +    const char *p = fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff), 
>> &slen);
>> +
>> +    return p && (slen == len) && (memcmp(p, s, len) == 0);
> 
> match_fdt_property() gets called more in later patches.  I wonder if
> 
>      const char *p = fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff), 
> &slen);
> 
> should move into process_domain_node, and then the string is just 
> compared?  Maybe it already gets optimized?

Your approach would explicitly force a single fdt_get_string() call, 
logic would remain readable, all while not hoping the optimizer can 
catch it.

> (Is there a way to disassemble .init.text with symbols?)
> 
>> +}
>> +
>>   static inline int __init fdt_cmdline_prop_size(const void *fdt, int 
>> offset)
>>   {
>>       int ret;
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index eaac87b02f78..317349b80ac6 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1020,7 +1020,8 @@ static struct domain *__init create_dom0(struct 
>> boot_info *bi)
>>           dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>>       /* Create initial domain.  Not d0 for pvshim. */
>> -    bd->domid = get_initial_domain_id();
>> +    if ( bd->domid == DOMID_INVALID )
>> +        bd->domid = get_initial_domain_id();
> 
> This seems redundant with the earlier DOMID_INVALID check & setting.  Or 
> does this handle the non-hyperlaunch case?  Maybe it should move to 
> builder_init() for other non-hyperlaunch configuration?

Even if the call to get_initial_domain_id() is moved to builder_init(), 
I would not feel comfortable with assuming bd->domid is valid when 
getting here. So I would still have the check, but with panic instead. 
I'm open to making the change if the x86 maintainers are comfortable 
with making the assumption.

v/r,
dps


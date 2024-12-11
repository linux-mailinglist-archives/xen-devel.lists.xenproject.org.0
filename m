Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839389ED134
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 17:22:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854975.1268035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLPTC-0003w5-Lz; Wed, 11 Dec 2024 16:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854975.1268035; Wed, 11 Dec 2024 16:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLPTC-0003tb-J8; Wed, 11 Dec 2024 16:21:50 +0000
Received: by outflank-mailman (input) for mailman id 854975;
 Wed, 11 Dec 2024 16:21:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLPTB-0003tV-CI
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 16:21:49 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0379611b-b7dc-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 17:21:46 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733934097104724.0671274423535;
 Wed, 11 Dec 2024 08:21:37 -0800 (PST)
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
X-Inumbo-ID: 0379611b-b7dc-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1733934099; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YpQhe8RLm08Q/aT13SNKzLXP2vwFKx360kyGduZVhXxvHFHV8sUjSS2I9valcIBPcPSuj0Gpq7A6YBw2ItnFNBRYuzShDuiReJsXSCKT5eQTd5C0S1gcqAp0DT8YzOCyEyzX8WHG2e5olYckscEfvwKhH5yT5tbhwYaqRrfKWH4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733934099; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kH4d+UX9lpjjueWcRRnkZOevrY0+M4h1bEj5p/ijAQk=; 
	b=ZsCNBle8aLkFEPM72jjlTByMRppLCG4o5KJoWbggtHHdfuQa+7vBYF04DWctj8rXf+niQ6Z929H2eFV7aMGvc4fB521UnkSBI3WAg+EiNVnTaG1aK3ttSZm4BFVAzhH1McXCoWloPivoHu0aro2oOQkXzS8sjWJ9f3tdgYqXwII=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733934099;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=kH4d+UX9lpjjueWcRRnkZOevrY0+M4h1bEj5p/ijAQk=;
	b=O4nCcbo6SZsPfv8WlzRkCE7YecKL6SbJNX/ufTYOumwIvd1rEzuMSGHNcrBcXFLM
	mqriNZF9xAfGCITpCc+FUxWECi5ZqJCqyTA8AntuhqhNbewBUOjnXsbapIRB4T4GzwD
	mEVuTf0dODivG+P5yvrckA1yn2X4sI7rH08o+8CM=
Message-ID: <f6646a6e-58b5-474f-ba6f-fb9e0243f5b2@apertussolutions.com>
Date: Wed, 11 Dec 2024 11:21:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] x86/hyperlaunch: add domain id parsing to domain
 config
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-12-dpsmith@apertussolutions.com>
 <8a492a4d-cc9c-4756-8fb9-721626c295a6@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <8a492a4d-cc9c-4756-8fb9-721626c295a6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/2/24 07:02, Jan Beulich wrote:
> On 23.11.2024 19:20, Daniel P. Smith wrote:
>> --- a/xen/arch/x86/domain_builder/fdt.h
>> +++ b/xen/arch/x86/domain_builder/fdt.h
>> @@ -27,6 +27,24 @@ static inline int __init fdt_cell_as_u64(const fdt32_t *cell, uint64_t *val)
>>       return 0;
>>   }
>>   
>> +static inline int __init fdt_prop_as_u32(
>> +    const struct fdt_property *prop, uint32_t *val)
>> +{
>> +    if ( !prop || fdt32_to_cpu(prop->len) < sizeof(u32) )
>> +        return -EINVAL;
>> +
>> +    return fdt_cell_as_u32((fdt32_t *)prop->data, val);
>> +}
>> +
>> +static inline bool __init match_fdt_property(
>> +    const void *fdt, const struct fdt_property *prop, const char *s)
>> +{
>> +    int slen, len = strlen(s);
> 
> Plain int isn't quite appropriate for strlen()'s return. It doesn't strictly
> need to be size_t, but it should be at least unsigned int.

Ack.

>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1020,7 +1020,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>>           dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>>   
>>       /* Create initial domain.  Not d0 for pvshim. */
>> -    bd->domid = get_initial_domain_id();
>> +    if ( bd->domid == DOMID_INVALID )
>> +        bd->domid = get_initial_domain_id();
> 
> Looks like the comment then wants to move, too.

Okay.

v/r,
dps



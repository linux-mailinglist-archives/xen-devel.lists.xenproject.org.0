Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3D72969A0
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 08:17:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10697.28584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVqO6-000877-KN; Fri, 23 Oct 2020 06:17:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10697.28584; Fri, 23 Oct 2020 06:17:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVqO6-00086i-Gm; Fri, 23 Oct 2020 06:17:18 +0000
Received: by outflank-mailman (input) for mailman id 10697;
 Fri, 23 Oct 2020 06:17:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVqO5-00086d-EX
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 06:17:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4383c69-04b4-4fbc-b94e-3d3be06cd437;
 Fri, 23 Oct 2020 06:17:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B272DACE6;
 Fri, 23 Oct 2020 06:17:15 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVqO5-00086d-EX
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 06:17:17 +0000
X-Inumbo-ID: a4383c69-04b4-4fbc-b94e-3d3be06cd437
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a4383c69-04b4-4fbc-b94e-3d3be06cd437;
	Fri, 23 Oct 2020 06:17:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603433835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hE8tQXWyEpxc+GIHZgnSHhMDuFUIkLvW+R9X8cPyhvE=;
	b=tMC8eupq2YSFUWa5FE2BWNjgbjDvpU5X6pKQYOh4Yr5VxssM7DyjpyPTT0Zdt1JJaOYSKs
	6N0a1gc+8Coy6OMhobQETL8DVajKheXdbdquDDyW12jPUQLsJGvA3h24UealHhUGo2kvn1
	9d5YrcpANb5O1zX7dVuwhBPaGud8eUo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B272DACE6;
	Fri, 23 Oct 2020 06:17:15 +0000 (UTC)
Subject: Re: [PATCH] xen/acpi: Don't fail if SPCR table is absent
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201021221253.GA73207@mattapan.m5p.com>
 <a960dd45-2867-5ef6-970c-952c03aa8cef@suse.com>
 <20201022171328.GA81455@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <da453eee-0736-b71d-d427-2a6c429e3aa4@suse.com>
Date: Fri, 23 Oct 2020 08:17:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201022171328.GA81455@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.10.2020 19:13, Elliott Mitchell wrote:
> On Thu, Oct 22, 2020 at 09:42:17AM +0200, Jan Beulich wrote:
>> On 22.10.2020 00:12, Elliott Mitchell wrote:
>>> --- a/xen/arch/arm/acpi/domain_build.c
>>> +++ b/xen/arch/arm/acpi/domain_build.c
>>> @@ -42,17 +42,18 @@ static int __init acpi_iomem_deny_access(struct domain *d)
>>>      status = acpi_get_table(ACPI_SIG_SPCR, 0,
>>>                              (struct acpi_table_header **)&spcr);
>>>  
>>> -    if ( ACPI_FAILURE(status) )
>>> +    if ( ACPI_SUCCESS(status) )
>>>      {
>>> -        printk("Failed to get SPCR table\n");
>>> -        return -EINVAL;
>>> +        mfn = spcr->serial_port.address >> PAGE_SHIFT;
>>> +        /* Deny MMIO access for UART */
>>> +        rc = iomem_deny_access(d, mfn, mfn + 1);
>>> +        if ( rc )
>>> +            return rc;
>>> +    }
>>> +    else
>>> +    {
>>> +        printk("Failed to get SPCR table, Xen console may be unavailable\n");
>>>      }
>>
>> Nit: While I see you've got Stefano's R-b already, I Xen we typically
>> omit the braces here.
> 
> Personally, I prefer that myself, but was unsure of the preference here.
> I've seen multiple projects which *really* dislike using having brackets
> for some clauses, but not others (ie they want either all clauses with or
> all clauses without; instead of only if required).
> 
> I sent what I thought was the more often used format.  (I also like tabs,
> and dislike having so many spaces; alas my preferences are apparently
> uncommon)

"More often used" doesn't matter when there's an explicit statement
about this in ./CODING_STYLE: "Braces should be omitted for blocks
with a single statement." Yes, there are projects requiring all
if/else-if belonging together to consistently use or not use braces.
But there's explicitly no such statement in our doc. (Along these
lines, dislike of spaces [and favoring tabs] also doesn't matter, as
again the doc is explicit about it.)

Jan


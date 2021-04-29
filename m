Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9335136E9C4
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 13:48:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119921.226743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc59H-0000vR-Uh; Thu, 29 Apr 2021 11:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119921.226743; Thu, 29 Apr 2021 11:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc59H-0000v2-RG; Thu, 29 Apr 2021 11:48:03 +0000
Received: by outflank-mailman (input) for mailman id 119921;
 Thu, 29 Apr 2021 11:48:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc59F-0000uu-Q5
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 11:48:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e63c8a20-dab0-46ba-a9ce-c488cd60c323;
 Thu, 29 Apr 2021 11:48:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F1000AF8A;
 Thu, 29 Apr 2021 11:47:59 +0000 (UTC)
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
X-Inumbo-ID: e63c8a20-dab0-46ba-a9ce-c488cd60c323
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619696880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EXLsYN96hM0C4264e2h1fST5VV7WfoE/9uYTOFO3urk=;
	b=LYU37jyiTn/BHvsztU1yXichoY0uIxQGhOspN9KXkeE/W27WFXucx7sc11I6L/Dv5aXP4r
	jRY3IwNpyEsphXkYo17nmpFG9luVJYA1eAasN1UE3iAKFaz8BjVbZa6gqLcwYvkU50RG0g
	4nkj05knGUWIEfTDUCGIoOHW5rgSfvg=
Subject: Re: [PATCH v3 2/3] xen/pci: Refactor PCI MSI intercept related code
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <cover.1619453100.git.rahul.singh@arm.com>
 <480947d549c46270fccc4c6d83ae8beca3c0fce6.1619453100.git.rahul.singh@arm.com>
 <69e0f583-3c61-afe9-0710-6531f99e8a2e@suse.com>
 <636D798B-3635-4F3A-ABF0-ECA42695352B@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7db06025-374e-e431-1ad6-3710ef99d62d@suse.com>
Date: Thu, 29 Apr 2021 13:47:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <636D798B-3635-4F3A-ABF0-ECA42695352B@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.04.2021 13:31, Rahul Singh wrote:
>> On 28 Apr 2021, at 3:06 pm, Jan Beulich <jbeulich@suse.com> wrote:
>> On 26.04.2021 18:21, Rahul Singh wrote:
>>> --- a/xen/xsm/flask/hooks.c
>>> +++ b/xen/xsm/flask/hooks.c
>>> @@ -21,7 +21,7 @@
>>> #include <xen/guest_access.h>
>>> #include <xen/xenoprof.h>
>>> #include <xen/iommu.h>
>>> -#ifdef CONFIG_HAS_PCI
>>> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>>> #include <asm/msi.h>
>>> #endif
>>> #include <public/xen.h>
>>> @@ -114,7 +114,7 @@ static int get_irq_sid(int irq, u32 *sid, struct avc_audit_data *ad)
>>>         }
>>>         return security_irq_sid(irq, sid);
>>>     }
>>> -#ifdef CONFIG_HAS_PCI
>>> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>>>     {
>>>         struct irq_desc *desc = irq_to_desc(irq);
>>>         if ( desc->msi_desc && desc->msi_desc->dev ) {
>>> @@ -874,7 +874,7 @@ static int flask_map_domain_pirq (struct domain *d)
>>> static int flask_map_domain_msi (struct domain *d, int irq, const void *data,
>>>                                  u32 *sid, struct avc_audit_data *ad)
>>> {
>>> -#ifdef CONFIG_HAS_PCI
>>> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>>>     const struct msi_info *msi = data;
>>>     u32 machine_bdf = (msi->seg << 16) | (msi->bus << 8) | msi->devfn;
>>>
>>> @@ -940,7 +940,7 @@ static int flask_unmap_domain_pirq (struct domain *d)
>>> static int flask_unmap_domain_msi (struct domain *d, int irq, const void *data,
>>>                                    u32 *sid, struct avc_audit_data *ad)
>>> {
>>> -#ifdef CONFIG_HAS_PCI
>>> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>>>     const struct pci_dev *pdev = data;
>>>     u32 machine_bdf = (pdev->seg << 16) | (pdev->bus << 8) | pdev->devfn;
>>>
>>
>> Is all of this really related to MSI interception? Iirc the code here
>> has been around for much longer, and hence is more related to MSI
>> support in Xen in general (as required for PV guests in particular).
> 
> Yes I agree this code is not related to MSI interception but I decide to move the code 
> under CONFIG_PCI_MSI_INTERCEPT flag to gate the code for ARM as to avoid an 
> extra flag. We can modify this code once we have more data how MSI will be 
> supported for other architecture.  

In any event the change belongs into the other patch. My objection
there then still holds, but if I'm to be outvoted there, so be it.

Jan


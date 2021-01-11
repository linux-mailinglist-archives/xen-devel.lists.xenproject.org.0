Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5CE2F17C1
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 15:14:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64886.114748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyxxb-0004lH-Ch; Mon, 11 Jan 2021 14:14:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64886.114748; Mon, 11 Jan 2021 14:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyxxb-0004ks-9b; Mon, 11 Jan 2021 14:14:19 +0000
Received: by outflank-mailman (input) for mailman id 64886;
 Mon, 11 Jan 2021 14:14:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ekcf=GO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kyxxZ-0004kn-Rq
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 14:14:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54a0649d-e336-4727-af62-dde7e406ed51;
 Mon, 11 Jan 2021 14:14:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CF5D3B72F;
 Mon, 11 Jan 2021 14:14:15 +0000 (UTC)
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
X-Inumbo-ID: 54a0649d-e336-4727-af62-dde7e406ed51
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610374455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VbpSQmgqBcM1NuZ78oYTQZ6gxN3yLAkl2/+84dwkTFA=;
	b=e1GvxfJEFIfos19uycdOAnEF60mBD3lOpinxvYEmobMb3lKy4tzAZ7KkRqtNDha770Vr0j
	xMQu/9YauGoORo9k096JJjvvvRSE3l+TMWN3TwWO82wmOR5iD4jaeheryS+ATGu8vA+UxV
	zExdwvcKsJMax7XavU5b2X7PjcWX0hE=
Subject: Re: [PATCH] hvmloader: pass PCI MMIO layout to OVMF as an info table
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 iwj@xenproject.org, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org, Laszlo Ersek <lersek@redhat.com>
References: <1610340812-24397-1-git-send-email-igor.druzhinin@citrix.com>
 <b2ac8d2c-2c63-67e1-6b2b-14afefb2090a@suse.com>
 <dd7c459e-43ff-7601-956f-180a1f7c31ff@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <11dce1f4-026a-0a44-da5c-9e3f4231b57d@suse.com>
Date: Mon, 11 Jan 2021 15:14:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <dd7c459e-43ff-7601-956f-180a1f7c31ff@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.01.2021 15:00, Igor Druzhinin wrote:
> On 11/01/2021 09:27, Jan Beulich wrote:
>> On 11.01.2021 05:53, Igor Druzhinin wrote:
>>> --- a/tools/firmware/hvmloader/ovmf.c
>>> +++ b/tools/firmware/hvmloader/ovmf.c
>>> @@ -61,6 +61,14 @@ struct ovmf_info {
>>>      uint32_t e820_nr;
>>>  } __attribute__ ((packed));
>>>  
>>> +#define OVMF_INFO_PCI_TABLE 0
>>> +struct ovmf_pci_info {
>>> +    uint64_t low_start;
>>> +    uint64_t low_end;
>>> +    uint64_t hi_start;
>>> +    uint64_t hi_end;
>>> +} __attribute__ ((packed));
>>
>> Forming part of ABI, I believe this belongs in a public header,
>> which consumers could at least in principle use verbatim if
>> they wanted to.
> 
> It probably does, but if we'd want to move all of hand-over structures
> wholesale that would include seabios as well. I'd stick with the current
> approach to avoid code churn in various repos. Besides the structures
> are not the only bits of ABI that are implicitly shared with BIOS images.

Well, so be it then for the time being. I'm going to be
hesitant though ack-ing such, no matter that there are (bad)
precedents. What I'd like to ask for as a minimum is to have
a comment here clarifying this struct can't be changed
arbitrarily because of being part of an ABI.

>>> @@ -74,9 +82,21 @@ static void ovmf_setup_bios_info(void)
>>>  static void ovmf_finish_bios_info(void)
>>>  {
>>>      struct ovmf_info *info = (void *)OVMF_INFO_PHYSICAL_ADDRESS;
>>> +    struct ovmf_pci_info *pci_info;
>>> +    uint64_t *tables = scratch_alloc(sizeof(uint64_t)*OVMF_INFO_MAX_TABLES, 0);
>>
>> I wasn't able to locate OVMF_INFO_MAX_TABLES in either
>> xen/include/public/ or tools/firmware/. Where does it get
>> defined?
> 
> I expect it to be unlimited from OVMF side. It just expects an array of 
> tables_nr elements.

That wasn't the (primary) question. Me not being able to locate
the place where this constant gets #define-d means I wonder how
this code builds.

>> Also (nit) missing blanks around * .
>>
>>>      uint32_t i;
>>>      uint8_t checksum;
>>>  
>>> +    pci_info = scratch_alloc(sizeof(struct ovmf_pci_info), 0);
>>
>> Is "scratch" correct here and above? I guess intended usage /
>> scope will want spelling out somewhere.
> 
> Again, scratch_alloc is used universally for handing over info between hvmloader
> and BIOS images. Where would you want it to be spelled out?

Next to where all the involved structures get declared.
Consumers need to be aware they may need to take precautions to
avoid clobbering the contents before consuming it. But as per
above there doesn't look to be such a central place (yet).

>>> +    pci_info->low_start = pci_mem_start;
>>> +    pci_info->low_end = pci_mem_end;
>>> +    pci_info->hi_start = pci_hi_mem_start;
>>> +    pci_info->hi_end = pci_hi_mem_end;
>>> +
>>> +    tables[OVMF_INFO_PCI_TABLE] = (uint32_t)pci_info;
>>> +    info->tables = (uint32_t)tables;
>>> +    info->tables_nr = 1;
>>
>> In how far is this problem (and hence solution / workaround) OVMF
>> specific? IOW don't we need a more generic approach here?
> 
> I believe it's very OVMF specific given only OVMF constructs identity page
> tables for the whole address space - that's how it was designed. Seabios to
> the best of my knowledge only has access to lower 4G.

Quite likely, yet how would SeaBIOS access such a huge frame
buffer then? They can't possibly place it below 4G. Do systems
with such video cards get penalized by e.g. not surfacing VESA
mode changing functionality?

In general I think any BIOS should be eligible to receive
information one BIOS finds necessary to receive. They're all
fine to ignore what they get handed. But yes, moving this a
layer up can certainly also be done later.

Jan


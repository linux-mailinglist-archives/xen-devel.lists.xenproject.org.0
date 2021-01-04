Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 999CB2E9B42
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 17:46:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61379.107953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwSzq-00066T-Lz; Mon, 04 Jan 2021 16:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61379.107953; Mon, 04 Jan 2021 16:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwSzq-000666-Is; Mon, 04 Jan 2021 16:46:18 +0000
Received: by outflank-mailman (input) for mailman id 61379;
 Mon, 04 Jan 2021 16:46:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwSzp-00065y-Qn
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 16:46:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81a0d78b-245b-4c32-982e-4e01d4020c24;
 Mon, 04 Jan 2021 16:46:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CCECAAA35;
 Mon,  4 Jan 2021 16:46:15 +0000 (UTC)
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
X-Inumbo-ID: 81a0d78b-245b-4c32-982e-4e01d4020c24
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609778775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1NLQeATZyOYmivkf9okmThfy2FCXDYbctC24rVCbfHk=;
	b=kPyshRo5hkTbZgRk+n1G9ZRb6U74Z7L1IXonYAX5YKxGzDEK56AmXqXxJQ/vqXkwWQ3vnt
	fX1t0C3uvwU0tLhUi/rIK0tlCDpT0Era3oV0vnC2HfXJ8RTp5iDIlhzN0NobFT4Q4aa19p
	r/5s5ms0TFh4eFHgi6ZN7ZSs76TG5Ag=
Subject: Re: [PATCH 5/5] vPCI/MSI-X: tidy init_msix()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <f93efb14-f088-ca84-7d0a-f1b53ff6316c@suse.com>
 <e21e4936-f356-8c8e-845d-d60880a58ed4@suse.com>
 <20201228175842.hyecvulrklnxsdcm@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fae62a26-239f-96e9-4c86-b84f43647b1e@suse.com>
Date: Mon, 4 Jan 2021 17:46:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201228175842.hyecvulrklnxsdcm@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.12.2020 18:58, Roger Pau Monné wrote:
> On Mon, Dec 07, 2020 at 11:38:42AM +0100, Jan Beulich wrote:
>> First of all introduce a local variable for the to be allocated struct.
>> The compiler can't CSE all the occurrences (I'm observing 80 bytes of
>> code saved with gcc 10). Additionally, while the caller can cope and
>> there was no memory leak, globally "announce" the struct only once done
>> initializing it. This also removes the dependency of the function on
>> the caller cleaning up after it in case of an error.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> Just a couple of comments.
> 
>> ---
>> I was heavily tempted to also move up the call to vpci_add_register(),
>> such that there would be no pointless init done in case of an error
>> coming back from there.
> 
> Feel free to do so.
> 
>>
>> --- a/xen/drivers/vpci/msix.c
>> +++ b/xen/drivers/vpci/msix.c
>> @@ -436,6 +436,7 @@ static int init_msix(struct pci_dev *pde
>>      uint8_t slot = PCI_SLOT(pdev->devfn), func = PCI_FUNC(pdev->devfn);
>>      unsigned int msix_offset, i, max_entries;
>>      uint16_t control;
>> +    struct vpci_msix *msix;
>>      int rc;
>>  
>>      msix_offset = pci_find_cap_offset(pdev->seg, pdev->bus, slot, func,
>> @@ -447,34 +448,37 @@ static int init_msix(struct pci_dev *pde
>>  
>>      max_entries = msix_table_size(control);
>>  
>> -    pdev->vpci->msix = xzalloc_flex_struct(struct vpci_msix, entries,
>> -                                           max_entries);
>> -    if ( !pdev->vpci->msix )
>> +    msix = xzalloc_flex_struct(struct vpci_msix, entries, max_entries);
>> +    if ( !msix )
>>          return -ENOMEM;
>>  
>> -    pdev->vpci->msix->max_entries = max_entries;
>> -    pdev->vpci->msix->pdev = pdev;
>> +    msix->max_entries = max_entries;
>> +    msix->pdev = pdev;
>>  
>> -    pdev->vpci->msix->tables[VPCI_MSIX_TABLE] =
>> +    msix->tables[VPCI_MSIX_TABLE] =
>>          pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_offset));
>> -    pdev->vpci->msix->tables[VPCI_MSIX_PBA] =
>> +    msix->tables[VPCI_MSIX_PBA] =
>>          pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offset));
>>  
>> -    for ( i = 0; i < pdev->vpci->msix->max_entries; i++)
>> +    for ( i = 0; i < msix->max_entries; i++)
> 
> Feel free to just use max_entries directly here.
> 
>>      {
>> -        pdev->vpci->msix->entries[i].masked = true;
>> -        vpci_msix_arch_init_entry(&pdev->vpci->msix->entries[i]);
>> +        msix->entries[i].masked = true;
> 
> I think we should also set msix->entries[i].updated = true; for
> correctness? Albeit this will never lead to a working configuration,
> as the address field will be 0 and thus cause and error to trigger if
> enabled without prior setup.
> 
> Maybe on a different patch anyway.

Indeed, I'd prefer to not make such a change right here.

Jan


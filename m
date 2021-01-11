Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358AC2F18AA
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 15:49:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64929.114843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyyVN-0008Oo-UH; Mon, 11 Jan 2021 14:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64929.114843; Mon, 11 Jan 2021 14:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyyVN-0008OT-RB; Mon, 11 Jan 2021 14:49:13 +0000
Received: by outflank-mailman (input) for mailman id 64929;
 Mon, 11 Jan 2021 14:49:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BX5B=GO=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1kyyVL-0008MJ-Hp
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 14:49:11 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id bd9d63fd-559e-4e6a-978a-638ccae146ec;
 Mon, 11 Jan 2021 14:49:10 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-hvzRynkXM9KpBt8AfFQTRA-1; Mon, 11 Jan 2021 09:49:06 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AA4AAFA80;
 Mon, 11 Jan 2021 14:49:05 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-91.ams2.redhat.com
 [10.36.113.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36FF46A910;
 Mon, 11 Jan 2021 14:49:02 +0000 (UTC)
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
X-Inumbo-ID: bd9d63fd-559e-4e6a-978a-638ccae146ec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610376550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aPwqYchVna9tB0hZzABObhVrCgBFA7oVs3S7v+ezjRc=;
	b=agN5yMpm2Q7+7hPynga1Uz4bGttMcRRr/8Ds/TURDPwj9bK0+TlaCjsPSXSSdR+5S47VA2
	99iwU9puUCG4Blk1RlBeuIEpkijmVXiSUr5/pFAe6IlcW3WaswZ0/1t5XW0bpmV5/1PrYy
	s9W3FZgaybpIyzc6cEIlHlg6qmtOg4I=
X-MC-Unique: hvzRynkXM9KpBt8AfFQTRA-1
Subject: Re: [PATCH] hvmloader: pass PCI MMIO layout to OVMF as an info table
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 iwj@xenproject.org, anthony.perard@citrix.com, xen-devel@lists.xenproject.org
References: <1610340812-24397-1-git-send-email-igor.druzhinin@citrix.com>
 <b2ac8d2c-2c63-67e1-6b2b-14afefb2090a@suse.com>
 <dd7c459e-43ff-7601-956f-180a1f7c31ff@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20b1fe43-370b-9afc-6938-379480908578@redhat.com>
Date: Mon, 11 Jan 2021 15:49:02 +0100
MIME-Version: 1.0
In-Reply-To: <dd7c459e-43ff-7601-956f-180a1f7c31ff@citrix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/11/21 15:00, Igor Druzhinin wrote:
> On 11/01/2021 09:27, Jan Beulich wrote:
>> On 11.01.2021 05:53, Igor Druzhinin wrote:
>>> We faced a problem with passing through a PCI device with 64GB BAR to
>>> UEFI guest. The BAR is expectedly programmed into 64-bit PCI aperture at
>>> 64G address which pushes physical address space to 37 bits. OVMF uses
>>> address width early in PEI phase to make DXE identity pages covering
>>> the whole addressable space so it needs to know the last address it needs
>>> to cover but at the same time not overdo the mappings.
>>>
>>> As there is seemingly no other way to pass or get this information in
>>> OVMF at this early phase (ACPI is not yet available, PCI is not yet enumerated,
>>> xenstore is not yet initialized) - extend the info structure with a new
>>> table. Since the structure was initially created to be extendable -
>>> the change is backward compatible.
>>
>> How does UEFI handle the same situation on baremetal? I'd guess it is
>> in even more trouble there, as it couldn't even read addresses from
>> BARs, but would first need to assign them (or at least calculate
>> their intended positions).
> 
> Maybe Laszlo or Anthony could answer this question quickly while I'm investigating?

On the bare metal, the phys address width of the processor is known.

OVMF does the whole calculation in reverse because there's no way for it
to know the physical address width of the physical (= host) CPU.
"Overdoing" the mappings doesn't only waste resources, it breaks hard
with EPT -- access to a GPA that is inexpressible with the phys address
width of the host CPU (= not mappable successfully with the nested page
tables) will behave super bad. I don't recall the exact symptoms, but it
prevents booting the guest OS.

This is why the most conservative 36-bit width is assumed by default.

> 
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

(In OVMF I strongly prefer hand-coded structures, due to the particular
coding style edk2 employs. Although Xen headers have been imported and
fixed up in the past, and so further importing would not be without
precedent for Xen in OVMF, those imported headers continue to stick out
like a sore thumb, due to their different coding style. That's not to
say the Xen coding style is "wrong" or anything; just that esp. when
those structs are *used* in code, they look quite out of place.)

Thanks,
Laszlo

> 
> It probably does, but if we'd want to move all of hand-over structures
> wholesale that would include seabios as well. I'd stick with the current
> approach to avoid code churn in various repos. Besides the structures
> are not the only bits of ABI that are implicitly shared with BIOS images.
> 
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
> 
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
> 
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
> 
> Igor
> 



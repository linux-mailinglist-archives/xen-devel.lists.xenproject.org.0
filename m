Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF57D2F171E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 15:02:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64877.114724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyxkk-0003ft-VO; Mon, 11 Jan 2021 14:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64877.114724; Mon, 11 Jan 2021 14:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyxkk-0003fU-Rz; Mon, 11 Jan 2021 14:01:02 +0000
Received: by outflank-mailman (input) for mailman id 64877;
 Mon, 11 Jan 2021 14:01:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E/gp=GO=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kyxkj-0003fJ-9P
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 14:01:01 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73a11970-1b93-490c-b5ac-ec1f27e85447;
 Mon, 11 Jan 2021 14:00:59 +0000 (UTC)
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
X-Inumbo-ID: 73a11970-1b93-490c-b5ac-ec1f27e85447
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610373659;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=7Fg5/+weXoKRm+1zqXlEeJ2Nsv7EN/HSgJhxKnzGgMA=;
  b=HBQuhZjTGY+hPYqHa2fAkUQ2dyaMdFWhV6L0C5mU/KvHvTTXuszDvh7F
   eXCL550+wAw+vFZh2GpLqf0ZzbcsdUnwzP82amqUCycy8633HNe4/8IpE
   Hd51nMe9Xjp1ia8INraD1BmCzTVjg7e35FvjVCUQ0fb9Sl1pUzDKxiSmv
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: TMDpZHvRCNHRU5D2rYQxz11h2nPtJn84aCxWfdp/byTkNxcy1bG83UXAk04p86d7ZovbGEKFrK
 HmjQR2r0bJ9espRRqkcAxGOvE/Of62mQCa0xYm1D1nOj7vcLANWGg7KcIRBDvZcZy0lI6qj1UB
 B2x+ptDob+jW+qTaXdaOh396qPsIaw4hBYmx/7HB5naMTARaznYj8rTnzUnNxq5w7/Y3dDJ6WX
 k7Pr9thN5+uXBl03mHUt7QQVNhXtMlPQq5so+oojffTIsoLePs/eSfYZJQUdJ6x6TPM+DpfuE/
 kOE=
X-SBRS: 5.2
X-MesageID: 36101393
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,338,1602561600"; 
   d="scan'208";a="36101393"
Subject: Re: [PATCH] hvmloader: pass PCI MMIO layout to OVMF as an info table
To: Jan Beulich <jbeulich@suse.com>
CC: <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>, <wl@xen.org>,
	<iwj@xenproject.org>, <anthony.perard@citrix.com>,
	<xen-devel@lists.xenproject.org>, Laszlo Ersek <lersek@redhat.com>
References: <1610340812-24397-1-git-send-email-igor.druzhinin@citrix.com>
 <b2ac8d2c-2c63-67e1-6b2b-14afefb2090a@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <dd7c459e-43ff-7601-956f-180a1f7c31ff@citrix.com>
Date: Mon, 11 Jan 2021 14:00:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b2ac8d2c-2c63-67e1-6b2b-14afefb2090a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/01/2021 09:27, Jan Beulich wrote:
> On 11.01.2021 05:53, Igor Druzhinin wrote:
>> We faced a problem with passing through a PCI device with 64GB BAR to
>> UEFI guest. The BAR is expectedly programmed into 64-bit PCI aperture at
>> 64G address which pushes physical address space to 37 bits. OVMF uses
>> address width early in PEI phase to make DXE identity pages covering
>> the whole addressable space so it needs to know the last address it needs
>> to cover but at the same time not overdo the mappings.
>>
>> As there is seemingly no other way to pass or get this information in
>> OVMF at this early phase (ACPI is not yet available, PCI is not yet enumerated,
>> xenstore is not yet initialized) - extend the info structure with a new
>> table. Since the structure was initially created to be extendable -
>> the change is backward compatible.
> 
> How does UEFI handle the same situation on baremetal? I'd guess it is
> in even more trouble there, as it couldn't even read addresses from
> BARs, but would first need to assign them (or at least calculate
> their intended positions).

Maybe Laszlo or Anthony could answer this question quickly while I'm investigating?

>> --- a/tools/firmware/hvmloader/ovmf.c
>> +++ b/tools/firmware/hvmloader/ovmf.c
>> @@ -61,6 +61,14 @@ struct ovmf_info {
>>      uint32_t e820_nr;
>>  } __attribute__ ((packed));
>>  
>> +#define OVMF_INFO_PCI_TABLE 0
>> +struct ovmf_pci_info {
>> +    uint64_t low_start;
>> +    uint64_t low_end;
>> +    uint64_t hi_start;
>> +    uint64_t hi_end;
>> +} __attribute__ ((packed));
> 
> Forming part of ABI, I believe this belongs in a public header,
> which consumers could at least in principle use verbatim if
> they wanted to.

It probably does, but if we'd want to move all of hand-over structures
wholesale that would include seabios as well. I'd stick with the current
approach to avoid code churn in various repos. Besides the structures
are not the only bits of ABI that are implicitly shared with BIOS images.

>> @@ -74,9 +82,21 @@ static void ovmf_setup_bios_info(void)
>>  static void ovmf_finish_bios_info(void)
>>  {
>>      struct ovmf_info *info = (void *)OVMF_INFO_PHYSICAL_ADDRESS;
>> +    struct ovmf_pci_info *pci_info;
>> +    uint64_t *tables = scratch_alloc(sizeof(uint64_t)*OVMF_INFO_MAX_TABLES, 0);
> 
> I wasn't able to locate OVMF_INFO_MAX_TABLES in either
> xen/include/public/ or tools/firmware/. Where does it get
> defined?

I expect it to be unlimited from OVMF side. It just expects an array of 
tables_nr elements.

> Also (nit) missing blanks around * .
> 
>>      uint32_t i;
>>      uint8_t checksum;
>>  
>> +    pci_info = scratch_alloc(sizeof(struct ovmf_pci_info), 0);
> 
> Is "scratch" correct here and above? I guess intended usage /
> scope will want spelling out somewhere.

Again, scratch_alloc is used universally for handing over info between hvmloader
and BIOS images. Where would you want it to be spelled out?

>> +    pci_info->low_start = pci_mem_start;
>> +    pci_info->low_end = pci_mem_end;
>> +    pci_info->hi_start = pci_hi_mem_start;
>> +    pci_info->hi_end = pci_hi_mem_end;
>> +
>> +    tables[OVMF_INFO_PCI_TABLE] = (uint32_t)pci_info;
>> +    info->tables = (uint32_t)tables;
>> +    info->tables_nr = 1;
> 
> In how far is this problem (and hence solution / workaround) OVMF
> specific? IOW don't we need a more generic approach here?

I believe it's very OVMF specific given only OVMF constructs identity page
tables for the whole address space - that's how it was designed. Seabios to
the best of my knowledge only has access to lower 4G.

Igor


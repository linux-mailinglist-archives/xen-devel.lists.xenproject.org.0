Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5B42F188C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 15:44:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64922.114832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyyQM-00087S-Aj; Mon, 11 Jan 2021 14:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64922.114832; Mon, 11 Jan 2021 14:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyyQM-000873-7E; Mon, 11 Jan 2021 14:44:02 +0000
Received: by outflank-mailman (input) for mailman id 64922;
 Mon, 11 Jan 2021 14:44:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E/gp=GO=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kyyQK-00086y-TF
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 14:44:00 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0131aea9-8654-43d4-baeb-dd1509e5c72f;
 Mon, 11 Jan 2021 14:43:59 +0000 (UTC)
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
X-Inumbo-ID: 0131aea9-8654-43d4-baeb-dd1509e5c72f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610376239;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=jzXwiyDjAc8+4hEErsfOdmByM0+8xw5Onz8PW5s9Fnc=;
  b=THcLO54lq/5JxGUQsW0q+Dr+ULF99hPEtaLD/WI/ZGDebErs79yIE2gG
   B5RRxSFIDysrBiviX48K6XWNJbVFThFBWFuNgAtr2/FApOVfvZKtQhz5q
   lWidWOHXjiMSML0GJEKNm1cDwsCuweqi3dpvGFmSaRBOQtywhHeCETT72
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: owpQjhqg9XVyvsI3hOYQ4FGXQ0h+YDvd29SK6c9QAMUrEyfj+mtKeeXG+AQN5CLNckZTeWuxHL
 W/oBL6CKYNuVXTGk+lFjSQXwb6702aKHkm3ncE7wktx4b3v0N60vjtNZhaYf8DYlBKbrGw6O+7
 u0FNW+MqTv3Llhkm9o/Cg9iy6+KCP/e3mGYYVneMFaGbOZFAGNhljXEtpxJect+RW2TeUsuLFd
 xggGM+5Unw+gLXsmTrnVcUvV5tMrPoKP74Anvrgc3naSPsZdYSWH3zVJ9Rbkg4fDZTpkkSBbth
 8ng=
X-SBRS: 5.2
X-MesageID: 35046807
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,338,1602561600"; 
   d="scan'208";a="35046807"
Subject: Re: [PATCH] hvmloader: pass PCI MMIO layout to OVMF as an info table
To: Jan Beulich <jbeulich@suse.com>
CC: <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>, <wl@xen.org>,
	<iwj@xenproject.org>, <anthony.perard@citrix.com>,
	<xen-devel@lists.xenproject.org>, Laszlo Ersek <lersek@redhat.com>
References: <1610340812-24397-1-git-send-email-igor.druzhinin@citrix.com>
 <b2ac8d2c-2c63-67e1-6b2b-14afefb2090a@suse.com>
 <dd7c459e-43ff-7601-956f-180a1f7c31ff@citrix.com>
 <11dce1f4-026a-0a44-da5c-9e3f4231b57d@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <7aa8fc22-57ce-969c-9142-36be148d92e8@citrix.com>
Date: Mon, 11 Jan 2021 14:43:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <11dce1f4-026a-0a44-da5c-9e3f4231b57d@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/01/2021 14:14, Jan Beulich wrote:
> On 11.01.2021 15:00, Igor Druzhinin wrote:
>> On 11/01/2021 09:27, Jan Beulich wrote:
>>> On 11.01.2021 05:53, Igor Druzhinin wrote:
>>>> --- a/tools/firmware/hvmloader/ovmf.c
>>>> +++ b/tools/firmware/hvmloader/ovmf.c
>>>> @@ -61,6 +61,14 @@ struct ovmf_info {
>>>>      uint32_t e820_nr;
>>>>  } __attribute__ ((packed));
>>>>  
>>>> +#define OVMF_INFO_PCI_TABLE 0
>>>> +struct ovmf_pci_info {
>>>> +    uint64_t low_start;
>>>> +    uint64_t low_end;
>>>> +    uint64_t hi_start;
>>>> +    uint64_t hi_end;
>>>> +} __attribute__ ((packed));
>>>
>>> Forming part of ABI, I believe this belongs in a public header,
>>> which consumers could at least in principle use verbatim if
>>> they wanted to.
>>
>> It probably does, but if we'd want to move all of hand-over structures
>> wholesale that would include seabios as well. I'd stick with the current
>> approach to avoid code churn in various repos. Besides the structures
>> are not the only bits of ABI that are implicitly shared with BIOS images.
> 
> Well, so be it then for the time being. I'm going to be
> hesitant though ack-ing such, no matter that there are (bad)
> precedents. What I'd like to ask for as a minimum is to have
> a comment here clarifying this struct can't be changed
> arbitrarily because of being part of an ABI.

Ok, I will improve information in comments in an additional commit.

>>>> @@ -74,9 +82,21 @@ static void ovmf_setup_bios_info(void)
>>>>  static void ovmf_finish_bios_info(void)
>>>>  {
>>>>      struct ovmf_info *info = (void *)OVMF_INFO_PHYSICAL_ADDRESS;
>>>> +    struct ovmf_pci_info *pci_info;
>>>> +    uint64_t *tables = scratch_alloc(sizeof(uint64_t)*OVMF_INFO_MAX_TABLES, 0);
>>>
>>> I wasn't able to locate OVMF_INFO_MAX_TABLES in either
>>> xen/include/public/ or tools/firmware/. Where does it get
>>> defined?
>>
>> I expect it to be unlimited from OVMF side. It just expects an array of 
>> tables_nr elements.
> 
> That wasn't the (primary) question. Me not being able to locate
> the place where this constant gets #define-d means I wonder how
> this code builds.

It's right up there in the same file.

>>> Also (nit) missing blanks around * .
>>>
>>>>      uint32_t i;
>>>>      uint8_t checksum;
>>>>  
>>>> +    pci_info = scratch_alloc(sizeof(struct ovmf_pci_info), 0);
>>>
>>> Is "scratch" correct here and above? I guess intended usage /
>>> scope will want spelling out somewhere.
>>
>> Again, scratch_alloc is used universally for handing over info between hvmloader
>> and BIOS images. Where would you want it to be spelled out?
> 
> Next to where all the involved structures get declared.
> Consumers need to be aware they may need to take precautions to
> avoid clobbering the contents before consuming it. But as per
> above there doesn't look to be such a central place (yet).

I will duplicate the comments for now in all places involved.
The struct checksum I believe servers exactly the purpose you described -
to catch that sort of bugs early.

>>>> +    pci_info->low_start = pci_mem_start;
>>>> +    pci_info->low_end = pci_mem_end;
>>>> +    pci_info->hi_start = pci_hi_mem_start;
>>>> +    pci_info->hi_end = pci_hi_mem_end;
>>>> +
>>>> +    tables[OVMF_INFO_PCI_TABLE] = (uint32_t)pci_info;
>>>> +    info->tables = (uint32_t)tables;
>>>> +    info->tables_nr = 1;
>>>
>>> In how far is this problem (and hence solution / workaround) OVMF
>>> specific? IOW don't we need a more generic approach here?
>>
>> I believe it's very OVMF specific given only OVMF constructs identity page
>> tables for the whole address space - that's how it was designed. Seabios to
>> the best of my knowledge only has access to lower 4G.
> 
> Quite likely, yet how would SeaBIOS access such a huge frame
> buffer then? They can't possibly place it below 4G. Do systems
> with such video cards get penalized by e.g. not surfacing VESA
> mode changing functionality?

Yes, VESA FB pointer is 32 bit only.
The framebuffer itself from my experience is located in a separate smaller BAR
on real cards. That makes it usually land in below 4G that masks the problem
in most scenarios.

Igor


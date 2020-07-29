Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D862324BD
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jul 2020 20:36:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0quy-0001HY-4O; Wed, 29 Jul 2020 18:35:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TMQ+=BI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k0quw-0001HT-TZ
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 18:35:06 +0000
X-Inumbo-ID: 38aac114-d1ca-11ea-aa3e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38aac114-d1ca-11ea-aa3e-12813bfff9fa;
 Wed, 29 Jul 2020 18:35:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B9339B1CB;
 Wed, 29 Jul 2020 18:35:16 +0000 (UTC)
Subject: Re: fwupd support under Xen - firmware updates with the UEFI capsule
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <497f1524-b57e-0ea1-5899-62f677bfae91@3mdeb.com>
 <39be665c-b6c8-23e3-b18b-d38cfe5c1286@suse.com>
 <bbe85f76-0999-1150-3d48-c7f9e1796dac@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7d2de308-774c-9ffe-de1a-3ca3caaeda8c@suse.com>
Date: Wed, 29 Jul 2020 20:35:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bbe85f76-0999-1150-3d48-c7f9e1796dac@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, marmarek@invisiblethingslab.com,
 Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, piotr.krol@3mdeb.com,
 Norbert Kaminski <norbert.kaminski@3mdeb.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.07.2020 23:01, Andrew Cooper wrote:
> On 28/07/2020 21:00, Jan Beulich wrote:
>> On 28.07.2020 09:41, Norbert Kaminski wrote:
>>> I'm trying to add support for the firmware updates with the UEFI
>>> capsule in
>>> Qubes OS. I've got the troubles with reading ESRT (EFI System
>>> Resource Table)
>>> in the dom0, which is based on the EFI memory map. The EFI_MEMMAP is not
>>> enabled despite the loaded drivers (CONFIG_EFI, CONFIG_EFI_ESRT) and
>>> kernel
>>> cmdline parameters (add_efi_memmap):
>>>
>>> ```
>>> [    3.451249] efi: EFI_MEMMAP is not enabled.
>>> ```
>>
>> It is, according to my understanding, a layering violation to expose
>> the EFI memory map to Dom0. It's not supposed to make use of this
>> information in any way. Hence any functionality depending on its use
>> also needs to be implemented in the hypervisor, with Dom0 making a
>> suitable hypercall to access this functionality. (And I find it
>> quite natural to expect that Xen gets involved in an update of the
>> firmware of a system.)
> 
> ERST is a table (read only by the looks of things) which is a catalogue
> of various bits of firmware in the system, including GUIDs for
> identification, and version information.
> 
> It is the kind of data which the hardware domain should have access to,
> and AFAICT, behaves just like a static ACPI table.

I'm unaware of us hiding this table, so Dom0 has access.

> Presumably it wants to an E820 reserved region so dom0 gets indent
> access, and something in the EFI subsystem needs extending to pass the
> ERST address to dom0.

I'm afraid the beginning of this sentence is such that I can't guess
what exactly you mean. As per above - I don't see why Dom0 wouldn't
have access to ERST. What it doesn't (and shouldn't) have access to is
the raw EFI memory map (there's no E820 map there). There is a way
for Dom0 to get at some "cooked" memory map (XENMEM_machine_memory_map),
but of course in a r/o fashion only.

Jan


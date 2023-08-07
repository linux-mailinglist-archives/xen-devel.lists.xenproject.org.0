Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B2C771B4F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 09:15:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577759.904764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSuRR-0003fm-4K; Mon, 07 Aug 2023 07:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577759.904764; Mon, 07 Aug 2023 07:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSuRR-0003dR-11; Mon, 07 Aug 2023 07:14:13 +0000
Received: by outflank-mailman (input) for mailman id 577759;
 Mon, 07 Aug 2023 07:14:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iKtn=DY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qSuRP-0003dJ-GY
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 07:14:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff506f1a-34f1-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 09:14:07 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 984014EE0737;
 Mon,  7 Aug 2023 09:14:06 +0200 (CEST)
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
X-Inumbo-ID: ff506f1a-34f1-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Mon, 07 Aug 2023 09:14:06 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: Re: [XEN PATCH 1/6] x86: rename variable 'e820' to address MISRA
 C:2012 Rule 5.3
In-Reply-To: <alpine.DEB.2.22.394.2308041405240.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
 <896a2235560fd348f79eded33731609c5d2e74ab.1691162261.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308041405240.2127516@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <f8b9190206e5b38c7068389865e5f403@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 04/08/2023 23:19, Stefano Stabellini wrote:
> On Fri, 4 Aug 2023, Nicola Vetrini wrote:
>> The variable declared in the header file 
>> 'xen/arch/x86/include/asm/e820.h'
>> is shadowed by many function parameters, so it is renamed to avoid 
>> these
>> violations.
>> 
>> No functional changes.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> This patch is similar to other renames done on previous patches, and 
>> the
>> preferred strategy there was to rename the global variable. This one
>> has more occurrences that are spread in various files, but
>> the general pattern is the same.
>> ---
>>  xen/arch/x86/dom0_build.c                | 10 ++--
>>  xen/arch/x86/e820.c                      | 66 
>> ++++++++++++------------
>>  xen/arch/x86/guest/xen/xen.c             |  4 +-
>>  xen/arch/x86/hvm/dom0_build.c            |  6 +--
>>  xen/arch/x86/include/asm/e820.h          |  2 +-
>>  xen/arch/x86/mm.c                        | 49 +++++++++---------
>>  xen/arch/x86/numa.c                      |  8 +--
>>  xen/arch/x86/setup.c                     | 22 ++++----
>>  xen/arch/x86/srat.c                      |  6 +--
>>  xen/arch/x86/x86_64/mmconf-fam10h.c      |  2 +-
>>  xen/drivers/passthrough/amd/iommu_acpi.c |  2 +-
> 
> There are missing changes to xen/arch/x86/tboot.c
> 

Thanks, I'll replace them.

> There a few stray changes below.
> 
> Everything else is correct.
> 
> 
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 80ae973d64..9c6003e374 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1163,7 +1163,7 @@ void __init noreturn __start_xen(unsigned long 
>> mbi_p)
>>      }
>>      else if ( efi_enabled(EFI_BOOT) )
>>          memmap_type = "EFI";
>> -    else if ( (e820_raw.nr_map =
>> +    else if ( (e820_raw.nr_map =
> 
> stray change
> 
> 

>> 
>> @@ -1631,7 +1631,7 @@ void __init noreturn __start_xen(unsigned long 
>> mbi_p)
>>          unsigned long e = min(s + PFN_UP(kexec_crash_area.size),
>>                                PFN_UP(__pa(HYPERVISOR_VIRT_END - 1)));
>> 
>> -        if ( e > s )
>> +        if ( e > s )
> 
> stray change
> 
> 

>> @@ -1771,7 +1771,7 @@ void __init noreturn __start_xen(unsigned long 
>> mbi_p)
>> 
>>      open_softirq(NEW_TLBFLUSH_CLOCK_PERIOD_SOFTIRQ, 
>> new_tlbflush_clock_period);
>> 
>> -    if ( opt_watchdog )
>> +    if ( opt_watchdog )
>>          nmi_watchdog = NMI_LOCAL_APIC;
> 
> stray change
> 
> 
>>      find_smp_config();
>> @@ -1983,7 +1983,7 @@ void __init noreturn __start_xen(unsigned long 
>> mbi_p)
>> 
>>      do_initcalls();
>> 
>> -    if ( opt_watchdog )
>> +    if ( opt_watchdog )
>>          watchdog_setup();
> 
> stray change
> 
> 

I looked at those, and there were trailing blanks on those lines, which 
apparently
got trimmed when renaming the variable. I think these changes are ok
(though maybe they should be mentioned in the commit message).

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)


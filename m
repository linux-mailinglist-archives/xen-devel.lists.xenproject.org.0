Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF909EC29C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 03:57:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853667.1267056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLCuK-0007mK-Kp; Wed, 11 Dec 2024 02:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853667.1267056; Wed, 11 Dec 2024 02:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLCuK-0007kR-Hl; Wed, 11 Dec 2024 02:57:00 +0000
Received: by outflank-mailman (input) for mailman id 853667;
 Wed, 11 Dec 2024 02:56:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLCuI-0007kL-FH
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 02:56:58 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9462ee14-b76b-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 03:56:56 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733885809871328.87598938491556;
 Tue, 10 Dec 2024 18:56:49 -0800 (PST)
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
X-Inumbo-ID: 9462ee14-b76b-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1733885812; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WWNuNS/+8T+BOtKhGhSMLDssYNPPBI6H93XBiI06fTCDGtPK/5RljmURxdvY1h8Ip5Q3Nn2Kx/L0XDm4MNfqE/NG8e7XRgi+4vSaXQw9e8CHvPsbLli9Q7LhyEbrkku1UHXT/RMunBAZu7Un7zGT+fYRpuDg5OpHl6zFtcickW0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733885812; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0/lcSUI7yx2cadlAd5k8XLGYiNGTpCtlXl0eD75AemM=; 
	b=HFN28VVa0sQaKVPKLWq/cIUmnp0qE65SNgP1Kb9h17Yj7su3AfLE1skv+UwJK28yK8DdHNkDc6Ppnw+dcUV8l8QgUDwXnBrZdiAOPxQ1U0JybwjNyWM8JNLFMVRSwouhPd/yeUIeeTgEpxgJzFNq5LYQce3ZiOjtdFaohUH1k7M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733885812;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=0/lcSUI7yx2cadlAd5k8XLGYiNGTpCtlXl0eD75AemM=;
	b=IfVseuyP9fEXtbfs5qLbLfZQGxxq6/NHcXVM284bxzrhccyWxtGvgwgU/M7GY3nM
	XFGjEXVVtspFRD8C0/nKaToVMxdEl46y6iL3cdzKrTrmTjawlLfQZOJCdT2T7rZyKkp
	c68HRiCSWtfdrjfBajBks8ldze8+vfMK1xfK3XL4=
Message-ID: <4ac5e90c-d0e8-4958-a694-dfa49bf0360d@apertussolutions.com>
Date: Tue, 10 Dec 2024 21:56:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] x86/boot: add cmdline to struct boot_domain
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-4-dpsmith@apertussolutions.com>
 <bc643da9-fba5-42f1-8e25-0d197fe25cae@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <bc643da9-fba5-42f1-8e25-0d197fe25cae@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/25/24 10:36, Jason Andryuk wrote:
> On 2024-11-23 13:20, Daniel P. Smith wrote:
>> Add a container for the "cooked" command line for a domain. This 
>> provides for
>> the backing memory to be directly associated with the domain being 
>> constructed.
>> This is done in anticipation that the domain construction path may 
>> need to be
>> invoked multiple times, thus ensuring each instance had a distinct memory
>> allocation.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>> Changes since v9 boot modules:
>> - convert pvh_load_kernel to boot domain to directly use cmdline
>> - adjustments to domain_cmdline_size
>>    - remove ASSERT and return 0 instead
>>    - use strlen() of values instead of hardcoded sizes
>> - update cmdline parsing check to inspect multiboot string and not 
>> just pointer
>> - add goto to skip cmdline processing if domain_cmdline_size returns 0
>> - drop updating cmdline_pa with dynamic buffer with change of its last 
>> consumer
>>    pvh_load_kernel
>>
>> Changes since v8:
>> - switch to a dynamically allocated buffer
>> - dropped local cmdline var in pv dom0_construct()
>>
>> Changes since v7:
>> - updated commit message to expand on intent and purpose
>> ---
>>   xen/arch/x86/hvm/dom0_build.c         | 12 +++---
>>   xen/arch/x86/include/asm/bootdomain.h |  2 +
>>   xen/arch/x86/pv/dom0_build.c          |  4 +-
>>   xen/arch/x86/setup.c                  | 54 ++++++++++++++++++++++-----
>>   4 files changed, 54 insertions(+), 18 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/ 
>> dom0_build.c
>> index a9384af14304..cbc365d678d2 100644
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -644,9 +644,11 @@ static bool __init check_and_adjust_load_address(
>>   }
>>   static int __init pvh_load_kernel(
>> -    struct domain *d, struct boot_module *image, struct boot_module 
>> *initrd,
>> -    paddr_t *entry, paddr_t *start_info_addr)
>> +    struct boot_domain *bd, paddr_t *entry, paddr_t *start_info_addr)
>>   {
>> +    struct domain *d = bd->d;
>> +    struct boot_module *image = bd->kernel;
>> +    struct boot_module *initrd = bd->ramdisk;
>>       void *image_base = bootstrap_map_bm(image);
>>       void *image_start = image_base + image->headroom;
>>       unsigned long image_len = image->size;
> 
> cmdline_pa is used just outside of view below here.
> 
> const char *cmdline = image->cmdline_pa ? __va(image->cmdline_pa) : NULL;

As you mentioned below, this should have been converted to bd->cmdline, 
there's no need for the intermediate variable.

>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index a2178d5e8cc5..e6580382d247 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -965,10 +965,29 @@ static unsigned int __init copy_bios_e820(struct 
>> e820entry *map, unsigned int li
>>       return n;
>>   }
>> -static struct domain *__init create_dom0(struct boot_info *bi)
>> +static size_t __init domain_cmdline_size(
>> +    struct boot_info *bi, struct boot_domain *bd)
>>   {
>> -    static char __initdata cmdline[MAX_GUEST_CMDLINE];
>> +    size_t s = bi->kextra ? strlen(bi->kextra) : 0;
>> +
>> +    s += bd->kernel->cmdline_pa ? strlen(__va(bd->kernel- 
>> >cmdline_pa)) : 0;
>> +
>> +    if ( s == 0 )
>> +        return s;
>> +
>> +    /*
>> +     * Certain parameters from the Xen command line may be added to 
>> the dom0
>> +     * command line. Add additional space for the possible cases 
>> along with one
>> +     * extra char to hold \0.
>> +     */
>> +    s += strlen(" noapic") + strlen(" acpi=") + sizeof(acpi_param) + 1;
>> +
>> +    return s;
>> +}
>> +static struct domain *__init create_dom0(struct boot_info *bi)
>> +{
>> +    char *cmdline = NULL;
>>       struct xen_domctl_createdomain dom0_cfg = {
>>           .flags = IS_ENABLED(CONFIG_TBOOT) ? 
>> XEN_DOMCTL_CDF_s3_integrity : 0,
>>           .max_evtchn_port = -1,
>> @@ -1008,19 +1027,30 @@ static struct domain *__init 
>> create_dom0(struct boot_info *bi)
>>           panic("Error creating d%uv0\n", bd->domid);
>>       /* Grab the DOM0 command line. */
>> -    if ( bd->kernel->cmdline_pa || bi->kextra )
>> +    if ( (bd->kernel->cmdline_pa &&
>> +          ((char *)__va(bd->kernel->cmdline_pa))[0]) ||
>> +         bi->kextra )
> 
> Here you are checking pointers.
> 
>>       {
>> +        size_t cmdline_size = domain_cmdline_size(bi, bd);
> 
> Internally, domain_cmdline_size() checks the pointers.
> 
>> +
>> +        if ( cmdline_size == 0 )
>> +            goto skip_cmdline;
>> +
> 
> Maybe just use:
> 
> cmdline_size = domain_cmdline_size(bi, bd);
> if ( cmdline_size )
> {
> 
> and eliminate the goto?

Sure.

>> +        if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
>> +            panic("Error allocating cmdline buffer for %pd\n", d);
>> +
>>           if ( bd->kernel->cmdline_pa )
>> -            safe_strcpy(cmdline,
>> -                        cmdline_cook(__va(bd->kernel->cmdline_pa), 
>> bi->loader));
>> +            strlcpy(cmdline,
>> +                    cmdline_cook(__va(bd->kernel->cmdline_pa),bi- 
>> >loader),
>> +                    cmdline_size);
>>           if ( bi->kextra )
>>               /* kextra always includes exactly one leading space. */
>> -            safe_strcat(cmdline, bi->kextra);
>> +            strlcat(cmdline, bi->kextra, cmdline_size);
>>           /* Append any extra parameters. */
>>           if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
>> -            safe_strcat(cmdline, " noapic");
>> +            strlcat(cmdline, " noapic", cmdline_size);
>>           if ( (strlen(acpi_param) == 0) && acpi_disabled )
>>           {
>> @@ -1030,17 +1060,21 @@ static struct domain *__init 
>> create_dom0(struct boot_info *bi)
>>           if ( (strlen(acpi_param) != 0) && !strstr(cmdline, "acpi=") )
>>           {
>> -            safe_strcat(cmdline, " acpi=");
>> -            safe_strcat(cmdline, acpi_param);
>> +            strlcat(cmdline, " acpi=", cmdline_size);
>> +            strlcat(cmdline, acpi_param, cmdline_size);
>>           }
>> -        bd->kernel->cmdline_pa = __pa(cmdline);
>> +        bd->cmdline = cmdline;
> 
> As mentioned above, it looks like you still inadvertently use bd- 
>  >kernel->cmdline_pa and not the new bd->cmdline.  I think clearing bd- 
>  >kernel->cmdline_pa would have helped identify that.  Or do you want to 
> retain cmdline_pa for some reason?  It's less error prone if only one is 
> usable at a time.

When it was just the boot module, it was requested that the pa be 
updated to be the cooked command line. I dropped it here, as we begin to 
transition to multi-domain construction. It is a good point that 
zero-ing will stop inadvertent use of the old/original buffer.

>>       }
>> + skip_cmdline:
>>       bd->d = d;
>>       if ( construct_dom0(bd) != 0 )
>>           panic("Could not construct domain 0\n");
>> +    if ( cmdline )
>> +        xfree(cmdline);
> 
> You can drop the if - xfree() handles NULL.

ack.

v/r,
dps


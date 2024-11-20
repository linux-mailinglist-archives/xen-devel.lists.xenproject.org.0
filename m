Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2CA9D41BB
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 18:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841171.1256681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDox4-0001jz-AI; Wed, 20 Nov 2024 17:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841171.1256681; Wed, 20 Nov 2024 17:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDox4-0001ho-6t; Wed, 20 Nov 2024 17:57:18 +0000
Received: by outflank-mailman (input) for mailman id 841171;
 Wed, 20 Nov 2024 17:57:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2WWF=SP=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tDox2-0001hi-PQ
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 17:57:17 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd1a9ee0-a768-11ef-a0cb-8be0dac302b0;
 Wed, 20 Nov 2024 18:57:11 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1732125422196538.9325786026111;
 Wed, 20 Nov 2024 09:57:02 -0800 (PST)
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
X-Inumbo-ID: dd1a9ee0-a768-11ef-a0cb-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImRkMWE5ZWUwLWE3NjgtMTFlZi1hMGNiLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMTI1NDMxLjcyNTU5NCwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1732125425; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Jj6ciEEQvTe9I2GHJHYET/y3s93c7LOTJw9Fyp3HJK5eDoFIYzMiMMcIMS2HOoJdZZMsEiecNAXiDOfxEAHqFwdTyihxSpNDh06DJM1SUVbzExkse7fcru7+Wgt1TOjZ9MSdxTiFT/1cNwEEMP7hQh6CgP5JUYmG4aEf4xiY424=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732125425; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kQ6olA6ycDUzdknzdvQsYS8zfK6eHIl7YvgFnBXveHY=; 
	b=Pp30L4s300zeUewWWxThJ83EduLrvbbPJc3QYe5Hha4q7UR+7ZzJmFttizdQFy+25ftQmBuXsXYxlrsqGtJxnKJPrECbf+pqiSgIiUUhOqSMahhN5p9ENXm9wAz7MZmBP1FE5xdRq8pl+BxuJEwraXI6xu3ITyld5mX9O1eDbhA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732125425;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=kQ6olA6ycDUzdknzdvQsYS8zfK6eHIl7YvgFnBXveHY=;
	b=ewEfCyZewRmQnLR7TZSCdcFLa5wEzVOwKZPt4cOYkO+cY1cbFkhnW4ryVmiz07a0
	VNXCWpjBD7U660VaN0/j7CVVe4mVvK0FoSJPN1ZbR1jUsnRfGZMvForgU3MS3ObXXJt
	hg1mTQ8h9ret3Xvrut9UuMHmPlu9561cr6A/bJDg=
Message-ID: <a7b7ec58-73f6-4463-97c8-f9acdedec7af@apertussolutions.com>
Date: Wed, 20 Nov 2024 12:57:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] x86/boot: add cmdline to struct boot_domain
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
 <20241115131204.32135-7-dpsmith@apertussolutions.com>
 <c4b37832-efaa-4a26-8bbf-a3cf7caa3468@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <c4b37832-efaa-4a26-8bbf-a3cf7caa3468@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/15/24 13:20, Jason Andryuk wrote:
> On 2024-11-15 08:12, Daniel P. Smith wrote:
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
> 
> 
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 533a1e2bbe05..b9ca9c486fe5 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -963,10 +963,31 @@ static unsigned int __init copy_bios_e820(struct 
>> e820entry *map, unsigned int li
>>       return n;
>>   }
>> -static struct domain *__init create_dom0(struct boot_info *bi)
>> +static size_t __init domain_cmdline_size(
>> +    struct boot_info *bi, struct boot_domain *bd)
>>   {
>> -    static char __initdata cmdline[MAX_GUEST_CMDLINE];
>> +    size_t s = 0;
>> +
>> +    s += bi->kextra ? strlen(bi->kextra) : 0;
>> +    s += bd->kernel->cmdline_pa ? strlen(__va(bd->kernel- 
>> >cmdline_pa)) : 0;
>> +    /* Should only be called if one of extra or cmdline_pa are valid */
>> +    ASSERT(s > 0);
>> +
>> +    /*
>> +     * Add additional space for the following cases:
>> +     *  - 7 chars for " noapic"
>> +     *  - 13 chars for longest acpi opiton, " acpi=verbose"
> 
> option
> 
>> +     *  - 1 char to hold \0
>> +     */
>> +    s += 7 + 13 + 1;
> 
> Seems a little fragile.  Sizing but also depending on code elsewhere. 
> Interesting - "verbose" wouldn't actually get updated into acpi_param. 
> Anyway, using sizeof(acpi_param) seems better.  Maybe:
> 
>          s += strlen(" noapic") + strlen(" acpi=") + sizeof(acpi_param) 
> + 1;

True, the strlen() is more reasonable and self documenting. Yes, I 
overlooked the return in the option parser that would not copy verbose, 
plus sizeof(acpi_param) will ensure adequate spacing.

>> +
>> +    return s;
>> +}
>> +
>> +static struct domain *__init create_dom0(struct boot_info *bi)
>> +{
>> +    char *cmdline = NULL;
>>       struct xen_domctl_createdomain dom0_cfg = {
>>           .flags = IS_ENABLED(CONFIG_TBOOT) ? 
>> XEN_DOMCTL_CDF_s3_integrity : 0,
>>           .max_evtchn_port = -1,
>> @@ -1008,17 +1029,23 @@ static struct domain *__init 
>> create_dom0(struct boot_info *bi)
>>       /* Grab the DOM0 command line. */
>>       if ( bd->kernel->cmdline_pa || bi->kextra )
> 
>  From your other email, since you don't need the length, just non-zero:
> 
>      if ( (bd->kernel->cmdline_pa && __va(bd->kernel->cmdline_pa)[0]) ||
>            bi->kextra )

Ack.

>>       {
>> +        size_t cmdline_size = domain_cmdline_size(bi, bd);
>> +
>> +        if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
> 
> Just xmalloc_array since it'll be overwritten immediately?

Yes and no, the concern I was worried about is that the allocation may 
end up being slight bigger than what is copied in to the buffer. If we 
do not zero the buffer, then those trailing bytes will have random data 
in them. In a perfect world, nothing should ever reach those bytes based 
on the current usage of the buffer. But from my perspective, it would be 
safer to zero the buffer than rely on the world being perfect. I am not 
fixed on not switching, just providing my 2 cents,

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
>> @@ -1028,17 +1055,21 @@ static struct domain *__init 
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
>> +        bd->kernel->cmdline_pa = __pa(bd->cmdline);
> 
> Should cmdline_pa go away if we now have a valid cmdline variable?

In the PVH dom0 case, we are still relying on cmdline_pa as the 
reference to get at the command line in the function pvh_load_kernel(). 
With the introduction of cmdline to boot_domain, I could convert the 
interface of pvh_load_kernel() to take the boot_domain instance, 
removing the need to update cmdline_pa. Not sure if you were asking 
this, but as for cmdline_pa going completely away, that is not possible. 
First the sequence of events do not allow it, and there is an one-off 
case for PVH dom0 where the cmdline_pa of the initrd module is copied 
into the domain.

v/r,
dps


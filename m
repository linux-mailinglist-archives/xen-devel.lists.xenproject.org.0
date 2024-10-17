Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C58D9A30CD
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 00:33:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821370.1235140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Z30-0002t2-1i; Thu, 17 Oct 2024 22:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821370.1235140; Thu, 17 Oct 2024 22:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Z2z-0002rE-VQ; Thu, 17 Oct 2024 22:32:45 +0000
Received: by outflank-mailman (input) for mailman id 821370;
 Thu, 17 Oct 2024 22:32:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1Z2y-0002r8-V2
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 22:32:44 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7c34752-8cd7-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 00:32:41 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729204353976955.4195539362453;
 Thu, 17 Oct 2024 15:32:33 -0700 (PDT)
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
X-Inumbo-ID: b7c34752-8cd7-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729204355; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CXNZwQFLx/20b37IhCKaXn90PGQpxnX28M52L7RNU96Wkf1m3ZzC4OUHSK8MuJoI/GcY9JtitXjIscrXzvBOYiUhrJOGSIh+aj7COeT6hym8lGeBbXCMeuWvXibtSNEGvHwG06CYEJ4wSOcvTsJIaDV4K+Swzno5H0AOX875aq4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729204355; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vGIAkDNB2sXTt3FTeWfWAF+i+JJIF4Hz6HMFD/0qFHQ=; 
	b=BekLHtWQqmafpJ3+OjJxbliQEOPPUOKEQLBZFa/NIg0cixhLP9sJ1W1XB/uAwTbGn6PIU51JC4B+XVH6KBzHSUxMoan1MymM0AvwqX0vi0QT7EqZ5je/lZP/MS0rxHl0XVifa+vy+6cjIByRxLzdGos3qk5LYgF+jrWdsrk9JP4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729204355;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vGIAkDNB2sXTt3FTeWfWAF+i+JJIF4Hz6HMFD/0qFHQ=;
	b=D8vrHjA0aBcgXrlYEn3cq+7ANcAB52jfqWBrIvym0grLA+vrfjAsisNeIdfD4v80
	+KeHTkpJ/Oc6spzntI4yh3xPS37v3PmgKlVE1FESgYQ12w3/Oe9OgV3oG0urex0u31W
	aeNDStZpvhP0bwNQeM5QMYi9hkutXgW8AfqMq07A=
Message-ID: <d4af945d-2ce6-4a2f-8a13-8464cd67994d@apertussolutions.com>
Date: Thu, 17 Oct 2024 18:32:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/44] x86/boot: move x86 boot module counting into a
 new boot_info struct
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Christopher Clark <christopher.w.clark@gmail.com>, jason.andryuk@amd.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-2-dpsmith@apertussolutions.com>
 <66fc898a-e346-4dce-a99a-b8fdf2590511@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <66fc898a-e346-4dce-a99a-b8fdf2590511@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/17/24 15:50, Andrew Cooper wrote:
> On 17/10/2024 6:02 pm, Daniel P. Smith wrote:
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index a6e77c9ed9fc..6201ca0fad19 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -274,16 +275,28 @@ static int __init cf_check parse_acpi_param(const char *s)
>>   custom_param("acpi", parse_acpi_param);
>>   
>>   static const module_t *__initdata initial_images;
>> -static unsigned int __initdata nr_initial_images;
>> +
>> +struct boot_info __initdata xen_boot_info;
>> +
>> +static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
>> +{
>> +    struct boot_info *bi = &xen_boot_info;
>> +    const multiboot_info_t *mbi = __va(mbi_p);
>> +
>> +    bi->nr_modules = (mbi->flags & MBI_MODULES) ? mbi->mods_count : 0;
> 
> Having looked to end of the series, this and a few other expressions are
> still awkward.
> 
> The nicer way looks like:
> 
> struct boot_info __initdata xen_boot_info = {
>      .loader = "unknown",
>      .cmdline = "",
> };
> 
> static struct boot_info *__init multiboot_fill_boot_info(unsigned long
> mbi_p)
> {
>      struct boot_info *bi = &xen_boot_info;
>      const multiboot_info_t *mbi = __va(mbi_p);
>      module_t *mods = __va(mbi->mods_addr);
>      unsigned int i;
> 
>      if ( mbi->flags & MBI_MODULES )
>          bi->nr_modules = mbi->mods_count;
> 
>      if ( mbi->flags & MBI_LOADERNAME )
>          bi->loader = __va(mbi->boot_loader_name);
> 
>      if ( mbi->flags & MBI_CMDLINE )
>          bi->cmdline = cmdline_cook(__va(mbi->cmdline), bi->loader);
> 
>      if ( mbi->flags & MBI_MEMMAP )
>      {
>          bi->memmap_addr = mbi->mmap_addr;
>          bi->memmap_length = mbi->mmap_length;
>      }
> 
> 
> which is easier to read and follow.  Thoughts?

You are right, that is much cleaner. I'm good with it.

v/r,
dps


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 704539979E2
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 02:55:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815337.1229066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syhSs-0007GV-NY; Thu, 10 Oct 2024 00:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815337.1229066; Thu, 10 Oct 2024 00:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syhSs-0007EZ-Kz; Thu, 10 Oct 2024 00:55:38 +0000
Received: by outflank-mailman (input) for mailman id 815337;
 Thu, 10 Oct 2024 00:55:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAAn=RG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syhSr-0007ER-Ce
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 00:55:37 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b298c91-86a2-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 02:55:36 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728521730303868.8311875903787;
 Wed, 9 Oct 2024 17:55:30 -0700 (PDT)
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
X-Inumbo-ID: 5b298c91-86a2-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728521731; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a7eU9MctOI2b/68+pPAg2+JzrAgk/CSyjRGy7Q2fSI7MbzZT2mp4GuXr2Ka8Vhwv+W8hPXqeGBYZ6f7oX8scTg/Ejbvc+jmgcDE1UBdZBdi/IOg3Q7K/y/VAHQCYkBdt+RkuDUki1H7PMFlualiKvuQuSfDQ4tsAsD/4C0yvzRw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728521731; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Cb8CBPgxOHEwT2ogu6FkgCi7AuroFre40ZlnSxb2vT4=; 
	b=CrIbBO64fxXrpIEaQ/A6OD52IbU7STEfhmjCpVqQ02Mmw4eVXMgQ+bajMKCH2NFSOAw9/9ZfO9quww9C9X9RBkpS2QcQ9vPn7ZDEbbDzmfaBap6VmF7rg1cxWDAzyha+XuAgIUYMYs7ZQclXRDhtoukNjSyISpEMRSapFwjzpe8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728521731;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Cb8CBPgxOHEwT2ogu6FkgCi7AuroFre40ZlnSxb2vT4=;
	b=kmRriep8Ci6uywaKyqVMlz+fkEbHmuruNRXms8EYCLMzK40gl7fa+Ac+oUqOOsWN
	Fj308fQaET/U8ML2e4Er2lvSgTWz4uBZJXrCu9e7pz4QOsy9d+YknH/IbJc4NZay05C
	PsjK7/XeJ6ztbRR1az242/Hll84EqOeq8HjfTaR8=
Message-ID: <b2975fd1-543d-444a-ba39-20b36c34b769@apertussolutions.com>
Date: Wed, 9 Oct 2024 20:55:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/44] x86/boot: move boot loader name to boot info
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-3-dpsmith@apertussolutions.com>
 <edaf2302-ae68-4c05-b8cf-1613ae9d4e7b@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <edaf2302-ae68-4c05-b8cf-1613ae9d4e7b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/9/24 11:07, Jan Beulich wrote:
> On 06.10.2024 23:49, Daniel P. Smith wrote:
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -285,6 +285,9 @@ static struct boot_info __init *multiboot_fill_boot_info(unsigned long mbi_p)
>>   
>>       bi->nr_modules = (mbi->flags & MBI_MODULES) ? mbi->mods_count : 0;
>>   
>> +    bi->loader = (mbi->flags & MBI_LOADERNAME) ?
>> +                            __va(mbi->boot_loader_name) : "unknown";
> 
> Either (noting that generally we exempt ?: from the operator-on-earlier-line
> rule)
> 
>      bi->loader = (mbi->flags & MBI_LOADERNAME) ? __va(mbi->boot_loader_name)
>                                                 : "unknown";
> 
> or
> 
>      bi->loader = (mbi->flags & MBI_LOADERNAME)
>                   ? __va(mbi->boot_loader_name) : "unknown";
> 
> or
> 
>      bi->loader = (mbi->flags & MBI_LOADERNAME)
>          ? __va(mbi->boot_loader_name) : "unknown";
> 
> (in the order of my personal preference).

I would prefer the first as well. Will adjust.

v/r,
dps


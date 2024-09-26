Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97177987632
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 17:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805629.1216784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stq0y-0000Kb-4d; Thu, 26 Sep 2024 15:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805629.1216784; Thu, 26 Sep 2024 15:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stq0y-0000Ih-0y; Thu, 26 Sep 2024 15:02:44 +0000
Received: by outflank-mailman (input) for mailman id 805629;
 Thu, 26 Sep 2024 15:02:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SdHj=QY=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1stq0w-0000IX-TE
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 15:02:42 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f18cd3b-7c18-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 17:02:40 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1727362953289482.098918060713;
 Thu, 26 Sep 2024 08:02:33 -0700 (PDT)
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
X-Inumbo-ID: 5f18cd3b-7c18-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1727362954; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hjaqOdzq1WCIx1CoVRRxo5Hy/69uar0XSFmeklg2ZH3MDjQ0nYEH91iOoXUMtDm9GEA+4O0d+6ykSRgRg0li51Sgk9CzmjmpU8P2MOL/cAEAmCP0LOll6h626eFijaPNpM3aTu0k/TsgabjrbOye0CpMgTQ5W9VLZ3Uid5E8CIA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727362954; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dsRcpEs5DG48yA9qYHbaWmxbCbqp23lj/RFZNMYBX5Y=; 
	b=KuatNkA82NaHxJlHe2ANAhbpW5hGFeXLg7Tzs8VMiG+6FNPNhgtfjCyILPqTmbPvf/ExURmeoe9Jd+4dOmsn5BcTgKWCuH1aSKkx+ITo1i720nlH/RXgbvTSzeb1AXZ+U9aRxtOhUCf1IvF18FudsYWw81Tp7az6DEX66uhlheg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727362954;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dsRcpEs5DG48yA9qYHbaWmxbCbqp23lj/RFZNMYBX5Y=;
	b=DkbjWsAmHvl9QltaF+eZVzKTqsHBWEWa0eYtZ85HOjFW0o8Y5xvUutybEBF5/G4C
	0uPMkceeCSPUabUzv4UpAvqzxDgu/dyQdg5o6fIXkwH/sVeuE6dX3HdUD97z69zG1Xx
	pMzTI9vVXwG3ERIAbnQwXsQQ/8R4YNEfZdNjNy1E=
Message-ID: <7c8fc641-0e1b-4cf1-a0d4-4423635527f5@apertussolutions.com>
Date: Thu, 26 Sep 2024 11:02:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/44] x86/boot: move boot loader name to boot info
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
 <20240830214730.1621-3-dpsmith@apertussolutions.com>
 <1b7d6c26-d839-4c44-81db-64b15538a1e2@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <1b7d6c26-d839-4c44-81db-64b15538a1e2@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 9/3/24 18:41, Andrew Cooper wrote:
> On 30/08/2024 10:46 pm, Daniel P. Smith wrote:
>> Transition the incoming boot loader name to be held in struct boot_info.
>>
>> No functional change intended.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/include/asm/bootinfo.h |  2 ++
>>   xen/arch/x86/setup.c                | 15 ++++++++-------
>>   2 files changed, 10 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
>> index e850f80d26a7..e69feb1bb8be 100644
>> --- a/xen/arch/x86/include/asm/bootinfo.h
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -10,6 +10,8 @@
>>   
>>   struct boot_info {
>>       unsigned int nr_mods;
>> +
>> +    const char *boot_loader_name;
> 
> Simply loader, matching the __setup_xen() variable you dropped, will be
> fine.

Yep, can do.

>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index dd94ee2e736b..432b7d1701e4 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -2054,7 +2055,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>        */
>>       dom0 = create_dom0(mod, modules_headroom,
>>                          initrdidx < boot_info->nr_mods ? mod + initrdidx : NULL,
>> -                       kextra, loader);
>> +                       kextra, boot_info->boot_loader_name);
> 
> Do I want to know why create_dom0() cares about our bootloader?  I'm
> sure the answer is no.

Because in cmdline_cook(), you have this:

/*
  * PVH, our EFI loader, and GRUB2 don't include image name as first
  * item on command line.
  */
if ( xen_guest || efi_enabled(EFI_LOADER) || loader_is_grub2(loader_name) )
         return p;

Later in the series, all of this is no longer passed but it is still 
used by accessing the struct boot_info instance.

v/r,
dps


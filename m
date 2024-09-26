Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB67E9876B5
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 17:41:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805655.1216807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stqcL-0007Ib-Hf; Thu, 26 Sep 2024 15:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805655.1216807; Thu, 26 Sep 2024 15:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stqcL-0007Gk-Do; Thu, 26 Sep 2024 15:41:21 +0000
Received: by outflank-mailman (input) for mailman id 805655;
 Thu, 26 Sep 2024 15:41:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SdHj=QY=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1stqcJ-0007Ge-Gk
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 15:41:19 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4ade325-7c1d-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 17:41:18 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1727365271566543.8698239125034;
 Thu, 26 Sep 2024 08:41:11 -0700 (PDT)
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
X-Inumbo-ID: c4ade325-7c1d-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1727365273; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Kl4kBqUXRZjJoWptuTw2g0LncRlvxi1h72HDiCl0Uh/Xu/Z2G//pLGX8zNHJRaT+0DBxv1iw1HQ6Ot/5Kn5GclEpyYybhUAeShRFDkGRKHAk3tBYp/V4tM55VFYz5r8rt28XQn9KIhe8DN3LeMF+ZmlivN3EUElaTzLpSsPj3Uk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727365273; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OgimkvmoZ8xF8OanrFHw1w6qxGqQR/kCFawhSltRIxY=; 
	b=AWCbZgEyLgRv0nUCZHrtlCNNpM33+YO1Sw6SbKKnXLyN90Tbl/NOV/Bxm8Eirk2u21kaIAYPn8gBXgkgR4pgFuFL7IHyUNK9aCcr0s/FwgXgs4QyLev64yzJeFd/1bIWJkLK88ujiDFjg5y1uO/AKhwEo+k4DBT1BFI/8bwDBxE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727365273;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=OgimkvmoZ8xF8OanrFHw1w6qxGqQR/kCFawhSltRIxY=;
	b=apGXWodeLW5f0zx1pQN5Ecy/2FLdwRe3gI4PQPXV+vKetqhEhGqUHj/68Xit1Mv7
	CvwxnlhSnN8/Q1imj2UjrZc+I8pS0Ja1xsDLe03JWEbQz/y/Xbuj4fNiDNXKiSqGsDU
	FlhNkQVmHdjgMuCaOdLKglL06fzH8tCEwV05Z/fk=
Message-ID: <eaa343f1-6e39-4751-9e46-a295c70143ab@apertussolutions.com>
Date: Thu, 26 Sep 2024 11:41:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/44] x86/boot: move cmdline to boot info
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
 <20240830214730.1621-4-dpsmith@apertussolutions.com>
 <287f0214-2278-4032-bcc3-db14936f1985@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <287f0214-2278-4032-bcc3-db14936f1985@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 9/3/24 19:04, Andrew Cooper wrote:
> On 30/08/2024 10:46 pm, Daniel P. Smith wrote:
>> Transition Xen's command line to being held in struct boot_info.
>>
>> No functional change intended.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thank you.

>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 432b7d1701e4..a945fa10555f 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1049,11 +1058,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>   
>>       multiboot_to_bootinfo(mbi);
>>   
>> -    /* Parse the command-line options. */
>> -    if ( mbi->flags & MBI_CMDLINE )
>> -        cmdline = cmdline_cook(__va(mbi->cmdline), boot_info->boot_loader_name);
>> -
>> -    if ( (kextra = strstr(cmdline, " -- ")) != NULL )
>> +    if ( (kextra = strstr(boot_info->cmdline, " -- ")) != NULL )
>>       {
>>           /*
>>            * Options after ' -- ' separator belong to dom0.
>> @@ -1064,7 +1069,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>           kextra += 3;
>>           while ( kextra[1] == ' ' ) kextra++;
>>       }
>> -    cmdline_parse(cmdline);
>> +    cmdline_parse(boot_info->cmdline);
> 
> It would be nice to get this kextra handling out of __start_xen(), but
> I'm not entirely sure how.
> 
> It shouldn't live in multiboot_fill_boot_info() if that's going to be
> split for pvh, yet it really ought to live with the other editing of
> bi->cmdline.
> 
> Something that is very subtle is that the *kextra = '\0' between these
> two hunks ends up truncating bi->cmdline.
> 
> Perhaps best to leave it alone until inspiration strikes.

One thought is to move all the logic into a function and make it the 
responsibility of fill function(s) to call it, since each entry point 
has its own unique way for the xen command line to be passed in.

v/r,
dps


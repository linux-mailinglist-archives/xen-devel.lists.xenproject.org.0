Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E83E996DEA
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 16:32:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814641.1228243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXjQ-0001t0-AL; Wed, 09 Oct 2024 14:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814641.1228243; Wed, 09 Oct 2024 14:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXjQ-0001qZ-7j; Wed, 09 Oct 2024 14:32:04 +0000
Received: by outflank-mailman (input) for mailman id 814641;
 Wed, 09 Oct 2024 14:32:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syXjP-0001pH-4B
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 14:32:03 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ec31e2d-864b-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 16:32:02 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728484315479914.5971400770709;
 Wed, 9 Oct 2024 07:31:55 -0700 (PDT)
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
X-Inumbo-ID: 3ec31e2d-864b-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728484316; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dwVCbYVRiENdwfEuwysfD+//SH243dtlYSrEE/IvZ88oBMH+GHVUF6vOzpT92qlk8eo6+7BkkABAgxVMKTGJ9wBlv7nopm7HgoJ4emi9636YfoJQNdQSEANTM83mDEpvwTl/Ghoei4lx351GzMk5d83+AzCpX/NMOeOiDAx3bHU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728484316; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=awfXqVkJzAmarYBRcC1fQ5JfBpTVEuKpG9SUMjCgYK0=; 
	b=Fc7z+v9/XdL6rAukBJbuo7zS25gLw8rczIfMuRjuYhJOxQRFGKGjymSZoLYyZb85uWhSLYugbgIlTmQ17J6NA6HbzGkxIJ1L30LGZjXyVDqq7rtGmuUQAg9Rx1zK7/u5nbQ+M3YL2j/5vlDFOPLA9mjESZyKK2z5cttX76Ke2Jo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728484316;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=awfXqVkJzAmarYBRcC1fQ5JfBpTVEuKpG9SUMjCgYK0=;
	b=T0poYdR3XTwdoLNzcVXkkX/XLfOoPD4QAM/RfLcJghsSwq1v5xA45q4Z/aE0T0Ei
	dcLLoS07LK886fhoMSAq7zjzc8UE7Nn3QLLCbozVqKRPwgNKlRCA7soYbL2KRfHC3D7
	Jn71NdW0AUCePG/Dc9zBukx+bZ6WitHSLlfi0ULQ=
Message-ID: <8aedeaff-f428-4d50-8841-f2fc29c4e288@apertussolutions.com>
Date: Wed, 9 Oct 2024 10:31:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/44] x86/boot: convert setup.c mod refs to early_mod
To: Jan Beulich <jbeulich@suse.com>
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-9-dpsmith@apertussolutions.com>
 <a2346abb-e332-40a3-88bb-0159f6a359e8@amd.com>
 <f715e69c-928a-49c4-ae72-49c8444b0a9c@apertussolutions.com>
 <783a1354-4b34-4b21-9949-b2dd27c9a86a@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <783a1354-4b34-4b21-9949-b2dd27c9a86a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/9/24 10:29, Jan Beulich wrote:
> On 09.10.2024 16:23, Daniel P. Smith wrote:
>> On 10/7/24 15:34, Jason Andryuk wrote:
>>> On 2024-10-06 17:49, Daniel P. Smith wrote:
>>>> --- a/xen/arch/x86/setup.c
>>>> +++ b/xen/arch/x86/setup.c
>>>> @@ -1341,15 +1341,15 @@ void asmlinkage __init noreturn
>>>> __start_xen(unsigned long mbi_p)
>>>>        set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
>>>>        kexec_reserve_area();
>>>> -    initial_images = mod;
>>>> +    initial_images = bi->mods[0].mod;
>>>
>>> Isn't this wrong?
>>> mod is the array of module_t * of *all* modules, but bi->mods[0].mod is
>>> a single module_t *?
>>
>> No it is not wrong:
>>     bi->mods[0].mod == __va(mbi->mods_addr)[0]
> 
> Yet as it's seemingly wrong, a comment appears to be necessary.

That is fair, will add comment.

v/r,
dps


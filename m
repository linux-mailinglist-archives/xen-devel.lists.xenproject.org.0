Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B999996EEE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 16:58:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814748.1228415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syY98-0008VX-G3; Wed, 09 Oct 2024 14:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814748.1228415; Wed, 09 Oct 2024 14:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syY98-0008Tw-DR; Wed, 09 Oct 2024 14:58:38 +0000
Received: by outflank-mailman (input) for mailman id 814748;
 Wed, 09 Oct 2024 14:58:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syY97-0007K3-1n
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 14:58:37 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f43c9d7f-864e-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 16:58:35 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728485908167145.5415097795318;
 Wed, 9 Oct 2024 07:58:28 -0700 (PDT)
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
X-Inumbo-ID: f43c9d7f-864e-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728485909; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HiF6yrRJJh33CGIKM4KAZwRyNpbwTb7WtsuqsXQ/G7fAshWQlsimHV/c7h6foQxvxikkrmBjxHrQs3qjSGRFLT8Is3DM120LR+xF41lnYNhtNJuUoJ5hcKm3qgfTgJB5bvmRpoGrZsMJdpuuowJWqsZs7gAiCHdPJUaOcX8Zy6w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728485909; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2FCMbJwEqBB7OrCa98yYjw9xQ65QkCdMbgQil75MjuY=; 
	b=gVy1Ol/zinUPaFOZrszXkZi2lIX2BsDtg8m5jFqzndd51avwgF3stbYJdkrRtscxUOZYjr8/a3+VWI3mmFQv5BfQtgOqKbjf9KnGpdDbf26f9qd8uQmJ0TLgZoV2jb4PtpR++eAv1hLl5L1Ovqj/QM2XNNPx6PXvnnna9R13fG8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728485909;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2FCMbJwEqBB7OrCa98yYjw9xQ65QkCdMbgQil75MjuY=;
	b=vGuOJLeXaQTYh4Su5cIqoYh7zykuOyHN232osecjNQFA/XuH56vRZ5+QyF4966hw
	Tz8psRw0D6OQg0tdu+dwDHsBbf3nIDK2X1mTzSs79XVgT0kURJo/Z4jecYy9QEoboSb
	+S0PrlNvUn90sS2Fz48TmwhBRptNxIzIYWnPDwxg=
Message-ID: <5b5d8d50-ff41-44a3-8772-fe48cd7e5c80@apertussolutions.com>
Date: Wed, 9 Oct 2024 10:58:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/44] x86/boot: convert microcode loading to consume
 struct boot_info
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-18-dpsmith@apertussolutions.com>
 <d0d8e53d-d2a2-4441-86cd-6f50aaa36075@amd.com>
 <62d1b295-6c79-48d3-a340-1544ca8ed534@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <62d1b295-6c79-48d3-a340-1544ca8ed534@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/8/24 08:50, Jason Andryuk wrote:
> On 2024-10-07 17:22, Jason Andryuk wrote:
>> On 2024-10-06 17:49, Daniel P. Smith wrote:
>>> @@ -205,20 +204,18 @@ static void __init microcode_scan_module(
>>>   }
>>>   static void __init microcode_grab_module(
>>> -    unsigned long *module_map,
>>> -    const multiboot_info_t *mbi)
>>> +    unsigned long *module_map, struct boot_info *bi)
>>>   {
>>> -    module_t *mod = (module_t *)__va(mbi->mods_addr);
>>> -
>>>       if ( ucode_mod_idx < 0 )
>>> -        ucode_mod_idx += mbi->mods_count;
>>> -    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= mbi->mods_count ||
>>> +        ucode_mod_idx += bi->nr_modules;
>>> +    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= bi->nr_modules ||
>>>            !__test_and_clear_bit(ucode_mod_idx, module_map) )
>>>           goto scan;
>>> -    ucode_mod = mod[ucode_mod_idx];
>>> +    bi->mods[ucode_mod_idx].type = BOOTMOD_MICROCODE;
>>> +    ucode_mod = *bi->mods[ucode_mod_idx].mod;
>>
>> Why the dereference: *bi->mods[ucode_mod_idx].mod; ?  I don't think it 
>> should be there.
> 
> Oh, the next patch shows ucode_mod is not a pointer, so dereferencing is 
> correct.   Sorry for the noise.

No worries.

v/r,
dps


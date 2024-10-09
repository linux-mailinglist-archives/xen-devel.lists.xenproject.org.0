Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E09F29972F9
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 19:24:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815038.1228768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syaQV-0004xB-2k; Wed, 09 Oct 2024 17:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815038.1228768; Wed, 09 Oct 2024 17:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syaQV-0004uQ-0C; Wed, 09 Oct 2024 17:24:43 +0000
Received: by outflank-mailman (input) for mailman id 815038;
 Wed, 09 Oct 2024 17:24:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syaQU-0004uK-Ho
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 17:24:42 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cbda222-8663-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 19:24:40 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 172849467331584.52362207549527;
 Wed, 9 Oct 2024 10:24:33 -0700 (PDT)
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
X-Inumbo-ID: 5cbda222-8663-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728494675; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZGibqZ+b4NZeBcHCflhVaDA4A50lPBEo8WqTLaoAKc6fpN3K/kgui2OVfnVSS6ZXdNA11adsNQ/p8YOFcCi2yrpjScxhgQEKfHDeDaqnAxm77vY/7QD30N3dneI2tvLlLnXZitKdC60+RbG21MoauoajS3S2rQHez4vjEFMjrig=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728494675; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NdsXFaL6OcWkddMVHpSZdgPigR1Y/THPyD/dSBYlqUc=; 
	b=eV24x/1cffdolGbasniSq40+NwD/E308q7XsniCwMeqa0o+WoEzg9dW5fWrQwuf59yjpKpItdFKclHRoKfAIKNUd6cEKkvh57jT3O1AsIp6L6LyXHzQgg5O7G3k+0yj851aSMZuUR+lKqIjqHxs/FSZdCCYFZ85/3Z5ZcJECi20=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728494675;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=NdsXFaL6OcWkddMVHpSZdgPigR1Y/THPyD/dSBYlqUc=;
	b=W19hRGClu7BiJC8g2qtWGfe6G0T0Ye71Y/bBJpbbtZ7mkf/ooC7JEkJD933ecw6O
	Mk14vIK/DRS4kjF7V+ohE67ktJIKuCuFJfLLG/z6bJcSHgfhEjQFPDGfxhI4txt6skt
	HxOBD0K7lCO6/BHQRzDaNZJpkWkDiGCJ32O3N0b4=
Message-ID: <9fd59275-9622-4d4e-b4ac-e82237c38f4f@apertussolutions.com>
Date: Wed, 9 Oct 2024 13:24:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 22/44] x86/boot: remove module_map usage from microcode
 loading
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-23-dpsmith@apertussolutions.com>
 <66738e0d-2a66-4547-8674-043b54b50ae6@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <66738e0d-2a66-4547-8674-043b54b50ae6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/8/24 12:30, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> With all consumers of module_map converted, remove usage of it
>> by the microcode loading logic.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
>> @@ -202,19 +201,18 @@ static void __init microcode_scan_module(
>>       }
>>   }
>> -static void __init microcode_grab_module(
>> -    unsigned long *module_map, struct boot_info *bi)
>> +static void __init microcode_grab_module(struct boot_info *bi)
>>   {
>>       if ( ucode_mod_idx < 0 )
>>           ucode_mod_idx += bi->nr_modules;
>>       if ( ucode_mod_idx <= 0 || ucode_mod_idx >= bi->nr_modules ||
>> -         !__test_and_clear_bit(ucode_mod_idx, module_map) )
>> +         (bi->mods[ucode_mod_idx].type != BOOTMOD_UNKNOWN) )
> 
> Just
>           bi->mods[ucode_mod_idx].type != BOOTMOD_UNKNOWN )

Ack

> With that:
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thank you.

v/r,
dps


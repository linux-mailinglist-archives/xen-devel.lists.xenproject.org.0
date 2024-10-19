Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EB99A4F88
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2024 17:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822575.1236534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2BiD-0008OE-5r; Sat, 19 Oct 2024 15:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822575.1236534; Sat, 19 Oct 2024 15:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2BiD-0008MG-31; Sat, 19 Oct 2024 15:49:53 +0000
Received: by outflank-mailman (input) for mailman id 822575;
 Sat, 19 Oct 2024 15:49:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdF/=RP=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2BiB-0008MA-Bh
 for xen-devel@lists.xenproject.org; Sat, 19 Oct 2024 15:49:51 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c43a9369-8e31-11ef-99a3-01e77a169b0f;
 Sat, 19 Oct 2024 17:49:48 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729352978547718.265852665283;
 Sat, 19 Oct 2024 08:49:38 -0700 (PDT)
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
X-Inumbo-ID: c43a9369-8e31-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729352980; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EGW+NUfNhnrXYGATiZzOVacHAQ+w/+hYQz3c6EiY4SUDmS46sEysjEt8kSgKeVm10G0UNYPQBDXuumcwGSF0dWg/AstfzonYMxahOhG6jV/JzSdHCoEIzk29QfAK57BOt/M+cZ56JCJ/fMyJcsYPgOGgBeUVr2bxYEQSCRjZQsQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729352980; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=G7BBTQCFyf31hu8f1N++zMSNLcexIXcZNf4Ecwut6ls=; 
	b=G+ewrBlvjtEKyQ4FzFKmxOiyYrvOFeKV2BX0KX6Z43+y9VWDiAN9Js86QTxzBepLvZejVwEkSCSpT6tSVRAEoeD4ldNg/8b0WrN8fhBeTymQB/o/FIl1hNCnYkkhVBcvqySS1ONiFAT24b6gVQnKjtcAmfXnIoTigFJeZ7MOU5U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729352980;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=G7BBTQCFyf31hu8f1N++zMSNLcexIXcZNf4Ecwut6ls=;
	b=AQgWMocEwHmTG+yGx7+19AQhG7C1F94Q3dyNDo6k0bw3ZHCoPXEJrcD0wzVa82bX
	TWv9p2ToKUN7uxS4MMYFUSkYSojNl1oM7FnWcl6xDI1ATeBUwiNf8/qhHXi7om88wVW
	vh4LWjP+/F/qq//zq6ec3vJ13nPzSVFUviYmsG+s=
Message-ID: <f83bd185-e5cf-4824-b2f0-c5300c06d998@apertussolutions.com>
Date: Sat, 19 Oct 2024 11:49:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 17/44] x86/boot: convert microcode loading to consume
 struct boot_info
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-18-dpsmith@apertussolutions.com>
 <c9cc4162-2ddb-4085-be39-a4e477f417c5@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <c9cc4162-2ddb-4085-be39-a4e477f417c5@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/17/24 21:14, Andrew Cooper wrote:
> On 17/10/2024 6:02 pm, Daniel P. Smith wrote:
>> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
>> index 8564e4d2c94c..22fea80bc97e 100644
>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
>> @@ -178,16 +177,16 @@ static void __init microcode_scan_module(
>>       /*
>>        * Try all modules and see whichever could be the microcode blob.
>>        */
>> -    for ( i = 1 /* Ignore dom0 kernel */; i < mbi->mods_count; i++ )
>> +    for ( i = 1 /* Ignore dom0 kernel */; i < bi->nr_modules; i++ )
>>       {
>>           if ( !test_bit(i, module_map) )
>>               continue;
>>   
> 
> Somewhere in this series, it would be nice to purge the these "module 0
> is dom0" special cases.  I'm not sure where best in the series to do it,
> and it may not be here.
> 
> Later, in "x86/boot: remove module_map usage from microcode loading" you
> convert this test_bit() into a type != UNKNOWN check, but the pattern is
> used elsewhere too.
> 
> How about a for_each_unknown_module(bi, bm) helper?  (which at this
> point can even use module_map in scope).

So I do have the first_boot_module_index() iterator which I am using to 
effectively open-code your suggested for_each_unknown_module() in one or 
two places. I can introduce that helper when I first do the open coding,
though I would like to make it a little more generic. I would prefer to 
do it as for_each_bootmodule(bi, bm, type). There is a 
scenario/enhancement that I would like to get to that may require doing 
an iteration on a type other than BOOTMOD_UNKNOWN.

Would you be okay with leaving the module_map usage at this point and 
changing over to the for_each_bootmodule() when it is dropped? As I see 
it, otherwise I would have to make the helper initially work with 
module_map only to turn around and drop it when module_map goes away. At 
least to me, seems like unnecessary churn unless you see a way without 
causing the churn in the helper.

> If you introduce it at this point, then I think the churn later in the
> series reduces marginally, and I think it removes all the "careful not
> to look at dom0" special cases.

In the end, yes I want to get a way from that, once domain builder is 
introduced, it will be possible to provide the boot modules in any order.

v/r,
dps


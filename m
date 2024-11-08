Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 110539C2576
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 20:20:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832761.1248049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9UX5-0004E8-Ir; Fri, 08 Nov 2024 19:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832761.1248049; Fri, 08 Nov 2024 19:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9UX5-0004Bt-Fa; Fri, 08 Nov 2024 19:20:35 +0000
Received: by outflank-mailman (input) for mailman id 832761;
 Fri, 08 Nov 2024 19:20:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHpy=SD=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t9UX3-0004Bn-Vd
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 19:20:33 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82dd2cb1-9e06-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 20:20:28 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1731093620805707.5870524094822;
 Fri, 8 Nov 2024 11:20:20 -0800 (PST)
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
X-Inumbo-ID: 82dd2cb1-9e06-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjgyZGQyY2IxLTllMDYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDkzNjI5LjI4NTYyNiwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1731093624; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MzslziarQb9QrX6gxokLde2b+vAS4Lv0YD7IIxg5VER9iCYBV1nZQZXpS4Lqyb3p/UKt8X0ojI3Lwpyv+LS2PLMw8y2IjmFIpr8FvfoyzrmtuJdd50vDz9Hszm0zuFs4iL6t34Myq25+6rVH8wG1qnXfGLUGlJMM7rWhrH89gbg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731093624; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3SwoarSDdh+gZemX9amQd8J1gBrNVFneYdXOGW7iHo0=; 
	b=h7cpdBGb2jIfYo2BOheRKmfO6Cl/UCCxazSRoIZT1k7G1JzWI3c8J7ZWn/siQa9unk/wUGCQhXECTzdkmhhYYFv1tFMqjEOgf8CG4+tHg/bt9+kY5B/CJdIXMYvxBC6VqZzqamZj2NW27uwF5J4Ko72sJrjvcDvnQqa+cU0aDEs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731093624;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3SwoarSDdh+gZemX9amQd8J1gBrNVFneYdXOGW7iHo0=;
	b=a1BDn47l7aertUJBg2asfCLMlVKPTKa6NiYzUGilgcN6eO5WEvivI/+QJthHFzPK
	yrRjNl683UfGlcXfbJN8eikjGp2otwOQSLOpO6yXnWkxHpt6KeB/EjmujExDQVxOysH
	92pmbc2u4j6lbKAFpcA2jl0aRx8xTbAJ39VKESiI=
Message-ID: <0768fe0b-7e17-47ef-aa3e-8c8468792bef@apertussolutions.com>
Date: Fri, 8 Nov 2024 14:20:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] x86/boot: introduce boot domain
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-11-dpsmith@apertussolutions.com>
 <eb450574-071e-48f5-aab2-0af469b909e1@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <eb450574-071e-48f5-aab2-0af469b909e1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/7/24 15:58, Jason Andryuk wrote:
> On 2024-11-02 13:25, Daniel P. Smith wrote:
>> To begin moving toward allowing the hypervisor to construct more than one
>> domain at boot, a container is needed for a domain's build information.
>> Introduce a new header, <xen/asm/bootdomain.h>, that contains the initial
>> struct boot_domain that encapsulate the build information for a domain.
>>
>> Add a kernel and ramdisk boot module reference along with a struct domain
>> reference to the new struct boot_domain. This allows a struct boot_domain
>> reference to be the only parameter necessary to pass down through the 
>> domain
>> construction call chain.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>> Changes since v7
>> - collapsed the incremental changes to the call chain into this commit
>> ---
> 
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 18b93d6a272a..6e25a9f726c7 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
> 
>> @@ -1026,11 +1019,11 @@ static struct domain *__init 
>> create_dom0(struct boot_info *bi)
>>           panic("Error creating d%uv0\n", domid);
>>       /* Grab the DOM0 command line. */
>> -    if ( image->cmdline_pa || bi->kextra )
>> +    if ( bd->kernel->cmdline_pa || bi->kextra )
>>       {
>> -        if ( image->cmdline_pa )
>> -            safe_strcpy(
>> -                cmdline, cmdline_cook(__va(image->cmdline_pa), bi- 
>> >loader));
>> +        if ( bd->kernel->cmdline_pa )
>> +            safe_strcpy(cmdline, cmdline_cook(__va(bd->kernel- 
>> >cmdline_pa),
>> +                        bi->loader));
> 
> I'd indent bi->loader so it lines up with __va, since bi->loader is the 
> second argument to cmdline_cook().

Ack.

> With that:
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,

v/r,
dps


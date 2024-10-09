Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 698539972F7
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 19:22:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815031.1228758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syaNz-0004N8-Mn; Wed, 09 Oct 2024 17:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815031.1228758; Wed, 09 Oct 2024 17:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syaNz-0004La-Jr; Wed, 09 Oct 2024 17:22:07 +0000
Received: by outflank-mailman (input) for mailman id 815031;
 Wed, 09 Oct 2024 17:22:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syaNx-0003I3-N5
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 17:22:05 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffbd9387-8662-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 19:22:04 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728494516625393.7082872028792;
 Wed, 9 Oct 2024 10:21:56 -0700 (PDT)
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
X-Inumbo-ID: ffbd9387-8662-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728494518; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O97JbJ5UTgsyOIh8rN5JRHwRmRxJu97OAKict95HKnirmL9gwojhfOL33M6WxaKKlDamjylwRVmlk2CFyCXGTrHPZ+hJSVUqnA7QM+jXvseUgRSw6oKOnH5hxe2LK+X2mbUmYKyrtzmJUg/iQdiodIliknFHPBTYG9/1cJH9frA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728494518; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6fJttl4TSb5yyrc0zoAyEdtAOjb4Zz96lIEuIWf8X6c=; 
	b=ZdZKD6cWsbW6yxIRHEUvbaiYYdvTbCoNejxz40tQKOGi+lXL3+zZGBC8BF1Cm08abi/mR3ph84DuMjU9zuf1JjUOBRK6GKwpptSE7LgmE/PD8T6SDXiclFEPNAQELGg+AJRiCHmqLcWOvJbaqOQbpbAh/EkYg7gxSJ42K5qHbM8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728494518;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=6fJttl4TSb5yyrc0zoAyEdtAOjb4Zz96lIEuIWf8X6c=;
	b=aKvATyc9nYJJ+y/9tlTBa1UfKHDFdVddhUbytXUJ2D7y4aXEa4M0SoYPTzOXeBeW
	lELoV7ZQWeANyBsrQX7wumaIQpd8zQHnMWDw3D115qa2n+9DlWeU5koMyANRQ2vtIrw
	nz5f+2yj9Dg+H9OSbcaKtTaoKCjIttM8o28sc2ok=
Message-ID: <fa2789d7-d9d6-49e5-8108-cf26ecfca618@apertussolutions.com>
Date: Wed, 9 Oct 2024 13:21:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 20/44] x86/boot: convert xsm policy loading to struct
 boot_module
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-21-dpsmith@apertussolutions.com>
 <eaa648a6-c34a-47c5-a4fb-a3e56982abba@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <eaa648a6-c34a-47c5-a4fb-a3e56982abba@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/8/24 12:13, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> Iterate through the unclaimed struct boot_module to see if any are an 
>> XSM FLASK
>> policy. If one is located, mark it as an xsm policy.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
>> @@ -161,6 +162,14 @@ int __init xsm_multiboot_init(
>>       }
>>       ret = xsm_core_init(policy_buffer, policy_size);
>> +    if ( ret == 0 )
>> +    {
>> +        int idx = first_boot_module_index(bi, BOOTMOD_XSM_POLICY);
>> +
>> +        /* If the policy was loaded from a boot module, mark it 
>> consumed */
>> +        if ( idx >= 0 )
>> +            bi->mods[idx].flags |= BOOTMOD_FLAG_X86_CONSUMED;
> 
> Maybe xsm_multiboot_policy_init() should return the idx used instead of 
> having a second search?  (Also, xsm_multiboot_policy_init() can't fail?)

I was debating on whether to make similar changes because the existing 
logic just seems sub-optimal. Currently I am looking to just write an 
independent XSM patch that looks at both this function and the device 
tree version of the function. Specifically, looking to use the 
IS_ENABLED() macro instead of #ifdef to reduce code, provide better code 
coverage, and to refine the logic.

>> +    }
>>       bootstrap_map(NULL);
>>       return 0;
> 
> The other changes look okay.

R-b then?

v/r,
dps


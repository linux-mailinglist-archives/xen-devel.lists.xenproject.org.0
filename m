Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5927B997A0A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 03:17:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815382.1229127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syhnP-0001bA-Eo; Thu, 10 Oct 2024 01:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815382.1229127; Thu, 10 Oct 2024 01:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syhnP-0001YJ-BN; Thu, 10 Oct 2024 01:16:51 +0000
Received: by outflank-mailman (input) for mailman id 815382;
 Thu, 10 Oct 2024 01:16:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAAn=RG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syhnN-0001VM-TV
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 01:16:49 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 517c7211-86a5-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 03:16:48 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728523002434758.5908032837583;
 Wed, 9 Oct 2024 18:16:42 -0700 (PDT)
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
X-Inumbo-ID: 517c7211-86a5-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728523004; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GY84kFPTDga4aBd693P4926mZdf6FpPUxEW+mjYbyCGrttxskc/mM4b35huVhkLYwcFalDzpuyz5HLO/DyRwrZSR+w71mVyq8oOaox9knzHNM7kbm4PuB9Ig40rUxoyL9GaRwROQ8ztuad6arqmXEcTJJ1PrbvmTgmHrUjF3Hgc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728523004; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ju0UhVNKZoMwSk5KZ/O1SjYW87TL5jGlRXVopgZClyI=; 
	b=CFlHzFhyBZhvKeMQ/hwJpcyKu5OEqiu4J0NXS6Ady0RmaFgBcFvoTjhUqKZGVs+ItGq7Nws6WfBg2mWnvQ5HgPQWiI17gcRTh/uExnsTl4qWpukGei4EDddK2BKAs0xvgkOYBktQap+Rg8Y7g0rpxHvOX9AclX+AVuuB6g1WB/w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728523004;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Ju0UhVNKZoMwSk5KZ/O1SjYW87TL5jGlRXVopgZClyI=;
	b=u5AU8j81mUN7/y7KSDs/T3maszvtFVcFF/Qzf+6VM9Jq8H6XnLDYNugkIXXp/PV8
	LT8c2jMoI1BvM9s5kplzB9lkHyl6gDDdSgLrpQXakFy/0DgWSHfiqwrIlq6famUdNgi
	Ycit+fb5nhrYONLAdoVnDXGvNy8jeFXlOdeWHcig=
Message-ID: <ad30f610-c22e-4529-aee3-a7fc1b4a082f@apertussolutions.com>
Date: Wed, 9 Oct 2024 21:16:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/44] x86/boot: split bootstrap_map_addr() out of
 bootstrap_map()
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-12-dpsmith@apertussolutions.com>
 <dbd4898a-38da-47d5-8655-32f96c33575d@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <dbd4898a-38da-47d5-8655-32f96c33575d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/9/24 11:38, Jan Beulich wrote:
> On 06.10.2024 23:49, Daniel P. Smith wrote:
>> From: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> Using an interface based on addresses directly, not modules.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/include/asm/setup.h |  1 +
>>   xen/arch/x86/setup.c             | 19 +++++++++++++------
>>   2 files changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
>> index 3d189521189d..213584b05fb2 100644
>> --- a/xen/arch/x86/include/asm/setup.h
>> +++ b/xen/arch/x86/include/asm/setup.h
>> @@ -36,6 +36,7 @@ extern struct boot_info xen_boot_info;
>>   
>>   unsigned long initial_images_nrpages(nodeid_t node);
>>   void discard_initial_images(void);
>> +void *bootstrap_map_addr(paddr_t start, paddr_t end);
> 
> Nothing is being said about why this function needs a declaration here
> and ...

You are correct, as far as this series is concerned, nothing external 
uses this. Will drop this declaration....

>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -437,24 +437,22 @@ static void __init normalise_cpu_order(void)
>>    * Ensure a given physical memory range is present in the bootstrap mappings.
>>    * Use superpage mappings to ensure that pagetable memory needn't be allocated.
>>    */
>> -void *__init bootstrap_map(const module_t *mod)
>> +void *__init bootstrap_map_addr(paddr_t start, paddr_t end)
> 
> ... isn't instead static here. Bugseng folks have put in quite a bit of
> effort to remove such anomalies (which Misra doesn't like) from the code
> base; I don't think we should introduce new ones. I didn't peek ahead
> further than just the next patch, where the function gains a new use,
> but could still be static, so it's possible I'm simply missing a
> subsequent use from another CU. Yet then the function ought to become
> non-static only there.

...and will make this static.

v/r,
dps


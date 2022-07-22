Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EE457E1CF
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 15:00:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373202.605276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEsG1-0000i3-JI; Fri, 22 Jul 2022 12:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373202.605276; Fri, 22 Jul 2022 12:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEsG1-0000eZ-G6; Fri, 22 Jul 2022 12:59:53 +0000
Received: by outflank-mailman (input) for mailman id 373202;
 Fri, 22 Jul 2022 12:59:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVTW=X3=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oEsG0-0000eT-ED
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 12:59:52 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b210c28-09be-11ed-bd2d-47488cf2e6aa;
 Fri, 22 Jul 2022 14:59:50 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1658494785143133.8843124497207;
 Fri, 22 Jul 2022 05:59:45 -0700 (PDT)
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
X-Inumbo-ID: 2b210c28-09be-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1658494787; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dITkspF3ZmMHulPYGfluW5josaMC3Q64nNHlGJhyDNoJe8ZNDaSOlDYvH9sMDRy+eDddODd4UNSYlUpx1IE8Q0FSWdUxRhTVkNQgsGTtutxQeDEJCNKL3EdqPnMgzVhyDYiBl+LcnzI/tAIBsEvD/e/3e/BWOK3klu/FGWuB/MM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1658494787; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=1YdYhWeWfG2WYOsNNcuaoMlXqJKYGHTjMVoDhHw9IdA=; 
	b=hJTJZl8d8uU22PDEJcp7ey6d/tb2c4Kmv/0fih8qtiGlTR8ER/UtRB6nrTi1azzrCFSTcuLbDfSjnLw6xXZqFBrInfQgFPXnklOyrcfweXSQupK9FuyG7WeE/78u0A9s+AIDV+rLBHiKCzRJ2a+YLyMvTZS1Lk8C++ZzUvTnjtM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658494787;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=1YdYhWeWfG2WYOsNNcuaoMlXqJKYGHTjMVoDhHw9IdA=;
	b=BfyhetGADspSD1tdZyLKV8UMBK3bBNul46NHvSpoXyU00bRhUJxDFG5k0XYGKRqF
	Z2TdEwvNpiYH1R54FoUb1L9NWbSb2CMSWaJT19Azm2hjA6clK47eqSC/L4H8MQMC6GA
	IUXFjq/ZIhWZVG6jXUjjVb1swYNHCTLyvCNsJ4C0=
Message-ID: <3fc13a16-1af3-05f0-98dd-38ec0faf111d@apertussolutions.com>
Date: Fri, 22 Jul 2022 08:59:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "Smith, Jackson" <rsmith@RiversideResearch.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "scott.davis@starlab.io" <scott.davis@starlab.io>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-5-dpsmith@apertussolutions.com>
 <BN0P110MB16429A1A79CCA746EEE720F1CF8C9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 04/18] x86: refactor entrypoints to new boot info
In-Reply-To: <BN0P110MB16429A1A79CCA746EEE720F1CF8C9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


On 7/18/22 09:58, Smith, Jackson wrote:
> Hi Daniel,
> 
> I hope outlook gets this reply right.

Looks good to me, thank you for taking the time to review.

>> -----Original Message-----
>> Subject: [PATCH v1 04/18] x86: refactor entrypoints to new boot info
> 
>> diff --git a/xen/arch/x86/guest/xen/pvh-boot.c
>> b/xen/arch/x86/guest/xen/pvh-boot.c
>> index 834b1ad16b..28cf5df0a3 100644
>> --- a/xen/arch/x86/guest/xen/pvh-boot.c
>> +++ b/xen/arch/x86/guest/xen/pvh-boot.c
> 
>> @@ -99,13 +118,16 @@ static void __init get_memory_map(void)
>>      sanitize_e820_map(e820_raw.map, &e820_raw.nr_map);
>>  }
>>
>> -void __init pvh_init(multiboot_info_t **mbi, module_t **mod)
>> +void __init pvh_init(struct boot_info **bi)
>>  {
>> -    convert_pvh_info(mbi, mod);
>> +    *bi = init_pvh_info();
>> +    convert_pvh_info(*bi);
>>
>>      hypervisor_probe();
>>      ASSERT(xen_guest);
>>
>> +    (*bi)->arch->xen_guest = xen_guest;
> 
> I think you may have a typo/missed refactoring here?
> I changed this line to "(*bi)->arch->xenguest = xen_guest;" to get the 
> patchset to build.

Hmm, I guess I missed one. I originally was going to mimic the name
xen_guest in the structure definition but when xen guest support is
disable the xen_guest global turns into a #define which replaces the
reference resulting in a compilation error.

> The arch_boot_info struct in boot_info32.h has a field 'xen_guest' but the 
> same field in asm/bootinfo.h was re-named from 'xen_guest' to 'xenguest' in 
> the 'x86: adopt new boot info structures' commit.
> 
> What was your intent?

As I mentioned above, the renaming was intentional, and it looks like I
do a poor job catching everywhere where the renaming need to be done.

>> +
>>      get_memory_map();
>>  }
>>
> 
> Thanks,
> Jackson Smith

v/r,
dps


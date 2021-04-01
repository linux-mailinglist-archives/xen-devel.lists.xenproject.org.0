Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C1535159B
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 16:21:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104542.200068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRyBl-00046n-6k; Thu, 01 Apr 2021 14:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104542.200068; Thu, 01 Apr 2021 14:20:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRyBl-00046O-3a; Thu, 01 Apr 2021 14:20:49 +0000
Received: by outflank-mailman (input) for mailman id 104542;
 Thu, 01 Apr 2021 14:20:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRyBk-00046J-05
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 14:20:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 158914c4-a5a2-4f2d-a51d-9047524db5f4;
 Thu, 01 Apr 2021 14:20:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 49237B1D8;
 Thu,  1 Apr 2021 14:20:46 +0000 (UTC)
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
X-Inumbo-ID: 158914c4-a5a2-4f2d-a51d-9047524db5f4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617286846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VOqeogxbK6VN2FJQOF4re0MvTB3ZQ8p0SRm2kVH04DU=;
	b=a2R+AwBvkbxtxfqzk+A+eT+VW0c/cGJG0VL0NepV/MmCyFZLhRJ+UhhnRbCVlXVuv0Zzxf
	la1si4LPrenGY/N1mOfxd16YsnFUhdTWocZo8op5MBjKWgnIpSX/qoUy2YQFdrtwScvcIg
	tporoK5CwvqI8U5sIutZRbSh8pymBIk=
Subject: Re: [PATCH 5/5] x86: don't build unused entry code when !PV32
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
 <d417d3f9-3278-ed08-1ff6-45a13b5e3757@suse.com>
 <YGXSU9lGZpidz9wb@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6b4e302f-2c50-5e6d-aadc-720c7efdd2e5@suse.com>
Date: Thu, 1 Apr 2021 16:20:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YGXSU9lGZpidz9wb@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.04.2021 16:01, Roger Pau Monné wrote:
> On Wed, Nov 25, 2020 at 09:51:33AM +0100, Jan Beulich wrote:
>> @@ -230,6 +230,13 @@ ENTRY(cstar_enter)
>>          sti
>>  
>>          movq  STACK_CPUINFO_FIELD(current_vcpu)(%rbx), %rbx
>> +
>> +#ifndef CONFIG_PV32
>> +
>> +        jmp   switch_to_kernel
>> +
>> +#else
>> +
>>          movq  VCPU_domain(%rbx),%rcx
>>          cmpb  $0,DOMAIN_is_32bit_pv(%rcx)
>>          je    switch_to_kernel
>> @@ -393,3 +400,5 @@ compat_crash_page_fault:
>>          jmp   .Lft14
>>  .previous
>>          _ASM_EXTABLE(.Lft14, .Lfx14)
>> +
>> +#endif /* CONFIG_PV32 */
> 
> Seeing this chunk, would it make sense to move the cstar_enter part
> relevant to !is_32bit_pv into the common entry.S and leave the rest
> here as compat_cstar_enter or some such?
> 
> AFAICT we only need a tiny part of the compat stuff when !CONFIG_PV32,
> so I think we could make the hole compat/entry.S depend on
> CONFIG_PV32.

To be honest I was meaning to see whether this would work out reasonably
well in a separate, follow-on change, as the code movement might make it
harder to judge on the change here compared to the #ifdef insertions.
But maybe I was wrong and should give this a try right away.

Jan


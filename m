Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDAB28D043
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 16:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6257.16693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSLLK-0002js-JK; Tue, 13 Oct 2020 14:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6257.16693; Tue, 13 Oct 2020 14:31:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSLLK-0002jW-F0; Tue, 13 Oct 2020 14:31:58 +0000
Received: by outflank-mailman (input) for mailman id 6257;
 Tue, 13 Oct 2020 14:31:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSLLJ-0002jP-Kz
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:31:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 011e8717-d21f-453a-8ec8-7cd02ae35aab;
 Tue, 13 Oct 2020 14:31:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B428FAB91;
 Tue, 13 Oct 2020 14:31:55 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSLLJ-0002jP-Kz
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:31:57 +0000
X-Inumbo-ID: 011e8717-d21f-453a-8ec8-7cd02ae35aab
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 011e8717-d21f-453a-8ec8-7cd02ae35aab;
	Tue, 13 Oct 2020 14:31:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602599515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMVJuBs6YeKW3muduYJm9bMrd8qLYubVgrkpupMRjxY=;
	b=WoTQbBZn7bqbcNBQCIgKAYu6Xp/RFHy+RvxjfU4lYuhgstzxNdSuyoDdoAGIq21gtwCpmr
	pz0zPLvoJV4LgdTMXjiceKonnKtYwz4wVwcccVP9lSMqh+yT4sHuouzPNHjw9JKsInwUz/
	P+D5Dr9AsH4qVjkSfTJJ1Bkrv1EXYak=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B428FAB91;
	Tue, 13 Oct 2020 14:31:55 +0000 (UTC)
Subject: Re: [PATCH] x86/smpboot: Unconditionally call
 memguard_unguard_stack() in cpu_smpboot_free()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201005122325.17395-1-andrew.cooper3@citrix.com>
 <36d3443d-50dd-5163-ddac-973421f390e0@suse.com>
 <d5c19b39-0413-d61d-3e1f-c35dd19b4287@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d3a21823-c972-eeb1-ee12-368684662f7c@suse.com>
Date: Tue, 13 Oct 2020 16:31:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d5c19b39-0413-d61d-3e1f-c35dd19b4287@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.10.2020 15:23, Andrew Cooper wrote:
> On 13/10/2020 14:16, Jan Beulich wrote:
>> On 05.10.2020 14:23, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/smpboot.c
>>> +++ b/xen/arch/x86/smpboot.c
>>> @@ -971,16 +971,16 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
>>>      if ( IS_ENABLED(CONFIG_PV32) )
>>>          FREE_XENHEAP_PAGE(per_cpu(compat_gdt, cpu));
>>>  
>>> +    if ( stack_base[cpu] )
>>> +        memguard_unguard_stack(stack_base[cpu]);
>>> +
>>>      if ( remove )
>>>      {
>>>          FREE_XENHEAP_PAGE(per_cpu(gdt, cpu));
>>>          FREE_XENHEAP_PAGE(idt_tables[cpu]);
>>>  
>>>          if ( stack_base[cpu] )
>>> -        {
>>> -            memguard_unguard_stack(stack_base[cpu]);
>>>              FREE_XENHEAP_PAGES(stack_base[cpu], STACK_ORDER);
>>> -        }
>>>      }
>>>  }
>> In my initial reply to Marek's report I did suggest putting the fix
>> in the alloc path in order to keep the pages "guarded" while the CPU
>> is parked
> 
> In which case you should have identified that bug explicitly.
> 
> Because I can't read your mind while fixing the other real bugs in your
> suggestion.

I'm sorry for the brevity at that point - it was a Sunday, and I merely
thought I'd write down my observation after reading the report. And of
course I'm curious as to the other real bugs in my suggestion (when I
anyway said "something like").

Jan


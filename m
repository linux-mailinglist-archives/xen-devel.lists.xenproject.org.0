Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E02360B25
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 15:57:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111170.212574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2UE-0003RT-MW; Thu, 15 Apr 2021 13:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111170.212574; Thu, 15 Apr 2021 13:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2UE-0003R3-Iz; Thu, 15 Apr 2021 13:56:50 +0000
Received: by outflank-mailman (input) for mailman id 111170;
 Thu, 15 Apr 2021 13:56:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lX2UD-0003Qw-23
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 13:56:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff141ed0-e8c6-43d0-968d-eea0c8639df6;
 Thu, 15 Apr 2021 13:56:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D879EAFBF;
 Thu, 15 Apr 2021 13:56:46 +0000 (UTC)
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
X-Inumbo-ID: ff141ed0-e8c6-43d0-968d-eea0c8639df6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618495007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XNJeB01swBoa7frEzDJ795xvk8RU/K28iYVC5K/YFP0=;
	b=mR/TMh/hsyW/diHxKS7LSx3CK34nSk5cHcULhkM9PKCPD75n+f5+nQPJgNHBIP8B3SSKVD
	8sKnzYemnmCqHo9Hd704IkzF9YK45p6MQfx/O3Mqbij3h8N4HVQK87SewaIL5jajQcCMNb
	j8cRt2Q5AbRVo8TmZ2CtKFSbhV88E+A=
Subject: Re: [PATCH v2 11/17] x86/CPUID: adjust extended leaves out of range
 clearing
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
 <0f04f568-e55a-ef20-aa97-fbb199dfae37@suse.com>
 <b8960b03-4671-8653-2897-7d1b116e599b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2cca15ba-b704-c038-5b3d-63435d3c6e80@suse.com>
Date: Thu, 15 Apr 2021 15:56:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <b8960b03-4671-8653-2897-7d1b116e599b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.04.2021 14:48, Andrew Cooper wrote:
> On 23/11/2020 14:32, Jan Beulich wrote:
>> --- a/xen/lib/x86/cpuid.c
>> +++ b/xen/lib/x86/cpuid.c
>> @@ -232,7 +232,9 @@ void x86_cpuid_policy_clear_out_of_range
>>                      ARRAY_SIZE(p->xstate.raw) - 1);
>>      }
>>  
>> -    zero_leaves(p->extd.raw, (p->extd.max_leaf & 0xffff) + 1,
>> +    zero_leaves(p->extd.raw,
>> +                ((p->extd.max_leaf >> 16) == 0x8000
>> +                 ? (p->extd.max_leaf & 0xffff) + 1 : 0),
>>                  ARRAY_SIZE(p->extd.raw) - 1);
> 
> Honestly, this is unnecessary complexity and overhead, and the logic is
> already hard enough to follow.
> 
> There won't be extd.max_leaf with the high half != 0x8000 in real
> policies, because of how we fill them.  Nor ought there to be, given the
> intended meaning of this part of the union.
> 
> I think we simply forbid this case, rather than taking extra complexity
> to cope with it.  Approximately all VMs will have 0x80000008 as a
> minimum, and I don't think catering to pre-64bit Intel CPUs is worth our
> effort either.

"Forbid" has got to mean something other than "assume all input is fine".
Aiui guest config files can restrict the maximum sub-leaves exposed to a
guest. If we don't want to handle the case here, where else to you
suggest we at least and complain about the broken assumption? (IOW I'd
be okay dropping this patch if your "forbid" actually means some
enforcement elsewhere, and then perhaps a comment pointing there ahead
of the zero_leaves() invocation here.)

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9715327B04A
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 16:50:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMuT8-0004Zv-CK; Mon, 28 Sep 2020 14:49:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMuT7-0004Zq-1P
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 14:49:33 +0000
X-Inumbo-ID: d8b3f5b8-98fe-42f4-9351-1dc60cf21e62
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8b3f5b8-98fe-42f4-9351-1dc60cf21e62;
 Mon, 28 Sep 2020 14:49:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601304571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fig0WtH43WaF4/PZ1MYTmGpfGIGdKmVWSYlRVCSj7tI=;
 b=hwnjsq//77OT9Jydq7yrkquXa9tpM/MgJs9uS89IWG8QiA8W+jMvKp61907kjlFUkpQgH/
 Iu4kQ/CJvBEaw2xvl7HEKcL06rh+G8LivuU/hUhgurQCtRHQVA68l65uRXOhQiK5Oru/OM
 aXP9by+hRHjPiovmb9t1GlJXWhQ8uug=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4FD13B18A;
 Mon, 28 Sep 2020 14:49:31 +0000 (UTC)
Subject: Re: [PATCH 1/5] x86: introduce read_sregs() to allow storing to
 memory directly
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ec4b451e-2b93-8526-ef98-7a2d502e31c2@suse.com>
 <6cd5dfca-a10c-0847-c084-a511ab2cbb1c@suse.com>
 <46c1f7b6-6c96-9c81-849e-4e44ed341ccb@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a2df6839-823d-a437-489e-c9007bd7caca@suse.com>
Date: Mon, 28 Sep 2020 16:49:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <46c1f7b6-6c96-9c81-849e-4e44ed341ccb@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.09.2020 14:47, Andrew Cooper wrote:
> On 28/09/2020 13:05, Jan Beulich wrote:
>> --- a/xen/include/asm-x86/regs.h
>> +++ b/xen/include/asm-x86/regs.h
>> @@ -15,4 +15,18 @@
>>      (diff == 0);                                                              \
>>  })
>>  
>> +#define read_sreg(name) ({                                    \
>> +    unsigned int __sel;                                       \
>> +    asm volatile ( "mov %%" STR(name) ",%0" : "=r" (__sel) ); \
>> +    __sel;                                                    \
>> +})
>> +
>> +static inline void read_sregs(struct cpu_user_regs *regs)
>> +{
>> +    asm volatile ( "mov %%ds, %0" : "=m" (regs->ds) );
>> +    asm volatile ( "mov %%es, %0" : "=m" (regs->es) );
>> +    asm volatile ( "mov %%fs, %0" : "=m" (regs->fs) );
>> +    asm volatile ( "mov %%gs, %0" : "=m" (regs->gs) );
> 
> It occurs to me that reads don't need to be volatile.  There are no side
> effects.

I'll do the same for what patches 3 and 5 alter anyway, assuming
this won't invalidate your R-b there.

Jan


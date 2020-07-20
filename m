Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E6A2259D6
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 10:18:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxQzS-0005jY-8N; Mon, 20 Jul 2020 08:17:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WIjz=A7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jxQzR-0005jT-AX
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 08:17:37 +0000
X-Inumbo-ID: 77fde9b0-ca61-11ea-98f0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77fde9b0-ca61-11ea-98f0-12813bfff9fa;
 Mon, 20 Jul 2020 08:17:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EB186ADC1;
 Mon, 20 Jul 2020 08:17:41 +0000 (UTC)
Subject: Re: [PATCH 4/8] Arm: prune #include-s needed by domain.h
To: Julien Grall <julien@xen.org>
References: <3375cacd-d3b7-9f06-44a7-4b684b6a77d6@suse.com>
 <150525bb-1c48-c331-3212-eff18bc4c13d@suse.com>
 <d836dc7f-017b-5048-02de-d1cb291fbc3b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <931149db-2daf-6d72-0330-c938b5084eb6@suse.com>
Date: Mon, 20 Jul 2020 10:17:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d836dc7f-017b-5048-02de-d1cb291fbc3b@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.07.2020 16:44, Julien Grall wrote:
> On 15/07/2020 11:39, Jan Beulich wrote:
>> --- a/xen/include/asm-arm/domain.h
>> +++ b/xen/include/asm-arm/domain.h
>> @@ -2,7 +2,7 @@
>>   #define __ASM_DOMAIN_H__
>>   
>>   #include <xen/cache.h>
>> -#include <xen/sched.h>
>> +#include <xen/timer.h>
>>   #include <asm/page.h>
>>   #include <asm/p2m.h>
>>   #include <asm/vfp.h>
>> @@ -11,8 +11,6 @@
>>   #include <asm/vgic.h>
>>   #include <asm/vpl011.h>
>>   #include <public/hvm/params.h>
>> -#include <xen/serial.h>
> 
> While we don't need the rbtree.h, we technically need serial.h for using 
> vuart_info.

The only reference to it is

        const struct vuart_info     *info;

which doesn't require a definition nor even a forward declaration
of struct vuart_info. It should just be source files instantiating
a struct or de-referencing pointers to one that actually need to
see the full declaration. The only source file doing so (vuart.c)
already includes xen/serial.h. (In fact, it being just a single
source file doing so, the struct definition could [and imo should]
be moved there. The type can be entirely opaque to the rest of the
code base, as - over time - we've been doing for other structs.)

> I would rather prefer if headers are not implicitly included whenever it 
> is possible.

I agree with this principle, where it applies.

Jan


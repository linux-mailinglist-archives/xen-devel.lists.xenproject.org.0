Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9B0225AE3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 11:10:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxRnu-0002SV-7S; Mon, 20 Jul 2020 09:09:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Eely=A7=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jxRnt-0002SQ-Hn
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 09:09:45 +0000
X-Inumbo-ID: c0389eb2-ca68-11ea-9f71-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0389eb2-ca68-11ea-9f71-12813bfff9fa;
 Mon, 20 Jul 2020 09:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bcI8mRWFsA9Ny4ZI1pt3kOXvbWUpdq41ifnQuWxnWuU=; b=Njpvx/oizMNfaP04/G+K93HQa6
 eOwjNFqisi3Zqaus9GL3wVhW7+qcgkuu2YBD9fuqhQmDwwZO2N/KgNiyOjN/YqUOjw+BEJzOXeVn+
 n8uJ6bQfNhJJb1AEJqqYzSGYmFX5I3Wnq+Jv2VZfaXdHq1MT/O0wXnw9szyicZFa+cAY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxRnr-0001Ay-MF; Mon, 20 Jul 2020 09:09:43 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxRnr-0005YL-GA; Mon, 20 Jul 2020 09:09:43 +0000
Subject: Re: [PATCH 4/8] Arm: prune #include-s needed by domain.h
To: Jan Beulich <jbeulich@suse.com>
References: <3375cacd-d3b7-9f06-44a7-4b684b6a77d6@suse.com>
 <150525bb-1c48-c331-3212-eff18bc4c13d@suse.com>
 <d836dc7f-017b-5048-02de-d1cb291fbc3b@xen.org>
 <931149db-2daf-6d72-0330-c938b5084eb6@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2cc66fdb-1da2-16cd-717a-3248d136821c@xen.org>
Date: Mon, 20 Jul 2020 10:09:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <931149db-2daf-6d72-0330-c938b5084eb6@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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



On 20/07/2020 09:17, Jan Beulich wrote:
> On 17.07.2020 16:44, Julien Grall wrote:
>> On 15/07/2020 11:39, Jan Beulich wrote:
>>> --- a/xen/include/asm-arm/domain.h
>>> +++ b/xen/include/asm-arm/domain.h
>>> @@ -2,7 +2,7 @@
>>>    #define __ASM_DOMAIN_H__
>>>    
>>>    #include <xen/cache.h>
>>> -#include <xen/sched.h>
>>> +#include <xen/timer.h>
>>>    #include <asm/page.h>
>>>    #include <asm/p2m.h>
>>>    #include <asm/vfp.h>
>>> @@ -11,8 +11,6 @@
>>>    #include <asm/vgic.h>
>>>    #include <asm/vpl011.h>
>>>    #include <public/hvm/params.h>
>>> -#include <xen/serial.h>
>>
>> While we don't need the rbtree.h, we technically need serial.h for using
>> vuart_info.
> 
> The only reference to it is
> 
>          const struct vuart_info     *info;
> 
> which doesn't require a definition nor even a forward declaration
> of struct vuart_info. It should just be source files instantiating
> a struct or de-referencing pointers to one that actually need to
> see the full declaration. 

Ah yes. I got confused because you introduced a forward declaration of 
struct vcpu. But this is because you need it to declare the function 
prototype.

> The only source file doing so (vuart.c)
> already includes xen/serial.h. (In fact, it being just a single
> source file doing so, the struct definition could [and imo should]
> be moved there. The type can be entirely opaque to the rest of the
> code base, as - over time - we've been doing for other structs.)

There are definitely more use of vuart_info within the code base. All 
the UART on Arm will fill up the structure (see drivers/char/pl011.c) 
for instance.

So the definition is in the correct place.

Cheers,

-- 
Julien Grall


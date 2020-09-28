Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 254AC27B08D
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 17:11:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMuoC-0007BG-Qt; Mon, 28 Sep 2020 15:11:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPfX=DF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kMuoB-0007B9-DF
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 15:11:19 +0000
X-Inumbo-ID: 8fed0430-c9a5-4c9f-bb74-40272d9e1de6
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fed0430-c9a5-4c9f-bb74-40272d9e1de6;
 Mon, 28 Sep 2020 15:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1601305879;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=SVPsMfOevrp9pewQCxxTl3JFf5R3J8/HU/dKpMuohTI=;
 b=eOm4I2NB6e/6DJJ6Qsn7pqA5KwrGABYeEzWmiz6J2gNhAi6GPhxRI/YR
 S4fSUyCU/01VyREWHEDdNWO8brgWzy1UyudaP205RsOQX5ShulLU7s1r4
 UaasIX1JqZBBxk6p85VgS9i6C2F09VEPPhKC+chGx2UC3AU06ZenQ+Cem o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: vHMFv8cmrHyul5TR3ZeHGqtuuMlJQFGc2mMSCvOLMVfkid3rGwurBnjWAHOaOID/xL7mUhGjrV
 juDQ0bessp5Eea/SiLnqNecx99o++yI+6lJ7KH5eDzuzTdV89lME6ZIicBRUNb2QMOOqmx/IMG
 p0X2LE/rqsM4NMi+9BetU/surtcfUL0P7N/F32NI5/5EKYXgyC1CZTWfYtio7FoIWC2PdX0eGx
 a2H0Wh0NnYI4SyoF7HqyIVSuJumr6FJbWnyo/9pFNZV55wL6iqX+YS9G0KmT5OoZ721MUAqJWa
 ZEg=
X-SBRS: None
X-MesageID: 27741719
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,313,1596513600"; d="scan'208";a="27741719"
Subject: Re: [PATCH 1/5] x86: introduce read_sregs() to allow storing to
 memory directly
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ec4b451e-2b93-8526-ef98-7a2d502e31c2@suse.com>
 <6cd5dfca-a10c-0847-c084-a511ab2cbb1c@suse.com>
 <46c1f7b6-6c96-9c81-849e-4e44ed341ccb@citrix.com>
 <a2df6839-823d-a437-489e-c9007bd7caca@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1c7dc57a-4a8b-238d-62dd-584ae4c31946@citrix.com>
Date: Mon, 28 Sep 2020 16:11:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a2df6839-823d-a437-489e-c9007bd7caca@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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

On 28/09/2020 15:49, Jan Beulich wrote:
> On 28.09.2020 14:47, Andrew Cooper wrote:
>> On 28/09/2020 13:05, Jan Beulich wrote:
>>> --- a/xen/include/asm-x86/regs.h
>>> +++ b/xen/include/asm-x86/regs.h
>>> @@ -15,4 +15,18 @@
>>>      (diff == 0);                                                              \
>>>  })
>>>  
>>> +#define read_sreg(name) ({                                    \
>>> +    unsigned int __sel;                                       \
>>> +    asm volatile ( "mov %%" STR(name) ",%0" : "=r" (__sel) ); \
>>> +    __sel;                                                    \
>>> +})
>>> +
>>> +static inline void read_sregs(struct cpu_user_regs *regs)
>>> +{
>>> +    asm volatile ( "mov %%ds, %0" : "=m" (regs->ds) );
>>> +    asm volatile ( "mov %%es, %0" : "=m" (regs->es) );
>>> +    asm volatile ( "mov %%fs, %0" : "=m" (regs->fs) );
>>> +    asm volatile ( "mov %%gs, %0" : "=m" (regs->gs) );
>> It occurs to me that reads don't need to be volatile.  There are no side
>> effects.
> I'll do the same for what patches 3 and 5 alter anyway, assuming
> this won't invalidate your R-b there.

3 is fine.  5 is a little more problematic, because there are
serialising side effects, but I suppose we really don't care here.

~Andrew


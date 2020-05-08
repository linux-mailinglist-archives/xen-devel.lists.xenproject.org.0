Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C3F1CA53C
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 09:34:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWxWX-0001MD-Dl; Fri, 08 May 2020 07:34:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jWxWV-0001M6-6n
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 07:34:19 +0000
X-Inumbo-ID: 532c4b64-90fe-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 532c4b64-90fe-11ea-ae69-bc764e2007e4;
 Fri, 08 May 2020 07:34:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 403E5AF68;
 Fri,  8 May 2020 07:34:20 +0000 (UTC)
Subject: Re: [PATCH v8 04/12] x86emul: support SERIALIZE
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <0bbbf95e-48ec-ee73-5234-52cf9c6c06d8@suse.com>
 <64de91ff-41ae-baf1-1119-0ba39df32275@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0c5a03c6-6c4f-c6ec-e474-71a2badd1c9c@suse.com>
Date: Fri, 8 May 2020 09:34:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <64de91ff-41ae-baf1-1119-0ba39df32275@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.05.2020 21:32, Andrew Cooper wrote:
> On 05/05/2020 09:14, Jan Beulich wrote:
>> ... enabling its use by all guest kinds at the same time.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>> @@ -5660,6 +5661,18 @@ x86_emulate(
>>                  goto done;
>>              break;
>>  
>> +        case 0xe8:
>> +            switch ( vex.pfx )
>> +            {
>> +            case vex_none: /* serialize */
>> +                host_and_vcpu_must_have(serialize);
>> +                asm volatile ( ".byte 0x0f, 0x01, 0xe8" );
> 
> There is very little need for an actual implementation here.  The VMExit
> to get here is good enough.
> 
> The only question is whether pre-unrestricted_guest Intel boxes are
> liable to find this in real mode code.

Apart from this we also shouldn't assume HVM in the core emulator,
I think.

Jan


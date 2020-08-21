Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 623CE24CFD8
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 09:46:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k91kE-0001cH-2i; Fri, 21 Aug 2020 07:45:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kxmg=B7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k91kD-0001cC-2B
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 07:45:49 +0000
X-Inumbo-ID: c0100896-85d7-4549-a27d-1095d81650bc
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0100896-85d7-4549-a27d-1095d81650bc;
 Fri, 21 Aug 2020 07:45:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 22D26AEE6;
 Fri, 21 Aug 2020 07:46:14 +0000 (UTC)
Subject: Re: [PATCH 2/2] x86/vpic: also execute dpci callback for non-specific
 EOI
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
References: <20200820153442.28305-1-roger.pau@citrix.com>
 <20200820153442.28305-3-roger.pau@citrix.com>
 <625060e6-bdd0-c72c-c7fc-9a31588511b3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4ac81e8f-f6e5-7226-49c7-135aa88a7b12@suse.com>
Date: Fri, 21 Aug 2020 09:45:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <625060e6-bdd0-c72c-c7fc-9a31588511b3@citrix.com>
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

On 20.08.2020 18:28, Andrew Cooper wrote:
> On 20/08/2020 16:34, Roger Pau Monne wrote:
>> Currently the dpci EOI callback is only executed for specific EOIs.
>> This is wrong as non-specific EOIs will also clear the ISR bit and
>> thus end the interrupt. Re-arrange the code a bit so that the common
>> EOI handling path can be shared between all EOI modes.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>  xen/arch/x86/hvm/vpic.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
>> index feb1db2ee3..3cf12581e9 100644
>> --- a/xen/arch/x86/hvm/vpic.c
>> +++ b/xen/arch/x86/hvm/vpic.c
>> @@ -249,15 +249,15 @@ static void vpic_ioport_write(
>>                  if ( priority == VPIC_PRIO_NONE )
>>                      break;
>>                  pin = (priority + vpic->priority_add) & 7;
>> -                vpic->isr &= ~(1 << pin);
>> -                if ( cmd == 5 )
>> -                    vpic->priority_add = (pin + 1) & 7;
>> -                break;
>> +                goto common_eoi;
>> +
>>              case 3: /* Specific EOI                */
>>              case 7: /* Specific EOI & Rotate       */
>>                  pin = val & 7;
> 
> You'll need a /* Fallthrough */ here to keep various things happy.

Are you sure? There's ...

> Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Can fix on commit if you're happy.
> 
>> +
>> +            common_eoi:

... an ordinary label here, not a case one.

Jan


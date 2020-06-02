Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E63201EBCB7
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 15:11:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg6hO-0005E7-MS; Tue, 02 Jun 2020 13:11:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jg6hN-0005Dy-RC
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 13:11:21 +0000
X-Inumbo-ID: 8d468872-a4d2-11ea-9dbe-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d468872-a4d2-11ea-9dbe-bc764e2007e4;
 Tue, 02 Jun 2020 13:11:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A421CABCE;
 Tue,  2 Jun 2020 13:11:22 +0000 (UTC)
Subject: Re: [PATCH v2 10/14] x86/extable: Adjust extable handling to be
 shadow stack compatible
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-11-andrew.cooper3@citrix.com>
 <b36b5868-0b7c-2b45-a994-0ff5ea170433@suse.com>
 <0c7f425a-996f-8840-f1e2-79381edb6456@citrix.com>
 <9d86ecf8-eaaa-7c2c-a3cc-b832d013a225@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bf3e6b83-a984-af41-c975-1fd9447b12e7@suse.com>
Date: Tue, 2 Jun 2020 15:11:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <9d86ecf8-eaaa-7c2c-a3cc-b832d013a225@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.05.2020 23:17, Andrew Cooper wrote:
> On 29/05/2020 20:43, Andrew Cooper wrote:
>> On 28/05/2020 17:15, Jan Beulich wrote:
>>> On 27.05.2020 21:18, Andrew Cooper wrote:
>>>> +
>>>> +        if ( ptr[0] == regs->rip && ptr[1] == regs->cs )
>>>> +        {
>>>> +            asm ( "wrssq %[fix], %[stk]"
>>>> +                  : [stk] "=m" (*ptr)
>>> Could this be ptr[0], to match the if()?
>>>
>>> Considering how important it is that we don't fix up the wrong stack
>>> location here, I continue to wonder if we wouldn't better also
>>> include the SSP value on the stack in the checking, at the very
>>> least by way of an ASSERT() or BUG_ON().
>> Well no, for the reason discussed in point 1.
>>
>> Its not technically an issue right now, but there is no possible way to
>> BUILD_BUG_ON() someone turning an exception into IST, or stopping the
>> use of the extable infrastructure on a #DB.
>>
>> Such a check would lie in wait and either provide an unexpected tangent
>> to someone debugging a complicated issue (I do use #DB for a fair bit),
>> or become a security vulnerability.
> 
> Also (which I forgot first time around),
> 
> The ptr[1] == regs->cs check is 64 bits wide, and the way to get that on
> the shadow stack would be to execute a call instruction ending at at
> 0xe008 linear, or from a bad WRSSQ edit, both of which are serious
> errors and worthy of hitting the BUG().

Maybe you misunderstood me then: By suggesting more strict checking
I'm actually asking for it to become more likely to hit that BUG(),
not less likely. (This is despite agreeing that the very limited
range of CS values on the stack already makes it practically
impossible to mistake the frame found.)

Jan


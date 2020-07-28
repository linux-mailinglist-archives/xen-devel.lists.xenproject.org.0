Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E79231284
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 21:25:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0VDg-0006ho-RW; Tue, 28 Jul 2020 19:25:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qgq5=BH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k0VDf-0006hj-Ds
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 19:24:59 +0000
X-Inumbo-ID: 06277650-d108-11ea-8bc6-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06277650-d108-11ea-8bc6-bc764e2007e4;
 Tue, 28 Jul 2020 19:24:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EF286AD5B;
 Tue, 28 Jul 2020 19:25:08 +0000 (UTC)
Subject: Re: [PATCH 1/4] x86: replace __ASM_{CL,ST}AC
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
 <fc8e042e-fef8-ac38-34d8-16b13e4b0135@suse.com>
 <20200727145526.GR7191@Air-de-Roger>
 <b29e4b17-8ec2-a0db-8426-94393e9eb2c0@suse.com>
 <868f864b-ae8e-0b01-8cf0-74a0fd3982ee@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f6b29bdb-71c0-bcc9-d524-f6c8d67fa24b@suse.com>
Date: Tue, 28 Jul 2020 21:24:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <868f864b-ae8e-0b01-8cf0-74a0fd3982ee@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.07.2020 15:59, Andrew Cooper wrote:
> On 27/07/2020 20:47, Jan Beulich wrote:
>> On 27.07.2020 16:55, Roger Pau Monné wrote:
>>> On Wed, Jul 15, 2020 at 12:48:14PM +0200, Jan Beulich wrote:
>>>> --- /dev/null
>>>> +++ b/xen/include/asm-x86/asm-defns.h
>>>
>>> Maybe this could be asm-insn.h or a different name? I find it
>>> confusing to have asm-defns.h and an asm_defs.h.
>>
>> While indeed I anticipated a reply to this effect, I don't consider
>> asm-insn.h or asm-macros.h suitable: We don't want to limit this
>> header to a more narrow purpose than "all sorts of definition", I
>> don't think. Hence I chose that name despite its similarity to the
>> C header's one.
> 
> Roger is correct.  Having asm-defns.h and asm_defs.h is too confusing,
> and there is already too much behind the scenes magic here.
> 
> What is the anticipated end result, file wise, because that might
> highlight a better way forward.

For one I'm afraid I don't understand "file wise" here. The one meaning
I could guess can't be it: The name of the file.

And then, "the anticipated end result" is at least ambiguous too: You
can surely see what the file contains by the end of this series, so
again this can't be meant. I have no immediate plans beyond this
series, so I can only state what I did say in reply to Roger's remark
already: "all sorts of asm definitions".

I'd also like to emphasize that asm-defns.h really is a companion of
asm_defns.h, supposed to be include only by the latter (as I think
can be seen from the patches). In this role I think its name being
as similar to its "parent" as suggested makes sufficient sense.

Jan


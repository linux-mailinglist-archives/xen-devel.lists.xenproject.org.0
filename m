Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6177F598C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 08:46:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639391.996723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r64QA-0001Od-CL; Thu, 23 Nov 2023 07:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639391.996723; Thu, 23 Nov 2023 07:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r64QA-0001Lw-9U; Thu, 23 Nov 2023 07:46:46 +0000
Received: by outflank-mailman (input) for mailman id 639391;
 Thu, 23 Nov 2023 07:46:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FfzT=HE=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r64Q8-0000Zu-RQ
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 07:46:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72655763-89d4-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 08:46:44 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id CF20C4EE073C;
 Thu, 23 Nov 2023 08:46:43 +0100 (CET)
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
X-Inumbo-ID: 72655763-89d4-11ee-98e2-6d05b1d4d9a1
MIME-Version: 1.0
Date: Thu, 23 Nov 2023 08:46:43 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>
Subject: Re: [PATCH 3/3] xen/MISRA: Remove nonstandard inline keywords
In-Reply-To: <adaa6d55-266d-4df8-8967-9340080d17e4@citrix.com>
References: <20231122142733.1818331-1-andrew.cooper3@citrix.com>
 <20231122142733.1818331-4-andrew.cooper3@citrix.com>
 <e5476808dbef67bea7ce3902d4d8b3c1@bugseng.com>
 <adaa6d55-266d-4df8-8967-9340080d17e4@citrix.com>
Message-ID: <46015f0bbb6ab57c0f18d5f7c66a3232@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2023-11-22 17:46, Andrew Cooper wrote:
> On 22/11/2023 4:39 pm, Nicola Vetrini wrote:
>> On 2023-11-22 15:27, Andrew Cooper wrote:
>>> The differences between inline, __inline and __inline__ keywords are 
>>> a
>>> vestigial remnant of older C standards, and in Xen we use inline 
>>> almost
>>> exclusively.
>>> 
>>> Replace __inline and __inline__ with regular inline, and remove their
>>> exceptions from the MISRA configuration.
>>> 
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Wei Liu <wl@xen.org>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
>>> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> CC: Simone Ballarin <simone.ballarin@bugseng.com>
>>> 
>>> I'm entirely guessing at the Eclair configuration.
>>> ---
>> 
>> The configuration changes are ok. One observation below.
> 
> Thanks.  Can I take that as an Ack/Reviewed-by ?
> 

I see that Simone already gave one; that should suffice.

>>> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
>>> index 04b8bc18df0e..16d554f2a593 100644
>>> --- a/xen/include/xen/compiler.h
>>> +++ b/xen/include/xen/compiler.h
>>> @@ -83,7 +82,7 @@
>>>   * inline functions not expanded inline get placed in .init.text.
>>>   */
>>>  #include <xen/init.h>
>>> -#define __inline__ __inline__ __init
>>> +#define inline inline __init
>> 
>> The violation of Rule 20.4 (A macro shall not be defined with the same
>> name as a keyword) is still present due to this macro.
> 
> I was expecting this to come up.
> 
> There's a comment half out of context above, but to expand on it, we
> have a feature in the build system where if you say obj-y += foo.init.o
> then it gets compiled as normal and then all symbols checked for being
> in the relevant .init sections.  It's a safeguard around init-only code
> ending up in the runtime image (which is good for other goals of 
> safety).
> 
> This particular define is necessary to cause out-of-lined static 
> inlines
> to end up in the right section, without having to invent a new
> __inline_or_init macro and rewriting half the header files in the 
> project.
> 
> I think it's going to need a local deviation.  It's deliberate, and all
> we're doing is using the inline keyword to hook in an extra __section()
> attribute.
> 
> ~Andrew

That's fair. I also agree that an exception for this use of inline can 
be made.
-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)


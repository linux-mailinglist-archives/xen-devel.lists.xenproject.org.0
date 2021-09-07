Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9092E402966
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 15:10:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181027.327983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNarD-00062G-DS; Tue, 07 Sep 2021 13:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181027.327983; Tue, 07 Sep 2021 13:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNarD-00060T-92; Tue, 07 Sep 2021 13:09:47 +0000
Received: by outflank-mailman (input) for mailman id 181027;
 Tue, 07 Sep 2021 13:09:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WTX3=N5=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mNarC-00060N-41
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 13:09:46 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c39c5b0-5c72-4792-bbfc-2b90ee5247fc;
 Tue, 07 Sep 2021 13:09:44 +0000 (UTC)
Received: from [10.10.1.146] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1631020175056268.27192467139764;
 Tue, 7 Sep 2021 06:09:35 -0700 (PDT)
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
X-Inumbo-ID: 6c39c5b0-5c72-4792-bbfc-2b90ee5247fc
ARC-Seal: i=1; a=rsa-sha256; t=1631020180; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Bpqq9silydKZDS3unZW4woy8Lpxr6mBVys9wZHwLDmGkSFBvcuz26I72Qa5w45tC2IbZ676RjubXimUoLx+0k9RS6xpUySVwtIKJwfklno6c+4AVRBEs38tKlS+Aj3ga1PX0JERzJBDyvhQT/ye1KjeIksyipXXARdYmYmo1kp0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1631020180; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=D/hKG9aSJpSBbbyNnfJLMboaDfUK/6nKEu6OPyO+A24=; 
	b=IJklqAFis6wcZh2pny0SbFa7MHqePfvYMUHMa2KxPZF7cQYguPbHcb+gsuviFx7PBg/6dPVxN1eHwQZS2VdPgsRdPQVcoFsGHitXKo9MsnFremxjfqEDUdSJF2NcnnOE5HilbVjDwBf4ktlY71ZrO3IWV1G0aUoFBD8+8xo/prw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631020180;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=D/hKG9aSJpSBbbyNnfJLMboaDfUK/6nKEu6OPyO+A24=;
	b=kNCDrjwqigiY0hOgCyTNR7okXsPNdvhQ1HLl4oaSyZDed8X7D/1TjQIgKpLyis8P
	syoixqwlifuPMOaA7SJZ7u59+ZxZFro3ykKzc/JTd9Qi226kSxHGwpLE9wFF+wksekS
	cPmFSB0CHYUILPVxxOv59D5r6eW37NJ2FlXr1apA=
Subject: Re: [PATCH v4 01/11] xen: Implement xen/alternative-call.h for use in
 common code
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-2-dpsmith@apertussolutions.com>
 <3a91e4ad-50c4-205f-3d90-f23c996b2938@suse.com>
 <8c3dfbf5-5c98-c923-ca81-28af3d13c4a4@citrix.com>
 <7e71ce74-dd81-21c3-db78-c37d95d5b239@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <da23a4b4-e2fb-7dfb-1791-39bd756ba18a@apertussolutions.com>
Date: Tue, 7 Sep 2021 09:07:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7e71ce74-dd81-21c3-db78-c37d95d5b239@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External



On 9/7/21 2:00 AM, Jan Beulich wrote:
> On 06.09.2021 18:22, Andrew Cooper wrote:
>> On 06/09/2021 16:52, Jan Beulich wrote:
>>> On 03.09.2021 21:06, Daniel P. Smith wrote:
>>>> --- /dev/null
>>>> +++ b/xen/include/xen/alternative-call.h
>>>> @@ -0,0 +1,63 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +#ifndef XEN_ALTERNATIVE_CALL
>>>> +#define XEN_ALTERNATIVE_CALL
>>>> +
>>>> +/*
>>>> + * Some subsystems in Xen may have multiple implementions, which can be
>>>> + * resolved to a single implementation at boot time.  By default, this will
>>>> + * result in the use of function pointers.
>>>> + *
>>>> + * Some architectures may have mechanisms for dynamically modifying .text.
>>>> + * Using this mechnaism, function pointers can be converted to direct calls
>>>> + * which are typically more efficient at runtime.
>>>> + *
>>>> + * For architectures to support:
>>>> + *
>>>> + * - Implement alternative_{,v}call() in asm/alternative.h.  Code generation
>>>> + *   requirements are to emit a function pointer call at build time, and stash
>>>> + *   enough metadata to simplify the call at boot once the implementation has
>>>> + *   been resolved.
>>>> + * - Select ALTERNATIVE_CALL in Kconfig.
>>>> + *
>>>> + * To use:
>>>> + *
>>>> + * Consider the following simplified example.
>>>> + *
>>>> + *  1) struct foo_ops __alt_call_maybe_initdata ops;
>>>> + *
>>>> + *  2) const struct foo_ops __initconst foo_a_ops = { ... };
>>>> + *     const struct foo_ops __initconst foo_b_ops = { ... };
>>>> + *
>>>> + *     void foo_init(void)
>>>> + *     {
>>>> + *         ...
>>>> + *         if ( use_impl_a )
>>>> + *             ops = *foo_a_ops;
>>>> + *         else if ( use_impl_b )
>>>> + *             ops = *foo_b_ops;
>>>> + *         ...
>>>> + *     }
>>>> + *
>>>> + *  3) alternative_call(ops.bar, ...);
>>>> + *
>>>> + * There needs to a single ops object (1) which will eventually contain the
>>>> + * function pointers.  This should be populated in foo's init() function (2)
>>>> + * by one of the available implementations.  To call functions, use
>>>> + * alternative_{,v}call() referencing the main ops object (3).
>>>> + */
>>>> +
>>>> +#ifdef CONFIG_ALTERNATIVE_CALL
>>>> +
>>>> +#include <asm/alternative.h>
>>>> +
>>>> +#define __alt_call_maybe_initdata __initdata
>>> My v3 comment here was:
>>>
>>> "I think it wants (needs) clarifying that this may only be used if
>>>   the ops object is used exclusively in alternative_{,v}call()
>>>   instances (besides the original assignments to it, of course)."
>>>
>>> I realize this was slightly too strict, as other uses from .init.*
>>> are of course also okay, but I continue to think that - in
>>> particular with the example using it - there should be a warning
>>> about this possible pitfall. Or am I merely unable to spot the
>>> wording change somewhere in the comment?
>>
>> Such a comment is utterly pointless.  initdata has a well known meaning,
>> and a comment warning about the effects of it is just teaching
>> developers to suck eggs[1]
> 
> Well, okay then - at least the definition of __alt_call_maybe_initdata
> isn't far away from the comment. (What I'm not convinced of is that
> people knowing __initdata's meaning necessarily need to correctly
> infer __alt_call_maybe_initdata's.)
> 
> Two other observations about the comment though, which I'd like to be
> taken care of (perhaps while committing):
> 
> - __initconst wants to become __initconstrel.
> - foo_init(), seeing that there are section annotations elsewhere,
>    wants to be marked __init.
> 
> Then
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Daniel, you having made changes (even if just minor ones) imo requires
> you S-o-b on the patch alongside Andrew's.

Ack, I realized after sending I didn't SoB it, my apologies on that.

v/r,
dps


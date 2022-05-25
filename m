Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8045338D0
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 10:52:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337034.561508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntmkD-0005rB-1x; Wed, 25 May 2022 08:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337034.561508; Wed, 25 May 2022 08:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntmkC-0005oJ-Uz; Wed, 25 May 2022 08:51:52 +0000
Received: by outflank-mailman (input) for mailman id 337034;
 Wed, 25 May 2022 08:51:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FO4+=WB=leemhuis.info=regressions@srs-se1.protection.inumbo.net>)
 id 1ntmkA-0005oD-To
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 08:51:50 +0000
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [2a01:488:42:1000:50ed:8234::])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9ed7f4e-dc07-11ec-837f-e5687231ffcc;
 Wed, 25 May 2022 10:51:49 +0200 (CEST)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1ntmjl-0003D1-IO; Wed, 25 May 2022 10:51:25 +0200
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
X-Inumbo-ID: e9ed7f4e-dc07-11ec-837f-e5687231ffcc
Message-ID: <5334d001-af50-eacb-8845-dd83df35be56@leemhuis.info>
Date: Wed, 25 May 2022 10:51:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] x86/pat: add functions to query specific cache mode
 availability
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Juergen Gross <jgross@suse.com>,
 Chuck Zmudzinski <brchuckz@netscape.net>, regressions@lists.linux.dev,
 stable@vger.kernel.org
References: <20220503132207.17234-1-jgross@suse.com>
 <20220503132207.17234-3-jgross@suse.com>
 <1d86d8ff-6878-5488-e8c4-cbe8a5e8f624@suse.com>
 <0dcb05d0-108f-6252-e768-f75b393a7f5c@suse.com>
 <77255e5b-12bf-5390-6910-dafbaff18e96@netscape.net>
 <a2e95587-418b-879f-2468-8699a6df4a6a@suse.com>
 <8b1ebea5-7820-69c4-2e2b-9866d55bc180@netscape.net>
 <c5fa3c3f-e602-ed68-d670-d59b93c012a0@netscape.net>
 <3bff3562-bb1e-04e6-6eca-8d9bc355f2eb@suse.com>
 <3ca084a9-768e-a6f5-ace4-cd347978dec7@netscape.net>
 <9af0181a-e143-4474-acda-adbe72fc6227@suse.com>
 <b2585c19-d38b-9640-64ab-d0c9be24be34@netscape.net>
 <dae4cc45-a1cd-e33f-25ef-c536df9b49e6@leemhuis.info>
 <3fc70595-3dcc-4901-0f3f-193f043b753f@netscape.net>
 <eab9fdb0-11ef-4556-bdd7-f021cc5f10b7@leemhuis.info>
 <83cbd5ce-7f00-9121-44b3-5d1b94d66f02@suse.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <83cbd5ce-7f00-9121-44b3-5d1b94d66f02@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1653468709;3e2fd205;
X-HE-SMSGID: 1ntmjl-0003D1-IO

On 25.05.22 10:37, Jan Beulich wrote:
> On 25.05.2022 09:45, Thorsten Leemhuis wrote:
>> On 24.05.22 20:32, Chuck Zmudzinski wrote:
>>> On 5/21/22 6:47 AM, Thorsten Leemhuis wrote:
>>>> I'm not a developer and I'm don't known the details of this thread and
>>>> the backstory of the regression, but it sounds like that's the approach
>>>> that is needed here until someone comes up with a fix for the regression
>>>> exposed by bdd8b6c98239.
>>>>
>>>> But if I'm wrong, please tell me.
>>>
>>> You are mostly right, I think. Reverting bdd8b6c98239 fixes
>>> it. There is another way to fix it, though.
>>
>> Yeah, I'm aware of it. But it seems...
>>
>>> The patch proposed
>>> by Jan Beulich also fixes the regression on my system, so as
>>> the person reporting this is a regression, I would also be satisfied
>>> with Jan's patch instead of reverting bdd8b6c98239 as a fix. Jan
>>> posted his proposed patch here:
>>>
>>> https://lore.kernel.org/lkml/9385fa60-fa5d-f559-a137-6608408f88b0@suse.com/
>>
>> ...that approach is not making any progress either?
>>
>> Jan, can could provide a short status update here? I'd really like to
>> get this regression fixed one way or another rather sooner than later,
>> as this is taken way to long already IMHO.
> 
> What kind of status update could I provide? I've not heard back from
> anyone of the maintainers, so I have no way to know what (if anything)
> I need to do.

That is perfectly fine as a status update for me (I track a lot of
regression and it's easy to miss updated patches, discussion in other
places, and things like that).

Could you maybe send a reminder to the maintainer that this is a fix for
regression that is bothering people and needs to be handled with high
priority? Feel free to tell them the Linux kernel regression tracker is
pestering you because things are taken so long. :-D

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF572D7416
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 11:44:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50368.88990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knfu9-0000nk-7o; Fri, 11 Dec 2020 10:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50368.88990; Fri, 11 Dec 2020 10:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knfu9-0000nN-4Z; Fri, 11 Dec 2020 10:44:05 +0000
Received: by outflank-mailman (input) for mailman id 50368;
 Fri, 11 Dec 2020 10:44:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9HZb=FP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1knfu8-0000nI-8Y
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 10:44:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3b31482-37fe-4b26-b446-1148c34d401a;
 Fri, 11 Dec 2020 10:44:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 285D1AC94;
 Fri, 11 Dec 2020 10:44:02 +0000 (UTC)
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
X-Inumbo-ID: e3b31482-37fe-4b26-b446-1148c34d401a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607683442; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n27DzJ9lj/58T4Dlyk07z/5g/H0Ws6ihMzbTX8GAOps=;
	b=tSHxly/hrZ96yHIc1jT834Ej1qTU6u7G/TQ4vKV3bTrkysTMcD9MJFZdmChW0Yg+wAcvoe
	o5W+JSDdQmJA8muKsTQdyYTdSwOZAyukFKTBYhpPCZqP/+GivpjHuu5OOa74bjHwjNmZ2x
	WHFY8oT9bRG6hlKIj8BQJOIgUgx1IqA=
Subject: Re: [PATCH v3] xen: add support for automatic debug key actions in
 case of crash
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
References: <20201126080340.6154-1-jgross@suse.com>
 <22190c77-eb35-5b72-7d72-34800c3f052f@suse.com>
 <98c45abd-8796-088c-e2a6-9ad494beeb9e@xen.org>
 <59f126a3-f716-345b-b464-746e6156c15a@suse.com>
 <1e305cf6-aa14-54cc-a77d-88bb38ba4c6e@xen.org>
 <7271b2f4-816a-5541-5402-50ea29218d81@suse.com>
 <077f3e02-0e07-1549-cc41-62b42177e19c@suse.com>
 <699e48ea-8807-a1f3-d2b9-dc918913ede8@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9f377d5e-da9c-1300-8010-099ea57b020c@suse.com>
Date: Fri, 11 Dec 2020 11:44:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <699e48ea-8807-a1f3-d2b9-dc918913ede8@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.12.2020 11:22, Julien Grall wrote:
> Hi,
> 
> On 11/12/2020 07:24, Jan Beulich wrote:
>> On 11.12.2020 08:02, Jürgen Groß wrote:
>>> On 10.12.20 21:51, Julien Grall wrote:
>>>> Hi Jan,
>>>>
>>>> On 09/12/2020 14:29, Jan Beulich wrote:
>>>>> On 09.12.2020 13:11, Julien Grall wrote:
>>>>>> On 26/11/2020 11:20, Jan Beulich wrote:
>>>>>>> On 26.11.2020 09:03, Juergen Gross wrote:
>>>>>>>> When the host crashes it would sometimes be nice to have additional
>>>>>>>> debug data available which could be produced via debug keys, but
>>>>>>>> halting the server for manual intervention might be impossible due to
>>>>>>>> the need to reboot/kexec rather sooner than later.
>>>>>>>>
>>>>>>>> Add support for automatic debug key actions in case of crashes which
>>>>>>>> can be activated via boot- or runtime-parameter.
>>>>>>>>
>>>>>>>> Depending on the type of crash the desired data might be different, so
>>>>>>>> support different settings for the possible types of crashes.
>>>>>>>>
>>>>>>>> The parameter is "crash-debug" with the following syntax:
>>>>>>>>
>>>>>>>>      crash-debug-<type>=<string>
>>>>>>>>
>>>>>>>> with <type> being one of:
>>>>>>>>
>>>>>>>>      panic, hwdom, watchdog, kexeccmd, debugkey
>>>>>>>>
>>>>>>>> and <string> a sequence of debug key characters with '+' having the
>>>>>>>> special semantics of a 10 millisecond pause.
>>>>>>>>
>>>>>>>> So "crash-debug-watchdog=0+0qr" would result in special output in case
>>>>>>>> of watchdog triggered crash (dom0 state, 10 ms pause, dom0 state,
>>>>>>>> domain info, run queues).
>>>>>>>>
>>>>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>>>>> ---
>>>>>>>> V2:
>>>>>>>> - switched special character '.' to '+' (Jan Beulich)
>>>>>>>> - 10 ms instead of 1 s pause (Jan Beulich)
>>>>>>>> - added more text to the boot parameter description (Jan Beulich)
>>>>>>>>
>>>>>>>> V3:
>>>>>>>> - added const (Jan Beulich)
>>>>>>>> - thorough test of crash reason parameter (Jan Beulich)
>>>>>>>> - kexeccmd case should depend on CONFIG_KEXEC (Jan Beulich)
>>>>>>>> - added dummy get_irq_regs() helper on Arm
>>>>>>>>
>>>>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>>>>
>>>>>>> Except for the Arm aspect, where I'm not sure using
>>>>>>> guest_cpu_user_regs() is correct in all cases,
>>>>>>
>>>>>> I am not entirely sure to understand what get_irq_regs() is supposed to
>>>>>> returned on x86. Is it the registers saved from the most recent
>>>>>> exception?
>>>>>
>>>>> An interrupt (not an exception) sets the underlying per-CPU
>>>>> variable, such that interested parties will know the real
>>>>> context is not guest or "normal" Xen code, but an IRQ.
>>>>
>>>> Thanks for the explanation. I am a bit confused to why we need to give a
>>>> regs to handle_keypress() because no-one seems to use it. Do you have an
>>>> explanation?
>>>
>>> dump_registers() (key 'd') is using it.
>>>
>>>>
>>>> To add to the confusion, it looks like that get_irqs_regs() may return
>>>> NULL. So sometimes we may pass guest_cpu_regs() (which may contain
>>>> garbagge or a set too far).
>>>
>>> I guess this is a best effort approach.
>>
>> Indeed. If there are ways to make it "more best", we should of
>> course follow them. (Except before Dom0 starts, I'm afraid I
>> don't see though where garbage would come from. And even then,
>> just like for the idle vCPU-s, it shouldn't really be garbage,
>> or else this suggests missing initialization somewhere.)
> 
> So I decided to mimick what 'd' does to see what happen if this is 
> called early boot.

But this isn't really relevant here: If you need to deal with a
crash during boot, just don't specify these command line options
(and that's on top of Jürgen's indication that 'd' may not be
very useful to specify here anyway, albeit now that I think
about this I'm not so sure anymore - panic() only logs the local
CPUs registers iirc, while 'd' would log everyone's). Of course
Jürgen could go and limit honoring of the option to sufficiently
high SYS_STATE_*. In particular at least the x86 crash you've
observed is - afaict - from the is_idle_vcpu(current) check in
dump_execstate(), which requires init_idle_domain() to have run
before.

Jan


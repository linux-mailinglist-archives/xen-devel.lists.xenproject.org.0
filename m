Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC7B29EEBF
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 15:50:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14240.35310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY9FX-0003Rc-3W; Thu, 29 Oct 2020 14:49:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14240.35310; Thu, 29 Oct 2020 14:49:59 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY9FX-0003RD-08; Thu, 29 Oct 2020 14:49:59 +0000
Received: by outflank-mailman (input) for mailman id 14240;
 Thu, 29 Oct 2020 14:49:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kY9FV-0003R8-1q
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 14:49:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce6ff7da-f66b-4421-9bef-39a5746a9978;
 Thu, 29 Oct 2020 14:49:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BD03AAC1F;
 Thu, 29 Oct 2020 14:49:54 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kY9FV-0003R8-1q
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 14:49:57 +0000
X-Inumbo-ID: ce6ff7da-f66b-4421-9bef-39a5746a9978
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ce6ff7da-f66b-4421-9bef-39a5746a9978;
	Thu, 29 Oct 2020 14:49:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603982994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RAnW0bO+7Nb+T4ud5VCzhOmmIF4MQq+4zdr6XVq40h4=;
	b=bTjCw+V+pYWGjR1F2ulUrPtzQ38jccb6BwlnxdNhi4JBEQOcFg5ToF2/ZThywC4LzdgViF
	oMxDS/QlK4ND2ypnHubRZ7FrOqpWVPa/vSDfPaKgSjFY3aXRQKrwNp4BHkk8SqMhEuMq9V
	Fn4u7s8g26mRQ8osBbVrG6kK+77GqNU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id BD03AAC1F;
	Thu, 29 Oct 2020 14:49:54 +0000 (UTC)
Subject: Re: [PATCH] xen: add support for automatic debug key actions in case
 of crash
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201022143905.11032-1-jgross@suse.com>
 <977bab69-892c-d94d-d952-1a748f69d0b6@suse.com>
 <53732f8f-fe6d-91bd-4100-4b4d904a4073@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ed2f73e7-04cc-f568-f0b7-19c843a8d31b@suse.com>
Date: Thu, 29 Oct 2020 15:49:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <53732f8f-fe6d-91bd-4100-4b4d904a4073@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.10.2020 15:40, Jürgen Groß wrote:
> On 29.10.20 15:22, Jan Beulich wrote:
>> On 22.10.2020 16:39, Juergen Gross wrote:
>>> @@ -507,6 +509,41 @@ void __init initialize_keytable(void)
>>>       }
>>>   }
>>>   
>>> +#define CRASHACTION_SIZE  32
>>> +static char crash_debug_panic[CRASHACTION_SIZE];
>>> +static char crash_debug_hwdom[CRASHACTION_SIZE];
>>> +static char crash_debug_watchdog[CRASHACTION_SIZE];
>>> +static char crash_debug_kexeccmd[CRASHACTION_SIZE];
>>> +static char crash_debug_debugkey[CRASHACTION_SIZE];
>>> +
>>> +static char *crash_action[CRASHREASON_N] = {
>>> +    [CRASHREASON_PANIC] = crash_debug_panic,
>>> +    [CRASHREASON_HWDOM] = crash_debug_hwdom,
>>> +    [CRASHREASON_WATCHDOG] = crash_debug_watchdog,
>>> +    [CRASHREASON_KEXECCMD] = crash_debug_kexeccmd,
>>> +    [CRASHREASON_DEBUGKEY] = crash_debug_debugkey,
>>> +};
>>> +
>>> +string_runtime_param("crash-debug-panic", crash_debug_panic);
>>> +string_runtime_param("crash-debug-hwdom", crash_debug_hwdom);
>>> +string_runtime_param("crash-debug-watchdog", crash_debug_watchdog);
>>> +string_runtime_param("crash-debug-kexeccmd", crash_debug_kexeccmd);
>>> +string_runtime_param("crash-debug-debugkey", crash_debug_debugkey);
>>
>> In general I'm not in favor of this (or similar) needing
>> five new command line options, instead of just one. The problem
>> with e.g.
>>
>> crash-debug=panic:rq,watchdog:0d
>>
>> is that ',' (or any other separator chosen) could in principle
>> also be a debug key. It would still be possible to use
>>
>> crash-debug=panic:rq crash-debug=watchdog:0d
>>
>> though. Thoughts?
> 
> OTOH the runtime parameters are much easier addressable that way.

Ah yes, I can see this as a reason. Would make we wonder whether
command line and runtime handling may want disconnecting in this
specific case then. (But I can also see the argument of this
being too much overhead then.)

>>> +void keyhandler_crash_action(enum crash_reason reason)
>>> +{
>>> +    const char *action = crash_action[reason];
>>> +    struct cpu_user_regs *regs = get_irq_regs() ? : guest_cpu_user_regs();
>>> +
>>> +    while ( *action ) {
>>> +        if ( *action == '.' )
>>> +            mdelay(1000);
>>> +        else
>>> +            handle_keypress(*action, regs);
>>> +        action++;
>>> +    }
>>> +}
>>
>> I think only diagnostic keys should be permitted here.
> 
> While I understand that other keys could produce nonsense or do harm,
> I'm not sure we should really prohibit them. Allowing them would e.g.
> allow to do just a reboot without kdump for one type of crashes.

Ah yes, that's a fair point.

>>> --- a/xen/include/xen/kexec.h
>>> +++ b/xen/include/xen/kexec.h
>>> @@ -1,6 +1,8 @@
>>>   #ifndef __XEN_KEXEC_H__
>>>   #define __XEN_KEXEC_H__
>>>   
>>> +#include <xen/keyhandler.h>
>>
>> Could we go without this, utilizing the gcc extension of forward
>> declared enums? Otoh ...
>>
>>> @@ -82,7 +84,11 @@ void vmcoreinfo_append_str(const char *fmt, ...)
>>>   #define kexecing 0
>>>   
>>>   static inline void kexec_early_calculations(void) {}
>>> -static inline void kexec_crash(void) {}
>>> +static inline void kexec_crash(enum crash_reason reason)
>>> +{
>>> +    keyhandler_crash_action(reason);
>>> +}
>>
>> ... if this is to be an inline function and not just a #define,
>> it'll need the declaration of the function to have been seen.
> 
> And even being a #define all users of kexec_crash() would need to
> #include keyhandler.h (and I'm not sure there are any source files
> including kexec.h which don't use kexec_crash()).

About as many which do as ones which don't. But there's no
generally accessible header which includes xen/kexec.h, so perhaps
the extra dependency indeed isn't all this problematic.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ACC2D41CF
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 13:12:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48206.85236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmyJr-0001ir-P0; Wed, 09 Dec 2020 12:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48206.85236; Wed, 09 Dec 2020 12:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmyJr-0001iS-LI; Wed, 09 Dec 2020 12:11:43 +0000
Received: by outflank-mailman (input) for mailman id 48206;
 Wed, 09 Dec 2020 12:11:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kmyJq-0001iM-CW
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 12:11:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmyJl-00070h-9e; Wed, 09 Dec 2020 12:11:37 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmyJk-0007iu-TC; Wed, 09 Dec 2020 12:11:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=OOX2ZDO/DwRSwT9r6UxOEOqMKyeANE6eis42AXi/oaM=; b=Q89iRDJuarFdwfPrhFXOqNaesZ
	oAo+rr95I56u+wz56YWs6VD6e7o7TlISKKrKSeTTk3yXcNb6c5Ifdx3xPRMSQYyk2FVfMcS8WhgqB
	Zrs0zEOYs8bbIlFgJ7wcEa3O60j0o0Pwp7LRX4e/JSYQ3qHJDHbOfJ++eGh3vLrP7UbM=;
Subject: Re: [PATCH v3] xen: add support for automatic debug key actions in
 case of crash
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20201126080340.6154-1-jgross@suse.com>
 <22190c77-eb35-5b72-7d72-34800c3f052f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <98c45abd-8796-088c-e2a6-9ad494beeb9e@xen.org>
Date: Wed, 9 Dec 2020 12:11:33 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <22190c77-eb35-5b72-7d72-34800c3f052f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

Sorry for jumping late in the discussion.

On 26/11/2020 11:20, Jan Beulich wrote:
> On 26.11.2020 09:03, Juergen Gross wrote:
>> When the host crashes it would sometimes be nice to have additional
>> debug data available which could be produced via debug keys, but
>> halting the server for manual intervention might be impossible due to
>> the need to reboot/kexec rather sooner than later.
>>
>> Add support for automatic debug key actions in case of crashes which
>> can be activated via boot- or runtime-parameter.
>>
>> Depending on the type of crash the desired data might be different, so
>> support different settings for the possible types of crashes.
>>
>> The parameter is "crash-debug" with the following syntax:
>>
>>    crash-debug-<type>=<string>
>>
>> with <type> being one of:
>>
>>    panic, hwdom, watchdog, kexeccmd, debugkey
>>
>> and <string> a sequence of debug key characters with '+' having the
>> special semantics of a 10 millisecond pause.
>>
>> So "crash-debug-watchdog=0+0qr" would result in special output in case
>> of watchdog triggered crash (dom0 state, 10 ms pause, dom0 state,
>> domain info, run queues).
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> V2:
>> - switched special character '.' to '+' (Jan Beulich)
>> - 10 ms instead of 1 s pause (Jan Beulich)
>> - added more text to the boot parameter description (Jan Beulich)
>>
>> V3:
>> - added const (Jan Beulich)
>> - thorough test of crash reason parameter (Jan Beulich)
>> - kexeccmd case should depend on CONFIG_KEXEC (Jan Beulich)
>> - added dummy get_irq_regs() helper on Arm
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Except for the Arm aspect, where I'm not sure using
> guest_cpu_user_regs() is correct in all cases,

I am not entirely sure to understand what get_irq_regs() is supposed to 
returned on x86. Is it the registers saved from the most recent exception?

Cheers,


-- 
Julien Grall


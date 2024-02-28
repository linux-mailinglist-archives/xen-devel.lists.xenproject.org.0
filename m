Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D8986B2F9
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 16:22:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686714.1069082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfLkx-0004gL-JU; Wed, 28 Feb 2024 15:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686714.1069082; Wed, 28 Feb 2024 15:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfLkx-0004eo-GO; Wed, 28 Feb 2024 15:22:03 +0000
Received: by outflank-mailman (input) for mailman id 686714;
 Wed, 28 Feb 2024 15:22:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EdaL=KF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rfLkv-00046f-TJ
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 15:22:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1df411c1-d64d-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 16:22:00 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 41504225C1;
 Wed, 28 Feb 2024 15:21:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F322413A72;
 Wed, 28 Feb 2024 15:21:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id L9PGOZZP32UzAwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 28 Feb 2024 15:21:58 +0000
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
X-Inumbo-ID: 1df411c1-d64d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709133719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aqKuQZZeNejtV5JojVQkZFqH25IA5L/7ebKWxrvjISY=;
	b=V+tcPXcCGXrwo/CQyYNMzmDUZhdkSSaPBwq0yVz/eVRz8ElQtmNMsrdMvgf8K3nHL98NxH
	K4fSTCi3O8GutUaLUVE3SRZuApDo8pTTjDBIPAyc0AXFCE112I7gidjiFe6B/rcqz1i00Q
	eIvQwMvuAQti8sOpxNVNHyc9IGc3jjA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709133719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aqKuQZZeNejtV5JojVQkZFqH25IA5L/7ebKWxrvjISY=;
	b=V+tcPXcCGXrwo/CQyYNMzmDUZhdkSSaPBwq0yVz/eVRz8ElQtmNMsrdMvgf8K3nHL98NxH
	K4fSTCi3O8GutUaLUVE3SRZuApDo8pTTjDBIPAyc0AXFCE112I7gidjiFe6B/rcqz1i00Q
	eIvQwMvuAQti8sOpxNVNHyc9IGc3jjA=
Message-ID: <318818a3-4d7c-45ff-a656-067d12af555a@suse.com>
Date: Wed, 28 Feb 2024 16:21:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/12] xen/spinlock: add
 rspin_[un]lock_irq[save|restore]()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-6-jgross@suse.com>
 <411c0f54-67cd-4b12-83ec-218703045707@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <411c0f54-67cd-4b12-83ec-218703045707@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: ****
X-Spamd-Bar: ++++
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=V+tcPXcC
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [4.27 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 BAYES_SPAM(5.10)[100.00%];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.67)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Score: 4.27
X-Rspamd-Queue-Id: 41504225C1
X-Spam-Flag: NO

On 28.02.24 16:09, Jan Beulich wrote:
> On 12.12.2023 10:47, Juergen Gross wrote:
>> Instead of special casing rspin_lock_irqsave() and
>> rspin_unlock_irqrestore() for the console lock, add those functions
>> to spinlock handling and use them where needed.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> V2:
>> - new patch
> 
> In how far is this a necessary part of the series?

Not really necessary. It just seemed wrong to have an open coded
variant of rspin_lock_irqsave() and rspin_unlock_irqrestore().

> 
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -647,13 +647,15 @@ void show_stack_overflow(unsigned int cpu, const struct cpu_user_regs *regs)
>>   void show_execution_state(const struct cpu_user_regs *regs)
>>   {
>>       /* Prevent interleaving of output. */
>> -    unsigned long flags = console_lock_recursive_irqsave();
>> +    unsigned long flags;
>> +
>> +    rspin_lock_irqsave(&console_lock, flags);
>>   
>>       show_registers(regs);
>>       show_code(regs);
>>       show_stack(regs);
>>   
>> -    console_unlock_recursive_irqrestore(flags);
>> +    rspin_unlock_irqrestore(&console_lock, flags);
>>   }
>>   
>>   void cf_check show_execution_state_nonconst(struct cpu_user_regs *regs)
>> @@ -663,7 +665,7 @@ void cf_check show_execution_state_nonconst(struct cpu_user_regs *regs)
>>   
>>   void vcpu_show_execution_state(struct vcpu *v)
>>   {
>> -    unsigned long flags = 0;
>> +    unsigned long flags;
>>   
>>       if ( test_bit(_VPF_down, &v->pause_flags) )
>>       {
>> @@ -698,7 +700,7 @@ void vcpu_show_execution_state(struct vcpu *v)
>>   #endif
>>   
>>       /* Prevent interleaving of output. */
>> -    flags = console_lock_recursive_irqsave();
>> +    rspin_lock_irqsave(&console_lock, flags);
>>   
>>       vcpu_show_registers(v);
>>   
>> @@ -708,7 +710,7 @@ void vcpu_show_execution_state(struct vcpu *v)
>>            * Stop interleaving prevention: The necessary P2M lookups involve
>>            * locking, which has to occur with IRQs enabled.
>>            */
>> -        console_unlock_recursive_irqrestore(flags);
>> +        rspin_unlock_irqrestore(&console_lock, flags);
>>   
>>           show_hvm_stack(v, &v->arch.user_regs);
>>       }
>> @@ -717,7 +719,7 @@ void vcpu_show_execution_state(struct vcpu *v)
>>           if ( guest_kernel_mode(v, &v->arch.user_regs) )
>>               show_guest_stack(v, &v->arch.user_regs);
>>   
>> -        console_unlock_recursive_irqrestore(flags);
>> +        rspin_unlock_irqrestore(&console_lock, flags);
>>       }
>>   
> 
> I view these as layering violations; ...
> 
>> --- a/xen/drivers/char/console.c
>> +++ b/xen/drivers/char/console.c
>> @@ -120,7 +120,7 @@ static int __read_mostly sercon_handle = -1;
>>   int8_t __read_mostly opt_console_xen; /* console=xen */
>>   #endif
>>   
>> -static DEFINE_RSPINLOCK(console_lock);
>> +DEFINE_RSPINLOCK(console_lock);
> 
> ... this should remain static. The question therefore just is whether
> to omit this patch or ...
> 
>> @@ -1158,22 +1158,6 @@ void console_end_log_everything(void)
>>       atomic_dec(&print_everything);
>>   }
>>   
>> -unsigned long console_lock_recursive_irqsave(void)
>> -{
>> -    unsigned long flags;
>> -
>> -    local_irq_save(flags);
>> -    rspin_lock(&console_lock);
>> -
>> -    return flags;
>> -}
>> -
>> -void console_unlock_recursive_irqrestore(unsigned long flags)
>> -{
>> -    rspin_unlock(&console_lock);
>> -    local_irq_restore(flags);
>> -}
> 
> ... whether to retain these two functions as thin wrappers around the
> new, more generic construct.

I'd vote for the latter.


Juergen


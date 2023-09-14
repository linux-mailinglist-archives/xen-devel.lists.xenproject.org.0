Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4910E7A0E75
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 21:44:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602681.939398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgsG2-0001Tx-DI; Thu, 14 Sep 2023 19:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602681.939398; Thu, 14 Sep 2023 19:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgsG2-0001S0-9z; Thu, 14 Sep 2023 19:44:10 +0000
Received: by outflank-mailman (input) for mailman id 602681;
 Thu, 14 Sep 2023 19:44:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uqVP=E6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qgsG1-0001Rs-08
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 19:44:09 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 118505c0-5337-11ee-8788-cb3800f73035;
 Thu, 14 Sep 2023 21:44:07 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-401b5516104so14431425e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 12:44:07 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h4-20020a056000000400b00317909f9985sm2527404wrx.113.2023.09.14.12.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 12:44:07 -0700 (PDT)
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
X-Inumbo-ID: 118505c0-5337-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694720647; x=1695325447; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lnrFYwJRZv3VAf6epPjPF6IkOQ6a6ACAjJWuZuNpGHY=;
        b=Jy6p9yUzwjVFiePYawrXF/0yaUs+r9A8T04U+vAYJoufQadEXI0KYak1/q/oj9iP/F
         3oCqGhyaY0V3coFwj3ENRhjuh1WtC5Ga/IK1oFarvYPFEgnRUNbkj40HFrA/Q4u7pKTY
         CIYJxUddDAK+ueB4wH8WSfszp0Svgo5Xtthw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694720647; x=1695325447;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lnrFYwJRZv3VAf6epPjPF6IkOQ6a6ACAjJWuZuNpGHY=;
        b=pXkYcMkzM6Y0/XsVOeWEMpR62V0Fa1sUmVSl3wh7KpxCRb4/ZL7tgqw8swPDz2Uu3h
         vKpel1oImUo1lpywnAI4eheF+L6gl7or/7MNSFRJDbgoYZdglIRujnJR25kW8sORNgfm
         BUcUU4KfHLRwcGhGVAHchQdGSFI1yzxkgiXkzX7mQqkPouIsZVxsynokF+hUZIKbhKWx
         1e5Ka0V6EhSfsERgXFjX40cPan0Qcs77DdvrpX1ekwRwHtqyrq0qZ7RDOM+J3YLkXXJ0
         VcFvAGoTWSJ+T4oRO/t6Ql0lthkq89FmD6BlgbRWVz8vCosMODf3z0kr+1wtQSRqvdsN
         s2QQ==
X-Gm-Message-State: AOJu0YxowD198KBrqVMIoRQpBy7epwndMHOIc9qann7mEXfK3PJD2Dz+
	f5KbpZ9Wd04dBvfHhZxawzrL9A==
X-Google-Smtp-Source: AGHT+IFfxAI/zQB4PxTxxz/9a2O3vQW/qd9NUQldDxS6MVUJcphHPzGNyTfcOxlK6r4HNV1f9nj4jw==
X-Received: by 2002:a5d:614d:0:b0:31f:8a6d:e527 with SMTP id y13-20020a5d614d000000b0031f8a6de527mr4939778wrt.45.1694720647343;
        Thu, 14 Sep 2023 12:44:07 -0700 (PDT)
Message-ID: <fb9ec99d-9c76-82ff-9b82-22fff1a62c6c@citrix.com>
Date: Thu, 14 Sep 2023 20:44:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/8] x86/entry: Track the IST-ness of an entry for the
 exit paths
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
 <20230913202758.508225-7-andrew.cooper3@citrix.com>
 <762b58fe-a841-f92c-93a8-77dbb86bf118@suse.com>
In-Reply-To: <762b58fe-a841-f92c-93a8-77dbb86bf118@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/09/2023 10:32 am, Jan Beulich wrote:
> On 13.09.2023 22:27, Andrew Cooper wrote:
>> --- a/xen/arch/x86/x86_64/compat/entry.S
>> +++ b/xen/arch/x86/x86_64/compat/entry.S
>> @@ -117,8 +117,15 @@ compat_process_trap:
>>          call  compat_create_bounce_frame
>>          jmp   compat_test_all_events
>>  
>> -/* %rbx: struct vcpu, interrupts disabled */
>> +/* %rbx: struct vcpu, %r12: ist_exit, interrupts disabled */
>>  ENTRY(compat_restore_all_guest)
>> +
>> +#ifdef CONFIG_DEBUG
>> +        mov   %rsp, %rdi
>> +        mov   %r12, %rsi
>> +        call  check_ist_exit
>> +#endif
>> +
>>          ASSERT_INTERRUPTS_DISABLED
>>          mov   $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), %r11d
>>          and   UREGS_eflags(%rsp),%r11d
> Without having peeked ahead, is there any use of %r12 going to appear
> on this path? I thought it's only going to be restore_all_xen?

For now, we only need to change behaviour based on ist_exit in
restore_all_xen.

But, we do get here in IST context, and I'm not interested in having to
re-do the analysis to determine if this is safe.  ist_exit is a global
property of exiting Xen, so should be kept correct from the outset.

>
>> --- a/xen/arch/x86/x86_64/entry.S
>> +++ b/xen/arch/x86/x86_64/entry.S
>> @@ -142,10 +142,16 @@ process_trap:
>>  
>>          .section .text.entry, "ax", @progbits
>>  
>> -/* %rbx: struct vcpu, interrupts disabled */
>> +/* %rbx: struct vcpu, %r12: ist_exit, interrupts disabled */
>>  restore_all_guest:
>> -        ASSERT_INTERRUPTS_DISABLED
>>  
>> +#ifdef CONFIG_DEBUG
>> +        mov   %rsp, %rdi
>> +        mov   %r12, %rsi
>> +        call  check_ist_exit
>> +#endif
>> +
>> +        ASSERT_INTERRUPTS_DISABLED
>>          /* Stash guest SPEC_CTRL value while we can read struct vcpu. */
>>          mov VCPU_arch_msrs(%rbx), %rdx
>>          mov VCPUMSR_spec_ctrl_raw(%rdx), %r15d
> Even here I don't think I see a need for the addition. Plus if the check
> is warranted here, is it really necessary for it to live ahead of the
> interrupts-disabled check?

What makes you think there is a relevance to the order of two assertions
in fully irqs-off code?

The checks are in the same order as the comment stating the invariants.

>  Further, seeing that being marco-ized, would
> it make sense to have a CHECK_IST_EXIT macro in case more than a single
> use site remains?
>
>> @@ -1087,6 +1100,10 @@ handle_ist_exception:
>>  .L_ist_dispatch_done:
>>          mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
>>          mov   %bl, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
>> +
>> +        /* This is an IST exit */
>> +        mov   $1, %r12
>> +
>>          cmpb  $X86_EXC_NMI, UREGS_entry_vector(%rsp)
>>          jne   ret_from_intr
> Could I talk you into using a less than 7-byte insn here? "or $1, %r12"
> would be 4 bytes, "mov $1, %r12b", "inc %r12", and "not %r12" would be
> just 3. All have certain downsides, yes, but I wonder whether switching
> isn't worth it. Even "mov $1, %r12d" would be at least one byte less,
> without any downsides. And the OR and INC variants would allow the
> remaining 63 bits to be used for another purpose down the road.

This is a 2Hz-at-most path.  The size of one instruction is not
something to care about.

But I did mean to use the %r12d form, so I'll go with that.  Everything
else depends on the behaviour of earlier logic.

~Andrew


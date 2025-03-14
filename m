Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9A5A60CB9
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 10:05:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914116.1319922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0yf-0007e5-0e; Fri, 14 Mar 2025 09:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914116.1319922; Fri, 14 Mar 2025 09:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0ye-0007bn-Tp; Fri, 14 Mar 2025 09:05:12 +0000
Received: by outflank-mailman (input) for mailman id 914116;
 Fri, 14 Mar 2025 09:05:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXxa=WB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tt0yd-0007bh-NF
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 09:05:11 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6df302e5-00b3-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 10:05:09 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so11590885e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 02:05:09 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df31f6sm4864344f8f.6.2025.03.14.02.05.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 02:05:08 -0700 (PDT)
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
X-Inumbo-ID: 6df302e5-00b3-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741943109; x=1742547909; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HJ7ML+KrNh5zi+ddsS8Tphtv9HdgEe4FWkzQk0w/fJk=;
        b=Wrf/y41prLstCOl/s89XWTebGLeCStN/6uFV6KUfp4RCU/uCDyX8MXwjXiPoCJYFyw
         lge+I2PFb3vW5fnj7244dFoGWPiBG4tqI+Mz2pLoECObD1ZdDgmlZLBb9pLxfQ2RaJlA
         9A9F8TUYtkXECihgqU09m61CBGFGmW8cFvVKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741943109; x=1742547909;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJ7ML+KrNh5zi+ddsS8Tphtv9HdgEe4FWkzQk0w/fJk=;
        b=aZXAh1kGHrom2F7flGfyn21y2imC4/OQ98/JmDevVf3QoILW4neey3HkTv98uOWbxT
         Ul8AORX+v4hfy58bX173TctcInhbbwfVZ8TrbCWAOZm2x7tfiXdxByo2Zgps77XVD6G2
         Ar3dQoSb1PMdIqq2vuAX42mhqnvHXrSBKrGfnWhcuc60S1gUuiNOu5B8bHDfBFmIni+L
         iAjt7RFa4Y4bwQ9wt0rlbAS3FKpi3oJjt2aKxkw6qAr0vWUGtNi4SrvmB6zmPOfMaKLg
         fin14tDxU3iC4s0rlNeGjJqm2fRw2QVc5dqG/UGEMlQnZb15bFmU2zHsmUk2cCo8H2gi
         cEPg==
X-Forwarded-Encrypted: i=1; AJvYcCXpnDKf4ss9bhZCorP8Aki4918v5a84ZDXT8Y76ABg1mIepxCq9M4+CXHhQ3JfyXaAwb6KLzrtjEBY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPEMyjyLk4TF8bLk4FiIKwMIyAsD3Fr77gucGBv4mLZ3I0hTzu
	cl+2jQlrREZ/PwGUn27iWjb5zU6Orrfh3f+4inpJyeSWrlWk99GMwaY4kbp190s=
X-Gm-Gg: ASbGnctIECNVgcnOqf5PVT2DGHlMU5apWw7ROLvs7m5n48cuDp+zIhobNPABXHinuXS
	irHQWKbb3mju7dycvOXeovYyXzA2V+GhdZhKkvWGvO/9qlItU2SRoe5SGsc32EKAi3d7+zFTI5F
	BycHayOcK0PW+83X5EgUMHKnPaf4+HYc9CZt6+8m/mAOzPBjw1Jw5jAS+Iz9doEx5DpDfr/74x1
	/QsqWLChbfbhEq3F8BW7L330YM1qKu0AO4IRDetP4TQChkVvzuFDbGBttg/oQXqwADqvwpuCwR7
	gqFt/F4mR+XAFDIL5Jt+3n4qc1E6tX4tyAqNZtTKcAWkQBql61z/j/MUKGumAC1V5U3wDkMjrcg
	0N03PtvjL
X-Google-Smtp-Source: AGHT+IEkouLxdjnxDcBgwoh3uYSbDDJ/aSBFqLFgJ/AUNUSDzk7Nm4J2lh8v0xg+pvFWgi4f4rWGFA==
X-Received: by 2002:a5d:6d8f:0:b0:391:48d4:bcf2 with SMTP id ffacd0b85a97d-3971d5227d9mr1802859f8f.12.1741943108701;
        Fri, 14 Mar 2025 02:05:08 -0700 (PDT)
Message-ID: <dd147c79-055e-4a94-bb23-4c59821d520a@citrix.com>
Date: Fri, 14 Mar 2025 09:05:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] x86/wait: prevent duplicated assembly labels
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250313153029.93347-1-roger.pau@citrix.com>
 <20250313153029.93347-3-roger.pau@citrix.com>
 <8c58e1d6-b591-4211-9364-fa586a5c6d2e@suse.com>
 <Z9PpI8KQnA_gHy9e@macbook.local>
 <729fe31f-69d2-4b4f-8f2b-ac507a65fa27@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <729fe31f-69d2-4b4f-8f2b-ac507a65fa27@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/03/2025 8:44 am, Jan Beulich wrote:
> On 14.03.2025 09:30, Roger Pau Monné wrote:
>> On Fri, Mar 14, 2025 at 09:24:09AM +0100, Jan Beulich wrote:
>>> On 13.03.2025 16:30, Roger Pau Monne wrote:
>>>> When enabling UBSAN with clang, the following error is triggered during the
>>>> build:
>>>>
>>>> common/wait.c:154:9: error: symbol '.L_wq_resume' is already defined
>>>>   154 |         "push %%rbx; push %%rbp; push %%r12;"
>>>>       |         ^
>>>> <inline asm>:1:121: note: instantiated into assembly here
>>>>     1 |         push %rbx; push %rbp; push %r12;push %r13; push %r14; push %r15;sub %esp,%ecx;cmp $4096, %ecx;ja .L_skip;mov %rsp,%rsi;.L_wq_resume: rep movsb;mov %rsp,%rsi;.L_skip:pop %r15; pop %r14; pop %r13;pop %r12; pop %rbp; pop %rbx
>>>>       |                                                                                                                                ^
>>>> common/wait.c:154:9: error: symbol '.L_skip' is already defined
>>>>   154 |         "push %%rbx; push %%rbp; push %%r12;"
>>>>       |         ^
>>>> <inline asm>:1:159: note: instantiated into assembly here
>>>>     1 |         push %rbx; push %rbp; push %r12;push %r13; push %r14; push %r15;sub %esp,%ecx;cmp $4096, %ecx;ja .L_skip;mov %rsp,%rsi;.L_wq_resume: rep movsb;mov %rsp,%rsi;.L_skip:pop %r15; pop %r14; pop %r13;pop %r12; pop %rbp; pop %rbx
>>>>       |                                                                                                                                                                      ^
>>>> 2 errors generated.
>>>>
>>>> The inline assembly block in __prepare_to_wait() is duplicated, thus
>>>> leading to multiple definitions of the otherwise unique labels inside the
>>>> assembly block.  GCC extended-asm documentation notes the possibility of
>>>> duplicating asm blocks:
>>>>
>>>>> Under certain circumstances, GCC may duplicate (or remove duplicates of)
>>>>> your assembly code when optimizing. This can lead to unexpected duplicate
>>>>> symbol errors during compilation if your asm code defines symbols or
>>>>> labels. Using ‘%=’ (see AssemblerTemplate) may help resolve this problem.
>>>> Move the assembly blocks that deal with saving and restoring the current
>>>> CPU context into it's own explicitly non-inline functions.  This prevents
>>>> clang from duplicating the assembly blocks.  Just using noinline attribute
>>>> seems to be enough to prevent assembly duplication, in the future noclone
>>>> might also be required if asm block duplication issues arise again.
>>> Wouldn't it be a far easier / less intrusive change to simply append %= to
>>> the label names?
>> That won't work AFAICT, as the inline asm in check_wakeup_from_wait()
>> won't be able to make a jump to the .L_wq_resume label defined in the
>> __prepare_to_wait() assembly block if the label is declared as
>> .L_wq_resume%=.
>>
>> Also we want to make sure there's a single .L_wq_resume seeing how
>> check_wakeup_from_wait() uses it as the restore entry point?
> Hmm, yes on both points; the %= would only work for .Lskip. Have you gained
> understanding why there is this duplication? The breaking out of the asm()
> that you do isn't going to be reliable, as in principle the compiler is
> still permitted to duplicate stuff. Afaict the only reliable way is to move
> the code to a separate assembly file (with the asm() merely JMPing there,
> providing a pseudo-return-address by some custom means). Or to a file-scope
> asm(), as those can't be duplicated.

See the simplified example in
https://github.com/llvm/llvm-project/issues/92161

When I debugged this a while back, The multiple uses of wqv->esp (one
explicit after the asm, one as an asm parameter) gain pointer
sanitisation, so the structure looks like:

    ...
    if ( bad pointer )
        __ubsan_report();
    asm volatile (...);
    if ( bad pointer )
        __ubsan_report();
    ...

which then got transformed to:

    if ( bad pointer )
    {
        __ubsan_report();
        asm volatile (...);
        __ubsan_report();
    }
    else
        asm volatile (...);

~Andrew


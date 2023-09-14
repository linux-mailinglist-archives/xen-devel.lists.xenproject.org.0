Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C759E7A0E7F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 21:49:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602686.939408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgsLN-0002z2-Vu; Thu, 14 Sep 2023 19:49:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602686.939408; Thu, 14 Sep 2023 19:49:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgsLN-0002x2-Sz; Thu, 14 Sep 2023 19:49:41 +0000
Received: by outflank-mailman (input) for mailman id 602686;
 Thu, 14 Sep 2023 19:49:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uqVP=E6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qgsLM-0002wv-BH
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 19:49:40 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d66fba2f-5337-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 21:49:38 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3ff1c397405so14888575e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 12:49:38 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d628f000000b0031f729d883asm2549357wru.42.2023.09.14.12.49.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 12:49:37 -0700 (PDT)
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
X-Inumbo-ID: d66fba2f-5337-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694720978; x=1695325778; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7A4PeC+rd8LSHW0uKuWhJ/8TcslGyjVfH6s8/VssAec=;
        b=ltKNPLl4Rk3v7ptQYCXjf94c2k2M4GiFkRrRQpK1NvIx18dEIe34KsyROo/MwaS3Y1
         cPAlZ+BpIZdz91uvyF7W8NTMsraFU0q9K4cykJw0Y4TWhUmy2q8vP54qHnpHoc0rDrCD
         ApUEN4VABbau8f59kDhmlauv8BtJKBOXYNN4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694720978; x=1695325778;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7A4PeC+rd8LSHW0uKuWhJ/8TcslGyjVfH6s8/VssAec=;
        b=vDfcPE8UHotLESJCtcxQPqGjNNz3BkJWCYtMGPPA9247Rcxz8qjzVx6IQif1frc0ap
         ut7UXGSMn3iwBObyH1ste8isC0oNCA5NJtyF3kI9qCV6h3/rung14h6URAbYuUgCZQ2h
         v5ic7mu+Hye/UcrMvyEuID8M4XQ0cwKoenBD5qc656jqLmHf4n1wqnLObJUQkLC9QR/y
         stqPNt5eh70VIssELBQD3LxfRBYQY0ghAZc4Oo5wKxXS2CjrMVEhW+UcGtgJz61Zv24l
         8qQE9xTSUgttL9LT5h+sLtDNgH0vO89eVPOV/mRm8jiwYzLBcaJYGyEc1SoQxpc7eHvt
         ABng==
X-Gm-Message-State: AOJu0Ywdtes93TZi1cnNYxrvQlbke7yianJNSh3qiAqGWcuksr0/A46B
	kPO8ycQzB93lrQY32s2EXJWKwg==
X-Google-Smtp-Source: AGHT+IHARt0QTuVygXNlB0sCBJ/cgrhCyle/zyqLD9rufZCO8vLGcz1oZtauJ4a+PwRMIIteMUIW8Q==
X-Received: by 2002:a05:600c:cc:b0:3fe:1db2:5179 with SMTP id u12-20020a05600c00cc00b003fe1db25179mr5385625wmm.19.1694720977712;
        Thu, 14 Sep 2023 12:49:37 -0700 (PDT)
Message-ID: <22864483-9cb8-7220-f82e-883fd2ef617a@citrix.com>
Date: Thu, 14 Sep 2023 20:49:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 7/8] x86/spec-ctrl: Issue VERW during IST exit to Xen
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
 <20230913202758.508225-8-andrew.cooper3@citrix.com>
 <f771260c-feed-9183-0c0c-308f517e09b4@suse.com>
In-Reply-To: <f771260c-feed-9183-0c0c-308f517e09b4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/09/2023 11:01 am, Jan Beulich wrote:
> On 13.09.2023 22:27, Andrew Cooper wrote:
>> There is a corner case where e.g. an NMI hitting an exit-to-guest path after
>> SPEC_CTRL_EXIT_TO_* would have run the entire NMI handler *after* the VERW
>> flush to scrub potentially sensitive data from uarch buffers.
>>
>> In order to compensate, issue VERW when exiting to Xen from an IST entry.
>>
>> SPEC_CTRL_EXIT_TO_XEN already has two reads of spec_ctrl_flags off the stack,
>> and we're about to add a third.  Load the field into %ebx, and list the
>> register as clobbered.
>>
>> %r12 has been arranged to be the ist_exit signal, so add this as an input
>> dependency and use it to identify when to issue a VERW.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> While looking technically okay, I still have a couple of remarks:
>
>> --- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
>> +++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
>> @@ -344,10 +344,12 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
>>   */
>>  .macro SPEC_CTRL_EXIT_TO_XEN
>>  /*
>> - * Requires %r14=stack_end
>> - * Clobbers %rax, %rcx, %rdx
>> + * Requires %r12=ist_exit, %r14=stack_end
>> + * Clobbers %rax, %rbx, %rcx, %rdx
> While I'd generally be a little concerned of the growing dependency and
> clobber lists, there being a single use site makes this pretty okay. The
> macro invocation being immediately followed by RESTORE_ALL effectively
> means we can clobber almost everything here.
>
> As to register usage and my comment on patch 5: There's no real need
> to switch %rbx to %r14 there if I'm not mistaken

As said, it's about consistency of the helpers.


>>   */
>> -    testb $SCF_ist_sc_msr, STACK_CPUINFO_FIELD(spec_ctrl_flags)(%r14)
>> +    movzbl STACK_CPUINFO_FIELD(spec_ctrl_flags)(%r14), %ebx
>> +
>> +    testb $SCF_ist_sc_msr, %bl
>>      jz .L\@_skip_sc_msr
>>  
>>      /*
>> @@ -358,7 +360,7 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
>>       */
>>      xor %edx, %edx
>>  
>> -    testb $SCF_use_shadow, STACK_CPUINFO_FIELD(spec_ctrl_flags)(%r14)
>> +    testb $SCF_use_shadow, %bl
>>      jz .L\@_skip_sc_msr
>>  
>>      mov STACK_CPUINFO_FIELD(shadow_spec_ctrl)(%r14), %eax
>> @@ -367,8 +369,16 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
>>  
>>  .L\@_skip_sc_msr:
>>  
>> -    /* TODO VERW */
>> +    test %r12, %r12
>> +    jz .L\@_skip_ist_exit
>> +
>> +    /* Logically DO_SPEC_CTRL_COND_VERW but without the %rsp=cpuinfo dependency */
>> +    testb $SCF_verw, %bl
>> +    jz .L\@_verw_skip
>> +    verw STACK_CPUINFO_FIELD(verw_sel)(%r14)
>> +.L\@_verw_skip:
> Nit: .L\@_skip_verw would be more consistent with the other label names.

So it would.  I'll tweak.

~Andrew


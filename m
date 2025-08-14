Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FC8B27001
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 22:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082466.1442314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umeGp-0008UI-4L; Thu, 14 Aug 2025 20:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082466.1442314; Thu, 14 Aug 2025 20:09:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umeGp-0008Rw-12; Thu, 14 Aug 2025 20:09:55 +0000
Received: by outflank-mailman (input) for mailman id 1082466;
 Thu, 14 Aug 2025 20:09:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mOIo=22=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umeGn-0008Rq-Eh
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 20:09:53 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2f21ee8-794a-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 22:09:52 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45a1b0990b2so8590425e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 13:09:52 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c6bc85csm32396155e9.5.2025.08.14.13.09.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 13:09:50 -0700 (PDT)
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
X-Inumbo-ID: a2f21ee8-794a-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755202191; x=1755806991; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2C3Bpq/5YK7rjuqCAASb3WVo7vUPUKLoHP7HHauFe24=;
        b=CMAePYvfY66chLaAI2BJnjx+3y4qJNhXeOeQiB0Dz+jJiLY1LwzO0N8E9ecqiJ8Lyv
         bflrLAXwcRlGhRenT8k2HCvmEk5YDjkT3d5Lg3xYeDQUrWOMnXI+qYkYuDo0ZzzdX0Mq
         tIiaqb5deQJKCdVeFmE/6gj5Hm6f3fPLAEk/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755202191; x=1755806991;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2C3Bpq/5YK7rjuqCAASb3WVo7vUPUKLoHP7HHauFe24=;
        b=HyWIou2HYooFX8n+iWE8YvmQ2yj9s/ri49tL529pypq4l4EQluaRH0G3kX1rD7U/PM
         Let5KkPjIMaIho7Fs0EhHbyclGuEnQONurt+f+42SsTLOiBwBrbNCIKPpL+wHTv+GVwl
         LXiABkeT0v72GPpZpGHxSUFqUsemxmuB/LeSZHOwmPnAA11dyt/GTaBxRNvaOGDEG40L
         4GIofeD71q3f9Q7i2Zfp9+/GegHQ+QAiuPJ3jIO1ECaA4sdGaZXz+IUiH2psax9JA3F6
         LgERLTpj5PAhrJUtkNhN7oTfMhPElkn0pCEIOltmhzB8iBFd7PqTECT2xzDAgV58HtVS
         B0/w==
X-Forwarded-Encrypted: i=1; AJvYcCXC2EwIu0GI8vraKxpwEhR8V0FDqDyQ+kQrJmhlNbZV86fgeqHrBFfE4f7z430YS5cNe97sB064GBQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHYYynPMF2WZlR+QiKNBBwVVSVtCVQd2TQ5etypYc/XGp0NpfO
	JV7hIWIq3z4fQEAMcQXccZTJGMH8+cFzQOsHUYvQNSLXf6YFFpIZfa/rI20OrV/LCho=
X-Gm-Gg: ASbGncsk8zk0YrS2SSZ/fqTptYl3N4HyhN+aduGXRub58HOGsQvA5nQ52yqvoZ4veHD
	94mWX387rymt0b27zpmtH9q9yePPkk5fohxt5jinLK0wa12hpDk/x9UuCAtYbcKA2/sMr86dDGc
	RaDhc1oKCeTnIKTAI4WU+WJJYSwHdQw4oeRmVNdQGhYZCsy6+QzTE3S7wwYAa1VgVJhR3y5SDEW
	A6l8Tv3hux0TMKL1fSryJ3OOoId4NpUoc6pqEdsmgpSRhEJ1IlaSL1LO9N/GzSaBowgQooR3jBg
	NeSSPupBgiCSoapihPdX8Avch3tGQbbVjLSuWlrYd/yKBKso0pN+OEwQA26011Igi1bj3lG9oC2
	u9RhyoUiWBXDwOzsdkCQCOlea2weSTwFKGvOcmGGWzQQpXqe5YLoLIDvSilV5IPPfJJz8
X-Google-Smtp-Source: AGHT+IH0TCP/R0AjIEQJyrxlL2CgdDpSFZSGg8SiwhDl3plTjuPkCxzzQKovUh/daQyl44BTWBxzFg==
X-Received: by 2002:a05:600c:4e93:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-45a1b668299mr42064945e9.30.1755202191279;
        Thu, 14 Aug 2025 13:09:51 -0700 (PDT)
Message-ID: <757e3b87-bb4f-410a-84b7-cf3607bf3eb3@citrix.com>
Date: Thu, 14 Aug 2025 21:09:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/22] x86/boot: Use RSTORSSP to establish SSP
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-20-andrew.cooper3@citrix.com>
 <5ad64534-514c-412a-b2a2-23adaf835f60@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5ad64534-514c-412a-b2a2-23adaf835f60@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/08/2025 4:11 pm, Jan Beulich wrote:
> On 08.08.2025 22:23, Andrew Cooper wrote:
>> Under FRED, SETSSBSY is unavailable, and we want to be setting up FRED prior
>> to setting up shadow stacks.  As we still need Supervisor Tokens in IDT mode,
>> we need mode-specific logic to establish SSP.
>>
>> In FRED mode, write a Restore Token, RSTORSSP it, and discard the resulting
>> Previous-SSP token.
>>
>> No change outside of FRED mode.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Why is it that in patch 17 you could use identical code, but here you can't?

This caught me out at first too.

For S3, we're going from "no shadow stack" to "back to where we were on
an active shadow stack".  All we need to do is get saved_ssp back into
the SSP register.

Here, we're going from "no shadow stack" to "on a good, empty, shadow
stack".  For FRED we only need to load a value into SSP, but in IDT mode
we must also arrange to create a busy Supervisor Token on the base of
the stack.

We could in principle conditionally write a busy supervisor token, then
unconditionally RSTORSSP, but that's even more complicated to follow IMO.

It also flips around our position of "clean the busy bit on S3/hotplug"
to "set it even on first-bringup".





>
>> @@ -912,10 +913,30 @@ static void __init noreturn reinit_bsp_stack(void)
>>  
>>      if ( cpu_has_xen_shstk )
>>      {
>> -        wrmsrl(MSR_PL0_SSP,
>> -               (unsigned long)stack + (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8);
> Does this removal perhaps belong elsewhere, especially with "No change
> outside of FRED mode" in the description?

This is the "Updating reinit_bsp_stack() is deferred until later." note
in the previous patch.

This hunk was illegible without the split, although I have to admit that
I can't quite remember why now.

~Andrew


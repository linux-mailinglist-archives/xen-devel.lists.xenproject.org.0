Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1456984CC25
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 14:56:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677645.1054376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXiP3-0002mn-Vm; Wed, 07 Feb 2024 13:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677645.1054376; Wed, 07 Feb 2024 13:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXiP3-0002kh-SU; Wed, 07 Feb 2024 13:55:53 +0000
Received: by outflank-mailman (input) for mailman id 677645;
 Wed, 07 Feb 2024 13:55:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t7Cu=JQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rXiP2-0002kb-Mw
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 13:55:52 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a2aa67a-c5c0-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 14:55:50 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-55783b7b47aso897589a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 05:55:50 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v21-20020aa7d9d5000000b00560ada2df6dsm685560eds.45.2024.02.07.05.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 05:55:49 -0800 (PST)
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
X-Inumbo-ID: 9a2aa67a-c5c0-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707314150; x=1707918950; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qZ+r8dd1O25QMrSpy4XNymKw2jbC121Nj8siOIzmWuQ=;
        b=T/N0pcIrSwBe2kdvGXThiIxF+Fjt5gjJXQJwVxdt5TsXNapWR4OBkCRNpYg2yHFSED
         tFIrY+LejbEsnWjsNaMfx9UrqQyS9dilKSDdiqn0uoHZ0Q2iEJv2KPI1zNzj6O955yL8
         PQjcMS74F7WMpK2oxO1b5jDcFnECiVXjrTeGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707314150; x=1707918950;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qZ+r8dd1O25QMrSpy4XNymKw2jbC121Nj8siOIzmWuQ=;
        b=qGhR1WdxGmc5Yr+HbylqHoqnziwpYJ6GmG3pC53BvsOpICow05YD5NckqbLzDQm//Y
         W9lY0WMOLgTwH7lEmnr45lCEGGNDRZOG9oiEVgwxdZpJjEB4upGTzUUaSrgADIj6J0/t
         rh6cJMwrBU3SCek0qlT50aALloYVbZ7YwRW7PU4pm1U7ki6yvJk1DaPc5fmhrjBCnOAy
         aeS2x4X0XE3JOiMHi5dc5aW2GEzVaaYew9o7DrGfoB4ScxYinDu7KpWEGr4kiWB4Tgeu
         OSDoGQkRgy0L42FWHUOWlMRvKhKIYpGoCoeMeehKEtElFEj6mPTWZ5gfbFJrC5FeE+hT
         sMvg==
X-Forwarded-Encrypted: i=1; AJvYcCVOnCfQg1OaffMwY65pyaxeA0Sr6+Mc3/H1ftNbvHv8gsGHGPHCmv/Nuq63ZHihgnUzadco89A5aQOXmg7H/PirbUz8fkkKSv7JwLyY3J0=
X-Gm-Message-State: AOJu0YyuBF+ioiL8dnNEdxebK2faRftU1Uwiari7BdTCoQDuP0kXPJcV
	v8JkJ+n1apy6co9e/4aIOd0IBEKMxOEQV9VdZZFG6A6rpQL1e7cHoTy7nKzxzaP+qBd1hFx0QI8
	H
X-Google-Smtp-Source: AGHT+IFzA2Z9+raem4TmwhFovXnrhUQPRvfB1YkBIJ25NO5aOnL0y1mKqYXf27LSYBiFa9QcCbilPA==
X-Received: by 2002:aa7:df11:0:b0:560:8fb7:a721 with SMTP id c17-20020aa7df11000000b005608fb7a721mr4371322edy.13.1707314150173;
        Wed, 07 Feb 2024 05:55:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXpuRur2D4wGj3oiGpLI+90YZNb4PfccnuCJx30/sGSmjdniPiwPNWJ3XYIZoI/Snn7nw96IlSFU9z8Y+1JiULF0x4uqP+z7ktBk3O73EG0rmOESniMsvSR1MvCdkkE+PFVvkZLvQTVCHTNRfnKLRG6ezw3mr2EWQyYuOP4U3S7fIHQhcqw3U9CFgGJWLQvVnk1Yk/3GjgL2PK0nrajEuOm+yXlwxBe3oGZwpc1
Message-ID: <c11bd472-fc43-49c5-8482-4fc7ed836269@citrix.com>
Date: Wed, 7 Feb 2024 13:55:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] VMX: convert entry point annotations
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <3ba82c3a-ff95-43d0-8672-a63b23bc2cdc@suse.com>
 <5fc304c0-be1f-46dd-a783-4030ec76a2f8@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5fc304c0-be1f-46dd-a783-4030ec76a2f8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/02/2024 1:37 pm, Jan Beulich wrote:
> Use the generic framework from xen/linkage.h.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v6: New.
>
> --- a/xen/arch/x86/hvm/vmx/entry.S
> +++ b/xen/arch/x86/hvm/vmx/entry.S
> @@ -24,7 +24,7 @@
>  #define VMRESUME     .byte 0x0f,0x01,0xc3
>  #define VMLAUNCH     .byte 0x0f,0x01,0xc2
>  
> -ENTRY(vmx_asm_vmexit_handler)
> +FUNC(vmx_asm_vmexit_handler)
>          SAVE_ALL
>  
>          mov  %cr2,%rax
> @@ -132,7 +132,7 @@ UNLIKELY_END(realmode)
>          call vmx_vmentry_failure
>          jmp  .Lvmx_process_softirqs
>  
> -ENTRY(vmx_asm_do_vmentry)
> +LABEL(vmx_asm_do_vmentry)

This really is a function, not a label.

xen.git/xen$ git grep vmx_asm_do_vmentry
arch/x86/hvm/vmx/entry.S:135:ENTRY(vmx_asm_do_vmentry)
arch/x86/hvm/vmx/vmcs.c:1855:void noreturn vmx_asm_do_vmentry(void);
arch/x86/hvm/vmx/vmcs.c:1929:    reset_stack_and_jump(vmx_asm_do_vmentry);

It is giant mess, of two functions forming part of the same loop.

Considering that you declines to take CODE, I don't know what to
suggest.  The point of CODE, distinct to FUNC, was to identify the
places where weird things were going on, and this absolutely counts.

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 853AB9D9C35
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 18:13:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843934.1259505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFz84-0003CK-Us; Tue, 26 Nov 2024 17:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843934.1259505; Tue, 26 Nov 2024 17:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFz84-00039m-RB; Tue, 26 Nov 2024 17:13:36 +0000
Received: by outflank-mailman (input) for mailman id 843934;
 Tue, 26 Nov 2024 17:13:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zdLj=SV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tFz83-00039g-DA
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 17:13:35 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c234db45-ac19-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 18:13:30 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5d01db666ceso5834926a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 09:13:30 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01d3fc93fsm5302113a12.67.2024.11.26.09.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 09:13:29 -0800 (PST)
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
X-Inumbo-ID: c234db45-ac19-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzUiLCJoZWxvIjoibWFpbC1lZDEteDUzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImMyMzRkYjQ1LWFjMTktMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjQxMjEwLjU3OTUxOCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732641210; x=1733246010; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K3BFw86DvVDmUcV94J2lC3byHlePeYq8mIg48blZRq0=;
        b=ZMaiWNLVWHlwa9D1wTS220ucZSf8/ZhMsCSBkdPGYVUamkhLIt8PorWYBwxvA0BAE1
         nuipuJplZCnY9b0E4J/+1CpHltnhQdJeIV1QlLIbLxtXGY8XaLYle/3lI+RW5yvHcYkf
         EdQ6j6YQKxdNh1jlkcKed9PMjY2l6YNZUPQgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732641210; x=1733246010;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3BFw86DvVDmUcV94J2lC3byHlePeYq8mIg48blZRq0=;
        b=DPPne3wWvqEt4J6+yS1tV3M3bX7olPRwZw4jcWmYhCVLrOiaFHCJSXSt6TYm/3Ag69
         2wxOKBULwiwe8M1+qX0bdbkiXTheF9NXbm5tiPRGO2gFiuok5b5JHKyT/hyznxmqt+hL
         6d7ALU3KX3TGgFMC4TPv1FQKHrKTynrWT4jhxWDq/asXGjgRWLYeVsKr5ewJRjUW9fic
         +nvDnnV9GXXgvNORnvZQPV3fbhlb12m/xUlfg/8xE3eLkwW/0dOEq7TkGTvJf8pttWsx
         jeyYo5ldQjhXsKqIhI1TrsoYICo+FgOuS2YoiIKakDFkKia16diwKIOLThjFPDZg7hgA
         Iksg==
X-Forwarded-Encrypted: i=1; AJvYcCW1Cq4c7yF+pmI/MCdU7h6uaXN3/fowJWipOR5eMNAvudmM6kKIMYtH2ekK8OEVDE+TpDVUM0F6Djw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywrt6yb170aDOrejl4zrMXWkWMzshih3rZNJjPm/rqd2BtF7K0I
	an3J4iSDRo6adnCxk9BmChx6HVnuj8YlRCh8/ONfszUnnEEREh+JOFZXLP4SDUVpyOiTMX9j1Oy
	3
X-Gm-Gg: ASbGncuO4sfkO3PsCridQSyn7S68hHEdcYRL4BmRaUazMVNSZ46ZGpMZ8qW/jUOSVxG
	u+Y+NgYTcBMlHIQaL4L7odgXUbuQCxCJv3ISw9e3XnKL0zoBqrj/DXpehwa0716fDiWriQhje7Z
	oB/wMvD+J1r9oOJyhH7AzBwjENNkJwVrzoRUFuYkzYZyN1ldeiAJB9WfUIiPND1/qDezVuNwNfV
	FWx4Z/efmTggKP4gd40xN+VvC0B/LZdI0E8vjRW8BSkwLSUg+G8n85DRzw1Jfg=
X-Google-Smtp-Source: AGHT+IG8DJ9sClJ+l7KVFcgKex3O5zp/DO0WCF35QDDORtvrRs77HeWYEOksm5y2zr6ePlsgmi5OqQ==
X-Received: by 2002:a05:6402:27d0:b0:5cf:d078:c9dc with SMTP id 4fb4d7f45d1cf-5d080c4868cmr14191a12.22.1732641210036;
        Tue, 26 Nov 2024 09:13:30 -0800 (PST)
Message-ID: <2bc5221d-e54b-47f2-9f2e-ff76c0d74c90@citrix.com>
Date: Tue, 26 Nov 2024 17:13:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] x86: re-work memset()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com>
 <62b3403f-3800-4c1e-a7a2-165ebfac04c0@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <62b3403f-3800-4c1e-a7a2-165ebfac04c0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/11/2024 2:28 pm, Jan Beulich wrote:
> Move the function to its own assembly file. Having it in C just for the
> entire body to be an asm() isn't really helpful. Then have two flavors:
> A "basic" version using qword steps for the bulk of the operation, and an
> ERMS version for modern hardware, to be substituted in via alternatives
> patching.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

This is far nicer than previous versions with nested alternatives.

> ---
> We may want to consider branching over the REP STOSQ as well, if the
> number of qwords turns out to be zero.

Until FSR{S,M} (Fast Short Rep {STO,MOV}SB), which is far newer than
ERMS, passing 0 into any REP instruction is expensive.

I wonder how often we memset with a size less than 8.

> We may also want to consider using non-REP STOS{L,W,B} for the tail.

Probably, yes.  We use this form in non-ERMS cases, where we're advised
to stay away from STOSB entirely.

Interestingly, Linux doesn't have a STOSQ case at all.  Or rather, it
was deleted by Linus in 20f3337d350c last year.  It was also identified
as causing a performance regression. 
https://lore.kernel.org/lkml/CANn89iKUbyrJ=r2+_kK+sb2ZSSHifFZ7QkPLDpAtkJ8v4WUumA@mail.gmail.com/T/#u
although the memset() path was not reverted as part of the fix
(47ee3f1dd93bcb eventually).

Yet ca96b162bfd2 shows that REP MOVSQ is still definitely a win on Rome
CPUs.

I expect we probably do want some non-rep forms in here.

Do you have any benchmarks with this series?

> ---
> v3: Re-base.
>
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -48,6 +48,7 @@ obj-$(CONFIG_INDIRECT_THUNK) += indirect
>  obj-$(CONFIG_PV) += ioport_emulate.o
>  obj-y += irq.o
>  obj-$(CONFIG_KEXEC) += machine_kexec.o
> +obj-y += memset.o
>  obj-y += mm.o x86_64/mm.o
>  obj-$(CONFIG_HVM) += monitor.o
>  obj-y += mpparse.o
> --- /dev/null
> +++ b/xen/arch/x86/memset.S
> @@ -0,0 +1,30 @@
> +#include <asm/asm_defns.h>
> +
> +.macro memset
> +        and     $7, %edx
> +        shr     $3, %rcx
> +        movzbl  %sil, %esi
> +        mov     $0x0101010101010101, %rax
> +        imul    %rsi, %rax
> +        mov     %rdi, %rsi
> +        rep stosq
> +        or      %edx, %ecx
> +        jz      0f
> +        rep stosb
> +0:
> +        mov     %rsi, %rax

Could you use %r8/9/etc instead of %rsi please?  This is deceptively
close to looking like a bug, and it took me a while to figure out it's
only correct because STOSB only edits %rdi.

Otherwise, I suspect this can go in.  It should be an improvement on
plain REP STOSB on non-ERMS systems, even if there are other
improvements to come.  I specifically wouldn't suggest blocking it until
patch 1 is resolved.

~Andrew


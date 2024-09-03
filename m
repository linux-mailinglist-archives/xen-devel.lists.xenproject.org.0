Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F05D96AC26
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 00:24:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789591.1199187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slbwp-0005PC-OC; Tue, 03 Sep 2024 22:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789591.1199187; Tue, 03 Sep 2024 22:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slbwp-0005M1-L2; Tue, 03 Sep 2024 22:24:27 +0000
Received: by outflank-mailman (input) for mailman id 789591;
 Tue, 03 Sep 2024 22:24:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TnF=QB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slbwn-0005Lt-D7
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 22:24:25 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44697392-6a43-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 00:24:21 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-533488ffaebso6959999e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 15:24:21 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989196876sm729090866b.110.2024.09.03.15.24.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 15:24:19 -0700 (PDT)
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
X-Inumbo-ID: 44697392-6a43-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725402261; x=1726007061; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9YZvNRay+GbUFlab9iHxWfwhUmtkApol/F8YOS4Xvlg=;
        b=En5ojWPtXn32OIbjgClua9ZRG0CiRRTQJRnMKVCrgAbvbje9v6t4Y82hY1SHDspwqz
         uNIeZaDe1KRTiat+fSBUovOQSj2o4REqePPN0FgNQwmIUIycCFVkiuBUowlhiraAjro3
         B5klAXVbvODQpAxCKADdw+JGgrbTMoCBdevLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725402261; x=1726007061;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YZvNRay+GbUFlab9iHxWfwhUmtkApol/F8YOS4Xvlg=;
        b=WiARWYyNnRxbU6JdvGRJaTMVQUU/Splk8eZYsO2fRKQ2/SUZQiLJoAbr5bFSJl+r50
         aXCVdbOk0Pzz6/dUDqP/AtOjPG+PwlglO3kGWX30owQOwJ3W9/9+gZXQIbpybKeJFUa7
         c4t+Uw0fhm6y6ZMdNy/S/QZWD4iLp+ggfGwMhO8Ef1CO+khZSYj8uh0AWukknEtxwgPt
         KTsszpmBbuPyejn2BVJUeTb0R04oC82qFh9kAmNQS9RdIQmxblbwtJ9vaA0JdO6jGYb4
         UAVsjwO75yAuN+fdXPy5fVMEeGOSKLxg7U9cRz+JSLmlxTKKFDLqGQ8tkZiqcsohGtV5
         KOAg==
X-Forwarded-Encrypted: i=1; AJvYcCXVfKhhDUBpCVIanuaSDfcCCZ1j/+w1qPbjQVorvUvBa1hz+k5iaeqSnTjlEzfEVx9I9LPEEeEscCk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRR9o2y8y3M90pQxygf1bp42l2UFhTa1kce2HezrkO6eUv9RLe
	ERQ3Qj4tzAAtLmI0/RuTFteOSS4wCRQMmFdj3DnXY5CshbDXgTCyOhz7OKuZQ3M=
X-Google-Smtp-Source: AGHT+IFccdOPiG2NUEJreQudv16PV3lG6T0S6pkD7I/gz6+JPIw67woZbEPLYcSGyX/tv7MCETsycQ==
X-Received: by 2002:a05:6512:118d:b0:52b:c0b1:ab9e with SMTP id 2adb3069b0e04-53546af3053mr8547655e87.5.1725402260078;
        Tue, 03 Sep 2024 15:24:20 -0700 (PDT)
Message-ID: <794ffa84-3c94-4cd7-98de-24a2210b72bc@citrix.com>
Date: Tue, 3 Sep 2024 23:24:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/44] x86/boot: move x86 boot module counting into a
 new boot_info struct
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Christopher Clark <christopher.w.clark@gmail.com>, jason.andryuk@amd.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
 <20240830214730.1621-2-dpsmith@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240830214730.1621-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/08/2024 10:46 pm, Daniel P. Smith wrote:
> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> An initial step towards a non-multiboot internal representation of boot
> modules for common code, starting with x86 setup and converting the fields
> that are accessed for the startup calculations.
>
> Introduce a new header, <xen/asm/bootinfo.h>, and populate it with a new

Just <asm/bootinfo.h>, which matches the code.

> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
> new file mode 100644
> index 000000000000..e850f80d26a7
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
> + * Copyright (c) 2024 Apertus Solutions, LLC
> + * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
> + */
> +
> +#ifndef __XEN_X86_BOOTINFO_H__
> +#define __XEN_X86_BOOTINFO_H__
> +

There ought to be a short description of what boot_info is, even if it's
only "Xen's local representation of information provided by the
bootloader/environment."

> +struct boot_info {
> +    unsigned int nr_mods;

For the sake of 3 letters, please can this be nr_modules.  I've run sed
over the top of the v5 branch and it doesn't change line wrapping
anywhere, but it is a legibility improvement IMO.

> +};
> +
> +#endif

#endif /* __XEN_X86_BOOTINFO_H__ */

It very quickly get to not being in the same few lines as the #ifndef.

> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index eee20bb1753c..dd94ee2e736b 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -276,7 +277,16 @@ static int __init cf_check parse_acpi_param(const char *s)
>  custom_param("acpi", parse_acpi_param);
>  
>  static const module_t *__initdata initial_images;
> -static unsigned int __initdata nr_initial_images;
> +static struct boot_info __initdata *boot_info;
> +
> +static void __init multiboot_to_bootinfo(multiboot_info_t *mbi)
> +{
> +    static struct boot_info __initdata info;
> +
> +    info.nr_mods = mbi->mods_count;
> +
> +    boot_info = &info;
> +}

Having a global pointer set only to this private structure is weird.
Even this:

    static struct boot_info __initdata boot_info[1];

lets you keep -> notation, but removes one level of indirection.

> @@ -1034,9 +1044,10 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>          mod = __va(mbi->mods_addr);
>      }
>  
> +    multiboot_to_bootinfo(mbi);
> +
>      loader = (mbi->flags & MBI_LOADERNAME) ? __va(mbi->boot_loader_name)
>                                             : "unknown";
> -

Stray line removal.  (should be in patch 2 to minimise churn.)

~Andrew


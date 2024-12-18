Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 981829F6A89
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 16:55:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860610.1272618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNwNq-00073l-E4; Wed, 18 Dec 2024 15:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860610.1272618; Wed, 18 Dec 2024 15:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNwNq-00071D-BL; Wed, 18 Dec 2024 15:54:46 +0000
Received: by outflank-mailman (input) for mailman id 860610;
 Wed, 18 Dec 2024 15:54:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xglw=TL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tNwNo-000717-Fx
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 15:54:44 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65baed62-bd58-11ef-a0d7-8be0dac302b0;
 Wed, 18 Dec 2024 16:54:43 +0100 (CET)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-4361f65ca01so64516255e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2024 07:54:43 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b11aecsm23911925e9.23.2024.12.18.07.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 07:54:42 -0800 (PST)
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
X-Inumbo-ID: 65baed62-bd58-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734537283; x=1735142083; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Es7/MA9fgAC/sB1c1opN7VEF0sUUcoPUIXBfj61v5BI=;
        b=gWT0fDApF08UpkcLhy5iBSw4rceLn+7bG9UB+Ho99VsXTHSewLt181BUNPpHcKavvr
         i++hem01VOtb2nUD/QAiWQ0HTrXN9atw0akoSFdkDbZKZmHeACMrBvLAC1MQwAuW/xF5
         0hlqNtv8msApWoZxJn3c8q2+5Or4jJCa157vA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734537283; x=1735142083;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Es7/MA9fgAC/sB1c1opN7VEF0sUUcoPUIXBfj61v5BI=;
        b=ctQSgPC++4r3r/wwZ47lPmv4xxS5TFVi8yxlRQaX9G8voEieI26voutUBpMoSJVgVm
         5h3Y78Cr8d47kNAIbdWLM1lYWLZzoNwWgaD3D6Jso0ApcQ6qol6n0zTgWWlksF2CH+NI
         QL+ee8U9scSVXTccZc/3Is0cxvehXoIaTVYWHWQ4UBpAPpfieQGVjyjpZd5YMYIG/uHG
         nYaaGuhdvxkWXmEV/U3VdbP35jJSzaflwJfegxowo4yel7KalPTsFOOrS9rXxS0Z9DCl
         97q1as+M49oXkA282RvE1nzTk54lJdrTCyYt2ZxobMCoBQkefUy5IbmRrPBfemqhUVuF
         9sPA==
X-Forwarded-Encrypted: i=1; AJvYcCUsb7rWSPD0ugdS2fmvVyV2BWZfXuQj+WQxl7IA9uyDvpQSLkGQAINi3SDXhOEVXrmavvjnvT9RqJc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxy3fynHVQ/HyhN3AyNU++Eze0N4JyO2Q3uOeujReoCiI2Ya0oa
	two0xBT/EmT4DRz0vBEW/bShpk8FHYINxDX3tj+NXi/HXByFscQdViHGEiABpmM=
X-Gm-Gg: ASbGncvQ2LWd/6lNM4xF9Y/bcTH/B84QQUvptGcxiD4R5cyTEAH9vS+VhnfUiy6uvii
	uDnjKY3BPaPJrMuitS/uoajorZvrTJmC5nLMLEnBGbwRQmnYzx/88JKGSTnb84tWGGiqexdwuZC
	nRX9e8raygJeRdf82P/hIS0kqpLyX8RHdN32Q2WvVdXrpitXnl+gz9K1BxdN2dDcyngugMmDLEM
	NIwl+qPNdmTXN2gNigTPmJh4xAkC9FLZO8fDIcgLV4A11EXuKguRmnA5hyeeUfb2nKj2UREIpS0
	MScA7YwL6pl0y/WnCpah
X-Google-Smtp-Source: AGHT+IFtLq7UhjfAQK7npEkzA8q5zLQfBFEsJSd5RYyccJKpjAF8ByPLR0TOUQlByW/pjrLudLYQhw==
X-Received: by 2002:a05:600c:1382:b0:434:a75b:5f59 with SMTP id 5b1f17b1804b1-4365534140bmr32529155e9.3.1734537282722;
        Wed, 18 Dec 2024 07:54:42 -0800 (PST)
Message-ID: <6a0ee425-96ce-4361-ad23-7f21c3398694@citrix.com>
Date: Wed, 18 Dec 2024 15:54:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] x86/hvm: Use constants for x86 modes
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
References: <bf7146a8ccbf05ddc74d4f451a5fa586309b9a50.1733132729.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <bf7146a8ccbf05ddc74d4f451a5fa586309b9a50.1733132729.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/12/2024 9:49 am, Teddy Astie wrote:
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> index 02de18c7d4..dbc37e8b75 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -26,6 +26,12 @@ extern bool opt_hvm_fep;
>  #define opt_hvm_fep 0
>  #endif
>  
> +#define X86_MODE_REAL  0
> +#define X86_MODE_VM86  1
> +#define X86_MODE_16BIT 2
> +#define X86_MODE_32BIT 4
> +#define X86_MODE_64BIT 8
> +
>  /* Interrupt acknowledgement sources. */
>  enum hvm_intsrc {
>      hvm_intsrc_none,

We discussed this in the x86 meeting.  These want to live next to
hvm_guest_x86_mode() with a comment stating that they're not
architectural modes.

During your work, you seem to have only looked at the the VMX side of
things.

There are several callers of hvm_guest_x86_mode() and
svm_guest_x86_mode() missed.  Also an unnecessary include, and a couple
of overly long lines.

https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=commitdiff;h=4f8f63d49776d69ed9a978b6601c13c54c579a98
is the incremental fix on top of this patch.

Does this look reasonable?


I've just realised that the check in nvmx_handle_vmx_insn() is an
incredibly complicated way of expressing guest_cr[0].PE, and we've got
the same opencoded elsewhere, so I'll also prepare a patch prerequisite
patch to sort that out, then rebase this over it.

~Andrew


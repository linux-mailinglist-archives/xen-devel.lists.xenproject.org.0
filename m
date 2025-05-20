Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBF1ABDE27
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 17:04:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990888.1374818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHOWG-00075E-2u; Tue, 20 May 2025 15:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990888.1374818; Tue, 20 May 2025 15:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHOWF-00072s-Vq; Tue, 20 May 2025 15:04:39 +0000
Received: by outflank-mailman (input) for mailman id 990888;
 Tue, 20 May 2025 15:04:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHOWE-00072l-DI
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 15:04:38 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf212281-358b-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 17:04:37 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-601a6e2e93cso2142128a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 08:04:37 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-602047c4b73sm1471192a12.10.2025.05.20.08.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 08:04:35 -0700 (PDT)
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
X-Inumbo-ID: bf212281-358b-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747753477; x=1748358277; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8LMKMv3xKdN15SWrKow1gc2tuOhlL0PDj84+Xx06KAI=;
        b=Yihe7tEoAHMk0UrN8drlF99IDVE6h9eQs12vkTmoEbcSC8SPqZ/F3IuE1O48EXfNnc
         F5WWWjtH+hS+NoYCSxL5G9X9zYi1/zQ/OVncg0Sq9eozY9ICLyFjEoGLsW14Xj0y//Tv
         P6sFPHTRgB2yLT+hc85RFXP69nUpeWPQOnI/wTL7Sm05hovCsnHn0AAphfqcbeYiGmBR
         3XzFg8MXG/XdRtG5VdAhfmmbVBj0DdXRmL+ox+CpgVauneWg+kI+afZgE8/0BlU08OYI
         u1q86QeOj2N2K5+ARoRcxh6XE0uPUehT8DS2SYg/j4w/cKTMUr8aZOPCMGn02Y/R1C4r
         Um/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747753477; x=1748358277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8LMKMv3xKdN15SWrKow1gc2tuOhlL0PDj84+Xx06KAI=;
        b=kAB/dVY5rTsc+fzS76AVx53oxEsnSvhRuxh/wY7M+u3FwIuFX/rRSc79RhE6Jm9YsH
         +jWlbZxYNL7Sde6mTk14fbYRxHOOJ4kiXCnALhjg4IcFgNo506qArwWaPZsbkToH7rLq
         zKmj6hlWMDCjgVtAZLOycVwHLUVXKRtr/o6q+0mr7mAm5k7NouxDleR+Cx6bOECUY6Es
         U1f5UlfisjtinRizIaHFQvD7dPozHbwfvXpNOOoKhe5nniUWr2LbQkDnuj9Ovpi5Z4/i
         CLHGnxqDnrXWzQ8xN0H+Ho/u9jetZN2Q6IbTE7szEEeOMNXLG9XpKGiWysQuJY68hQtr
         sHOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyD3hElj7sEQG5X/0vhS39F24X16RS/eIPcJWS8UJa7PRkSnEZNOK9E7eY9h4feG3WABzQ0nLlSD0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yze9KkkE9AuYQuupSwKQU5uyVyKNQCjDmiqg7DmNESCBDtMXK+X
	WTseoq3H4Vo5wBIlOYKqhTzkQzjNVkKR7FLXxie85iTjBiif82dtDTT8NstYlXjNBA==
X-Gm-Gg: ASbGncvBEisgWwlc9piiGcO1gaNHlSAVbzmUimZW5Zej9AO+pHNbv1oSGjhnzJUkuHb
	bXg3fJB8jVGdfaiLNSSb187/C+76z6i5cr5L7+vupJrxpTU/LJFArthSEA+bQEqVthBoouuvKeS
	punSfy53dmpw5QMPEmhQrV59n7g1J7Ks601qo7ounwgG/iNHe2oXAMeRv9mZ6znn5G4NQ0b4jHx
	XRS4dnylKut819wIk/fXFZ1MRM0Y0GUZ+uRjRNkO12ZALW3DhqcBK6Y1QE8D8fEbzm0WhpMYN3x
	4N22oQAUJ+SCtvGLwnkrnpqG3XyLZxKQtyxZ+xWo+y5hvndcN92TAB5+2xyaJp9YZ2D9tuiO
X-Google-Smtp-Source: AGHT+IH5HHdeNouZiTva0NtNnieKP6fgsPy08CIhI4EWsVPejZKcl3qdM+9v6hbfKtvUYuwr0oOT1g==
X-Received: by 2002:a05:6402:274c:b0:601:e499:dc59 with SMTP id 4fb4d7f45d1cf-601e499de23mr7411682a12.1.1747753476392;
        Tue, 20 May 2025 08:04:36 -0700 (PDT)
Message-ID: <c6f1f14a-c5d1-454e-bf79-74d3e60855f7@suse.com>
Date: Tue, 20 May 2025 17:04:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/6] xen/riscv: define pt_t and pt_walk_t structures
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
 <9f822cfaa058167982c85b3ca3f722881552a75e.1746805907.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9f822cfaa058167982c85b3ca3f722881552a75e.1746805907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.05.2025 17:57, Oleksii Kurochko wrote:
> Refactor pte_t to be a union which hold page table entry plus
> pt_t and pt_walk_t structures to simpilfy p2m functions.

Is this really simplifying things? I really view ...

> Also, introduce some helpers which are using pt_walk_t.

... these helpers as confusing things, by using the wrong part of the
union relative to what their names are. (I'll re-phrase this some at
the bottom.)

With the union it's also unclear to me how to know which part of the
union is the one that's valid to use, when there's no auxiliary info
available.

> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -99,15 +99,67 @@
>  
>  #endif
>  
> -/* Page Table entry */
>  typedef struct {
> +    unsigned long v:1;
> +    unsigned long r:1;
> +    unsigned long w:1;
> +    unsigned long x:1;
> +    unsigned long u:1;
> +    unsigned long g:1;
> +    unsigned long a:1;
> +    unsigned long d:1;
> +    unsigned long rsw:2;
> +#if RV_STAGE1_MODE == SATP_MODE_SV39
> +    unsigned long ppn0:9;
> +    unsigned long ppn1:9;
> +    unsigned long ppn2:26;
> +    unsigned long rsw2:7;
> +    unsigned long pbmt:2;
> +    unsigned long n:1;
> +#elif RV_STAGE1_MODE == SATP_MODE_SV48
> +    unsigned long ppn0:9;
> +    unsigned long ppn1:9;
> +    unsigned long ppn2:9;
> +    unsigned long ppn3:17;
> +    unsigned long rsw2:7;
> +    unsigned long pbmt:2;
> +    unsigned long n:1;
> +#else

Imo you want to settle on whether you want to use bitfields or #define-s
to manipulate page table entries. Using a mix is going to be confusing
(or worse).

> +#error "Add proper bits for SATP_MODE"
> +#endif
> +} pt_t;
> +
> +typedef struct {
> +    unsigned long rsw:10;
> +#if RV_STAGE1_MODE == SATP_MODE_SV39 || RV_STAGE1_MODE == SATP_MODE_SV48
> +    unsigned long ppn: 44;

Nit: Why's there a blank after the colon here when there's none anywhere else?

> +static inline void pte_set_mfn(pte_t *pte, mfn_t mfn)
> +{
> +    pte->walk.ppn = mfn_x(mfn);
> +}
> +
> +static inline mfn_t pte_get_mfn(pte_t pte)
> +{
> +    return _mfn(pte.walk.ppn);
> +}

Following to my remark at the top - if you do it this way, what use are the
ppn<N> fields?

Jan


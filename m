Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED3F8C75B6
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 14:11:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723255.1127926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZxP-0002lr-Cs; Thu, 16 May 2024 12:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723255.1127926; Thu, 16 May 2024 12:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZxP-0002in-9r; Thu, 16 May 2024 12:11:35 +0000
Received: by outflank-mailman (input) for mailman id 723255;
 Thu, 16 May 2024 12:11:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7ZxN-0002iZ-Dj
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 12:11:33 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6de47f9f-137d-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 14:11:30 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a59b58fe083so268977966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 05:11:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5cdc72d31fsm139788766b.169.2024.05.16.05.11.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 05:11:30 -0700 (PDT)
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
X-Inumbo-ID: 6de47f9f-137d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715861490; x=1716466290; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R96vRc0eklM1hVZMcOU4eHuMkP4p7QxrjGnDHYjU0P4=;
        b=EMFxF/RyipKHyb4+g/RjjH1q7cYIdNWvCEQuT/U3F0Ek2Tf8XS9PaTtM1VIcm7NIBw
         yi1hxOZqLP7MdV6CtUMYHo7eqzkdyRBXkc6ntH2B3YEEpFGnHtln+b2QUUJcMYkFwOqb
         L2vV5iziH2CausY5YtrfdC+sFghCd9AowV6P6q0jCzGlzHensaDCrnWubQ+3H1XugePn
         8gL76ltcGU1cHXrq3QWcRrrhcUz+7mkzYcgBbssdmFPgTJi0BWdEd0PGJn3D97JVt8M5
         3E8/OwAQT2ScuvSlEhCE8tqTfJOeE7FRpEqS1id7eKf4CHlFXaJHrnA2nYVSlqUnWT/a
         6S2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715861490; x=1716466290;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R96vRc0eklM1hVZMcOU4eHuMkP4p7QxrjGnDHYjU0P4=;
        b=DEMqJubp0/ELVOycyWjgIV1XA4CIgbrHix8CbPiKQUSvd5t7VkNbtDtl0w3TosO/b1
         5yDNilkTRhSCUEd78stACwpVCVpmV5NUQ/bOqdRJefIBD+psfuCbFa7t24XQ/sM4g3w7
         bdpMQhHvqA9CFdqG+2QPBYbCvd0efjtF8Z67L4Q6K3GIBKI5LOEDOiBxfAnIV/Qo7DWi
         /0WFL7XMMrUO95FU/8YGwi0mADQq7B/TN4RzqWDWqmR9vI+j+hUMDztkMbdHZiwUHVYK
         2WnWQ32mlV2IlKcp/5GcBJ55PAHc9GgTR0ckMU3z+SfM0OegwjvGUarUP0x97ldeNhDW
         JUhg==
X-Forwarded-Encrypted: i=1; AJvYcCXzr25z6V3UxmTksRfLuLXGTPvisMtlrIlyxHJeRPKfljTyTEKVIKDT5Xe01zyrk3MU7homBBsovqgtRoQswuo4xNRSf7PJLuyMN2uCK6I=
X-Gm-Message-State: AOJu0Yyn8LrN1nIS1F8Y2w5EGuxrGZIlNdBPDRfusconI5wnDvj7CdMM
	6FDFmIeDjwDJgJR0X6oAIIH9S4Tty7jEGWgf3yM8w3OJBcTpBqXLNiUHmSiQoQ==
X-Google-Smtp-Source: AGHT+IFgS54du9FRDlAGTvmTet+3Ty52KD6gyAISMPQkRYPqyBA4GK/osw3+1HqaYd9Ga2zmxY/8yw==
X-Received: by 2002:a17:906:ae8b:b0:a59:cb09:41d6 with SMTP id a640c23a62f3a-a5a2d65f294mr1113835766b.49.1715861490343;
        Thu, 16 May 2024 05:11:30 -0700 (PDT)
Message-ID: <376d2e89-da6d-49c2-90aa-aab4af6eb0d1@suse.com>
Date: Thu, 16 May 2024 14:11:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 13/15] x86/ioreq: guard VIO_realmode_completion
 with CONFIG_VMX
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <9e64fa33b298f789d8340cf1046a9fbf683dd2b7.1715761386.git.Sergiy_Kibrik@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <9e64fa33b298f789d8340cf1046a9fbf683dd2b7.1715761386.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.05.2024 11:24, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -2667,7 +2667,9 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
>          break;
>  
>      case VIO_mmio_completion:
> +#ifdef CONFIG_VMX
>      case VIO_realmode_completion:
> +#endif
>          BUILD_BUG_ON(sizeof(hvio->mmio_insn) < sizeof(hvmemul_ctxt->insn_buf));
>          hvio->mmio_insn_bytes = hvmemul_ctxt->insn_buf_bytes;
>          memcpy(hvio->mmio_insn, hvmemul_ctxt->insn_buf, hvio->mmio_insn_bytes);

This change doesn't buy us anything, does it?

> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -33,6 +33,7 @@ bool arch_vcpu_ioreq_completion(enum vio_completion completion)
>  {
>      switch ( completion )
>      {
> +#ifdef CONFIG_VMX
>      case VIO_realmode_completion:
>      {
>          struct hvm_emulate_ctxt ctxt;
> @@ -43,6 +44,7 @@ bool arch_vcpu_ioreq_completion(enum vio_completion completion)
>  
>          break;
>      }
> +#endif
>  
>      default:
>          ASSERT_UNREACHABLE();

And while this change is needed for the goal of the series, I wonder whether
it wouldn't better be arch_vcpu_ioreq_completion() as whole that then gets
stubbed out.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9D0915274
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 17:33:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746767.1153923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLlfy-0002et-D4; Mon, 24 Jun 2024 15:32:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746767.1153923; Mon, 24 Jun 2024 15:32:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLlfy-0002ci-AH; Mon, 24 Jun 2024 15:32:14 +0000
Received: by outflank-mailman (input) for mailman id 746767;
 Mon, 24 Jun 2024 15:32:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLlfx-0002cc-2g
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 15:32:13 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecebb559-323e-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 17:32:11 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ec58040f39so20493151fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 08:32:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9ee4482afsm63472295ad.88.2024.06.24.08.32.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 08:32:10 -0700 (PDT)
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
X-Inumbo-ID: ecebb559-323e-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719243131; x=1719847931; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s25MqQDIQHTV2/jQnH8Za5Ma6ncTSBJrtWWaZb14nYU=;
        b=ZDnI6e9WbekmlwfZ17yYoc3WK+rcOHR0fqgVNSyVlPmsMc8Mo5I2nG+EdAFWPBe4QX
         Z8UzvHiwvbOtW2Sbr/tje2aGUVXYwz6RLuUGC2iRScc9xoA/iGMxNlR+MVg2FIrTQD4H
         MXHM2SfMCTOtZWQH5i7Hi3R/Vaz9762PxnYtj3TCsJohTeEzuNoQ6Mvox334SLqEw0ed
         9hPr4giDj/K+Q/zK31XtvKmmlGhKfUVUBMXf/mT51N7prMk7clkkjdZi+156uItAkecJ
         X18uTKy20CSI9s5g5IiX3hyQVinJCpQStZeqJUzZIsl0nKwe3Uw3wde0Z5eUEPHfQjSx
         VQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719243131; x=1719847931;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s25MqQDIQHTV2/jQnH8Za5Ma6ncTSBJrtWWaZb14nYU=;
        b=pbMjgc0VF80Gn9DJQvyzLxb+ErTIxyClZONae3Cyzbb0rqt7Xs/QCWAO4QY1pU3Zal
         MSRAieTXgAvpsvZQZRiRlym79w6zTFWSC+hi7W0cnGSo4vOPaQ0ZOX6KWRm0A7ycIDzn
         AozJcIBj2QPVZR2C/zCekozHLlDpk0l70WSKm5PalnrCQ9UIIj0LbbcERG/thSz0tp6+
         meJObRZ0G3/v2h83D/fB2+6PNpuEl3gnSqRPdbmFY3lv6uGSR1dfOzZT1HjFb9G6pMza
         9/GkvVp18e0L2GzRqaf5cJnPPm8q7vH9Yiel56JOR+Rfn/owg5kCjQZbOsBrmiOX23eC
         V7eA==
X-Forwarded-Encrypted: i=1; AJvYcCVXjBAtnwM+NvVWuNY6DwGdqI+zRI8RcGI8mj+8R2nTiGCSm1MoW78czb7DILehJQabnjI/DUVLX+oeC0e5zTZvyee6FlpiXevXBp1AZF0=
X-Gm-Message-State: AOJu0YyX/UQy9C9e8DTxfP+oiASJUYNjS+xZ+JjZHTczurJIxErUJ5T6
	c9AU8zu3U2kMdOXYDq246GP0qh8lgoxmnZiZOWbZVulNG+eLYJ2/I/pKvgDrUw==
X-Google-Smtp-Source: AGHT+IGA5iS4PyHG1qyZR3AI4VjvptUpVbYRgqj/l3RBV9gbyZWTPDX1wCBSQzVh7L9xIqPOb+39Tw==
X-Received: by 2002:a2e:8513:0:b0:2ec:3ca1:e53e with SMTP id 38308e7fff4ca-2ec595876damr31518051fa.51.1719243131118;
        Mon, 24 Jun 2024 08:32:11 -0700 (PDT)
Message-ID: <087eb879-b3f6-4d1a-a52e-1e27337620c9@suse.com>
Date: Mon, 24 Jun 2024 17:32:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 07/13] x86/hvm: address violations of MISRA C Rule
 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719218291.git.federico.serafini@bugseng.com>
 <a20efca7042ea8f351516ea521edccd89b475929.1719218291.git.federico.serafini@bugseng.com>
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
In-Reply-To: <a20efca7042ea8f351516ea521edccd89b475929.1719218291.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2024 11:04, Federico Serafini wrote:
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -339,7 +339,7 @@ static int hvmemul_do_io(
>      }
>      case X86EMUL_UNIMPLEMENTED:
>          ASSERT_UNREACHABLE();
> -        /* Fall-through */
> +        fallthrough;
>      default:
>          BUG();
>      }

This or very similar comment are replaced elsewhere in this patch. I'm
sure we have more of them. Hence an alternative would be to deviate those
variations of what we already deviate. I recall there was a mail from
Julien asking to avoid extending the set, unless some forms are used
pretty frequently. Sadly nothing towards judgement between the
alternatives is said in the description.

> @@ -2674,6 +2674,7 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
>  
>      default:
>          ASSERT_UNREACHABLE();
> +        break;
>      }
>  
>      if ( hvmemul_ctxt->ctxt.retire.singlestep )
> @@ -2764,6 +2765,7 @@ int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla)
>          /* fallthrough */

What about this? It doesn't match anything I see in deviations.rst.

>      default:
>          hvm_emulate_writeback(&ctxt);
> +        break;
>      }
>  
>      return rc;
> @@ -2799,10 +2801,11 @@ void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
>          memcpy(hvio->mmio_insn, curr->arch.vm_event->emul.insn.data,
>                 hvio->mmio_insn_bytes);
>      }
> -    /* Fall-through */
> +    fallthrough;
>      default:
>          ctx.set_context = (kind == EMUL_KIND_SET_CONTEXT_DATA);
>          rc = hvm_emulate_one(&ctx, VIO_no_completion);
> +        break;
>      }

While not as much of a problem for the comment, I view a statement like
this as mis-indented.

> @@ -5283,6 +5287,8 @@ void hvm_get_segment_register(struct vcpu *v, enum x86_segment seg,
>           * %cs and %tr are unconditionally present.  SVM ignores these present
>           * bits and will happily run without them set.
>           */
> +        fallthrough;
> +
>      case x86_seg_cs:
>          reg->p = 1;
>          break;

Why the extra blank line here, ...

> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -111,6 +111,7 @@ int hvm_hypercall(struct cpu_user_regs *regs)
>      case 8:
>          eax = regs->rax;
>          /* Fallthrough to permission check. */
> +        fallthrough;
>      case 4:
>      case 2:
>          if ( currd->arch.monitor.guest_request_userspace_enabled &&

... when e.g. here there's none? I'm afraid this goes back to an
unfinished discussion as to whether to have blank lines between blocks
in fall-through situations. My view is that not having them in these
cases is helping to make the falling through visually noticeable.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1099321BB
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 10:19:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759392.1169101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTdNr-00072o-Hs; Tue, 16 Jul 2024 08:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759392.1169101; Tue, 16 Jul 2024 08:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTdNr-000703-F0; Tue, 16 Jul 2024 08:18:03 +0000
Received: by outflank-mailman (input) for mailman id 759392;
 Tue, 16 Jul 2024 08:18:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I1NN=OQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTdNp-0006zx-Tw
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 08:18:01 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9b984e8-434b-11ef-8776-851b0ebba9a2;
 Tue, 16 Jul 2024 10:17:59 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-36799a67d9cso4158958f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jul 2024 01:17:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bba7080sm52770435ad.89.2024.07.16.01.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 01:17:58 -0700 (PDT)
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
X-Inumbo-ID: e9b984e8-434b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721117879; x=1721722679; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l3j+p7vOgZirBtt4mN1MSRKUA+wQUL6ne8ctoUq0k8U=;
        b=S/UBv2w6w2NgmKwpplMxbVoBIdCKhSemiOFacGyxixQmQvuDZhHp/HwP8MEZMrtpm0
         YIo5ga8wo4yRUT1mI976A+x+GFk36/hV3leTagfFoxj3JhHgykFQAObd742nZIOdJiY1
         l58ZpqfhbcFLctb4GFWSAX3p7iCKyh9T3eIZekcWYqVRlzz7f2OroA8klT+FqYLGdZIr
         2qfY4c75ff1LB//sZ729nVG9w1IOlkGz9PZGuBVS+CpFUztDh15Pr4DXbZn78lBjJm6z
         l+Pti8YNZRCpizSsCkUIL5dAoJ4TOFQ6qaHuBTQxu8om6I4W4Kxq413hyFzSgzc7haml
         guDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721117879; x=1721722679;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3j+p7vOgZirBtt4mN1MSRKUA+wQUL6ne8ctoUq0k8U=;
        b=dIz30y/3VC+nJZ0YssoEXpnXHbs7ed2kayDH9cKbMfiNlrzrn35hGQUUYdWoYsBkbU
         hl44/812LR07DftODKPH7DWu4xmkCB9POyv3V8C3gaIXKKZudMa1B6UQhCDwsfb4X0tB
         O4gkQEp+/8qwC19zSTPxFWspiwrQlkns4oSI1hKwFuw5XhUaQZYd0Tk1vDYrgu5IR2N9
         bFNKnfK0P0ZK/0vAh5FvBdKdP+HrcRsk/1/n425EmQHxwevF1tP3s9mwHp/nl6ThrvvG
         Hyq0lifl6uUWw6JUS5iitYxzEsde/I3c9DxHRaaANnYotEi6I02LXD4CF/0pCjM8ba0E
         8b7A==
X-Forwarded-Encrypted: i=1; AJvYcCVkZX85U3pPa4eUZZN3QCqRn9jSvldntXkrQYl6k7O5knJARj7H1rQ8fjmEi/6CxBsgLhuPP3HDHg2I5YxQiuvP6BHiEeaq5wYFvvt1GxU=
X-Gm-Message-State: AOJu0YzXPN5N8oEXBGeNuRKCunHvW3OoUfO5dg9jVl/S+OSSmZvl0Xzu
	7Hya68Q9MjQxu4zjoeaUN7c9cdrXvBT8lDIPRigsIZanI2TkF/p62Gzk9k4/aw==
X-Google-Smtp-Source: AGHT+IFO7UwuE0M6A/KshzZV/i/fUJcDOJfae8WhoiTLy0P3OorRv4OsIKXIcf/Nb07+s9zrYwU9VA==
X-Received: by 2002:a5d:64a6:0:b0:366:f34d:d0b7 with SMTP id ffacd0b85a97d-368260d3fb7mr1209133f8f.29.1721117878979;
        Tue, 16 Jul 2024 01:17:58 -0700 (PDT)
Message-ID: <4ef8a4a6-6c23-4e23-8483-3ef9141f4f3b@suse.com>
Date: Tue, 16 Jul 2024 10:17:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 7/9] x86/hvm: address violations of MISRA C Rule
 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1721050709.git.federico.serafini@bugseng.com>
 <f60c9580dcb2a078723fe9881124d7516e4e7593.1721050709.git.federico.serafini@bugseng.com>
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
In-Reply-To: <f60c9580dcb2a078723fe9881124d7516e4e7593.1721050709.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.07.2024 18:48, Federico Serafini wrote:
> MISRA C Rule 16.3 states that "An unconditional `break' statement shall
> terminate every switch-clause".
> 
> Add pseudo keyword fallthrough or missing break statement
> to address violations of the rule.
> 
> As a defensive measure, return an error message or a null pointer in
> case an unreachable return statement is reached.

The two kinds of changes are pretty different in nature. I think that ...

> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
> Changes in v4:
> - do not separate different parts of HVM:
>     a) squash patches 8, 11 and 12 of v3 into this patch;
>     b) address also violations of SVM and VMX;
> - re-arrange fallthrough positioning to comply with Coverity.
> Changes in v3:
> - squashed here modifications of pmtimer.c;

... while the prior splitting by file was indeed unnecessary (when the
main patch's title started with "x86/hvm:"), splitting by measure taken
would be quite helpful. Anything purely mechanical can perhaps stay
together, but everything more involved may want splitting off.

> @@ -2674,6 +2673,7 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
>  
>      default:
>          ASSERT_UNREACHABLE();
> +        break;
>      }

For example, I'm unconvinced that merely adding "break" is going to be
enough here. Imo at least rc also needs updating, to signal an error to
the caller (which may be what in the description "error message" is
intended to mean). Perhaps the right thing to do here is even to add
"return X86EMUL_*;" instead. Question then is which particular return
value to use. I would have suggested X86EMUL_UNHANDLEABLE, yet its
comment says "No state modified." Then again that may be stale anyway,
so perhaps that's the best we can do here.

> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -1446,6 +1446,7 @@ struct vmx_msr_entry *vmx_find_msr(const struct vcpu *v, uint32_t msr,
>  
>      default:
>          ASSERT_UNREACHABLE();
> +        return NULL;
>      }
>  
>      if ( !start )

Right below here there is

        return NULL;

Therefore adding "break" instead may be slightly better.

> @@ -1598,6 +1599,7 @@ int vmx_del_msr(struct vcpu *v, uint32_t msr, enum vmx_msr_list_type type)
>  
>      default:
>          ASSERT_UNREACHABLE();
> +        return -EINVAL;
>      }
>  
>      if ( !start )

Whereas here I agree that we don't want to pass back -ESRCH in such a case.

Jan


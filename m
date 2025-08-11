Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A98B208D8
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 14:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077553.1438595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulRjt-0004my-EU; Mon, 11 Aug 2025 12:34:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077553.1438595; Mon, 11 Aug 2025 12:34:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulRjt-0004kW-BW; Mon, 11 Aug 2025 12:34:57 +0000
Received: by outflank-mailman (input) for mailman id 1077553;
 Mon, 11 Aug 2025 12:34:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulRjr-0004kP-Q5
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 12:34:55 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9553ad99-76af-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 14:34:54 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-af934d7c932so564595566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 05:34:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a218cf8sm2031179866b.95.2025.08.11.05.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 05:34:53 -0700 (PDT)
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
X-Inumbo-ID: 9553ad99-76af-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754915694; x=1755520494; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q8I+YLL5Oftq4fsAcZAeKMsXq0/WEQfNuJ9V59e4WoI=;
        b=Pw0EW1oVwTZd6BPaGiEsiFMh9pUh30pXWmmDVY6GrPotuRge3R2IdOQf7M9zjxAiIl
         ajEvohDXwibqkGxpdsQPDLJTAStOMF9tG110l8pOiRgTQxPF3Vs+lQIvaRuNuQOYX8I5
         FJ65kiVtcfXS/Fw2wGNEBLftca+YRvK1ekiWl1Ymw7AXrkKM0HENYPMfGL1OEjIF1xPI
         rljYZLdic6WeGNmH9xlBXSnhbfa7t726oo+vXKNl2MN+M6ggAU2ksqErMrvwWGReSE7R
         EaF9dCh+YRipXmY03zBPlzxbLHFMB4LE+PhxpkhsZaTXr5Xuce5rapjv29QY7oPHUmlS
         SU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754915694; x=1755520494;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8I+YLL5Oftq4fsAcZAeKMsXq0/WEQfNuJ9V59e4WoI=;
        b=QDz4zjJRdf/r/HqzOvcfKks2PF3Bo8rfWGgXUiPNHNS0L8UrkUnVV5BFwzIAZBzS73
         HV+vLE/Byhjl2JVtwrpuW1ak0BmTz5MKtVVW4DCv72lUgTyHi/70GdmD1IThzPxZq/uO
         U61IUW+yFJ6o9OPhljkOwh0ntoULUJ7IH2utGeSqAMqb2uQnG6rhGYteeYdON57cj8QY
         L9F9q/oDNX0lQsHUrGnM11AI46edvb8faSAz/ZZU201sW1rn5OeIcp+xjJt4x0aN4vQL
         Cp5rh3aTa50192paXTnR/d3H7S0otVQeGaZf+ARyyDjdYq3xJ+OyTXkyficKjOYuXOTF
         AzhA==
X-Gm-Message-State: AOJu0YyQWn3R1i9yjpDFCZ/xMQb4nRAfEZtrAaaVxlBniJ1OTpatrGex
	tzt88nb9lEVlPiyDEwmnbHXCYq6OYwpAENtiWd5kXmpgUlqv8y5VdRM/BwTgDopubw==
X-Gm-Gg: ASbGncupMUov8htigJzr0YHtpV/Zlbqqjs2t9mV9BvWMnNmDjY0DCnPp4AnZnsFSLBW
	yJOF9/GgyNBlzTWI6A9i1vh7M51ecT3ZLo9sCLcS+mpTLlQKY0arj5+Z6JBLGdN0k2vBWn4C0r/
	P3TcZ4XnJeC+RVjgzwPFka0bgtxuhiySiXkeN4QRGK9thf+M6z6B1zxJxQ/734g0nCz/mhib8fC
	EhFaT2qQrMb2Q/Zlai2/VoMcBLT0X12HNgjCIPLNEZYL+zeP+AztCqldrQxzEr5RrABQpFibx+D
	BSMZS85BuxiCrjl46ltEDrwAspkOAPMXJiksBp9YCshyD/5+BB0KuqyAubwDqsBWiET7QPLmci5
	TVJOvts4c0377+1GuQeQUUe+ca+ubuOWAgnqRmTJuYeso6WOxSf6VY+6nWV5lpXhWIqeMjQqu8z
	qpKCieDy0=
X-Google-Smtp-Source: AGHT+IEP2df2VTD7XIadDhRFUTT3SEl+mGc8gQfPKjlbsqNc2aK+n9aTFLNSuqFs8N1kkh3/qP3faQ==
X-Received: by 2002:a17:907:72c9:b0:af2:7ccd:3429 with SMTP id a640c23a62f3a-af9c634faccmr1109345566b.9.1754915693943;
        Mon, 11 Aug 2025 05:34:53 -0700 (PDT)
Message-ID: <a23b88f6-87b9-45bf-ae9b-ee2f3f66cb38@suse.com>
Date: Mon, 11 Aug 2025 14:34:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH v3] EFI/runtime: switch to xv[mz]alloc_array()
From: Jan Beulich <jbeulich@suse.com>
To: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <41b7e14c-59ef-40f5-8c43-69bdc5fb4531@suse.com>
Content-Language: en-US
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
In-Reply-To: <41b7e14c-59ef-40f5-8c43-69bdc5fb4531@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2025 15:39, Jan Beulich wrote:
> Use the more "modern" form, thus doing away with effectively open-coding
> xmalloc_array() at the same time. While there is a difference in
> generated code, as xmalloc_bytes() forces SMP_CACHE_BYTES alignment, if
> code really cared about such higher than default alignment, it should
> request so explicitly.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: Use xv[mz]alloc_array().

May I ask for an ack (or otherwise) please? Perhaps also for Ross'es
"efi: Call FreePages only if needed"?

Thanks, Jan

> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -6,6 +6,7 @@
>  #include <xen/irq.h>
>  #include <xen/sections.h>
>  #include <xen/time.h>
> +#include <xen/xvmalloc.h>
>  
>  DEFINE_XEN_GUEST_HANDLE(CHAR16);
>  
> @@ -500,23 +501,23 @@ int efi_runtime_call(struct xenpf_efi_ru
>          len = gwstrlen(guest_handle_cast(op->u.get_variable.name, CHAR16));
>          if ( len < 0 )
>              return len;
> -        name = xmalloc_array(CHAR16, ++len);
> +        name = xvmalloc_array(CHAR16, ++len);
>          if ( !name )
>             return -ENOMEM;
>          if ( __copy_from_guest(name, op->u.get_variable.name, len) ||
>               wmemchr(name, 0, len) != name + len - 1 )
>          {
> -            xfree(name);
> +            xvfree(name);
>              return -EIO;
>          }
>  
>          size = op->u.get_variable.size;
>          if ( size )
>          {
> -            data = xmalloc_bytes(size);
> +            data = xvmalloc_array(unsigned char, size);
>              if ( !data )
>              {
> -                xfree(name);
> +                xvfree(name);
>                  return -ENOMEM;
>              }
>          }
> @@ -539,8 +540,8 @@ int efi_runtime_call(struct xenpf_efi_ru
>          else
>              rc = -EOPNOTSUPP;
>  
> -        xfree(data);
> -        xfree(name);
> +        xvfree(data);
> +        xvfree(name);
>      }
>      break;
>  
> @@ -553,17 +554,17 @@ int efi_runtime_call(struct xenpf_efi_ru
>          len = gwstrlen(guest_handle_cast(op->u.set_variable.name, CHAR16));
>          if ( len < 0 )
>              return len;
> -        name = xmalloc_array(CHAR16, ++len);
> +        name = xvmalloc_array(CHAR16, ++len);
>          if ( !name )
>             return -ENOMEM;
>          if ( __copy_from_guest(name, op->u.set_variable.name, len) ||
>               wmemchr(name, 0, len) != name + len - 1 )
>          {
> -            xfree(name);
> +            xvfree(name);
>              return -EIO;
>          }
>  
> -        data = xmalloc_bytes(op->u.set_variable.size);
> +        data = xvmalloc_array(unsigned char, op->u.set_variable.size);
>          if ( !data )
>              rc = -ENOMEM;
>          else if ( copy_from_guest(data, op->u.set_variable.data,
> @@ -581,8 +582,8 @@ int efi_runtime_call(struct xenpf_efi_ru
>              efi_rs_leave(&state);
>          }
>  
> -        xfree(data);
> -        xfree(name);
> +        xvfree(data);
> +        xvfree(name);
>      }
>      break;
>  
> @@ -598,13 +599,13 @@ int efi_runtime_call(struct xenpf_efi_ru
>              return -EINVAL;
>  
>          size = op->u.get_next_variable_name.size;
> -        name.raw = xzalloc_bytes(size);
> +        name.raw = xvzalloc_array(unsigned char, size);
>          if ( !name.raw )
>              return -ENOMEM;
>          if ( copy_from_guest(name.raw, op->u.get_next_variable_name.name,
>                               size) )
>          {
> -            xfree(name.raw);
> +            xvfree(name.raw);
>              return -EFAULT;
>          }
>  
> @@ -629,7 +630,7 @@ int efi_runtime_call(struct xenpf_efi_ru
>          else
>              rc = -EOPNOTSUPP;
>  
> -        xfree(name.raw);
> +        xvfree(name.raw);
>      }
>      break;
>  



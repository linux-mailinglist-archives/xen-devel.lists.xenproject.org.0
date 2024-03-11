Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB2E877B66
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 08:40:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691208.1076918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjaGo-00014C-AT; Mon, 11 Mar 2024 07:40:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691208.1076918; Mon, 11 Mar 2024 07:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjaGo-00011e-7Y; Mon, 11 Mar 2024 07:40:26 +0000
Received: by outflank-mailman (input) for mailman id 691208;
 Mon, 11 Mar 2024 07:40:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZVPQ=KR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjaGm-00011V-CT
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 07:40:24 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9da9c632-df7a-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 08:40:22 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a3fb8b0b7acso284738066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 00:40:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 y26-20020a170906471a00b00a45ad52d510sm2608883ejq.139.2024.03.11.00.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 00:40:21 -0700 (PDT)
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
X-Inumbo-ID: 9da9c632-df7a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710142821; x=1710747621; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kNSQpzQh8XqKnFyK4B50zqOK1xBn3feJQ+pPGR+Q9lY=;
        b=JlYGFyWuK9wl3VnwKepzwu3r4Xu3EQGITAWGLScVHLUa4Wy3u00PVm1SPRf+SWfcW5
         dmwkQoMwDmsddWAyk2DSURs7LbfZ+m+TeXE/0V9Q1N6Ra/ezuHk9EAsS5Xo2ajc0xWch
         dz8BD89AAk+EsmmxOuqzQ3Jrq+1IDI6IA1M7QNgrhusr2QZpQdhjmslnrqvputO0kHEB
         2GS3BAorETilx4avCva0HihdfFG5kOueoDzLbqwTiaBkp2CV/K5KlZDZccx26E4AYhQV
         nAd0x1lJ8c1Gl0v4g9nULfayHLjP9tc1zZhuh14VlPqbVROF7eheECEP1kUSmm9JEHo9
         qKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710142821; x=1710747621;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kNSQpzQh8XqKnFyK4B50zqOK1xBn3feJQ+pPGR+Q9lY=;
        b=C9Unwyj3ujUpMcQ2r/McZtLJgOA7teekONVQAbcx1lRDgeFENt57JTRt2xrnNbRJD7
         N64CSwB5hiY30VsFLliQqrPmqBVJhtWo4CtHPZOda31FFcHM4LCeX9F8TrTKs935AQgv
         U2yojVtwSKVJzKXhOEurDnd+53mv9hc/oxPTNf/xaDA3REGzOyjXlMeV1ky/W725GisF
         0Bgpnl/RAs2CBuvDDztD6NKb59Wu/AbPu0DfUEEwULib+44w6/lDqbKStnt0Lb3sLeDP
         waBDDp1w03pj2YXNiulQ/mTF6Ux4cdRH32vzMcYUJG9z1ZgynjAfB6hvcQFsgQtFmv2i
         ngWA==
X-Forwarded-Encrypted: i=1; AJvYcCULXKYlSRTNhl4RQ2xqdMSRSB4NyqGj5dS+HVNUx6+SujFWcPhcs00W+SK2+sX4Z8VajTJ41q6Ct5PpgXQgH5S/UCMY/M4xs4KpxbL2+b0=
X-Gm-Message-State: AOJu0YyR6gstAvmaORwISw27n/lQlVmAuyQqXsEcSNspvPSWUHfHbE5K
	1sfkW1mlxgrWhTOUXxkgTyCKUGhuR86YrYjZI8GsLjgCipxbBx2ZsWCZ0eCnHw==
X-Google-Smtp-Source: AGHT+IHxAPMZBAyhZCi/rlbcCgEbREQxW1vZ7bus7lsBZwpHK09gC8T7NVgPm8DBy7e91I6fpi3ekA==
X-Received: by 2002:a17:907:7847:b0:a44:1fcf:9b97 with SMTP id lb7-20020a170907784700b00a441fcf9b97mr3062251ejc.24.1710142821487;
        Mon, 11 Mar 2024 00:40:21 -0700 (PDT)
Message-ID: <ef3e2ce7-6798-4ade-a5d4-fadf017bbd43@suse.com>
Date: Mon, 11 Mar 2024 08:40:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/evtchn: address violations of MISRA C:2012 Rules
 16.3 and 16.4
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <3ec419e30227a8016c28e04524cd36a549aaddcf.1709898466.git.federico.serafini@bugseng.com>
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
In-Reply-To: <3ec419e30227a8016c28e04524cd36a549aaddcf.1709898466.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.03.2024 12:51, Federico Serafini wrote:
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -130,9 +130,12 @@ static bool virq_is_global(unsigned int virq)
>  
>      case VIRQ_ARCH_0 ... VIRQ_ARCH_7:
>          return arch_virq_is_global(virq);
> +
> +    default:
> +        ASSERT(virq < NR_VIRQS);
> +        break;
>      }
>  
> -    ASSERT(virq < NR_VIRQS);
>      return true;
>  }

Just for my understanding: The ASSERT() is moved so the "default" would
consist of more than just "break". Why is it that then the "return" isn't
moved, too?

> @@ -846,6 +849,7 @@ int evtchn_send(struct domain *ld, unsigned int lport)
>          break;
>      default:
>          ret = -EINVAL;
> +        break;
>      }

I certainly agree here.

> @@ -1672,6 +1676,9 @@ static void domain_dump_evtchn_info(struct domain *d)
>          case ECS_VIRQ:
>              printk(" v=%d", chn->u.virq);
>              break;
> +        default:
> +            /* Nothing to do in other cases. */
> +            break;
>          }

Yes this, just to mention it, while in line with what Misra demands is
pretty meaningless imo: The absence of "default" says exactly what the
comment now says. FTAOD - this is a comment towards the Misra guideline,
not so much towards the specific change here.

One other remark though, considering the specific function we're in: In
a certifiable environment, will there actually be the capability to
issue debug keys? Shouldn't we have a Kconfig option allowing to remove
all that from a build (and then also from relevant scans)?

Jan


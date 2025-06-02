Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C60AACAB53
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 11:26:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003062.1382501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM1RK-0002dn-TV; Mon, 02 Jun 2025 09:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003062.1382501; Mon, 02 Jun 2025 09:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM1RK-0002bd-Pw; Mon, 02 Jun 2025 09:26:42 +0000
Received: by outflank-mailman (input) for mailman id 1003062;
 Mon, 02 Jun 2025 09:26:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM1RJ-0002bW-BN
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 09:26:41 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b07dbdf3-3f93-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 11:26:40 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so738715f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 02:26:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afe96474sm7229219b3a.22.2025.06.02.02.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 02:26:39 -0700 (PDT)
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
X-Inumbo-ID: b07dbdf3-3f93-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748856400; x=1749461200; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DJXWp3fAzCxU30vF/SD3NX/7M+QmejJN6no0tmul914=;
        b=W/+cUeA7Lm4qB7OX/zkBVIoUA4KRPtJGDKn5qWg0vL7rideX5jTWYoPN+6vKuhOMx5
         5DFx+pFyPUCBmfuA6T2Cc7eyMwCN9s+L+O5L3OicupwYmhJIY4ltExntrbYJDhGX1reP
         8GDRdG63fzKHM0TdLm7q3+cbKUItNPOKyE6qUWmsmleeZ2CCJxfF32huXL+lEjDwBj+m
         E2oY1d9q9Z9zq7X/Hb0huDo8QH9emhBcWylqfVG0ZaELYUgD7otLEXl7A5v6eCXvfsK6
         CmUigiYoM8ElO3cDzg9aXK48o3dMbiSKd7+37E9V/j2WOhvQLPI4mpBDN+96yvWyl9Y7
         DBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748856400; x=1749461200;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJXWp3fAzCxU30vF/SD3NX/7M+QmejJN6no0tmul914=;
        b=DNWZJmsJgI+npqWKO8aZh2FCBLWQdoQQNEgDClo+Lt2KCR7kcRdE9yWTIKe2FKTuZL
         559knkItBEqJjKEOaTz3suAto4wiRTjpqNZVMon8nXXDh8awX5+OR6Yz1GOU/2UGWM8u
         JEAOMcvQxc5IpzQXxD68T2uPuSGJavisG6CmhFCKUzwafxr9NySiAWERXLypfnloeGkp
         VP41yNrSJfaXTGAwKZYg6V/2h9baMj6ezdFOOZFgBn1kSYEe8E+Hs1c+gOiXbgS2Izv2
         VHt+h5ItP1VOwmhdthHYcCGLrqvpaQpjb7ebGM34HFbdriD+SI02WhdPkkPPrOFA7l3J
         d47Q==
X-Forwarded-Encrypted: i=1; AJvYcCVo6PLEC2CsIwcufvZrP9X0F0YYRVeGr4SAdRc64dQuhS46jDAzjr+W1XjC56ZKLPrGbQJyM7ymu4A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlHgOew3PWCI9628tuWbQdSFX3V+rCRl+WqiTZBaCCf3KbRVSX
	oCmIvwAb0Oaw7XDAMSwnRn7EIubxaI9Ntp8gMZfYdZX1NisXww/ne5BKUQr9paJ9Uw==
X-Gm-Gg: ASbGnculPb4E30cQklVm5SS3yveTcPP4kn6kgtNdC30HDkv1sk0Etn5uScWf/7MBo6P
	l/bzpZkJRNzDdXFt5mt1lBhkvzh65i4EsYdgPEiRz94A18WSlQ6sqkJZ8exPWPgnRopHPmgFrrM
	qs4xjK22eNAuT+1K6cAn9zC7DwkNge6otAu5QBvqSH26DpbQCHL34cVElZdBnO2rZmetq9Hbu+F
	9/C6BUxkfC685oKBxunyAb6h8KARCMKFK+Z/Tb2ONWjTkOjtH3vf2W0h3I93kC1C+n3YK8LFM9c
	9rIzvjupuseBSOMOsNK+kMZIsYaki1ipU7vGT2dy25+6/hcfk2nqFpJq1uxp7tr5QxhDWV9/O6H
	R+PZ/5l8aAnTezeNCQStQF0yX6DJI0DDsb/PhDHrY9ovh6wxAMpVujUeoHg==
X-Google-Smtp-Source: AGHT+IFP/6X/OfzSMdMb497K2+J4DcXrjq/ILa4TRv3Fk17NS0VMNPbxnjN2DFiBMrzWBd2+aha8yQ==
X-Received: by 2002:a5d:64e7:0:b0:3a3:7a33:c96a with SMTP id ffacd0b85a97d-3a4f7ab15c3mr9542447f8f.51.1748856399662;
        Mon, 02 Jun 2025 02:26:39 -0700 (PDT)
Message-ID: <90048f71-8313-4110-924c-f956a2bec5a0@suse.com>
Date: Mon, 2 Jun 2025 11:26:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4][PART 2 07/10] xen/arm: Add support for system suspend
 triggered by hardware domain
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1748848482.git.mykola_kvach@epam.com>
 <7bd75ecfff5b0a75ea5abd7cc4934582d7e1250c.1748848482.git.mykola_kvach@epam.com>
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
In-Reply-To: <7bd75ecfff5b0a75ea5abd7cc4934582d7e1250c.1748848482.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.06.2025 11:04, Mykola Kvach wrote:
> @@ -857,8 +860,24 @@ void arch_domain_destroy(struct domain *d)
>      domain_io_free(d);
>  }
>  
> -void arch_domain_shutdown(struct domain *d)
> +int arch_domain_shutdown(struct domain *d)
>  {
> +    switch ( d->shutdown_code )
> +    {
> +    case SHUTDOWN_suspend:
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +        if ( !is_hardware_domain(d) )
> +            break;
> +
> +        return host_system_suspend();
> +#else
> +        break;
> +#endif
> +    default:
> +        break;
> +    }
> +
> +    return 0;
>  }

What's wrong with

int arch_domain_shutdown(struct domain *d)
{
    switch ( d->shutdown_code )
    {
#ifdef CONFIG_SYSTEM_SUSPEND
    case SHUTDOWN_suspend:
        if ( !is_hardware_domain(d) )
            break;

        return host_system_suspend();
#endif

    default:
        break;
    }

    return 0;
}

?

> @@ -1311,13 +1316,13 @@ int domain_shutdown(struct domain *d, u8 reason)
>          v->paused_for_shutdown = 1;
>      }
>  
> -    arch_domain_shutdown(d);
> +    ret = arch_domain_shutdown(d);

If non-zero comes back here, is ...

>      __domain_finalise_shutdown(d);

... this still appropriate to call?

>      spin_unlock(&d->shutdown_lock);
>  
> -    return 0;
> +    return ret;
>  }

Most callers don't care about the return value of this function. That likely
needs to change, even if _for now_ you only alter the SHUTDOWN_suspend case
(and hence some of the callers aren't immediately impacted)?

Jan


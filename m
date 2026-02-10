Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDtcAktRi2nwTwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 16:39:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A2A11CA0C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 16:39:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226523.1533032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpppk-0000yC-Tv; Tue, 10 Feb 2026 15:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226523.1533032; Tue, 10 Feb 2026 15:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpppk-0000vS-Qu; Tue, 10 Feb 2026 15:39:24 +0000
Received: by outflank-mailman (input) for mailman id 1226523;
 Tue, 10 Feb 2026 15:39:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpppj-0000td-ID
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 15:39:23 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab7125a0-0696-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 16:39:21 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-4801d7c72a5so34890015e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 07:39:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d7e63b9sm54983235e9.10.2026.02.10.07.39.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 07:39:20 -0800 (PST)
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
X-Inumbo-ID: ab7125a0-0696-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770737961; x=1771342761; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d5lLfMPk4EU13e2OPZRochpap/eiKpVYr4FpeGwsrnI=;
        b=gJp5fBxvIyJv6Bfur1OS6NDs2VV6/bMwZe6A+XNAqox71COxtkLAbasalGtG5lWTEf
         7UZ+EUgMuLg8C8YoDj9m5NKYqv2n3OZ0hwsf1q6aGMusxAqa3lnE5lRgiMGv9ASUzWfc
         gTxxTxYfyar9YO9nMiymm8mfy83MxW2viCDfVvspplBNq9Lp0+H6tJaoAjg+rNr6zj0J
         yqyfGqkTZf/NJXRzW0BVLnc4Gc2vmW9MeOY+yiBqpHq4GbYlCJNDY5wiE+DIw9u/1DRS
         hb/LMjjOLmY7Avbq4TQ0/8yHVO+Dj7YMk8JPSm+YcdlAZ0zgy7jqEjcXCB+e0j8Yf21z
         xFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770737961; x=1771342761;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5lLfMPk4EU13e2OPZRochpap/eiKpVYr4FpeGwsrnI=;
        b=aFNtdtHd3hG0bkFNiCUsuU6nDgr6hAnmptzTUAuGwjq6SWv28fYuEY8ha0ASdhDg5M
         LnTU5bOiY5dR7/bo5uhfW87Mwor4komCfcTa6+mcJXhyKadXobblDT0cblMgs2R6wILu
         8Ylr/ArBE4ESJIJ+gSzfybXCoD22phTreAW0Go65kkaOUyhZ8FXtUYITiO3X7j8sz1OO
         44l+9Q0iAquryG9rMgXkgWrWrlcn+k38s2ZXB+3HSrupzXwPlluKyG8ntqnBLqaI06cs
         KXS8OlyEx9EN+1U8a+GE3qDyOc3zI+PdKBfFfRue0pd2Vrzeg+9f8JtE8GYWDWq4yBQT
         8s+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGS6qSP1TL+6OIDpyT8yK9eiJhfgrKFclPaOd20PzQ7bm7Gv0nBlFEzsagcjGWZvN1gUM+gZ/Y4EQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvjSehSUJft4UbQ7zc+/SABhTFrKaReuHpEDTB+tDB47UvysiD
	cGdySMaXTnNw7bk91QiWNqLRVYxCgt7UghIwO9qD9WxYD5l8y6iOwINS5NsKzXey8g==
X-Gm-Gg: AZuq6aIbV1HGRaEv94z+L5gd//+JJnve8dveC7sGV/Xwbe+LPJEVDBlE7VWsV5rmJKE
	rd9z0PsuIf8g0COIzqbY7QkX/RLqHGnTAwWUxDqrZueuDEn7slhuQyIT8pKw1LmwQpuP628xa49
	2NrXkAX2x3ND5KGUW1DrIEEIql8Le2Q4VIUT90F+wM3s2A9wKhkOR/pVdQsWpvpvoDojpvRrKKh
	YM7WQ6zH4dgeCucRyWdY5Ckk7bRdLCJt5LsD0QxoerFozHUUMLsqjMjn/dC3SBhGlndtam7IYvY
	Q9oK2kPqgJCGUFMfVmIF2yH7lFQxMsfnW+HwLWsYnIDj1EVkxvJ+c2iN5YpPU7NR3uJETFCVsaP
	md6P3Ma5lJaMRaiIC6V+spISZpjKqu7Ec6t6n74dTzFWrGX0FuCGWdN6N2LInbQVWgQLisnjWXe
	Oz4WjAlnfoHXeQyx2eIW4rQ7RJsbeenKSwiEDV0QydGByLecDP2jj9AQGS53rYGih/dyt9onVe4
	3L8A592xSoYL1k=
X-Received: by 2002:a05:600c:470c:b0:477:7ae0:cd6e with SMTP id 5b1f17b1804b1-483201daa3amr197033005e9.5.1770737961135;
        Tue, 10 Feb 2026 07:39:21 -0800 (PST)
Message-ID: <6152fc3a-0169-4cbe-b1fb-a392901db34e@suse.com>
Date: Tue, 10 Feb 2026 16:39:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/domctl: Conditionalise x86 domctl using DCE rather
 than ifdef
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260210151008.217830-1-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260210151008.217830-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 72A2A11CA0C
X-Rspamd-Action: no action

On 10.02.2026 16:10, Alejandro Vallejo wrote:
> @@ -1033,11 +1035,13 @@ long arch_do_domctl(
>          break;
>      }
>  
> -#ifdef CONFIG_MEM_SHARING
>      case XEN_DOMCTL_mem_sharing_op:
> +        ret = -EOPNOTSUPP;
> +        if ( !IS_ENABLED(CONFIG_MEM_SHARING) )
> +            break;
> +
>          ret = mem_sharing_domctl(d, &domctl->u.mem_sharing_op);
>          break;
> -#endif
>  
>  #if P2M_AUDIT
>      case XEN_DOMCTL_audit_p2m:

What about this #if, though?

> --- a/xen/arch/x86/include/asm/mem_sharing.h
> +++ b/xen/arch/x86/include/asm/mem_sharing.h
> @@ -9,8 +9,13 @@
>  #ifndef __MEM_SHARING_H__
>  #define __MEM_SHARING_H__
>  
> -#include <public/domctl.h>
> -#include <public/memory.h>
> +#include <xen/sched.h>

As it looks this is for mem_sharing_is_fork(). Can this then please move ...

> +struct xen_domctl_mem_sharing_op;
> +struct xen_mem_sharing_op;
> +
> +int mem_sharing_domctl(struct domain *d,
> +                       struct xen_domctl_mem_sharing_op *mec);
>  
>  #ifdef CONFIG_MEM_SHARING

... inside this #ifdef? The mem_sharing_domctl() decl may then want moving to
the bottom of the file. Otoh I wonder whether supplying a stub wouldn't be
neater for the single use site.

Jan


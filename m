Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C7280E80E
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 10:46:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652840.1018880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzL5-0006AU-DK; Tue, 12 Dec 2023 09:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652840.1018880; Tue, 12 Dec 2023 09:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzL5-00068t-9z; Tue, 12 Dec 2023 09:46:07 +0000
Received: by outflank-mailman (input) for mailman id 652840;
 Tue, 12 Dec 2023 09:46:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A/PU=HX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rCzL4-00068l-E1
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 09:46:06 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43456c9e-98d3-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 10:46:03 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32f8441dfb5so5093663f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 01:46:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p13-20020a5d48cd000000b0033609750752sm10062063wrs.8.2023.12.12.01.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 01:46:02 -0800 (PST)
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
X-Inumbo-ID: 43456c9e-98d3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702374362; x=1702979162; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r6Gl96y201tYy51rPnNaNg2CtFCGBFP2qjHNwcPC+GE=;
        b=M21zE3tGAXtG5FqJkVyhWGyPOUZH+M85UyVXUqyT/hAqjxO63jrii7Qa82d7SVrekD
         5qLmDvARjW+4ccTJnr7UOTQUCg8Va/ZgCFeWTWHSXtNgA2XvwITaY7ZXx71WXShi7WdF
         XSMkMouC+dDWc9fiUlIjW0Eo9Uo8U7zCwgnMuBQ7cQTTkG/ZqlUq0G4+sSl16wMNj2z6
         qD2MlBQ86dW9eJjK//wWj1LHHEIupvK9tWaI/BA0ZxVQO4uEOExiYjMPCAcN4DqttvVz
         fjpAmSO2QY7Z/CEnWCMveOz5g9cFV9Q69YaGzjX3acZ2U19w877aLwAlsfsAKHq689nh
         UKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702374362; x=1702979162;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r6Gl96y201tYy51rPnNaNg2CtFCGBFP2qjHNwcPC+GE=;
        b=QNRIV3Ci+2rILDuASSEhcKclJbekHQRmGfyQAs7M1MgduWW5/k4IjGM1QKLZXR3+4h
         bPeVpE+Awu2vT535HHR+AYLswujCscNQZl1RbrwR/Tuqnf9mFqduoQF51kioWjbHmP1T
         nfiql2A5NAuN2F815lD2fwumKPrRaNRKiIcp2l7H3Xzp29FMRPwTclt0odrmKmTcstME
         szchQlNa4P7Jtq8S7TTtt6Qi+HGUwQSdPOeDXwqGpaa7v3Yx6jEVLitQblJFNWD4/yYv
         Da1+KiAMjukZdJoGWQ1kZeO6e2Azkj2N/9sWbLWEblvikeDPmjO1x4fVQVbm4Ea/yE4U
         aafQ==
X-Gm-Message-State: AOJu0Yyzu1A3hOYprA/uE49qZamcGnbj4hD2ZQ4+NKs0l0+IwIxbqbHc
	aI5WistDZVstddXNAKWfV6aa
X-Google-Smtp-Source: AGHT+IHd5s5/LsG8fEFfRVsR4bDZTVryHHDpvFsIIM31h2Gw+svAICUxRbs322wNh5Yih2XC4bs3BA==
X-Received: by 2002:a5d:43d2:0:b0:333:408a:9563 with SMTP id v18-20020a5d43d2000000b00333408a9563mr3123563wrr.124.1702374362555;
        Tue, 12 Dec 2023 01:46:02 -0800 (PST)
Message-ID: <b8aa0715-db0f-4832-9cd2-6bd2ca296853@suse.com>
Date: Tue, 12 Dec 2023 10:45:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/7] xen/shutdown: address MISRA C:2012 Rule 2.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <c0a8a12e39d688e101936d221af0f8eeefabe352.1702283415.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <c0a8a12e39d688e101936d221af0f8eeefabe352.1702283415.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2023 11:30, Nicola Vetrini wrote:
> Given that 'hwdom_shutdown' is a noreturn function, unreachable
> breaks can be eliminated to resolve violations of Rule 2.1.
> On the occasion, the type of its parameter is changed to uint8_t.

I don't particularly mind that extra change, but it's entirely unrelated
here. We do such when we touch lines (or maybe adjacent lines) anyway,
but here you had no need to touch either declaration or the header of
the definition.

> --- a/xen/common/shutdown.c
> +++ b/xen/common/shutdown.c
> @@ -30,7 +30,7 @@ static void noreturn maybe_reboot(void)
>      }
>  }
>  
> -void hwdom_shutdown(u8 reason)
> +void hwdom_shutdown(uint8_t reason)
>  {
>      switch ( reason )
>      {
> @@ -38,39 +38,32 @@ void hwdom_shutdown(u8 reason)
>          printk("Hardware Dom%u halted: halting machine\n",
>                 hardware_domain->domain_id);
>          machine_halt();
> -        break; /* not reached */
>  
>      case SHUTDOWN_crash:
>          debugger_trap_immediate();
>          printk("Hardware Dom%u crashed: ", hardware_domain->domain_id);
>          kexec_crash(CRASHREASON_HWDOM);
>          maybe_reboot();
> -        break; /* not reached */

Given the function's name, I don't view this removal (and the similar one
further down) as acceptable. The function first needs renaming so that
from its name one can no longer (wrongly) infer that it may reboot or else
return.

Jan


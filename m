Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFpzAf0DtGnjfQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 13:33:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D47F2830AB
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 13:33:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253653.1549787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w11h1-0006Py-La; Fri, 13 Mar 2026 12:32:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253653.1549787; Fri, 13 Mar 2026 12:32:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w11h1-0006NU-Hj; Fri, 13 Mar 2026 12:32:39 +0000
Received: by outflank-mailman (input) for mailman id 1253653;
 Fri, 13 Mar 2026 12:32:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w11gz-0006Mn-Q4
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 12:32:37 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b774216f-1ed8-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 13:32:36 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4852b81c73aso18628625e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 05:32:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854e2537c3sm201893065e9.15.2026.03.13.05.32.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2026 05:32:35 -0700 (PDT)
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
X-Inumbo-ID: b774216f-1ed8-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773405156; x=1774009956; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ep6eypw7pkKRyXmq3ejZV2pA2P85QpEPtRG7N6TlKgo=;
        b=Hh5tNC+suz58uG9mN5DACy2rL2Ly7rdH3oGC8SCRcF3BuGDpWEpGK29tSMKyCwLNKj
         wWRCka03772f3pYUelX8vAR/lPSH9S1CxGBIcKln9e+Q2/YhjMhrfxIiJHC6uPz/cKid
         ssuq8gd0gjfPVl53zCbShXhfYs7TIQhQoi8/vbdiThQd4pAkLdI204RZBwEq17so11Fk
         J261gyWH3c/42DjbkGw5iT51RRN1JxCnGcVI0fMtsyzmcsO4zwllYj2GZEM98EJpGA1i
         KKOUHt5eySfVI10QmHtezXgCyONW2esG4r29uqDc+3GRzAQPT9rsI6YRTaF+31dMVX/p
         oB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773405156; x=1774009956;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ep6eypw7pkKRyXmq3ejZV2pA2P85QpEPtRG7N6TlKgo=;
        b=dkcMayr0N1vx7Ral1O4thP/Lfo78dJyOq7nDZZbNLffn4LatrOsbIZMx4GoOyTbQNc
         sCVCKRk79ljroUtWOfE8JlyH6KWAcWgl2WQVCt1l76M+vRg4Ud8Lmx+Tbpks9PzX8oSV
         paCohJeREPAQ9BLrWW07G9FJ2md7Tfd0CYDaXjVgofCzN/CLfxRHUlP5jSn91nz3fSyT
         TDpKRt6nQH5EHos8RN4vKtPgr3FtzzZ0jhz1tTkCjERKRsAx/sIaKM7Q5Q4VF78UdpDm
         w7FEyW9nmbc9u8LjfmRlkdAjWNm5ZxFrWkfOUSpIzIp5OKDvQst4utSNR80w1/7J6P1k
         N/vQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0s1SIVYf6fQX2X3cd3AqhWvU2stcQZCuxWWgQ5jFj09bmAh7V77CISuAfyRrcjCiYi/3nWYer4i4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCZptgag2PNkOHx8EFkZIbvKXNsoZAB2Ixgsl4GaXlfHuDzOT9
	SLgI/8ur7AyV2s35Ol8eHJaBaMfLQofxtr4PAPUQJ2ZFiaS5wrQiUdDdTNIgRabYqg==
X-Gm-Gg: ATEYQzxaL/9a4n0ObWEKZnYmWRxCFvIWVxinmnOdOK2Bxaoi0lDn3bnE1bg/PTVoqqp
	AdeRz8OEDgg5WK2bVCdhhoH5seI52aAg/YhldOh4UZYcaRbHcEc+Wx5x5SD7zEgh7rqmzlYO606
	gNn4+3HajtvuOENm9w/g4iTlg5QXe77BCzK6A2ajSADVKMFNbzZW3Q2bsEFpisC10D4Lmmkiffa
	taA7/NJtrmp+0uLdpuWLH1FaUJ/SkwKL3BcrSttiRVr6ZQYi7dIbPijXhQWHRyLn2X795sOER12
	iSutVTDFLdtD/MK5/kq8NM7xeDZnGGRwwd5vweyPHxCUM4doIoYCQZe6MPYIy4LCvs0/gvThkkR
	TG3ax3i3Ck5K4LKePtPSfB5H1PzN2jdCu6l9n6q3XPsB+Wjg0Nx+kWYbH26J0sN2zrEDFtJCsEG
	dYgVWIAr69JUZ7WRj7oOxBinAWWuPeRwglSa02k7IOBTSOcXEMs8+g5DeV2rT/f+ANIeoo8S/Ld
	I3VhUvJVRlHkhmughzMYd/3xQ==
X-Received: by 2002:a05:600c:4583:b0:485:439b:683f with SMTP id 5b1f17b1804b1-48556700c23mr44227245e9.20.1773405156053;
        Fri, 13 Mar 2026 05:32:36 -0700 (PDT)
Message-ID: <81e3b3da-3958-4250-9d00-73df85c96442@suse.com>
Date: Fri, 13 Mar 2026 13:32:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mce: Fix buggy error path in cpu_bank_alloc() leading
 to UAF
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260313104954.590855-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260313104954.590855-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6D47F2830AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13.03.2026 11:49, Andrew Cooper wrote:
> When cleaning up from a mcabanks_alloc() failure, the memory is freed but
> stale pointers are left in the percpu variables.
> 
> Use cpu_bank_free() which is idempotent and behaves correctly.
> 
> Fixes: 2e6c8f182c9c ("x86: distinguish CPU offlining from CPU removal")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> 2e6c8f182c9c updated the success path but missed the associated error path.

I don't think so, see below.

> Prior to that, the paths were at least consistent since their introduction in
> commit 78c579426fb5 ("x86/MCE: Implement clearbank callback for AMD").
> ---
>  xen/arch/x86/cpu/mcheck/mce.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
> index 9a91807cfb33..684871b216a4 100644
> --- a/xen/arch/x86/cpu/mcheck/mce.c
> +++ b/xen/arch/x86/cpu/mcheck/mce.c
> @@ -694,8 +694,7 @@ static int cpu_bank_alloc(unsigned int cpu)
>  
>      if ( !poll || !clr )
>      {
> -        mcabanks_free(poll);
> -        mcabanks_free(clr);
> +        cpu_bank_free(cpu);

But this way we'll leak the allocation that may have succeeded, as the per-CPU
data is updated only afterwards. Yet it's those per-CPU items which
cpu_bank_free() reads.

I don't think there's any bug to fix here: Neither of the two pointers is
allocated anywhere else, so the per-CPU slots are always both NULL or both
non-NULL.

Jan


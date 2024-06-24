Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFC99145A6
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 11:01:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746313.1153322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfZN-0002P9-KP; Mon, 24 Jun 2024 09:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746313.1153322; Mon, 24 Jun 2024 09:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfZN-0002NA-Hi; Mon, 24 Jun 2024 09:01:01 +0000
Received: by outflank-mailman (input) for mailman id 746313;
 Mon, 24 Jun 2024 09:01:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLfZM-0002N4-3n
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 09:01:00 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4593d64b-3208-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 11:00:58 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ebed33cb65so45011091fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 02:00:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-716b4a7161asm5071197a12.46.2024.06.24.02.00.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 02:00:57 -0700 (PDT)
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
X-Inumbo-ID: 4593d64b-3208-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719219657; x=1719824457; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dT7YZDQBhpR14FjOxs9ZZkWGKMt37dkRONImkVu4yUg=;
        b=QYkj081QMkfPCIFbAYenhwUL+sIz3EWsQ+SCGPk5+MAc1Nt89cOzMuyaKi/7kWGupl
         wMj6uN+QXk9vGnvcuSliQC8YFSWfRtP4Df9RazDjVAk7vvlRHSm9mcdHvFL4S7s6AnQ3
         Ejb4fRAjVjQeYF2wsZPMAqDtGhOjIYOYUcLYuDdnveMRfnAXY2rG+yuP9bagaIr/vGla
         KQoAd+TzRhEqjiAmoB2QhrXHFy0Qfy/ZCIrZQZBminMYDCWFx3rNg3J5oTQLdzLZeqJa
         rrzU7NE0IL0fXeSL1VEgCHiA/K9L7CY4+kuoxMEMn/euXGsRCqMOc+NhpwtRhrzI013y
         BDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719219657; x=1719824457;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dT7YZDQBhpR14FjOxs9ZZkWGKMt37dkRONImkVu4yUg=;
        b=xI89fSvdjOQFuODHUT/LUqcWfa5JonfkNazdCEhBT0PLarqcsEqInJRDjse6b2vSa+
         z5hSv6Ye6VT2iEgMtxY76ywKJkVk+RAnKcX0ITkU6z/08B3VI40/FEueiRclhkKlV1Fq
         nWMik8WvV4fY/Bk93+GMhN8R6HdVXgYEYkHQ509VBsRAbY9Zo9Bszxab3yxRLy8cUj+V
         OO3ZVxNP+YzJO5SHGbAjssGiWwMJWUCvWykqCcHEvSeDptfx25M+xHq5pfD+wC0uLJpx
         GD/EeYy1C6PX2eR+4xSEjfm1+q0ycxIbrCddbjhZPg7bgxppzlCjDayxwCTJJ8bVLOTT
         RgZA==
X-Forwarded-Encrypted: i=1; AJvYcCXceXBo8UOzEJTni+sM6bEvWHsgQWlBOTeV8XBKIRcQP3JuVZoiOf8oVx2B4Hf8t/cg5r3PJoGV/cDEBfVdTvqjJITTq3m87eB2JmBSLh8=
X-Gm-Message-State: AOJu0YzF1oOIwsj4ziEZBDYiqz5Yc4dxKKExPjY7EDG/1Vz6j93ov13h
	U480TLhWqL1IC4KrllbZSvpNqhi8XfCdAavTemj6Dx25MB9HZzafR8aYd3Yikw==
X-Google-Smtp-Source: AGHT+IGfq194fgdZbAjcN22LuJxAdAQsGOlch951MnmWwZDkYJApzFx41F0sQjDuFO+iFgbpb+xKfQ==
X-Received: by 2002:a2e:9e09:0:b0:2ec:4ec3:9bee with SMTP id 38308e7fff4ca-2ec5931d8d9mr34268251fa.12.1719219657576;
        Mon, 24 Jun 2024 02:00:57 -0700 (PDT)
Message-ID: <d3856651-f5a6-4c96-8afe-336af2a60231@suse.com>
Date: Mon, 24 Jun 2024 11:00:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH] x86/mctelem: address violations of MISRA C: 2012
 Rule 5.3
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <79eb2f12e521f96a53dd166eb7db485bb3d9d067.1718962824.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <79eb2f12e521f96a53dd166eb7db485bb3d9d067.1718962824.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.06.2024 11:50, Nicola Vetrini wrote:
> From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> 
> This addresses violations of MISRA C:2012 Rule 5.3 which states as
> following: An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope. In this case the shadowing is between
> local variables "mctctl" and the file-scope static struct variable with the
> same name.
> 
> No functional change.
> 
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> RFC because I'm not 100% sure the semantics of the code is preserved.
> I think so, and it passes gitlab pipelines [1], but there may be some missing
> information.

Details as to your concerns would help. I see no issue, not even a concern.

> --- a/xen/arch/x86/cpu/mcheck/mctelem.c
> +++ b/xen/arch/x86/cpu/mcheck/mctelem.c
> @@ -168,14 +168,14 @@ static void mctelem_xchg_head(struct mctelem_ent **headp,
>  void mctelem_defer(mctelem_cookie_t cookie, bool lmce)
>  {
>  	struct mctelem_ent *tep = COOKIE2MCTE(cookie);
> -	struct mc_telem_cpu_ctl *mctctl = &this_cpu(mctctl);
> +	struct mc_telem_cpu_ctl *mctctl_cpu = &this_cpu(mctctl);

When possible (i.e. without loss of meaning) I'd generally prefer names to
be shortened. Wouldn't just "ctl" work here?

> -	ASSERT(mctctl->pending == NULL || mctctl->lmce_pending == NULL);
> +	ASSERT(mctctl_cpu->pending == NULL || mctctl_cpu->lmce_pending == NULL);
>  
> -	if (mctctl->pending)
> -		mctelem_xchg_head(&mctctl->pending, &tep->mcte_next, tep);
> +	if (mctctl_cpu->pending)
> +		mctelem_xchg_head(&mctctl_cpu->pending, &tep->mcte_next, tep);
>  	else if (lmce)
> -		mctelem_xchg_head(&mctctl->lmce_pending, &tep->mcte_next, tep);
> +		mctelem_xchg_head(&mctctl_cpu->lmce_pending, &tep->mcte_next, tep);
>  	else {
>  		/*
>  		 * LMCE is supported on Skylake-server and later CPUs, on
> @@ -186,10 +186,10 @@ void mctelem_defer(mctelem_cookie_t cookie, bool lmce)
>  		 * moment. As a result, the following two exchanges together
>  		 * can be treated as atomic.
>  		 */

In the middle of this comment the variable is also mentioned, and hence
also wants adjusting (twice).

> -		if (mctctl->lmce_pending)
> -			mctelem_xchg_head(&mctctl->lmce_pending,
> -					  &mctctl->pending, NULL);
> -		mctelem_xchg_head(&mctctl->pending, &tep->mcte_next, tep);
> +		if (mctctl_cpu->lmce_pending)
> +			mctelem_xchg_head(&mctctl_cpu->lmce_pending,
> +					  &mctctl_cpu->pending, NULL);
> +		mctelem_xchg_head(&mctctl_cpu->pending, &tep->mcte_next, tep);
>  	}
>  }
>  
> @@ -213,7 +213,7 @@ void mctelem_process_deferred(unsigned int cpu,
>  {
>  	struct mctelem_ent *tep;
>  	struct mctelem_ent *head, *prev;
> -	struct mc_telem_cpu_ctl *mctctl = &per_cpu(mctctl, cpu);
> +	struct mc_telem_cpu_ctl *mctctl_cpu = &per_cpu(mctctl, cpu);
>  	int ret;
>  
>  	/*
> @@ -232,7 +232,7 @@ void mctelem_process_deferred(unsigned int cpu,
>  	 * Any MC# occurring after the following atomic exchange will be
>  	 * handled by another round of MCE softirq.
>  	 */
> -	mctelem_xchg_head(lmce ? &mctctl->lmce_pending : &mctctl->pending,
> +	mctelem_xchg_head(lmce ? &mctctl_cpu->lmce_pending : &mctctl_cpu->pending,
>  			  &this_cpu(mctctl.processing), NULL);

By shortening the variable name here you'd also avoid going past line
length limits.

Jan


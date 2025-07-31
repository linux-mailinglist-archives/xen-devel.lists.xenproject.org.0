Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E66B173FD
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 17:33:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065788.1431106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVGz-0002Xc-RJ; Thu, 31 Jul 2025 15:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065788.1431106; Thu, 31 Jul 2025 15:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVGz-0002US-Mw; Thu, 31 Jul 2025 15:32:49 +0000
Received: by outflank-mailman (input) for mailman id 1065788;
 Thu, 31 Jul 2025 15:32:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhVGy-0002UH-6s
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:32:48 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b13ffb3-6e23-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 17:32:46 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b7920354f9so988736f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:32:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfecf3fsm1901165b3a.131.2025.07.31.08.32.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 08:32:41 -0700 (PDT)
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
X-Inumbo-ID: 9b13ffb3-6e23-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753975965; x=1754580765; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EULQZW2oaYrPpzCu+4wjaBxJ5/9WAaKQLdAXtUlhiUA=;
        b=I1cOKRIScxg/Ubtei5HueTXYiRHPiINpUqQxhuKefUqSlUkjDSOQH2gZWPyFaAqYMo
         EcX0fGGCILFV1wLV+zpNPxZxCwmXiJwxN/vEpUZau73yBnqzvIwTrRgAIxcsYZH71bKa
         EhQYEv05QHFfv7UQgCFCi8q8Un6m5Y84YixjiAdxgJjVIPYHbinXiaaqmoCU+29xVSE3
         jJKV1Hn2V2ImHvAqjG+CPOC07vupK7SSy4VS9uuLF+WDY1qHQnNHyXCBVvbINBrPVqf9
         nQ/V0NoY6huXv29xdbE20NTMtLV6dOihc8eORZ4d3FjoRSjPZACOk/wAGTzRTkQjXa9H
         0FtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753975965; x=1754580765;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EULQZW2oaYrPpzCu+4wjaBxJ5/9WAaKQLdAXtUlhiUA=;
        b=jB8wzuN0/W6gcMh9D7x7VvMd8/V+bLaf78edG89QbUSEkksoMmIZHw7rQLMkikM6xC
         HP1a99rSKHZAQ6mcUkZckdgaoo2E6C3aQNIAonhvqe40Rk7DqrcyAuRYfjqcZwaQ2cfv
         +i03l2cWyzmSeqgu3is8/WoTDyfwsUNkcJHgRs/sCvvk85TS++gYpopLuN829v8aLKjy
         aJQdyBzw9I7PrsnSUFLmwJpJsl2BCO6doT3+/hk8g7cKi7+ULFgOEuxmm3PzMGch3Zgr
         GAAUB48gSd3Lm9K3HyRAUqL79O90/a0w/Q92I1gKKAhKtyqIw4oHvlRFk+gVjrhTeYuR
         87iw==
X-Forwarded-Encrypted: i=1; AJvYcCX56xUFn/+AjI/HeHMHFbKdah/iNBV+NahbgIiWf2SySChFZ3FjAF2F5BArvOK5ppKrh93ye7v2KqE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwDXjyn20wDJiCgOa7y9mE9GsQeFO4MmTiqTVgVJNw8Y40fy4dk
	nc80GCgd9Gd4DLwCqdzLyie5X0kOhLGjtixI7CFlCcor6LX17AaI46ebCxhSd/zdag==
X-Gm-Gg: ASbGncvSUCKxnlXTUsPi1MOPDHUMUycU9RdCsJHk2aPoMfnteflnyIEgwl6S2isQLSm
	mJYrC08SrLfAHZBx3OmP5gVDYp2XIf7gqpTQdhxaqy12q1S1pUGo4VwscT/Ve4clSG392cvdVgY
	7ZkGBBVlevZNvXa9yU/AzRoQ5vGpM+hfnB8AztHzcrYNmaiGV9U/j7+l/hth4Y1CBCveLAUqIOt
	NFDVXc4bqU6aYJ+TAwryG86mgv86iYAghEoNMELQnFGdlOwsCij+I+nwpepPqW5OqO+GdyP5GKA
	KYhXDWdtmLEz8LyRWaFwaOcwH30dDEagnR2Oez3ERok2IJ7qSsRef6O8XXFLhM9g+IdgETQNuKM
	f+dzhRbpedJa96YrMAqurdG/8TqhlWohIbB1oXJrOgKtnDNRvwBIr9SQsx2fNeIwLCMTupXlCi3
	hw4nRkQLE=
X-Google-Smtp-Source: AGHT+IGcp1/3OV2d34nWxTkL14slyflsGE9kCdQQn4DTxH2CKy5Mk9/GTUsayH7hKoicsTIrtPmWRQ==
X-Received: by 2002:adf:f749:0:b0:3b7:8146:463c with SMTP id ffacd0b85a97d-3b79503d1c2mr5190031f8f.59.1753975964751;
        Thu, 31 Jul 2025 08:32:44 -0700 (PDT)
Message-ID: <34320c56-8c79-45d4-910c-2faa5ed4ac0b@suse.com>
Date: Thu, 31 Jul 2025 17:32:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: fix violations in macros GVA_INFO, TRACE_TIME
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <73cfc8a2d4d66042b49f44c69e672ce8ad0556ce.1753971749.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <73cfc8a2d4d66042b49f44c69e672ce8ad0556ce.1753971749.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 17:16, Dmytro Prokopchuk1 wrote:
> --- a/xen/arch/arm/guestcopy.c
> +++ b/xen/arch/arm/guestcopy.c
> @@ -109,27 +109,31 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
>  
>  unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
>  {
> +    struct vcpu *current_vcpu = current;

The commonly used name for this kind of variable is curr. Also wherever
you introduce one anew, it would preferably be pointer-to-const when
possible. (This isn't a request to rename or re-type existing variables
right here.)

> @@ -1899,6 +1899,7 @@ typedef long ret_t;
>  ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  {
>      ret_t ret = 0;
> +    struct vcpu *v = current;

I wonder if this wasn't better introduced in the two scopes that actually
need it.

> @@ -1922,8 +1923,8 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          if ( copy_from_guest(&sched_shutdown, arg, 1) )
>              break;
>  
> -        TRACE_TIME(TRC_SCHED_SHUTDOWN, current->domain->domain_id,
> -                   current->vcpu_id, sched_shutdown.reason);
> +        TRACE_TIME(TRC_SCHED_SHUTDOWN, v->domain->domain_id,
> +                   v->vcpu_id, sched_shutdown.reason);
>          ret = domain_shutdown(current->domain, (u8)sched_shutdown.reason);
>  
>          break;
> @@ -1938,7 +1939,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          if ( copy_from_guest(&sched_shutdown, arg, 1) )
>              break;
>  
> -        TRACE_TIME(TRC_SCHED_SHUTDOWN_CODE, d->domain_id, current->vcpu_id,
> +        TRACE_TIME(TRC_SCHED_SHUTDOWN_CODE, d->domain_id, v->vcpu_id,
>                     sched_shutdown.reason);

A few lines up from here there's another use of current that you then
would also want to replace by curr.

Jan


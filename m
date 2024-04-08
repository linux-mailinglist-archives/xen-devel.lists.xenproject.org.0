Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE2789B898
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 09:40:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701776.1096260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtjbb-0004BX-AX; Mon, 08 Apr 2024 07:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701776.1096260; Mon, 08 Apr 2024 07:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtjbb-000490-7D; Mon, 08 Apr 2024 07:39:51 +0000
Received: by outflank-mailman (input) for mailman id 701776;
 Mon, 08 Apr 2024 07:39:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtjbZ-00047g-CI
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 07:39:49 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c5458e3-f57b-11ee-a1ef-f123f15fe8a2;
 Mon, 08 Apr 2024 09:39:47 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4163de295f9so6045805e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 00:39:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z11-20020a5d654b000000b003437fec702dsm8255655wrv.21.2024.04.08.00.39.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 00:39:46 -0700 (PDT)
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
X-Inumbo-ID: 2c5458e3-f57b-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712561986; x=1713166786; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F+/oKUELsqXvouwaiwbPl3RMV1QOsYUOLjXNnFG9Qsc=;
        b=avF56SEGOoiw0K+vUgoHfBLXVCTwlBTaYO+ontvZvHKoenxU5DjLkWrVLM9o5IhkTg
         csAIDbZ8pgwgdBnebOBCTlQOgs8VCJntgcSRBGALBc2rkMDkWE6d+9TCe8tYjBC57U1W
         VBCVZ5uzNVA/66zWjHv2StHzR0B+flVgvDl6K+kjbgt6vToBKW61OCcNuTyffFLHqcFT
         2O92gG2rQ/CrMb0RstCud7zM/YU+dUXrVfsaGefXL6ff/eKlmPQBabL3PPp0Gj3DnoIN
         0bma/VuadJrKIWvh0FLB9J4F64ANoUc2HpWVWAoE5aLsqP+aPM9P2gos59sJTgTGCAfh
         3oEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712561986; x=1713166786;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F+/oKUELsqXvouwaiwbPl3RMV1QOsYUOLjXNnFG9Qsc=;
        b=lyIjGpc/utogYF0vT2ewL0IUAesdD3l3F/M6xBJXIlwaQTGdQqlSwW+lycelLIkmzi
         LfRo+Y4NbnWbL63x5P3scHskKsE3JaqOLPqSEvGLyfc7V5gfl1LcrUINlTRN4f/FypZ6
         EYYF3ZxT3EpaOktMJEyMcV0K3jKtHirRZO+7uZxVh7XzylBMr7zorWW3D/LJkeOIa/90
         CYHTQTELbCTSEIDd4z5qSSgSgTN9Tjq2Wk9ABy/lRgPGxKkY6kZv0AaOZ6+G0ckFRFc5
         y+gKF+SvKN0+Zw9+lIGsWc4l7/w67AoF+20v1RXNwm8iO4rmzou6YpSfMGTJIWYlPcCo
         kH1g==
X-Forwarded-Encrypted: i=1; AJvYcCU9wqYkbEpRTo9c7i1Agu4ikj60H3k8VBEgNc4xU6sR0gM2AOfm4XhxpX3yRNxCgRC0QOddQjM1kafWo5JwTb0rzaMIeXsG7j2t6fZfcII=
X-Gm-Message-State: AOJu0YwvazUXZPNeu6usV55f22Z+nYX5ctscjQSud7KoQnINOIBDqm8o
	ipSikG3eIuQJUr34LlLRxyYF1y1EfwUK68omRsd11EDbMPUbiIt+MY3G8eRdYg==
X-Google-Smtp-Source: AGHT+IF7TCBYVL9wv5yiZAgncdv3qG9fM5k6FtOeqj1QVNYnAe0etD2AL63bBSxTrBxbJDVP3BIPNA==
X-Received: by 2002:a05:600c:314e:b0:416:2bc2:d638 with SMTP id h14-20020a05600c314e00b004162bc2d638mr5847616wmo.9.1712561986453;
        Mon, 08 Apr 2024 00:39:46 -0700 (PDT)
Message-ID: <33239d84-3998-4ed6-a970-243fe4468b0b@suse.com>
Date: Mon, 8 Apr 2024 09:39:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/9] x86/cpuid: address violation of MISRA C Rule
 16.2
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
 <f957c92d9a00c66df47fc3cac336e378488b9fea.1712305581.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <f957c92d9a00c66df47fc3cac336e378488b9fea.1712305581.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2024 11:14, Nicola Vetrini wrote:
> Refactor the switch so that a violation of MISRA C Rule 16.2 is resolved
> (A switch label shall only be used when the most closely-enclosing
> compound statement is the body of a switch statement).
> Note that the switch clause ending with the pseudo
> keyword "fallthrough" is an allowed exception to Rule 16.3.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit once again with remarks:

> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -331,23 +331,22 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>          switch ( subleaf )
>          {
>          case 1:
> -            if ( p->xstate.xsavec || p->xstate.xsaves )
> -            {
> -                /*
> -                 * TODO: Figure out what to do for XSS state.  VT-x manages
> -                 * host vs guest MSR_XSS automatically, so as soon as we start
> -                 * supporting any XSS states, the wrong XSS will be in
> -                 * context.
> -                 */
> -                BUILD_BUG_ON(XSTATE_XSAVES_ONLY != 0);
> -
> -                /*
> -                 * Read CPUID[0xD,0/1].EBX from hardware.  They vary with
> -                 * enabled XSTATE, and appropraite XCR0|XSS are in context.
> -                 */
> +            if ( !(p->xstate.xsavec || p->xstate.xsaves) )

Personally I dislike with for of writing such. It may not be overly much of a
problem for simple cases like here, but the more complex the expression gets,
the less helpful it is that somewhere far away there's an enclosing !(...). I
may take the liberty to adjust this, should I end up committing this change.

> +                break;
> +            /*
> +             * TODO: Figure out what to do for XSS state.  VT-x manages
> +             * host vs guest MSR_XSS automatically, so as soon as we start
> +             * supporting any XSS states, the wrong XSS will be in
> +             * context.
> +             */

Much like one actually needs to consider re-flowing when increasing indentation
of a comment, it is generally desirable to also to so when decreasing
indentation, which in this case surely would allow at least "context" to be
moved to the earlier line.

Jan


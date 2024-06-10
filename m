Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9A9902539
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 17:16:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737372.1143643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGgl7-0005g5-8z; Mon, 10 Jun 2024 15:16:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737372.1143643; Mon, 10 Jun 2024 15:16:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGgl7-0005dh-5k; Mon, 10 Jun 2024 15:16:33 +0000
Received: by outflank-mailman (input) for mailman id 737372;
 Mon, 10 Jun 2024 15:16:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGgl5-0005db-KT
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 15:16:31 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69fb46b8-273c-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 17:16:30 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57864327f6eso45225a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 08:16:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c81a98bfdsm2023951a12.26.2024.06.10.08.16.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 08:16:29 -0700 (PDT)
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
X-Inumbo-ID: 69fb46b8-273c-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718032590; x=1718637390; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AfawYvK/3FPV8tNdd4JFKAjuYyTJiAyKxi7NnMRsCIk=;
        b=Bnik8D0+b/yWo6EuoPd4kcz3iCgByeXrDXPkTEeAu0o/kTx+yBxaoN0e5Nqxx3cP/C
         hTrYxHQGW2RvOUKyDN82I1AIKW2X1z83ZSFDuTXK/uRQtAx1qCvrVftxmo5rUIqiF45B
         CGoDF13qkUJruuH6SndCEhg5b4softxdA7cbRaFpNNHvsahHDowJWhKnLv3tM8HYGqud
         +GiXLfAYBMrwsZwphSUHeqdEu/QBzCtTqoIdtpgfVpCocYr8wUP5u/MGs9bEqeNVUNXm
         Udb9NdONufqR0kEKRgMo/kUBiaQnH66NDKmKaOas4SvowdvH0MJVVkbRjnyL7KxxTVxP
         v4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718032590; x=1718637390;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfawYvK/3FPV8tNdd4JFKAjuYyTJiAyKxi7NnMRsCIk=;
        b=TUNEFy/w6cFdIRp9fzh3o0hUXfHIgcGhBow9P9tGGVwr5LfqrsPANw3xNQNvdmRVe7
         XnfLrLYIlUKea1AtUClm4lQFRgfDCXnpBKJ2UvZCDrshEKE1q7ZleUBEEz2XIROCE70y
         eUnauIeFpz3752YMFLbPXBf3usPTTysFMiMC0SAVvfuJ9iG8t9bQoGKRtjyy/UoBWglf
         Xb/DvfhrRJJMQG9A+mTnJHFxPS/gbWtjM2S23mm6jAb4AYHx/fWJ80x5wRK+h+P7UsBz
         dD+IVjcbBPPcjE4Xf6GQ6Q7lVLxtOjQZPpRMrjMvTvh9zJ8LLPNop5Hyogz73wLpmDOE
         FweQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIUD9DIk1wuCtrsolQOusf08WXeCWafOg1ySfuPHsw8MDsIw9dukO6dhh3kpHCiSsDN4d3tumSQjOPaSrsQKcDNO2POb9CFyhw0tn4y8k=
X-Gm-Message-State: AOJu0YwfNb94Qq0WbqfWQrnUs6Vpej3UYRZCLBgxZpnNfVo8iR2rU1u3
	qVRjapSxq217UTUrdx/27u+3HGwBsQAi0es0bHvSF0aAngVjeWH9+2htLrwPpg==
X-Google-Smtp-Source: AGHT+IHRuMGFukhvdwxiYpB+k+Yt11iuwcSWLgGLy0v/omMOJ+oy1oz2FIhxLjiWt1K0Tr8wXO0oNA==
X-Received: by 2002:a50:874a:0:b0:57a:6aa6:b4f7 with SMTP id 4fb4d7f45d1cf-57aa55c697amr9815410a12.19.1718032589669;
        Mon, 10 Jun 2024 08:16:29 -0700 (PDT)
Message-ID: <6c7d0cc9-46b7-4aea-8181-0b21f8a9da48@suse.com>
Date: Mon, 10 Jun 2024 17:16:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 12/16] x86/vmx: guard access to cpu_has_vmx_* in
 common code
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <1645c0d4a5aae7b53cfb166ac10235e12ae4dbb1.1717410850.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <1645c0d4a5aae7b53cfb166ac10235e12ae4dbb1.1717410850.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.06.2024 13:30, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -5197,7 +5197,7 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
>      {
>          case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_ON:
>          case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_OFF:
> -            if ( !cpu_has_monitor_trap_flag )
> +            if ( !using_vmx || !cpu_has_monitor_trap_flag )
>                  return -EOPNOTSUPP;
>              break;

Here and elsewhere you're adding a redundant check of cpu_has_vmx, even
if that's not visible without looking at using_vmx. I'm inclined to
think that adding IS_ENABLED() to the various cpu_has_* that you care
about might end up better (for being a little cheaper at runtime).

Jan


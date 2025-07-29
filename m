Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A644B14999
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 09:56:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062130.1427752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugfCP-0007BV-4R; Tue, 29 Jul 2025 07:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062130.1427752; Tue, 29 Jul 2025 07:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugfCP-00079K-1U; Tue, 29 Jul 2025 07:56:37 +0000
Received: by outflank-mailman (input) for mailman id 1062130;
 Tue, 29 Jul 2025 07:56:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugfCN-00079E-V3
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 07:56:35 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b878219-6c51-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 09:56:33 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b7823559a5so1322789f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 00:56:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f7f6b0361sm6474782a12.48.2025.07.29.00.56.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 00:56:32 -0700 (PDT)
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
X-Inumbo-ID: 8b878219-6c51-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753775793; x=1754380593; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YVHdCvZl739hDzqWWyjzYW3u2zM14ngGrUnu30bWlgQ=;
        b=QOVk/HrUnB5JonwQGKWmaFGtEnAHHScqZeJsIM+37mmmncKiVxbfeEe8rzFyMD+yUN
         3PQlgugFYhuAIx53d9XPFhA82VQBvVNxZcAbYA9q1a/VHO1Ph8nupdIOYNaNx/12xW9w
         cmkjLA7+AijhZZnmpKqXYnW1wYWMpjgNXqRoVzVDoVRM9kYaM7I/IbJEnsSSj1usqKSe
         161Nwz1pCwk8yipMDaHJ4DLipSQWgSQVVeAc4lDY0gbaL49XBXB5fClZgirS9dgFY/19
         8kqKtV6/G6Su29X4YewiRABWrDnKKdizBR64/0gFvUV+yAAmGHqwr9l4EkIfqKIi38GZ
         prnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753775793; x=1754380593;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVHdCvZl739hDzqWWyjzYW3u2zM14ngGrUnu30bWlgQ=;
        b=YKv/3+HR6qc/WZGeFqjvHJvWrxLAEHX01H+5dH/UzjpAq+jhls6zQ9+fdrLWcHqFwA
         wSoySKGfL6m2w1cdpsZhOCzstAMI8pamP3s3kMZC731ruksKc2il/WPUCah2Qa+XvVBd
         MhDkp7QgJisizo7baAUlu3+dtmhER10RIm+WiSkmwmLvX1S10Y0iAqw0tQwnQXJ4YBJ1
         lsIizSUAPZvEv6VGH30tb4K03jCk6DMo+iYGMQ0sSJoL/COkpnKxrEo2sTbDCLXdP+aD
         NcWr6L2dED7EbFmsxmHG3Hp7OxZXwzdWGANcLZJurRrDMgqOQ4+F97uLzddmaok8sZJB
         aX9w==
X-Forwarded-Encrypted: i=1; AJvYcCUoB3BxrtrKu6bbepOQu0fAdWBMbH1bbjlAa4wL/Xm5qHcShtwyqQPeFkvziBktJ5EMf4tWYDyiSGg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxi7mPd771A/IhMCvjKhpgDO8zAUlrHkX3d/bDn+8bTeoNW8bvG
	BIHDgm0XH94VKBVQPvN2Li1uRlGCOFMuGROIf6tEKqCSwsfiP6Z53MJ2yN9bYC6Jrw==
X-Gm-Gg: ASbGnctP9oQapyYMzenoCT9ZtTyyc7K1yTPGOe7JlHxYXZgbCZ0e8z0cwg+CwlHmy64
	/JoC6GlzXd5/X2NWes3qWkdqB0WtbHMXJ7iiyZ+Lft4bL/PHsp0Zl6ysmLraOeZps00gbcKCvgJ
	gSqDjOTxHtK6Otic3pL8MuZTtrQotMzEWDBwqpVDAnAVhnZmBYBK6/qc+ZTkjjASgpT3VkvWVKa
	7we4NS5Y9hRbMEGrvOB3ACNrPi8oRkNxe76iQNRn96H7Fi9fQDktUd3kM683vP9cLjthNpt3Pga
	Tmn77fE5G8njF32LD/qy8aPuQAVDjW/Hc5Qi8ImvbTEGmgnLKll2Ntti0acY9/8CoJx5Lkq89kD
	gmF23TohYekQfPbRdlKvGctmxN8ukhJdbeJmK0PEXoSHJvfvbsrxnAOUzDf9ubaUg5vkV0eY+Xa
	96xZpgQ9Hp3pYVszrXNQ==
X-Google-Smtp-Source: AGHT+IG7yF3DfEeue5MS4ukJyZM414N9DltZa9qPd41f+yPfhYYvsTJZsuIWzFSrBd8piHZCErsFYg==
X-Received: by 2002:a05:6000:40db:b0:3b7:8146:4640 with SMTP id ffacd0b85a97d-3b781464affmr7091748f8f.56.1753775793263;
        Tue, 29 Jul 2025 00:56:33 -0700 (PDT)
Message-ID: <721201b5-323d-49ec-986c-f793627929dd@suse.com>
Date: Tue, 29 Jul 2025 09:56:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/domctl: add domain_lock in XEN_DOMCTL_setvcpucontext
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <034559c3324e137285065b12642cbf58b7ab5f58.1753727619.git.mykola_kvach@epam.com>
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
In-Reply-To: <034559c3324e137285065b12642cbf58b7ab5f58.1753727619.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.07.2025 20:40, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> Add domain_{lock,unlock} in the XEN_DOMCTL_setvcpucontext operation
> for protecting arch_set_info_guest.
> 
> This aligns with the locking pattern used by other operations that
> modify vCPU state.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

I think this requires more of a description / justification. May I in
particular turn your attention to this comment that we have in x86'es
handling of HVM_PARAM_IDENT_PT (disregard the 1st sentence for the
purpose here):

        /*
         * Update GUEST_CR3 in each VMCS to point at identity map.
         * All foreign updates to guest state must synchronise on
         * the domctl_lock.
         */
        rc = -ERESTART;
        if ( !domctl_lock_acquire(d) )
            break;

IOW in particular I'd expect you to explain why holding the domctl
lock isn't sufficient here, and hence what (theoretical?) race it is
you're concerned about. That may in turn clarify whether a Fixes: tag
would actually be appropriate here.

Jan

> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -392,7 +392,9 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>          if ( ret == 0 )
>          {
>              domain_pause(d);
> +            domain_lock(d);
>              ret = arch_set_info_guest(v, c);
> +            domain_unlock(d);
>              domain_unpause(d);
>  
>              if ( ret == -ERESTART )



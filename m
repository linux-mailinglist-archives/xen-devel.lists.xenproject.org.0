Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAE5B1A007
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 12:54:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069077.1432919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uispo-0006fz-FX; Mon, 04 Aug 2025 10:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069077.1432919; Mon, 04 Aug 2025 10:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uispo-0006e5-C1; Mon, 04 Aug 2025 10:54:28 +0000
Received: by outflank-mailman (input) for mailman id 1069077;
 Mon, 04 Aug 2025 10:54:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uispn-000657-Ej
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 10:54:27 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 636fa2fc-7121-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 12:54:26 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6157ed5dc51so7488000a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 03:54:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a9113e40sm6652004a12.57.2025.08.04.03.54.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 03:54:25 -0700 (PDT)
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
X-Inumbo-ID: 636fa2fc-7121-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754304866; x=1754909666; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OWMy1QLMS8QVqQKIxkn064VO81eytC/ovozPl41ez88=;
        b=CqaElqEOzPC76TnO5qHKk7mTjvHtV38u7pUNTvP+OOBSlRnFRlr9mgJRT92VP6WwPr
         N9H/R2Rl40UMYtQ6SZguk3RlkuUfUK5i7oF7Qo2DfITJugIl/XT1ncDjcUehAebFulVj
         CKuy1YDl89uA1YWM6AsbxuMWbqnmr9WVD6rPXPB3ZLjvcixjhA/0AsOD6J2eXWfqXx+o
         DR5gMPkHvjZAloa4FH555PKXLQyna6IltJ4htWtrAhz+Tr0lHn+83M5xJ6bjUmUeeOj4
         51BP5bEgyDJ++QOlu2zvO1oKapzYt7s3I5kSYQKIb2sKl+an5R8iNWx+v0z5ibZpKR/t
         nlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754304866; x=1754909666;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWMy1QLMS8QVqQKIxkn064VO81eytC/ovozPl41ez88=;
        b=X4krhjst3K5UkwNy2AYDJGxNZBmd2oakcH3NDyzYbcMmHCEF2UaRmpqio0wRgXGiR9
         u5luZ2Rn3qsRMeDZAtW1OBCdlHNBlrsXJiwxk5uK1b834ATbnT/LuflcXnZJPVqBCScq
         Psfd0O6esmQYS8BxmlKpXs8SMbfHLD+wBpQ/E9MWdaPXOTZIsQxnYTDL2tLkjwWTO0Bt
         5OaUA6ojuWuFNHZpf+Nql2HNPxasxOITAhU8+WGFqYdW98WmGIf4a8QvZnEgewXcS3wu
         /WQveLvmAAuPYzHUvxEjJy+MMi7iOUL6Ew+0H5m/eOX8QG/Boh5H5KochlfiugBScKmw
         lHLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbQ5lf7dVZhChMUYJAwBvj6EzkjclOvfcY45U2JNZUrTrRX5mSfhVMyTJtsPFohtl878xgzfIm4JI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDDqQyAZzUnMoYTmK3CdPgdn1IVRocqgSt9Ub2mtnrY2KuaykH
	j6wovbXWEf4ohN0T75hhI426OUcj6ju6upkeqHOWHoOlKhhga9h1SzubCdDNLaLpFg==
X-Gm-Gg: ASbGncuNEmR9qFtkIXJP/W7WPuwqoOv7wtYgs8XsImC3pe5ZiVnAoKk3YrbKPcWk66K
	oPNf5zm/AaNjtpB8h1yh88l/Jjwwou1Gy8MYjuN8rq+/cmSlEv1CFZHmMmcT58fauXA/Nhv3r4u
	F1QYCC+oGS8N4vCYqRElp0jTMB4z9aXwXGBvnZX8JjksYoG1Q+vsFMZMRV+YZIGNKzPnp7maTTX
	oHDR6BrPQlieMZeCWYGhCILnNOs7tZC1aUo9Rq2n3RqoObykUGIcteZi5MZe6RiaTPuO9d8lDug
	tvdGN3Zc+dQGgKvtw0z84rT5SwGNII9UhPzQAGXOPAKYhDdJLo34zl2qg+cJDgYhUCLLCJUMZW8
	dTnSvdrTNCca6jfhmVqa69JXJ9X9Hmx75uf85SErgflNU4EvosUyLpG17QiOB4X2gT3Syc5mg2+
	rpZDZLGa8=
X-Google-Smtp-Source: AGHT+IGJvRvXJe0KUXVpKnJXWkMunzFwD4YSSmPlWf1ejcH/HlSIQ946XrH41YiYhZmewK6aLBjaKg==
X-Received: by 2002:a05:6402:1ec8:b0:617:4a59:c5da with SMTP id 4fb4d7f45d1cf-6174a59c6bbmr3708450a12.23.1754304865893;
        Mon, 04 Aug 2025 03:54:25 -0700 (PDT)
Message-ID: <9564486c-19ff-427b-9d65-13ee4c8e429b@suse.com>
Date: Mon, 4 Aug 2025 12:54:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] tools/xl: enable NS16550-compatible UART emulator
 for HVM (x86)
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250731192130.3948419-1-dmukhin@ford.com>
 <20250731192130.3948419-7-dmukhin@ford.com>
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
In-Reply-To: <20250731192130.3948419-7-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 21:22, dmkhn@proton.me wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -780,9 +780,10 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>          /* HVM domU */
>          {
>              .caps   = CAP_HVM | CAP_DOMU,
> -            .min    = X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ),
> +            .min    = X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ |
> +                                      X86_EMU_NS16550),
>              /* HVM PIRQ feature is user-selectable. */
> -            .opt    = X86_EMU_USE_PIRQ,
> +            .opt    = X86_EMU_USE_PIRQ | X86_EMU_NS16550,

Rendering the comment partly stale.

Jan


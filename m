Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35442868A43
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 08:55:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685892.1067333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1resIz-0004Kj-Fp; Tue, 27 Feb 2024 07:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685892.1067333; Tue, 27 Feb 2024 07:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1resIz-0004JB-Cp; Tue, 27 Feb 2024 07:55:13 +0000
Received: by outflank-mailman (input) for mailman id 685892;
 Tue, 27 Feb 2024 07:55:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HnYt=KE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1resIx-0004J5-HE
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 07:55:11 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87c49ef1-d545-11ee-afd6-a90da7624cb6;
 Tue, 27 Feb 2024 08:55:10 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5648d92919dso5152922a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 23:55:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s21-20020aa7cb15000000b005645961ad39sm506626edt.47.2024.02.26.23.55.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 23:55:09 -0800 (PST)
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
X-Inumbo-ID: 87c49ef1-d545-11ee-afd6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709020510; x=1709625310; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6N5s7n+fNWhEu6tGZmRmFlf3iWQVPeoCf9N7x/6a50k=;
        b=AJ7b0b4TwaUHCYp6l9ssfS7U7QWrMXnfcce/kIpqqyarjD27omTu0OXT0VLRKxIIwL
         vYy9nzXbkqLJqhEIffSaMIla7IVIGjI6fMaMKPbXK9Eg6kpjvABLhjdsvlwe9iF3S+3y
         FwC5Nfaw+kitZ319E/J3AgveFwgqyk8Muvzpjy4ySO82a3xoPsZc6F20tM6L1y3N2QO2
         iwIc7/cOQggoCcpjSAkheXOItjxtS8HI+dgC8dZdiMnTaL2vLWEp20ZbQ7Q9CHzcyOAP
         OiKmPrNA0bCumihKol0jrueo6kbmtlpGxhA93LfUJhS9n5Z2hrwDVDc1WcMJMOjeq/Ue
         6pEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709020510; x=1709625310;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6N5s7n+fNWhEu6tGZmRmFlf3iWQVPeoCf9N7x/6a50k=;
        b=Cc3pVMpn6M9zF22lwFMaTwFwKfyTsELCszZ8zB89zx/VNOOE93ShWdCqYk2vOxkW3h
         hfLLcapwd4EP/+GRkthZZtK3AjyK1vCfRiV5XaF4uaBFTAFtN4C6VWsw6dWgbwvBzi4X
         Y3rMEh8aVqFzh4i/Ndxt5/ZDBvQT9YkePcqXHWTKyxnWBWqz7dyZP1i12vVh79x+oF/i
         DK/hx4ZZadTytfZ8eew4zqNkDpsJVHX1vHweKX8sG1xiZFY6HEekNi9K6fMn2SlIDnOY
         3BUz/JebDwNcBGRKmHvc69bJlf6SpwpueYWUsfGThJddP6MVNBw55CMu/bTu1kvMe0dc
         Icpg==
X-Forwarded-Encrypted: i=1; AJvYcCVZZfcTxEgaiacERwavyRxhwPwHw42H0OeJyDYQCJOEb8ryr6H8EktDp1iuNHGLS9faCDhCtylCA3mef2XDjhgPTSDD4cfvUrItz3hvEgk=
X-Gm-Message-State: AOJu0YyYAEi06MkdKoqz79O2p1uGHKZkz+DDb8GCmVuihK3Q73NczcLM
	UbLjeqqmGMLG3qNkPIxCwkxcNHLGMRyu6ccaHB867d2KdShyudew6ivkBoemUQ==
X-Google-Smtp-Source: AGHT+IFKRVeK8SvrAhq3ASQZICmD3fh3JiyTBAXrcpr3+fhE8dX6gfEC/847gbL30z/nurq3f3gnTw==
X-Received: by 2002:a05:6402:1646:b0:566:2ee3:4993 with SMTP id s6-20020a056402164600b005662ee34993mr936079edx.26.1709020509806;
        Mon, 26 Feb 2024 23:55:09 -0800 (PST)
Message-ID: <73a38d85-0798-4cfa-8625-0f8c9e05b2a3@suse.com>
Date: Tue, 27 Feb 2024 08:55:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/23] xen/README: add compiler and binutils versions
 for RISC-V64
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <ebaa05ded3cfddb1e3f7c87cd806b866312878fb.1708962629.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ebaa05ded3cfddb1e3f7c87cd806b866312878fb.1708962629.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2024 18:39, Oleksii Kurochko wrote:
> This patch doesn't represent a strict lower bound for GCC and
> GNU Binutils; rather, these versions are specifically employed by
> the Xen RISC-V container and are anticipated to undergo continuous
> testing.

Up and until that container would be updated to a newer gcc. I'm
afraid I view this as too weak a criteria, but I'm also not meaning to
stand in the way if somebody else wants to ack this patch in this form;
my bare minimum requirement is now met.

> --- a/README
> +++ b/README
> @@ -48,6 +48,15 @@ provided by your OS distributor:
>        - For ARM 64-bit:
>          - GCC 5.1 or later
>          - GNU Binutils 2.24 or later
> +      - For RISC-V 64-bit:
> +        - GCC 12.2 or later
> +        - GNU Binutils 2.39 or later
> +        This doesn't represent a strict lower bound for GCC and GNU Binutils;
> +        rather, these versions are specifically employed by the Xen RISC-V
> +        container and are anticipated to undergo continuous testing.

As per above, I think here it really needs saying "at the time of writing"
or recording a concrete date. Furthermore I expect "these versions" relates
to the specifically named versions and particularly _not_ to "or later":
With the criteria you apply, using later versions (or in fact any version
other than the very specific ones used in the container) would be similarly
untested. Much like x86 and Arm don't have the full range of permitted
tool chain versions continuously tested. Plus don't forget that distros may
apply their own selection of patches on top of what they take from upstream
(and they may also take random snapshots rather than released versions).

IOW it is hard for me to see why RISC-V needs stronger restrictions here
than other architectures. It ought to be possible to determine a baseline
version. Even if taking the desire to have "pause" available as a
requirement, gas (and presumably gld) 2.36.1 would already suffice.

Jan


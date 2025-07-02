Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC40AF0C1C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 08:59:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030244.1403862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrRV-0005SQ-Bz; Wed, 02 Jul 2025 06:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030244.1403862; Wed, 02 Jul 2025 06:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrRV-0005PH-8v; Wed, 02 Jul 2025 06:59:41 +0000
Received: by outflank-mailman (input) for mailman id 1030244;
 Wed, 02 Jul 2025 06:59:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWrRU-0005PB-CT
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 06:59:40 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e68d7e7-5712-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 08:59:38 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso3425033f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 23:59:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f539e6e5sm18261973a91.14.2025.07.01.23.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 23:59:36 -0700 (PDT)
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
X-Inumbo-ID: 1e68d7e7-5712-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751439577; x=1752044377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VQP9RGPskaajCLcRbn+gnpnRTsyMxyJqtJtwgYd4e70=;
        b=CmSq5ygKs1zU7hoO+AvSHSCW3A2moFoUbDjt6NdSH3P1UlCjDy89WhPmHty1rOQJQX
         waEkgCviAkZwpdicDKEsmGoxGN0bJT+JC7uWs1qLvUW2nE81Y72uIMe/wkYnVStuiRqS
         MFfMNRCpt2f5l0sePJs4tH8/k68tBUMckuzB+qk1WrnBJvR+dC2hEcN6rGDW73EVFoM7
         Es8HVDy10oXrIcfwRNWPqYFDDNi0zR1EiXkvAk70Nsp2zjtmdRj39giemmU5JIma/H1+
         CPGuceC+XTgimnhf3xZZ5n4IbbPZPth1nTIfUWPNiRt4uHrO49TXMkIIg8Yww9RR4vl+
         gRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751439577; x=1752044377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQP9RGPskaajCLcRbn+gnpnRTsyMxyJqtJtwgYd4e70=;
        b=OFuvvn9Liu/LUbi1rKJhPsGP1NHEEjF6DfaDIilEPyg/kgtpmi+Bp2SSkPGZUQWve0
         J9K76ejqd9+NQ5xd/OfwqTH6xLy71fpiJDbFrKq1weWuAlxdTk7tPQYj/FZahgF4KJ6l
         xSorb/HxdM2BEU7MtjZjKzFRYWjgfV5FtKeAkhUCcEfPC+K3GcazXyhqlpIt58nP4CiB
         t45gwoHc0d3Ec6fQheeuKhZU92EAwDjuKtXf4MgYlUTIfXK/FOhJi5JYZDTVhA+Tfm1s
         DbInms9oXB+LhulGWmH8NIkxkF4q6ObLFxnK+qWcJ4WqW2AR5969z0ehJVAV8WSiksm5
         6StQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3i7ReqSCsQewMcRQVvtaiYPE1/9yWSuGgk35zG/VrSfjeLaFQCZVa96918Kc0CgpmQN+mPN6svAY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFLQNjejUO1CMRZyhhd+DkrAobOf0ZH5QR36f0ypifFpxfqXEi
	jxIhWvFpPAhJOTXtj+Vf/4ljsEsaygFF0xUp3nDiwD23vQjlm3N80yfSGyIvVXnOIw==
X-Gm-Gg: ASbGnctu9+8zr6Br048b4ZPph5YKTRfjpUJ7jDh5QYS47JRcj8k35JMBVPbuOc483K1
	POTJph4C6BUCmIelCnweWAHWW20LWDzKNGPIiZvi8ebHj2WaaWhH/Hc7IPUQAVMKKz/rPPPswf4
	nWQ4JLJm9GE1smPAa18u3akItEmngC8mfPvA9H/CRY5+pP1sTnJx6LOUxBZB2BxOT2fSP/GmDqa
	uA0sBSr9txcBE8usZsMiww1Lni+UOnXjJ5pZ1Ugxala8DZfSh+T05LxpOKgyi/pQuxdkwA6bcOR
	4Eo6LhRFWWTQuu1rwEe95Aocx2Ntnsq6YVEY7pNdY9LZiCd8aV8KXLPs2A+Vd+227OIoubowtq9
	aLE1odQSA2NLwO1SJePUfM9Oss2UCiM96IJnsXS63q0o1iAs=
X-Google-Smtp-Source: AGHT+IHC6J2XewTluboYeFyaZvnm07YVEJeU/qCruNUN2igQloy0OSGsf73juAskIuuUcyQSTrr+Iw==
X-Received: by 2002:a05:6000:25c3:b0:3a5:2beb:7493 with SMTP id ffacd0b85a97d-3b1fd74c2d4mr986438f8f.9.1751439577414;
        Tue, 01 Jul 2025 23:59:37 -0700 (PDT)
Message-ID: <825a633f-a6fa-4edd-bd7e-45f2ef8d8880@suse.com>
Date: Wed, 2 Jul 2025 08:59:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hvmloader: fix SMBIOS table length checks
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1751412735.git.w1benny@gmail.com>
 <8981deefd675eabc6a60713aacf96e03fd756fdb.1751412735.git.w1benny@gmail.com>
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
In-Reply-To: <8981deefd675eabc6a60713aacf96e03fd756fdb.1751412735.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.07.2025 01:45, Petr Beneš wrote:
> --- a/tools/firmware/hvmloader/smbios.c
> +++ b/tools/firmware/hvmloader/smbios.c
> @@ -385,7 +385,7 @@ smbios_type_0_init(void *start, const char *xen_version,
>      uint32_t length;
>  
>      pts = get_smbios_pt_struct(0, &length);
> -    if ( pts != NULL && length > 0 )
> +    if ( pts != NULL && length >= sizeof(struct smbios_type_0) )

Please preferably use an actual variable that's available, i.e. sizeof(*p) in
cases like this one.

Also, patch 1 touched this very line. Adjusting style while touching a line
is quite fine, and typically even preferred over touching the same line twice
in close succession.

> @@ -504,7 +504,7 @@ smbios_type_2_init(void *start)
>      unsigned int counter = 0;
>  
>      pts = get_smbios_pt_struct(2, &length);
> -    if ( pts != NULL && length > 0 )
> +    if ( pts != NULL && length >= 8 )

No way to have (even uncommented) literal numbers like this in the code.
This can be expressed using offsetof(), I expect, and hence wants expressing
that way. Seeing the respective member's name will then also aid reviewing.

Jan


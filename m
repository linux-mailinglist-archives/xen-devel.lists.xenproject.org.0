Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E979C53EC
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 11:35:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834311.1249928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAoE4-0007am-1F; Tue, 12 Nov 2024 10:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834311.1249928; Tue, 12 Nov 2024 10:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAoE3-0007Y6-UE; Tue, 12 Nov 2024 10:34:23 +0000
Received: by outflank-mailman (input) for mailman id 834311;
 Tue, 12 Nov 2024 10:34:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAoE1-0007Y0-Nl
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 10:34:21 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab8bd45a-a0e1-11ef-99a3-01e77a169b0f;
 Tue, 12 Nov 2024 11:34:18 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43167ff0f91so48228005e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 02:34:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b0566544sm200244855e9.24.2024.11.12.02.34.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 02:34:16 -0800 (PST)
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
X-Inumbo-ID: ab8bd45a-a0e1-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmQiLCJoZWxvIjoibWFpbC13bTEteDMyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImFiOGJkNDVhLWEwZTEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDA3NjU4LjAxMDgzOSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731407657; x=1732012457; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=McpVfPYh7rYStkr/cetB2IgjE7dLSCUsaGei3tg+Ts0=;
        b=OSiDu5vqNNJMxl526lry+rX0iSr/6v4BI2jMl1BJWP7KanH/qY6FVG/f5QCYzO6Qgi
         jg3DzEgr3UhNFOoFzXohud+3Luuz9sFMvjxmpieEu+i9OOmSCWkz2xfVjYJp1fhs4aPO
         xfyKjY7i1Xdqgorbun2jQCsj4RHkIL970BnyFqpQmHokZ1dHnlyyB/QiCgBNri/5yxzw
         PZlsIyE4hpOAHYvB6BBMECDepCFQAKhECS6EORqIPYApJXwoMyUWpIaSqTFpajjD2kAT
         o1Q2qSDC8CJqpB2Pi5LnEIf4BJVcsHBeq+cedIcXjQNYPwODLr88KkvbX6HHfua2n14w
         px0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731407657; x=1732012457;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McpVfPYh7rYStkr/cetB2IgjE7dLSCUsaGei3tg+Ts0=;
        b=fZERqP3nuY7aDsDA/9MbI/n2HGwTg2vuWrRePXulL/y0fVzeHTk2Fmyl8xYbjbqkHG
         c3wfqPGd9qpAGqzIp8ZIYPZcBiMxZKE1eLdvb2+Vwpps8c2xRn2ogZyeuq+f8s6CBKGP
         6UomPJ2J1wuZSTdTvZR5Z3sAEr1QqAIkpgierZuTegRAp1fuuMuHOSYR637y/tcVx3dN
         XRJil3d+Q+6ylhmNmBl8idgwyuSKtRO4O5zPMfEXvlo9cGrBbAyeqaFy9osbdu1xoGnw
         gK6e5CjqnqHe4+sRorha+1djHnPMaO0BOojBAFKrfceg5j2eVbpdzUNjwM1qozYvQUjC
         /ptg==
X-Forwarded-Encrypted: i=1; AJvYcCVrmgIflLhDi/+7A95eK5l0QUWeMmr7DV9VHDmpIpPEwt+DO4aq6J7gYizhglnrxjbP9EqS1+1Zens=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJwMEbJv5EdwBQzUfyg/4hqLcFfzCtvZIRUoKkHvMg2h1Y0mrJ
	6eWPQdnzg904SvxZim+i6h5Q6fB86UI1mYvl64ymWgBuM+jV6QWELSp31rmHVg==
X-Google-Smtp-Source: AGHT+IGbNodrhAwk2ew/3K/JNap7Yp4NVo7Wx3cCiWC/DMSS/qUBNUpHQVixgmutWFY19bAROLsuDw==
X-Received: by 2002:a05:600c:4f10:b0:42c:b220:4778 with SMTP id 5b1f17b1804b1-432b7522dd3mr133377755e9.33.1731407657345;
        Tue, 12 Nov 2024 02:34:17 -0800 (PST)
Message-ID: <d26cc705-7e84-497d-89e8-1398713a71e1@suse.com>
Date: Tue, 12 Nov 2024 11:34:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/ucode: Don't use microcode_update_cpu() in
 early_microcode_load()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241107122117.4073266-1-andrew.cooper3@citrix.com>
 <20241107122117.4073266-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241107122117.4073266-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.11.2024 13:21, Andrew Cooper wrote:
> There are two callers of microcode_update_cpu(), and because one passes NULL
> and one doesn't, there are effectively two disjoint pieces of logic wrapped in
> a single function.
> 
> early_microcode_load()'s use skips all the microcode_cache handling, and is
> just a simple patch application.
> 
> This skips a redundant collect_cpu_info() call (performed in
> early_microcode_init(), marginally earlier), and avoids holding
> microcode_mutex when we're not interacting with microcode_cache at all.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Personally I would have deemed it more logical (and Misra-compliant) to
remove the "if ( patch )" case from microcode_update_cpu() right here.
Surely (by its title) the next patch is going to have the same effect.

Jan


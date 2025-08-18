Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08061B2A053
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 13:29:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085981.1444226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uny2L-0000xv-0H; Mon, 18 Aug 2025 11:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085981.1444226; Mon, 18 Aug 2025 11:28:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uny2K-0000vI-Tn; Mon, 18 Aug 2025 11:28:24 +0000
Received: by outflank-mailman (input) for mailman id 1085981;
 Mon, 18 Aug 2025 11:28:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uny2I-0000vC-Q6
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 11:28:22 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72555514-7c26-11f0-a32a-13f23c93f187;
 Mon, 18 Aug 2025 13:28:21 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6188b5b7c72so5570131a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 04:28:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-618b02b11bbsm6970123a12.53.2025.08.18.04.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 04:28:21 -0700 (PDT)
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
X-Inumbo-ID: 72555514-7c26-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755516501; x=1756121301; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yMss1VaCsT68Jsie8hsNeglTurGh81K1EwTj7W2pCMk=;
        b=ZASxtGD4yFSUlSz7y5ljJk8BBKca4805BN7ti5hYYMARDy2kX8kXAoVkNqBkhEF2Ma
         w2cn5mbLNTgs7FzDWiF2e6G8oP/e6vkKSwtFUZhfj7rUwJ2BuDhPe+qJnkO3kHxIZa1x
         B0j4aUC30kRTstrTp5RfovHrXb1zuUyfSN1Sfh7cfEe0WV+6z3tT9higDwQF2Svp1FmO
         1BVMxKtF5hrM5qhIEnprbfnUU7BspgxnYGLDmvN/2GEMWwab9p6FP7WQ0u8pEAwtDEep
         yKPi5K27Hjw39jWbpUm14R7as6Dkj6mqgzLtNu+8visbtgAlOsJWIeo4vkZUhLT0HxB5
         7DNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755516501; x=1756121301;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMss1VaCsT68Jsie8hsNeglTurGh81K1EwTj7W2pCMk=;
        b=VFSg29TR7cd68UDqIfuJa+uBSs+aDjmjUqaT8fFMW1ZNXDc9k+WKO/Bj9wbjaJR/10
         gnKMwLRHTAuslInOpaAi2BPFXDXE6FvfGp9GDESe66PF1e0VCyJ+hIcr34UfzqeEzYnF
         ille+r+GKZAEZo3sgIIm1Kl4zgap+10+76/nKTPtsOeioyXXEZuRRa0VI/4Oh0EOOebV
         zqcPbSeV5/+qm5CuCvwEzSJCP9jJI9PiZGrKArkiG8eJeho78a36Ea76hE5jG2w94IC5
         tiVFA3Txm48ryDdaCgaAm3e9ArROaZz5L/5mfc4zgTECRgDN1YvxyYNbS/9HYLlN0mQ1
         uXWg==
X-Forwarded-Encrypted: i=1; AJvYcCXj+s+iDhQ7Ea4KsavfzX5aef6UXtua1mc0zN+0afu/qkVhb2aNzoCZEtID6/rlWguvyAQ0NBApd00=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyX7EIk/qNIP+kgV+hzK+XyVHmmqeVxE0AkphnejzSCdthTpyAf
	NLx5Md5zSHdW+AVdqOVX2HG0kmchekzMJJNnL+y6AO0GTOoRNpJaDyk21xQUmNg2mVjVGAjGGMD
	KU3E=
X-Gm-Gg: ASbGncuMCtxTDNWP0DU33O5SnEhTXcKXpPKOU0c4FoknXYzM3P9wvYaMEoYio+1oDsl
	oAnmxuzHMOpe+beZnot7UOcxVM5i7KGkxIrYojlvwHNeTXE276aJ0wh5uIOflkCVAhx/h0Qw5GL
	j72Mc+k1hR374cNHxZmP849Uo3oySKl3Rf5gVCEaIMVf1sUfGSHScpdeR1DeMa9imeDsyhRbTy7
	3+uatBiEysbCz5t6ToVw42AHLGOcz/0gd+ITCsIoEnwInf1N074F+Mf/zZwKXp+f459Bc4T05Ld
	4YCRWuB1WybelFBATjeYP7SH8jvTZdU6Fekt/r3H5iraIOQPMvYCIJ4X3bCQ20WPxdWWLUJ69bE
	4mhlCDAoEhLLrtiHdCj7rdKa/bc8pVMFsXAAnVq9hXq/PYggyKJORVosVoaxk7A1RLTyqhxEC2m
	Ql6ndP66E=
X-Google-Smtp-Source: AGHT+IE6Ayvm7v7EtW2V96gwlk8gsyNLfcf17J47XkPBx+m3Tz7Fq5iNgvGEeRfyhNaDkC78/xqbLA==
X-Received: by 2002:a05:6402:5245:b0:617:c8a4:b0b6 with SMTP id 4fb4d7f45d1cf-618b054e61emr8864287a12.24.1755516501247;
        Mon, 18 Aug 2025 04:28:21 -0700 (PDT)
Message-ID: <9347c104-f686-43e3-bd70-dbe1f9f13cc4@suse.com>
Date: Mon, 18 Aug 2025 13:28:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] x86: Sort headers
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250815204117.3312742-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2025 22:41, Andrew Cooper wrote:
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



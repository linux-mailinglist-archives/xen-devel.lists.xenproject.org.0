Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255948A9386
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 08:50:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707966.1106438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxLao-0005cG-Sm; Thu, 18 Apr 2024 06:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707966.1106438; Thu, 18 Apr 2024 06:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxLao-0005ZW-Pn; Thu, 18 Apr 2024 06:49:58 +0000
Received: by outflank-mailman (input) for mailman id 707966;
 Thu, 18 Apr 2024 06:49:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxLan-0005ZO-IR
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 06:49:57 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddfaae23-fd4f-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 08:49:56 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-418e4cd1fecso2191065e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 23:49:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fm25-20020a05600c0c1900b00418e2b69e14sm1177031wmb.40.2024.04.17.23.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 23:49:55 -0700 (PDT)
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
X-Inumbo-ID: ddfaae23-fd4f-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713422996; x=1714027796; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0F/kjc/z5qQqOfJP8QEJnCklRuVvM0/v37PSfdIW9KM=;
        b=M95LAqF+o7cElKdwA9bNfQh2oLhSnb4CqhLWogJ9w0AJBoRho8jhq4f/oyJnT4o0fX
         Mfd3hjKJIp5zH7TmSW5zT4WY381fTSXvDr+ob1d7ffcp0Gol+nttpIxGM7xzLNJwIoYg
         jnJF37ImrlXrxm+YGVrno8KlyaVuWLdXpUh3BlmXMTp+pYdhuY5a0jTuESF1rNo//Ei1
         Q83TiF2ATZBvHrzbpl1M8Nz36fqU0Kv/S5mqVg2ABlx1Zd05lJyRBba2ixuKtYFzWR/R
         zxe0uidhaMuPZXvPZiNlIaS5/ttW5ltFsWCqArOmxlV4o1JBaGAlYjhdTaDGLM1gC0YJ
         OErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713422996; x=1714027796;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0F/kjc/z5qQqOfJP8QEJnCklRuVvM0/v37PSfdIW9KM=;
        b=en2ado93CiSYU0hKmlrOwtnRh631ArwWAlQl+aVv+7Fjx8dZ9v66ofhh9j70tCzYKF
         21lGyt7kRmiJ9zGt3YgJ9uTVQNQAchK/h1JIhUDjaa9R2+DgaFjkid1V4LMvwyW8jtIN
         H93ObJjJcu/Bfu6OoA5fDgadFfr3moSWgOW1JBJDfOmXdbo7p8UL/0+ExjGqo1cj0GSP
         5bOq9aemck2ZvON+ZK0j9SoCMaR91OlFOeEFco0u7vjIuqsTeJRYpHcmsKL6MTpYoRcI
         UX4zk4w42Be9t4uHwVlblALmAauIyokNJl1wk4tjh4Cr//wMTDv18cbOz0qc9eBQAESf
         f6gw==
X-Forwarded-Encrypted: i=1; AJvYcCWfGwRP4rSWxszrXXbO7jl5pqlkRkLqTHA9J0rEKIK5ePrVnTZgFPAtDa67xA9XJpGZyB6JWUJpdCHPfpRSUJqujXoADsisSq9s37aKk9Y=
X-Gm-Message-State: AOJu0YwaapyZM1KMZ38ye/Lt21W85rP8C3ObMrtpsNmKB00jArf2pxx8
	6s2EQNqQuHIIULUkL7x287hTLIS3aPGsHO9T0E7RY5o/h9P0CPGMB5CEOxpp4Q==
X-Google-Smtp-Source: AGHT+IHcXXF0rPXzClqVnTYP2DKW61yZ3SScbXppAPMagLMgZZHaimSjuuWLdAR/Zn8BBuz/ZXWTpg==
X-Received: by 2002:a05:600c:a0f:b0:418:6b23:bcc with SMTP id z15-20020a05600c0a0f00b004186b230bccmr1229773wmp.13.1713422995833;
        Wed, 17 Apr 2024 23:49:55 -0700 (PDT)
Message-ID: <97e46832-0d13-45e4-bf95-19ad11f9a8b3@suse.com>
Date: Thu, 18 Apr 2024 08:49:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen/public: s/unsigned long/xen_ulong_t
Content-Language: en-US
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: sstabellini@kernel.org, andrew.cooper3@citrix.com,
 bertrand.marquis@arm.com, george.dunlap@citrix.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2404101644130.976094@ubuntu-linux-20-04-desktop>
 <20240410234740.994001-3-stefano.stabellini@amd.com>
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
In-Reply-To: <20240410234740.994001-3-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.04.2024 01:47, Stefano Stabellini wrote:
> The goal is to use only fixed-size integers in public headers, such as
> uint32_t and uint64_t.
> 
> However, there are cases where the ABI changes depending on the
> architecture. In those cases, adding #ifdefs might be the clearest
> solution but it is also cumbersome. We already define a xen_ulong_t type
> which is widely used in public headers and it is defined differently by
> architecture.
> 
> Instead of unsigned long, use xen_ulong_t in public headers:
> - it makes it clearer that size might change by arch
> - it gets us closer to the goal of no unfixed-size integers in public
> headers
> 
> Note that unsigned long and xen_ulong_t are the same thing on x86 (both
> 32-bit and 64-bit) but they differ on all other arches. However, all
> the interfaces with xen_ulong_t or unsigned long are x86-only interfaces
> today. Thus, this patch doesn't introduce any ABI or semantic changes.

And it is presumably because of this that the conversion wasn't done for
these when it was done elsewhere for the Arm port, many years ago.

> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


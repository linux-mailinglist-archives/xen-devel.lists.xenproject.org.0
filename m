Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 730F387B846
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 08:06:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692883.1080492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfAe-0001WK-DS; Thu, 14 Mar 2024 07:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692883.1080492; Thu, 14 Mar 2024 07:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfAe-0001Tn-9h; Thu, 14 Mar 2024 07:06:32 +0000
Received: by outflank-mailman (input) for mailman id 692883;
 Thu, 14 Mar 2024 07:06:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkfAd-0001Th-1x
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 07:06:31 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 610f8199-e1d1-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 08:06:28 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5684073ab38so1135902a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 00:06:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 eg22-20020a056402289600b005682fbc2531sm397893edb.74.2024.03.14.00.06.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 00:06:28 -0700 (PDT)
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
X-Inumbo-ID: 610f8199-e1d1-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710399988; x=1711004788; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9P1OYHEIZ00D70YK/MTK2q4gEfIL8FZO5C4MTZJrik8=;
        b=G+62XjKhkQztUfDwBDwhJhAp0+lvujsfvAQtggRhGuA1JNfOwre+0itBZsWIZLVXn0
         LRx25dMCuDT8J5yecai2HJ/ViVD2t+n0jRBDRwcEePfXiL2v/Dpe0C72fJByQhNJuVmj
         Cv0Ovah/Sdm1Qb7AEpGF/RIFnYt/aiu2kU3gckLZsYSWs9cu00+ryyjEneY9fd6IKqHn
         fwugXnbWn3uZmt7sS2keik2OX2PeUsEtH/IY2F7x/90A+ib7gSqTTQpRol6LikEzyfcd
         TxOEZ5SJQxZYdGZxDe6m7AvsMdcuOejK6VriwEdrvO0aB4rVQydft87RNgcdyhcB4VyD
         4fZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710399988; x=1711004788;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9P1OYHEIZ00D70YK/MTK2q4gEfIL8FZO5C4MTZJrik8=;
        b=vRd4vO4430MS4hkqdIpDsOcr/TwQyQfxbUIacUENtctn4bl5WcoE9Jt+EyVwxr4Zz9
         aS8OnymKdI1tLXPHr2aqTQ/nshsrI7L6nC4KbSc+cpA0SbL8uc40evgQcmo3gEnETNeq
         zx3fbfKngMW/j4in83/EAZzsX9BjkMOEFQgreX17XfEEvDBa8pMlc6T+wmjoTFjEVT2T
         JJgKEY3OtEQ5x/zThAATseqy4P8OTrcKR8ayZaK1MZkt/F6qqvDqojJ1e5nYpblRbsmg
         gRUrPCcOMB7PTlTn2B8iI7C4l0SHF3tvbgQy82VA7wzCQlTJfPwGezeksu7HgwNZwtzr
         XxNg==
X-Forwarded-Encrypted: i=1; AJvYcCWmu3rB68HPK+VSI5Pvw0cKep4lggj/YNhMKniRBIeMLqleSJLF4q85UOWF6UOzyCOSZQYIH+P3scFD7eGRhfYJww6JNXOEUURtdp35Yf8=
X-Gm-Message-State: AOJu0Yy96w+CJ5FA0oDg4Tu2AjY92ceKNWKchMzXvN9cdA8QU37gArem
	rQf8vHg3c1ZReJESzWmAj/AOMv0Bmd9rmM7LG88Ni1EJewEqpPUTpc5WblEC1w==
X-Google-Smtp-Source: AGHT+IEWtqa7IXxXxoU6Zayu+tLvIcUZ3CgKocmrCpSSW8tvucasIBcihFSI04JmZ5fAkeollUsyow==
X-Received: by 2002:a05:6402:1f14:b0:567:1263:e31f with SMTP id b20-20020a0564021f1400b005671263e31fmr1183986edb.10.1710399988467;
        Thu, 14 Mar 2024 00:06:28 -0700 (PDT)
Message-ID: <97516382-b756-48da-a358-6b093c4cb20f@suse.com>
Date: Thu, 14 Mar 2024 08:06:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: make Roger an IOMMU Maintainer
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, bertrand.marquis@arm.com,
 george.dunlap@citrix.com, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2403131638530.853156@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2403131638530.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 00:40, Stefano Stabellini wrote:
> Roger kindly volunteered to step up as IOMMU Maintainer.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>




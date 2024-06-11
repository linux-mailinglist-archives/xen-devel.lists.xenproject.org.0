Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFD4903DE7
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 15:48:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738439.1145194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH1q8-0000eJ-SJ; Tue, 11 Jun 2024 13:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738439.1145194; Tue, 11 Jun 2024 13:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH1q8-0000cH-Pm; Tue, 11 Jun 2024 13:47:08 +0000
Received: by outflank-mailman (input) for mailman id 738439;
 Tue, 11 Jun 2024 13:47:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBrw=NN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sH1q8-0000cB-4Z
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 13:47:08 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1661b7e5-27f9-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 15:47:04 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-57c60b13a56so4769174a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 06:47:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57aae11a98csm9271232a12.48.2024.06.11.06.47.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 06:47:04 -0700 (PDT)
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
X-Inumbo-ID: 1661b7e5-27f9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718113624; x=1718718424; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JHbMF6CeepYRy3Wn3DYzNdxmP6DQLhUOKuKCEK/M2JE=;
        b=ek5cNokgkLVWLvM0IcMLe11KZf5pFpIkK+nEq1rhl8RX7ydwhltyYJhuIsYZGUjQAI
         OTin4ZR0DHoQEzstaBrWK7pcOK4+OQQh5r5lNj0Hlwk5D4Km5tfoTFgj7r1wGctJ4hdM
         I2GC8O8pFanJme1+Yc8Xk5xPUcZE39HE2pyhyIYo1IYlxoMzjNErvdDkEm3jGUcA/rU2
         wHkRCbYEWNs2io15ym0qK7apIMWi3h8TvpqILn7+4ahqM/2dliln+lj0pSGaXJGcytLX
         oHKBTMJzZWUkWVvrQl87JOayCUtpWsYFzNdmywoxuzp4+zqVKkYxV1SQGwNpeehLnkPg
         EJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718113624; x=1718718424;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHbMF6CeepYRy3Wn3DYzNdxmP6DQLhUOKuKCEK/M2JE=;
        b=Ey/5rvv+ZzBY2B+kmiY/2dShya0MpkW1n44Q6kiKXp/p+tNkBjrmGXdxwO5fcmqgv9
         QmLbJBxOqODXl6D7JTALbwca7kbMlwL2sDH3gRdb7hyLrvSr20OREo9Bb8XG1HXGhY09
         17cZBXXKV7irxg58cm7tL9qYENe5zIcFD00tOPju72/6fZz6mjJ7ND2/rpOuAfINDOkF
         laTzNyMYnkIsULEoaRE3vMQ18Ej2XVOUZBUAhvLwNoIjohOGwU/0LSn2Q2lTJJrBUifM
         Q6BzqzP1FC50VNF7eaCq4x0/pXcgMrCrQQB2MI3wnOt/vcvONU5CsshvKoFp8QxGMhN2
         NDlw==
X-Forwarded-Encrypted: i=1; AJvYcCV4WRJdJvt9cgW3tiPBywet3psclzTuUmAfpEsnqiBlWhRmUZqdlgZl3DbI8oseM1KiC9ARcZ5iAjd3Cdn5pl1/bx4nqWZd+5BSFNpmyGs=
X-Gm-Message-State: AOJu0Yy0QID036I644CNtVkYk8K16GsykTsCurGhcvZhDSAJ9kor/7Yb
	55mNkkQoYra55htMnf7D5WGo9Ebayab2LGgw9WexdEmaFHbLy29tSefQNCW24KlEpJx5bmsgNuA
	=
X-Google-Smtp-Source: AGHT+IHReDcHCS+52c26gyCdRw2S/o2RgLjjuqd1dJKhSZ3UgjnLw6Jjzgi3U4DedD7YQO6l1EyeqQ==
X-Received: by 2002:a50:d5da:0:b0:57c:61ca:eb8c with SMTP id 4fb4d7f45d1cf-57c61caec8fmr6117494a12.42.1718113624310;
        Tue, 11 Jun 2024 06:47:04 -0700 (PDT)
Message-ID: <9a7e5fab-7ea7-4196-bbc5-5c9e286cf576@suse.com>
Date: Tue, 11 Jun 2024 15:47:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] x86/irq: deal with old_cpu_mask for interrupts in
 movement in fixup_irqs()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240610142043.11924-1-roger.pau@citrix.com>
 <20240610142043.11924-6-roger.pau@citrix.com>
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
In-Reply-To: <20240610142043.11924-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2024 16:20, Roger Pau Monne wrote:
> @@ -2589,6 +2589,28 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
>                                 affinity);
>          }
>  
> +        if ( desc->arch.move_in_progress &&
> +             !cpumask_test_cpu(cpu, &cpu_online_map) &&

Btw - any reason you're open-coding !cpu_online() here? I've noticed this
in the context of patch 7, where a little further down a !cpu_online() is
being added. Those likely all want to be consistent.

Jan


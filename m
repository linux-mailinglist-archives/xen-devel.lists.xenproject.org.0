Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 969AF914381
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 09:21:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746103.1153053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLe1J-0003fD-95; Mon, 24 Jun 2024 07:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746103.1153053; Mon, 24 Jun 2024 07:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLe1J-0003cG-6D; Mon, 24 Jun 2024 07:21:45 +0000
Received: by outflank-mailman (input) for mailman id 746103;
 Mon, 24 Jun 2024 07:21:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLe1H-0003NU-Qr
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 07:21:43 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 679a54ec-31fa-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 09:21:42 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2eaae2a6dc1so64726511fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 00:21:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3c6032sm55886325ad.150.2024.06.24.00.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 00:21:41 -0700 (PDT)
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
X-Inumbo-ID: 679a54ec-31fa-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719213702; x=1719818502; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t0VRRgI0YpuhZtxfk6hZfAMe5paQe2bl7GpLBR+tLnQ=;
        b=LQDUwq4nYCFdDoNOXfEk/GSqcUfZiYdliQpen1fvbfWnXpJidqiNKzK8OUv5VIaOYB
         xviz81APFicgUeD5/en+obJ0hG+bcqnkJLTcF9EIK/k7yzhyc7+AWnVt6Z2KMKXG5Gzv
         k/LyXnuG4e80byOvteReayegwOxDZgt9q9WnCK6fMeVPxZ5Nqc71GP+XPIsuuE30MC22
         ADsrbrI8M/xO1SjKt+gKutTdXa8Avp7ouQhUOByvZ0ly5XSHo6ZZwLkxEYhjYRLeYC1R
         b2G33U1IcmmBM9CxonWg+g4Ml8C0uEeR11eLnqTme/XsaHkKmB2u1sYw9JbKX0Ux7BeN
         hzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719213702; x=1719818502;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0VRRgI0YpuhZtxfk6hZfAMe5paQe2bl7GpLBR+tLnQ=;
        b=MVDKBifFJL5aPydC7REc17EjVWJwNzfweKP91JrS8/35gKd+klOeYeIKwQ4v6R/lGC
         g+yzdAzU7uJ9o0JyPF6bsD1U0EzGZPUYCNnG/f+32QW73bdTNKIQmIEvqOVfJN77S2kI
         VjDjj5xLNk8zlG374J7TTBVEDgIc7IOZg8wAhIfLcT35XPKjgg6jKZRPgx1+oGTsQkKH
         Avq/erJGqCpeA6gfP61MIGlEMquONNxs57BOVu/Dog+If2/GqU9+lQn+Tc8P8e6mYxZG
         Ytzp+ohP4+fFx8WdD0xDs7E3oKzNAxilCOR/hNa4OLLyCNTXs9wkpd7weHuaCWvipEJ7
         Zl7g==
X-Forwarded-Encrypted: i=1; AJvYcCWkiyv2Cl1JCK/ZqWv2eTgr7KmMZHHYPeR+UYSzIfWe4hpODksyLZMJJhYkndlUH+18l+NXbHWmGP60klFqqN4JSjfc2fMR9/P6r4M3o3c=
X-Gm-Message-State: AOJu0Yzwg5KeW8GufjS3hY0J5O3oMfiFFfQTPHAtLH40qUNlQa//EEwt
	d1wwrOS31FgcUKRcis76Z0ngP0oG6YeEHhSwMQ37+OMd42pDJws5i9jm+1cGxg==
X-Google-Smtp-Source: AGHT+IHfv1JnBtP6q5w+iBcyQi/J3lYL+eDMn+K2N/GD1jpOYJ1bj3a4tw9LO0bnhoIECE6WfGXkiw==
X-Received: by 2002:a2e:81d9:0:b0:2eb:e7dd:1f88 with SMTP id 38308e7fff4ca-2ec5b2e5fe5mr26347671fa.25.1719213701625;
        Mon, 24 Jun 2024 00:21:41 -0700 (PDT)
Message-ID: <59da345e-0c2b-41e0-bd04-1f4fff8c905c@suse.com>
Date: Mon, 24 Jun 2024 09:21:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19? v6 6/9] xen: Make the maximum number of altp2m
 views configurable for x86
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1718038855.git.w1benny@gmail.com>
 <fee20e24a94cb29dea81631a6b775933d1151da4.1718038855.git.w1benny@gmail.com>
 <4a49fe9b-66fd-4a32-ad01-14ed4c5fc34c@suse.com>
 <CAKBKdXgUKYoJfB1mG+6JSaV=jWpmRmS1UbQ6N4JNZ774rP_PoQ@mail.gmail.com>
 <4cf14abe-881e-4328-9083-bd04afd6b307@suse.com>
 <CAKBKdXg5jCJwW2n2rkWS1aeHTN4X7-z-STft8n4xJ59JCTDhYA@mail.gmail.com>
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
In-Reply-To: <CAKBKdXg5jCJwW2n2rkWS1aeHTN4X7-z-STft8n4xJ59JCTDhYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.06.2024 13:40, Petr Beneš wrote:
> On Thu, Jun 20, 2024 at 9:25 AM Jan Beulich <jbeulich@suse.com> wrote:
>> Not exactly. You may not assert on idx. The assertion, if any, wants to
>> check d->nr_altp2m against MAX_EPTP.
> 
> In addition to the check in arch_sanitize_domain? As a safeguard?

Well. Such an assertion can only validly be put anywhere because of the
checking done in arch_sanitize_domain(). You can view such assertions as
both a safeguard and as a comment-like thing.

Jan


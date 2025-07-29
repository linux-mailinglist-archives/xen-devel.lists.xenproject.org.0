Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FACB149B6
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 10:04:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062139.1427763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugfK9-0001BH-20; Tue, 29 Jul 2025 08:04:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062139.1427763; Tue, 29 Jul 2025 08:04:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugfK8-00018V-Th; Tue, 29 Jul 2025 08:04:36 +0000
Received: by outflank-mailman (input) for mailman id 1062139;
 Tue, 29 Jul 2025 08:04:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugfK7-00018P-Fy
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 08:04:35 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9578395-6c52-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 10:04:33 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so31908405e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 01:04:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-240358f4ab6sm35311285ad.49.2025.07.29.01.04.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 01:04:32 -0700 (PDT)
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
X-Inumbo-ID: a9578395-6c52-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753776273; x=1754381073; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cnWKycos7Jt6mgsZMWlW66OPLc5G675UrJA0ODOoOR4=;
        b=QqPsTXUYDWHhNgFD3k8KWFC2sUijS+V/BgeIRTdYlJofshjhjzFu2KOzCld2m7R65O
         DFWWvysPeNPlQYqhTBWSzTkds1Y9odKvtrBiU1YGuAE3KyqBOaXJCbIzzpHuU/0yVUcI
         6AE1dzfrlnZ/OLzCsiWr+2qNZqHmDOH3Kz/5lSZH5hV6f9j34jvXQXKpl298zt+1VXUJ
         fbUD2T+AGFcnGs/WJSQ/RaR1vB0K/J59sDeQJJkxNxoEW7oSFeWpf2PmksP5GUu0LnLs
         fImvCUvnXwYqmN6UPJ6VuOTkjbKLfnmuuXXY9EiIu6YEGthksDGTSgEIqS9pHMG6ImxM
         IDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753776273; x=1754381073;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnWKycos7Jt6mgsZMWlW66OPLc5G675UrJA0ODOoOR4=;
        b=qkNAz4mm2BhK8/W37FvJeKw9Cbg4q5wOzYnVgwqYt65dRkokO9Gz33CQKLMw5HH98L
         Yjq/mcLKm9zTnMrM/849zkxg0jgzDTSzCB8OaOuBlU1M9Rj9tGqHuMPhnHtQMfnojSAP
         e0eMsMGVQU6kPZxMA/hNT6v5/mYjv/mUgXeNstzRfRSU9dI96zidENT6TlVIvTgsrGcN
         +Ai8AM+QUhh/U9PmNdZHhuv9rmZVsixZwwFUOYxkJ/KjfVd/Fo0nWKKBU5NbmZ7xYSmg
         weQKj4Py2AkjLQnIxTlYCg510iTpxXbeU1s24aKwMJC9zuBm9nEkxWSkutakQFq9TKun
         ma5w==
X-Forwarded-Encrypted: i=1; AJvYcCVqInF1Qz90Llhl/5L8YSkHSeVdzmq/KYGeGSx2TC+0byPMeFBSfFx9nku9LnGQaHLTGEqM01k0MKU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGfCJW92A+Ca6tyb39s6bLHW7P/BcGI0LyNikSPik/jtSks+lV
	BgwngXFF7XNn8nD8HEPoyPD4cV/OYzkntea84h0yxs78g1w9kucLPtyC0HnhKvlo2w==
X-Gm-Gg: ASbGncuBJf+eVO21nzMal8YE5QHzn7xLSujOxCIGHypPdnazLYlN/+Dat24LzUyYjPO
	RuMetoPZ+DLDa63iEUGvKhliz2xsA+v7EgGoNwRWMyMgrALW4jCMg0lg/mu5S9Ueb+VpgL25AGg
	MxcOfsLTiTIkZMi0rKgjKDPduAE9VNhsapD+mN22Pl0YF5O4fIw9ib0BDvnevq56KM9Atvwh3ro
	w0xpqDTo31TuZJcyuq8C1Um9zTjIIk6vXthAEtCLJQZm9+1LZSz4m4Ij9MYWqstV3dLQECew1Yj
	74j+ykILBON5mbwaQKnJPzMht0/h1bGe3FeVzR0o2mtbClf+mKvwU1iTZsodcM5UMruZ1MiXzYY
	ez3MpN0euTKV8THu+2C2E146OcNZ5EC7+GI3L4m9Ro0cd/VeSimjdIsV8rhp6zRELZsg8rpTV7o
	m3kIAOfBE=
X-Google-Smtp-Source: AGHT+IE1PzmccDjUHw/cCfTitLQUWN7ySt6IIS2R08CJIE8KvQHU33IreLUEiERDgYqPaCuhxHXhbQ==
X-Received: by 2002:a05:6000:2212:b0:3b7:932e:8c55 with SMTP id ffacd0b85a97d-3b7932e8db6mr352869f8f.44.1753776272705;
        Tue, 29 Jul 2025 01:04:32 -0700 (PDT)
Message-ID: <2f2a1992-0d88-4429-bed1-af5e60e05664@suse.com>
Date: Tue, 29 Jul 2025 10:04:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra/eclair: set 'noreturn' attribute as safe during
 cast
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8989bf6d8d245537628912a00f5ba4731b292fb1.1753738107.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <8989bf6d8d245537628912a00f5ba4731b292fb1.1753738107.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2025 00:15, Dmytro Prokopchuk1 wrote:
> ECLAIR reports a non-compliant cast due to the presence
> of the 'noreturn' attribute in the callee function.

Which callee function? Which cast? Please be concrete. You don't need
to enumerate all case, but one specific example wants pointing at.

> The issue occurs when casting a function pointer with
> the 'noreturn' attribute (void noreturn (*)(void *))
> to a general function pointer type (void (*)(void *)).

And again - why "casting"? As per ...

> Configure ECLAIR to treat 'noreturn' attributes as safe
> in this conversion.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Previous discussion thread:
> https://patchew.org/Xen/181a03d5c7625d42c06cf9fa0cf48a9bc6825361.1753647875.git.dmytro._5Fprokopchuk1@epam.com/

... there was no cast involved, iirc. We specifically rejected your
attempt to add a cast there. It's a conversion the compiler does, aiui.

Jan


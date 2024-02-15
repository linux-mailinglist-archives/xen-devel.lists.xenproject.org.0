Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BC4855E39
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 10:32:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681437.1060206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raY6L-0008LW-DJ; Thu, 15 Feb 2024 09:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681437.1060206; Thu, 15 Feb 2024 09:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raY6L-0008Iz-A2; Thu, 15 Feb 2024 09:32:17 +0000
Received: by outflank-mailman (input) for mailman id 681437;
 Thu, 15 Feb 2024 09:32:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raY6K-0008Ir-2c
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 09:32:16 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1aabbc99-cbe5-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 10:32:15 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41102f140b4so5662955e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 01:32:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j4-20020a05600c1c0400b004120537210esm2340835wms.46.2024.02.15.01.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 01:32:14 -0800 (PST)
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
X-Inumbo-ID: 1aabbc99-cbe5-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707989534; x=1708594334; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xq72nU/U0opIMf+1Ykh4dz/2yLNFr6Im8X+Xd6LpF04=;
        b=Y2N/F513VL80mGr1E+tjHNikWaeDS5PIyHKmA1TGSUNaBdySlRYgl1yE44LtqkWKTB
         f1NZvN4tVmT87AzW65Y0eKsqu/NXn6HPZYRotddSx81psH4IQ5FNU5277voIFNEq7eCa
         kn59NIGD5MEoxrnPkNcRE06Pjvm7OHEOYk4fSFPPhAVWMvCa339PrbQp87iBDpEHuLpP
         zraAsaA01VVuc2SlqKiYEiTUDZzRsuPbsw5LYBenEmSbRAZQ1ExZhcyAh8wXn/IK4jZ5
         fOCBTUIbSn98EAcD1OX9G1eQ0rPU/2lBSC89QjfFXHi26E/nfih7M6tupwYRWxbL2LtN
         +zTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707989534; x=1708594334;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xq72nU/U0opIMf+1Ykh4dz/2yLNFr6Im8X+Xd6LpF04=;
        b=WtpkCi/VTZfMknSb32NjkvkSOzAljkmwaeWEnU+wtyLMRGco83i53UK0Ry0JStru3+
         L4t678B9hVcG4tM0ls46Z9wNKnCtbONOL2IAkit8KBWjlgQibPxubA11dmbA+gBB338v
         Mfkh3C6rspGT3nCAKDa1MTjy64I0yGoBMUxVKTP9T52fq7Iwn2QmI0PBE3Iq/j0aOGT4
         Cy98ZcmS3PzupB+Wf2PG86LDmAw6rUdJrGzLPsQFWuTeUsUZMdQ5o26c+3bSi3TFGj8X
         bVnPQyccHX2coqsNZrhV+xOA6eAhzxbRcv/1oIZyZg1HPYpfyi92FbeBuvmUXubOtAB9
         NbyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBebZck0i09shl6D4W7vGnNPlLZnF1KSZ1rkO/Y1AUhoTZNE8X/nCA/P8i9s97fTfKRRlAKvTe8MHhdbsqCprrInEtSzZ4DKVNZkNPOHY=
X-Gm-Message-State: AOJu0YwW0avE5yNH3MPIf5UfJbMUatQFdXdHECmKy24BaX2z6Iddwg2L
	3XUEIKr7DrNcRJCUohR5+yWDttsGe07LFnIDH0SQwQjiqR4nOdsXDFLUGy1dmQ==
X-Google-Smtp-Source: AGHT+IGx4wtbcvU49SXC7ZsA1MnVjg3ClBXEBMHxdOGRSlvNcvKVK1pVYs0FNuQtSknzyPRB9VUaEQ==
X-Received: by 2002:a05:600c:1c9b:b0:410:cc74:cb9c with SMTP id k27-20020a05600c1c9b00b00410cc74cb9cmr929474wms.25.1707989534701;
        Thu, 15 Feb 2024 01:32:14 -0800 (PST)
Message-ID: <8b4ca5c8-8d4f-41e8-b544-99909298df63@suse.com>
Date: Thu, 15 Feb 2024 10:32:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] build: Replace `which` with `command -v`
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20240214180039.57527-1-anthony.perard@citrix.com>
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
In-Reply-To: <20240214180039.57527-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.02.2024 19:00, Anthony PERARD wrote:
> The `which` command is not standard, may not exist on the build host,
> or may not behave as expected by the build system. It is recommended
> to use `command -v` to find out if a command exist and have its path,
> and it's part of a POSIX shell standard (at least, it seems to be
> mandatory since IEEE Std 1003.1-2008, but was optional before).
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>




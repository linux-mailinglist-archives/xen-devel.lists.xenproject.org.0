Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F0FA136E8
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 10:46:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873391.1284365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYMSY-0000lo-PM; Thu, 16 Jan 2025 09:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873391.1284365; Thu, 16 Jan 2025 09:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYMSY-0000jh-Mi; Thu, 16 Jan 2025 09:46:42 +0000
Received: by outflank-mailman (input) for mailman id 873391;
 Thu, 16 Jan 2025 09:46:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kdRh=UI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tYMSY-0000fm-2u
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 09:46:42 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c74e3a22-d3ee-11ef-99a4-01e77a169b0f;
 Thu, 16 Jan 2025 10:46:37 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so3917895e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 01:46:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74d793asm54098165e9.26.2025.01.16.01.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 01:46:36 -0800 (PST)
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
X-Inumbo-ID: c74e3a22-d3ee-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737020797; x=1737625597; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mHoQVHY+Ti5jQNpxHMNa4O4n39gR0vUk8HNRiaABC68=;
        b=FZbBlrLZ7EFWlSXbUFwNylq0Raa7cimOLHFuAS0p6jeGA1fYgRsOSUD+hnSvaCZ1CD
         Mpcch91QHHvqA633xbUjo6I2erwMl7yM2+2w19wTAHV62qZBEvP0QCWx08Nspksz08Ay
         1A0InFI5/0jPF5LNriBTiDLqHPjF+J+Qt1i9gpNDZbin3Cx2d82SP0HolloZdAbVqpwy
         a5CkszztLxgl7UznXtiETZxtqMmcCxZElwVtmZwFXC+X+eC367Z4r4yt5cL7mgJ7fCB4
         98g+VhOJcUhIn6jdmbrndumb4a2w+FOdy/vB7EHOp7MF15FZpRG2yTUyWBQLr2h6w+eQ
         d5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737020797; x=1737625597;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHoQVHY+Ti5jQNpxHMNa4O4n39gR0vUk8HNRiaABC68=;
        b=Rggu0VF0b4oMAykGFOhLb4oFp1PK8L6Fb9dLElBCXAueQo7d2+6vSjgMnsezDlczmg
         6Ub5g0go1ulDYrjN/vtX3B2dX8EtT26f8228LV1ClizYHVtoS/hIjdnD8aF0MNY7104Z
         eE1OixjpiU4d900klqCVBdeH5Qq1Aq4MEWG5x1T9y2FpTuV8QfccKY7p4RV2yfMhIFFk
         qCkzuIfvoTYNcUCDDhYZHgRRWHltfd9QzNVg7m8WpTubezIiG7jjcKc2qdF9OtkuPqf3
         nxXNIGBE9u+EYIUEw86H+demWTQ8FT4Ru37PsmHw2H4vhK9TBCN1RALZWVkKdvM7shtB
         0JhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUUwVGJ/nAtQP9sIc/jPgAusLLDPHkDbaTlEOwSsyoDUdBwzj5OyBY9z4aX7FOVy7JPpiXV3riz5E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxObPxwc+nudUoxfhq1cHicVPxWhxxFo8d3ula1F71B/z7Eh1Rq
	znIjZTKKBjx8AWVlIo4TGPxhkUbylEhQVAIHnr/yzHIbNZorqFrebTW3nOlGpQ==
X-Gm-Gg: ASbGncusrhFOJw/LshQt94f4QbPrTgoKryiFYcbn0HGRiTU8dSF8dlZdjkEhyvDfWGx
	ilXeDuv8TiwiKMOvdFzn2f7Gwf3icoAtPB+E9UjFiD0XEjpiLCkApuHNWCcMPo29FpLOlp1UNzi
	CnnQncvEHnnPDi6U9T95XS+0iGp5j8iusQEUC087LuYmIyax3gDNeHBS2Ci2idI96MQ6dmkH3p8
	CIRnaed//KwiIezKtDJpBrnqTsO7QIsqoRaI78Fhpq9skZQlwFEF3nlUJxxHIRAClyLmIdeYMea
	BJWRrLVz/sYYY4JoyiNmdAzkev8lJDI+s67TOAmI7g==
X-Google-Smtp-Source: AGHT+IGNhwuHn6UOpG0HxAcQiI7ub0UIWXiJYKns5kjq3hCTuYtGpMyn99a3Z305jbt+4el1H1At4A==
X-Received: by 2002:a05:600c:4449:b0:435:192:63ca with SMTP id 5b1f17b1804b1-436e26f481dmr166209105e9.21.1737020796804;
        Thu, 16 Jan 2025 01:46:36 -0800 (PST)
Message-ID: <0d2e9617-e4cf-4b34-954a-a790c4bfda0a@suse.com>
Date: Thu, 16 Jan 2025 10:46:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Punctuation: Add missing commas after linking
 adverbs as intros
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <ad9d1d7db8d43c82a02f64b8a317d7ae6522dd62.1736964253.git.bernhard.kaindl@cloud.com>
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
In-Reply-To: <ad9d1d7db8d43c82a02f64b8a317d7ae6522dd62.1736964253.git.bernhard.kaindl@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.01.2025 19:06, Bernhard Kaindl wrote:
> Fix missing commas after linking adverbs such as currently, fortunately,
> hence, instead, and thus, when used as linking adverbs at the beginning
> of sentences. I saw them with LTeX; other checkers have this rule too.

I'm unconvinced, and despite Stefano's R-b (Stefano, please don't feel
offended) I'd like this to be commented on by a native speaker. It is my
understanding that commas in such situations are optional.

Jan


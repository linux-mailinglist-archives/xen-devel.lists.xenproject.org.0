Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF80D968B19
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 17:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788160.1197616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl92F-0004vs-0w; Mon, 02 Sep 2024 15:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788160.1197616; Mon, 02 Sep 2024 15:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl92E-0004tU-TV; Mon, 02 Sep 2024 15:32:06 +0000
Received: by outflank-mailman (input) for mailman id 788160;
 Mon, 02 Sep 2024 15:32:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uQw9=QA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sl92D-0004tC-HF
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 15:32:05 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8115e63e-6940-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 17:32:03 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f3f163e379so70778301fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 08:32:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989221c24sm567778266b.196.2024.09.02.08.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 08:32:02 -0700 (PDT)
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
X-Inumbo-ID: 8115e63e-6940-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725291123; x=1725895923; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MsOIMJQ8amfxN/8Ni67905Key8Tzi+icPpg81tfURUo=;
        b=BtUl+Vrcj1i8WdYROwYNB1G/9CaxRfqFVurgKPj5YB6CkwD7h4omRY4G7HtG0y3R1x
         VyZ2dJrLiTr7c+66t4nHyLksOys7QpPE4KQ3RlE1nzYAFmyhbtqkLlvzm6X4TzRB8YHw
         8MCO5rdhgOnctjquzO/BNjhAlddFEtFI50z5+9gi3w3yQNbZwN2QonQ6uLYWwUlqgUNV
         Qu4X7QLdcovtNzdLLbbjY1vW/ElSIKmdtqn7qstMT91glFXOi1bDyuKFCY4RDnsfJuqj
         IUoYdDJsy7RWEfeEdHHmEXc6WxPaPLzM4Qm9yyg2HdJ8ZpMzTQfuux7F86yccz/Sn6Ri
         P+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725291123; x=1725895923;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsOIMJQ8amfxN/8Ni67905Key8Tzi+icPpg81tfURUo=;
        b=ubE6zHFIyULkv2LOgaPn7i8WcCrsA785UXrYjTi016QEruhhKiZNkBFd50+vN/yLMb
         +0qIEy9V/jZNqpjtueTwvh3WXSdwUn8Ou7GD6cVnIn85w2jDEl+bWow8+sMRpFW0Z8A1
         NgXBm2ytYASm1lyhfNHxxAEhdGpNio/KO1cWs8Hns04eMcPmw1Dz+r7S9wjST+jFa5g8
         aC3qj8lpmomtRPWrpz9rIOgTb4nao8QYi7yrcEvpOX8WhUva0ii5oIGOWczfetG55tUH
         Ou/0FMssbbq87JDyRq4hNi9iuStDKwRmOqwibF2BOqiR9J55mAKlBaPb6HR+8ckxBzO7
         n6sg==
X-Forwarded-Encrypted: i=1; AJvYcCXgfjDLF1CHzejgnGREuM/jlLd6Ur6+WxRQEYV5dg5VQ+cN38E4hWZRb2FH+yTBBaUWjzYtFttgU64=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxbnz6SwEbfZ1IxRUVFl/J0Xnm81+FDZt822bq3F2eKiX5xDusV
	Imigtdrd4vLIVRy5hKqUICx+cMLkRwV6ld67AYLk2liFCQuAO4oCSHX89eZXtTzYVN8FDaIYh6s
	=
X-Google-Smtp-Source: AGHT+IFhx+MJfF9VSPel268RXZVAtxHoWGydRpW929q2q+eEO597118bR5AcVQGrlGRmNZrv4KpwUg==
X-Received: by 2002:a2e:be2c:0:b0:2ee:52f4:266 with SMTP id 38308e7fff4ca-2f6105c47e0mr137380721fa.3.1725291122994;
        Mon, 02 Sep 2024 08:32:02 -0700 (PDT)
Message-ID: <de465fc7-9c66-45c0-a114-fd0b339a1ff5@suse.com>
Date: Mon, 2 Sep 2024 17:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] x86/boot: Use <xen/compiler.h>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240902133232.3302839-1-andrew.cooper3@citrix.com>
 <20240902133232.3302839-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240902133232.3302839-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2024 15:32, Andrew Cooper wrote:
> ... rather than opencoding locally.  __stdcall is x86-only and not something
> we want to introduce to Xen generically, so opencode it in the two positions
> where it matters.
> 
> With this, defs.h is empty so delete it.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>




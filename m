Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5E5A87803
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 08:38:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949080.1345723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4DS7-0000ls-Vf; Mon, 14 Apr 2025 06:37:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949080.1345723; Mon, 14 Apr 2025 06:37:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4DS7-0000jf-SQ; Mon, 14 Apr 2025 06:37:55 +0000
Received: by outflank-mailman (input) for mailman id 949080;
 Mon, 14 Apr 2025 06:37:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4DS6-0000jU-E4
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 06:37:54 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd9ffa5c-18fa-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 08:37:52 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so28268195e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 13 Apr 2025 23:37:52 -0700 (PDT)
Received: from ?IPV6:2003:ca:b71f:2f7e:1407:af3a:2658:6d8d?
 (p200300cab71f2f7e1407af3a26586d8d.dip0.t-ipconnect.de.
 [2003:ca:b71f:2f7e:1407:af3a:2658:6d8d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f20a9f14csm105752055e9.1.2025.04.13.23.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Apr 2025 23:37:51 -0700 (PDT)
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
X-Inumbo-ID: fd9ffa5c-18fa-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744612672; x=1745217472; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LwVGuxOkXG6Et+whwlTdqzC4aYYwzHMjz7sVeyBD/yc=;
        b=LW3/C+Ex0/BO4YyB7QyKgcFXtG5rswffdU/S2jakIfNSbhVEsfqiGQ5TRwEMgvJZh6
         XjEOh7MEX8ydmgcSkJclyyQdV4cXE46iVZnsMkB70BNc3R7zUhs1I3B4jBTd34rspZz5
         aKICBr6bEfq59YAF0Z8INK9BstgwtV8IbQK0H4RuuUTHm7X7raHTi7UfOEU2pa5k0t43
         Y6OvRX1ANTSw8XIrvUyfgD+C4MUaoi3GV2KEcEGFXA3CF8UfZhPifbKDU0wJOdLsG7g3
         NhUnhwpQboZBKRUWehGHM2FKBfBcmlbgV1b6a91c67Yy0i9dsAn0SDQXcoMUglefXoz6
         X3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744612672; x=1745217472;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwVGuxOkXG6Et+whwlTdqzC4aYYwzHMjz7sVeyBD/yc=;
        b=Lp8fu/ayFxDn7ETw46eg3pSvY0csH4x8Zcu+gysfFeSVn4SgFrz8AjTckETnEfVcWG
         dGPj1jQKZOicsdfqG6UgX0nWFki86BBgCnvc5TixImK5/jXJfUIleoSWPMVSDMZe9D+C
         oI53WhRtXhQcg5eqN3VmW/XUfvG20VD1ykwbyLZjGemn3bAkYrkkEmwULtNUtnoFSgy8
         7YS0nc1svg2oEfxCXqNTuYbbtnt8glFLtP9s3rXRxQvZJGXLPlHPtSUlySF7M1jG/r5G
         M0qdWvQ49R3PGycLsyb+nmQzajBG3xvlQ0LKh3NSBT/SLHOL+7zAi/12oumSLFK1i1HD
         35Xg==
X-Forwarded-Encrypted: i=1; AJvYcCW7XMaFCtgF3F0UekwXaLEwwmExvKSy4CWvL5B6HSGZDJv4W1Io+dDVMEYPxtQdxAMClBY7+IfxNDE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSt0Nxjt1f29WcRm60P4dwe7lxTrJHk9VfnHq2+z21h1LT8+UP
	L+ZUZ2EjcAalbxYv+MbnH2X9Bl7oqKySeNFDwKbym9veQf4NY9ikjFNdN1dc7A==
X-Gm-Gg: ASbGncu9IpxmAIgyGRx38obFhoUx4i2i7Atiq2le8t/m9teMJ0QLMZyHR0WkRBf+iDm
	Qm+HcCr6Q6NLOQcOl4ZN2LZFebfp6B/oy7Zri5okZu/ywohZuMKdVt0nc5vkaveynmI4JXzwVn5
	02Pm9+DmZBje65a+AkwgTE6MtyfjVAKROGet7iC4b4DC2F88SoNyF0ocRoDNbDcjsO2eSotU/j4
	/mdefLbASZDtb1TpcliPucNEAfsdTsQFdnxYbT7OW0JjPEfZtWq5Zy59ZVtGwflheALxu6HXpu+
	y6vDeW4aSj9uT89CanoGBpCWR5CwhGPr1UZ2Ox1iltfygi644Zjhiarz+CD7JAu7D6mz+ATBeWY
	00w36UvAM/wXWcWsCo6lUIazmBsAptWjgvC8BOFWbEkuMqtHRbfhoy+uRFI7hg5SBlFXrLycuRW
	Y=
X-Google-Smtp-Source: AGHT+IG6MiEKjmB5j8Tbtg/BKEJK45adl/qjMiPo/7xgHk/SJMQtaLJMNDUrJY9X6893AA4DE1BeeQ==
X-Received: by 2002:a05:600c:3c84:b0:439:91c7:895a with SMTP id 5b1f17b1804b1-43f2ea651bcmr138989925e9.7.1744612672081;
        Sun, 13 Apr 2025 23:37:52 -0700 (PDT)
Message-ID: <07c71107-a08b-4407-bf5d-9cd4314bf9cb@suse.com>
Date: Mon, 14 Apr 2025 08:37:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] x86/mm: move mmio_ro_emulated_write() to PV only file
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250411105411.22334-1-roger.pau@citrix.com>
 <20250411105411.22334-6-roger.pau@citrix.com>
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
In-Reply-To: <20250411105411.22334-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.04.2025 12:54, Roger Pau Monne wrote:
> mmio_ro_emulated_write() is only used in pv/ro-page-fault.c, move the
> function to that file and make it static.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/arch/x86/pv/ro-page-fault.c
> +++ b/xen/arch/x86/pv/ro-page-fault.c
> @@ -298,6 +298,14 @@ static int ptwr_do_page_fault(struct x86_emulate_ctxt *ctxt,
>   * fault handling for read-only MMIO pages
>   */
>  
> +struct mmio_ro_emulate_ctxt {
> +        unsigned long cr2;
> +        /* Used only for mmcfg case */
> +        unsigned int seg, bdf;
> +        /* Used only for non-mmcfg case */
> +        mfn_t mfn;

... the unnecessarily deep indentation corrected here.

Jan


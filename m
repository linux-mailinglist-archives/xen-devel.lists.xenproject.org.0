Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E96BC89FED
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 14:23:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172648.1497763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFUD-0007q9-UJ; Wed, 26 Nov 2025 13:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172648.1497763; Wed, 26 Nov 2025 13:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFUD-0007oR-Qs; Wed, 26 Nov 2025 13:23:09 +0000
Received: by outflank-mailman (input) for mailman id 1172648;
 Wed, 26 Nov 2025 13:23:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOFUC-0005zB-NB
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 13:23:08 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b6e5d60-cacb-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 14:23:06 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4779d47be12so51362535e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 05:23:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790ade13ddsm43888335e9.8.2025.11.26.05.23.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 05:23:06 -0800 (PST)
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
X-Inumbo-ID: 0b6e5d60-cacb-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764163386; x=1764768186; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPv6Gw7K4dUDe7WiljiVntRRsZpH17oia+l/tTitOd8=;
        b=bziCFkBkxke0oKQaVAf0ndn4gQHR00rVzxgIsuywKkz1fe5W4XDsgxibuCx+PHZJow
         vBQyEjKDuQf96sQ2W/nqzq0nt5D9sHqYpfpm6RLUrdbFep+sKjd3sRtLzKeXT4cMgPWN
         5BoFu8WFmgGx5ovK1SRfj1mCQNkVw0wf+xv3mgf1/Rj1HILL+PibzncfBH6fgjsBwUpK
         ezfeOEIiKsvQ7UFwbNr6YaTWrhVirCQFOeNSZ8/SH+s5WuIt3xQlu8Fv4D4qlJX2rf/N
         Moq02EHCo77kVJTatDxgLagq4mAEG9dnkTvQEpbZNtdRiTjON1XJmCEaRvMxG0hCAXi2
         ht3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764163386; x=1764768186;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PPv6Gw7K4dUDe7WiljiVntRRsZpH17oia+l/tTitOd8=;
        b=LwFhwugpVjz8eV1k035I2Bfad3x9cY7seLEqosdfy7QMfZHakMlzrsMDgAVGv7v8iN
         qYHKf7tVcu30eeYEaYh9QddT9eg4LhkFaXlRtniKStc3ZyN3FaxuKiy4Zhcs4Ol7o7Jq
         HVCOz4FETYqVYyWs7JCu64kyxhl0/VmM85oDVvEug/BBehdZAJ38UmHElGR2pGNihvxE
         g5bPbE6A0ag20B2KXfS2sjwczrkejmNYXSHyd8+3pqEL50zH8/fhXrvFdwn2QrfgXbT8
         T4TJYbdqBYL4aogHs7IUz/3bpyT55mdjWVwhe51SG52Y2P/aczReF+7ej2jSJviio/Ab
         txig==
X-Gm-Message-State: AOJu0YxPPwNkwM+nxbgo0AElcJPcnyX2HIAG6xu46XLMpJpFpCEnJQ/c
	kaQ2cbNQwN3BGT7KPjpEOUrK6U+BEEJyFg1qPLfkzDmN0J37ctFiWngWooC2M5IP/USaxQgWHlq
	nMYU=
X-Gm-Gg: ASbGnctsm69BljMLJKS5DAlxSc7RDRwYA2q6z915zzZFYpWAQz/QSr2de/pBBlPMgEd
	2lHHtM9ixF98Wno3zfv7EwTy74D4m3EiPfJh/Li3lxiEIdba/JCH6BdX2S+42JeTg1lJ6UKQV9p
	bnAj7uQmuB3j7mhI2Tt9ChC2tfJlh4fAw8GQvRnR0hx17b4spTz9Jb1jaomzVp2LGbAgz39B76E
	1/2sbkHA6ey6VG7Nv4S7CUkufVArJqGJZPaxD0R2xZqMpxN/5sTTOtRoKpBtEpNh/7kB3y8nVvS
	gxtTIl/UlWxwgArO4rdq3Uwt/OVxT14r45GWQ4XMfwSGj8kCEjgC6NAcarDfbNKmFXC1GUeFZtf
	xZUjFGgTmZhk0L+xYgOZjuU24SnmszrPYja3YMlDJWqqiw8b0NkM4M/VavijhwrZdxTXzxqxqhQ
	UYDnPj+D0HcjIYZKxbSYL81k8soNlkLRcs5/so8siHhHPGAYR0mcSgTfm8AqurDq5q1GI1cKZjM
	oM=
X-Google-Smtp-Source: AGHT+IEHAwKj6OPuDyX060UTLZpMBtix/V4uRuLs6FYI+f3XGpYPiB7K6mj8zZpo9+HKABmcnygWmg==
X-Received: by 2002:a05:600c:4506:b0:477:7bca:8b2b with SMTP id 5b1f17b1804b1-477c0190e57mr246341815e9.15.1764163386328;
        Wed, 26 Nov 2025 05:23:06 -0800 (PST)
Message-ID: <245fbc16-924b-4fd9-8cbc-a539b569edac@suse.com>
Date: Wed, 26 Nov 2025 14:23:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86: introduce lib/
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

1: move arch_generic_hweightl() to arch-specific library
2: move / split usercopy.c to / into arch-specific library

Jan


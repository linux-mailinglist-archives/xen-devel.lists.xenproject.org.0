Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7B9D131F7
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 15:29:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200361.1516299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfIuV-0001f1-H1; Mon, 12 Jan 2026 14:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200361.1516299; Mon, 12 Jan 2026 14:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfIuV-0001dk-E6; Mon, 12 Jan 2026 14:28:47 +0000
Received: by outflank-mailman (input) for mailman id 1200361;
 Mon, 12 Jan 2026 14:28:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfIuT-0001dc-CZ
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 14:28:45 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff874636-efc2-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 15:28:44 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-430f5ecaa08so3057331f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 06:28:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0daa78sm39459517f8f.6.2026.01.12.06.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 06:28:42 -0800 (PST)
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
X-Inumbo-ID: ff874636-efc2-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768228123; x=1768832923; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w58LwGC29cXmcYaQei+vF9ga2UmuyamuAiGBm8q72Go=;
        b=SiD5KG6q9eH+4o3/k42Jqfffmf+HyWeDTtvcbEt2KD1a0wNQ43vriIVAqZcDzWZxN9
         YKbd4C9sUNkL5504Po8x5cydWfFaaEfVSVLuDIIZoMWQNaz76lf3A1ngfhoiicjBVuq6
         ZBC2Fqe8d2JqdvU+0lDJPVCxzPeIli3G2iBdXX95uEbJ1vOVSPHhbitBcGhVzbHG4tVe
         HJMwktFg+cK0oczO1B9exfhkf5wHzAkY2qdVJr4Z/yFQjJ74fuEAITf3CybBEb89ISn4
         sPNgDHn8MD3VvwmNmrqzVlQMeiuevXrkhjiAksovrVwGKkvY6zG1+AGq0D7shCv4jvV1
         j1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768228123; x=1768832923;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w58LwGC29cXmcYaQei+vF9ga2UmuyamuAiGBm8q72Go=;
        b=YJS3Y33xUe7dP0mDXVqsoH/EEKECL3bgaZImiFTUDA64PYdVyPrwKdAu5716qn5tKe
         PdRjIJVaFWMZzUZiJSiuzsNTE9G4qgkq7zHx/TEh/isj7ZtFaSYCYbapoK11B8kWdfJ+
         gNGfdKDnkL7RNJahC17Ifjt3su0nzmYA5/O8qK2t+sEWYddYTGGwMKdeejc6PiypX7Yl
         tpE+X7FYgC9T5My1hECePDPsXpDGP8wqPT7lBJtNSl1AGELQW4VDl1rqLO4C3zmc9xYm
         jKW+9ULb5Y07N1tK7vPVSVtVaLGxWYPtfqL4zrywbTXm5htPTAXLgn0bkh5B8E7yC718
         5LBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn7f1hgMJv6KSqC3Jv4Yk0mCeJFwO5YfE+fUzcTXWNahoR5Y6r3zW2EFngvcgQcrv5WdAdXKFRcIo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywi7rWcHNEdjqX8+9Yh5YzEs7vz4JvZZ3tjWYPG2Nog/l+P5ctJ
	ERJmJbsL9WT+HE1zF29OHOIJDeus+zCmRL8inplIGDOogZmd9ktc8zhMtLB/3CA9Ig==
X-Gm-Gg: AY/fxX5g/wFw0lYsFzCS/Rry6ePp3JTgiWzz2Zh5n7Ur5sStkkplz2f6LZeUXDPggjw
	fi/zZYGDUw9HhauqZOid9xsL7suXeywcHQ6ZT/LO4cjOkAB/QVVM5oPmIWmZEvlKE0MF3rmLEBy
	UuPoiRuppUsRMs5zT6mhy/AqhUtm7yQgnpSdb52v9hIF7QyLRYJ5Tg3dO8OxjXSb9Is5T7vpeOO
	DWL40ZXMyGNUn9VKGvJuIXlf64UQOEWvWcoTqihFuPZl9pkSwXtqWpIo9ZZjIiIDPx4kMHtlgvR
	P1n3R+Ub3nH3rDO6FApmPaowhqB+ugG7fBsuz+4ZaAV6TpELeYJUSzYp+cVVn60EpXRt9W/AAwh
	7LSJFrkP8tTEwOQk0vmvFU4KJbMLnGvPtPtevjzr3cLhluwar5TirjLH635IH86FGGmEPAQm0TG
	HAH4wgd7zkJCrrovged4jidYUDFNHtH5gQqkPE/VYxJnlc7uGvG6N91z2Anxd8zQCzar5c3qnsL
	vnW73bKcnWH1Q==
X-Google-Smtp-Source: AGHT+IHMYxVqy0QBLvkUWPVhbOSnofZ3KRZAC5rwj0zS/EJLJK1PTWAW5xZJ4P0AK1k+i3RGlab96Q==
X-Received: by 2002:a5d:5888:0:b0:42f:edb6:3642 with SMTP id ffacd0b85a97d-432c37767acmr22696655f8f.60.1768228123300;
        Mon, 12 Jan 2026 06:28:43 -0800 (PST)
Message-ID: <f1beef63-1995-4e8d-bbdb-3be406ac414c@suse.com>
Date: Mon, 12 Jan 2026 15:28:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/15] xen/riscv: implement vcpu_csr_init()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <bf617d77bb9e75bbd2930614bb86ff83b80adcfc.1766595589.git.oleksii.kurochko@gmail.com>
 <dc24a8ea-9041-4097-bbe2-459c668e9e64@suse.com>
 <7ba4bcfe-59d3-43f3-adb4-207424dc1713@gmail.com>
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
In-Reply-To: <7ba4bcfe-59d3-43f3-adb4-207424dc1713@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.01.2026 13:59, Oleksii Kurochko wrote:
> On 1/7/26 9:46 AM, Jan Beulich wrote:
>> Also, wouldn't you better keep internal state in line with what hardware
>> actually supports? CSRIND may be read-only-zero in the real register, in
>> which case having the bit set in the "cached" copy can be misleading.
> 
> [...]
> 
>> (This may similarly apply to at least hedeleg and hideleg, btw.)
> 
> Regarding the previous bits, I can understand that it would be an issue:
> if SSAIA isn’t supported, then it is incorrect to update the corresponding
> bits of|hstateen0|.
> 
> However, I’m not really sure I understand what the issue is with|h{i,e}deleg|.
> All writable bits there don’t depend on hardware support. Am I missing something?

My reading of the doc was that any of the bits can be r/o 0, with - yes -
no dependencies on particular extensions. In which case you'd need to do
the delegation in software. For which it might be helpful to know what
the two registers are actually set to in hardware (i.e. the cached values
wanting to match the real ones).

Jan


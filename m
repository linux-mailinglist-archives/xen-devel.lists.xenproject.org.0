Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFB1A97139
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:39:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963158.1354202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FiD-0000jD-Az; Tue, 22 Apr 2025 15:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963158.1354202; Tue, 22 Apr 2025 15:39:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FiD-0000gq-89; Tue, 22 Apr 2025 15:39:05 +0000
Received: by outflank-mailman (input) for mailman id 963158;
 Tue, 22 Apr 2025 15:39:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7FiC-0000ge-8W
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:39:04 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaa5aa0b-1f8f-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 17:39:02 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so37652015e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 08:39:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5bbc07sm181499105e9.17.2025.04.22.08.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 08:39:01 -0700 (PDT)
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
X-Inumbo-ID: eaa5aa0b-1f8f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745336342; x=1745941142; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IBEA4/vakKbtAnNfNG8JaXeodFI8SjuhcRM5NLq0x7M=;
        b=IkVv4s6LKgkiZhXFIAbIn+f1RrkRNaWImuBbQ+YiNQEnIJ18y8M9Yk0EAhIxxy/ILL
         2vAhBbc00FgaTNQ3aAUE/Wd0oycQClx0ohzKwZ1KCYzZmtARTePj13cWtS2egjSY2mJG
         beDvopQTLMskjm5sAXBWB0YoyMYXKyhmfLk+hTAqoGzT/9q+KNpMSBcsIrR98uoERFAn
         7qjaNMCz0XaUj98+8IEa5+lbwpMtv3i89HIWMaj7buIO6CSyvTLtCGmMGaSko/sAxFg9
         YVByC4ctFIG/V2W8cImLFOYLekq7DIiAUS74IeuI+2swNBque7mcWikFL55mcs5pujhN
         Tteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745336342; x=1745941142;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBEA4/vakKbtAnNfNG8JaXeodFI8SjuhcRM5NLq0x7M=;
        b=cwejBEtUJnjPmZJbWV9xaQyc9ahBd3b3xmvhPnTUzeCQCaNffN0VllvVrYvUXxGQ5m
         lGsvKhCnaNXzpjqnGLPC1qE6Yj3EX4IWsoTMU5WFLH4q+Jbhrw8ijLOfD1Tr9pc5wys+
         Ze37hgPwDfzX0dp75Ld/IWUqHPbP6ak3FGEVCNd5C/4YZmGPo5u8GzARTqKn/s5H+yVH
         eJJKfeLZnulUVreR5cKIUFL45fkDjIYh41eEAwCIo/PewpsbvRcNgTWxxN8zrXyiw6TP
         BwIb8iIRdYCkwcEAwtJlI+qqTKpy63QVXIgLJAvoykbsiQVSYvgNOv6w80lciZrG2fgi
         CXog==
X-Forwarded-Encrypted: i=1; AJvYcCWVcxudNouMGeASAcWmYDYe0vXIjnLkTJla121KSj5Ys9znqfetKUlXbAvv2hhnF6tO2cc6BREs0Os=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxY9QuTaFZDav0dMTLAjiMI4bAGX8rmrc9VzrYUDrhNzlZYtREc
	qr/aYjTuar2YremtYE/mEEaqCpWm0HdDGqgJtTs8WQ5ZvSIJuEfZk+Amf08Puw==
X-Gm-Gg: ASbGnctavfbcUMsTZNQu6QSq1gfnUjr6kxLgWi3BlmIyPUO0AKgWyCopcFbts35tex0
	6Fgg8dr/U8WH//fA/Ih6nOdAROYRw2uhferQGOi/fxWoPQEq3A6cdjKtTzlLiUOKw1G/UEj0LH1
	Gub8OhZWMGGSOEwi356HHV29Hk1b+1LTzB6V68Am3GT6smb6WRYpX3R3IQy3d2gbx5RIr0cip1V
	UelccOxi0O7yAwAi0i3Y/b2dhyYd2FpLluGT4VHCi4oUo6dNsDXTfQ5OBI/6KsPoMagZd1tdxCG
	4mTp9PN4QEGnId2b4BKcpjUZ7FXSEShcdzF4mbEyfnLXG665bup/+cYf+6DNqB+tAcTdrC815Lx
	LEOojcdim3jO8DcJKP0BPfBjUZEQIjzz26ouf
X-Google-Smtp-Source: AGHT+IFzTSr1WKQ3I9k3l8hzqN2T9hYE6FmgKB929mfbeJfUJ6F/+Iul5BlPK72VK78m35sT8S1NfA==
X-Received: by 2002:a05:600c:5012:b0:43d:b33:679c with SMTP id 5b1f17b1804b1-4406b2acc3emr142907345e9.14.1745336341924;
        Tue, 22 Apr 2025 08:39:01 -0700 (PDT)
Message-ID: <52c13dcc-ab4a-41c8-9f89-f0aeeed3c1b5@suse.com>
Date: Tue, 22 Apr 2025 17:39:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/21] lib/sha256.c: add file
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
 <92b461c8d5981a523293341346274b6cc1b76d9b.1745172094.git.sergii.dmytruk@3mdeb.com>
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
In-Reply-To: <92b461c8d5981a523293341346274b6cc1b76d9b.1745172094.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.04.2025 17:06, Sergii Dmytruk wrote:
> The code comes from [1] and is licensed under GPL-2.0 or later version
> of the license.  It's a combination of:
>  - include/crypto/sha2.h
>  - include/crypto/sha256_base.h
>  - lib/crypto/sha256.c
>  - crypto/sha256_generic.c
> 
> Changes:
>  - includes
>  - formatting
>  - renames and splicing of some trivial functions that are called once
>  - dropping of `int` return values (only zero was ever returned)
>  - getting rid of references to `struct shash_desc`
> 
> [1]: https://github.com/torvalds/linux/tree/afdab700f65e14070d8ab92175544b1c62b8bf03
> 
> Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
> Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>

Most comments just give on patch 09 apply here as well.

Jan


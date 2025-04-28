Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3A4A9E918
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 09:22:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970180.1358930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Inq-0004kr-QW; Mon, 28 Apr 2025 07:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970180.1358930; Mon, 28 Apr 2025 07:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Inq-0004ic-N2; Mon, 28 Apr 2025 07:21:22 +0000
Received: by outflank-mailman (input) for mailman id 970180;
 Mon, 28 Apr 2025 07:21:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9Inp-0004h8-1J
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 07:21:21 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61787933-2401-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 09:21:19 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39c0dfba946so3175602f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 00:21:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073c8ca72sm10048549f8f.4.2025.04.28.00.21.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 00:21:18 -0700 (PDT)
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
X-Inumbo-ID: 61787933-2401-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745824879; x=1746429679; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PQBQnTGS+avpIl3YD33ol1UgfO0f8ISsdtYtrlaMxjU=;
        b=boKZnpb8RvrKuZZWnrHVNxso+X0rktTi5mwwRnG6CqJejpBXbWOvTD359IuFy/8WAS
         ve/vhMSKka4hVWwc4ygC9Ne824lvCXSNQvfoM7C5Flb+ygIDecdPa9yOgOsJ9KgI10Q6
         BMxluUwceiYljoU3ETyjxIvkxeh4YohiSvR799QMJVRtNymDOXQfPY32QHnvparXZG39
         r2e2ElTm7D32nncUJ6li+hf42Q3spImJXE8L9XHLICsdotJUzwY0DaHDojLArqMRU3ND
         bI75p+C8UA1y/By79QBgg0pBswuJKevJI4XvE7yzQWDXNzGF8A/uuPn80R6t2YTdsYF0
         3BjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745824879; x=1746429679;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQBQnTGS+avpIl3YD33ol1UgfO0f8ISsdtYtrlaMxjU=;
        b=Mm0a6mt9MMHWHsX808dO4YyGPOYX2ezTZet/1gIAoiyvRfFdeuuRDOsQ+9BeIVu1Fh
         W4zX8tld1daeidjUZBvXJE5c/JUStdfTDK52cRvyHf7TfIfCOHHNmmqsKIcERIUUyFHU
         qBGl71OGMhN6JnjDXUpDl4G2sbsndsRje6bcyAqbuUDlVqmc5yUQPX0UL9FuLlbEn2qk
         ro7qgP/3ji1zYj0qgjHRxTMdYwcdDs0GTRThPqC95Zo/uhIwjUes5BRFaOGCYWHamdIL
         BUIH3q0K1dAWRlwf2GNrtIUdRRlGLxMVGdqIGhNiP96VxoXuP50vr9wj6Drq2CUL+x6j
         Xv2A==
X-Forwarded-Encrypted: i=1; AJvYcCXsavGjkUqd+aWOfMw1IYyiY2g2eBShlMuVRVy4JmG951FT7o4ywADTXBtBDbdtjq5ryviSUgsBw3U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdYiKsReywEEE2Qgj5tQFBRY9E1ryFwjrRexswfIEkCTMzBM+h
	YJYPcViWYIZI48Fp5lK3Lc7RJTmGpelqD442Sbdk7Rr/SOXz+YgywWDmmocNqQ==
X-Gm-Gg: ASbGncvZeXrsW+4n47zgNYvTvHZZcrlZCigrKIHjlyuHMf7dMkVrUqBnXIW2zGwC1BT
	EFbMs61H+muCXRyJLIkNJ+nNLj5pbGH4O6DlxmjIO9o8/4sgZvK1Apd8OhGX/YWUkMwJ8UGlufF
	/c4mHfuXUD8ac29WWGd2s61FZtG0QCP9Kv8xSRaelH9NBIqiNBVCMXeKp+QBjyOzffIvmqSpQ+M
	TgeyZhYhZVlN6riQ2OCb4sRWsfac0+nkV91swOyC/FpbWfEy5xxWfsEKZoSzv0CD8YhiYq2POaT
	xOnN5BvC+pBVWmmnZ6uIerkR82w9Raq8C/lSZihkqj6djAutgWBYyJz7AbDD3tCpyxQdvUwZXjU
	Cu12K+OucAHleFoQk2FYpdgNRPA==
X-Google-Smtp-Source: AGHT+IGI9Fj1wXy0f5L5EC4YQ3nCdvQzXf1k6ISr5pKCfb81LSebMAnoRvJEOhcfgbb2sUYZKbOiaw==
X-Received: by 2002:a5d:4885:0:b0:39c:1404:312f with SMTP id ffacd0b85a97d-3a07aa67ab0mr3862983f8f.1.1745824879257;
        Mon, 28 Apr 2025 00:21:19 -0700 (PDT)
Message-ID: <914e3157-736a-4890-9c91-e93fcc260bb0@suse.com>
Date: Mon, 28 Apr 2025 09:21:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] x86: x86_emulate: address violations of MISRA C
 Rule 19.1
To: victorm.lira@amd.com
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <c694069696dd428bc1719e36c378a573b03f74b9.1745624090.git.victorm.lira@amd.com>
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
In-Reply-To: <c694069696dd428bc1719e36c378a573b03f74b9.1745624090.git.victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.2025 01:42, victorm.lira@amd.com wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Rule 19.1 states: "An object shall not be assigned or copied
> to an overlapping object". Since the "call" and "compat_call" are

Was this taken from patch 2 without editing?

> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -526,9 +526,19 @@ static inline void put_loop_count(
>           */                                                             \
>          if ( !amd_like(ctxt) && mode_64bit() && ad_bytes == 4 )         \
>          {                                                               \
> +            uint64_t tmp;                                               \
> +                                                                        \
>              _regs.r(cx) = 0;                                            \
> -            if ( extend_si ) _regs.r(si) = _regs.esi;                   \
> -            if ( extend_di ) _regs.r(di) = _regs.edi;                   \
> +            if ( extend_si )                                            \
> +            {                                                           \
> +                tmp = _regs.esi;                                        \
> +                _regs.r(si) = tmp;                                      \
> +            }                                                           \
> +            if ( extend_di )                                            \
> +            {                                                           \
> +                tmp = _regs.edi;                                        \
> +                _regs.r(di) = tmp;                                      \
> +            }                                                           \

See commit 7225f13aef03 for how we chose to address similar issues elsewhere
in the emulator. I think we want to be consistent there. This will then also
eliminate ...

> @@ -2029,7 +2039,12 @@ x86_emulate(
>          switch ( op_bytes )
>          {
>          case 2: _regs.ax = (int8_t)_regs.ax; break; /* cbw */
> -        case 4: _regs.r(ax) = (uint32_t)(int16_t)_regs.ax; break; /* cwde */
> +        case 4:
> +            {
> +                uint32_t tmp = (uint32_t)(int16_t)_regs.ax;
> +                _regs.r(ax) = tmp;
> +                break; /* cwde */
> +            }

... the odd brace placement here, as well as the inconsistency in the types
you used for the temporary variables (both really could have been unsigned
int; no need for a fixed-width type).

Jan


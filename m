Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B01009C3AFF
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 10:38:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833444.1248595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAQry-00049S-Fx; Mon, 11 Nov 2024 09:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833444.1248595; Mon, 11 Nov 2024 09:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAQry-00047V-C8; Mon, 11 Nov 2024 09:38:02 +0000
Received: by outflank-mailman (input) for mailman id 833444;
 Mon, 11 Nov 2024 09:38:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAQrw-00047P-UE
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 09:38:00 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a27cf24a-a010-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 10:37:58 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-37d43a9bc03so2942786f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 01:37:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda0ed16sm12290232f8f.107.2024.11.11.01.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 01:37:57 -0800 (PST)
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
X-Inumbo-ID: a27cf24a-a010-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmIiLCJoZWxvIjoibWFpbC13cjEteDQyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImEyN2NmMjRhLWEwMTAtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzE3ODc4LjA1ODUyLCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731317877; x=1731922677; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qn7e6EXwanVynR/ErhuHZjmpCHg/TeD84upznD2gpkA=;
        b=L8MvnSyiawzNgRBn406YhlWYhXukk0bsQdh2VaW298sFLJdyEhH0wfOxUR5wo6u2ZD
         Sw2ClzPlU1ybRBFbvhe0dcb+AmASBtnofmdLeUhvtkbYviQmrwxMcZhKPnNvLPwsO3uT
         uJ+4qpX8URVyzTNjZC9utSUUTKGMKH6v+qdN+w7w246xhICS3uzD2iGgcWAYs3oCylBB
         RVOj0EKdVNBoYTTos7MneK9vqa6WluRb0h0frODKCEdHn7mkqwtUPM/NbKEb/9K8j5v6
         BFM/wJwoJuIdkfHXUFIv52IS9ryGxl/eac5tw8SDJV9a8+5BjS/xiaIIE8ZgUrXR7OEC
         C5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731317877; x=1731922677;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qn7e6EXwanVynR/ErhuHZjmpCHg/TeD84upznD2gpkA=;
        b=RVy6AA6Yba89QbDKHkwexBwHGVE9ht+jRGws8ocLJRTBX82w239+O6CTqrCaPKfV+4
         mHL4N9gkzMK5EG5FH37oFk/QnFgEKcghoTVo2aAqzCQGfqBJmC0ny+l1KuJGUKV7TIn/
         +aw23grOhhI0dVfP94mXSF5z0BVMHpGZw/xUmgEs9fmiBbAf1ZQohK2im4a1JK+spt4/
         uuhV6I8uLi39HAN4NjgK0zquJV5SX0wuDmWVvvNwJvoeHz0zWgKdo2MF4p/ta5WlmITC
         LLK/LpG3Upp5bXxgblXs8MNv6GgpgdLjwYOZiyw7GnSy6tiAwZV0dD1ebolXehtpuKdh
         fgnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNNwd2fR5ZAb1nwy07WNpffYypPlxtHcO/AHWdjH2AerPZfJQI547Ck7J+eXE1JDahelLFwpNiSdQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxqFd0p5EBW2agKkgOua8Im72B6knHQuTzhxRL/g6XECvWjlYHY
	eY+KW0hgWdxLCFiCPK+tw0gFdgcmlo6ePdkz8vnV5YkjsDC0AJfROBjZUntSyw==
X-Google-Smtp-Source: AGHT+IFkYNc0qz0PVsi3JRVEFDEaxcwJE4Haup6XFs/9BsZpi0gZLy5LWO8Zliml9BUk8y1HbEi1uw==
X-Received: by 2002:a05:6000:1449:b0:37d:377f:51e6 with SMTP id ffacd0b85a97d-381f18852aamr8973037f8f.56.1731317877416;
        Mon, 11 Nov 2024 01:37:57 -0800 (PST)
Message-ID: <9ccb3216-533e-4e64-be89-e667db7390f7@suse.com>
Date: Mon, 11 Nov 2024 10:37:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Setup correctly fs segment for bogus_real_magic
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241111091739.4885-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241111091739.4885-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.11.2024 10:17, Frediano Ziglio wrote:
> bogus_real_magic code uses fs segment so it should be initialised.

Like for Andrew's fix:
Fixes: d8c8fef09054 ("Provide basic Xen PM infrastructure")

> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/arch/x86/boot/wakeup.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> ---
> OT: Seen another similar patch on ML I suppose this part of code is not that
> tested. Also, considering EFI code, do we always have VGA available in these
> cases?

No, we can't really assume so. This is "best effort" only, with the hope that
if there's no VGA there, then there's also nothing else there which might
dislike the writes.

> --- a/xen/arch/x86/boot/wakeup.S
> +++ b/xen/arch/x86/boot/wakeup.S
> @@ -20,6 +20,8 @@ ENTRY(wakeup_start)
>          movw    %ax, %ds
>          movw    %ax, %ss        # A stack required for BIOS call
>          movw    $wakesym(wakeup_stack), %sp
> +        movw    $0xb800, %ax
> +        movw    %ax, %fs
>  
>          pushl   $0              # Kill dangerous flag early
>          popfl
> @@ -44,8 +46,6 @@ ENTRY(wakeup_start)
>          call    mode_setw
>  
>  1:      # Show some progress if VGA is resumed
> -        movw    $0xb800, %ax
> -        movw    %ax, %fs
>          movw    $0x0e00 + 'L', %fs:(0x10)
>  
>          lidt    wakesym(idt_48)

Between these two hunks we have

        lcall   $0xc000, $3
        movw    %cs, %ax        # In case messed by BIOS
        movw    %ax, %ds
        movw    %ax, %ss        # Need this? How to ret if clobbered?

I'd guess that the loading of %fs was deliberately after that point, in
case some BIOSes messed with that, too. Hence I'm unconvinced we can
simply move the loading of %fs; I think it needs duplicating instead.
(That way it's probably also safer wrt the mode_setw() invocation. That
doesn't touch %fs right now, but it's also not said anywhere that it
shouldn't.)

Jan


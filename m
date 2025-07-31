Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B06EB16C98
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 09:21:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064917.1430220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhNbA-0004cd-5T; Thu, 31 Jul 2025 07:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064917.1430220; Thu, 31 Jul 2025 07:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhNbA-0004an-2p; Thu, 31 Jul 2025 07:21:08 +0000
Received: by outflank-mailman (input) for mailman id 1064917;
 Thu, 31 Jul 2025 07:21:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhNb9-0004ah-7s
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 07:21:07 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb7af340-6dde-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 09:21:05 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b783ea502eso335744f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 00:21:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f61asm834043b3a.3.2025.07.31.00.20.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 00:21:03 -0700 (PDT)
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
X-Inumbo-ID: eb7af340-6dde-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753946464; x=1754551264; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gnEuBTcJ/pg7jRmpDlcK18kovxzEYUY5dKa7CsA6K4Y=;
        b=OZyFX3h7ElCGmQAKbXHGA3ZPTZGsO//3hHejpfaxLBStcS8+BGG+R6kFD79ScUT1xM
         Hk7JXsaq6nM3kVSHd9nDiJNXwZVKA0vQUCUm5H1FHh5q4dJjqk4hk/W0SBkDeNcgK4S9
         PBbXxAeVD9M+Lgze+oD7RwJlfABULNq3VN5cdsmgA2JF5Ds4PvLdBmS+j9jc9BHQ5svm
         +qZ8aAyv8MWD1abj+UbAVzSrnSvSe5BADTUM3lnhG54BiBHSHGJ7VOct3PtDqiVEPcGg
         ptbV7N4a0/Aw2oaR/3pzMmJU+qw3Bsqj0ikmnfwwfDlZnWQg1rOy585mnbup9bJUA6FQ
         olYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753946464; x=1754551264;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnEuBTcJ/pg7jRmpDlcK18kovxzEYUY5dKa7CsA6K4Y=;
        b=oc2q+g4bcpK5YDYH0XWEljkdCspGuyc3T7VwYUV78vxBNfDwlIbRus/Jl3Jz5sWzZw
         gOYQYbthBYXM2I56K9cXaYMfserKH1jATcRD9fvIY8fqf8fsNAp8UOn0gRzON1I/ArYg
         nyKUgl/VJfhg3rzpf+ZEDI2AuoWxjERNhcoJyqxEwggF20Ve84axkYBr3lKh59NG3uAk
         sB+JYMHcsXVeMuZQooaY66Fcw62H0YqzvSaWquP0JPh6cyiBfNtbMBu6N9o4QgxkUl2O
         tQM/TwFRrkemrhtnErZQll1dbPS1vfhh2LONomeC5pVowVD+uFH+4nVHSyUQ/DIzuFMV
         DuXw==
X-Forwarded-Encrypted: i=1; AJvYcCWHqS1kAnRTrY+8k+YbZeIqrxNg7rhCUAT9wDKk20kePTQL/nzJFhyve2F1GPGFqhMPWLSbGCA9gQ4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyToTRD8hh1dBeicC2WpdeJfqua/pNPJPorrTRV9qSZ364K0+Lw
	tmrl8oAoaJA6GIHp4Sovw9ATlKTyyQOUzZoto+lp9DukUE2NT71uCtnF4qLBeqtiug==
X-Gm-Gg: ASbGnctBevQFGQbsc2dsSygRP/BkwfivypuVIZJW31sKVTd8cObMAlnaGp2asu61ytD
	bfqxnWPLUSBgCcd0A/ufzn8cxr4IUucXdpJWgjtIEtKI2a4Bfr4P3qDeq+lmQ0/cELBiXD63/WV
	630XSYqJhlH0qVqttcBAU53v3OK0tdQkyYMv3vHAh+AnwTyCA08BWfX+EBPW9abjk91DLpw9LSz
	yJzLw0UlWB7UT6q426w+VCz3r21oKkJJcs4i19KTeR2tk7aT0USkpEzRwr0BDWmRax/LyvWrC3V
	hbKMqGBG+wtWiUAM5ommfVkHMo61RsZ1WxXVx0imuNjY9J9iDENE+7SWC4D9yz9fO6pZDAdXhGW
	sxzVaXfQTh/DreveBXcjgpSyGbbP2ZhRVsCjISPdEDX1wHtBGYsKJR+KcjIcJM+ADoz3K+iEio/
	uLMf1C9TQ=
X-Google-Smtp-Source: AGHT+IHnI1M4EPfIRda3tQYO4VTblFilfqu7O91C04+e96SkUOqolM3QH3cVzEb0GX4MfOVWbciR1Q==
X-Received: by 2002:a05:6000:2f8a:b0:3b6:5d0d:9826 with SMTP id ffacd0b85a97d-3b79d7f618dmr821307f8f.21.1753946464390;
        Thu, 31 Jul 2025 00:21:04 -0700 (PDT)
Message-ID: <46e8dd16-11e4-4d96-95cb-f13b652e7317@suse.com>
Date: Thu, 31 Jul 2025 09:20:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] misra: allow discarding 'noreturn' during function
 pointer conversions
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <63d5d311e6502d5b957009be59e1c97599015b46.1753911912.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <63d5d311e6502d5b957009be59e1c97599015b46.1753911912.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.07.2025 23:47, Dmytro Prokopchuk1 wrote:
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -342,6 +342,12 @@ Deviations related to MISRA C:2012 Rules:
>         semantics that do not lead to unexpected behaviour.
>       - Tagged as `safe` for ECLAIR.
>  
> +   * - R11.1
> +     - The conversion from 'void noreturn (*)(void *)' to 'void (*)(void *)'
> +       is safe because the semantics of the 'noreturn' attribute do not alter
> +       the calling convention or behavior of the resulting code.
> +     - Tagged as `safe` for ECLAIR.

As before, imo such a deviation should be generic, i.e. here independent
of what parameters a function takes. If that can't be easily expressed
to Eclair, then that wants stating as a justification for the
deviations.ecl change to not fully cover the deviation we put in place.
Having the textual deviation generic means later possible needs can be
easily addressed by just a deviations.ecl change, without any adjustment
to the deviations themselves.

Jan


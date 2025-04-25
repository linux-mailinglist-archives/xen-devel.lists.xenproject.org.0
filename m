Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E56A9C2F9
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 11:11:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967540.1357320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8F5Z-00056p-Ek; Fri, 25 Apr 2025 09:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967540.1357320; Fri, 25 Apr 2025 09:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8F5Z-00054f-BT; Fri, 25 Apr 2025 09:11:17 +0000
Received: by outflank-mailman (input) for mailman id 967540;
 Fri, 25 Apr 2025 09:11:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u8F5Y-00054Z-GQ
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 09:11:16 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d8c5c61-21b5-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 11:11:15 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so13944085e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 02:11:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2a0e7esm51919335e9.10.2025.04.25.02.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 02:11:14 -0700 (PDT)
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
X-Inumbo-ID: 3d8c5c61-21b5-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745572275; x=1746177075; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ymt2IyLtkKOOCDqHil4x3OgwVshyHb/OgPMZ08zWTmI=;
        b=Byu0zciicpJW2Gt37BYYJNd7zjWZrDWkYeQaOTf8L71owUFz9vnxLiYMKPNVX5eLCJ
         7gYwxgRWS/ZvlSh34HkbHbtIz4XF2AgRyoemglpgHVMusF59Ei3Gx2Nvthru0JB1WMPg
         mJs4d8ahQdwX4NsnRq2fUKbNm9E1j12+Rdrk3chfKIQ36aFa0PdgGAPk5YnuTAn4ls9U
         5f/j2xSkId+7NWfoSL6bslpwjw8ciClPhxkibFg2tWgmutUv8u869HdezsN/BCYqP5Q1
         o3OJszh5MWaBcuCWF4XkcnOFkSoCUj90VbtQ17TVFkWiVntxQu2hrdHdaIaVTC3bWoqD
         L+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572275; x=1746177075;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ymt2IyLtkKOOCDqHil4x3OgwVshyHb/OgPMZ08zWTmI=;
        b=MCa3sYT2amI5JaFR4gPwcJjqktIw2uCRPGHC8zJL9mEJRNrpVEqFJTTNpl9X+kpPD9
         DvvL7oNTSKLntZfttS/OdDddBUWXCu1tWCFawZVQH2GnNi77ISJ2lsVULPz/t8Wfoko7
         s0PJtgQst+OSYYawhPZcbzyY3kRoViU5hwEvpKrmex4HXhnfdjaKT4uuflLI4Hi6i0/+
         Ad6eFKR8OOCeFK2oqxhCLdGRGRjEJk1EoVbdwHGoxWd45SacSvLkYrm64Ixlg3oJ2cOI
         b5A4V09dO31GutcJd6ISbKAcA5vF8DsL2lbwH0j3vZaE1+fR1z4kxzGnMNmQBWTCqe3Q
         IUlg==
X-Forwarded-Encrypted: i=1; AJvYcCW/3p9TXXtiIfFrLZPe1iTPl7m2yrH/Kzyl2ypSw1CpvH86NktwdoisOng+qhv26l0rqz4Ldrcn/7E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywgq/0yhZwjqOKkbDYeZMVUiE9IcoQsgEszn/SHSD9DswIimuEn
	jlE4UkC3ZME3vN9OThBGUgA9XiunDUDSodxKY9NvlVZzC1NxnEIwh6vTgl/EJw==
X-Gm-Gg: ASbGncuLyJ4uH0uDV45U9zjRA+aEhge4yVoYlQOSwVc/kIhNTb3eB37wHUtz3TijZQ9
	qzX/ieQftGTtI3D5MiIQXj6w3Xhd/Arrxw9O8f/oygIs/qudU7nQh5uwA2NO/GpOIeY8ceyHyim
	7fKFQACm445K4Wzst1AlVmFt78/yKhkGY9Yx2uMVolYolojpm7faVL34/CGD7uTgY+UNTj6o2Ni
	UnXhWoh3LYASkdHp7OpDV6pJgCWPGINArGT61E/tN+DPKceXqmSHJLKeyPt5F+tL4e+8vrd43/+
	wYB9JivN5yAhBodP9tKv4AiEt1hd99x6OmIHHb2iQxPK7RMkGjMp+WV0hfyVMuYuh6ompyNRwgb
	1vWov5aQbPjTo+kwjwPoz69GNEQ==
X-Google-Smtp-Source: AGHT+IHNnFiBaXeNXlsUKp3uuXx6Lww1JX4PiP2jHCbDmYYx9sXARMu2CaCitZ1n8lvqu/6G4vXQuw==
X-Received: by 2002:a05:600c:1c96:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-440a65e37afmr14319745e9.10.1745572274972;
        Fri, 25 Apr 2025 02:11:14 -0700 (PDT)
Message-ID: <e5b9ecbd-f96f-4dfc-b6f6-c2f9d5bf17d2@suse.com>
Date: Fri, 25 Apr 2025 11:11:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: UBSan bug in real mode fpu emulation
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: manuel.andreas@tum.de, Fabian Specht <f.specht@tum.de>,
 xen-devel@lists.xenproject.org
References: <l2jnq5cxgkzcdkndp3mjf76nd7wdp2pbstkqo7llaarmbfqdge@bxdydela4rcf>
 <7e3b941d-ec4e-4158-8844-a3cf236c8d4d@citrix.com>
 <lfakyg5jqdnbm6kleldta52xm6pzdy2fikr6ydxw5rs4wplefv@ymabtpq6fdvq>
 <659665fc-e938-4c2d-9707-b44f637bb6fb@citrix.com>
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
In-Reply-To: <659665fc-e938-4c2d-9707-b44f637bb6fb@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.04.2025 16:04, Andrew Cooper wrote:
> I have a sneaking suspicion that this is sufficient:
> 
> diff --git a/xen/arch/x86/x86_emulate/private.h
> b/xen/arch/x86/x86_emulate/private.h
> index 30be59547032..9f3d6f0e5357 100644
> --- a/xen/arch/x86/x86_emulate/private.h
> +++ b/xen/arch/x86/x86_emulate/private.h
> @@ -385,9 +385,9 @@ struct x87_env16 {
>      union {
>          struct {
>              uint16_t fip_lo;
> -            uint16_t fop:11, :1, fip_hi:4;
> +            uint32_t fop:11, :1, fip_hi:4;
>              uint16_t fdp_lo;
> -            uint16_t :12, fdp_hi:4;
> +            uint32_t :12, fdp_hi:4;
>          } real;
>          struct {
>              uint16_t fip;
> 
> 
> The problem is that a uint16_t bitfield promotes into int.  A base type
> of uint32_t should cause the bitfield to promote into unsigned int directly.

I fear that's not gcc's way of thinking. In fact, the other involved structure
already uses bitfields with uint32_t base type, and the issue was reported
there nevertheless. Having known only compilers which respect declared type of
bitfields, I was rather surprised by gcc not doing so when I first started
using it on not exactly trivial code. Just to learn that they are free to do
so. Looks like I never dared to submit a patch I've been carrying to optionally
alter that behavior.

Jan


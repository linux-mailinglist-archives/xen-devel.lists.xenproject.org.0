Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3308AE38CC
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 10:45:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022193.1397946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTcnj-0002UD-Gv; Mon, 23 Jun 2025 08:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022193.1397946; Mon, 23 Jun 2025 08:45:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTcnj-0002RT-CY; Mon, 23 Jun 2025 08:45:15 +0000
Received: by outflank-mailman (input) for mailman id 1022193;
 Mon, 23 Jun 2025 08:45:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTcni-0002Pm-16
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 08:45:14 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6090c9d3-500e-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 10:45:13 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so3862068f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 01:45:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d8393741sm76769495ad.15.2025.06.23.01.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 01:45:11 -0700 (PDT)
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
X-Inumbo-ID: 6090c9d3-500e-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750668312; x=1751273112; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SQl2C1NqFLO06v8hScJ65RQV3iDSd7aA7Kk8jBlIKDY=;
        b=buUegGkb0d2X0AxuYQYLATwX09fxsuoWpX/NsSmuj40VQDAtKUJifwCSNMEjq0LnhA
         hfdL3/8JZuqJMpyEHAa/iOnVYDiCvhE6k33OvDemvJgML1iHiJBh00s+YjT8m8lDj/rI
         WBUrKg8QzD7a76fn+gyZ/RlPQAn+ZzyV9Df98piyF/mzTts/N/ML6OBnYNus66VQRgiu
         VrF7Q+lDkShLDBtXA766dQ5IAgTkTu8AuqumcF75ysNtqcgyzVpBRf+Ci48zKsKs/rxy
         Juej03jyLkSJ9hbf9ZsWlZ+xaGWutTryL1Kc5RSVzj52vl1YGElZo4NPX+6afoX3nQGF
         BaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750668312; x=1751273112;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQl2C1NqFLO06v8hScJ65RQV3iDSd7aA7Kk8jBlIKDY=;
        b=qy+PBFhSE/sJayJWIx3v5CLcaLP1jlc02bBljtYphE5KjzaKw0y9VYHA2NDyMDG4TY
         p/cM5BzxgxqTHETOoAjF9nr2WEvjpisor8Jj3rOSzYdsJvwWmMulP7PRN+J+4f7cwJyI
         blNAcNYQ0FLSIa3knSC+G4o3OkEPOr0qiqka+AIHXNgoB13aFEUGfg/Yo2F4kP7+OOzD
         nSYhXQoqbTYOjXDgqopWCB0NqgehF7CBRKhYEgV5Rgvvdv4gq5w2fYsSfS86BVg9Vi/9
         Voe+/Cv5V+/rTGPmA+96fi/e7anp/Cw1V8NwEgui44Ka6ioIcIlTt+Owxdh/p+Hv5tMq
         o0Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXu7wCShq8l1bs5mA+S3sIBJpirUkRHOcgkr1lY0F6uUGXvBXPhj29F9fiJxWEn/5IAUD+/s4jL1/M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8A3nArmdWQKVXGoipkntjAyIxF68FOtS3SkRyaxPuVWaXZQiC
	luWNSX3ACt1FKJaOdxpjH3fE7RKPmzUC7VPQGOZt9hWEQhdMum9a3TF+WCDC0m7qNA==
X-Gm-Gg: ASbGncs6CDMGAvzs6+X/YxJh63+tPb6WO0zRaAbFCByeraIJptk93UU332NGToACN5q
	StBzYqdPaIUE62XO4uqjIpUCiE17OtCEdAeZywpOLySspntF94yP1q958lSx+rtZm6JUgXp9auJ
	4hfhhL+ptQ83o76r8gH4AQ1TXkm6yNUJh4wdhzPGxf4L3VxHKTkn70NXNekuypp7X8Q2f6GsG4O
	xCv4qSDDReoZzCGWOdVcls8HHKOseqN4/XLxn+YIAYJ+X5FoBzWS2HdwXJDmA+PU0zYIDymhiT7
	KKWMAfz97r5nDaHWNlV4ALYd1Cp1jmq+ivASdoqOum4e1058I+IbP/zj32tu2yAyYVxuXJDcb+/
	r9ZGqS1KuNbH1mTg7O6Yh8jkibQZRu6pTFi2gH95sWW+gUo8=
X-Google-Smtp-Source: AGHT+IGWWzEaCzUeuOCScwd87LR0sonjqern3BliBl2w+EXIXh9ahDMEn378NA47WiLD1TF3kVKDkQ==
X-Received: by 2002:a05:6000:26d2:b0:3a5:2cf3:d6ab with SMTP id ffacd0b85a97d-3a6d130ef38mr9138024f8f.39.1750668312335;
        Mon, 23 Jun 2025 01:45:12 -0700 (PDT)
Message-ID: <00495ca3-55f1-422b-9839-aa54ec42a129@suse.com>
Date: Mon, 23 Jun 2025 10:45:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 0/6] hide struct start_info from PVH code
To: Juergen Gross <jgross@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
References: <20250619113804.32694-1-jgross@suse.com>
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
In-Reply-To: <20250619113804.32694-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.06.2025 13:37, Juergen Gross wrote:
> While working on xenstore-stubdom live update support I came across
> some really unpleasant code using struct start_info even when running
> in PVH mode.
> 
> Especially suspend/resume was doing some crazy stuff, including
> overwriting the initial struct hvm_start_info partially.
> 
> This series is hiding struct start_info from PVH code. This didn't
> result in any runtime error, but in future I'll need to access struct
> hvm_start_info some time after boot, so I need to get that fixed.
> 
> Tested especially with xl suspend/resume and xl save/restore in PV and
> in PVH mode.
> 
> Juergen Gross (6):
>   suspend: drop crazy pfn handling for PVH
>   setup: drop parameter from map_shared_info()
>   x86/pv: remove global start_info
>   console: drop parameter from get_console()
>   xenbus: drop parameter from get_xenbus()
>   x86/pv: make start_info_ptr PV-only

Before I even try: Does this series interfere in any way with the kexec one,
and hence may need re-basing on top of that (which I've pushed a minute ago)?

Jan


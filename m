Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85991B0F698
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 17:10:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054367.1423130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueb6u-0006je-JE; Wed, 23 Jul 2025 15:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054367.1423130; Wed, 23 Jul 2025 15:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueb6u-0006hH-Fp; Wed, 23 Jul 2025 15:10:24 +0000
Received: by outflank-mailman (input) for mailman id 1054367;
 Wed, 23 Jul 2025 15:10:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueb6s-0006hB-Np
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 15:10:22 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 243a16fd-67d7-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 17:10:17 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so32317f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 08:10:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm9949792b3a.69.2025.07.23.08.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 08:10:15 -0700 (PDT)
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
X-Inumbo-ID: 243a16fd-67d7-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753283417; x=1753888217; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ggeZJJXYWvp48uaivO+TR6wR7GlnieUxSWXalPj5hl4=;
        b=fOzCVwoYZiU4FdBtBL1aL1Fypfxo0ZeF5sgv5pIP26Fqod/usUTdhZrbO34yc6+Wop
         rokjr9TCSG9YTGc8IFnMLtIIxeZ30JWSHYWD8W7+xEDacQEYY85o8S8v7XYG020K9KZE
         5rB2+fMW6tCljfQK1znNuCsa42DYTjcLIWQN08NgKvuddNKojRnL1XT70hTL8QPiNBe6
         +44nLbQArQMlKZXTqfBownoq15XlluwDT9g9+e8XMZqn0a+n30gPMfvGW30Tb/oQgzEg
         sTGJckQqyH9uJiNHlAAzwazA+QKLjwIb3etLBGBk35uWWnz7jev3dY/cMFIwpJ95pk4k
         ZxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753283417; x=1753888217;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggeZJJXYWvp48uaivO+TR6wR7GlnieUxSWXalPj5hl4=;
        b=saXWP7gEW75JOp1wIlvGAgrpJbhdeiJWdA8dm77LaVWiz9mizHouGylSyQM7GTQ4sb
         xD0PFcFTxbecrDtu6fxiO2noUmxp6goS/4LEp3M0CGEt24YrqrwYyxbKHgcvlNeuKp2n
         +e2VAU7uoBL1/J56XFT8YeN2IuWDI4MAVaJJIauyl+fT8yeiAm5Y41Qdovjw9oaeIJZI
         VeV8WHkRN+uvYkTlhe1XG+75+ZxLzNaatT4Wpp/vIH/J89VPD6scEUdDANnuMIxwKPnX
         2z32a2BoU7aon7+ZaF/kMniB9jr+5AY8QSUVLd75mhvxNYLbfgc02SzhWO6o6JQ5VNmW
         6Cww==
X-Forwarded-Encrypted: i=1; AJvYcCVBBUTKD5ZW/8iDLLBZoU/PXUHakCVvSQiiyGKSsos5qfZDCctVuZ28SKE4QqhynBJv6u7GKophPjc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywtv0e6wrfNwsb+3lz6dY2DAH3Vbq6348wOPc+Y2FmC3DE1VkVZ
	YaIpxtom7RzFk5xl3KTvutqRh/+rTjO25y+8Gx+PnlT8KOo7FUXJaCKh4p7rMbazyA==
X-Gm-Gg: ASbGncuj8wNVqMQ/VKZmVd5bpkVPjDFi84WaMjSJz+egIkLw4kynqlPnQFFdR2fCm17
	1ugoyVCwaaMxIRyrbf7cGNh9YyEA+LkUQXsAnicIU36bYHkO/CLyKCMtDjEvdA5aSvKUVvIQN44
	Tgpt5eAS2EDi1+cRK/ZwtER2hd9k1oOaqRHq4HarkGM15aZj2/vgAkbRbvYEAlSbeaRiZVku1pz
	0gkDxwgbR7ErNWZJjr2L/1H/VQ6AwFZz+AZkhMsH6a+ERiBrN/KFjev/5Jmhbbprwo4ikMh/5jX
	4cWtrwQnDyQ4FUq3ptRSa+YiGxtB0Ia5+SUefS5wFI1EXmBvDVbdeEAbop+42cAuKVxpsL++xa0
	/NiP29BpJoCsR7VziRJpY84BQj7r0z2n6HJk3QDbvLJ9xEPumYZxJEciuL7UIgT9bq9wadQR4PW
	6MNSA5xaU=
X-Google-Smtp-Source: AGHT+IFM6NJAbTOvUW6scHeOMVXpxTGvM+tSANm6/RfJ9X5kAGIJwBLzx/LRe+rIS6t+XyfAUJ9oWQ==
X-Received: by 2002:a05:6000:2dc3:b0:3a5:270e:7d3 with SMTP id ffacd0b85a97d-3b7634e664fmr5951589f8f.13.1753283416510;
        Wed, 23 Jul 2025 08:10:16 -0700 (PDT)
Message-ID: <b819d729-8533-46a5-b2a2-480a70cda556@suse.com>
Date: Wed, 23 Jul 2025 17:10:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] xen/console: introduce domain_console struct
To: dmkhn@proton.me
Cc: alejandro.garciavallejo@amd.com, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250723001116.186009-1-dmukhin@ford.com>
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
In-Reply-To: <20250723001116.186009-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2025 02:11, dmkhn@proton.me wrote:
> @@ -559,7 +559,8 @@ void hvm_do_resume(struct vcpu *v)
>  static int cf_check hvm_print_line(
>      int dir, unsigned int port, unsigned int bytes, uint32_t *val)
>  {
> -    struct domain *cd = current->domain;
> +    struct domain *d = current->domain;

Why the renaming? (Iff any renaming was needed here, then please to currd.)

> +    struct domain_console *cons = d->console;
>      char c = *val;
>  
>      ASSERT(bytes == 1 && port == XEN_HVM_DEBUGCONS_IOPORT);
> @@ -571,16 +572,21 @@ static int cf_check hvm_print_line(
>      if ( !is_console_printable(c) )
>          return X86EMUL_OKAY;
>  
> -    spin_lock(&cd->pbuf_lock);
> +    rcu_lock_domain(d);

Given this is current->domain, it can't go away, and hence I don't think this
is needed here.

Jan


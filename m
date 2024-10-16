Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D18389A06B7
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 12:10:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819905.1233380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10zE-0002fP-Fs; Wed, 16 Oct 2024 10:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819905.1233380; Wed, 16 Oct 2024 10:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10zE-0002cD-CN; Wed, 16 Oct 2024 10:10:36 +0000
Received: by outflank-mailman (input) for mailman id 819905;
 Wed, 16 Oct 2024 10:10:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sXg9=RM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t10zC-0002c1-RI
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 10:10:34 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e101f0a7-8ba6-11ef-99a3-01e77a169b0f;
 Wed, 16 Oct 2024 12:10:32 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4305413aec9so61626555e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 03:10:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4313f56e9b4sm44429735e9.25.2024.10.16.03.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 03:10:31 -0700 (PDT)
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
X-Inumbo-ID: e101f0a7-8ba6-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729073432; x=1729678232; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=81xVFYQcM6P4s1G8ejgRsNfFkhl7vejaV9IrN8QzwmE=;
        b=cXU9i4IK9oxjEAv8DZI/CHRUIKiR8yNNWHDix3UxKb6Ijto0c7OCHZxb2skaqj0Tof
         eSECqCO8j8NaKf1clkayutE5eYPVxOAHjvYjUkUh4NLiu5VA7WjfbIMdhkYwCESHWKzY
         f4ALv187bmmGwEXBSlyEgswAJmOeLRpqawf1yMWhogrqUYsQsVEhyzha601rm/U0hp6P
         pIzenoelikoK6slgJaksdOy0uI0UWUzgnbRhOZqbmj9Aw+o3vsSS5IErWRs86YmFw00m
         WjuLqZJ/jSrxxH415o5ZRX7f67faT4VbjF2vCJe9GqrbAmusybRqyJ48JaW6VXmeMV/p
         iIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729073432; x=1729678232;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81xVFYQcM6P4s1G8ejgRsNfFkhl7vejaV9IrN8QzwmE=;
        b=G/YfXLParSIDwzyJRetxpE6ySvs+c0aOqsEYPVkYdygnPGB91rfevBYdwFnipvsntq
         ST/rS4VfngnWgs9PsWVQu+sx2mLbc7CnK+itWs1SBl3YgtljY66hDVS0Wjc2AXO+dxun
         guheCyzpkJe0IlfgzsJgBZBdVnM03HpqU23s7p650UgL4U0o1kGok3n4sxC/FrZ03942
         Vyumrec18oAEtezebwwbWQtbKifyyLIDMrW7QqB8OXf9/lg/5+s1y+c4UgOsBcQ6Juzc
         8+N5vX88qlBuxC+xShkQ1yEp7C6o0c0l971W6Pywwli88jfMXevnugCMq+Ssr7ffHtTI
         gJ+w==
X-Forwarded-Encrypted: i=1; AJvYcCW1JdKFRePuNgaVh6vUvRgucRpjZg0RIZcU4VIZwvdtMtQeuMixct4T8h9dNO4ZAoRIhhb0tGOS2Hw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxa3kJdU3bO2CqVfE1KVrqrs5OH/yltVFb1gpO3C701NsJNfvic
	nNwk2C9CctMKFPKKAWNsflBy97fxdUCgc/Gwl4nNvC9qMI5IF+TSjWzM+8ZjMA==
X-Google-Smtp-Source: AGHT+IGLmNCuM1Zp1TT5U6TM3Ey0XO+eXrLEWMFVLH5szIurXIBXZ9ReyiHdfeBqJbqKzZrwqBualA==
X-Received: by 2002:a05:600c:510d:b0:42c:ba1f:5482 with SMTP id 5b1f17b1804b1-4314a3cdde9mr24405005e9.35.1729073432128;
        Wed, 16 Oct 2024 03:10:32 -0700 (PDT)
Message-ID: <dd1b3db5-6f48-4644-90f6-bdcad98e62bd@suse.com>
Date: Wed, 16 Oct 2024 12:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19? v6 0/9] x86: Make MAX_ALTP2M configurable
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Anthony PERARD <anthony@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1718038855.git.w1benny@gmail.com>
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
In-Reply-To: <cover.1718038855.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.06.2024 19:10, Petr Beneš wrote:
> Petr Beneš (9):
>   tools/ocaml: Fix mixed tabs/spaces
>   tools/ocaml: Add missing ocaml bindings for altp2m_opts
>   xen: Refactor altp2m options into a structured format
>   tools/xl: Add altp2m_count parameter
>   docs/man: Add altp2m_count parameter to the xl.cfg manual
>   xen: Make the maximum number of altp2m views configurable for x86
>   tools/libxl: Activate the altp2m_count feature
>   xen/x86: Disallow creating domains with altp2m enabled and altp2m.nr
>     == 0
>   tools/ocaml: Add altp2m_count parameter

While the first two patches did go in, the rest is still pending afaict. If
the series is still deemed relevant, would you please either chase the
missing but necessary acks, or re-submit with review comments addressed (if
any)? If instead it was abandoned, could you please also indicate so?

Thanks, Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C0DA87ED5
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 13:18:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949849.1346293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Hpi-0000pY-1I; Mon, 14 Apr 2025 11:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949849.1346293; Mon, 14 Apr 2025 11:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Hph-0000mv-Uj; Mon, 14 Apr 2025 11:18:33 +0000
Received: by outflank-mailman (input) for mailman id 949849;
 Mon, 14 Apr 2025 11:18:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4Hpg-0000mp-KL
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 11:18:32 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32530970-1922-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 13:18:31 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4394a823036so41858655e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 04:18:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf43cdfdsm10905189f8f.61.2025.04.14.04.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 04:18:30 -0700 (PDT)
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
X-Inumbo-ID: 32530970-1922-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744629511; x=1745234311; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0B+cNQmVAv99SuiPFISj3QcuvgbelmKU6KVzrMlLTzA=;
        b=KNKgRm8ovhiAW2gfXLUZIamlDm1w7O3Fkdz7Pf8QJkhaO3d4UQQZBCottQSzUTypwg
         mZPGgA6BSVf5Pr5xqToCWS8c+kkp9nJOBQh933kf6EgiszoBHbqRfQmB1V2OLhxTVEM0
         WzAxUArkEAJbb+Cqi7ZyzC6aQd3oZv8vt0tkYXdfblZ/DiLQEwPz20are7/0ARX+SgE4
         xOPGwO6mUISP3Vs6I9sWImLqoyyHOzB+/Ma9qcvwU/AHhA09rreGV0Y/jYN5k/3SmnD1
         e4Wc+TXQQcQYoYtMhMMte44Dye9qktzHEn6qYwdbch8/wehEDVBxLsie7NAblHYPLXv4
         fOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744629511; x=1745234311;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0B+cNQmVAv99SuiPFISj3QcuvgbelmKU6KVzrMlLTzA=;
        b=BB5Ej7L5yu6uP1qNuCllWpWK+HHp11XccyITArPSfIsJG+4Sq2kwsmF85u9BZpWF/1
         GxxJ7e9phG9tBdVlUrKdHFqlBBUHizkKnDy946fqbw6rmVXdrFwplI21OkOeKkzmEbXC
         OhmTsgFOiKPgxDiK8NQDy35NvH76rNalRIAez02NrvrMyajA0rrpPxET38sdOyNn/E18
         tG+iGYdAyIN2c0gyRrb4LH8Kh5TSX/WAAOHxP+1rbK3uDuG1tlOb5WfJhvhdBpdB9i8Z
         2vZMTSjTlk6uzcOf50QWvee6ulkLjCtRZ2DXvKwiHJsxZ6/s8uc33qKsoghuSutYtFYf
         oZqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpMwAPS5FtoxkMqfEkQO2xscmo+At4TiLSryMSRG+t328Zt9DGRMs3mStmNvRa2uIfTY+uzVbkRJw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTTpPvHuFNlejk6gk7YdPLcJJShACN6mkrRnctAj9Dx234wNyk
	vPj1Fa1k5M7dXHCu1OBFXBvKoozWf8T8UFm6ZbwMzNHj6t3wZ+X0SLhB2JCOBw==
X-Gm-Gg: ASbGnctTHO9A5KKGI1oharc4W05o9S+oy+NUCkbJhWBSEM10Ta1I16OfHn97EmJKQA2
	egUp1Hs4V5/dyZKhDcM9CC7lAuLa92b8fiogW+aGUpLOYThNXL+bUSGG75LMOyUa6yxo8insw+p
	2a5pToypZ2A5awkqoJ55TjtFQTdvS/Dlkm8/Lo9lcfa2x789CDNM4jeMR/Nnnh9jZO+rFAYq4qa
	JTjNW8waN4MsB1p09HH7WCR35kaJXNktKqKRyh3rqXsAEHgvZhDWxoxtJQIJU0HS3nrmOjJ+I5N
	lmaY1ycx31I8jnDEvRjwzDBsYM23b4zS1a6shHOkhwgi7iZCk/ptByJknpV1odfRs6yU28KynDk
	+oIzN8VEf8t+SQaoIIPba78iCbE6DCsx1UgzQ
X-Google-Smtp-Source: AGHT+IG6VC0eWD9d+ZUYSxXlvoFED6PJGCPDNa6OrgT0Kt5PJqwxo3qtpORUHnjKKDjiaum7Zifyiw==
X-Received: by 2002:a05:6000:1448:b0:38f:4d20:4a17 with SMTP id ffacd0b85a97d-39ea51f4548mr10336730f8f.13.1744629510682;
        Mon, 14 Apr 2025 04:18:30 -0700 (PDT)
Message-ID: <18678682-9107-4489-8321-29ab0e80b7d6@suse.com>
Date: Mon, 14 Apr 2025 13:18:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] xen/cpufreq: only set gov NULL when
 cpufreq_driver.setpolicy is NULL
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-11-Penny.Zheng@amd.com>
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
In-Reply-To: <20250414074056.3696888-11-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 09:40, Penny Zheng wrote:
> amd-cppc on active mode bypasses the scaling governor layer, and
> provides its own P-state selection algorithms in hardware. Consequently,
> when it is used, the driver's -> setpolicy() callback is invoked
> to register per-CPU utilization update callbacks, not the ->target()
> callback.
> 
> So, only when cpufreq_driver.setpolicy is NULL, we need to deliberately
> set old gov as NULL to trigger the according gov starting.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3 -> v4:
> - fix indentation and this commit is independent of all earlier patches

I've committed this, but had to adjust for fuzz first. Would be nice if such
entirely ready (i.e. also independent) patches could be moved to the front of
the containing series.

Jan


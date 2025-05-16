Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E5CAB9712
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 10:02:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986442.1372000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFq1T-0004Of-5m; Fri, 16 May 2025 08:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986442.1372000; Fri, 16 May 2025 08:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFq1T-0004Mq-2y; Fri, 16 May 2025 08:02:27 +0000
Received: by outflank-mailman (input) for mailman id 986442;
 Fri, 16 May 2025 08:02:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFq1R-0004Mk-IJ
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 08:02:25 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19e390c4-322c-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 10:02:24 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5fbcd9088a7so2234349a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 01:02:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d502bc1sm986469a12.30.2025.05.16.01.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 01:02:23 -0700 (PDT)
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
X-Inumbo-ID: 19e390c4-322c-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747382544; x=1747987344; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Dv1fBlliwj5nxKFnT8jOp4JNgKgqoglMRaikG1ibvJU=;
        b=FT/JbjqIWZ3+jaMVp6hV1kLUy5882ltlsDPgoJOlh/2BSCYRGCM+t0oszc53osX8gu
         XmUylSNysHSupITWe9Zry8jGS1JL51EMfFLbMExW6aGrGoef1DvbHHWGK3pChkVNGYO3
         JfrfZ6QEg3eMMcLST1fF3G+OVuGQxSWpL2gjDio5htA+aCXfUqIRofDGhfFAtrt1unLO
         /TTIA+i7lEwKxxM1Z/X6FCFgEeq9XfDnh/tq2MqB04TVxlrgv5ksGpnHnHW9fbbm6Lbp
         eF1WtO8foaYr2YPbS1RIO37lzH6RViWsJ9w03gPM5u8fmcZB4kuVlK+kMnNqO300gnp/
         KAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747382544; x=1747987344;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dv1fBlliwj5nxKFnT8jOp4JNgKgqoglMRaikG1ibvJU=;
        b=nfINPKV4T9tNbtFLI4bsY076ePTU6I4J7HuEzBdkUC4a64ufVm50ffTYHXNk0LhzQm
         SA9R+H76XCip1977Mt4320r2HJ92/koHZcvlzzRXNJs+3Z8l7oKslKncSkcT6E6Q+x0/
         Gg7hAuzY+bUwCsqf3j8KVb55j3X9tIs0LSjnJgBfeOe2FNjHh3loSA0whqNi/Pb2qq/1
         FiTng789oEGQoMo1JU/UKBZhAO7ARrJXPccRxIKlddxVniObIh1XtWe/nQGPIhRBGZ1g
         knLHYhPkUelrZ/PpR62Dsdxol4Ngk1ucBNyyonwR37q2mHFvvCE2jwKmBVyZ+7DAqJpP
         6vQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPqMI6obufd7PR9G9fAq+FXioLccv4qr8aNGaVxNMTnVXF4fAFy+iXaShEdsaHX+Z1rE5hwhSZSwo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwruvLEZ/Jx+L9VefFQtWvLO6LWXsHq3GqFPKUoI55vfeORxaif
	7YSTG4/sAN+s1oSnvv6EqK8yZpL6SlUgmUcSBylFxpUIXmDUDClLOYy8w6YapQSLao9T5QmXDm4
	Adw8=
X-Gm-Gg: ASbGncuBGjtSU0O/17bBovD4u8P2ltgyMu1phMFukF40spPMFY4Ti0lbUghb4z9Foin
	NT5+B/Iu+5f4f3UjG/CdfCbQIJWiS4Pydx3OFM+MM5Pd8/j5HNo74QSzsgneZZSrDuTmvwij1UY
	Yz4bp8F/bBn1YvEZeNGmhGm36yXlVykcT3PqUIYw7zZoFONzvpuyDfc1IV4SNLzXQKnyqlLc8ic
	98TBCkaOGXN6pdPAhC9ZOYGnqdZLwkXIurMRjZ9W46Hbd2TwUZr5a48Ua6Qc3aRRc11K7B6ugZO
	bDmS7I5P9LFmjwn4yCxs4nXjw4nMn67HDNz1rW1DlKZN+pa7Of4HJVLND/eEiTqPz/mScUjtr0t
	n1zJVQnOJJlX3tcTFy0jgjAlAlFXZelTjMW/M
X-Google-Smtp-Source: AGHT+IGqE4ZatBbnWWL5rhY5OrrjQIP4PlN854TkWaAeYJyXCfMfX00b3B48F80qphEDDjhg/+yZVg==
X-Received: by 2002:a17:907:3fa0:b0:ad4:f5f1:28cf with SMTP id a640c23a62f3a-ad50f82067fmr572137866b.25.1747382543774;
        Fri, 16 May 2025 01:02:23 -0700 (PDT)
Message-ID: <a5f496d4-53b7-4aa6-a63b-0baa1b5c24a2@suse.com>
Date: Fri, 16 May 2025 10:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] x86/mtrr: use memory_type_changed() in
 hvm_set_mem_pinned_cacheattr()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-6-roger.pau@citrix.com>
 <df82f2bf-4992-4af2-9ffc-e734ea627a13@suse.com>
 <aCbtsaR3tj99UQfF@macbook.lan>
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
In-Reply-To: <aCbtsaR3tj99UQfF@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.05.2025 09:48, Roger Pau Monné wrote:
> Overall, I have the impression hvm_set_mem_pinned_cacheattr() should
> only be used while building a domain, and hence the flush can likely
> be skipped unconditionally, regardless of the type changes.

See my patch submission, which had this remark:

"Is it really sensible to add/remove ranges once the guest is already
 running? (If it is, limiting the scope of the flush would be nice, but
 would require knowing dirtyness for the domain wrt the caches, which
 currently we don't track.)"

As apparently we both agree, why don't we reject requests post-creation
then, and drop the flush? The one thing I'm uncertain about is whether
the DM would actually have carried out the operation strictly ahead of
the domain being first un-paused.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD209855DA
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 10:52:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803623.1214311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNko-0002gW-Gq; Wed, 25 Sep 2024 08:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803623.1214311; Wed, 25 Sep 2024 08:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNko-0002e6-DW; Wed, 25 Sep 2024 08:52:10 +0000
Received: by outflank-mailman (input) for mailman id 803623;
 Wed, 25 Sep 2024 08:52:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1stNkn-0002Ww-2Z
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 08:52:09 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71e76dfb-7b1b-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 10:52:07 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8a789c4fc5so119422166b.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 01:52:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f188bsm185806366b.153.2024.09.25.01.52.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 01:52:07 -0700 (PDT)
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
X-Inumbo-ID: 71e76dfb-7b1b-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727254327; x=1727859127; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KqmxM9LO5R5iHO5n2Z+lxEbm1Bbojo9cLvXFrU1AT14=;
        b=TSCF1JnAKmUyLKqNazRn/5i9gPHg6H+dj4lH2RTibq+WPuMDtUNVYzvYXgjmsyx+rT
         /L6HHwkajepIPPCWEbd3aP/NTnh+uxra1tnY/5MhJPZCXRbcWC9xt/y50mvmKoUQxV1g
         62HBn1WCauTTUdR5KF0++pL+K511hwSLrqcni0wAEvdNjVUxagxIfgj3x4oWRQ0Fut42
         axfNY/9RYv98Tys24DcuZ9DX/5y5KbqY3shUP2bJY+OmdBqpNODQgQcgGgGSt4NsaXej
         KgV1RPJAuLbQNZO2XcCHncvMtBugiOssSe8foMMv20jYhaY/j8eiceDJz+n3CxaI68tb
         AHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727254327; x=1727859127;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqmxM9LO5R5iHO5n2Z+lxEbm1Bbojo9cLvXFrU1AT14=;
        b=TjKDUT7X5SQsf3rMsPaYYDbWtYaOTtSAupP4+FP2QkaVRQ2Xq7vOo4Flf0w5fs9d62
         jpuTwjZ/i7JVzHh4pcH4H3luCzK8AukZT61NyHXYnnmfxapNYy2IAw6iMvXOawaTBw3V
         NaXzUQQ23JgYXcE4d0cXxpEVJSSQuMmvMFhaz5VfRms1PNU5g1flPE5rSlyXGNtoMhW7
         yjbYQvOdCVXtTW7Qxgb+9VdA5atLWYkBYuv7eW8GvgX3pO4hjtIB9ClbfrVw8q63p/OW
         CzNbi0gP5si4fYIjPL+yg40SqRz15mLKsFc/twJ+feTDIcOAZ0gpo4sjO/y6LYhLySUi
         XkPw==
X-Forwarded-Encrypted: i=1; AJvYcCUD8gLXRWkDJISYhqq5ekZg2tUwU8nKIoYh8Ir7LVxjw6TpWGspUSZQbz1ttW0RoSKbEaLMWvXBOps=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxN7uhMIleoJvM4/4cZaWehjE/QyUcd2U3y31AIRR5aMH6FZTn7
	7c1R41nEUCeg5hRazmu2MSy/iP1fknchkjdsqHNKCp8KuWprN/mvJiBCYr1TTtqkYNTmjgB5sEE
	=
X-Google-Smtp-Source: AGHT+IGjCz3sa/YL+8EitM8ZO5u0t1NeL//TOzg3wzHJ/DXASx5FlVhUnkG0FBBGWAbftN02JDMzVQ==
X-Received: by 2002:a17:907:25c4:b0:a90:a9bd:1c36 with SMTP id a640c23a62f3a-a93a170472fmr157589666b.18.1727254327253;
        Wed, 25 Sep 2024 01:52:07 -0700 (PDT)
Message-ID: <a54b0309-4820-4371-818e-0ef0a0912743@suse.com>
Date: Wed, 25 Sep 2024 10:52:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] xen/livepatch: remove useless check for duplicated
 sections
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20240925084239.85649-1-roger.pau@citrix.com>
 <20240925084239.85649-2-roger.pau@citrix.com>
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
In-Reply-To: <20240925084239.85649-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.09.2024 10:42, Roger Pau Monne wrote:
> The current check for duplicated sections in a payload is not effective.  Such
> check is done inside a loop that iterates over the sections names, it's
> logically impossible for the bitmap to be set more than once.
> 
> The usage of a bitmap in check_patching_sections() has been replaced with a
> boolean, since the function just cares that at least one of the special
> sections is present.
> 
> No functional change intended, as the check was useless.
> 
> Fixes: 29f4ab0b0a4f ('xsplice: Implement support for applying/reverting/replacing patches.')
> Fixes: 76b3d4098a92 ('livepatch: Do not enforce ELF_LIVEPATCH_FUNC section presence')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Just to clarify for my eventual picking up for backporting: Despite
the Fixes: tags there's no actual bug being fixed; it's merely code
simplification. So no need to backport.

Jan


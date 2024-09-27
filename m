Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00935987E84
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 08:39:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806048.1217359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su4dD-000215-5N; Fri, 27 Sep 2024 06:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806048.1217359; Fri, 27 Sep 2024 06:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su4dD-0001yG-2A; Fri, 27 Sep 2024 06:39:11 +0000
Received: by outflank-mailman (input) for mailman id 806048;
 Fri, 27 Sep 2024 06:39:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xuKF=QZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1su4dB-0001xy-0u
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 06:39:09 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31c08260-7c9b-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 08:39:07 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-374c3400367so1566666f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 23:39:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c299abd0sm87132266b.213.2024.09.26.23.39.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Sep 2024 23:39:06 -0700 (PDT)
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
X-Inumbo-ID: 31c08260-7c9b-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727419146; x=1728023946; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xk3gWQ0g3CO1ZxNLjteF4Sdfq/Kl66r8MGaoWBb5Ji4=;
        b=XIumpKSsstqKXATKX2zx5cVBY3s6sK1zAeEh9t3GnlL3B/YF55PFgF7w9SHFkzqfeQ
         QKzXIp9RBN+Th4yFp4r5ztQNwiOlQzQFJxw2lbU9PYY7D69z4uZcPp7rNZj4kZwtERxh
         2rbqd+XV808Dn7pOBAR/KloqjEPhjkHh/WOzVwFdNMN4grc4uVrafdWpwtim+6pm2BvC
         OzDhrXCB6mK7mI1pvpxHgdLlG7GtXXJ+tycvEilgu2sPYe0fn5BRDcj9G0KWjokNYo8D
         /BxbJ96ll/ZOWz6NwYxm2bN4bHFeGCWThWGA0dmTPMr/qhS8wMb63HGsrKybh9cPGWwr
         RI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727419146; x=1728023946;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xk3gWQ0g3CO1ZxNLjteF4Sdfq/Kl66r8MGaoWBb5Ji4=;
        b=oa9rEwEvrFEPJdPRXVU1r5dW9RNqc1VjL16jKPXOlODTvyqyF/rEK3ZxI/qo6yxIKv
         GfQaNWis+dlDJ6iNEsOdV/ddlfBc6o6yHpv0QZ/p+r6jy/aknwA9X68EDpYLezBTzOwQ
         PTk15FqnSTgTozJdgxa4gudKFudMRjbdyGEmvxz2fswCvEBKrR3DRv3MycHAqqF5Z3qp
         /zLCbpw5w47puqGt2B15mhw/I24Gz7x5kHr1Adizv3rCuzfdsIxFA+nDY0ciRwg1CTp7
         7CFj/ZxKLH0Yy4WLTwGlX4QUhZpVohomHogiuzOufVB7Oo5pvVzGwTTGyCYOZ7OCdGDC
         n/dw==
X-Forwarded-Encrypted: i=1; AJvYcCUsmQa8wRhxQF3Ub8rC0Nx6wP6CCE4nyNfUWJTZFvBr7i2Mp3jT2WCPeoXcCVFD906eMnqa3g9+5nE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwW0XWGjxohR4jipBwA70PoCscaTEZq4Vuo04FW2EJHMad5E2Zv
	Y3pMmnUcObpxNUfL226Xsz752/nM4vH0Ogb83+/8Zc+weC4SnXjfSKOT9WtYpw==
X-Google-Smtp-Source: AGHT+IFQcbkdgJGglth5swUzr+63sX0XrqBtGOZPVHpQUjD6ZilgT6wQfU0R4leeZCKWqrf4isTjEA==
X-Received: by 2002:a05:6000:b8b:b0:374:c658:706e with SMTP id ffacd0b85a97d-37cd5b04975mr1780308f8f.39.1727419146556;
        Thu, 26 Sep 2024 23:39:06 -0700 (PDT)
Message-ID: <1b1a0518-fc62-43b5-980d-fcb96a9799e1@suse.com>
Date: Fri, 27 Sep 2024 08:39:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] xen/riscv: add section for device information in
 linker script
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1727365854.git.oleksii.kurochko@gmail.com>
 <b8b42cd4241ceb7f5b80c28579a421554300368f.1727365854.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b8b42cd4241ceb7f5b80c28579a421554300368f.1727365854.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.09.2024 18:54, Oleksii Kurochko wrote:
> Introduce a new `.dev.info` section in the RISC-V linker script to
> handle device-specific information. This section is required by
> common code (common/device.c: device_init(), device_get_class() ).
> This section is aligned to `POINTER_ALIGN`, with `_sdevice` and `_edevice`
> marking the start and end of the section, respectively.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>




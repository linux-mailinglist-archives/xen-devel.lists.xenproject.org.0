Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC07905654
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 17:07:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739425.1146456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHPYa-00070Q-8C; Wed, 12 Jun 2024 15:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739425.1146456; Wed, 12 Jun 2024 15:06:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHPYa-0006yB-5c; Wed, 12 Jun 2024 15:06:36 +0000
Received: by outflank-mailman (input) for mailman id 739425;
 Wed, 12 Jun 2024 15:06:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHPYY-0006y3-D5
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 15:06:34 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59ea64b7-28cd-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 17:06:31 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a6f253a06caso278527566b.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 08:06:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f15095318sm494459866b.131.2024.06.12.08.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 08:06:31 -0700 (PDT)
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
X-Inumbo-ID: 59ea64b7-28cd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718204791; x=1718809591; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K+pyMSftbXnT5i26IhXc+Hdnpw2pgGxMRiyPScqFRnQ=;
        b=P3/lhQoV1vlhag2W1fbilbZf5eULcaeyiy3LN6cLE9m28IBmJn1CEGpziZMeGPmKhR
         bQIJwEy8aKQiihHCfhYJpPGHVotsWdgIuH5Ne1OznevL5UHFvB6ryOwz1yDTa4FyM4Q2
         O8BkXFZj0DtZ7mTdD11m59AuafCxVt8DDHaa+GteVuRGjzZepla/h9g8pvsaRLw76sjd
         kI5pw4d/XI/WgJEV/MZSyZmKNfBMBnN9Mi8WmTINyvSDYuJ9wQRaQFl3ICu91Z/2LIjC
         5TaReAiqgjOe/3MRD7qdVYCuqvse4px2igK/d9LnViZb2E/xaBc4SYUWOfwyruokcbs6
         YJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718204791; x=1718809591;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+pyMSftbXnT5i26IhXc+Hdnpw2pgGxMRiyPScqFRnQ=;
        b=JAuZQHUtOZrWqsTKG62Us2Atl5inqQGPE5MHdTJF9lpxrDjPWAUv+i6EkLuDFxbEbC
         y3vbC9O7aAUIM2kIXRrm1P+IePneDh4r+f1X+LD2jttFqJHYUXcaRhchaWwboCmay65T
         fTILHKYBbQ8qDqTdQ1NzN8OT67/7OFOd0UeBXuSfwnXCEqb8ptZZry5pRjDyDYMXxxfz
         ljxcaxkMRMDZJzHM14Ix57V11gCoKtOceMfV4fvZ3pj4LKBca9VMQKd4hPjGM7CsKEwh
         9JxLVki2qqVyyPVopnAwoyLir22y9XRBgqPep9wUXA03edElEOPxccXRA2Qqj5OHZI6q
         uakA==
X-Gm-Message-State: AOJu0Yzb0mREs59KPCuEfDIadpVJQBUb0UeJ1ks9hhYALWgjN1sBE1kx
	CMzEmns/zEWUGpMrG08f8BHnVnEt2VWJWPXOjJ6xq4mQ29pX0JpOghWM0zocyg==
X-Google-Smtp-Source: AGHT+IG1bnnqcK+93fnPFFZ4+99CstwDE7PI+l8sLW3EesjKydZh6nXDOk7t/pBuNUGqU/o7/Gggig==
X-Received: by 2002:a17:906:55cf:b0:a6e:ff2f:8780 with SMTP id a640c23a62f3a-a6f47f9519dmr176391066b.36.1718204791349;
        Wed, 12 Jun 2024 08:06:31 -0700 (PDT)
Message-ID: <610ec8c5-26e4-4dff-a750-fdc7bbe97f39@suse.com>
Date: Wed, 12 Jun 2024 17:06:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.19 1/3] x86/EPT: correct special page checking in
 epte_get_entry_emt()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <2936ffad-5395-45fd-877f-7fb2ca8b9dc8@suse.com>
 <175df1a2-a95f-462b-ad49-3a0fef727658@suse.com> <ZmmskwdoKvAotRk-@macbook>
 <b2985742-75e4-4974-be9d-be088d728731@suse.com> <Zmm4nFOw_wN0PKt0@macbook>
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
In-Reply-To: <Zmm4nFOw_wN0PKt0@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.06.2024 17:02, Roger Pau Monné wrote:
> We could also add an extra check to exit the loop early if special
> pages have been found but don't match the current loop index, as it's
> all special pages or none.

I was actually considering to make such a change, but then concluded
that in the common case there'll be no special pages anyway, and hence
we need to run the loop to completion anyway.

Jan


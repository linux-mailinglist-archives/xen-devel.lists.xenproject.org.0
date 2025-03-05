Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BC4A50114
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 14:49:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902290.1310242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpp7n-0003l5-8R; Wed, 05 Mar 2025 13:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902290.1310242; Wed, 05 Mar 2025 13:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpp7n-0003j3-4w; Wed, 05 Mar 2025 13:49:27 +0000
Received: by outflank-mailman (input) for mailman id 902290;
 Wed, 05 Mar 2025 13:49:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpp7l-0003ix-IF
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 13:49:25 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a519d4ca-f9c8-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 14:49:23 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43bc638686eso5462395e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 05:49:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e485e045sm21324035f8f.99.2025.03.05.05.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 05:49:22 -0800 (PST)
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
X-Inumbo-ID: a519d4ca-f9c8-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741182562; x=1741787362; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ONlaC7Eij4jCCBpV3Tw/sNuOppC/+ikFruprVLxLAZ0=;
        b=R5u/SEjXA1pysbnQSEBw6NV1dEPNnsuRzcrB3cdG7qMfwtJkuBYF22yBNcIRX6QBYJ
         U0o/vD59G33DDo5GhJubRsr9zTYY7tFZCoBJcwXPimiTo4f/GQXTt5bOZVUxI+ZFc9+7
         OgwzWDCT88PrBjpH4GHAqokDXN3mQh7aDAtUjbes+USlyizRXGStm8O6NjMRyLXOSjN3
         1p7NlMMHfEwdoJk5pEH24jPmxQ+BVeHPt7lmpEBZ0kgIcqVNZwGp4OJSJU2lbbxZQ3pt
         D9DrW5DZp7gvUgQu7SNeOUoc4A8/G4HEqikMa6c5+It+xV+jEODdecB06ss1m/TbGd4n
         vSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741182562; x=1741787362;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONlaC7Eij4jCCBpV3Tw/sNuOppC/+ikFruprVLxLAZ0=;
        b=GwtVKfG35xlu5cQdvjzHUXnOMM6Lt2umERvUUvT4UU1GLIGOmZmI+z4a59uj9KLeNI
         j3N8yVVheLHJ4VkUVml7Q2aY1zL8FXfwlUxDOXSyX2kqd+vadMumRT4Rsr23oeSC6N2G
         GNT7Yxg0rAmogtnOnmJs1Wfg6OKnbDopSmnr5Ns3q6NKutK8Jf8dTF2xBRApO3g3f734
         b5KPdH5k6ty5dJOrZUwNs/D/Xy2dIrgWJxUGz2QcU2zodnTFnq6ZSOWEKY6pdze40BPX
         fllz3cRsY0EBfofKH8z0nlbG9MTZArLSjFneoGPWFr7k5GiPd1gQjGIdMFX6kYSD/1uO
         08eA==
X-Forwarded-Encrypted: i=1; AJvYcCWD99Ox29F872wvyDaiBjChKH5P0xhvCgLuFx2ux8uytHVOyePx1vgrHwlJNme0NYj1V5BUz2wGhdM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAX5bMNGeBwuy8cz7fE50Bkg7Q4rfA6bApLW+heZAjhGyg0/oa
	YlY87SEi2zJILPy0uEQsekkSwp0ymJNeBgzuU61IBdxySbdgQhOhzuxLkGX9LA==
X-Gm-Gg: ASbGncuSVrnwirzmCRjE3zjM4F5s7G+e+Rh6qncla/IU9HAXDorB+SOU2prPtzSs9Ms
	Wc5Q5ijtnpWlM54EBoxvzwbCysEnzngm3yr2x7LzcjEPuvH6HKrNdHGv6HKjMYCZc3uxy16bmNd
	2am6t8Qp8Y9LiF5kkJwlZlqbbTeEgw9o0puYXYSkjqIeIYJuqEF/oq3lb2KXYyMIsv8aeb3ZU3/
	CLKZfy90Y+J0A+Klav1o4b4afUg8VuM1Q2+LA2fYdpJGi+6qzHDQ4g/EAPPBMuCoMt/RJ+yA4Qt
	+CjML6nSt2yYmTtwX+jAmY5+i2UQpgJmuI6RXXIP4dJNx1lO8AX0YMfj1rorosZ8rK/17C9TlcQ
	7opEsrxhUzYGgY4BO/6rJkTSyj69v0w==
X-Google-Smtp-Source: AGHT+IGWzRr/MyhKG9AhBMlqe/kO7x3Sh1reeyKFG+1Bbnhn5fi6TzcTIye3WNYbo00cZNvHg7XCUA==
X-Received: by 2002:a05:600c:4510:b0:43b:c270:49ae with SMTP id 5b1f17b1804b1-43bcad69e48mr60671905e9.0.1741182562603;
        Wed, 05 Mar 2025 05:49:22 -0800 (PST)
Message-ID: <042807a0-77cc-4e16-a949-116bb7cd8c94@suse.com>
Date: Wed, 5 Mar 2025 14:49:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/vlapic: Fix handling of writes to APIC_ESR
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250303185352.86499-1-andrew.cooper3@citrix.com>
 <20250303185352.86499-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250303185352.86499-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.03.2025 19:53, Andrew Cooper wrote:
> Xen currently presents APIC_ESR to guests as a simple read/write register.
> 
> This is incorrect.  The SDM states:
> 
>   The ESR is a write/read register. Before attempt to read from the ESR,
>   software should first write to it. (The value written does not affect the
>   values read subsequently; only zero may be written in x2APIC mode.) This
>   write clears any previously logged errors and updates the ESR with any
>   errors detected since the last write to the ESR.
> 
> Introduce a new pending_esr field in hvm_hw_lapic.
> 
> Update vlapic_error() to accumulate errors here, and extend vlapic_reg_write()
> to discard the written value and transfer pending_esr into APIC_ESR.  Reads
> are still as before.
> 
> Importantly, this means that guests no longer destroys the ESR value it's
> looking for in the LVTERR handler when following the SDM instructions.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I guess there's no good Fixes: candidate?

Jan


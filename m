Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB7FA35C6E
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 12:24:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888724.1298035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1titn7-0005nQ-GC; Fri, 14 Feb 2025 11:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888724.1298035; Fri, 14 Feb 2025 11:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1titn7-0005ly-D7; Fri, 14 Feb 2025 11:23:29 +0000
Received: by outflank-mailman (input) for mailman id 888724;
 Fri, 14 Feb 2025 11:23:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1titn5-0005ls-Ur
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 11:23:27 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ba971ee-eac6-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 12:23:26 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ab78e6edb99so299007266b.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 03:23:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53231798sm323435666b.16.2025.02.14.03.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 03:23:25 -0800 (PST)
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
X-Inumbo-ID: 1ba971ee-eac6-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739532205; x=1740137005; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mig9rnQAw8ZgeVM6HufpbH99C9Z8cTSeVuHOlqVvcvs=;
        b=br079Qc7Fyn+VujUTMm6ouugyQWhDPPpOJtCJbXSJXcCD+ETvrPsLBa7RAVygw1hXD
         mXC/3OF2RA5TmrJHU8ERJmwgs9pqicQksgpBm4qTlGHq5yq8wCE7sHm3hYZHcyAVgdNk
         0SdstzztabXdvPdsgOATm6mjoT/BtZAWx7gKQfwQz5tWVQN7cW+inyFX0DH+C/qAAEmA
         9+FouqFqKeJLDY8h0b0qnjaRCjhmEeJzBtA1JKzuR/uLMORoB6Cl8Guk0fj2FOUNZPwc
         kMD13UHGi0jdATs4iafLFYW21vsWXPU32U/j8HWRkSt3+r+UgMgF8FTUztm1NRq/8xq2
         Y+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739532205; x=1740137005;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mig9rnQAw8ZgeVM6HufpbH99C9Z8cTSeVuHOlqVvcvs=;
        b=T5aXfkR9srKXaAEyCVmFU+5q9V1sR/xxzF/BBjo8W3LCrb7LjyvsfQZiOoYoHCcLh8
         3XKJ4H8oWeAjQ7t1aQY/5KfkaeESzt3xh3BFNUDYPxH0MqAOlqYL7y3G2ZsoOteGrIS5
         KR1UefhUKsRGhTSfeHsHhPdgfcaXY44JyqSrjOxyTg3xUNTmznwGy/fOHv6seWFlLHA1
         rVfDI3ZAM3wfQBsRu9hlHzuukp1e5WugaGxXORNLZAoBrwBKEpJgqtUGQts5lnaiEhAJ
         IvsVNtd02HzRelKxXpZIa1/fW5tZ+xh7QnA0xVK9fojXCvIrA8cTuI+KzY19tM9+tP2d
         eTcw==
X-Forwarded-Encrypted: i=1; AJvYcCUqaB/5jwpM8xZF1i8yjqamLNKPC7aRzzQeI3TNQxDP8GXrYW8JjZYQ1bGr6I1ZNNuR9Pgg7tWu7wY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/7Sd/AesvsV91ukSr7VprX0dCb3Km5u2dYEKvcV0l0ZeIdez2
	xQf+NMUTaNKTinafnt8UcSnvdU8bzyJQ6GIqJoZLJYgi6zov0YDkQ8/HwFZiMuC/ycEGgb8sKYc
	=
X-Gm-Gg: ASbGnctozoD+N5BXZnMPxqkIU2FKO2SyNuxs9bRtmDsdbWpGvA+wpgFUKBs/FN9zSwm
	H7T5Q73b6XTT0AJlip/j+iEhtNrIEcPud6+7pE3JwWxuV4UpxOyHpCfqwg1nxMm7Lcdia6nWzIl
	gxiqx+hnHVVlLBEyAA11x3Pab4CQzDphTvz9QDva3pGYfwty5C6AZkXyGpTFLG95qdH+PvCTPMB
	ZhTkW+AhT3o5Iq1qJf/e2o+eWQ3ByYW/AxC7F36kjfMOAMwjbs+p2U74lk2up62ME2VNvMQo/4c
	yzziGia6D+cuaCXXV05iaPmPZ/5pdoXJLaDVrVHH6TR340NeR8pLVK3yewZTHxpQ1aARG4pEwqb
	d
X-Google-Smtp-Source: AGHT+IEeHJJyP8o9BaAigrO0GHUjOpLgFgvS8PdpKOwzaLZk3lS7vWlc6khf+XO3p3KmIz+VIPTfzw==
X-Received: by 2002:a17:907:2d93:b0:ab7:def3:ca1d with SMTP id a640c23a62f3a-ab7f34e71d8mr1020894666b.49.1739532205585;
        Fri, 14 Feb 2025 03:23:25 -0800 (PST)
Message-ID: <aa2cb2e6-410c-420e-a004-bf57f9c295af@suse.com>
Date: Fri, 14 Feb 2025 12:23:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/emul: dump unhandled memory accesses for PVH dom0
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250214092928.28932-1-roger.pau@citrix.com>
 <20250214092928.28932-2-roger.pau@citrix.com>
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
In-Reply-To: <20250214092928.28932-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.02.2025 10:29, Roger Pau Monne wrote:
> A PV dom0 can map any host memory as long as it's allowed by the IO
> capability range in d->iomem_caps.  On the other hand, a PVH dom0 has no
> way to populate MMIO region onto it's p2m, so it's limited to what Xen
> initially populates on the p2m based on the host memory map and the enabled
> device BARs.
> 
> Introduce a new debug build only printk that reports attempts by dom0 to
> access addresses not populated on the p2m, and not handled by any emulator.
> This is for information purposes only, but might allow getting an idea of
> what MMIO ranges might be missing on the p2m.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Hmm, yes, why not:
Acked-by: Jan Beulich <jbeulich@suse.com>
with one suggestion:

> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -337,6 +337,9 @@ static int hvmemul_do_io(
>          /* If there is no suitable backing DM, just ignore accesses */
>          if ( !s )
>          {
> +            if ( is_mmio && is_hardware_domain(currd) )
> +                gdprintk(XENLOG_DEBUG, "unhandled memory %s to %#lx size %u\n",
> +                         dir ? "read" : "write", addr, size);

Can we make it "read from" and "write to"?

Jan



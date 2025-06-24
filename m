Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CCEAE5CAA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 08:13:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023118.1399037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTwuV-0005c3-43; Tue, 24 Jun 2025 06:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023118.1399037; Tue, 24 Jun 2025 06:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTwuV-0005aY-0w; Tue, 24 Jun 2025 06:13:35 +0000
Received: by outflank-mailman (input) for mailman id 1023118;
 Tue, 24 Jun 2025 06:13:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTwuT-0005XR-Rs
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 06:13:33 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a847050-50c2-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 08:13:32 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so38499665e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 23:13:32 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2f9:d2d:164b:59bd:2475?
 (p200300cab711f2f90d2d164b59bd2475.dip0.t-ipconnect.de.
 [2003:ca:b711:f2f9:d2d:164b:59bd:2475])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e80f2b8fsm1043757f8f.59.2025.06.23.23.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 23:13:31 -0700 (PDT)
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
X-Inumbo-ID: 5a847050-50c2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750745612; x=1751350412; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1XG8vcE/yTA/JXSmZmw22gycyjddihVhu0OgNLKL2/U=;
        b=DD+eAxqh7Cue1bXSK6zO52R39AV/5855Ru3GiugVvHVymX+eOFElrA2JZSQvu8f2EJ
         WQPVs+dPoUUts0A5KCpsFziJCKstkwSNFWxfgQBF9AkJEce49r3UIGIh5VzACR5JfXda
         v1K8v/cvR/BRRwfwZNwVYR2xj7UupsPrkRcSvQV8aGOOat6pyaPXGNupZJg23aXssUBY
         oMgGeDFFG97DdBioU8/hsKt03cldWdt7BLenmPOCZaJGsrgBDR+goc7lmUXBxob3l3H5
         x6aRUUKGMv/vi5iBVeZELGJUsq9xuugyPblOL7nqgZlM8u0F3yOr6or3n97yGBz/YTeJ
         eKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745612; x=1751350412;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XG8vcE/yTA/JXSmZmw22gycyjddihVhu0OgNLKL2/U=;
        b=XOsqf5p/g6Ed5ut0EL1+E+wSgfn/4Nwyp4p33MizyER29l+1jgIDLP+ib4CpAJXE56
         LtUk5SeBEloVmTdW5dlKor1AJU6qn7lQWL7+9jec25xZbgTiBnA2nIqghOkqoOhZir5c
         byQl+lkqQ6nmW50rzBAKmRGzU6ULpakkUrkgt/APVKYqvA51PwzD4H/nT/H2cOMGJxY/
         MMD7eP52iIMMcIDYBg0ZiwyEHbje/MzbbUzgJmM0DoKR4y8ndnlMB+XR4jhvdavExbjv
         xGvUohPoGULlORMcVKgNDh9zwevFlof9150k/PNIUtH4KIfm4C/lMFXlzK0pCdSrgefT
         CLvw==
X-Forwarded-Encrypted: i=1; AJvYcCXNA6sXlbCcHjW+hj4qHx8gdCIUxo+cC/ErYXUxMRA3bjD1hVhPPS0Lm5Sjy86Fnl6bVN4lHTZAQwY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFOfaEk5ikoS4wVnBEx9Zuxtq38LKAY/9rVqCthsMHS60R/RBb
	H2p30kBMt7AGT3h3p1qc/MyLhP25l2Y0GZJJNQ4FU47RzS5tr6Wg7d7sB5Eft5RIVw==
X-Gm-Gg: ASbGnctVXgOHf25MjAYQ5teVw/PwZjxcwaChkHVRszfIkzCLK1CyJ1AKhbksF5jBXbV
	RcFNiwLfjqkoahypCIGYUA9SGUvhnWDkJka5KJW2QE2ehljIB4tvHA+hFleyP/G0FSoUJXuAN4W
	jcohwHRcqYN3G7J22VXNu+PGh+2IaoSMRzUCZV1NdSg8o4VV1afkR0QeMlZDfkk95rmo+mQRfJM
	gxD+rh0qUWGm6J0aiCeI8yUgGZQRP8rzW4AQXhUZdYh1Brm2oECP76SRMDseVA89tk6VHg8MV2/
	fJnLivItlB/nZrw+coearDb27uhMrbbXl6FJ2UREzN4699wOb2MMZq9L06Rf/2c/8N+t9YLwEIT
	gDxNAl9D4FxyrzOmSarIvZ5GzODz21ER3dEX7F5gU0RcI8JVKJ5awNaa+SNqvAIA5v3PPeo0Tuy
	xZBZMulMxIBADqoNfqnQ==
X-Google-Smtp-Source: AGHT+IHmqbbYIE5aDsVX82go0OmHtk93tcqmT+NUsoGJDlcy90yA9XFj/uHjbO4cWQjDYH0KywLVpw==
X-Received: by 2002:a05:600c:3ba4:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-453659c3b97mr136581065e9.2.1750745611601;
        Mon, 23 Jun 2025 23:13:31 -0700 (PDT)
Message-ID: <3de371c5-5594-4209-a430-7e7afd1198f4@suse.com>
Date: Tue, 24 Jun 2025 08:13:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] automation/eclair: update configuration of D4.10
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, michal.orzel@amd.com,
 julien@xen.org, roger.pau@citrix.com, bertrand.marquis@arm.com,
 federico.serafini@bugseng.com, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2506231650080.862517@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2506231650080.862517@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 03:19, Stefano Stabellini wrote:
> MISRA C Directive 4.10 states that "Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once".
> 
> Add a SAF tag and update the comment on top of cpufeatures.h.
> Add a header inclusion guard to compile.h.
> Generate header guards for hypercall-defs.h
> 
> Update ECLAIR configuration to:
> - extend existing deviation to other comments explicitly saying a file
>   is intended for multiple inclusion;
> - extend existing deviation to other autogenerated files;
> - tag the guidelines as clean.
> 
> Update deviations.rst accordingly.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com> # x86



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDD0A58EC8
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 10:01:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906255.1313715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trZ0u-0000vS-13; Mon, 10 Mar 2025 09:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906255.1313715; Mon, 10 Mar 2025 09:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trZ0t-0000sN-U5; Mon, 10 Mar 2025 09:01:31 +0000
Received: by outflank-mailman (input) for mailman id 906255;
 Mon, 10 Mar 2025 09:01:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sahL=V5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1trZ0s-0000sF-Kf
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 09:01:30 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40cf0805-fd8e-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 10:01:28 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso5825645e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 02:01:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cf6d05234sm31144345e9.2.2025.03.10.02.01.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 02:01:28 -0700 (PDT)
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
X-Inumbo-ID: 40cf0805-fd8e-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741597288; x=1742202088; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w3N497sXuFP7W0HDLKpz65ux5K9/WWI36JCb19Yq+Mw=;
        b=HHvZ6LbG+btu1VPLKvayrcc+vDjRBh4Tp3dn60MtvpZCXOurdBsswJdSOsTZBdAQGL
         JagvGctntg2if5gJpOZ92pVTPjh4rCgFa+kZydPnFmOk038zY0b++nmoxhseRqQRby+9
         eCql+XuO1StI10+uP6MzyeJ1UXlafPqQcww6T3LJ2qZ3Iy3Slpzi4XihzQvJDDZAtMop
         0qtBVTBicPJ81RQZtvzExHXBXS65h31lLZPcMjnIUzr5KvXeGaJJR+qZnkpVjypWYUJU
         T6vplDu5Ax1tlla1EGng0gKhLCI1K9QIbP643kc6wtCsgQdBpz5/DCJuGgKHLqCmS4AZ
         BAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741597288; x=1742202088;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3N497sXuFP7W0HDLKpz65ux5K9/WWI36JCb19Yq+Mw=;
        b=U6b8QipOS/JWSQ5Kj7cN/NtsuAd3Q91JwafI2AkYcOihDCRmaqqAhjsF1zLSe5U/ma
         VXadnRItCxk8bu4uBc4xSB/l4OfLN5LpSr+ANYnn2S4+ryF2ixYe/ZZWGJcVbh93aCSt
         Emeg+t4ypi8yd90XK37lvx01ALjj9lTEI8hSO3Im4kBPr6zFNO/RtxS+wgftQdZ4ZqKd
         CSYboWgJOS4dE/izT0q1GTzAqpdDzRIaWC7qnDB6Ba7UPvccFW6XRI2b45L2pQoW/SqJ
         iSQNGlvFYMbLR1c3YscBeymqfq9753BRy75upk8tYS3KGsPO8XFcMrkOpfm+WCuIK77V
         XUoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+HmyPe1hZniZjdwR26TPd03vEuMBvxvSnDlc2MVTfEfJwxuvBpDfV6uPLZmEn4T1X6mzp8bfMaFg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5CrbmsvfKChxU3GLbPuhqPbo0gjBhCkaxZFtcbDuTEc5vNRIn
	EnKEgIVM6vJKObuaBGivkzhBjnqONIHrB1ZtrOe5N1ggdZeOZcSw1ZIdddpg8Q==
X-Gm-Gg: ASbGncspUAwm7hsp5z72yLZRxIQqHupQUTMNhR0WL4F+q6vyNxwOJGZFAXlaTIjGQsx
	VwWLEsbOf+VnCKKdCkqNU/nDBuBHSzqX/a02HDh0BWTxha+fNh2cE7IFz3IZr8MYXIKqdX4yqgK
	PrAvfS4l7WqjGvKRFi15uIX9X9u0lFhv0hdcoRxufQU4fOonuXCzef9bM0KejkcGUa6Ws5eYW0k
	fM8hSg1lGYhSiXGHAq0rsxo3LrHp7FtZlCYJ4m9cYwCILslAKZdt9ZDrzSPJnkcJRjPCAv6RkHC
	oRhqDWcMA1dRk66nEiJu1U+xz99+Wkvkb+bnvRxNpF9pDJwdoeasTeYpGQT46oeEvM+vQGb/Sqd
	UCAvdrCeyKbokPdAVe7n12A/dWdUFRQ==
X-Google-Smtp-Source: AGHT+IFSAYGRUi1OS47ZjSAVW22TahEieRAgvzn8BHFtocaXdhlUn/p9OK7u870J/OSp0idRonEk7w==
X-Received: by 2002:a05:600c:5103:b0:439:685e:d4c8 with SMTP id 5b1f17b1804b1-43c5a60eda3mr77328965e9.15.1741597288287;
        Mon, 10 Mar 2025 02:01:28 -0700 (PDT)
Message-ID: <88863567-220d-4b70-b0e0-1cb14e564963@suse.com>
Date: Mon, 10 Mar 2025 10:01:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/23] xen/domctl: Expose privileged and hardware
 capabilities
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-7-jason.andryuk@amd.com>
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
In-Reply-To: <20250306220343.203047-7-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 23:03, Jason Andryuk wrote:
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -155,6 +155,12 @@ struct xen_domctl_getdomaininfo {
>  /* domain has hardware assisted paging */
>  #define _XEN_DOMINF_hap       8
>  #define XEN_DOMINF_hap        (1U<<_XEN_DOMINF_hap)
> +/* domain is hardware domain */
> +#define _XEN_DOMINF_hardware  9
> +#define XEN_DOMINF_hardware   (1U<<_XEN_DOMINF_hardware)
> +/* domain is privileged */
> +#define _XEN_DOMINF_priv      10
> +#define XEN_DOMINF_priv       (1U<<_XEN_DOMINF_priv)

Better use "control" in place of "priv", as "privileged" can also be a
gradual thing?

Jan


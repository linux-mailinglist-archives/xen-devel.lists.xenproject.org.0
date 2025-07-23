Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 907ECB0EAA4
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 08:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053264.1421993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueSyF-00013t-CA; Wed, 23 Jul 2025 06:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053264.1421993; Wed, 23 Jul 2025 06:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueSyF-00011L-9Y; Wed, 23 Jul 2025 06:28:55 +0000
Received: by outflank-mailman (input) for mailman id 1053264;
 Wed, 23 Jul 2025 06:28:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueSyE-00011F-CN
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 06:28:54 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d93eabe-678e-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 08:28:53 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45634205adaso30985015e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 23:28:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb974219sm8683355b3a.116.2025.07.22.23.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 23:28:52 -0700 (PDT)
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
X-Inumbo-ID: 4d93eabe-678e-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753252133; x=1753856933; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0M6juOw/JQaajpYRdNciEn19YkKvegsasZa+QhNEkoc=;
        b=GOBUv3qMThrb3nWCdrwR+DjlrDEBGQdw77V4LxiuM9JezFCjQyXHdTyhSrj3iP42CU
         FZTL7lG2jptOALj+4ch/TAz3R1caRg6hU+MQP6uDbp1Tz/qILfSo5OYqP63RmOd+hIUW
         2MJ0PG/6ksWwK5hMw8LyotRevnBT2+4LQzuLGKBGgvxew6KmoTD45Cyluy9sfE7i2OIa
         ZdXuL4E3r1dD65PXkQ6mlJeS8RkrUX8mdvV9NckCB+okRqJ0G2OVm86bmiW82p5A6vvy
         4g8OosEHpLhahKrNt/aNuhCl05Tl0VGzyA38UrkDz5behIVGl4vQrwBu4YP0ZJtyHghu
         ICKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753252133; x=1753856933;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0M6juOw/JQaajpYRdNciEn19YkKvegsasZa+QhNEkoc=;
        b=NHl0s8gep47NB8Q1JiLgwcLcz8moJsRrYABbWjnT9LWVbMPis3UCdS2FwI159DDNIz
         M5UccAh9QKz2swC5w6cmceyoDhuy+2gLpgZsTvcsv1pouJXzBkwdkO3mKs4H7HJYlSmW
         azx7CJlfnQmpRtgXYTtfpPFMsz2moKrAaooQde858wEPWJu+UCM9njbm3xSAZTVIt39U
         r+wim71F/DU1cR66ry3caE3eTYE4MsqfhkrupBQ2oW6qRGUkavOZpvmqLwDbSU/jd1hH
         wKuUZ6WI+x8NjEou0wqdXe6gNnxIrYXHcOtnDXln9XRcgtrl2q8+pdeXIKOkG9GoiFXe
         GocA==
X-Forwarded-Encrypted: i=1; AJvYcCVtbP4z4eckUSsEJeydL43b7lnrFlh1QdAcDTQRMPeewgdkglXRZcgW00ODrEpbMXApVKQk6I3AxJE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzmbt+bmC2tEEdBTNNZF5L+bYqIMnAAfSzDrlm26C2NpyX+JWGG
	1Svll/9XjTpXWEfsBWsoH1r/62vctwHTzc+91sn/ZlCrc+fZmppEpxBRMn6ramTytw==
X-Gm-Gg: ASbGnctWuGWtalzICVIfZknWhM6gvOfIj5On4JXLR8xt69Kdx9oZKg2p6nSpc3DNHlp
	IKmtnvp2yyr17yzSHmJcQx45bDyeHMbZrwIysP77Q7mPE/m6baMRf2S8HXbgsIgU6ESMls6R6rg
	VbxgUGssmTg/oE65fBgKqOOUY/pohtQqv2axuNhfiiqHYGmDd5/Vfg64CYILkp3+D2cqM5r8E7A
	qI4Qn2V25n7TATkiOB2oujggzhB2uLEkDdaojxbzswV/WRvFb+c8MLR5LGKJ1JNz22z4W8u1Cf5
	b2hFta2yXBC+tieW6lI2HUppUd1Fy+fDVaUdO4leYWWI+FuKabpPXy/nyeo9jmgXL7H/6Qfhn/T
	WWEu6YjFfNpZpRzJXM8BuBNdNSBsz23rFQLNY0kLsp1P7+ETHuvTNa4LTaecIO1+iaatAx1/he/
	BYm7dQzpA=
X-Google-Smtp-Source: AGHT+IGUyomOQsVb0QQrk8oNiOvYInMG+fr79jXeP/mCiW0/n3XAcwRXwnnApMK8Tbtku9gBc+Fx6g==
X-Received: by 2002:a05:6000:381:b0:3b6:1174:a963 with SMTP id ffacd0b85a97d-3b768ef9875mr1112663f8f.25.1753252132797;
        Tue, 22 Jul 2025 23:28:52 -0700 (PDT)
Message-ID: <481a415a-7992-42bf-a890-a7b40b4aac84@suse.com>
Date: Wed, 23 Jul 2025 08:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen: Add capabilities to get_domain_state
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20250722001958.174294-1-jason.andryuk@amd.com>
 <20250722001958.174294-2-jason.andryuk@amd.com>
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
In-Reply-To: <20250722001958.174294-2-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2025 02:19, Jason Andryuk wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -195,6 +195,14 @@ static void set_domain_state_info(struct xen_domctl_get_domain_state *info,
>          info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DYING;
>      if ( d->is_dying == DOMDYING_dead )
>          info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DEAD;
> +
> +    info->caps = 0;
> +    if ( is_control_domain(d) )
> +        info->caps |= XEN_DOMCTL_GETDOMSTATE_CAP_CONTROL;
> +    if ( is_hardware_domain(d) )
> +        info->caps |= XEN_DOMCTL_GETDOMSTATE_CAP_HARDWARE;
> +    if ( is_xenstore_domain(d) )
> +        info->caps |= XEN_DOMCTL_GETDOMSTATE_CAP_XENSTORE;
>      info->unique_id = d->unique_id;
>  }

This being a stable sub-op, don't we need a way to indicate to the caller
_that_ this field has valid data now? When non-zero it's easy to tell, but
getting back zero is ambiguous.

Jan


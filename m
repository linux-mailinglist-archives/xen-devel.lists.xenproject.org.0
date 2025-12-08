Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9CACAD36B
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 14:08:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180494.1503664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSayN-0000sr-E1; Mon, 08 Dec 2025 13:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180494.1503664; Mon, 08 Dec 2025 13:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSayN-0000ql-AO; Mon, 08 Dec 2025 13:08:15 +0000
Received: by outflank-mailman (input) for mailman id 1180494;
 Mon, 08 Dec 2025 13:08:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSayL-0000qf-Ch
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 13:08:13 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f18787ad-d436-11f0-980a-7dc792cee155;
 Mon, 08 Dec 2025 14:08:09 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so38873615e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 05:08:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbe9070sm25306888f8f.7.2025.12.08.05.08.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 05:08:08 -0800 (PST)
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
X-Inumbo-ID: f18787ad-d436-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765199289; x=1765804089; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ydTbUhj9gkEBHkiKtyeBSFh+I4XkETXZh+UYOKye5iE=;
        b=Dme8Rw5w0qA0rmO9NZUFH8qbib8tku5f01Bld+aahlskQF9jqSqQIxXymWLf93MPuz
         lNmEveqlR9bvbk3X4n4EQE8467wDUPwu38mZSnDVFkw+vF6CCzWqRhNlV+0y2JKHAQKb
         pDD8Rtd+fj5d/WEZf+2sgKXtDoC6SNiiJIblSRZxXQp3xt3VACtxB/EQCumznhhWS56z
         mr9eI0p0rSvZ36jAVs1WdUS4VOspftUZMX0wZtfBeCwWvws/rqNpV9KGU2giMBtAA63Z
         ASCrhfuXZUHnXCWduhkRQunBRz+xID2gHa6iYqb42ubstUs2oqk6tCRAmjDjoavsPzA/
         etUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765199289; x=1765804089;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydTbUhj9gkEBHkiKtyeBSFh+I4XkETXZh+UYOKye5iE=;
        b=QjEyA3xmWhwXdxO8lclioskKBM0UTmIoIy1X4c3lam8Gk3wLpUf9HFVWO3v55gpadM
         M7oAgNZfBBQzkDwgCGMvU5vuJ58SnfnxzIZGdZNIkGW9e5lkKtt6A0V34Je9teeSf0h3
         8m6FMm7N3LSwr+8Oa5GXEy+b2UBdtWtjYXIOkxrd9LwK0DsMgcIPONBbQfgnBfSCnAeb
         5qCh5Z3KX0IDsRXWh741S/6jupqgy9Oejf3nGUO2q3vQIb/pN7jnTvzriviPW1ciDnrn
         x2b83AU+KbPC6uBteyXxs+7kUhMuiG45vycFBFYAhrOcaLoeBDPAATc66QNVdFQyenEP
         rWOg==
X-Forwarded-Encrypted: i=1; AJvYcCXmpF/P+ARNBjNwsRWn6xvgQY8ie+LCiOVwzF6gAICGErI+3wHG7/95nalAQyFhK0o4IaUOja88rKI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOJDDcVVcvuYApE34giN0cYoIgnQ+6/VZauik0bymwsghniLgQ
	j47h7fMuoyYAjXmiDr1cDaLayDhUGTmvV+Qm2p6zTw65WB4Rd6yjBdgH8YrDBYX65Q==
X-Gm-Gg: ASbGncuJi9ZBGHT4VBmR6lYklDiFGLq6cSO5LTZEZ9NyUb0p0/aFvgyqH7VRIJibLUh
	dLjPXwTmRR67/AY5yFuoKred+e7KO7ph2cXIuOe15qdg0bvts8tYA1QxCvdfQbGsWEbNtf2ZFvA
	gq+NTkkr5+mcIuWFTtxUnaKZ+QnVJ+FFDh2O1Ye8I9086EytYTpGQ4Pfe1ARYxYpgkjiI0KAPoP
	84uc8mXVlATX0wbZhmAGhLjJk9BXSGTAHWXvxRFYeq/AOEW2lNVAeF8ZBMOdi1sZZxS3UyERr6s
	SpH1ttGi7ECs5L9UP1245b4JpcG9l8UvW6xBq108OQymjoxfQHkDXy+lYPlbbwxbqF4MHBPeRv1
	LSfRmQX7xT54Zh3Cafj2/BKGBYdbJwpTtyVpVDgIWTCt6sUc24urYqyFMyV3XcxnUbTCwh49/Zy
	xMYMJtdNMAaZQRSLHGC+wKaaBdN3LckVaRMNdQkoDpM+JrT3GQiSIsRb6dtqPFsPGOajg57xDbp
	ww=
X-Google-Smtp-Source: AGHT+IGZlPR69YC3bh4TgFI65UCH3+sXhZCgSxnp6S5oLdxmBpkVVuzBw+BgogFOK3zx6JTY+kCADw==
X-Received: by 2002:a05:6000:2007:b0:429:bca4:6b44 with SMTP id ffacd0b85a97d-42f89f094a4mr8281979f8f.13.1765199288903;
        Mon, 08 Dec 2025 05:08:08 -0800 (PST)
Message-ID: <88ab7d88-9b25-418c-bc5a-fc080c5e78ff@suse.com>
Date: Mon, 8 Dec 2025 14:08:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] domctl: Provide appropriate error code when PIRQs are
 not supported
To: Milan Djokic <milan_djokic@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1764961645.git.milan_djokic@epam.com>
 <b38b7b65630d1f167d1589d21556be1493c180be.1764961645.git.milan_djokic@epam.com>
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
In-Reply-To: <b38b7b65630d1f167d1589d21556be1493c180be.1764961645.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2025 21:36, Milan Djokic wrote:
> When PIRQs are not supported (e.g. for arm), XEN_DOMCTL_irq_permission
> command is not handled.
> This results with default (-ENOSYS) error code returned to control domain.
> Update command handling to return -EOPNOTSUPP if control domain
> invokes it by mistake when PIRQs are not supported.

Did you consider simply replacing the bogus ENOSYS by EOPNOTSUPP? (Assuming
the difference in error code really makes a difference to callers.)

> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -555,14 +555,14 @@ static XSM_INLINE int cf_check xsm_unmap_domain_irq(
>      XSM_ASSERT_ACTION(XSM_HOOK);
>      return xsm_default_action(action, current->domain, d);
>  }
> -
> +#ifdef CONFIG_HAS_PIRQ
>  static XSM_INLINE int cf_check xsm_irq_permission(
>      XSM_DEFAULT_ARG struct domain *d, int pirq, uint8_t allow)
>  {
>      XSM_ASSERT_ACTION(XSM_HOOK);
>      return xsm_default_action(action, current->domain, d);
>  }
> -
> +#endif
>  static XSM_INLINE int cf_check xsm_iomem_permission(
>      XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
>  {

Why would you zap blank lines like this (also elsewhere)?

Jan


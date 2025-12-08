Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CE4CAD3F1
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 14:25:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180508.1503675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbEd-0003kt-PA; Mon, 08 Dec 2025 13:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180508.1503675; Mon, 08 Dec 2025 13:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbEd-0003hu-Ly; Mon, 08 Dec 2025 13:25:03 +0000
Received: by outflank-mailman (input) for mailman id 1180508;
 Mon, 08 Dec 2025 13:25:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSbEb-0003ho-UA
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 13:25:01 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b94770f-d439-11f0-980a-7dc792cee155;
 Mon, 08 Dec 2025 14:24:59 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-477a1c28778so57866405e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 05:24:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d331af5sm24798500f8f.31.2025.12.08.05.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 05:24:57 -0800 (PST)
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
X-Inumbo-ID: 4b94770f-d439-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765200299; x=1765805099; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=APQT1Py7p0vjZGxyv/qYvaEOc+4TM+qBsT5qNROkohU=;
        b=Kno1bazg8PfVbCuxhsS7948I2FWs/uLyFYLl+G0NqlcINpOJ03p4L37HHHXX5OHZy2
         w31l+L32fnmJpYPj/ABblNx3YitI2evp3FusDpV0eJOBgUCMa2wuu5DVk3YSAQQp/bT5
         x+SLt1PmURHPcTmajm52Mi0hNPCgB91G2VGZsXaHU/B5h42j+aP8oQLQAb39AjKBWXXS
         SgEdBpvNkI25SGEwx81CLlPwugN8AQdOtyP0GxkqG4CJchV6cMSYlj+/QJHTajxdDxQk
         gvJq9VAEZa6QlzpACf1SQ/0d0nxezeYZZF/1cF3dyTbziVTUNJ/Vc58n3wskzSdzIZeY
         XIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765200299; x=1765805099;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APQT1Py7p0vjZGxyv/qYvaEOc+4TM+qBsT5qNROkohU=;
        b=n/hPEx9XPDjDqLwsqgm/oygW5rHNH9ZsN1ykH0G1eFKtam7/TJ7n5Z8rjIzjoj6ZUB
         IAgCJUMcwj+wdeUOUwFTt15TsbsZKevvzNU126MMbeVEqAo6HsNJMqB78c8x29WIm6Iw
         UFjFewIYApXJbgs4ov9zuaGaWrWGrCnzRp7jBbdEg1YlpFY4ob6xiolsWSda/D0oEH5v
         1up1sSFDHR0rzluLzbo4jTW2Jj1RChofQzfwwleUqMiz3Xu/7nQcFay2TLSf5XR5NR8H
         4c13dEDEnbNsFyoK6hNowS9LmLz0TpDjxuA+++mjRu6U6NBsa7GJYeXwCVz9FJeeSf3i
         tFlA==
X-Forwarded-Encrypted: i=1; AJvYcCUfn7o+DlSb+Lv1/m9d6X1pIPVUv/xISHVBNS5wfNsUmsS3TwR6rhiDJTxdtaJiEXY6UrqULNZEaAc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYsfUeXzLSxu5rqmyyQxoolu5vFNdpsStLkixoHSOZR4O0Mvlv
	OylnZGK8mULcyYVHezWYT40O9AAOUZhOhmTFut+jhgovafSMGx7pzqqRTGO4tiFUSg==
X-Gm-Gg: ASbGnctLeyCJ5hbWkqEcTyIGrNY6q93xjlJJUqxCYgpEZt0CTeeZSE1LEuu5Ix/t5eb
	+hzMZs8l3JonkjjU8AYI6PcfL4m/MRC9bHYw/J7VMc1Og+8Tyo8XQ320W4thczoU5AOyPs8rEPQ
	MGwJ/DTvItuiPkR0J387vWTF7sN7eUDIL9Mmo4rGA78UwyqawnCROyUkLyHsGAkZFpQc/sSmQ0S
	J+KYIvsr8s5GumCmpK3HXRXViYLI3o9kGULxMo/MNlSUMkithXHHsTPygxXMpgYhyYFU7Hgerap
	GUS/vXKZ9LZQ9hKm7DzsOu2oZmI6iLecifE72jUZVlsDS1duQiEDFgLtyfHoHEIHy/jcwNjT1EL
	AInChno0dIZrWTP2+dTNsv3OpMWzY04S14gzZiGDG24L1f1ikktzf8cPeEOhYAQAY4PMPFhAsGL
	boB70fvF90jmnlk39XSLb9EIloJllNRjfSbSzuGk6m5qCWFjzvm3TRh702nUc9f1OxlInpmfMl+
	Zk=
X-Google-Smtp-Source: AGHT+IFfuNw4k15QBhkSzuo+njk+LVgK4lLVMopIsFIoQd0MtS36pbrbhfy5pmWu7wSLHAzXwAz7SA==
X-Received: by 2002:a05:6000:2287:b0:42b:32f5:ad18 with SMTP id ffacd0b85a97d-42f89f0944cmr7219199f8f.9.1765200298332;
        Mon, 08 Dec 2025 05:24:58 -0800 (PST)
Message-ID: <b492bd01-c32d-4cc7-bb6c-4f3555735be5@suse.com>
Date: Mon, 8 Dec 2025 14:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] domctl: Provide appropriate error code when VM events
 are not supported
To: Milan Djokic <milan_djokic@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1764961645.git.milan_djokic@epam.com>
 <99f899addf349543eaaaa328596dd9bf90004214.1764961645.git.milan_djokic@epam.com>
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
In-Reply-To: <99f899addf349543eaaaa328596dd9bf90004214.1764961645.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2025 21:36, Milan Djokic wrote:
> Return -EOPNOTSUPP when XEN_DOMCTL_set_access_required command is invoked
> while VM events and monitoring support is disabled.

This is more bounded than the pretty wide subject. Taking the subject and
considering there are other VM_EVENT related domctl-s, is this one really
the only one in need of adjustment?

> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -787,19 +787,22 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>              copyback = true;
>          break;
>  
> -#ifdef CONFIG_VM_EVENT
>      case XEN_DOMCTL_set_access_required:
> -        if ( unlikely(current->domain == d) ) /* no domain_pause() */
> -            ret = -EPERM;
> +        if ( !IS_ENABLED(CONFIG_VM_EVENT) )
> +            ret = -EOPNOTSUPP;
>          else

If you convert this to

        else if ( unlikely(current->domain == d) ) /* no domain_pause() */

then ...

>          {
> -            domain_pause(d);
> -            arch_p2m_set_access_required(d,
> -                op->u.access_required.access_required);
> -            domain_unpause(d);
> +            if ( unlikely(current->domain == d) ) /* no domain_pause() */
> +                ret = -EPERM;
> +            else
> +            {
> +                domain_pause(d);
> +                arch_p2m_set_access_required(d,
> +                    op->u.access_required.access_required);
> +                domain_unpause(d);
> +            }

... the need for re-indenting disappears, and we get away with less churn.

Jan


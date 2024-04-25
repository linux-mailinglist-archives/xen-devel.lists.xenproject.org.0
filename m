Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD7D8B1AD3
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 08:19:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711816.1112065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzsSJ-0006XP-7X; Thu, 25 Apr 2024 06:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711816.1112065; Thu, 25 Apr 2024 06:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzsSJ-0006Uc-4p; Thu, 25 Apr 2024 06:19:39 +0000
Received: by outflank-mailman (input) for mailman id 711816;
 Thu, 25 Apr 2024 06:19:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzsSH-0006UW-6H
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 06:19:37 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9eab04f-02cb-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 08:19:36 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41b34d344a0so4852445e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 23:19:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m18-20020adff392000000b00345920fcb45sm19029630wro.13.2024.04.24.23.19.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 23:19:35 -0700 (PDT)
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
X-Inumbo-ID: c9eab04f-02cb-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714025975; x=1714630775; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e3nAqYeDVFKI0t7PnEHk8avdhUXTXHxgSFZ6HEc/SMQ=;
        b=Wo008Hoe46L/DPpKSAsYK97XgCsh8zkYieNsnnpZYZEOmR8onPN7/sXdVuGigW69Jn
         G/+cz/EsTKlwT8443988i8WIkT4JHFMh7H1Ns1ITV4aiXwiwIev9No0uUuRk/BDRxId8
         Xz2bMHcWWTFNyyXL4LER+4kEEydVJWCFCvqdVlbzeIhlkSf6iubv/Fw2w4x3lY/4l5Sb
         3qZqP6JDlAroUQ7EOKmRfo7mnSZtOwF2gzM5G9H4Pwuo/cICflG98/tIw114oJw/AyTB
         jWJSNQymFN7JfK1ymsR80eB6drXwWZ3AE4ZkrUKR1hNglE9x7DY3vEyUjnNBDGfcdRVS
         gepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714025975; x=1714630775;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e3nAqYeDVFKI0t7PnEHk8avdhUXTXHxgSFZ6HEc/SMQ=;
        b=N6t49xMearudXC9OBELojCe8sLUqQ+4TdnvaYNgm18Z/H8NDZHqfAjEJrTEzTl8r/p
         COR4I3/J0VqrrLimYHnEFyFkTgn3J8PjoylfFvMcgDVFa0LaUTcVKOzJttbKCPyNCzxj
         11+FXGbKytp6j+Yfe4Oy6ysq66s+Hbiqr0AXzfPloDigafpsJgG3+IWEwCsKEbMlD2/9
         rxv5iIMRiFxSqVyXzWf4XmVgxB9bNea0t8+3GBCcZmTSW03bvutDwOKJwaWlIksD+j22
         q5jM6PLTNGJgwEokFZ6+raiJejeapVs6BRh0px1eEbuLQqybGfIqEyaUCSBjj71NDSmo
         ZvAg==
X-Forwarded-Encrypted: i=1; AJvYcCU2vsFEVopod4ku0rATkBxVGjzd8c09pJp40ycuZXcrWREpGf5pTqswexWzK0+sm3p8liJdYlvfSRaG3qoj8h1g45slWf+eOW0PA+zjWRw=
X-Gm-Message-State: AOJu0YzfK7tKWeM3oeKDBD52sW66wZbNrt/95DmBkZbImRX3NDgusrPm
	oczFgL2i/ljkIMm4oNd7zvWmelDr1wR3Gnrio5Azx2ipmnxRXj75v3C0LkevXg==
X-Google-Smtp-Source: AGHT+IEC8ipGlaB31xfBsmMVSoxaoyevHYXxo8bVz5R2UrjOATeduBqzB5TycthptVFW29eb5G1VXQ==
X-Received: by 2002:a05:600c:3515:b0:418:ef65:4b0e with SMTP id h21-20020a05600c351500b00418ef654b0emr3036150wmq.17.1714025975679;
        Wed, 24 Apr 2024 23:19:35 -0700 (PDT)
Message-ID: <9bb611ac-1187-4daa-9649-53afeeb11695@suse.com>
Date: Thu, 25 Apr 2024 08:19:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] tools/xl: Add max_altp2m parameter
Content-Language: en-US
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1713990376.git.w1benny@gmail.com>
 <67b5dd52435132d0fb65e7b301970e17e092fa87.1713990376.git.w1benny@gmail.com>
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
In-Reply-To: <67b5dd52435132d0fb65e7b301970e17e092fa87.1713990376.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.04.2024 22:42, Petr Beneš wrote:
> Introduce a new max_altp2m parameter to control the maximum number of altp2m
> views a domain can use. By default, if max_altp2m is unspecified and altp2m is
> enabled, the value is set to 10, reflecting the legacy behavior.

Apart from the public header you don't even touch hypervisor code here. What
you say above therefore is limited in scope to the tool stack. I question
though that adding a new field without respecting it constitutes an overall
consistent change. In particular I'm curious how you mean to deal with this
for other than x86, where altp2m as a concept doesn't exist (yet).

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -77,6 +77,7 @@ struct xen_domctl_createdomain {
>       */
>      uint32_t max_vcpus;
>      uint32_t max_evtchn_port;
> +    uint32_t max_altp2m;
>      int32_t max_grant_frames;
>      int32_t max_maptrack_frames;

Such a struct layout change needs to be accompanied by an interface version
bump (which hasn't happened so far in this release cycle, afaics).

Jan


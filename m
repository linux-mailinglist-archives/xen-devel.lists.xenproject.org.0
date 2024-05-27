Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D388D0589
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 17:12:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730835.1136073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBc16-000291-0p; Mon, 27 May 2024 15:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730835.1136073; Mon, 27 May 2024 15:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBc15-00027A-UO; Mon, 27 May 2024 15:12:03 +0000
Received: by outflank-mailman (input) for mailman id 730835;
 Mon, 27 May 2024 15:12:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O60l=M6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBc15-00026J-6Y
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 15:12:03 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 783bf1c7-1c3b-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 17:12:01 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2e95a74d51fso52518141fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 08:12:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-579c2026406sm3047825a12.37.2024.05.27.08.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 08:12:00 -0700 (PDT)
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
X-Inumbo-ID: 783bf1c7-1c3b-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716822721; x=1717427521; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LYVU3Lt0wdYOJAEy0vlDaUBkPVEZk/L21I2tclE2jO8=;
        b=flG5S/HjscMcrgSuVhGZqauL3feNaTcxgAtlHMfCDEyJ6C1ERJ6ZSyYna45fIM7j8r
         6CDG+6q7bpiKjDZ2uZJfq0MxyWZaxR8cgzu6xYrbwBdvqDVpdSpDfetbz0j+BFq0L93U
         lbQy9wR9PPZepXlJGI4letSU0NBjTAfySo/YjLa8LrDmZcHLhAogQPs7XxL2Zz4Z0zFL
         iM0PGxTzqsiEtiBnNxGxAc0ry+Y8zUU6HjpF+iHOOeHrK/cI8kuAOyz+nwTbC8jcZVaL
         n9MPuMXVA9eBk/36wSYzWMIi1C33H0XxoEcEIUuguGjlx4DlP2llutTjn4mZb7d14s5B
         haqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716822721; x=1717427521;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LYVU3Lt0wdYOJAEy0vlDaUBkPVEZk/L21I2tclE2jO8=;
        b=pDgJrJBvS4bK5fl+SuFpk7C4g26JC4JA3VVHlXLatVJMnseeQpbwEbrhhswtk96gU2
         ordMBAvD9nHtx85KHNSPwsjy8rYMpuvi/+wZjYDbd+t7/kN0PLRKodQaPKzMFsxjsSb8
         OIC99GFj4L7XcKp3Dz15XhXr1T/yJvvtcuwEYNcEKUnq55WWjALyCPv4thiBs6ffviQ1
         6HtZw7cmaAPzVEsBkqazZHQWTvt/n0QdfbuGcB+zKd2gtkkgx4Fz7vNsVKQoOz8lUJu6
         hhQFDAaRCMxPKa5A0LrZV0zFOEKKOnTzeJWp9/fdmPVkTY2S3K21blzM3aN7VVHgIltg
         Dbpg==
X-Forwarded-Encrypted: i=1; AJvYcCXC9a0j4FsF7gxbbLoMN73U/hjjN07hkl9ajDvATSzuzDuWQvUgx6/w8q5dBoFBuAwTPueKVuh80zxwL7uyX1fH7qrqCCNaq1jhS4Es7Tw=
X-Gm-Message-State: AOJu0YxB5Kzr7tYscBKfHNZpsOYpOStyZ1nswH3BR/kW1gNo3rP71dv9
	E7ZhDfjVxszqspN1kmtdSQiPCGSv9cJqUE6QOSbYAXlyKsGXEBn0TW434w4oSA==
X-Google-Smtp-Source: AGHT+IEpMcRLYjqAJagDX3kfhhlSZrUOaZImRArzaE/Yq/y8UWXivhWf48ZgZA75BI2JVseVYBNY8g==
X-Received: by 2002:a2e:9e04:0:b0:2d8:5fe6:820d with SMTP id 38308e7fff4ca-2e95b0411c8mr76249161fa.11.1716822721194;
        Mon, 27 May 2024 08:12:01 -0700 (PDT)
Message-ID: <a1e65a79-d8a4-4b8a-ad4d-a18544389e5a@suse.com>
Date: Mon, 27 May 2024 17:12:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Code freeze date for Xen 4.19 is 31.05.2024
Content-Language: en-US
To: "Oleksii K." <oleksii.kurochko@gmail.com>
Cc: committers@xenproject.org, community.manager@xenproject.org,
 Kelly Choi <kelly.choi@cloud.com>, xen-devel@lists.xenproject.org
References: <6a4323b46dd3dbb170c48fa24e78a23fa030b2a2.camel@gmail.com>
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
In-Reply-To: <6a4323b46dd3dbb170c48fa24e78a23fa030b2a2.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2024 15:58, Oleksii K. wrote:
> I would like to remind you that the code freeze date for Xen 4.19 is
> May 31, 2024.

I may be confused: With feature freeze having been last Friday aiui, isn't
this a little too short a period? I was actually expecting a longer-than-
normal one to account for the Xen Summit week.

Jan

> I'm okay with bug fixes being committed without my release ack (just CC
> me), except in cases where a one of maintainers gives a strong NACK.
> 
> Have a nice week!
> 
> Best regards,
> Oleksii



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0B4964780
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 16:04:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785907.1195435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjfkd-0005S3-Ly; Thu, 29 Aug 2024 14:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785907.1195435; Thu, 29 Aug 2024 14:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjfkd-0005Px-J3; Thu, 29 Aug 2024 14:03:51 +0000
Received: by outflank-mailman (input) for mailman id 785907;
 Thu, 29 Aug 2024 14:03:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjfkc-0005Pr-1m
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 14:03:50 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 824bfaf1-660f-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 16:03:46 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5bec4fc82b0so3124542a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 07:03:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ccff4bsm748439a12.70.2024.08.29.07.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 07:03:45 -0700 (PDT)
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
X-Inumbo-ID: 824bfaf1-660f-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724940226; x=1725545026; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rW+ItIsfoHzQDBbyvLOPy9LlX7H+e9rA+BLsO5BJ9fI=;
        b=c1rahDGbO45itSDYNB0UgRzFdfgoM1lQLJQIX7I6uNBvqtc22GXmGgu+ss1ouMZ26T
         o6Mnsnfj/vkCulspwftHv63rAHbH2X0pw/eVzGLC5+9CXUNByqB9IAVH/2qr93jviNJi
         OPB9aQkOOfkuv3jCdR8/uqmlJtiDMrx4/Asah0oC4XGKWmPc46po5aV6m8hknZasqgY/
         dMNtS8lv/B4HGX2lG6CwwxdwDpj+I7TUxeayZEbM/5UIH804uSjLH3CO83WxfHQ1AIY8
         riYidd8GsikAy2JVah3FPVcbV4dO78z+5l09bKY7OnxAn1R3jrRnKKxfRJ/Z81Z93jJh
         oQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724940226; x=1725545026;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rW+ItIsfoHzQDBbyvLOPy9LlX7H+e9rA+BLsO5BJ9fI=;
        b=F0cfXKMhYFHhA13geQJT7h262/s986G/C37FmJ2BHXkhvNlpOu2+ytpGFD8nzSo4ac
         CqcvE8VqCrN83PGtK1YX9DNI9Piemz2B05J5RCbZqwQal84ZYkC+zkVfWm3G8qRPSsrR
         x8lf/4G1vUqpE46aN8mRkPVaM4pLqoWw7rF+VVs2B1XroMWFmWf8J4IiEIlGjU1HWNbA
         V7vhAmzCQf+YZn1FCCe7G/5qvEYxZ6X/6K7QEIYuUvnXYCGpZ5ZUsB6N6kvhuKfFP1pL
         F3t8aJa4YmO1wbFEOunxmVCx5+teJ+AgRaZbRhWzixWHvlWk5jNbQicH6LKzChNkEND1
         I+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUnP+SPl+8KLbML+y2j/3XN3LvWpkY1TKGX2qxHycbBXTlfYW5pxUyYMJ58EJOx2u4xatfAxWXSHu0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxO/HPfSQEy7Eqozg+qKPoc2lQ5MCWC87556s1vYXmdyZFTF3MW
	DWmu1LFoJOKF1HX/z2khmeT4v53a2MUkddlsqXpxKP1WOuTObZyU4J6unsLUfg==
X-Google-Smtp-Source: AGHT+IGEhQK9uq+7i8QUWkK2DQ3yKr0YMtQKW3oLSslyGa/hr2SPpNQJhga3GbqnAY79lQuDQB+YXQ==
X-Received: by 2002:a05:6402:3506:b0:5c0:a8b8:dd6b with SMTP id 4fb4d7f45d1cf-5c22018ad3dmr4167837a12.14.1724940225952;
        Thu, 29 Aug 2024 07:03:45 -0700 (PDT)
Message-ID: <4381179f-bcca-4bd4-8dcf-8de79b79c405@suse.com>
Date: Thu, 29 Aug 2024 16:03:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] xen/compiler: Rename __attribute_const__ to
 attr_const
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
 <20240828220351.2686408-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240828220351.2686408-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2024 00:03, Andrew Cooper wrote:
> There's no need for the name to be so verbose.
> 
> No functional change.
> 
> Suggest-by: Jan Beulich <JBeulich@suse.com>

The form you use here was your suggestion, wasn't it? I'm fine with the
change as is, so ...

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Yet I still would have liked the more generic

#define attr(attr...) __attribute__((attr))

better.

Jan



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD4E9643A6
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 13:58:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785708.1195184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjdn3-0007GA-0K; Thu, 29 Aug 2024 11:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785708.1195184; Thu, 29 Aug 2024 11:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjdn2-0007Dl-Tu; Thu, 29 Aug 2024 11:58:12 +0000
Received: by outflank-mailman (input) for mailman id 785708;
 Thu, 29 Aug 2024 11:58:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjdn1-0007Df-6J
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 11:58:11 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4ef90e1-65fd-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 13:58:08 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a86883231b4so56009366b.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 04:58:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c7c1f7sm630681a12.42.2024.08.29.04.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 04:58:07 -0700 (PDT)
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
X-Inumbo-ID: f4ef90e1-65fd-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724932688; x=1725537488; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:cc:content-language:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U73BlY8BZ1Tl7XPL6jzB21vtHemVJgsSYu0GdyUNSiw=;
        b=KCkgE2WBXkISxWStzQ6fh9n7sUjjH59uWc8Swbuu2JJ32z2NUjcE8kz+uad/6Z9JWI
         60f7azKCzSEXNhNcxar4nu8lEzGjnkxLB3mvFqukYjhzKSFkbAG/SP78bXOCrF9SVS6Q
         0LAvJVrjdacfbDlcjdZY+pJfIaDocb+vkc8K6khGUZdch1+hTJbgcWv9wB8qo4wiADFk
         m8uNW9g+Pvu9WTM2E9RWTXBNx2x/KaIp4/6TWMrcZuvPhDYLgvVLDCDwvTwoCzWf6RZa
         gnvmbcWSUb8eVx5d7SkpaDEWbrKff8OsarADTiJtWH7uBkeJ9QurdPXQeFSSofq4Kj+y
         fLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724932688; x=1725537488;
        h=content-transfer-encoding:autocrypt:cc:content-language:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U73BlY8BZ1Tl7XPL6jzB21vtHemVJgsSYu0GdyUNSiw=;
        b=hkPnF+MXmf2Q/E/EYi+/0C2fONpKut5hUsc03WHy5zgGu0ZHKsX4jn6KwAdDivWtbT
         Wu863tpKqDI0Rn7yCzCLyjzIeGFUk/46UlfG7AzI7M0X1Yw7CSnKcXXSVS3lV7ZC3HBD
         Dcl91c77Ta8mWbBO5fUerT0kux81tVRKYmXYGnd1wtOsajs8nmMy/unBEtg3x5rb/SNn
         U/HZGYx5NuYru+ZEjzAQ5Y253z2qQpIqmOe0j+bjZ7VQyf/DhMZiC4GDaMZ/6P4cMHIC
         E6SDe2GBLu61yGhgU5QJRsFClhPIUNlmGUSpDkNUQ5q6owArtp7eM0rcYqjBKr61BztZ
         3P5A==
X-Gm-Message-State: AOJu0Yw0FHspaQzX11TpQMM3GJjfjcscmHv/nylLRl6Ts/ViEfBU4cjG
	I7tWvK1q6cW66vUBp+hm8yOblGSr8X/W+wZ9F/4bixup33IaXr5slLLdilfmSXglj54CNI2hRyc
	=
X-Google-Smtp-Source: AGHT+IHZMyYeEhxFLZ3xo9k/SsaTxSVKBJ6SemnMYWkpfh0Q2nv0IYEDbJjz77JjrPQxOKhj3v6pYA==
X-Received: by 2002:a17:907:6d1a:b0:a86:821e:8a28 with SMTP id a640c23a62f3a-a897fa6d0admr197926066b.54.1724932687781;
        Thu, 29 Aug 2024 04:58:07 -0700 (PDT)
Message-ID: <b1ded557-63b8-4999-98ca-de80488ebad1@suse.com>
Date: Thu, 29 Aug 2024 13:58:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/5] types: (mostly) purge Linux-inherited s{8,16,32,64}
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Replace uses except where linux-compat.h, where they're moved to, is
sensible to #include.

1: x86: drop s<N>/u<N> overrides from mkelf32
2: types: replace remaining uses of s8
3: types: replace remaining uses of s16
4: types: replace remaining uses of s32
5: types: replace remaining uses of s64

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D73548513D4
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 13:53:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679566.1057036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZVn7-0002lH-3N; Mon, 12 Feb 2024 12:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679566.1057036; Mon, 12 Feb 2024 12:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZVn7-0002j7-01; Mon, 12 Feb 2024 12:52:09 +0000
Received: by outflank-mailman (input) for mailman id 679566;
 Mon, 12 Feb 2024 12:52:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZVn5-0002iz-IN
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 12:52:07 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8677e6ad-c9a5-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 13:52:05 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d1025717c7so2046211fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 04:52:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v9-20020a5d4b09000000b0033b843786e1sm1973101wrq.51.2024.02.12.04.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 04:52:05 -0800 (PST)
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
X-Inumbo-ID: 8677e6ad-c9a5-11ee-8a4c-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707742325; x=1708347125; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdemOTI8r+uOmKiumhE3Wv6qyJwPjzda+1Srtk+j2xg=;
        b=ZtkZdYOCnQQEAXxiLG5SMyogv8JUg5QfA39THFUayEVgfzJNICjoUQOXPvdTdEMgYy
         FHvQqWzPd0DII9lfW5DNNhPDBz8duOsMmCX2qt6piskZh6b04pjkK2GpLmuzotGVy7i7
         DSkWPEVynQalk9AIHS4kZmvgkALEU/wOUKs7cE1C/PYQjN8iMZxSv52ovPMGpGz2ljOh
         vl6b2cBZV1fFyq1OqkD/7sUMUebySuI2YIYaaQGA16NpKKDPL/F0NGruxr6rjbw0QgXd
         iZ0fOO7EY6Xt8fWpVgPwGxoAmZA+JLSUe8PokwzC9UMYE1KaxRsLmLiI2YQ6DKAwxqpe
         7svA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707742325; x=1708347125;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KdemOTI8r+uOmKiumhE3Wv6qyJwPjzda+1Srtk+j2xg=;
        b=ajNlW7d+mrdxvXt9fJfEWlL6SEDkDq6FnQWVl1gy/yoNDyjkZ/xVQIydKZRDLfF9UA
         G8csr97M1EvJoanH9CaOKQJ0x/VmwZiXIZdcqYMly6iEc8Efz9BaA0FO88BpdQ9aXL2v
         con2O1R+I3OOqC7ere9FJ7N36gDrz4dLRtpTFoarLQY6c9PGj6lzLMYa7vg7WzwOuJUI
         8vulhNm3a0FyPSEeYGmB+HpCDeq1Z6FKbadMOek+WUK0X+IooFcelHXba0wmNb4fN2j1
         tBXvKUqin0f8hX3LRYJ7cZP97HVGlXTJ6WpkGv0/U7sAP0I9n0NwVkQOjqWQZ6YOvOsO
         BiTw==
X-Gm-Message-State: AOJu0YyoT1WDmuk+5OYqAAnh04pqnsQp45JydG0VBPGq4qjCYWYa54mp
	0e7FigDWe7UVNiff+hRNEABh3Rbkb1Q6/hkDdiVpwU1Rwzn17ELZ37783tY9fGGxehi/KpDh0s0
	=
X-Google-Smtp-Source: AGHT+IFW7C85nRhY8exNhc3hIB82Hp6Jo83BehuiwxeViGO2OPfqCk2CwZT7oQszZPAN6eoEbEZB3Q==
X-Received: by 2002:a2e:920f:0:b0:2d0:f934:999d with SMTP id k15-20020a2e920f000000b002d0f934999dmr1628832ljg.5.1707742325407;
        Mon, 12 Feb 2024 04:52:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX1MsEDLrSLU2Js6B3IzV2Tvc07XWA1blvk8dDcLcxRkHiCMwCs5xCcSx9383bqdpXwFx0L5xr8C8fp/8hSwR3iWkcBmPQBgS4h8blVw5UXpg==
Message-ID: <4c4ff91e-ce66-428f-a360-6ffc55659e79@suse.com>
Date: Mon, 12 Feb 2024 13:52:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86: cpu_data[] populating / consuming
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

Kind of fallout from looking through the AP bringup acceleration series.

1: CPU: re-work populating of cpu_data[]
2: MCE: adjust x86_mc_get_cpu_info()

Jan


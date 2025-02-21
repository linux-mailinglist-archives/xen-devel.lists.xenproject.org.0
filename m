Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8EEA3EECE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 09:37:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894322.1303042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlOW0-00047h-1c; Fri, 21 Feb 2025 08:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894322.1303042; Fri, 21 Feb 2025 08:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlOVz-00046A-TJ; Fri, 21 Feb 2025 08:36:07 +0000
Received: by outflank-mailman (input) for mailman id 894322;
 Fri, 21 Feb 2025 08:36:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tlOVy-000462-CZ
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 08:36:06 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0e549e8-f02e-11ef-9896-31a8f345e629;
 Fri, 21 Feb 2025 09:36:03 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5debbced002so3420015a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2025 00:36:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece2880e1sm13262157a12.76.2025.02.21.00.35.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2025 00:35:59 -0800 (PST)
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
X-Inumbo-ID: e0e549e8-f02e-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740126960; x=1740731760; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kMrXNW8HxQBUMeJzkvoTSkC+YfC+XrODqs3MmBkblPw=;
        b=KuVvG+hTpq911Romm0b/PrniVGgs1OPpbZxrFPXYKnKSPEBnXY+lXx6LK5iCpRiU96
         nXx3/bgrXJyVst6Gm943ASlyoWhkXmMwGyldEZswE2sUq9xvuwEXA+xtDleur3K9beJ+
         9uKFgQwOXubUK43ICEKJE38h6jCs154HE9p+sqMnWV50IC7UYiOdLhQhkUeE30W8J4uP
         cdvSbTekzKOhT4kC+aHiPbdAeyqLujYKU+3sQ3KB8K7QSD60/MOxoYw7jEamaDtzVouh
         IMCsfTB0WxXbubBm64gtWTUnAGHkd3EfipiGniA77aUXi/WwjmdEXZdOzaT4/UdNeVth
         QoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740126960; x=1740731760;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMrXNW8HxQBUMeJzkvoTSkC+YfC+XrODqs3MmBkblPw=;
        b=QFxaaucLniBM9VDyAWigB3f2uBYMPwoHg4cOL6kaarwxWVawi3xOlw0w31/UfQI8o1
         AcQY+vkEs56sHx8YmghJGtcg+VnOjFI+ZvfhC5DvUJKxlKPKm17ZOep0GYBqLGdXahdc
         u4hGHahKCv1WcblAoYjLFdoWzzINjCaLafuCg+xItw5mYEfu8WaZeFYm8z+JkjMroq99
         edFEVXLBqPGgHIkk4Oj4+QCfSFRxLVGoVnsSOX8fxl/BItIHh8+rPi7jg8BVjXutjpOT
         mmh6GT2fZy9rqs8i2BoERmwf0Qa5Rl30roUtpmwjRQ3UVD+DWB+fJ79dnuq/2USeRkRh
         SLLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhrg8rXCCgoG+xIlnoV8rLT7n9dyCQd6U3DU/Hj6WdHZmwwHadtaKzx91r8dHN1l3ZQOx0PhoyAGc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPFpCkb+fdeSgyvkr1oWZhvn67c0ND8AhD7gDctOyAjXQ01nLc
	qDd4TkimNd8ZrImpqske9ZNHA1MXJIsuKdwRWiKTyIHVFsgfykfO269k0nwjvQ==
X-Gm-Gg: ASbGncvDDkVoRKiz8iVPNMABTsA8/JLVacvzVRyo67rO9Mx+XzpLJKe5NdiE4yoS0bI
	J6hKgQ9ilTOApj+qmXTKwEV4CTC+ZMGczXp1k5b1CNeW6j2Tp5q5pic8uRyMXlgZ1lNIiELxmSg
	lC4h9lNvOVfIHPm5nnq82/TfFleXtmcUnSlHnARqM54jTI8UKNZ5QBPvwuDa893fzkJ8cnVo7nZ
	8+q/1p2bd5ygJZ73ni4T7PJBy6ScLwikTqbISokyyyYQ+HPdFwgeI97qqa5UiN39UKn2FjEE7yq
	9zvJAQc3r+CLdPldUlOAS7c0ZGoaGS6AXkcMzBNx/oK4CsGNmJOPRo4UT3lEe06HvePyv/JKDAF
	BJ82LwYgu1zI=
X-Google-Smtp-Source: AGHT+IFomF/OlsGomfWEuJSF+rbEHy0IspXPgZJ3260Nk1IibMFUk+75nfgbltB+cOWKDPy31htG+w==
X-Received: by 2002:a05:6402:524b:b0:5de:50b4:b71f with SMTP id 4fb4d7f45d1cf-5e0a12baa86mr5118019a12.12.1740126960034;
        Fri, 21 Feb 2025 00:36:00 -0800 (PST)
Message-ID: <d2a9d3f1-0584-4c9c-95c5-5babf0ffde06@suse.com>
Date: Fri, 21 Feb 2025 09:35:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v7 1/4] automation: drop debian:11-riscv64
 container
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1740071755.git.oleksii.kurochko@gmail.com>
 <659bd8c00e79be1a47fc2aae75accd69b3bedaf4.1740071755.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <659bd8c00e79be1a47fc2aae75accd69b3bedaf4.1740071755.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.02.2025 18:44, Oleksii Kurochko wrote:
> There are two reasons for that:
> 1. In the README, GCC baseline is chosen to be 12.2, whereas Debian 11
>    uses GCC 10.2.1.

Which README is this? Not the one at the root of the tree, afaics, which
continues to mention only x86 and Arm.

Jan


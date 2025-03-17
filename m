Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36123A6535E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 15:28:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917024.1322025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBRl-0004MF-SC; Mon, 17 Mar 2025 14:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917024.1322025; Mon, 17 Mar 2025 14:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBRl-0004JN-PJ; Mon, 17 Mar 2025 14:28:05 +0000
Received: by outflank-mailman (input) for mailman id 917024;
 Mon, 17 Mar 2025 14:28:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuBRk-0004JH-B8
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 14:28:04 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 091432b2-033c-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 15:28:03 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so4443218f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 07:28:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb40fa30sm15291697f8f.68.2025.03.17.07.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 07:28:02 -0700 (PDT)
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
X-Inumbo-ID: 091432b2-033c-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742221683; x=1742826483; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FYdDW5jSfYx+xj9nsz8mqNBnwgpXKwb/NGczNDARr/A=;
        b=TiX0zYaxhOTPekxsE4yfrJaPzYtD9OiA5PhejhEjZsdAADyaUBRQQSZIhs5YBjfB77
         iLIfG9L/q+BYiRXeeQIUftnCRKuR1W/dAJMslbaL/oPfcwQT7RnnyVg8NVBgQGLrZwoK
         4YRQr+2lg0Ft03kcvHejApphk2iNijIj+6Myq+gvnld3O3YXaT+ebVpFhKLZ8dV7JfKh
         2B7bYmaaomEdbTCXGg78vQGKl/4HtuQcbFmGDZwKBiJ/NiDCFhfjsZo/bXhk1rDQNkgc
         5J+M2zIgqDpWj8gHtSHDveNATNvjv4LpTvsJgRrukQ4GEbm0i5oobZv06dEjTTcieWAO
         vKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742221683; x=1742826483;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYdDW5jSfYx+xj9nsz8mqNBnwgpXKwb/NGczNDARr/A=;
        b=IVRFqpp0r+nCTAK3o1MUSVme9etdM6Hq03JnF83mrD6aHorD24viSxnLBFhqsyxQTP
         Mm1BOQhCg6dPRwgcJsTn5XIXl6RaJtQwfZTDkd3fiGcj2vWl97JfG8UfIl4Kh/DkHmSB
         ll/idCvZzhLunEVJDc8pizLlO6CdWCjL7sjnI71tVNZefxQBWtV6dAw5ThzE5U4EarPA
         JtpM7h0vcdr5XGlhWXFS22Fh7znrHu0CFWnmbU+bNNgd3pYeKCcNfdtD2V3LoP/ZnuVc
         MqH+qw6it2RU1hQ9l1OmmiK/77qDGv1tp24jWLUKmfBO6l7LjJ3j0CMVKfGM/nWjQHHh
         3hrg==
X-Forwarded-Encrypted: i=1; AJvYcCXGNeZK+MYY/SCYxKnJIVyVNboxhvtbjYAh0WRYOvxkrhHvS7thgR3gZr4GHVX9yk/Eeei7f8FKn+w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxz/l6gsZTQ09gRNHsJScnu4YdZ4tpLaJDhucfh4F2nVLTHC9I5
	brQxr8KqoBcjigDNE6tO+ku3ndyInLeJkf8Vm8YUnKtzdDtX6TZPTp9hpWGwsA==
X-Gm-Gg: ASbGncvaX8ABXBq3wU/cKzBATyslY7uQgeGcYnu0nYQRp0gtukZdDN/9ZYshDODiyap
	6hVk8a+WkswNjAHnP2fxXFTHhcSRJ6+ge2R3EsGNNkBmD87F6WYGgfkmtng7ZmTew/vIpSXoHpg
	WKgN8YM5ia5lzHBmivzgucCbaNXVFXPZ9siHeVglgdbusFSP7yt9tFN8xTppBk+MhNuSIYZj+xg
	zebFqj13nfGmjRZUSz3oqsBZ153CSdCk7Nb4GEQi1n1jy9NdoNOe0PT2lKHpwQ4fQ+t0HwE/2cl
	f7r5WR8eYCaRLsa5bCpBx7kcQPeOBIkMJ2dpJvVDEJLv82o0RduZX6OdgcU8GvjYIQ+gQIPG3e9
	UaDduVbJQWQyHlATXpHSLw0spVH3vfw==
X-Google-Smtp-Source: AGHT+IE2rF3t4VgL3VSek4wTNsJ/iNLLrIRqUdD39ShTMut5X/AEg/5DIOhVhzcbndyDSrlCuci4XA==
X-Received: by 2002:a5d:588b:0:b0:391:1213:9475 with SMTP id ffacd0b85a97d-3971d8021e7mr13124238f8f.24.1742221682997;
        Mon, 17 Mar 2025 07:28:02 -0700 (PDT)
Message-ID: <66291536-a164-48a6-ab3e-304dc6035ed6@suse.com>
Date: Mon, 17 Mar 2025 15:28:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/23] xsm/dummy: Allow hwdom more - except targeting
 control
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-18-jason.andryuk@amd.com>
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
In-Reply-To: <20250306220343.203047-18-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 23:03, Jason Andryuk wrote:
> Allow hwdom all perms, except XSM_PRIV, and except commands where the
> target is the control domain.  This protects the control domain from
> hwdom while allowing the hardware domain to serve as the backend and
> device model for other domUs.

I can see why backends may need to live there. But device models don't
belong in the hardware domain, do they?

Jan


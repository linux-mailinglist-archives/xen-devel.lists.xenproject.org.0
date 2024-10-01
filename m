Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C31C498B76A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 10:48:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807822.1219490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svYXe-0004xL-Gp; Tue, 01 Oct 2024 08:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807822.1219490; Tue, 01 Oct 2024 08:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svYXe-0004ux-ED; Tue, 01 Oct 2024 08:47:34 +0000
Received: by outflank-mailman (input) for mailman id 807822;
 Tue, 01 Oct 2024 08:47:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svYXd-0004ur-9h
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 08:47:33 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc30df6a-7fd1-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 10:47:32 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c87ab540b3so7992714a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 01:47:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88248af7dsm5849487a12.78.2024.10.01.01.47.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 01:47:31 -0700 (PDT)
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
X-Inumbo-ID: cc30df6a-7fd1-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727772452; x=1728377252; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Yx3djm+KgRN0/wMPIxYFQPNTLNEWcKl1KUaoaIpX+h4=;
        b=EN92oQpLimCCemlGkSiOkIv4sKr8iz7mGf0S41/O18a70/f1dFYMT4IbDhpvxQz7/p
         KSWFROK/IWzpYdRnc3SVeERVTAVZupNL+9106Jyfvs/+yPrNSCB8eRYLAgwvmVZdbRnk
         wJxi/1J2xngNKU2PLfG+HDb0bVtNiKOUorSyfy5e+c7897O0IJWxq1dYC4g0dlYjxriI
         xXlQbHPBpQjyiViAVZvVeDX59KO3GqVWC5e4qSQbf05vVIGv4DtAlJwhOIxaevrRDZFj
         jEr+8jAq78guG5DwN/zO90QE+LhtnqN3FiM8HQx1+6LPt+OI0jNF3uW4Op0JPaHN5iL3
         S29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727772452; x=1728377252;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yx3djm+KgRN0/wMPIxYFQPNTLNEWcKl1KUaoaIpX+h4=;
        b=wZo+kXzbHe9F46ebPBmU+kTozwMmhx5DcNvBczPyf4zxrUzxDEx/VggngsIgR/PqzT
         /tKxvHxWYLRjkQ9jzfUpMUy6Fy6vRRLsvmPAQAM77m8CagBFtQ2WkIGXlh2rzpz8gF0g
         sbdbbR4IH1qJVxYSBdWR672eLiTBi3YE83WuVUptTZ5R4yF4ofu7u99bMPPyg4MA/Hhy
         miN07fFrLZTM+BBcxYzhpv9/LxBAG7aY+spfuTPAIhlyori/j5Tn+odWPUXwyNw4pvUp
         F8anR/TRrp/QTj40TiPtuRc1X306zGMYT/LqamRwEErXmxQyg4ChvtRs/7tRaXGv5ztV
         y9ew==
X-Gm-Message-State: AOJu0YxtvASXnsU18ZBJZIId5QH/rngb+4kcynQ1s61h/OAGKVCiZGF5
	bStZECSw0n1xMbEjyBFPEz2SSlQCugY7Sh3BiHs0zb5KnXn+7zNBiecwQ1D2eeUv70/giWEVKD8
	=
X-Google-Smtp-Source: AGHT+IHa6JVDOBiROhK2soMZLF/XMrCFTzZLC4qSw/x1Fk8FegmkGB4C12n1NOcZ2p1WQFEnvsegOQ==
X-Received: by 2002:a05:6402:50d3:b0:5c8:843c:7a74 with SMTP id 4fb4d7f45d1cf-5c8a2a558e3mr2460688a12.12.1727772451801;
        Tue, 01 Oct 2024 01:47:31 -0700 (PDT)
Message-ID: <3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.com>
Date: Tue, 1 Oct 2024 10:47:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/5] x86/HVM: emulation (MMIO) improvements
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Language: en-US
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

The main fix is patch 3, with the earlier patches setting the stage
and the latter ones simplifying other things at least a little in
exchange.

1: correct MMIO emulation cache bounds check
2: allocate emulation cache entries dynamically
3: correct read/write split at page boundaries
4: slightly improve CMPXCHG16B emulation
5: drop redundant access splitting

Jan


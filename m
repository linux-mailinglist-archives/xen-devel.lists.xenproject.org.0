Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 615EFA7340A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 15:13:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929396.1332043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txnzM-00028j-Oi; Thu, 27 Mar 2025 14:13:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929396.1332043; Thu, 27 Mar 2025 14:13:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txnzM-00027c-Jb; Thu, 27 Mar 2025 14:13:44 +0000
Received: by outflank-mailman (input) for mailman id 929396;
 Thu, 27 Mar 2025 14:13:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txnzL-000264-0G
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 14:13:43 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af2c131b-0b15-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 15:13:41 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso10275145e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 07:13:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d7ae65761sm43258195e9.0.2025.03.27.07.13.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 07:13:40 -0700 (PDT)
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
X-Inumbo-ID: af2c131b-0b15-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743084820; x=1743689620; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AJnpz9b93EIR7vUhKHXLmwH//MjhVoWv4ag+TbgribM=;
        b=FTAiup/E45IoMPs7FuYWjFZxhI6rVpVqqXtP5cvSwGvlk3yygvtsLc1l3+ZotXj1Fj
         7NN7e7y3/dtc/LX/WS/5PzrXG0bRQUeE5gOuqZAUdNJVmNEuIGDBVEIiD03VXmxuXvse
         MrO++NgHS7wStdYok9A5OZFQmKFxTq60RcUlARrofzH1WJ8BwyQwjrSC676QEAd+f89P
         Mp/dIN52WDsrzu8v/6CpQUh9+jZ0S2KoS0YRpO4pJwsS2exSRTb3erWije9QkVEtjmnz
         KVheyS7FJ6ooPK46/6Tm+nvAxGSnUinzhAIKtmSkg3sWGfa7l5t9F7g/IrfUrvn/wh/e
         ScdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743084820; x=1743689620;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AJnpz9b93EIR7vUhKHXLmwH//MjhVoWv4ag+TbgribM=;
        b=D4ulUzmKFjImaEzTwQYdEljr7Ymk7XwxwWFXcFY0gy5T/zd3c0JILJV4wDiD2vbsSd
         y3RRlZwanFQawLGDlquaKQI5bsGsGQCNlLaaDA8ZlFy4l5/gF+K2upQFIxsdZ5BpD9ID
         CmmjTDoZATutXHR00Cc3S7oBDAkcR1RHt9t+Kmm+mApgY5352eVf+gRwmZfICw5n6l+L
         h5Gw+twJK5UIJ/wwUgaVcuv83byWoekOzRapy6WhJPs5csIc9jDy8LuLKO3nhyHCnIVX
         +FEFvkm1sW2D9B4MuZzXsYUyiPk/73P2pgKbSAsmTSwGRf5SFvPkv1kIC9Ga6uiE/9Rj
         SVUA==
X-Gm-Message-State: AOJu0YwclE/Z7ityIiYwk0mvlJUGm1tP5M91Tep0PNhTyIulrf8lNecj
	yRwvtpDROCkAPiariyrrYkGWLC1NuK03gj465fWN+hbIcwpkCPYU2ikNky1wtU+Y0LVas6a9pxk
	=
X-Gm-Gg: ASbGnct7RoQYqHuP4Ow4p4SzyC+Dc+dI/yCjBa8CHv0myhALaAo3tmCxlGC0PSwBWST
	HCtesMI2xdgGBezlcY+3gsKmUMB6wH8VPPJRoPdCkcuv4w/1X/5SqEyhyYvnZI3H9hNK3sUZSXI
	KClgut+LKWkv41iFmN7hMW6/dPAiKoQLX8E/ETvn8s3x/u7uQUvMN7relpa6Hjb33NCOVmR+5bF
	/WMguBvtJf//xMvwOyI4dV0/gLzSgbRYHgR0G7vvIInCG0ZuEMDFofIa+Oi9pUMn+lnwjX6fIiC
	WDESWnGGnZiFdgKx9gzqzE989tgomjrzv24+xL71Hx1Yn6ddcabZ0KgPQIjRo48OJyd6s84mLf/
	V6lsEzpH7kGPGWLyVZ1ni3kdf08cnhQ==
X-Google-Smtp-Source: AGHT+IE5dcQFlG01IMLVZRYhqgmDPu55YmtYyYdRZPv0omkvGmYU2VBb0vUo13YmGxxYVpbey5Jjig==
X-Received: by 2002:a5d:6da6:0:b0:38c:3f12:64be with SMTP id ffacd0b85a97d-39ad17845ecmr3849802f8f.35.1743084820443;
        Thu, 27 Mar 2025 07:13:40 -0700 (PDT)
Message-ID: <7ac97714-7137-47bb-b109-3ec4c69fbeb0@suse.com>
Date: Thu, 27 Mar 2025 15:13:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: preparations for 4.19.2
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>
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

All,

the release is due in a little over a week. Please point out backports you find
missing from the respective staging branch, but which you consider relevant. I'm
already aware of

be7f0cc651d8	ARM/vgic: Fix out-of-bounds accesses in vgic_mmio_write_sgir()

and I'm further aware that there are a number of bug fixes in flight.

Advance notice: 4.18.5 ought to follow a few weeks later; I'd like to defer it a
little, so it can be the last full-support stable release from that branch
before moving into security-only state.

Jan


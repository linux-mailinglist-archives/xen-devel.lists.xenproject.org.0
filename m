Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B69B1AD3AD3
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 16:13:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010996.1389272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOzjV-0001YO-ND; Tue, 10 Jun 2025 14:13:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010996.1389272; Tue, 10 Jun 2025 14:13:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOzjV-0001Wx-Ip; Tue, 10 Jun 2025 14:13:45 +0000
Received: by outflank-mailman (input) for mailman id 1010996;
 Tue, 10 Jun 2025 14:13:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOzjT-0001Wr-UM
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 14:13:43 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c98c9dd-4605-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 16:13:41 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a36748920cso4915383f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 07:13:41 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-452730b9b33sm139323395e9.26.2025.06.10.07.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 07:13:40 -0700 (PDT)
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
X-Inumbo-ID: 1c98c9dd-4605-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749564821; x=1750169621; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ex71dpPcu4sL/ml67o9G9wtzTJivuEtkA3sX8sj4GSI=;
        b=VE/w2lcHTxGbm+lVf/Lq1sLDjzMw6EmOTX+Zw+wdXOkoaE0d1nFH7Wq7y/WIBojhy/
         6IVByPZWswcZouYuyzi3vkD2fskJOUJ0BhW4G5aeM6bRqJZu/OR5W5Pen7XOnItbXkdV
         /mz307atpo13inGarwmRW4YtUKf49tNY3xL6EJTccsfe3EtU8M6HwQFymSZ2Q66NCTCz
         05nOBDl91YuE1M9kofSAjC+63Z/W52hgikWy98gHCEH27s6Api02ZylREfEbsd6Q8OnA
         m2bl+4wpwD78c6udbMbQHtCjNkywouHP95hvD6Qt+kgJLuMefy8+IHmxNPZZbk0LLnEB
         GdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564821; x=1750169621;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ex71dpPcu4sL/ml67o9G9wtzTJivuEtkA3sX8sj4GSI=;
        b=oNh7VYWrJKCCXJ9gu9RFxAMFhP+J7OC5OHjY4Qod/5++NzZq1+S2uKAvyU+XLcTp87
         M86m9khhWhH6qPZzq77RFRTv7a8G4Ys2galSEKdEP5R/0Vz8aWqUC+aeTa3a/5BF4Wsf
         Aa1YdettUkUhjVJ5YITrlo0nzuRmKzbuarncEi3ZnC4nxTYstEbX3YAAcEz9BvEIet1W
         h8BdF7L8EIdSn7LlnhrRiizQ7E5OB/+9rb2smaKwpXq7grVFPju96KpM+PtdM38THfMY
         Cz7rhdHIJJapAqlLHB/OG6/gmqKmxoKAt8dDfPRiM7daxExt3lHE7M7U73WoMJZR75ZG
         Vhbg==
X-Gm-Message-State: AOJu0Yw2jRjMdcidF4pI7BGhmyLr5I5a2/uBMSumCMj7z5BOP9gL2ww4
	7PfnHuBCXftYBQMQKv+VNP5mahxhl5zXtgHkbmtiadhnOKCfi9nMCT0vD5J15NTjkQ==
X-Gm-Gg: ASbGncvOkghFNjJcSeIkuMC/SyXv65Ax+EJwLbF/Z0G0InCUlJFdO4+s96XSgYX2kJ5
	T8BrW/CAXCs9b4MqdeikgcSr8sez1KzhtdtUhvj0/JIwtzTifmOB/sOQYMMgKHOq+T5a7EBSgsR
	mR4j3DjfDoXLxVHgR6fC5VaTfmJxibYl2CFmzCUDfUKaJnTuS1xxaUf9a4Pdw6gfkAOJh9Sv8PD
	urto2itz+DugZAJhhvITWY/89YwQ1xQZzi+ad9C4HiO5S4JJPl7aFfwCVMG4P916TrJNGE4mYHq
	5GxkuqLiuqD/a0ip/2tAk/+Q1rGPCzQkMzOBus2VQ6XMGk+Y6AjR3gGuBRhdIC8PQlk+drLP4g1
	baAebJ+9Ytci+Cl+P/4xnU78dx3RY3XcCsWGx7qcRx+LdiIWh+GDmrtpKJS6o2PLpCO+EbZo7Ho
	Tx8IxJl1GaCxDFpPjtPS514ipFN0deVlM=
X-Google-Smtp-Source: AGHT+IFA0lm44U0Mn644kPczrGEb/nOMO0WF3Oouu8vXwPR6z1EvI/obSmYmIOMV4IAadzewMbXcyA==
X-Received: by 2002:a05:6000:40d9:b0:3a4:d4cd:b06 with SMTP id ffacd0b85a97d-3a5318a06b3mr13173184f8f.34.1749564821312;
        Tue, 10 Jun 2025 07:13:41 -0700 (PDT)
Message-ID: <3470dcc8-f08a-4a00-8760-b3564d78e638@suse.com>
Date: Tue, 10 Jun 2025 16:13:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/HVM: restrict use of pinned cache attributes as
 well as associated flushing
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <78b3ddeb-4317-4d54-ad52-9eb03bdf7942@suse.com>
 <aEa5J_TlSAdS9-m_@macbook.local>
 <6e9e84eb-f98b-4c06-8952-03aecc82c0ea@suse.com>
 <aEgMe1i4Rpmnz8M9@macbook.local>
 <5f8d694f-e712-4869-879f-80b2c4907a45@suse.com>
 <aEgyAaHxC-Um1pNj@macbook.local>
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
In-Reply-To: <aEgyAaHxC-Um1pNj@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.06.2025 15:24, Roger Pau Monné wrote:
> IMO the added complexity here is not worth the performance
> improvement, not without a clear justification that it's needed.

Well, okay, I'll simply consider the patch in this shape rejected then.
I don't see much value in wasting further time on it.

Jan


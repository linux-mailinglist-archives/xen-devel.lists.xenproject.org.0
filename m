Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CB792B0C8
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 09:05:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755886.1164395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR4uR-0003ms-I7; Tue, 09 Jul 2024 07:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755886.1164395; Tue, 09 Jul 2024 07:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR4uR-0003kU-F8; Tue, 09 Jul 2024 07:05:07 +0000
Received: by outflank-mailman (input) for mailman id 755886;
 Tue, 09 Jul 2024 07:05:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sR4uQ-0003kO-6B
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 07:05:06 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9034c246-3dc1-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 09:05:04 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ee90f56e31so44452541fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 00:05:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b43967825sm1051448b3a.122.2024.07.09.00.04.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 00:05:01 -0700 (PDT)
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
X-Inumbo-ID: 9034c246-3dc1-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720508702; x=1721113502; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OF3a5fkXI4TryZqIwH/uDhD1AmBG0NzXAQjzVka15W8=;
        b=NntFZryPSY208J0eBrukVhCwLXd2+4u1Op783bhpptSgDiWef72GIzakiCpwI/4BxG
         ZTz8b4hGMFzTcDGGz7Twq7y74emBTYRlt4oTYMqvA2f1ZzSOvBIig4QiJuRbuXXbs4hh
         zR6NndS9MAd3Gn0UHHdKZfr6dDpX+lZmstehnq8JtVMBKPBXN5SS5+yYkBv2PcBZ27cJ
         uW8xxc4t9y7PORUIMHKydVwiBSy2ABkMoa9K5whKhfSwU4wBlSNpkruAoJsD8owH547r
         qwDkHuBXRlpd5vDAr/oIvHXOyHUkc5mKWgRkYxCoa2ZT3yXasytCB90lWSKajl8tYPPv
         yP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720508702; x=1721113502;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OF3a5fkXI4TryZqIwH/uDhD1AmBG0NzXAQjzVka15W8=;
        b=P17ChsgJHis06MQKSiiNlWkj6e9S5QUKJ3WzXYPTGMxcQgzCeDdg46YU/D6/eI8IzW
         AqEGnys88oKM5jB/n36lXdO+lATo39Y7C4b+w69meW6VZ8WhQKn6IYhxu/PdysBE54EC
         +/Ohd4QRkSBaLhDdSO9ofMiSe1LtPTkBSjUrhAiuD3DDhR0a2LrB70DtPRTBIJiw1msR
         rssHKmb9IaQ/Cd8kZKhnOUMLNaTUgK//9SjJlRgt1swjeXjHVqlzXx/VDvIn7b6vzID2
         6JgUtV33TRfHEO/5LYBgTV8Iu7xMA3SMa1tYYQkPtktyJluAQtx9tN++ZoG7IoVMvw+g
         hEng==
X-Forwarded-Encrypted: i=1; AJvYcCV+u3WwRovwew+FxfwLC0DLLV1qOJ4Bpw6FMF/LLHNsT7VbjPe5ezRxuYRSrMqWsK4WJejqH+aS4qKByfjdmQyQUsSqWKgojd+LGaZNMs0=
X-Gm-Message-State: AOJu0YyxCd6bFttGOWEfhyXCJd7vHT3Op+PAjkLSYVBwQU03IPYoCRVY
	X4qhLhaQMOILHerNyBlYqIgS9sJHWzAa8kbrChGhNYwaUHgRCWt63NAwckG+2g==
X-Google-Smtp-Source: AGHT+IFdSjvf3VeMn8gc2QSWjvnoY4lre6K+SarS4nDFKStesnO7erGQ0TlLkAZ8ERA7jO9c7ONglA==
X-Received: by 2002:a05:6512:3d93:b0:52c:9413:d02f with SMTP id 2adb3069b0e04-52eb99971fbmr944753e87.17.1720508702378;
        Tue, 09 Jul 2024 00:05:02 -0700 (PDT)
Message-ID: <36dff4f7-797b-4a22-892c-b8961b810157@suse.com>
Date: Tue, 9 Jul 2024 09:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 03/14] x86/p2m: guard altp2m routines
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
 <c5c61affddf8eef9b0d3a67314ba5d09163531aa.1720501197.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <c5c61affddf8eef9b0d3a67314ba5d09163531aa.1720501197.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2024 07:50, Sergiy Kibrik wrote:
> Initialize and bring down altp2m only when it is supported by the platform,
> e.g. VMX. Also guard p2m_altp2m_propagate_change().
> The purpose of that is the possibility to disable altp2m support and exclude its
> code from the build completely, when it's not supported by the target platform.
> 
> Here hvm_altp2m_supported() is being used to check for ALTP2M availability,
> which is only defined if HVM enabled, so a stub for that routine added for
> !HVM configuration as well.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

As before:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


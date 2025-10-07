Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC1CBC1FC8
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 17:49:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139051.1474597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v69wM-0002yD-0K; Tue, 07 Oct 2025 15:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139051.1474597; Tue, 07 Oct 2025 15:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v69wL-0002v4-Ts; Tue, 07 Oct 2025 15:49:25 +0000
Received: by outflank-mailman (input) for mailman id 1139051;
 Tue, 07 Oct 2025 15:49:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v69wJ-0002e4-Tz
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 15:49:23 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 314abe3b-a395-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 17:49:22 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b3e9d633b78so2300966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 08:49:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6376b3b8df3sm12630735a12.13.2025.10.07.08.49.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 08:49:21 -0700 (PDT)
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
X-Inumbo-ID: 314abe3b-a395-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759852161; x=1760456961; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+xO66qWGqrlwwD5gw3Jvm6OyWUkL3kIRAe9KICwBgco=;
        b=f4NmYFE9n/NMpDn7s5+zhm+OAFTCs/JZdFKPGx5IwbIKKwrFJO9QbDC8TLbYG77YTb
         GVfM9qb+BgQLg/JYlMNccKv3Qpk3UAwDQ5njwkrBs0to82deXeHK9BAT4JsiimzH4NmE
         eZWKNfQ0AJi4eQPTYb50Fl5yrtrb+u1puUVw0PzGbNLI1bpNSv7fpc1uvRloPQgcyIdS
         tjJdbrzgtMsuc2vNHbzrmTLZFuccFb4nY+90oTBHuq7b5fadYABn8mW4l+x+dyYPlXSf
         3c24WYLKIS+/Lo47k2vs506EqEop/2xWQwYvUA+CQ95ObAchgs1MwWXmVpn9dA5r6Lx8
         IeGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759852161; x=1760456961;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xO66qWGqrlwwD5gw3Jvm6OyWUkL3kIRAe9KICwBgco=;
        b=nBK0p/l15PG40sG2RJojACAzO6FmWa1qZUb/2STrCcwEnvpi+w/lL343hoLhBXYPzv
         VIrGPQMWHG8ms/sQmC0UTHhzbSrRmVjhnE8Gp2YhsB+CNDf64Kklf1qwLOwAqmDnjPKu
         P7nY4T71I34UiZlJHzYKjp5DqItxYKwjwOcY5EnLlQhxTg3r6kLqJl0p6h3/j3dDC+5w
         4SqlJtamKSWfKUs7JsDRE+e3NAxZp292VIqGutTNKKzl7+HN1xGv/SbANXQqMFwVEKfr
         b4gIV26urXg7DrcP+e+GhuLxEvEcBvIkwi4uwOvpCFIUGuuMv6hniPDtRn2upPSrwMgX
         8sDw==
X-Forwarded-Encrypted: i=1; AJvYcCVZTOSQhzNIV6aRNX9V4LgsNqRA1dFK9fI4DBpL4QDb2buIzWgGHgyPvN0ihblELpUS1ha2l6ZoSzY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNp4akcKcdvlji5+S4giufMSTqoRg0BAXd+zqEcIwsUHjHMLdg
	3GyVUWXOBBaGK4gBRV92AHkdHSRWdQudFFOO2rKl01zNiTpL/yXOrbHF2stLIb817fVFGL5GbyX
	hIaY=
X-Gm-Gg: ASbGncu98Vlkq53JcThoT32hGSiMxQbuCoCG+dELB1JrYzob450tI/fx/pNFy3j12fe
	zA4zcoxoVvNNdNEcI8r4GSTaAVK5NklDigO09GD6T046+1X0jaqraAhsztn8ID3dYD/IldaW2Re
	7mgcxQMKxE3tvEVkssFFxsZlLTiJGhQfPDck3oXmAn6AUq8pjuwlc0qtpLNNIZMY6zsX1+Fk9WM
	8zs0XX/f5j8V0RtWj+JbL2uOrU0Cfizg0av1TE1nmpVZLAQlsH/RQLWHz/lip2SHE/8qYYzw6lg
	Yc8OqNoWiNxB2B/3gOvL8PnybipWqmR1XaOZ/tBcuPpTdFf+gVjBvaFoZVER5gDxpjS6G6ZfkIJ
	Fovw3SD9ppczpI/YhZYtFjKFCpjWlLM+6fuNA8qZ3/VTYT8qCJZHAUOIafLfZhEZ/9MbLrQq8oL
	7dkmqUbE7u9mIrF0JFegkXeyVkm3t6aEI=
X-Google-Smtp-Source: AGHT+IFOPnxE+1v0qQzqQHSomvFKOkcj910tYm4sA/04BMj9xybXts+R+b60GI5wMPnAbvQGZQ+oVA==
X-Received: by 2002:a17:907:3889:b0:b2e:7614:d92d with SMTP id a640c23a62f3a-b4f3dae3a08mr508342566b.0.1759852161584;
        Tue, 07 Oct 2025 08:49:21 -0700 (PDT)
Message-ID: <b72d1e81-cca1-4d42-8ea0-d07780a80357@suse.com>
Date: Tue, 7 Oct 2025 17:49:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/22] x86/fsgsbase: Split out __{rd,wr}gs_shadow()
 helpers
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
 <20251003225334.2123667-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251003225334.2123667-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.10.2025 00:53, Andrew Cooper wrote:
> Right now they're inline in {read,write}_gs_shadow(), but we're going to need
> to use these elsewhere to support FRED.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



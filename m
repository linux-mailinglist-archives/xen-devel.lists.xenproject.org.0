Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C247990B022
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 15:50:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742317.1149090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJCkI-0000ww-3C; Mon, 17 Jun 2024 13:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742317.1149090; Mon, 17 Jun 2024 13:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJCkI-0000sy-0X; Mon, 17 Jun 2024 13:50:06 +0000
Received: by outflank-mailman (input) for mailman id 742317;
 Mon, 17 Jun 2024 13:50:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E9YK=NT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJCkG-0000c8-N4
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 13:50:04 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f76c117-2cb0-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 15:50:03 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a6f0c3d0792so506468966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 06:50:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f8cc20663sm63773266b.190.2024.06.17.06.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 06:50:02 -0700 (PDT)
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
X-Inumbo-ID: 7f76c117-2cb0-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718632203; x=1719237003; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rdJOBROw5bhO0Zz4HbPSKOcX74L1n40vY0872unV42E=;
        b=LShG6x6WZ6K33izXPML/jh1wcx/lj/fCjYHugWWUzQzMkqPPaMVZh/BhAqBbGY0yeV
         jNWleDeIxD2XXOMoLPSkqIKdbqN6mPFRNzvS2LiM54E6WuEgDDMSts9G+kRaAWOs71iO
         qCXWrMr0/0Xq+iHVO3rdkBo/WzJgWcCEQQkDHIZ9AFJf6A0tmW6M3/lAqL+08lv6JRMj
         Szgnb1GAx5ntrgXLr4zZnL8WePRMpw+pQXxWyQtp9+VEAg1rSOuzeTaA5vG0V+eTx8aB
         MHAscXUvXp+6OhCHiKTqIO0IAersMb749XZ/JkVgbl3X36GKF5MWNg/Vb55XEYniAuSf
         TPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632203; x=1719237003;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdJOBROw5bhO0Zz4HbPSKOcX74L1n40vY0872unV42E=;
        b=Y0m715l5c0RDMYpoFkOkLuiNCU9rZg7z2o53uCboodZW/upa/ptllLJ7IDkR1si6/s
         5Mau769rM4BZ4sOdMlJTjMTt+N+cC+ZoUbq7Cml0bRoFy+2ClI7SM0Qk/pljIcFVnvza
         2Eehn1ML2xLi3d0/Wa35WiIiHPhQC/1WiWtEIU1oRiPgNZ2su6ncqSsmWW6YTP772gQr
         GdAL7hmxn2mcNnA9W9W6o3Foi9xjGYvkXP28uJexmSJMghWPUQWm8w8YoFEiVykaLB1a
         fPDGH6ZgZ0zyC6B0lQPHRrprTVRWMqLrsOczbn19OqSoyVBJ72+HiajzBuBG22V/CeuO
         aNpg==
X-Forwarded-Encrypted: i=1; AJvYcCXTvCFgmiP5c+EDYl+PRFuJLIxLyKe9dNKfF8TLSmQbQ3wDnzXMXCS3iy/946XuEmhsj2GrDUM+MtoI9UNu9D9lBPp8/rtsMPMSXmkVXpk=
X-Gm-Message-State: AOJu0YyHjkt31W9pRX57VAGa7R9TkrQfvP6LU40Vegyh9sw9KbR0OQIj
	h38qjT2ILXzX0oDkYmNDnKZhCpjQ+rBU6QRG5ND4SXe6ACTo1SbmSXUrWyxcyQ==
X-Google-Smtp-Source: AGHT+IFMWu4uzYtgWVDz8CbPsWhYEpEuXpOWdPQkpf89U4M+xWQTyv8JSCj/cxCucokftGG71Wgwtg==
X-Received: by 2002:a17:907:7f26:b0:a6f:50ae:e09 with SMTP id a640c23a62f3a-a6f60cefc4emr914686166b.4.1718632203009;
        Mon, 17 Jun 2024 06:50:03 -0700 (PDT)
Message-ID: <7e656934-617d-4385-9da9-658c07aeed69@suse.com>
Date: Mon, 17 Jun 2024 15:50:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] public/sysctl: address violations of MISRA C: 2012 Rule
 7.3
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <a68e796048912c816bc8320416024a60290f33e7.1718290222.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <a68e796048912c816bc8320416024a60290f33e7.1718290222.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.06.2024 16:58, Alessandro Zucchelli wrote:
> This addresses violations of MISRA C:2012 Rule 7.3 which states as
> following: The lowercase character `l' shall not be used in a literal
> suffix.
> 
> Changed moreover suffixes 'u' in 'U' for better readability next to
> the 'L's.
> 
> No functional change.
> 
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>




Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F3587187C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 09:44:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688640.1073064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhQOm-0001fz-M1; Tue, 05 Mar 2024 08:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688640.1073064; Tue, 05 Mar 2024 08:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhQOm-0001dP-Ih; Tue, 05 Mar 2024 08:43:44 +0000
Received: by outflank-mailman (input) for mailman id 688640;
 Tue, 05 Mar 2024 08:43:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mek3=KL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhQOk-0001dH-Kx
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 08:43:42 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 772bcc98-dacc-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 09:43:40 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-563b7b3e3ecso8163161a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 00:43:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ub13-20020a170907c80d00b00a4406929637sm5800778ejc.162.2024.03.05.00.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 00:43:39 -0800 (PST)
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
X-Inumbo-ID: 772bcc98-dacc-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709628220; x=1710233020; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XsR044gu6WxyyYX1A5oId0NOLbDDnjjOM33+Bu/P7WI=;
        b=AbTQAHUpEoOldnNICdy70wz8BP32yXE5T3fXNkuCiAQdW8SFGhw9mos3zEZwWClcLQ
         O9LZnMbvy8RPfU95j0sO4jbUlIKPYiGStkkzfcMYEM6z/15CukbYMIYn8AWDsRFu11HA
         CuWrX/fonb4O/HBVOGTOYBPnPNZOFjdXA9cQPDJYhGQYY1ovxYfRjvXbBEos6faSpwzq
         XMa6AW+bYZPETrZYm9ngKa/lZrakyS0xOiJv4Rz6ZzwEDfKZAUnFUMIG2/bSc9PTZqAg
         kzcZhhGwNCQ/xI/7QU8du31dW3qw4SjKR6oppw3ueAxnrs1M7do+fVOx+XxX+xmfnTsn
         x3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709628220; x=1710233020;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XsR044gu6WxyyYX1A5oId0NOLbDDnjjOM33+Bu/P7WI=;
        b=Jaf9lYNhTpG+AeTw6K69iR4n/YHyvh81Kjg4Rc7Acis9zTcmjiNw15O7o1aigqNLaA
         CDpAXF4WjEOMOAhNVqsJDGIeE/85RwWTU55OS+EYP/vWK7m5Wwa4U3Dso+Kr5yTb8NeO
         K20MEJf3Lq/Ra/RttzS0IbP06XjrH1GVxIsKIKtW/F9SuIgUmfA+e2hGZDqck/vAW6/G
         S3mtAji8ogMFE5jfuMmmXw9fcvNAIN8cP87YLGqjMZtS6tGpGQl0nuC4UEm52KZiIgG5
         kvEtmaGjMuRwHT2sEJv+3cqlGgRx6o4ggaQ5ZqtPFTgPgNeWGzpuLNB+Bd2RrQD3AyEk
         IJag==
X-Forwarded-Encrypted: i=1; AJvYcCU2x9yzzq+GQc6gDYrJj8YqzDstaBTp4NJCZZZSEUU+MW+5MbuXS5oLDgKTNNiDFwjHcwSLz8+NWz1n0NDgKpNnKqZql7rp4mC9H7IzaF4=
X-Gm-Message-State: AOJu0YzmAFUsJED2kymHxAYyItRLgzqmCsVJ1nlzDy54bfQp3TFUMTlb
	FI5oG3MrtCCsuxOQWd4ygU9fyrfb69fb0oKewa38FZdiOf6SCTQ15bNGyJI3+g==
X-Google-Smtp-Source: AGHT+IFoy80EhLw4OlCM+DVFYjSQDFY0EM80FCPU0qNRg5StQdv7mFvZQkCj4W/gUtZo8H7oJf3AWg==
X-Received: by 2002:a17:906:e96:b0:a3f:3470:6055 with SMTP id p22-20020a1709060e9600b00a3f34706055mr6580698ejf.37.1709628219752;
        Tue, 05 Mar 2024 00:43:39 -0800 (PST)
Message-ID: <1fe3924d-e57a-4259-b71c-f2164bd5fead@suse.com>
Date: Tue, 5 Mar 2024 09:43:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86: i387.c cleanup
Content-Language: en-US
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240304091307.2295344-1-fouad.hilly@cloud.com>
 <20240304091307.2295344-2-fouad.hilly@cloud.com>
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
In-Reply-To: <20240304091307.2295344-2-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.03.2024 10:13, Fouad Hilly wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> No functional change

I don't think that's what's relevant to mention here. Saying that it's
trailing blanks and spelling which are taken care of would have clarified
what's to expect before even looking at the changes. I may decide to take
the liberty of adding a sentence to this effect while committing ...

> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


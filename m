Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0570E803AF8
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 17:56:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647208.1010061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rACFG-0007ws-Az; Mon, 04 Dec 2023 16:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647208.1010061; Mon, 04 Dec 2023 16:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rACFG-0007uR-5X; Mon, 04 Dec 2023 16:56:34 +0000
Received: by outflank-mailman (input) for mailman id 647208;
 Mon, 04 Dec 2023 16:56:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rACFE-000780-Un
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 16:56:32 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12cde042-92c6-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 17:56:31 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40b538d5c4eso42402935e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 08:56:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b003fefaf299b6sm15608248wmn.38.2023.12.04.08.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 08:56:30 -0800 (PST)
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
X-Inumbo-ID: 12cde042-92c6-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701708991; x=1702313791; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A6ZH0H0fotw8fuQGfCpZi0icnqE1Qk9bGZN671DPR58=;
        b=RexZNUAT/55J/hOmPqH9+CZO7bdwuH0RDW7TPlfxhr2KK6g7z8HEIYOieO2ZRC+PQV
         Dj2HV3wvB9iwntEc1veZL9HlpaxeGnb4mOcgOewgv4xzsxud7iX9uCRFvSQBX+uB0Eso
         7aIBZmUHMIiFHKjzTIauJaPVSAQfAaHprxF3L4zCjAqnPk1Hrc1hejDsiWOcvBjUx8HD
         k6DhWsgCuqK7xxy47JkLu4cbJzH8bTHSqydGUQwEAoec0dJwoathhQcb7gJ9xluD2eaG
         V+21fYzdaKCp0O2M0882Hcwz4LuX4xY4TxdZwe3xZVu+Tr3hMoS8D3EVaywPTknNRo8u
         70IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701708991; x=1702313791;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A6ZH0H0fotw8fuQGfCpZi0icnqE1Qk9bGZN671DPR58=;
        b=gNQGOX4GLM0hANg9E6CCgHF++EpV0U3qhi51bQkV1K4vKp03fMtev6f/l89rXoqxLI
         YVtIgG2QVZmN7M3ZsANBo6fReOqTEwjV+otAvzZ2h8AWOz14JBKsoetdbD68XEfX2KIp
         o0SacnXlg0Y8AlfybLqEVdO5K5vxBFY45q3Ia8iFCSTLkdBsdNy4RRzN4mg4QnFRrqOb
         TmHkb0ZqedXxm54bxlBhJ25jiQlJ/gZ/ZQamaInhZa491ZLoOjsHkfqh4pKKpvU5/CTD
         vsPKuR7rN/FCy70N3nygPpabQ7KMX+b6/BKND3O8JcppLogVj63vtl+fKFTPB9TyUuEi
         HpbA==
X-Gm-Message-State: AOJu0YwqH+1qA9Qj0h+Thh332ridyIQvuaQVDPmIc51Hj3YsKZXpuwjA
	JEhxM3Z1w0xJkZH4nz16+sADT8csPg7wCW4g8C50
X-Google-Smtp-Source: AGHT+IHz6etayH3kO+EghH9l0IzDltwRriD3uDI9lNXhlasCzNk9mStUJF82ZTT2xZpjciNW0b1qeg==
X-Received: by 2002:a1c:6a16:0:b0:40c:835:b9a with SMTP id f22-20020a1c6a16000000b0040c08350b9amr1416935wmc.167.1701708990971;
        Mon, 04 Dec 2023 08:56:30 -0800 (PST)
Message-ID: <c1438011-6f26-4ab6-b7ae-ac273a1beee0@suse.com>
Date: Mon, 4 Dec 2023 17:56:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/sched: fix sched_move_domain()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>,
 George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org
References: <20231204152321.16520-1-jgross@suse.com>
 <20231204152321.16520-3-jgross@suse.com>
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
In-Reply-To: <20231204152321.16520-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.12.2023 16:23, Juergen Gross wrote:
> Do cleanup in sched_move_domain() in a dedicated service function,
> which is called either in error case with newly allocated data, or in
> success case with the old data to be freed.
> 
> This will at once fix some subtle bugs which sneaked in due to
> forgetting to overwrite some pointers in the error case.
> 
> Fixes: 70fadc41635b ("xen/cpupool: support moving domain between cpupools with different granularity")
> Reported-by: René Winther Højgaard <renewin@proton.me>
> Initial-fix-by: Jan Beulich <jbeulich@suse.com>
> Initial-fix-by: George Dunlap <george.dunlap@cloud.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>




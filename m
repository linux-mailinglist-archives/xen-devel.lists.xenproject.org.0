Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CC9B2F46C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 11:46:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088315.1446074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up1s5-0000Qa-HG; Thu, 21 Aug 2025 09:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088315.1446074; Thu, 21 Aug 2025 09:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up1s5-0000NW-ET; Thu, 21 Aug 2025 09:46:13 +0000
Received: by outflank-mailman (input) for mailman id 1088315;
 Thu, 21 Aug 2025 09:46:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Hha=3B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1up1s4-0000NQ-EH
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 09:46:12 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab19d051-7e73-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 11:46:10 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6188b7550c0so1192165a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 02:46:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a8c1afaa0sm3450986a12.25.2025.08.21.02.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 02:46:09 -0700 (PDT)
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
X-Inumbo-ID: ab19d051-7e73-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755769570; x=1756374370; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=deloDzXxMgTQ54PJsdinO80QshYKSD6lzaguSnvcy1Q=;
        b=Yi8pyQba1w+Y85ScJekA7grnDiDey6m6cNoknnZc1WD2NpceFxMB+WHN3sLFuQ0vbo
         mZEi0OYM+gF/WBzU+ZptThdj1Q48TFFwhMBpDVASzcRX1BU0Kkf50AkMvN/M0ha9Tk3m
         ZDFtvUSQhxGJLHUvKCqkxI+m8QN7JROvQddGa3ZMJc2Q1oI80sZSFy9SORprVtjt9N/J
         36QrYUoSuckTfhtThEwmCbF+yN3rO2rRoy+wxPxnpG5zyTKVry/fnHjc6udc/wH0ZgPQ
         a6GiKFZAQGhNS7oUX5B+mJIMnK8zYVH3tIEfjjAfgt6xEpKhibUuuY5HWPcRW/jnb5Zi
         3gsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755769570; x=1756374370;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deloDzXxMgTQ54PJsdinO80QshYKSD6lzaguSnvcy1Q=;
        b=v5EQnd5tpZxsoSwb4qt28rSgBwDf1DjrNmDxzXcGjVz2o8X9xwvQORTN8tyGuIVsGv
         UuhFhtiUflfuAZoOxf/gbtgGNK5jMjunceqkNLxW4gi+p7oz2KHOQyCLDPIPXGoj2zFo
         8fNDf7rhRD0GZhbkW4lE6sOGIGqCm6eDQo443w21hbNMDLgaE6pgfC2VJwvX025kj1lM
         1n4iUXF7tqHLUQZa2gbzAmGTSar+WyPbe3bGSWgvFuN+9gO73Jd3KIBDQ7/jx+As7RSB
         S2EL8N0mu/CMoZaeC64PM/MSOnJJ+cth51ZlArTW8ZPtrvvM0JPa0MNkXcZY8fl0bSiK
         fBww==
X-Forwarded-Encrypted: i=1; AJvYcCVcK7a9KG8LpGd74QIXWwMTr/nGQ3reD7dKq/0M1BcUAPxgax0my2zcAKklPV8+CPb3IPqbv/S45yU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyS3YzDQBYcJeBBZkS6xvvmq2pQFDKunK8x0AQOzRgu109glfDM
	Y2GPrc5H70hKO4VRO7XzKf9Gp9mExe1E6ACO2hi+8Fy2FZdHR+EHw6mbDOtHLX7a4A==
X-Gm-Gg: ASbGncsNsRW4J7JiFwKAAkTxP0BTEcaEC9s7lFxTHqhPVRT1U6P7am6rs63XxW+tn32
	vpa4uexrhu2w4wHfMsPGqeaUeXRybjUxj6OO+BeSQ70hxKtI4rlOgq0NnnAt0AXbNmP8RxaMIe6
	8YlMSnypV6eNZj3Bt5Xy/Jq6ZyuXOKuEhMfyBS0e5o8xqYKB9F54PxDcvudLaz/0GuZk2r4a76S
	P0V+NyEC+S7pgP23dy5vduj4djWCCxnyhijiYNOn5eyj4/vAZ6enOokFl1jqoF/960c7CEeMuXm
	eme1o2y9HerlwEnTexKhvEvn37vggQPiv+oO5oJ1fgQL/zKWuYtnYA9qzvpq4zD6nxVw7V/tYHX
	6EiYcHNxiPine6Zejckb+W9EkL2nbKqQFUPIuzn6t1M0xlysI0KSXE7fzq+xopivUWhS3/aqWke
	wSGy5lf0qxpuZw6ZTD7A==
X-Google-Smtp-Source: AGHT+IHVZpUBl7XZ5nkG3XZ6SKleepgDDY1ZWFNh+PY2ZPwa6tWc+CnEkwG0en0FRPky9E7nDKDHqg==
X-Received: by 2002:a05:6402:3496:b0:618:986:7ab5 with SMTP id 4fb4d7f45d1cf-61bf874ef7cmr1462889a12.31.1755769569979;
        Thu, 21 Aug 2025 02:46:09 -0700 (PDT)
Message-ID: <7ca88d87-70b5-4871-827e-308941a739eb@suse.com>
Date: Thu, 21 Aug 2025 11:46:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: add deviation for MISRA C Rule 18.3
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <901917945f704643e95842a773be9e8676f76d10.1755690681.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <901917945f704643e95842a773be9e8676f76d10.1755690681.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.08.2025 14:44, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 18.3 states:"The relational operators >, >=, < and <= shall
> not be applied to objects of pointer type except where they point into
> the same object."
> 
> Comparisons in the 'find_text_region()' function are safe because linker
> symbols '_stext' and '_etext' represent fixed virtual addresses within

All symbols, after linking, "represent fixed virtual addresses". Not sure
what you're actually meaning to get across here.

> the same '.text' region, and the function 'addr' argument is explicitly
> compared to known valid memory bounds ('text_start' and 'text_end')
> derived from these linker symbols:
>     if ( (void *)addr >= iter->text_start &&
>          (void *)addr <  iter->text_end )

Overall I don't think the deviation can be justified this way. Or else
the same could be said about other similar checks, which may not be
valid to deviate. One particularly important aspect that imo needs
discussing is the safety of the logic with code transformations in mind
that a compiler may in principle do (leveraging UB for optimization
purposes).

Jan


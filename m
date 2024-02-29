Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6B786CAE4
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 15:02:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687145.1070109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgyR-0001rQ-BV; Thu, 29 Feb 2024 14:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687145.1070109; Thu, 29 Feb 2024 14:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgyR-0001pl-7X; Thu, 29 Feb 2024 14:01:23 +0000
Received: by outflank-mailman (input) for mailman id 687145;
 Thu, 29 Feb 2024 14:01:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfgyQ-0001pf-Cx
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 14:01:22 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0453e300-d70b-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 15:01:21 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so174145466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 06:01:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 vi18-20020a170907d41200b00a4455153b45sm391373ejc.141.2024.02.29.06.01.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 06:01:20 -0800 (PST)
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
X-Inumbo-ID: 0453e300-d70b-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709215281; x=1709820081; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gbJFnp9Dr+ZWHKrFGCv+4WB3le3vsgd13uQiLdxmE2s=;
        b=KbbTjTXD5O8+m5arlloKPrvJN1Zb0n2cah/m60iskRjjD6typ1GxQ1oepB8SKRw8hW
         1UlKZD/egFh+HsEvYG2BeOhX12VJ6sRZ17DpxYRxSNclYxAbxefoVKOljq68bX2aKkuF
         036aDtOFUWlCP9yrVJEkLDlcPg6p68B4+naQHkYKKBgd3ii+GeA2pkY/DJPsXmHQ0lab
         NlxH4BL9POwPhUM32Z92GQn4qa2gaSxvGA61VQwbdRE/SY1dMpdQga1hS+9ypLzK6QAg
         Q4f/LrE/b0fgM0zhavvUwU0/N0kGrdaD5ILQach4tg8OiJwoAdtIPyTkKmJO1cNjZxUx
         wAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709215281; x=1709820081;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gbJFnp9Dr+ZWHKrFGCv+4WB3le3vsgd13uQiLdxmE2s=;
        b=JcxFVZ7DKDT8sRPHFbZPYiavlXnIthiHO3pN/ViKiVmqSRua/QRYmruYBfyXFk4nl3
         PIzOWk4GeSoFnuxR4XFxEwE98voOSq+Ekvm770zI1rC9i1z0+leJ43jnM75NCmmxhOOE
         rezej35dd8HuNzv8j/p2CrsmGPiYwZqjOjfnLWNrB1Jwv7P1ksE6u967mMSQyCJ9TpMT
         e6U6odvDfitJGbzf5ZUkHXsvwOv7V86fODU7y03VgIBx/KtUxL9Qxx5/fbND4xZTfZVN
         iQzAigJxNVAaYHumyV78Wo8bSdojJNUOAHQTxct9XS9NN215cKRK4fyzV8Gjl7Pk3qzU
         FYWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8eEFuJ8RFV4D6I4ZpPLwsRZdQ7+U9Y6VzJBpH2GcbVPHdfQHbM6nIgE1msNUB9+ItR31QwBXhfZacB1DW8XThQ7xSODm3vUDKaw8r93U=
X-Gm-Message-State: AOJu0YzHy4fhMKCdAyhR0ohHU+ZkFbFX5Q7uQaTbfdZVRpzW/nrLbXjC
	O20EHuk82DKWDOky5JgCISBErYvrpvC/Vd17nBqYV5rp86IxIyyXY9KZzgIv3A==
X-Google-Smtp-Source: AGHT+IFoaPFmDKlblRlg9RHUq6IfIuSw8U3z+9ri8Zp057gN6Q+5BHfF48u7+mq91QHxCStAcVuHjg==
X-Received: by 2002:a17:906:b349:b0:a43:2255:2241 with SMTP id cd9-20020a170906b34900b00a4322552241mr1351453ejb.53.1709215280938;
        Thu, 29 Feb 2024 06:01:20 -0800 (PST)
Message-ID: <7d9a7a89-2ad1-49e3-9cac-7cf8d6b5e6c5@suse.com>
Date: Thu, 29 Feb 2024 15:01:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/23] xen/riscv: introduce nospec.h
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <16370492de5344ae8e1aab688261600491868f4e.1708962629.git.oleksii.kurochko@gmail.com>
 <e44a8bcf-a037-441c-b85c-651784df020a@xen.org>
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
In-Reply-To: <e44a8bcf-a037-441c-b85c-651784df020a@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.02.2024 14:49, Julien Grall wrote:
> On 26/02/2024 17:38, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/nospec.h
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
> 
> New file should use the SPDX tag GPL-2.0-only. I guess this could be 
> fixed on commit?

I wouldn't mind doing so.

Jan


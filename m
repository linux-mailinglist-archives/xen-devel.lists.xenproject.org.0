Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABEF8037A6
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 15:55:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647102.1009814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAALO-0003I6-CI; Mon, 04 Dec 2023 14:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647102.1009814; Mon, 04 Dec 2023 14:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAALO-0003Fo-9V; Mon, 04 Dec 2023 14:54:46 +0000
Received: by outflank-mailman (input) for mailman id 647102;
 Mon, 04 Dec 2023 14:54:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAALN-0003Ff-CO
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 14:54:45 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0edcb241-92b5-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 15:54:43 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c032962c5so26876635e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 06:54:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e15-20020a5d594f000000b003334d9c3b1esm1996576wri.16.2023.12.04.06.54.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 06:54:42 -0800 (PST)
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
X-Inumbo-ID: 0edcb241-92b5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701701683; x=1702306483; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=loUlAoDavnWabJCpbmKa8GaTGlEB+TFUd9KZxEd6dRA=;
        b=ghG26PENm+I1abL+FS8LRlPq8PlxRHPsocBNPFsDJsC4brzqod758sFeOTJll9zR2d
         kupf0sSebMmshmR0kpbToVzIjUSdZGopFU1SsdLq2oAKzeuPf/090kXmXzXmXzrwlwsi
         YVXHEVG/s5oLYJ530yKac7EKlllhCYkOj4sKj0KgV87FIugmzduBi8q6njVTCc5Rw9q6
         7YoXJ4AVKC4aw1KELIPCaaFx8ryATzLu3FPYxc/Vdp5EtRShtcTSwck5FUf4t8PqcPHF
         czKQ0XCo7KxhONxdPSUH1Qr4+I2kgD9rCmFDbD9MxZQbhmBvUa+POL0ONiqMTfHBxjzv
         2XHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701701683; x=1702306483;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=loUlAoDavnWabJCpbmKa8GaTGlEB+TFUd9KZxEd6dRA=;
        b=mohr3dqZkSP5nOlf/i391jn4+n9QWwtTS6RtMlvhsTBR7dhPlERg69JjjES1ZOfLul
         qAkHq9nGp1lFAqDc8UfgAwSdb3iDQqlwtY88adCOGVWDcif1gNCeIQxbKj1U4ULUmXXi
         P07ULUddSNGDtkGBbXEoy7ZUglibnjjGbDw0yHGPyqSNddM+TAhTs/6T2UKT9tqEv4+b
         y40XJjkeEdGROu8WMgaz+1/vN12LsLm3DLkuw70+h9SAwlpeZIrtG5FxEGD0nGLvI9DX
         ENtg0TJ/OC3+Ep9d8tYhC02gVYHwHXa883FhJHLKuI48F4m0F9KbrKu1LcQYXlHxL768
         hTVA==
X-Gm-Message-State: AOJu0YzWEzWzbJ1ALjhkUOZvtJg53HeZKVegqwFDyyySKepdewnif54t
	swaP63zWeFZPu05S3NDZXcvQ
X-Google-Smtp-Source: AGHT+IGbTVlkbZIRdop6SmspnznaM0LUB2ZM+MwoQms1km5Lq3Xi5J/rZKsD8MuE9ptHnjd5yzHI6A==
X-Received: by 2002:a1c:4c16:0:b0:40b:5e59:99d6 with SMTP id z22-20020a1c4c16000000b0040b5e5999d6mr1739519wmf.246.1701701682804;
        Mon, 04 Dec 2023 06:54:42 -0800 (PST)
Message-ID: <a330ae4b-7df6-456c-9711-0034a38fc26d@suse.com>
Date: Mon, 4 Dec 2023 15:54:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/2] x86/p2m: address a violation of MISRA C:2012 Rule
 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, xen-devel@lists.xenproject.org
References: <cover.1701344917.git.federico.serafini@bugseng.com>
 <0faaa66465367a9e4c4da5749bc123b832e02103.1701344917.git.federico.serafini@bugseng.com>
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
In-Reply-To: <0faaa66465367a9e4c4da5749bc123b832e02103.1701344917.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.11.2023 16:48, Federico Serafini wrote:
> Make function declaration and definition consistent changing
> parameter name from "gpfn" to "gfn".
> For consistency, rename also "old_gpfn" to "old_gfn".
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> This patch depends on patch 1/2 of the same series.

There's no need to state this, btw. Within a series later patches depending
on earlier ones if the default. There instead it can help committers if it
is made clear when patches do not depend on one another (and hence can be
committed in a order different from the submission's).

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A49993EC4
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 08:37:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812663.1225449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy3qd-0003e3-VC; Tue, 08 Oct 2024 06:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812663.1225449; Tue, 08 Oct 2024 06:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy3qd-0003c0-SE; Tue, 08 Oct 2024 06:37:31 +0000
Received: by outflank-mailman (input) for mailman id 812663;
 Tue, 08 Oct 2024 06:37:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sy3qc-0003bs-Mi
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 06:37:30 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9d22b68-853f-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 08:37:28 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a997736106fso22502966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 23:37:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9943ea4936sm362179866b.174.2024.10.07.23.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 23:37:27 -0700 (PDT)
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
X-Inumbo-ID: c9d22b68-853f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728369448; x=1728974248; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=neiYlOGTX8H9Lka0iRG1DKgQQ23BDMyH4pgriFqnD8o=;
        b=M8NL+RYShKjEr2/YRxZCYy9K2CCwebaatwO5UxSQnq8AG39nCMepJx8PMzuQf0LjMI
         8qjts8FxftpQCDGfgLY5/QuvqpJWfjC1/g/5Lrg0NNa08Mq5oRvct7bAKd/FhjO+Mrja
         XYp9bwnAO3CfyN0p88TnDP+vM11H73aXX466RgSOIYXOpP5s3QXm5N5waJs5iuGz+ALl
         h3cnE6fbxTGnUkCnbCB/1BRkYJalhcj3KMOy+Pf6y9FItMc3ka+PSbN7ETyf2Zrzjtf6
         wIPhh5aIoYXAv3rncFly3f/Cyy8nCKfRNUfZYosr9mmzF37LB2DCgwj1/DAz2e6jHUAA
         vQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728369448; x=1728974248;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neiYlOGTX8H9Lka0iRG1DKgQQ23BDMyH4pgriFqnD8o=;
        b=jLnGrV+bPEiDOHHzY46tspC+ci7d/xah2r810UrfTIpx8QTI6Ezr7inQIPh6RUpRHC
         26LM7u0Tdc644vumAOL8rGqq7AgZoszBuEZOmvD6HvlnUQDW13i+AOizC040V7zmF0Tc
         dGMvY7I20XYnYp0V1geZpGOxhBag8FXtLj3FxTNc7UD1jkEvc2jWqWSwhAiF7zmGa9dO
         WxG5dDWogkN7zSJFKsBj0OUdPFWT817CPiAjHtOaZp5800YZba+6CLNwbbVJSvo96WRw
         MZ4or3HTqxrYBlp63FBYuwFafakbibZ+TIrgFl4BQuIYip0OORoZM3YVuWxH4s6p7JwB
         1xEg==
X-Forwarded-Encrypted: i=1; AJvYcCWqsdLhxHIXhqRiP+Hh/5qgyKBP0D8ZKkjRJTkErBhWHrwXZyCVwzyMxb75kyfF1gjxlbG5XNVF8J8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmTGMmBDISI+QD1p/SLDN87fnJzQ6emYFStcOAcA3Ut8K+g2cB
	5sFyGKzj00pvqfeHSBV7vAsGobRqBkAvfGzHO6zthFJoozaRSiCzKN8gxJ54KQ==
X-Google-Smtp-Source: AGHT+IGaAMC6wm2wXc4QOhgwngN11jbM4r+PktodmmFFvPyDrRU4+cUwl3aGacqeLvB0lOAN6wsrzg==
X-Received: by 2002:a17:907:97cf:b0:a99:408c:6a16 with SMTP id a640c23a62f3a-a99408c6d34mr919957266b.12.1728369448159;
        Mon, 07 Oct 2024 23:37:28 -0700 (PDT)
Message-ID: <260d904c-54b0-456e-b4a5-9811f2e62c2c@suse.com>
Date: Tue, 8 Oct 2024 08:37:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] x86/fpu: Rework fpu_setup_fpu() uses to split it
 in two
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241007155240.17186-1-alejandro.vallejo@cloud.com>
 <20241007155240.17186-3-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241007155240.17186-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.10.2024 17:52, Alejandro Vallejo wrote:
> It was trying to do too many things at once and there was no clear way of
> defining what it was meant to do. This commit splits the function in two.
> 
>   1. A function to return the FPU to power-on reset values.
>   2. A x87/SSE state loader (equivalent to the old function when it took
>      a data pointer).
> 
> The old function also had a concept of "default" values that the FPU
> would be configured for in some cases but not others. This patch removes
> that 3rd vague initial state and replaces it with power-on reset.
> 
> While doing this make sure the abridged control tag is consistent with the
> manuals and starts as 0xFF
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> --
> @Jan: The patch changed substantially. Are you still ok with this R-by?

I am. However in such a situation imo you'd better drop the tag, for it to
be re-offered (if desired). It can very well happen that the person simply
doesn't notice the question pointed at them.

Jan


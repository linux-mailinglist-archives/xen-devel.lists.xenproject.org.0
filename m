Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 809DC996253
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 10:23:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813860.1226908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syRy7-0002KD-6E; Wed, 09 Oct 2024 08:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813860.1226908; Wed, 09 Oct 2024 08:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syRy7-0002Hi-2H; Wed, 09 Oct 2024 08:22:51 +0000
Received: by outflank-mailman (input) for mailman id 813860;
 Wed, 09 Oct 2024 08:22:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syRy5-0002HY-2F
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 08:22:49 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa4cfc52-8617-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 10:22:47 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a994ecf79e7so47948966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 01:22:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a993f13620dsm553556966b.215.2024.10.09.01.22.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 01:22:46 -0700 (PDT)
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
X-Inumbo-ID: aa4cfc52-8617-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728462167; x=1729066967; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cAFgz183wJIgXepemo3v3w1gU8IgIGcSvLo6kOlYkM4=;
        b=hCxCCeBC6aZt90ub2nnwRUf0gWH2vc0kuC06/LGgaqK4kpTBBNCqPAswWrrHUwg3xS
         ODIx/MnwzsPLo7lhKHyRCl+2D7yHprGYfXcCRBrukjh7MT21mJscIWHpmt/ej5wg2naE
         ahYt0xDLvaKNe+4WR73zh4+3kvJyokBXBcLtBFC1LBlZqVDS0ugRMT6ZQf8jegYcn0eS
         jdvmTcPcGA+PL5PYPeao7LRVkUyfGjeT4n/KW6oH9AZ8w2KUUukhaji9KwLMsUmcuFih
         ErvBHxct3Mw4LBcu9WUefgwIWc4g+WhRGmNSpaSZ/rrOurNqkg7WpHLlNw6biJfjogN0
         sH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728462167; x=1729066967;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAFgz183wJIgXepemo3v3w1gU8IgIGcSvLo6kOlYkM4=;
        b=KzAaeQADJO+uJHlJ0LdX7VA+IV/A+B5x9rNE3q2AyybjiZmsMZaGpFCOcNQHH7esU1
         4OVAp5+5DzRUTE3JwY0AFXghwsOZTdzNXz0NW8rx7Ng2maOUqQUQXQa9Z6f48lqfcqvS
         BbTSssPeZ9TKpeR7PGUcfwllQus9z75gVBoaI06xEp8lVHuX4Ms94Yhg9xZeK0o4XEbr
         r70Ovxt99IfVI2MBaSVxj7xtocUdn0G2CLhQXhFhTZh0KT0brYxPiuD0tzBiu+55R2mx
         uXrmxwWEusw6QiPL8YCrh0mZCzRXxTsdf+azj0t99vgezhj4A6K+Zj+Bd2fWeU0GqAB7
         9AAw==
X-Forwarded-Encrypted: i=1; AJvYcCWqxhIZI6hOLPthGqB6s/NaKPifGnnYSzIjcwebrp+0BFuaUUxcy2n4E84Isr5I2+2qgWEFWOvg5pQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuEhPC/FBOK65ZKyyXB9pE+/5c7Wq/lXXoPLw3AfmGcEMKQhHZ
	k4BzYvSpAa58hk8kTfhx0RFNcq1amzaDgF8yoJbeWnVa3VvQ6sILET5XYNldmw==
X-Google-Smtp-Source: AGHT+IF6SygvG7q1ZETdZz+YQ8XDtYXrDS5/8Be/fIvFADg8rpkyTY2fWSBhLLpQBYt8zVEhvooNig==
X-Received: by 2002:a17:906:7314:b0:a99:6163:d4f8 with SMTP id a640c23a62f3a-a998d333d96mr143125166b.58.1728462166605;
        Wed, 09 Oct 2024 01:22:46 -0700 (PDT)
Message-ID: <8773c396-a67f-4e9a-8d98-ed133d2bb474@suse.com>
Date: Wed, 9 Oct 2024 10:22:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] x86/boot: Improve MBI2 structure check
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20241009080439.2411730-1-frediano.ziglio@cloud.com>
 <20241009080439.2411730-3-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241009080439.2411730-3-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.10.2024 10:04, Frediano Ziglio wrote:
> Tag structure should contain at least the tag header.
> Entire tag structure must be contained inside MBI2 data.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>




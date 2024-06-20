Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF4391004A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 11:27:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744324.1151343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKE41-0005jM-5C; Thu, 20 Jun 2024 09:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744324.1151343; Thu, 20 Jun 2024 09:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKE41-0005gw-2T; Thu, 20 Jun 2024 09:26:41 +0000
Received: by outflank-mailman (input) for mailman id 744324;
 Thu, 20 Jun 2024 09:26:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sKE3z-0005gq-1t
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 09:26:39 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30f4e296-2ee7-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 11:26:36 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-42108856c33so10995105e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 02:26:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705cc966d12sm12021451b3a.60.2024.06.20.02.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 02:26:35 -0700 (PDT)
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
X-Inumbo-ID: 30f4e296-2ee7-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718875596; x=1719480396; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ukSYQxV8WYuiBktk/w2rk6jVRIf9YinMQmE2j/ELZuU=;
        b=XeVueRZCQCUP4NcIPeXecNbAHVSF56StLZAR/JiogGkC1ZKFtXEb8FJZhKcly8ttLh
         SmyNAbeHk8OwGIAzmtD+Y+IRo7c/eGIti+abNPsaYIrm/gso5YB3qpRjAdPxavwuCwqZ
         QFrFTHjkrJJMoTB4R6u7jJ5XCGqkD7eX0Y7QntKrfr4QYlHToRITo4yecJYT4BIduP4S
         QTmBd82m4re18sajBvf/S9QVBBDRXuucTbLYfJfBu2dhRkr6cqxY0BZ45d0arxNLWxNk
         G5YQ4Oujibsv7g5RrwQLo0ZIHlVoRaAWAo/1EMg8M0SrFkdldHjW9e83jODuQqi0rb1R
         gpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718875596; x=1719480396;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukSYQxV8WYuiBktk/w2rk6jVRIf9YinMQmE2j/ELZuU=;
        b=BuVV9QNUZS+rE3DxtPkHrkklX5BgLMFtRI1N/a3PgBMyIzps58Pg2b3BzeWGQln9ib
         iv3x8Dzp9U0MO41YgVOZgVVooIdzBJJQ9ImZXte2ffn4W2/jnQaCF95/dThrnH+G7RR+
         14NKCpDwnWKsbtdh5xK+7+YitFX5xz7SQEWScW6CqONt/aR8cuuag2dThNDDAjRhjm8v
         +TYgajtfbeE3qE3hgAN/99Znv8Ken0Yh8qwyiAg9k0+VByUNhBENZzm9kDUgbmtL2Icw
         ewO1Ccy9OP+1UD8Mk/RajHmTENEJYxD7QHxFOC/7JpA9jQsSG/O54ZUVPPMKzAsXBJXN
         6Gng==
X-Forwarded-Encrypted: i=1; AJvYcCWBuZdk7FOdHMUUeIVffkO8uS6/pFnnH4wJFIwQicdTiA3rGfc5DRUZLC7MQEmIMteVCrokvkLozJKjcaVN9QHG0wZzxDtJPg6EVhncPHY=
X-Gm-Message-State: AOJu0Yy6F1q5czaWMGAAcDC23XzZLYc8zKID45rNIQM7lX5qYMvZGZNF
	AIB8swbwaa+mNlpMx/gZf38hfviCXKHKIwapuwKS4IIrZQOIkGWlrwdoBASxjIzmJi+T0rcNdRI
	=
X-Google-Smtp-Source: AGHT+IH9m/T7KSOA68Av1ymbJtklP9ULXBtYuXZXXq2GmUiqKeVbMeECEZOtelTXoEkbU2RfjYc9EA==
X-Received: by 2002:adf:fa81:0:b0:362:4679:b5a with SMTP id ffacd0b85a97d-3624688530emr6014052f8f.16.1718875596051;
        Thu, 20 Jun 2024 02:26:36 -0700 (PDT)
Message-ID: <5f486b5a-aba1-41f6-9e24-16ad3acd67bd@suse.com>
Date: Thu, 20 Jun 2024 11:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation/eclair_analysis: deviate and|or|xor for MISRA
 C Rule 21.2
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <b89e106649e3d0ecb41baadb49dc09c54b7563ec.1718873635.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <b89e106649e3d0ecb41baadb49dc09c54b7563ec.1718873635.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.06.2024 11:07, Alessandro Zucchelli wrote:
> Rule 21.2 reports identifiers reserved for the C and POSIX standard
> libraries: or, and and xor are reserved identifiers because they constitute
> alternate spellings for the corresponding operators; however Xen doesn't
> use standard library headers, so there is no risk of overlap.

This is iso646.h aiui, which imo would be good to mention here, just
to avoid people needing to go hunt for where this is coming from.

> This addresses violations arising from x86_emulate/x86_emulate.c, where
> label statements named as or, and and xor appear.

So a deviation purely by present uses, even ...

> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -498,6 +498,12 @@ still remain available."
>  -config=MC3R1.R21.2,declarations+={safe, "!^__builtin_.*$"}
>  -doc_end
>  
> +-doc_begin="or, and and xor are reserved identifiers because they constitute alternate
> +spellings for the corresponding operators.
> +However, Xen doesn't use standard library headers, so there is no risk of overlap."
> +-config=MC3R1.R21.2,reports+={safe, "any_area(stmt(ref(kind(label)&&^(or|and|xor)$)))"}
> +-doc_end

... constrained to just labels. Why would we do that? Why can't we deviate
them all (or at least all that are plausible to potentially use somewhere,
which imo would include at least "not" as well), and no matter what
syntactical element they would be used as?

Besides, just as a remark: Specifically when used as label names, there's
no risk at all, I'm inclined to say. If iso646.h existed in Xen and was
included in such a source file, the compiler would choke on the result.

Jan


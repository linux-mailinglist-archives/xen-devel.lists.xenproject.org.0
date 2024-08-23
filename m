Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8C495C5C9
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 08:48:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782159.1191624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shO5v-0001gI-UC; Fri, 23 Aug 2024 06:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782159.1191624; Fri, 23 Aug 2024 06:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shO5v-0001dZ-Q6; Fri, 23 Aug 2024 06:48:23 +0000
Received: by outflank-mailman (input) for mailman id 782159;
 Fri, 23 Aug 2024 06:48:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1shO5u-0001dT-Ne
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 06:48:22 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af64af84-611b-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 08:48:20 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5bec78c3f85so1979654a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 23:48:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c04a3cbcaesm1693360a12.39.2024.08.22.23.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 23:48:19 -0700 (PDT)
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
X-Inumbo-ID: af64af84-611b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724395700; x=1725000500; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KgAuwxLJBxFo+sIorLSrqSq2BKf0W3ERXL8VEq5bxk4=;
        b=Cp52VUExUppDAGYI/itoCtOS5fc2G1qBQsSURTcL/JdSSQHue5C3vwpy8YyPqZ1beM
         ApFUIxUhOJMNrNQyM9mTs87mFoVOzcTYHr6JVa6orQqCosU6E3knjaRrQGRkONErKH5s
         xoeSfO19vEI0T+BJ/rbEWraBtGVBKKRoJl8SAN4aSCicSmsWHNZIJ30GRVVC/N5bGPIs
         8G2jaSYHhIyjwvfSbtI56OU8hHz0qTc5Uy8Ef/sRc3oeRVagbysQ6J9os/Clbr4tNihl
         qDHgR+0vCF5NxATVQJUOytRVgEZ6+V91ZC26V8HTsBxbfO046dG1djZyTN+UA6zQ6YkK
         /I8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724395700; x=1725000500;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgAuwxLJBxFo+sIorLSrqSq2BKf0W3ERXL8VEq5bxk4=;
        b=Bf6ucTcyLSp4C3ginSsFTYtBFICUd/AALslxMJoFn9tTN4i6FhvS9nZGcETLEV70es
         HIlhLLywOjRpZFqh3tQfDlG8jwOPljzf/y3R6uTOYucVU6OZCUYXc/0DdLo4FpGPgSLa
         U0unHBdN4TfbTJWKZZcnAypjc/l0lcE0+BsW6kyPg4t6qwLPl8ern2V99u5QCfYfehR+
         3kEHEyoWU7i+foff1ZjLlFPY1s+Ni0sPKfXlsgqwEVm813IE4Wm/UAsZzoClQoVkRmO5
         Ag1hgW0KpSGaCLWD8/ZqXX0Iy3bk0PyU6coDsD1YzSB22hnRzxiKMXrA/UYbJ20iKMrv
         IW8w==
X-Forwarded-Encrypted: i=1; AJvYcCXkBmlE7zGoypXVfw+E0n5sEdIuhcNRTfWfwHBbrioEmrDEMvKSCsRKb0+KktR8FsWpWRx/ccLwaUU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5TL3bLa09b08ep/wsljwU1PO5Uz9LCApGfw/WB333yo1Pk6Mc
	PhGOsUfHolvVzlNSnYVbpYKbemh6RVzYTTWE1IiJhINhiGaGzK+oeYQKlDfDnA==
X-Google-Smtp-Source: AGHT+IFmmxWJfgdQJ/oszvxr0odgYDPBpqIqjDhQnBeRT9OvvCtZFdRBXklV7gcHJ04I8sD+wEPlcQ==
X-Received: by 2002:a05:6402:2b8a:b0:5be:fcba:c37c with SMTP id 4fb4d7f45d1cf-5c0891b1fd9mr561219a12.35.1724395700111;
        Thu, 22 Aug 2024 23:48:20 -0700 (PDT)
Message-ID: <25eca7b9-daef-42c7-8aa4-0d63d0cd0aa4@suse.com>
Date: Fri, 23 Aug 2024 08:48:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] x86/ucode: Introduce --force option to xen-ucode
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240822130426.492931-1-fouad.hilly@cloud.com>
 <20240822130426.492931-3-fouad.hilly@cloud.com>
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
In-Reply-To: <20240822130426.492931-3-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.08.2024 15:04, Fouad Hilly wrote:
> @@ -79,7 +81,10 @@ static void usage(FILE *stream, const char *name)
>              "Usage: %s [options | microcode-file]\n"
>              "options:\n"
>              "  -h, --help               display this help\n"
> -            "  -s, --show-cpu-info      show CPU information\n",
> +            "  -s, --show-cpu-info      show CPU information\n"
> +            "  -f, --force              skip certain checks when applying\n"
> +            "                           microcode; do not use unless you know\n"
> +            "                           exactly what you are doing\n",
>              name, name);

As indicated before: --force does no longer fit "[options | microcode-file]".
The form coming closest is imo going to be "[options] [microcode-file]", with
the file name simply taking no effect when specified together with one of the
pre-existing two options.

Jan


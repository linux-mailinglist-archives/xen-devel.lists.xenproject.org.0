Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0ED8D1460
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 08:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731007.1136299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBqJk-00070p-0v; Tue, 28 May 2024 06:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731007.1136299; Tue, 28 May 2024 06:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBqJj-0006yI-UI; Tue, 28 May 2024 06:28:15 +0000
Received: by outflank-mailman (input) for mailman id 731007;
 Tue, 28 May 2024 06:28:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tjWx=M7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBqJi-0006yC-8u
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 06:28:14 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75d56642-1cbb-11ef-90a1-e314d9c70b13;
 Tue, 28 May 2024 08:28:13 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a59a352bbd9so75943266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 23:28:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c93707csm577614466b.57.2024.05.27.23.28.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 23:28:12 -0700 (PDT)
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
X-Inumbo-ID: 75d56642-1cbb-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716877693; x=1717482493; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0k/DAqxBkB14KmxSi3o3PzV4C0hovLEz8huYFNBItaQ=;
        b=I3lGrNX8FqKLsI2g2qAIDdUOiwHuSlXej5lb+k8gG3wCW49kntCUI8MBSLfgoJh2qR
         x75pwCy6HRuE5rqcJL1wiouc88ycefPYSVrfhPp4s3QlcFVS070qhGIMRYuuemYwFy9Y
         Az6jQ1Do8/+Vnoi/W883/pQHhpkIDn2WCJuxivPwmECF31coTT2jZRQbxLotpJOLcelz
         Yt6/XUgIa8qWQWLnhb5vhI+NjxeoNas1KbpIz+CGXUzUQoWy7GTwWsXAygJxiWJT8qo9
         p0EK577GkUrIk45X31+6bBm+uNYOLKw1C/VjSIL0YewSp6bGMm6CMmP+mHxqEmNaWDvZ
         TqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716877693; x=1717482493;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0k/DAqxBkB14KmxSi3o3PzV4C0hovLEz8huYFNBItaQ=;
        b=bj2lAHmzG2tzNqPQXY/SGeVZ29SFOVus0j7RIOt3i/DhPRUnHIAJql+IYByAFKR4DC
         k/pUJZmC50zaLz++lZ248+/b0uMf8/EanAuwuEEAh4oSQsExyNhcpCdqSyVsN9Pf8Nia
         wd6UGkcDroZsxsgjui0QzLPa+fXXnVTBzIeTl8Ytj33MhcFmnwbtfITnqYuDfteVL9I7
         MolFn3XpfZ6/NMHeY28ISopy7cT0jWvQnCd+NWGsOEfwPvRg/yJwGO64LOt0Z0ODPe08
         5JDbucJ1aOHslsDBK+ZNhlWKtzO7dYYOdALOQ3j5q8pTvBk29yqhJKdotm6Qi8VbK2tm
         MCHA==
X-Forwarded-Encrypted: i=1; AJvYcCXBUG4hg8QGaQcJw1rxb8XmdHE90b2hQVTAvGQNpY0ePLKIOzwMiu1EmaLcjsQFLLPdHAyR9VoaSL+SpNjN9EFiUnJ85BVfOHKJpLKr+C4=
X-Gm-Message-State: AOJu0YwhuQzhS6NABMm1ycvZd7KIAGgZNHc4M2v7dUUatCWEci/iCvCx
	d3ofudLrgaooBe0MF/Ap0pb5QVsGjK0p0AwLNTjEPm0kqxGBM+F5dYjmZz/3fg==
X-Google-Smtp-Source: AGHT+IEMcbxBw+42tN6WNr05NnGa8D05ElJr5wq0UJPTXbmmqtBm2qUP+WpAG5A8zHgTzetYW2QZJw==
X-Received: by 2002:a17:907:7da2:b0:a62:ef39:19c2 with SMTP id a640c23a62f3a-a62ef391e87mr517112066b.4.1716877692836;
        Mon, 27 May 2024 23:28:12 -0700 (PDT)
Message-ID: <ffb55f45-d08e-4c60-af71-f9a56856bca9@suse.com>
Date: Tue, 28 May 2024 08:28:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/4] x86: address violations of MISRA C Rule 8.4
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1716814609.git.nicola.vetrini@bugseng.com>
 <cf926194a541d11e02670516a8d337de27836dce.1716814609.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <cf926194a541d11e02670516a8d337de27836dce.1716814609.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2024 16:53, Nicola Vetrini wrote:
> Rule 8.4 states: "A compatible declaration shall be visible when
> an object or function with external linkage is defined."
> 
> These variables are only referenced from asm modules, so they
> need to be extern and there is negligible risk of them being
> used improperly without noticing.

"asm modules" isn't quite correct, as there's one use from inline
assembly. I have to admit I have no good wording suggestion other than
explicitly covering both: "asm modules or inline assembly". Yet that
then is ambiguous, as a use in inline assembly may also mean that
symbol is actually visible to the compiler by being mentioned as on of
the operands. Better ideas?

> As a result, they can be exempted using a comment-based deviation.
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

With suitably adjusted wording:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


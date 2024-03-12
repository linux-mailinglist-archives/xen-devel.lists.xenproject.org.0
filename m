Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 695D28792E9
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 12:25:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691783.1078138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk0G8-0003lT-Bp; Tue, 12 Mar 2024 11:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691783.1078138; Tue, 12 Mar 2024 11:25:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk0G8-0003jv-8S; Tue, 12 Mar 2024 11:25:28 +0000
Received: by outflank-mailman (input) for mailman id 691783;
 Tue, 12 Mar 2024 11:25:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rk0G6-0003Jq-C7
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 11:25:26 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38e644b2-e063-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 12:25:25 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a4417fa396fso387025666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 04:25:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 rn16-20020a170906d93000b00a441a7a75b5sm3737581ejb.209.2024.03.12.04.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 04:25:25 -0700 (PDT)
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
X-Inumbo-ID: 38e644b2-e063-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710242725; x=1710847525; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x1f1hNNbAJyaikjmoaIR3ZKVQAUoGbmjEBi5wSEkNnc=;
        b=A1OGhHLs8EU3OVQ0GL2Y1h9ceqDBbEe++wZL9KhWwD2xY637rgyI7rc/IO3z0O3099
         rPthkjoWWtw9jYd8Sjs5iUjLbeYj6WXuvnfGMSKKBPiS7BhHG6XvemzmsEvCf2ITuwmM
         01FEX8/2yn1NQKD/1JY/TT/mVl/NW+kbZOzkjZTcCM5n43/GqtcGYI17JOaim6kgduUr
         qsMYqSpkQio5Nyeg2nIQFK12pHuiw3zp5/0uqn6u81yVmku7q+0kSb1zDfQOYIohah7C
         a3r0Onhr+kW9LSsqyY1BzK6UMrAm5AVVe/U/LpUo6Q6MypzS4EXB69uS2EXEVIS4GJCL
         YJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710242725; x=1710847525;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x1f1hNNbAJyaikjmoaIR3ZKVQAUoGbmjEBi5wSEkNnc=;
        b=FQFz0gzINNEUtVArXTrRsiuBDFj5RbwmQd+c31otUNhqq9AFa5IuT/ruvk09zMsE1r
         RxlZS0Nf2b2EKum9QQ5t3b5bMNl0S+Amy7+LNnpI0+aBqZrcPc23OD+EpYRkyvUT1pG1
         jk18ZYX2Lg6OovwS/OKCi1wQvpxOKxgmHHSmZ1jQhFL/GLNpUGtbnFmAmiP27V9WM1yy
         ipnY5mKVIBwGGLOU0nQZLklBENtMeJiLYO6mcLP86YzGCWuRCYVyz+iWELan6244x6aK
         LnbMih43H0oOHjfSif0U3gPS9vB6ABFbMCfh1Wkjr9+yw4HQ+a+WISEs/9R8nkKub+2Y
         gu6w==
X-Forwarded-Encrypted: i=1; AJvYcCWarRvwfxCOTWBgpeeWJrRMrHS9m3w+dPaQY8XMBi9vhqFhjICRQ0qv8EcjUnd+SuQoxY+AUcifmaxaBoCVphPkVCSy+M/QvqKHDa0kuNA=
X-Gm-Message-State: AOJu0YxGVD56vyNNPFrAHgF6w3pgDzZVDrJS39BJhEuVkH7CjBToVKQq
	q+YwP3dJ7GPy73/WGugEBvzJHDycaNs6domxqUCo0+sR3T9/ISymVYeOsNNxGg==
X-Google-Smtp-Source: AGHT+IGussY1iV27BVX8rdhd4lzvwCNFhFWETP4Anw8wdT9W0o1rF0FFyQOaDACEdAFr++n9WLGjQw==
X-Received: by 2002:a17:906:2616:b0:a45:b5a0:f3a with SMTP id h22-20020a170906261600b00a45b5a00f3amr5473258ejc.17.1710242725225;
        Tue, 12 Mar 2024 04:25:25 -0700 (PDT)
Message-ID: <cf13d0d3-ac5a-483c-956b-12dad7af9cc8@suse.com>
Date: Tue, 12 Mar 2024 12:25:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen/compiler: deviate the inline macro for MISRA C
 Rule 20.4
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <0e48f35eaa95bbba6c2b8219e412bfd6d9c82b52.1710241987.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <0e48f35eaa95bbba6c2b8219e412bfd6d9c82b52.1710241987.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2024 12:13, Nicola Vetrini wrote:
> Rule 20.4 states: "A macro shall not be defined with the same name
> as a keyword".
> 
> Defining this macro with the same name as the inline keyword
> allows for additionally checking that out-of-lined static inline
> functions end up in the correct section while minimizing churn and
> has a positive impact on the overall safety. See [1] for additional
> context on the motivation of this deviation.
> 
> No functional change.
> 
> [1] https://lore.kernel.org/xen-devel/adaa6d55-266d-4df8-8967-9340080d17e4@citrix.com/
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -322,6 +322,12 @@ Deviations related to MISRA C:2012 Rules:
>           - /\* Fallthrough \*/
>           - /\* Fallthrough. \*/
>  
> +   * - R20.4
> +     -  The override of the keyword \"inline\" in xen/compiler.h is present so
> +        that section contents checks pass when the compiler chooses not to
> +        inline a particular function.

... padding (1st line of this bullet point) and indentation (2nd and 3rd
lines) adjusted to what's used elsewhere, including e.g ...

> +     - Comment-based deviation.
> +
>     * - R20.7
>       - Code violating Rule 20.7 is safe when macro parameters are used:
>         (1) as function arguments;

... here. Happy to do so while committing.

Jan


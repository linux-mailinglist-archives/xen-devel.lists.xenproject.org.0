Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DF2971480
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 11:55:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794110.1202818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snb6Z-0003sg-Nm; Mon, 09 Sep 2024 09:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794110.1202818; Mon, 09 Sep 2024 09:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snb6Z-0003r2-Ko; Mon, 09 Sep 2024 09:54:43 +0000
Received: by outflank-mailman (input) for mailman id 794110;
 Mon, 09 Sep 2024 09:54:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snb6Y-0003qw-Vx
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 09:54:42 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 887104a8-6e91-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 11:54:41 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c3c30e663fso4669202a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 02:54:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd41c36sm2829604a12.2.2024.09.09.02.54.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 02:54:40 -0700 (PDT)
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
X-Inumbo-ID: 887104a8-6e91-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725875680; x=1726480480; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zdWAztr512bELWr6JTdz3TQEOFmY16d1W6eD00wDOgQ=;
        b=aDZiSBg5VFG6dKaTDOBNWMYqEskFEo6jLCVsqjloYuh23ZCqwro3/URxFlpw8Enjjc
         K0DpIch8ENHsykSengftqZCpa2+KQ8BjqLVfOHfm3JV3FuHehNV27hyt1i8WfavIixRL
         INxVDFH6u0eaX78iEGi0458FNkz1ogYQ4gNsriZ3++JWz9lGdJOUjtOHeyH1eKpBaWq/
         QhlWK1ZzxXkoZT9gz5gsFUpqBLFEvOuHHJSqTI6BTvdhM5ycfT2yF+WLlHxy4Ktm1O6L
         jmC1y9AZ5Ywlbl/ROfVcQh+/Cldiu64kw9B1zDZof65PHhsTcd0nn7CIQ3lyc2qm4ldc
         q3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725875680; x=1726480480;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdWAztr512bELWr6JTdz3TQEOFmY16d1W6eD00wDOgQ=;
        b=OkicdzrrFNoC16BFuacc2SS3d0QvJqf48HxaZApI6eB/3yhIpFVyVUNZcokZFr8ELc
         A02efHRwC4PqBh/2rSmQ+jJhT05P0A30TniQTmoy3sYZa2UhWNea6fi9RZdf4qUN1bk6
         Zfdcy7QgG5vRzB19HHNDOhBsco+JjIKOIW2nSlFznUTPvbr3tTLZcthCCTxAInhphlwb
         n6VdwgUDHUO03nsLxrHsn/KI+UGpjikNYsMyBDjvynyInqYqH8Z9o+cuoXJB1Dg6LG9e
         yaAaKCerRXO+a75jiTkuBrdzcQsDghQOPros5BlGWr0nKjtKWyPgfZ3PVEk/K88azh6J
         7gKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqz9lxkvG9t6bt15IjK97zIlEMRgWPZnPEEtijcacJYZGsmN431fzGCu72RpRX80J7ksIScwTwhgM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJ9YcuITcIjHccSMHr9bDvDxktnOPUbg/VFXQb+aDft517XDW8
	ac/FTXGEt75M53ocIh7PifWEPZc+VtiS5i4sk/RhfKj+fGham8XkRp6AWUQSrQ==
X-Google-Smtp-Source: AGHT+IEfPU6eFsAbE2QAA5PdhZci7jzDl+uTI2L5mpGgtuuboK5WdGFPLv14e02ytQ/984Z+p9r0tQ==
X-Received: by 2002:a05:6402:84b:b0:5c0:ba23:a544 with SMTP id 4fb4d7f45d1cf-5c3dc78a1edmr7459921a12.12.1725875680332;
        Mon, 09 Sep 2024 02:54:40 -0700 (PDT)
Message-ID: <7aba7d0b-54d4-43da-894c-367d2271c696@suse.com>
Date: Mon, 9 Sep 2024 11:54:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair_analysis: fix MISRA Rule 20.7
 regression in self-tests.h
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <4e59a8b7d97f34a824922013ffe5e44f70e6abaf.1725801931.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <4e59a8b7d97f34a824922013ffe5e44f70e6abaf.1725801931.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.09.2024 15:27, Nicola Vetrini wrote:
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -533,6 +533,14 @@ Deviations related to MISRA C:2012 Rules:
>         to incur in the risk of being misused or lead to developer confusion, and
>         refactoring it to add parentheses breaks its functionality.
>       - Tagged as `safe` for ECLAIR.
> +
> +   * - R20.7
> +     - The macros `{COMPILE,RUNTIME}_CHECK` defined in
> +       `xen/include/xen/self-tests.h` are allowed not to parenthesize their
> +       arguments, to allow function-like macros to be tested as well as
> +       functions. Given the specialized use of these macros and their limited
> +       usage scope, omitting parentheses is deemed unlikely to cause issues.
> +     - Tagged as `deliberate` for ECLAIR.

As on earlier occasions my take here again is that this is going too far:
Beside the "fn" parameter, all other parameter uses should be properly
parenthesized. I have no idea whether this can be expressed for Eclair,
but at least the verbal deviation description should imo be no more lax
than necessary.

Jan



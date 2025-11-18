Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FDBC6817C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 09:00:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164514.1491458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLGdG-0004Ud-BJ; Tue, 18 Nov 2025 08:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164514.1491458; Tue, 18 Nov 2025 08:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLGdG-0004Sq-8V; Tue, 18 Nov 2025 08:00:10 +0000
Received: by outflank-mailman (input) for mailman id 1164514;
 Tue, 18 Nov 2025 08:00:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=maYy=52=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLGdF-0004Sk-4o
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 08:00:09 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98dc3819-c454-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 09:00:07 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-429c48e05aeso3098724f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 00:00:07 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a80:314a:d80f:dc29:6f97?
 (p200300cab70c6a80314ad80fdc296f97.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a80:314a:d80f:dc29:6f97])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e97a87sm31225522f8f.20.2025.11.18.00.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 00:00:06 -0800 (PST)
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
X-Inumbo-ID: 98dc3819-c454-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763452806; x=1764057606; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QlvKeuqGsUuCRQMAKfwIBxhvqrrHYmr/xIdDZJHlVaI=;
        b=TIxNh0c/urQYa0yeSiw7ALvAG3CseIm/O2g0kHLXxJbKmgbgoot6T3v07Pg0v1IDdq
         Uc0UGllVEUn60IKXjB6O+SF4yLqk6TzXADMnYERflVISDh8/Br/VW3qxpz7fMsdSy73i
         oKpCbQC+dg2pMAZFFfvuXSBoOu10i1huLixQldbsJz+2xGn/5VLRSGx+GdrY5V9wKGB1
         YcpqChDnGT4PMDvPNEkc54kLKGRRyApv1TLTd10sXproYkQUWjYOhEM04V/blzWt6fMm
         52mUt8elSkdrwtecXNkMu4I8gGMMvUJ2BHuk6riHARJapleiy16KbG9Qig84E38YdGzP
         KAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763452806; x=1764057606;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlvKeuqGsUuCRQMAKfwIBxhvqrrHYmr/xIdDZJHlVaI=;
        b=cEb+2A56z6qhnAOakstsQatuy+k/cDsqcgEcNeWhHBvoOnx57flKGb0GvD8OUDeYbP
         Tn8Y6co2/bquBpeGbchqPTb98PVH3Q7kgQJ0F3lpWa9cTfdyekUhnJyzllMhB1Ckgrhy
         8oxaRxDBOOuyngmN1Nzaa4/dLc6EG245S1iQXx37pZf1v7lM/4TAcvbnpQufXxdQz0vk
         OIsrwVqy5cJEZIa92BobFQlWXi9V6jEiiP40Npj6abYcI3XSzMF1wzynpoiLJHL9qO8J
         rCbQkH1m6AdGuJUnQAG1x7B8yWy68shTSuBpMbwCNXTzyPoiWHC651CRonJGlBRO5fAi
         fQIw==
X-Forwarded-Encrypted: i=1; AJvYcCV8ZhQ+dCTDVXvw36P4ur961aRFPCUMGIBf7eBFy6NdIsHGhDhCl/qI+Lq4DA8cmrvPG82JpBlVhvM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrCUdH59BSZRzLCgSvteskZfEr8NndzdK/Xw8ByievdHQBhZ36
	k5QQpHN+fduFxO7B9ADWW1swqAaWmb6bP0WG+fIxXOR8RFaMISEWcF66yrMIOYOQHQ==
X-Gm-Gg: ASbGncvewJoXZD7PjTZNcYdTsY+4rEmLED4jRbj+nzpHxqqULCoOccdJ8BOuESh5dSD
	dh56rFzdLHVT/Xk5FSDw5XS8i8L3xIucJEbvhVk8Bsf6SBD69PXn0pA5A+jdkIQwRUHk/JDc1Rp
	EB1kBGOLgZshOcy9Lwbd7RyCXRtwNy5QCiD6GDGs3gzdSMCCpvATFxx5ywOtkARylZ0691P2cPX
	bHsAp3XPfp0C0YA4qvDUNKODzwUoexqY7iHUIyznSEDBQHyVUVUzcnguAiXpdXx7UP5fTKf7kTl
	llkzIfRCdN1w4bqU1cNKdyQASmtSzsvB2EnCMwYqAJe05w190mhge3K7cUyWK11meXAoGoi4CKJ
	usGHoMV+v39fZNr/zXAazX+YaPmiwSQikH3FW6TKPYAXNeRL+V5Dt0oa/eDXTrNB5BM2ycLtzdP
	yua8VRcH8vi+q+iRLwtDO0QBqHRqGH14qfUM0jE1gVhg4yZh+AyJybe4/Iqi5eTDw6GH8eBbH75
	YwQg+awmZ/Wg66axWglkdVgWcGlzOF9lOlxQftQYaC+fAJSi8uAzEnFR7A=
X-Google-Smtp-Source: AGHT+IEawQmDkq4LbCwuR5I0FgrgD2cKeI1qRqDUTeYpIJ2Xmk+OPybcs9tMHJm9b+vfAQZB+FJeaQ==
X-Received: by 2002:a05:6000:2582:b0:425:7e33:b4a9 with SMTP id ffacd0b85a97d-42ca85a5046mr2143391f8f.0.1763452806442;
        Tue, 18 Nov 2025 00:00:06 -0800 (PST)
Message-ID: <6528482b-8adb-47f4-805b-d9c7746ec92f@suse.com>
Date: Tue, 18 Nov 2025 09:00:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/ucode: Create a real type for loading_state
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251117222120.473451-1-andrew.cooper3@citrix.com>
 <20251117222120.473451-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251117222120.473451-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.11.2025 23:21, Andrew Cooper wrote:
> Using typeof() in wait_for_state()/set_state() unnecesserily cryptic, and more
> verbose than using a proper type.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I don't strictly mind the change, so
Acked-by: Jan Beulich <jbeulich@suse.com>
but I think the use of typeof() also has its benefits:

> @@ -237,9 +238,9 @@ static bool cf_check wait_cpu_callout(unsigned int nr)
>      return atomic_read(&cpu_out) >= nr;
>  }
>  
> -static bool wait_for_state(typeof(loading_state) state)
> +static bool wait_for_state(loading_state_t state)
>  {
> -    typeof(loading_state) cur_state;
> +    loading_state_t cur_state;
>  
>      while ( (cur_state = ACCESS_ONCE(loading_state)) != state )
>      {

Even if the type of loading_state changed, no type mismatches would result
here. Or in other words, a type adjustment there would not entail code
changes here and ...

> @@ -251,7 +252,7 @@ static bool wait_for_state(typeof(loading_state) state)
>      return true;
>  }
>  
> -static void set_state(typeof(loading_state) state)
> +static void set_state(loading_state_t state)
>  {
>      ACCESS_ONCE(loading_state) = state;
>  }

... here (which could easily be forgotten as the compiler might not flag
such mismatches).

Thing of course is that the type of loading_state is pretty unlikely to
change.

Jan


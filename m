Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 815CE854D30
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 16:45:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681035.1059564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raHRl-0004DH-7j; Wed, 14 Feb 2024 15:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681035.1059564; Wed, 14 Feb 2024 15:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raHRl-0004AN-4J; Wed, 14 Feb 2024 15:45:17 +0000
Received: by outflank-mailman (input) for mailman id 681035;
 Wed, 14 Feb 2024 15:45:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raHRk-0004AG-Jg
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 15:45:16 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bdd5a6c-cb50-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 16:45:15 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33cddf4b4b5so1276942f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 07:45:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r2-20020a056000014200b0033b4acb999dsm12623407wrx.98.2024.02.14.07.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 07:45:14 -0800 (PST)
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
X-Inumbo-ID: 0bdd5a6c-cb50-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707925515; x=1708530315; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TvQiN1hpDNMqbnpgIeCWsGY/7CQtMyl74GRbryjZrhU=;
        b=QtGzVoEolyqwJQ4mgrN3ms+gcBTLROeP0h9tqyJcuKHlIZ7wNws+quVcdRAJcgSGLB
         ZqD5/3f/I/htTndpR5WCOVsZ95/4T5E6+DtaKULiEXOzI/aR6X06X9t5sWT5U0YIdUJd
         mYu6cf8cwSjWiWbfkMa+NxFHM0Tg1MgKX/QKobBi3ByIfFAuP3qUx7YcNEH9DVMfS0du
         hd65X2vyLxA629/hVR6YApOcoz4BxGt4SjTQO6NLrTnxas72mZ/0r99oEoHBtN50+19y
         tFBUED4TxUXvvLKUpx8lRBwFs9rMXoO6Biu/y/MyrTjCkHuPS/Zmy48t6+ZNVpXhYveh
         SNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707925515; x=1708530315;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TvQiN1hpDNMqbnpgIeCWsGY/7CQtMyl74GRbryjZrhU=;
        b=hmvie1pjNYhfZRcnstsSUKEHvMB4wTqSmuwoJaAGwhm/TOY2/yKDZzrIzMwhrw1hgb
         RmTucG/bqVfqhVmoQQPIToSugtUtyJlqQAWto+dorlbQEi63aps45Of9DKEPetvJTBPv
         mfvIBrNakZhHjJ47ITZ/i7YK5lU1kooO5pMlBkQlYju4ixWnyOOBpAVvsV3EYqN9aj9H
         0LeFNJzO/jXVVyZOxE48X8lorGRblHPGZer/mg7xiFdoNTfhlJ5Ym+h43+iNuS3vLX5G
         FiIVYc/EHL25+l7tn60EYQwJBdgGBsUq2bOGm15W6cSyGzskcFTLlfP0FRZdCaG7nYm7
         5Ziw==
X-Forwarded-Encrypted: i=1; AJvYcCV5XSRI9gDRukaX7zv4ArY/XiXqLnQggV1HbTzMZb76UX2T4nTznt1cS4nVqC75y45ABRVW5hEI4z/nptND5ZwDpyox4pGK74GemZVUr0Y=
X-Gm-Message-State: AOJu0YzejrTItAbckapNAl0E6hpnUKvv5NbzpBAAk1YkletL3ZUgwlVr
	FAM4Uc3M7dU/LHcNzzNP+25NEfiiOQHVGm6VXmhvOfG0RY5Z7gPcWENdxLBycg==
X-Google-Smtp-Source: AGHT+IGkg8kCfd4nk4XfXVp4V6XVfyn4kJHXtM/gVD52cfZiOycE0Dr3AS4P/JJpJCgNLRibPzCaHA==
X-Received: by 2002:adf:e90a:0:b0:33b:649a:1a1b with SMTP id f10-20020adfe90a000000b0033b649a1a1bmr2311195wrm.49.1707925514743;
        Wed, 14 Feb 2024 07:45:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWftMTWQ3K0SjNZPcs9pCAHpczQraU0ZfpLWzM3CFYWy4da1f0HtN+OO5YOcNL36BV/ZAVTWfCYXLfs9LsBif5tLiVxgHM4T5g3cJNx95ENxvqb7EmtvR/Jm/8pYlPabJXalyB/T47KVrDL2mMg14LYvW9wBHcLmHKoAGTDlHmGGqxsAEjwjzWZQEne4wIfMbbL1udiwJ5eoUnI4c1kVJLNDO+w0TKMyTOG3PmkWa6RXAl41hHV0o1OAd9VCb5WFQzLj3zjpbY1PNkIyL7Zvh5ttqAvsUm7wky8eOYXtHfpIDA7dc0TpMWLnoY21RG2SwnizoXzPmloAEKY992Ff4+n1klBQUF7nPMwP5OPWN2KY2rlc0fE7hfnS5EwBnxScL+L72tD3IG+mK0E5+MoaJep5T0w/gtgx4RbVgsEshnseRC1U+irTyWF+8z3p3kXZ/XfUvJnMEtyU92+CqDBbj3mNxI=
Message-ID: <447b1843-f28c-4633-9e74-d695bc37208a@suse.com>
Date: Wed, 14 Feb 2024 16:45:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair_analysis: deviate certain macros
 for Rule 20.12
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <892be5c403ca7a20b35fb9facacb6a38bc7f6bfe.1707900742.git.nicola.vetrini@bugseng.com>
 <3519db82-6126-4aa0-9d04-795edf6f2bca@suse.com>
 <b87f53b8e39fdbd7f7aefe63f227fe7f@bugseng.com>
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
In-Reply-To: <b87f53b8e39fdbd7f7aefe63f227fe7f@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.02.2024 16:31, Nicola Vetrini wrote:
> On 2024-02-14 12:49, Jan Beulich wrote:
>> On 14.02.2024 12:26, Nicola Vetrini wrote:
>>> +-config=MC3R1.R20.12,macros+={deliberate, 
>>> "name(ASSERT||BUILD_BUG_ON||BUILD_BUG_ON_ZERO||GENERATE_CASE)"}
>>
>> I said in another context already that it is necessary to separate
>> global scope macros from local helper ones. Any CU can introduce 
>> another
>> GENERATE_CASE(), and would be deviated here right away. In fact I
>> question applicability of the deviation to arm/arm64/vsysreg.c; I only
>> see it as applicable to arm/vcpreg.c.
> 
> Why wouldn't this be applicable for vsysreg.c? I can certainly fine-tune 
> the deviation, if needed

There the sole macro parameter is used in only one of the possible ways,
with ##, unless I'm overlooking something. Aiui it is mixed use which
would need a deviation.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E075CA34423
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 16:01:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887785.1297241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiaiD-0001NF-VI; Thu, 13 Feb 2025 15:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887785.1297241; Thu, 13 Feb 2025 15:01:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiaiD-0001L0-SG; Thu, 13 Feb 2025 15:01:09 +0000
Received: by outflank-mailman (input) for mailman id 887785;
 Thu, 13 Feb 2025 15:01:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiaiC-0001Ae-RD
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 15:01:08 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59e2d887-ea1b-11ef-88c1-8ba37f82fa57;
 Thu, 13 Feb 2025 16:01:06 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ab7c07e8b9bso177961966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 07:01:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba5339dec3sm146879666b.157.2025.02.13.07.01.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 07:01:05 -0800 (PST)
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
X-Inumbo-ID: 59e2d887-ea1b-11ef-88c1-8ba37f82fa57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739458866; x=1740063666; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zycGhOUujfo0etbed9/yl+bfWCCM9jy+8/pXulSHoFw=;
        b=H6p1lMxSNhv8/IutkbiIVqw7578MKFZfaqpO4TC1Sq5fHBgaPdV0umWNS5OyO4KPGg
         eM2wCoavyHlzc19nZoUSxKLac5FPxSaq9wYjxAQ9NfhIVQ2OhOSw5TY+lhKUtwDKoGyh
         e59xml+9MpbNs8G3HklMAGHjk3pbhxcExH4HJW8BexlUtgCWeklKhHcwwJ7Ws3QstHF+
         zrVMhAqgBVJc4yh88xHfI8lfRfQBwQFEMBQj6vW82eZnZcwtRELdsBwhxyuMQLsEHT+t
         WuMR+iJds8pmFIwdzRKmQJ12Omx798JmpMXVT09Mq8GiUXGedxDHdbb1QG7qO5W2KlQq
         sD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739458866; x=1740063666;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zycGhOUujfo0etbed9/yl+bfWCCM9jy+8/pXulSHoFw=;
        b=ev3p2sWr/ashbj03XRVN6rqDQavlzhMx/02Z8kGliFSBkTQ/EL9SgHJnYzoeIQZLUN
         L8CauJNzc+Fl7FxelfuQrcRLf5aONjliJRFPhZSxXLHm4jzh1GdXx6zc56oF9eAQZISu
         Zdl18CjG5EA5Oy3/+gxInT5Rht3+b8UIkXrZFbashbC4tA5491r27I9rXPpj2BUD6JvU
         byGkuGiEgXCe2027sfrPspItKtTuwiMN0YFFiQ9kvcJ8UWSStZNZMQMpe8PuzxqTifSp
         qil8314ifY4hwpFFtRCfnt9sEtdPL8WIh3W+n8jVVCaFiXS169a6ty8mTjI+NARWgY3v
         o9gw==
X-Gm-Message-State: AOJu0Yw+KSRxXm1vvsk0w9JYfPrsnSLisX9LYxJSdzWDOg+09+JWxS4G
	VXG/wfBl19e9eFwHsvbV8YfqtTBwbmuxumG3SN8pUnIbwVApy0HLEz93teI30g==
X-Gm-Gg: ASbGncuQXFgYVuZEPSbFFJLivC6dF4vWBZwbCjtSPbxzz/f0FEnLEZldxQvgKONRPdn
	iMBsZcRcqzxFseCRPfKB0aiwoPKG5aOjeUYu7+gFi7GlLWGCGWbKn1h2BN6VN8FAbSa1LAAbS88
	ORrcCGe0tD3LHJzs5b5FA/uhfXhhFlZszkXeMxLDFBR2a2VQwtyKXjMvrU+7nNj3waOgoJcFqQO
	ac/WdIsSGe5nMEv/WFNpJeJDYelssLQqvhwLKqfuw6KZeqctP8FsobEogMgCFTscyGauaW03lqA
	sYPdGJCWozt6XqTFEmuud/dQLusB2a79VMLHxjAe8YcjCAqqErWA5hdDsF08aHYz6Sj5wbGA8MD
	f
X-Google-Smtp-Source: AGHT+IEnreHhsIVS8n37OTbDC25lAIVFvXUgq+M8y1vqmAqQ++xMMB4k4PnsNlbWe7R7zQc8eWyS1w==
X-Received: by 2002:a17:906:c114:b0:ab7:e3d1:ec12 with SMTP id a640c23a62f3a-ab7f3374c1amr685406266b.4.1739458865819;
        Thu, 13 Feb 2025 07:01:05 -0800 (PST)
Message-ID: <2118904d-3a33-47f3-af68-7303bc17186c@suse.com>
Date: Thu, 13 Feb 2025 16:01:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] radix-tree: don't left-shift negative values
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <70ebba90-59a8-4224-b67c-b9eb373684b4@suse.com>
 <0de3a7e8c55af172e7260f8bb22949b4@bugseng.com>
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
In-Reply-To: <0de3a7e8c55af172e7260f8bb22949b4@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.02.2025 15:52, Nicola Vetrini wrote:
> On 2025-02-13 15:22, Jan Beulich wrote:
>> Any (signed) integer is okay to pass into radix_tree_int_to_ptr(), yet
>> left shifting negative values is UB. Use an unsigned intermediate type,
>> reducing the impact to implementation defined behavior (for the
>> unsigned->signed conversion).
>>
>> Also please Misra C:2012 rule 7.3 by dropping the lower case numeric 
>> 'l'
>> tag.
>>
>> No difference in generated code, at least on x86.
>>
>> Fixes: b004883e29bb ("Simplify and build-fix (for some gcc versions) 
>> radix_tree_int_to_ptr()")
>> Reported-by: Teddy Astie <teddy.astie@vates.tech>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Bugseng: Why was the 7.3 violation not spotted by Eclair? According to
>>          tagging.ecl the codebase is clean for this rule, aiui.
>>
> 
> radix-tree.{c,h} is out of scope:
> 
> automation/eclair_analysis/ECLAIR/out_of_scope.ecl:32:-file_tag+={out_of_scope,"^xen/include/xen/radix-tree\\.h$"}
> docs/misra/exclude-list.json:153:            "rel_path": 
> "common/radix-tree.c",

Is there a record of why they are excluded? Is it further explainable
why exclude-list.json mentions only the .c file and out_of_scope.ecl
mentions only the .h one? Shouldn't different parts be in sync?

> We are in the process of setting up a wider analysis (i.e. with a 
> different exclusion set) with a broader configuration that may catch 
> these issues.

Good.

Jan


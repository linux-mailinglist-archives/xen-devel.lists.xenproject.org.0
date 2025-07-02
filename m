Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1442AAF5BE0
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 16:57:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031330.1405134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWytn-0006J5-Gm; Wed, 02 Jul 2025 14:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031330.1405134; Wed, 02 Jul 2025 14:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWytn-0006HR-D5; Wed, 02 Jul 2025 14:57:23 +0000
Received: by outflank-mailman (input) for mailman id 1031330;
 Wed, 02 Jul 2025 14:57:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWytl-0006Gw-VH
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 14:57:21 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dac95e62-5754-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 16:57:21 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45310223677so32679345e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 07:57:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb39be0fsm131084865ad.95.2025.07.02.07.57.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 07:57:19 -0700 (PDT)
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
X-Inumbo-ID: dac95e62-5754-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751468240; x=1752073040; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qv/5rb75ifF6fV5/RneTI3XnrNM6a3onvrWRxkhgMOo=;
        b=V5/e1FWp0GJ/S0d7vPbr2yFF+Iod58ny6Bv7zXfpXqh5BPk1TMFFmEJ68f9e6WLyKy
         9gCZAfZ/yoTRIDPS2HBkrKK0iG5y69ET0K3qn5M6BNfOogBCZJqANMIlFvlNbDJG4MeB
         DdXVLksXn7x2gwLZ9BtZWEexAg0lcjuG9uH4JX2wh9TFfw1DltWyAI9mKhNBSz+uLXDm
         /6Tm8/4Du74OsQjhDbR7Ur9HlsVsgr2tL2Z5QeYbZt7/hfIS0KWvYkJD8R/4K6IvDYBU
         F1i8yJQeikuCjiw1s50AjCpW3F7cXp04umjV/0+UfLbIaoApsWcBxAq0mBKscBQ5aHYy
         cqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751468240; x=1752073040;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qv/5rb75ifF6fV5/RneTI3XnrNM6a3onvrWRxkhgMOo=;
        b=LvkNJgL81bH8bZsIRuYceTmoeeq7DJBlLM8EWxtokVv+tQStJKvQQvJCfysPiOX4ER
         dyIwjedt2DpnQpcWtGjOOWRocLOrZO9w2cQgIU6vXsQviDft5n9jPocuU/W2Hq52Xx9O
         yIVLlwS/cbCbEAZILXTPap8F1SEdfjJ5iODfAPnXQFCJUU3SOnCywLM0UCh6Qguy6rOR
         85crw6XqgMvSmNRzHl3Riti4ND04bfh7VGdL4bPgF8vuBuE30Fplrr0GCGUei82xsrZh
         nDfWnovVTACXVyRzYB25WQOrLJmlnT1l49BL/x1Swd3wGyBEdqds1tyh5f03BKIZxlE7
         1vRA==
X-Forwarded-Encrypted: i=1; AJvYcCXMKorq8ZtTCdDfXUm7XPSET/PU5ZvBO0ngmfZOJpozkcr99Ejregl2P5Ume8N23mEIPB3Ry3PU7Fg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxqod1GKGfBx+jB3CjGFt9Zlf5X2u1+VxhgbDAglTz5RrG9B7mZ
	DxPvgyBM15uP10gCrzLe8wOgi5eGNhJkva4DZk9equ7jKKZcFXlm4MxVlH5Crw8Y+1vVmhHYI6V
	/XBw=
X-Gm-Gg: ASbGnctmMw2vIizrVfUYBOHOXoZ0N1HTv4EWb/dGkH3ROPjN5P1pK8BH4lsK5NH1g7X
	4+u+ucc6xxhm0g8Ol+XNTVR5HLEjzZiaCNNIfR5Rzw8Ajnk/sC48XbXRwYRHcwvHginiduTz1+P
	KaaZD6mwlPc8EbimEstg8DkeDjmznLF5qAGP94NovmEfh2CMVoSX6luoIZEP7xOSwhb+2fv8pmw
	M0U3Ca2JW0eWvFxrl/d8v3udievssF46/Y8xgp7AJnkIgAYDnZEJVUSiQX/Mxsusn5afrChxYJp
	P92BpK05/KoI1JtyS/RdcWenQpmOOPNIwZA7n88AUaI9/vrKWpjvzd1veo6zoPpySj//2dTFb+g
	UQXJap4Ho20D4Nv46LsIhBqGRWRBQ9MehX+wcu2jphMcL7f9cfz0J6u1HLA==
X-Google-Smtp-Source: AGHT+IEGOYCiu9xjHV/BdwCYkmrfO1e1bvXQRdbNzeHCeWIxRBqH4TDzZpr8bPQhgpE+lDw72VzATQ==
X-Received: by 2002:a05:6000:4104:b0:3a9:de4:851e with SMTP id ffacd0b85a97d-3b201203be4mr2476624f8f.45.1751468240339;
        Wed, 02 Jul 2025 07:57:20 -0700 (PDT)
Message-ID: <edef4d83-25d0-4191-bd7b-c13c38af34bf@suse.com>
Date: Wed, 2 Jul 2025 16:57:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/22] x86/mtrr: expose functions for pausing caching
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <8d6e871f055c2456ab194e49bd470eafd04e454e.1748611041.git.sergii.dmytruk@3mdeb.com>
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
In-Reply-To: <8d6e871f055c2456ab194e49bd470eafd04e454e.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2025 15:17, Sergii Dmytruk wrote:
> This allows the functionality to be reused by other units that need to
> update MTRRs.
> 
> This also gets rid of a static variable.
> 
> Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>

This may want to be split.

> --- a/xen/arch/x86/cpu/mtrr/generic.c
> +++ b/xen/arch/x86/cpu/mtrr/generic.c
> @@ -396,9 +396,7 @@ static bool set_mtrr_var_ranges(unsigned int index, struct mtrr_var_range *vr)
>  	return changed;
>  }
>  
> -static uint64_t deftype;
> -
> -static unsigned long set_mtrr_state(void)
> +static unsigned long set_mtrr_state(uint64_t *deftype)
>  /*  [SUMMARY] Set the MTRR state for this CPU.
>      <state> The MTRR state information to read.
>      <ctxt> Some relevant CPU context.
> @@ -416,14 +414,12 @@ static unsigned long set_mtrr_state(void)
>  	if (mtrr_state.have_fixed && set_fixed_ranges(mtrr_state.fixed_ranges))
>  		change_mask |= MTRR_CHANGE_MASK_FIXED;
>  
> -	/*  Set_mtrr_restore restores the old value of MTRRdefType,
> -	   so to set it we fiddle with the saved value  */
> -	if ((deftype & 0xff) != mtrr_state.def_type
> -	    || MASK_EXTR(deftype, MTRRdefType_E) != mtrr_state.enabled
> -	    || MASK_EXTR(deftype, MTRRdefType_FE) != mtrr_state.fixed_enabled) {
> -		deftype = (deftype & ~0xcff) | mtrr_state.def_type |
> -		          MASK_INSR(mtrr_state.enabled, MTRRdefType_E) |
> -		          MASK_INSR(mtrr_state.fixed_enabled, MTRRdefType_FE);
> +	if ((*deftype & 0xff) != mtrr_state.def_type
> +	    || MASK_EXTR(*deftype, MTRRdefType_E) != mtrr_state.enabled
> +	    || MASK_EXTR(*deftype, MTRRdefType_FE) != mtrr_state.fixed_enabled) {
> +		*deftype = (*deftype & ~0xcff) | mtrr_state.def_type |
> +		           MASK_INSR(mtrr_state.enabled, MTRRdefType_E) |
> +		           MASK_INSR(mtrr_state.fixed_enabled, MTRRdefType_FE);
>  		change_mask |= MTRR_CHANGE_MASK_DEFTYPE;
>  	}

This (together with the caller side adjustment) looks like it could be a separate
change.

> @@ -440,9 +436,10 @@ static DEFINE_SPINLOCK(set_atomicity_lock);
>   * has been called.
>   */
>  
> -static bool prepare_set(void)
> +struct mtrr_pausing_state mtrr_pause_caching(void)

These becoming non-static without being called from anywhere else isn't going to
be liked by Misra. Hence the part of static -> extern may need to be deferred
until the new user(s) appear(s).

Furthermore this returning of a struct by value isn't very nice, and looks to be
easy to avoid here.

Jan


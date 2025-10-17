Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1B7BE68AE
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 08:10:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144927.1478126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9dfX-00035Q-Db; Fri, 17 Oct 2025 06:10:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144927.1478126; Fri, 17 Oct 2025 06:10:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9dfX-00033i-Ar; Fri, 17 Oct 2025 06:10:27 +0000
Received: by outflank-mailman (input) for mailman id 1144927;
 Fri, 17 Oct 2025 06:10:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9dfV-00033c-MY
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 06:10:25 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f80a246c-ab1f-11f0-9d15-b5c5bf9af7f9;
 Fri, 17 Oct 2025 08:10:24 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46e542196c7so17232075e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 23:10:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426f2f72e18sm17562923f8f.0.2025.10.16.23.10.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 23:10:23 -0700 (PDT)
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
X-Inumbo-ID: f80a246c-ab1f-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760681424; x=1761286224; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l1KRy/FiQOq9kYAm0z3FGkek8LoZARoxCTbCcJGyDTU=;
        b=cwxwtvPmKkNO0KYSk+xiphGffeskYyO8sKKl8gWPi3LhXSjXRwSuYCh0H+xAejvzLj
         g+TwfkhALO6f0WTe32OUCup/xu3ssNn+23SwaK30Gr3YJ+pndSSs9Tkbe/JzzFxjDKDC
         MG7MSA92QF5Q+Chq73wJCPMoR0HtfXAXG9wZRy3qvp8BLDPjECw9Ic7huD3F8LyE3toD
         4Be49xjwJA/PRA/IqJ+hUi6kKayOesDmgnPGOovbpnbJaqjEqXyzfdwFx44JvoG/8Lsj
         VovJpf9eWycvirrKVkNQ87VRxjN4VxlKPLlv+ZgEDC4ZOMPGBP7GSHKQPu4Y2fCGvC6Y
         7gaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760681424; x=1761286224;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1KRy/FiQOq9kYAm0z3FGkek8LoZARoxCTbCcJGyDTU=;
        b=iwML8AsAqbHF8LR7xtx3cX6iAW+Gh2WxI5Z+tYCrOIx0VdYOeLJ6MRruWywZtWwdOW
         L8/TDG5xgFR69ixJjT49sOyiI1hD0RFnRyjmjoyoh7xFSSsz8SzOEdPDdEItvLEv2RIT
         ozTSpXf4C1QKLiFIsiRFYCslk5/LAtfmxgwvjNLb+tpWDH+CFb+RIelMoLINm4Z0bLKL
         6T8Zc3qCQ03Z8vsvu6s+3zaqweyvZg2TnVjYCQgNILSG6NmV6G8Ut6qqovjWERI1+tGo
         niu9kDiyLWDuAoYBDZUv/oxhmOk49oEZyqdMOTpNi9GGbwOxUqLzhlqmSWLwp+vk7xnq
         NqEw==
X-Gm-Message-State: AOJu0YwcIhVYH4FWxff3ReG4dFEcoBFgz4oDxSkrS1YZNtQe18a0VsMH
	g18zTCpzFLhxat+7OG7nWppLq8FNcVIhRI7XgE7l2juq2yNd9Z6/E0AJbSXnW3KVsF7dk+MdTvT
	XA9o=
X-Gm-Gg: ASbGncs81JYVtA5ezpOwWJKjyDVDJE5UKix1OHAzCmyJOqI8hkYtrWreM4sdF3mB9gJ
	TpAjSk7CZ9c7g44cNIIYa5Wr0NQOiAkPaRwxg4wxEbgm9BUliOMCbZEGlTagtBRJp5JtL9e/tvo
	L6lM1r74v+8NUAUL6NxbvDk9QD4/9nlZQ0ldk5rRF1yloQYTe7jL14dUqAfvVhNqjoyHr0WAp3B
	Jy9wv1/ve12HdXrumHbcNsQ1fGPdk/R1ScKodcPH9cPxmB791Rv9vJ/dq0U4P1vXnuncJP5hJJ7
	HPLRsWxNY7jU5Pkg7lDA0meAPmAk81E2FSn0/5FYuV9uFoGWWTILzHM4KRpPcyc64lYJe4zkbSa
	g9BxsCQRfHBdRnjPU5y0mzq5/eZXZg9ISe/Z0nFzZvfpcD5QzhyE/EhaRKan5rdctucTz+PmLH/
	oO2j7KHxG73fq2ZnRybWxGLHWb26lVfaFWWoQ3oBh+JzP9aah0PQMz9Jwk/Sae
X-Google-Smtp-Source: AGHT+IHa4DBJ0LEifxbbmN8SaaxHMPObtP8HGBDA7MBckosYd6Zc/nLPCPZ3ZlLqLe57NbMb/sIApA==
X-Received: by 2002:a05:6000:144e:b0:426:fb63:c01f with SMTP id ffacd0b85a97d-42704bf71ecmr1867957f8f.29.1760681423799;
        Thu, 16 Oct 2025 23:10:23 -0700 (PDT)
Message-ID: <94bfd5a7-6a39-4a83-a545-6be73b44e4c3@suse.com>
Date: Fri, 17 Oct 2025 08:10:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 02/10] x86/HPET: disable unused channels
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <8913e64b-d172-43f9-9c4d-447ba4984c9a@suse.com> <aPEd00xPCAc0hsr1@Mac.lan>
 <d06d997e-78c0-4735-b1af-7a0a04badbd2@suse.com>
Content-Language: en-US
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
In-Reply-To: <d06d997e-78c0-4735-b1af-7a0a04badbd2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.10.2025 08:08, Jan Beulich wrote:
> On 16.10.2025 18:31, Roger Pau Monné wrote:
>> On Thu, Oct 16, 2025 at 09:31:42AM +0200, Jan Beulich wrote:
>>> Keeping channels enabled when they're unused is only causing problems:
>>> Extra interrupts harm performance, and extra nested interrupts could even
>>> have caused worse problems.
>>>
>>> Note that no explicit "enable" is necessary - that's implicitly done by
>>> set_channel_irq_affinity() once the channel goes into use again.
>>>
>>> Along with disabling the counter, also "clear" the channel's "next event",
>>> for it to be properly written by whatever the next user is going to want
>>> (possibly avoiding too early an IRQ).
>>>
>>> Further, along the same lines, don't enable channels early when starting
>>> up an IRQ. This similarly should happen no earlier than from
>>> set_channel_irq_affinity() (here: once a channel goes into use the very
>>> first time). This eliminates a single instance of
>>>
>>> (XEN) [VT-D]INTR-REMAP: Request device [0000:00:1f.0] fault index 0
>>> (XEN) [VT-D]INTR-REMAP: reason 25 - Blocked a compatibility format interrupt request
>>>
>>> during boot. (Why exactly there's only one instance, when we use multiple
>>> counters and hence multiple IRQs, I can't tell. My understanding would be
>>> that this was due to __hpet_setup_msi_irq() being called only after
>>> request_irq() [and hence the .startup handler], yet that should have
>>> affected all channels.)
>>>
>>> Fixes: 3ba523ff957c ("CPUIDLE: enable MSI capable HPET for timer broadcast")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks, but I realized I want to make one further change here: I want to clear
> the pointer when handing off the channel to another CPU while detaching. That
> is the one point where we clearly know the affinity moves off of the CPU that
> is recording the channel as least recently used one. Are you happy for me to
> keep the R-b with that extra change?

Oh, that was wrong here. That's a change I'm meaning to make to patch 1.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F53AB3BCE
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 17:18:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981723.1368130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUvU-00086o-P2; Mon, 12 May 2025 15:18:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981723.1368130; Mon, 12 May 2025 15:18:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUvU-00084B-M9; Mon, 12 May 2025 15:18:44 +0000
Received: by outflank-mailman (input) for mailman id 981723;
 Mon, 12 May 2025 15:18:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEUvT-000845-CS
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 15:18:43 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 639e4a42-2f44-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 17:18:42 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ad2452e877aso274752266b.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 08:18:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197be656sm625041266b.127.2025.05.12.08.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 08:18:41 -0700 (PDT)
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
X-Inumbo-ID: 639e4a42-2f44-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747063122; x=1747667922; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fUpJg3iDtLKAgpJKRCZ+4fA5gkgvCqcGcbCcDERqGkY=;
        b=O5yU/AXntzsNLsBJPfA2smiGJ+toqoBSGpGIg+w4i/rfwQaVdnE8ZScqSAHgAvUyIS
         LxA0rmpZMlmc6rwNd2LL+otEfbQKxDDlO+LjTbnQxIGxKUd5TWPADwWJ/VbVOUp9b5iQ
         1sqMNtQRrtyDz2/qn+59s+9xQ0Q0Vbm/WIeBk3XbO1uTyTp+XOVz5XoQkMhHuqfBktfW
         Sme2haUFG7Iw+m/oESIgXsSaeVCwtBIxPzjm02splGqBTDVPbFDGDj/jyxuvrZo4Lh2U
         H5yr1K+I+b0MF3bFO2TxfHcRl8KVd2JKLhB3+VUucwGTAAapQQNbPnbi0iEnzH/uJkuX
         2sJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747063122; x=1747667922;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUpJg3iDtLKAgpJKRCZ+4fA5gkgvCqcGcbCcDERqGkY=;
        b=Xe9cfWnz7yOfT7sbIQWUNeX6HV964enDB2yMQPYclz7cV+bcnF4GAkmHyrqlcRYtGa
         K1wg+L68I/UWNzvuVFuYlR5JH/oo0tqe7pUtZsooNFfpkUEQXs3hWHSYbuNjPzZVPOw8
         b/CQSExaRMX4Fe7Qf1UPBkHULjz17WoGpWN58myjanqUajboV6dh+tuSf/6mFgmZXtn/
         AcLsK9A8iarrveYEsQV8PJMMWOyaz8vbIuPQQ27R0zmmvLhnQcgNGiB8BqVboPQ2g0wd
         XHGAmR+/wcrBEvR3zJMa9TbU1VGK5hMUowE4/txAy1VIGQ6krZYaiNSNgp7ABxn4kals
         4QaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKRbhEtRDH4y1F8zUmvfjeMoh7msSzlZkPXa9FKC4v7hPGAnIJLEbsfe4xB2Y3SoJm605atfwykoQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrpyMEy31LQumA4jpuU8SGMmD/4u+bE7o7rvquf4JgkSTGnpdw
	/10rmrsE/HImLUBUFwaUXcs3qmWSnUgmlFjYs1Ge4NLXor98i2cmC1njeY63Cg==
X-Gm-Gg: ASbGncu9tb65fTMdxaM+eaKLlfa+ipVJEP6WPNE6DlaDXmrwCqCgeARjix7ab1oXRv4
	yn59lUQThX8ETPY27YienuCm1+ngjsYIvEbnDgkpe+1Ek7VKrwFIqZswhnxr4w1OiXiFEmSwrT6
	R1yO7VJQRcY9wBglmUINZb2pw74lj9hg8O7VLzYzGmWVI2+fUlMfpXUyWNYiAkgjR/4ofbCFrLp
	ko418BfXr25cxgepbQ4o9bVGcais719WVnjfO6/nH0+9h3D/s09CycwadGpoCedwwLxyJs1emX2
	clQo60F4iD08IL+GoW67ZH/LlBzwKHY6jIccwQsAz/JGPHRiY6w2PPHnEn34ZZxu5VOJ/n2BM8q
	2louK/xL2ko6/7sRdfPDqW3MYx5YjbDAbmB8F
X-Google-Smtp-Source: AGHT+IHd2k4msB0DofIG5f0ThGTdHRlto2SIRi4HnVJBGDXAmo/CxDaAxwdGIQ54zgGQu5ZX1gYIZg==
X-Received: by 2002:a17:907:7f9e:b0:ad2:411b:589e with SMTP id a640c23a62f3a-ad2411b5dbbmr871077466b.43.1747063121952;
        Mon, 12 May 2025 08:18:41 -0700 (PDT)
Message-ID: <3abf6813-d251-4672-838b-af01a05c84d4@suse.com>
Date: Mon, 12 May 2025 17:18:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/Kconfig: Improve help test for speculative options
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250508160336.2232152-1-andrew.cooper3@citrix.com>
 <18f73078-c512-416b-9406-c76f8db178eb@suse.com>
 <63652356-4b82-401f-a6ba-8eb53b2f8317@citrix.com>
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
In-Reply-To: <63652356-4b82-401f-a6ba-8eb53b2f8317@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.05.2025 16:58, Andrew Cooper wrote:
> On 12/05/2025 11:58 am, Jan Beulich wrote:
>> On 08.05.2025 18:03, Andrew Cooper wrote:
>>> The text for CONFIG_INDIRECT_THUNK isn't really correct, and was already stale
>>> by the time speculative vulnerabilities hit the headlines in 2018.  It is
>>> specifically an out-of-line-ing mechansim, and repoline is one of several
>>> safety sequences used.
>>>
>>> Some of this boilerplate has been copied into all other options, and isn't
>>> interesting for the target audience given that they're all in a "Speculative
>>> Hardning" menu.
>>>
>>> Reword it to be more concise.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>> CC: Michal Orzel <michal.orzel@amd.com>
>>> CC: Jan Beulich <jbeulich@suse.com>
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>
>>> CONFIG_SPECULATIVE_HARDEN_BRANCH really ought to be named
>>> CONFIG_SPECULATIVE_HARDEN_CONDITIONAL, but this would be a (minor) functional
>>> change.
>> Hmm, so you're suggesting all the straight-line speculation changes then ought
>> to be conditional upon a separate, new Kconfig control? So far I've keyed them
>> all to this one.
> 
> Straight line speculation is complicated in multiple ways, and our
> understanding has evolved over time.
> 
> I'd forgotten that we grouped it with HARDEN_BRANCH, and it is not an
> ideal grouping.  What we have in the way of SLS protections are token at
> best.
> 
> First, in light of Branch Type Confusion on Fam17h processors, where any
> instruction can manifest as a speculative branch, there's nothing that
> can be done.  (This was demonstrated rather more thoroughly with SRSO
> than BTC.)
> 
> There is straight line decode (at least) through any branch the
> predictor doesn't know about.  Only "taken branches" get tracked, but
> also you get a higher rate of SLS immediately after leaving userspace
> for a long time (such that the branch predictor fully lost supervisor
> state).  Again, this is inherent and we cannot control it.
> 
> Intel say that a branch type mismatch (for a direct branch) will halt at
> decode.  Indirect branches are documented to potentially suffer SLS. 
> AMD Fam19h say that any branch type mismatch will halt at decode.  Also,
> with AMD IBRS, indirect branches stall dispatch until they execute.
> 
> 
> Therefore, it's indirect branches which are of most concern.
> 
> Putting an INT3 after any unconditional JMP *ind is easy.  Compilers
> even support doing this.  CALL *ind on the other hand has architectural
> execution beyond it, so if protection is needed, LFENCE is the only option.

Is it valid to summarize your reply as "throw away any SLS patches you have"?

Jan


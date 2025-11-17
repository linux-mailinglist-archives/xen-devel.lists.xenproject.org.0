Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B681BC63520
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 10:47:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163570.1490655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKvpf-0003aV-UZ; Mon, 17 Nov 2025 09:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163570.1490655; Mon, 17 Nov 2025 09:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKvpf-0003Y3-Rb; Mon, 17 Nov 2025 09:47:35 +0000
Received: by outflank-mailman (input) for mailman id 1163570;
 Mon, 17 Nov 2025 09:47:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vKvpe-0003Xx-MI
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 09:47:34 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fa927f4-c39a-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 10:47:31 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b73161849e1so699450666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 01:47:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fda97dbsm1025202466b.59.2025.11.17.01.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 01:47:30 -0800 (PST)
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
X-Inumbo-ID: 6fa927f4-c39a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763372851; x=1763977651; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WZsrpAZ13hbraJZ3AH/wHfX5ef/668cAcJsEKpAAW5w=;
        b=VaDZ8WvI/0Z3DoNxCtqRvD50XE9ugF9NrcMKRtwZy7PUHkiDKLNzUlCzTk/Y5g4YuB
         /jgSKFnpzEMFgeVi5aXabiOTXNVbQKhjGo3TxFir4OeFPlp4ztmx2Ds5GCiKwtLtCQzY
         hbYCaaVYNM2xizuPiLNhg7nsl3DlPPlOG/s2YPryp7vQf/MV69PnB/0YOjuUA14zEkrx
         qhC9l8ycI+MCGJXlTPYif6wMT8LvRuWXdQnAHBjfA98i3ULpCNR1VuFChspDa4H7Fsy7
         +8YE626fvwROuJ9M9np2ukSUprMjlV+oekAwVc6qVSyHYXTm2vH/vxGLHHmaTg0rv0PE
         0mUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763372851; x=1763977651;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZsrpAZ13hbraJZ3AH/wHfX5ef/668cAcJsEKpAAW5w=;
        b=MnYCVMnR/H9l3IyAdZ/gG63CHabWwUtmJZSbrECpcBTgtNEYob5pgoWWxwZe0QCHSG
         FEN0Q77rSIsj8fbT4a77chgQ4NLgBhGMe/2wX3pMN6n0BXTbnfXPRwOtyua7EzbJ8NP3
         5wuQt9K25ecc3vjHE6o7fGs5gWut6OIAQ3m2E3h99Hh9ilkdj83LAu0bXJ5Iw9crYyLM
         oW3r2Xgvzi+5wr4UpXN313C0xyhx0sC6FY2LbKh/7X6bKfB/fczTZL/+EoKoLRzrhEma
         zOb848THf9/OexUyigCJZlyxp98YuhM5/GQHoZXpTuXAgZfz8AzWB9L7UfdPFHh2vZNE
         P7eg==
X-Forwarded-Encrypted: i=1; AJvYcCV47ZDNE1mzjJAk5YJ0i50HyQBqYxPA0ca1GP2SZsQ8Ltp/062l5uIFlAgbnSoC8cNBjmEIvPKXmG4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLVfGgFteB+4LFMib0gO1V83evbFMVFGV/suI98AXGYghjCcxO
	e6A316ADM9lpPOfEaC2Tt+1Ef/OrS7Ty/Iu20RaADdJUtxhgeQZJN9dPWfyF3ADrrw==
X-Gm-Gg: ASbGncvyfidtU8MrkCjEx9LKtqmeiXAaC6MwBG8RtPr6rlzAqNOnfqeViRFYmIPW18g
	n7OsDe3AGQDxaAcXOkR9qMHrQHpb0+CoDAy3PqOr07/AoVKXGSWo2n8WD2Y79a5ex4ZyiIlFrUV
	gmAtLNG/kNpxWNVsr5Fe+kNHq81rsQww1BPJQbLnbXb+PonYdqNrDEUCs4m0gblW+WBLOlu+Uvy
	WhwkCc1HtAriL6aVaCT0/AGUr77xWlrUNngUXM2FEZ0NjQWhSEpOl1/5odb3AC4zBE0iC4vw+Am
	Hzf/gYLWSRd+0LFWY9TE8ln6NyjwAttCtJZ4PZB8jJbIQwgBstG9eCk/teFL4c8aca0rwqxmkyn
	W1K5QNmfMUbDaZInj/87kIivayWyWQWhGoH3aC7ptJQYXMexYPBPNF6ddjthqbDtSY93gwqVP37
	EiBI7LpUs5+5LsEu1EgsG5jLQOJLFBgbz9B3LG/ViXEvoqyYsOFwyZBZjCo0epUXjR
X-Google-Smtp-Source: AGHT+IEcekI1Lshl1bgm/QAO1VzCtd7+Xt3U160X2plU7dqChwIlgH4nh+Da8045O5+rj88L+ZHNLw==
X-Received: by 2002:a17:906:f589:b0:b72:70ad:b8f0 with SMTP id a640c23a62f3a-b73678f4b98mr1209869066b.36.1763372850943;
        Mon, 17 Nov 2025 01:47:30 -0800 (PST)
Message-ID: <547ea289-2dab-4047-af89-b5227c2f4936@suse.com>
Date: Mon, 17 Nov 2025 10:47:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/paging: replace !paging_mode_hap() with
 paging_mode_shadow()
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251114144454.287224-1-grygorii_strashko@epam.com>
 <a34a7aa7-53da-4925-8428-cc20e1135f7f@amd.com>
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
In-Reply-To: <a34a7aa7-53da-4925-8428-cc20e1135f7f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.11.2025 00:21, Jason Andryuk wrote:
> On 2025-11-14 09:44, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Now Xen supports only two paging modes: HAP and SHADOW, so
>> !paging_mode_hap() is actually means paging_mode_shadow().

For HVM, that is. For PV both could produce "false". Luckily the code
changes are all in line with that, but somewhere this detail wants
mentioning imo (as it's also not part of the patch subject). Happy to
make a small adjustment while committing; then ...

>> For an abstract, future case of there being a 3rd paging mode it is also
>> better to explicitly mention checked paging mode (SHADOW) instead of using
>> negative check of another paging mode (HAP).
>>
>> Hence, s/!paging_mode_hap()/paging_mode_shadow() which also allows DCE drop
>> unused code when SHADOW_PAGING=n.
>> The !paging_mode_hap() in hap.c not changed as HAP is checking for itself
>> to be enabled.
>>
>> Inspired by [1].
>>
>> [1] https://patchwork.kernel.org/project/xen-devel/patch/20251111200958.3576341-3-grygorii_strashko@epam.com/
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


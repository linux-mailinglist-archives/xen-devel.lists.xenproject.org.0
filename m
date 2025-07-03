Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E38EAF720A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 13:25:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032060.1405819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXI3a-0003yH-G4; Thu, 03 Jul 2025 11:24:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032060.1405819; Thu, 03 Jul 2025 11:24:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXI3a-0003wN-Bs; Thu, 03 Jul 2025 11:24:46 +0000
Received: by outflank-mailman (input) for mailman id 1032060;
 Thu, 03 Jul 2025 11:24:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lE7m=ZQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXI3Y-0003wH-OU
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 11:24:44 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50aef73e-5800-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 13:24:42 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-453608ed113so57380085e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 04:24:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2e258csm162446045ad.38.2025.07.03.04.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 04:24:41 -0700 (PDT)
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
X-Inumbo-ID: 50aef73e-5800-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751541882; x=1752146682; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ4fQYYhY2WNWBW9jgtBDJxWEzs3fd152ZeG1tX6o9Y=;
        b=b2fjTu0VeJU6KxuZ2OXcAMLthlMtIx6U8zHGgrAKoMrwFHP0Szzb74CavX9DISRbxL
         JELjOCl3bmiAjhmgK0IKa2JBcrccVCQ7MU2ErCODHTN298bKXvMDt+L8NCnFzPms2+Jy
         /3/xH4Q2Tz2otkGrmIUBOzjJoRPMoowDJEjRSTT3wWpEELBGSvnkh70aEU7IzAxaFoCk
         Xc7XneCWHc4eyXqCw7NkUVtzc2Ta1d3ty2dhDA/5AUQkoevc+b4ubS+swwm1IfOtTJJg
         YaYmbvWjALQ2eUg+IqQ93F5kLGFiMvG0Wn0f46kisJSkdaw6w7HwLV5wlPNTCXfBjywF
         R+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751541882; x=1752146682;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZ4fQYYhY2WNWBW9jgtBDJxWEzs3fd152ZeG1tX6o9Y=;
        b=xMh1PhQYRLiBvrG2SPqMBbsGeVkxK+2/r18P60I7UhEjiRZpCZXQ6vpWpfdFh9IXKk
         Ds/PHeOyaSk+OE1OH1Vbwp8/KITMb5UCt3zWzXT6+rN0zlZ0fD6KfBf2+5ADTscVO64c
         sYQwsnElqvB+mU+c891DH4sh1r6ha3zNr6hYA0vY2TnxtjBJneylUFJjM1Zy/Ni1CJ7m
         xhoxfwvJsHFOOCtjq0noDWlcNOrywHyH0vZpHEtSPYqaY2uypoqNldDs0rutC5qELLZ5
         xwO6kv170GdGGmicDNzTflmwLDw68WiFRtcbEEMTtTgM4C0UvSoMTMu02zPAmRCQ2cRi
         KFSw==
X-Forwarded-Encrypted: i=1; AJvYcCVL/fVAC57+/DVip21IsCldyp2aLviVrdFL/oDyXyMoMVw/NxB86eoDoTgGsTblfhwRR7d0x0R5l+Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6IjsqMHrToleLKFvvpDXz8ZZU1kO17ZwCPcQCqs++kLLwyQh1
	EARPFD5yr4IbhrKmzRUBASxKFygxLnI993AaoFRfNhQu5DKEza1b2mj7ELAT6ZOVOA==
X-Gm-Gg: ASbGncufHP/b7lrmPPbIQMyHQaC55XCgeMYXO70Re4SoR7gI7qCdk30XXD+f5P2W3iS
	xJvM+7GQ/Zi1nhmKyGmpJSShNpAGMaWoUxFQyyijZ2hIUnP1TPfnjvJ/FtXouZFLYL2/UBEyIEF
	pSbrkgRdlU812l2OqVi+swxUkiBKIT0ICCslox1nY5akTIZHPgxVZND5fzoeCu8BaXVN6TPKAH2
	Fn92uWdNDKLHHO21550ZQEMLbAIhk8m1thaniUr5Yt3SGUwksRHJdrIcBt3tuxGeyZmQtBW9xuV
	Anxj32NjTp00hyWuM+kJVATPUqoP57SVIGqlXmZ7SOhymerZyk+L0qLAYeuwb4RgvJI5Ct4qks5
	Nz2701IwXAq6o6T2jxKgILY1kQcB4GzvCQ08JM6vxQVBOCZA=
X-Google-Smtp-Source: AGHT+IFT5O8EVfvV1Qf8m9O59zN7RivE4XLDZ6btciwaqrpe5aQH2+/9iwvJNK+KqmrQhQtQ4J9vxA==
X-Received: by 2002:adf:e184:0:b0:3a5:2ef8:34f0 with SMTP id ffacd0b85a97d-3b32c0a18a9mr2488331f8f.22.1751541882008;
        Thu, 03 Jul 2025 04:24:42 -0700 (PDT)
Message-ID: <5c864856-688a-4407-b79c-1bd1b0124506@suse.com>
Date: Thu, 3 Jul 2025 13:24:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] xen/softirq: Rework arch_skip_send_event_check() into
 arch_pend_softirq()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-4-andrew.cooper3@citrix.com>
 <7789a13c-04ba-4ad4-8df0-59fe82512e40@suse.com>
 <56566ac7-7bc7-4908-a755-5e9a9071f096@citrix.com>
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
In-Reply-To: <56566ac7-7bc7-4908-a755-5e9a9071f096@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.07.2025 12:36, Andrew Cooper wrote:
> On 03/07/2025 9:11 am, Jan Beulich wrote:
>> On 02.07.2025 16:41, Andrew Cooper wrote:
>>> x86 is the only architecture wanting an optimisation here, but the
>>> test_and_set_bit() is a store into the monitored line
>> Which is intentional aiui, while this reads as if this was part of the issue.
> 
> I don't understand what you're trying to say.

What I was trying to say is the way you wrote it to me it read as if you're
describing two issues: There wrongly being a store into the monitored line,
and ...

> It is racy, and that's why we're changing it.
> 
>>> and is racy with determining whether an IPI can be skipped.

... there being a race.

>> Racy here as in limiting the effect of the optimization, but not affecting
>> correctness aiui: If the woken CPU managed to clear the bit already, we'd
>> needlessly IPI it.
> 
> Correct.
> 
>>  This could also do with saying.
> 
> What about this?
> 
> x86 is the only architecture wanting an optimisation here, but the
> test_and_set_bit() is a store into the monitored line (i.e. will wake up
> the target) and, prior to the removal of the broken IPI-elision
> algorithm, was racy, causing unnecessary IPIs to be sent.
> 
> To do this in a race-free way, the store to the monited line needs to
> also sample the status of the target in one atomic action.  Implement a
> new arch helper with different semantics; to make the softirq pending
> and decide about IPIs together.  For now, implement the default helper. 
> It will be overridden by x86 in a subsequent change.

Better, yes. Thanks.

Jan


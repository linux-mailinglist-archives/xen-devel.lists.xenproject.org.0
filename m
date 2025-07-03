Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0206BAF6C85
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 10:12:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031796.1405530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXF2g-0003Ny-Rf; Thu, 03 Jul 2025 08:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031796.1405530; Thu, 03 Jul 2025 08:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXF2g-0003M7-O9; Thu, 03 Jul 2025 08:11:38 +0000
Received: by outflank-mailman (input) for mailman id 1031796;
 Thu, 03 Jul 2025 08:11:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lE7m=ZQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXF2f-0003M1-AJ
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 08:11:37 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 557ca496-57e5-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 10:11:34 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-453066fad06so52623995e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 01:11:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31a9cc4a419sm1704584a91.9.2025.07.03.01.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 01:11:33 -0700 (PDT)
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
X-Inumbo-ID: 557ca496-57e5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751530294; x=1752135094; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MOtjWycJ0LFHuZ/qlkzok3lRt5JNAWv/INQjgOoqQlk=;
        b=YUfcDcd4qKe6I59nsKKmj4l89fYDWCaL46tYc1GGPWYBHOGEnDT6X3Dx7mjcyXLWm4
         PkzC0r0JB54jpnYLTnCRsNErgmDelltoeOV6Pg4+c9k1mCmvggQ5jEeRKBCaEfXzNZsc
         L69F600BNBYrpkVTZdQyMX5X7mHAsiZC79oa2V6y8jKaylM8d7DNS/ow2DZb6PeHvD7g
         g+h86LTA/Y8ztb+ulwAI3hKk38Ny3vwwtwxdQF8s4tVK5Ka67fRPOCX+sjseowW0syh/
         piypoTrt1Cv0HIAUuQ60odq/W3gzLXIzhZO31FWONsFf1sCo7vcdLx1/bywcfFj6h9ny
         SeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751530294; x=1752135094;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOtjWycJ0LFHuZ/qlkzok3lRt5JNAWv/INQjgOoqQlk=;
        b=EjfTW9TN93p0VGqX+5dpP+fhTkqyCLuBYf69T1yXaseje0UinjW36z5BV3k1FIzk+d
         MID9vTguMeZnIFytlPxqAQ3V9M0vNcY5HUZhirynLAACcns83++3kCgBCLv4w0tL7H30
         DEZnfPuCuvWtCCUZQalG7gT+JPnFF5tcTmScqe2hAl2Fnf1dVU12UTdMS+hpnWHMEYJX
         yDbmMHk6lolwCM2kUarparETxRrghvK5v7EuaWMLrQ6qM73xbQF1gl5ZZ1k5HlATOa9s
         GhnLiV/P+ynpB6CQjhoR0m+dnVmbIQ2hfjRH4SzMdRb2NdiG49J8uciUxSeQsWevTLHb
         EO/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUuPl8C5NvaIvAjbQmfRxRrqioFYxaeqkmi0j1Gmuuabtkh8D7xqnsiKUVcDvZxKOall1RPbCMVai4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5HoQTiz5VF3qaCN4KUhVMwhtIdM3IPScotmwF2Bm3V4D+VAAt
	sX7wVsjqcWqxlhfNVnIYk7MCu+XtSoAP9dmhoAizzKb9iBX1QrbL9nMO7FHQWO8j2g==
X-Gm-Gg: ASbGnctIJqf+hsBfFPy+HLBp7iYNsdIQ5464Xvp68JCZqy8zlMzy9MUGJLPTErlLScu
	C5lasi368fJM3TuPMHQvhSObiyMx+RB5CC3xwLvAMw9iehqoqPD/SQrofUlU2C8FVaaKq4vgCjo
	CAXgFrYhm3Am8A1ucrssXKefnvP2Al0nGpN0Wj3g2VhcA8XOD99RlC+AlklKIUkcYESxybygfLE
	CVXM6NGE449ULdAdFUeR34MOek43CFVCer7m/ybXbJLy3QQqrKyOoDalJGJroRQERMyK4tMw9+S
	4WFTtuX19WuwIBclUa+D0zovDRkLSdfbAiI5XoI0eq7WqAB2YFnwmBftey5/02vJEkQxz/Qq2p5
	EEVQUqt2Hd/9BqZtouARi5Yd79HGEgVji84//KeWk0Mo2AOw=
X-Google-Smtp-Source: AGHT+IELTpx8CbEOn3M2yZnyg5IiXf/Xs8paqRO9Tx02V6vHCdcSKkRUSdrL6nqUiw9t7T64xQCHbA==
X-Received: by 2002:a5d:5f82:0:b0:3b3:a6c2:1a10 with SMTP id ffacd0b85a97d-3b3a6c21a61mr662548f8f.12.1751530293597;
        Thu, 03 Jul 2025 01:11:33 -0700 (PDT)
Message-ID: <7789a13c-04ba-4ad4-8df0-59fe82512e40@suse.com>
Date: Thu, 3 Jul 2025 10:11:23 +0200
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
In-Reply-To: <20250702144121.1096448-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2025 16:41, Andrew Cooper wrote:
> x86 is the only architecture wanting an optimisation here, but the
> test_and_set_bit() is a store into the monitored line

Which is intentional aiui, while this reads as if this was part of the issue.

> and is racy with determining whether an IPI can be skipped.

Racy here as in limiting the effect of the optimization, but not affecting
correctness aiui: If the woken CPU managed to clear the bit already, we'd
needlessly IPI it. This could also do with saying.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8B0B087DE
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 10:27:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046371.1416679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucJx2-0000Ww-8s; Thu, 17 Jul 2025 08:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046371.1416679; Thu, 17 Jul 2025 08:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucJx2-0000VM-6E; Thu, 17 Jul 2025 08:26:48 +0000
Received: by outflank-mailman (input) for mailman id 1046371;
 Thu, 17 Jul 2025 08:26:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucJx1-0000Ut-GP
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 08:26:47 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6157ce1-62e7-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 10:26:45 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso556874f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 01:26:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f8b990sm15683931b3a.153.2025.07.17.01.26.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 01:26:43 -0700 (PDT)
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
X-Inumbo-ID: c6157ce1-62e7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752740804; x=1753345604; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DXhRp8KXiBqNonRxcdMfvWUKWHz5PtQ1TAg3lKcIxcc=;
        b=bXqMacDUEQfHBBZqHzKP4CHO1WHId+skoYjYystGKe6FL1EkNKu+U6OZo5+ySdBrnL
         lJlU7hj3hXls9CUuDmmB0R1wtj9bSCsxpUFHGZxa4CGg0dMxpgXxIg60BAf5YLMiVMeU
         x7yeznmU2EUw7Xs4/5bSjcCZJuFcEJsjO/uYVVMbTr70JuLlLNCNWweynJwcbUtf9pbg
         GV4C1KDu+bNf9zNyNeaqIuBOSUdMg+5Q7bKJhFj5ckmYYhi6jB+uy34MViCEh7J4mHLX
         sUWq+SvAJAIQDaxu07TMCagFWXdwbw/AaLCUqIwwWpoMdXxpkkwmMzF4yn2VUY1bpmF2
         CNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752740804; x=1753345604;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXhRp8KXiBqNonRxcdMfvWUKWHz5PtQ1TAg3lKcIxcc=;
        b=KLYZG6229S4q7py2Q4F09gb1Src+s+OFuOzxc21vMPsf45k3nTdj57iSKXgV5Wb4tW
         BrfbW8SWUnoNYmoavnmugkSZ9zx53wNd2mN3mslVPGp4uuifg/zeBZ9uP00Iq7lfDYiR
         VfE1LC0mU8Khkto1y5ZIJd775j6Gi8nJhi59rO+1S4dlkvIn6vc/vRCM34JEOYnDqdtd
         838FQkCQE725Xv1tmcBl+2fnsKUIPG+Zl1jdTF2rOZh4xQVRsah5IBBGR0DudDebU2SJ
         jXOJpq2lO5R8lEJKgyjavfDV+gVWUseW+VHl4ntIYGHsWEDf0x8iiIOAfVNmcpF5wp55
         BOPA==
X-Forwarded-Encrypted: i=1; AJvYcCUDKzKbjaSNboxu7pyvFmAX+Hxea+NUy5DJbnaZ18SD7yrB2L73jdCImYoq4sfZNk5iPeQtEJJRlzQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfF4GzRm53IgslTe3srZd4jtzSxdLZR+EusaY5sLn1JKMrMDCk
	s/TGB6HAwBsQQ5GaAM/GnyTTnM6Iw+sFFkMocnXrdtpxsylRxbCNqcwOr7BtBfYj9w==
X-Gm-Gg: ASbGncv/BAcwaiUax3dr23nnHbFUgrA+5WbbvqR6SjKA7vNpLxDXP7fFjCLPUMi1pIn
	Yp2VSgTUaQRaFU8IrBQVP6QWP8LdyBTKBQI0sFAb82YEERc4g4NS3Z6oc5yXXz0xTLcvWQWCUC0
	T14ojgFHrRBjdO7dp+EZvX+Tvgry52X2wi5+gzuxzPjAWHFYLXOL4zf6w5YQGSwtrwn2WYNSd8l
	psKwyX0Rjg8UfAz2cbzPUkpQQ5r+4fusHrVDi/kYwYg0Mq/T9fFNuuzWdeP3OE2HDUC2NKkfmt3
	KpGlFe/a5/gyPgE1gEI/vJimV6MYj9nqaUrIf52zqBN27dvjANiPOpomdgUJtI4bX53X5734EUJ
	F5aR7M5ml7HEkPekT7Ml858aBOr2R8/grwjJfWc9EgeKOXOiwVjOwJiAfezL5izYKsmm8EUtol4
	tjTXZD4fg=
X-Google-Smtp-Source: AGHT+IEi4rvdIdfQ9QVhpu0ZIuSMiLXf5+zLK3dmxsweA8Km09FUucF6kkVCXKrmFqg6CsTRIbaUQA==
X-Received: by 2002:a05:6000:2a83:b0:3a5:2923:8006 with SMTP id ffacd0b85a97d-3b60dd54d6fmr4323063f8f.25.1752740804390;
        Thu, 17 Jul 2025 01:26:44 -0700 (PDT)
Message-ID: <c057b1a5-ebcc-4691-affa-3a32ebf637ec@suse.com>
Date: Thu, 17 Jul 2025 10:26:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] x86/apic: Convert the TSC deadline errata table to
 X86_MATCH_*()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
 <20250716173132.2213891-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250716173132.2213891-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2025 19:31, Andrew Cooper wrote:
> With the ability to match on steppings, introduce a new X86_MATCH_VFMS()
> helper to match a specific stepping, and use it to rework deadline_match[].

I'm fine with the patch in principle, but I wonder how you envision to support
a match for multiple steppings in one go then. In particular macro-naming-wise.

Jan


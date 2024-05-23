Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A286F8CD78C
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 17:46:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728715.1133744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAAe3-00075X-Tm; Thu, 23 May 2024 15:46:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728715.1133744; Thu, 23 May 2024 15:46:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAAe3-00072L-Qj; Thu, 23 May 2024 15:46:19 +0000
Received: by outflank-mailman (input) for mailman id 728715;
 Thu, 23 May 2024 15:46:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sAAe2-00072D-W2
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 15:46:18 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9758d6d4-191b-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 17:46:16 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-51ffff16400so12682511e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 08:46:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a615e5c1a3asm630681466b.71.2024.05.23.08.46.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 08:46:15 -0700 (PDT)
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
X-Inumbo-ID: 9758d6d4-191b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716479176; x=1717083976; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wSex4tW73EOoQHbkuY5EKgDSGJZy0tnN7GO8Ad/mpCo=;
        b=J6r6NBL4t1pHWSTAw0HBcTpncF6bbO6FQNJzJ5fAe3//C0lb1Rah2uqo2JAxpqAhpk
         logFKN4zq2Abc99ykyxuAISkxSA7lNkzvDRI3Uzf+eL6NKiojmzeV/h9zGSTEUkQuK5Q
         B05TEaI/PvJhTgt/PAJJt+AutoYDht3XslO+zYoOyT3cOYBbZHDBwYG3nQwDe8WsLQZ6
         2aMNiPaMyLWgZT3ijnTFIG4WOD62LL+qOLlwHPCYjV0zwU5pyDeJcd7lG1BUC44AVDAP
         MpVN6MO+b3QvePPnm3mVhBzAhtpDF0ggChLPNbMxg4fLD0g3bxvACNgsVlULbnjus7jA
         /cDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716479176; x=1717083976;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wSex4tW73EOoQHbkuY5EKgDSGJZy0tnN7GO8Ad/mpCo=;
        b=BrlSiBaBrdbKOFoezla5daTY7kdo/dAEtLQiQSdnHraHyIFuA+Ykxb5JtieXeyt8nS
         AR74ohFQlqHG/tXUQq+8E5Y4x+U+6tMoqLFDvZieREsVFnZ0w/JmObir/5NNtNex/lIS
         LLrAMd0iO9z3w2OmHIaLYyRoWSEcajS0A0jYiZd43L57KwGRwCDgSiEGedHibsLZP11u
         JmKPtoVwbpBYBUMbZaOhfPz/d2pQ8YkvRY9zdWm1u9IAfW1wxu3YdUgGCDL/yQyhCY0m
         qen3YEzB86J3Pdb9uJMWIUPq1/9o5eUtrE/FXo0UNwXrlOEi+F1xEnAsPZv3ZkLlKPlN
         VLdg==
X-Forwarded-Encrypted: i=1; AJvYcCVLxiJ++h92cJwGC3XEApF9XkGg0rq0uFaYmfHFW2OjGMM3siAkWOanyAhce2VsrLoy5h1BpyRkSoKsnlKQ7wcJMefl0jx/q51STd4SyFs=
X-Gm-Message-State: AOJu0Yy4/JhXVwMWe1XqBhCWj+46aVcq8nWNu8U7dPziZbcRtdoiMbDT
	6ZQCBsbBQ1MzRkiJg5LQsK3bXlVR6OGRR8Tt81DwbY5cgCWPx8TuTMH4qqYhdA==
X-Google-Smtp-Source: AGHT+IHfvuApfkEzAjad5SVRK28ZVnnHSaMw6C1K+wkiIH+IaoG/f4l4fGxbbgAH8hxbCk8oi5phuQ==
X-Received: by 2002:ac2:44ca:0:b0:51d:2af8:2e7b with SMTP id 2adb3069b0e04-526c1213fd4mr4400797e87.57.1716479176135;
        Thu, 23 May 2024 08:46:16 -0700 (PDT)
Message-ID: <d67f13f3-ac3e-4f2c-8195-39c87c753547@suse.com>
Date: Thu, 23 May 2024 17:46:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] x86/defns: Clean up X86_{XCR0,XSS}_* constants
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240523111627.28896-1-andrew.cooper3@citrix.com>
 <20240523111627.28896-8-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240523111627.28896-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.05.2024 13:16, Andrew Cooper wrote:
> With the exception of one case in read_bndcfgu() which can use ilog2(),
> the *_POS defines are unused.
> 
> X86_XCR0_X87 is the name used by both the SDM and APM, rather than
> X86_XCR0_FP.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>




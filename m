Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31368A25FFC
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 17:29:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880842.1290931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezKJ-0008W7-JU; Mon, 03 Feb 2025 16:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880842.1290931; Mon, 03 Feb 2025 16:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezKJ-0008TZ-GE; Mon, 03 Feb 2025 16:29:35 +0000
Received: by outflank-mailman (input) for mailman id 880842;
 Mon, 03 Feb 2025 16:29:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tezKI-0008TT-76
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 16:29:34 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cbbf165-e24c-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 17:29:33 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ab69bba49e2so697477766b.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 08:29:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e49ffd4dsm788945366b.91.2025.02.03.08.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 08:29:32 -0800 (PST)
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
X-Inumbo-ID: 0cbbf165-e24c-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738600173; x=1739204973; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hUPfQOe3yxSx1BdVSEGajOQrhld3vUU6nO4co9Op0/w=;
        b=Hd4F1VrrtRBCj09scExsxvoiGBxEBBZGbPAc7svUFCNK+kbFYQBt7x1sH02HU+tvVN
         NZJm9Rh5vLk2OIV6uF2hkSomWbshCX6hNn7QwhNdMEg5aeIDt2hSDnrlxz1pt2y/j5Er
         tRX/r4eVCS9EBqiPmfeZV2Aepe8ZgI4CbjdMplb+2FTdrH+bV0XSArOxOaD3DxxT0kTk
         PnzojfIxJgCOOo53EgJhXrRsQOpBKR5OPuuxo6+h+56j97tu9aMSRUWLGBGfpO2163q6
         N15v9EMGQT4G5JR59vfmiLuY1ahCasgC8dlsFb7w4a2scLInG1eLXATGPIftHk4MO7gr
         kObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600173; x=1739204973;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUPfQOe3yxSx1BdVSEGajOQrhld3vUU6nO4co9Op0/w=;
        b=Rpmc+/oXmR76XlqQiuNOacACO7f1AvKs4Re8qPsebkl3yGnO05qlWsvTHg+WYlTEyT
         5dqKIm2FT1lp0VhsMCLL5tjUmHPlXZC4oyFlCV30bhFep9HOyBQDz+EW4ff+093FTOKO
         T8X6mBzrja7Jsft9wBNvrEfA93zPc3exWluzMvfFue8Z1ZFhpmD+LWJl1naiWY22XXwf
         Hx1MFhityk9XXfB+w0hZCAKUU+nYeUZJg8xILo9zBtwKVkHDt8ZcHBvBxyv+7BvvsUDi
         n2Ohb2VQswP7aF6N26ldeWAcuDz4y/mItr/LNZ9H6IJTMCGhhqwuAYdj+lui3y7mUB16
         yo4Q==
X-Gm-Message-State: AOJu0YxQke1/2uwi7xw4sH1eOGKi6QRU6FeyFpiSl5nWmuhorGhJSkGd
	dXratalFTSZ40yI75HpR2u4sM33kDfG/AAflraB55ROWAXYrrErsm2X9+cMNlpFMIz3RAJvwCMc
	=
X-Gm-Gg: ASbGncuOWP+0UytNSTOUnzg1oqAEW9M0fNZBJzzlSuuCe2dq9p4n1CUcjIlnEGm3MRq
	a2VOMCm0bjO3odBSBkq/n6wPYQy2XfIla+yzv+Kn6GhhAUWrVQskQbyCtngzQHNpD+ShC7QpHk+
	IzpwLMYm5IJ7MKzP3+LKlG5567zuRhfN2gzp6uNnjKGidicfkjxjx8YxNWuGq5GvepXc9jh6jwH
	GGIdkbLCZIjRrBjfBaabCGA722Fui7v8lJa8scXPmNkFzvcx4kOvTWBuaDR262AcDsIafXG1mai
	LwP5jRlwfccuxC2BTMx1xcb5SO0XCVg6rE8WZg6q8Ac2JQWJFQmtVJgeiRJ+34Uyx76id9Xx/YC
	h
X-Google-Smtp-Source: AGHT+IGiSA4XeiAR8Qxb0bHQJvBFDtnYVQevqqUGDDQAZ1fOAL8klD1KHWEwsR4FvlOeOM/hLvFEbQ==
X-Received: by 2002:a05:6402:4016:b0:5dc:8f03:bb5b with SMTP id 4fb4d7f45d1cf-5dc8f03c0a0mr31076293a12.5.1738600172644;
        Mon, 03 Feb 2025 08:29:32 -0800 (PST)
Message-ID: <0648a806-900f-4014-8e4c-90e7fa5c8994@suse.com>
Date: Mon, 3 Feb 2025 17:29:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.20 3/6] radix-tree: purge node allocation
 override hooks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
 <3c571436-b678-49bc-938d-892913e0e96e@suse.com>
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
In-Reply-To: <3c571436-b678-49bc-938d-892913e0e96e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.02.2025 17:25, Jan Beulich wrote:
> These were needed by TMEM only, which is long gone. The Linux original
> doesn't have such either. This effectively reverts one of the "Other
> changes" from 8dc6738dbb3c ("Update radix-tree.[ch] from upstream Linux
> to gain RCU awareness").
> 
> Positive side effect: Two cf_check go away.
> 
> While there also convert xmalloc()+memset() to xzalloc(). (Don't convert
> to xvzalloc(), as that would require touching the freeing side, too.)
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I'm sorry, the question mark after for-4.20 was somehow lost in the
submission.

Jan


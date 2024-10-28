Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E51C19B31E6
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 14:41:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826561.1240852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5PzN-0005RS-BP; Mon, 28 Oct 2024 13:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826561.1240852; Mon, 28 Oct 2024 13:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5PzN-0005Oc-89; Mon, 28 Oct 2024 13:40:57 +0000
Received: by outflank-mailman (input) for mailman id 826561;
 Mon, 28 Oct 2024 13:40:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5PzL-0005OQ-I3
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 13:40:55 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40792013-9532-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 14:40:53 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4319399a411so30312385e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 06:40:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4318b567e23sm139392895e9.25.2024.10.28.06.40.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 06:40:52 -0700 (PDT)
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
X-Inumbo-ID: 40792013-9532-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730122853; x=1730727653; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ECG/gO1/GM6YEeGrmQMM5lNI5QIQZXUTvjpeaMRWSeU=;
        b=INeBC6KqQn1YzjSm8ZVx8l/4xFEUZeaQX9BeDHfcK7eqXPsbb7BqGByFvvqTM1DEPw
         +eXj99wYJuXtJu+KaNgLDvpeGSrVvBPqxAM5c6mqgjoY0otMOAaEM6p/YIMAmz8imZm8
         Z5eFmii0zcHHDft49fGyT9DtlBZnQYQoYmAHbuqrBn+xSHL84Da8CBRkcUj/p6gQG67X
         bGGEXugb/H02DKqeiu5kGAwMmWwGzAffo+6DE9sRm324jr+NcrHL2nO6KM8ApjSs+ZQS
         X0Q4Bj3uwcTRD6xA4n/757zt0c6RpYuxtxCNS1nO90uRDymTbMk9PcBMaskYZIxflSAb
         qMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730122853; x=1730727653;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECG/gO1/GM6YEeGrmQMM5lNI5QIQZXUTvjpeaMRWSeU=;
        b=vIa2CHUw142T446zCqUIBTUFCyrJl9F+PY9SlZm2PeniY6thKDJxgJY0UgkrS1ys5S
         fIiqPK22feNn9oMuzXBH59s0tvn5p6MNOu+p1rTCa30fJnu11fgrNFiAbo8qBmQEghSs
         3BLXukceDRH+DgeY80DNhYFBro1BDyQTU66zTe+EjAYo5JrQ7Gtt5rBeS+kD3AGD6xyf
         AO9V+Htfa7ocyyvOddmG6tmwU3OBaVUA2h5E9I9nxxPJxzbDFvgbmgilLkEDIl98nOht
         Ml7m0rdIHFEpJOSR3BxlVLrZV+C69dcFtlwiZgXhg63QkzkconWRGhMAYmob0TOXJZ5m
         VK5A==
X-Forwarded-Encrypted: i=1; AJvYcCVx87w1wzpZlwa3BdQLvk8nsUkQKSUtqTmQvQnVkBwWt2sd91NJojE0BenqMxtdzHYGgrTsB2ZhF44=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxh0l5fQQs2xvGjsoeMkwubDii6hgduYoa3E66b7tPAJM8ERGkx
	qKqAIj80dU19i50ILMTdAccUWKc66Z/Wl3Lc2wSBMfjqtSJNlWyUnD4NWdKjaA==
X-Google-Smtp-Source: AGHT+IEfvGKaICZpBSiWBUIA9rFsOU/Wm38McRSiMEfSi1sRMKzk45sb7nU7Pt92pg1b1lcstEvMoQ==
X-Received: by 2002:a05:600c:4a88:b0:431:9397:9ac9 with SMTP id 5b1f17b1804b1-431aa292eb4mr24212235e9.15.1730122852975;
        Mon, 28 Oct 2024 06:40:52 -0700 (PDT)
Message-ID: <3fbf3ae2-8937-4f0f-bca1-f3dd6df52b13@suse.com>
Date: Mon, 28 Oct 2024 14:40:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] x86/ucode: Break early_microcode_load() out of
 early_microcode_init()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241028091856.2151603-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.10.2024 10:18, Andrew Cooper wrote:
> microcode_grab_module() and early_microcode_update_cpu() are logically one
> task that passes state via static variables.
> 
> We intend to delete said static variables, so start by moving these functions
> out of early_microcode_init().
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I expect I'll see later how this actually helps.

Jan


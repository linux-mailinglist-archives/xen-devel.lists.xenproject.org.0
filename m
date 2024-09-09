Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D44E39718D3
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 13:59:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794374.1203264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snd3K-0007Tg-6b; Mon, 09 Sep 2024 11:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794374.1203264; Mon, 09 Sep 2024 11:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snd3K-0007RW-3b; Mon, 09 Sep 2024 11:59:30 +0000
Received: by outflank-mailman (input) for mailman id 794374;
 Mon, 09 Sep 2024 11:59:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snd3I-0007RO-Tb
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 11:59:28 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6606660-6ea2-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 13:59:27 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53568ffc525so5829476e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 04:59:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd8cc33sm2937234a12.87.2024.09.09.04.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 04:59:25 -0700 (PDT)
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
X-Inumbo-ID: f6606660-6ea2-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725883166; x=1726487966; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CRhcLn45M2TXyzi7uE6yyT89yCSVGqwR2aZGifur1lI=;
        b=HyDVCcw7lIPJeisPgIFLdAIrLLeixoQjjAY0zoAbNQN4gHDxeqie6SoUQboU0Yxg+L
         o23t+gocTdd/aynMoqjAEoD3Z9Ok+SNeEnGrTjcLgzZL+UH+NDttBZGAetksaXwyWUbP
         OBhqcUnpUiJEOFmCbVhg+Hk9MaWkXigWizvtWYEmYiqh+iCMEnybFhJo1ASe/UZzRKp0
         qPqIecrN/YamCNMONjMgdX9B9BKCXj7xC6ZvjBvajsgnPSVZUy4ccW0zI2TBgGEsgva/
         Qr1yrI/NtotQof1jUaygclpRfMpjhaAMJ5bBY/FmtiI86GUoGV6QYRWjj9RyNSQyWNcU
         L1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725883166; x=1726487966;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRhcLn45M2TXyzi7uE6yyT89yCSVGqwR2aZGifur1lI=;
        b=QvXHaI4pRNCVwu2Uhdgc5oFFlTpZZyzKA9TyrqriBWrWpzRO37MySnIN8LQqdHohan
         sHrZq/seg5Nn0YMMpAkM5Av2iBAJ0X5lTvL7xAXukcbkK8ORcIOBeQPCnYnHE/m5cHAS
         UwKgKWy/QNXjqy25G/P5Xc0h3DH1DfRW2+m7BOGa2k1vXfveGglRKisaxXdJxVvxrjdP
         EJx47a3Adi4OiHzs4hbFMgTTFHWYEsIyXBzuQkB4WXO+qHkfqcHpbhHGKBb229W6vCFb
         GZxcvOp5N/5aF8HWVAU4QoNYM8/TINVSFnJcsC11+bGgrBb/mRiQfdRiPnO+nkPkABcq
         H15A==
X-Forwarded-Encrypted: i=1; AJvYcCWG4+FFj0UmCNr4PX495JU2SjAcBK4caMPM38UsqSl+iorP2yYC66GNMnO+dJtQWOrvGUNO8trBUMM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDkSakLdETD9pUdd2F9ms1283qCqi+8gzdTB5YghNhoyf6DJp1
	PBq3FkTJ30LmMvMEDILv2gM4ru0DHbonKcJBRP06MZNweiM905+RcGkLYNTHEw==
X-Google-Smtp-Source: AGHT+IGlJ0eir4JBPRQPR0lHhCQ0jT59SRHCTwdZFE1fNAFV5SV2biiIRev3bwFJRUek/jF/ruQQ9g==
X-Received: by 2002:a05:6512:108b:b0:536:53e3:fe9d with SMTP id 2adb3069b0e04-536587aaf5bmr7234267e87.18.1725883166268;
        Mon, 09 Sep 2024 04:59:26 -0700 (PDT)
Message-ID: <1f0f79ac-8bb9-4450-8c32-88de3ed9635d@suse.com>
Date: Mon, 9 Sep 2024 13:59:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] x86/cache: Drop legacy __read_mostly/__ro_after_init
 definitions
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240905220806.141300-1-andrew.cooper3@citrix.com>
 <20240905220806.141300-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240905220806.141300-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.09.2024 00:08, Andrew Cooper wrote:
> Lots of files were picking these up transitively, including lib.h
> 
> However, lib.h needs __read_mostly for printk_once() and this has the side
> effect of kicking the transitive can down the road.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>




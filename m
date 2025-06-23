Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B787BAE40B7
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 14:42:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022306.1398088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTgUv-0001kh-05; Mon, 23 Jun 2025 12:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022306.1398088; Mon, 23 Jun 2025 12:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTgUu-0001he-S3; Mon, 23 Jun 2025 12:42:04 +0000
Received: by outflank-mailman (input) for mailman id 1022306;
 Mon, 23 Jun 2025 12:42:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTgUt-0001gy-EB
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 12:42:03 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75d7241f-502f-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 14:42:02 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so3436012f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 05:42:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d8607c96sm82320775ad.138.2025.06.23.05.41.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 05:42:00 -0700 (PDT)
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
X-Inumbo-ID: 75d7241f-502f-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750682521; x=1751287321; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BQMklvxnDFYP/W2MAanmrFjxA79m9bWrYTbcIqMyaNA=;
        b=I3I6Rkn5mTHddrTzwRuI19xn+uIT2j1hKkDOGWzOLTJcpkRAtfS95mHAypucROXUPL
         FXY8x8Kf82NbH/zxKd1Yr7WzhPILNUFKTliIps1vT3d+K2jujF/Jy1I1ek0rf+4D5n/k
         w9y5f8H+SdR00JGk18cFCsU47YO5YjARlsgEZSeIQI3xZn6zvBI1e8vrhrIL2o7v/eD2
         HsBqJ76Cx0IzhfRBG2tCUEXmsz3dBJ2Juzd2KZsd97x8jRe31do1BI7stNAiUpmXBH5X
         GYE7Ae3uohmjKRHC3avqZHZ5/1tYi/H+YJMgmq1PBIZ0+KJuOVZgDrBfTdJDqlaxishR
         RuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750682521; x=1751287321;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQMklvxnDFYP/W2MAanmrFjxA79m9bWrYTbcIqMyaNA=;
        b=ZP1kF1DMBr2RlfQWFIdAu4dnr8cLJcaYDtcs/A0V7e19XqyFhmZ94ByXcZ7/M3x+cA
         P06auYczpjnRSp/7roOaV6CMd5SR0UKN47/GfVbyVSucQ5Tum3ujgTeru4lhe2BddKiq
         vP7PX+mV0wzfqddSNAeheTvXhsDE10uMDRrDzFr6weDQNAE5QuTqBUvlXt7n6eNTqno3
         ad5fPiu/7juP9a8DOp/zHKy4hhdDQ7NTiRMesApndQ/YhbQ28+TQDAIjvOvhE4SR7ii0
         TIufaIRba1sLBRf9A8msTrfaZJACQlKhr+KFgXsg2ZsySG+HuBEQ3atB5nCRNrBbH1vn
         Waiw==
X-Forwarded-Encrypted: i=1; AJvYcCX2LP2N10LU833H90/0kPD8Cjb9JF++h1qMHtHXCkBoLcrf9QBpHuJyZ9jQK0AqPV02HkXbFUw7OB0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3Rkusi2FuqPQ2VXnU8Ye0H8wfwn7D0LQ/nkFxkHBYRsA0jVQ+
	1pot8UMq+WuLD5nHNzxis7y5JlRyXoopAEJ3c6nqer5ej1K5zdmRZgCol3wNCezNsg==
X-Gm-Gg: ASbGnctImKWKfF7nUT4iOHqe14OXRnQw4zZNwt9t7v1FnEVTPGQVAXWPCzp7sQRHCkN
	kJRAA5Ujjcx/eRO+v+a+xcz7aRzL5xEZA0mTl6lItanQ7DJxVK7tss4q3UaRQvYv4HyvlIn5m6A
	WXJt3IO6kSttP/hafhJgk18tklZsbnSe3thcfa5Z40PIvkRDgFjRZT7zaJKXiR8+AEhwmgAWe7O
	2lHo/LPGN9hhE3LpcOPnMPtQfG4Uxf82u9oWKvPi2+VJHj8+c951Y2fLnvWgzENfAllyLLwjUbG
	rChKryvjv0lpWnNnSJMs00eBB7iIhi6AwxCSsY227zk+cDugWhSQvjjiBSnUk+PXZOHMS+S1mTa
	6EHPAA7Tajaj6yH1oJiYZu2R6SRMdVAmmeJRGz0W/hQAL6Gw=
X-Google-Smtp-Source: AGHT+IG52pRJ6sXRzr8uSwIUvFrRs+VDqNa5ufeX6YmscjpVBOYnAh4xJy2ehLbZBdNvSftA1G2/Vg==
X-Received: by 2002:a05:6000:2507:b0:3a4:f038:af74 with SMTP id ffacd0b85a97d-3a6d12ebae4mr9047563f8f.51.1750682521315;
        Mon, 23 Jun 2025 05:42:01 -0700 (PDT)
Message-ID: <59cff82d-bb29-4938-a786-6272a3d828a0@suse.com>
Date: Mon, 23 Jun 2025 14:41:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/svm: Revert 1->true conversion in
 svm_asid_handle_vmrun()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250623105148.90321-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250623105148.90321-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.06.2025 12:51, Andrew Cooper wrote:
> This is literally ASID 1, not a boolean configuration.
> 
> Fixes: 2f09f797ba43 ("x86/svm: Drop the suffix _guest from vmcb bit")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



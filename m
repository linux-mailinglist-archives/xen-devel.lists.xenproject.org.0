Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AEA9A266A
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 17:18:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820717.1234299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1SH0-0002LZ-7t; Thu, 17 Oct 2024 15:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820717.1234299; Thu, 17 Oct 2024 15:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1SH0-0002K3-3w; Thu, 17 Oct 2024 15:18:46 +0000
Received: by outflank-mailman (input) for mailman id 820717;
 Thu, 17 Oct 2024 15:18:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rwie=RN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t1SGz-0001oE-3O
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 15:18:45 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18b50693-8c9b-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 17:18:43 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-37d4c1b1455so852762f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 08:18:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d7fc12023sm7505034f8f.91.2024.10.17.08.18.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 08:18:42 -0700 (PDT)
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
X-Inumbo-ID: 18b50693-8c9b-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729178323; x=1729783123; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pFd35RxNwSJLVrbxufCDkXuExbYD0dHZNmusIHFCzDs=;
        b=RWc6bEE9xuMBEnKNNkGO3STaOqFuLceGukDUtk46jLonY4z4Z9jRAjwK9w4vXD8NZ1
         6WK+6dj5zTBLb8xGGqnc3OfSmrsCXMqfln+9j0PzQK/uN9MB0YNY+UsUYoTNWxuDL6ci
         HOyEAzgm36dcVXGWxhdJqWr62RADQR0lhiEt1Oj3Tx6BMCk9dYBNkiqPftnss2dfSB3K
         X3h2GL6dyFTR/x+1TsGrck3HZw42IjVoAyG6Y/9KtrgVpP6xr+snZfLXcz6bLiD+6I5L
         4F28E9y6lyZhjKi/o0Sr1Kvd9hnY66BjdvtTcWxRv9uVCMakVQR/84gIf851tiosUSeA
         mRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729178323; x=1729783123;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFd35RxNwSJLVrbxufCDkXuExbYD0dHZNmusIHFCzDs=;
        b=rCCXdLkR4Ui4SPP/wObH1T4BgP2iB5G8OvdgXDWZBFnSHKWneucwGDl49lAlb7S1BX
         RlpmU1NokTBqgVmXyzlJZ6ik/f6Bi9zln/EVOJuv+WLtS+2q7I9fKfm9Z3spb0PBjlut
         qnrofpVqI4z7A5YcZigAbTVPkA9bB232Rtb3lahx9DcKI0BSk88tvYYnTxEw1EAq3nPp
         ef+0dBPpyauGIc1GVPspKp3/l4gnqBgLwSD3XlYuKBqPZbt3Hu2annxzQtoNkuOxoCrw
         LGFkyb4ttDiBXq2KLDhvAa+we21z9p+hjY/UYmAscunOyErnWLGl+Hv0xbOhQ4ey+5Fp
         FIWA==
X-Forwarded-Encrypted: i=1; AJvYcCW2cXhTvqtgZO6C6rKcQN0Lqf17/xvBBdk1rN2k+2Ciwj4QvCcUjHrvbq3pjhv/dSfCk6hI753Ts/o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz80SIxBz7hM63lwHvFUIGgw4gxGIrk3SL4BYTJh6OS2nsFIq6f
	2FbLwzk01ptaW/Cnalwdzrh/ReRljGJNwF2p5q5ku5PmBmWo+/riq7MEOiIAVg==
X-Google-Smtp-Source: AGHT+IEWyksSelgkdGY1sqB3Vr5jjERe2Uoib4RWDlHhEXWYV9/IEt6jnkXZZ47nqDL5sIlR1SXiYw==
X-Received: by 2002:a5d:564b:0:b0:374:c3a3:1f4f with SMTP id ffacd0b85a97d-37d551ab725mr15659585f8f.24.1729178322907;
        Thu, 17 Oct 2024 08:18:42 -0700 (PDT)
Message-ID: <9779788e-13e4-4608-8c98-d58fa6464ed2@suse.com>
Date: Thu, 17 Oct 2024 17:18:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] xen/riscv: finalize boot allocator and transition
 to boot state
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1729068334.git.oleksii.kurochko@gmail.com>
 <d3f3108653b7ad42c085118cee3a6634b3227c86.1729068334.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <d3f3108653b7ad42c085118cee3a6634b3227c86.1729068334.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.10.2024 11:15, Oleksii Kurochko wrote:
> Add a call to end_boot_allocator() in start_xen() to finalize the
> boot memory allocator, moving free pages to the domain sub-allocator.
> 
> After initializing the memory subsystem, update `system_state` from
> `SYS_STATE_early_boot` to `SYS_STATE_boot`, signifying the end of the
> early boot phase.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>




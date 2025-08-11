Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FFBB20912
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 14:43:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077564.1438606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulRsD-0007E0-7z; Mon, 11 Aug 2025 12:43:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077564.1438606; Mon, 11 Aug 2025 12:43:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulRsD-0007Bj-4i; Mon, 11 Aug 2025 12:43:33 +0000
Received: by outflank-mailman (input) for mailman id 1077564;
 Mon, 11 Aug 2025 12:43:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulRsB-0006wq-QH
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 12:43:31 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8a153e4-76b0-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 14:43:30 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-60bfcada295so7140629a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 05:43:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6181bb2146esm3108863a12.1.2025.08.11.05.43.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 05:43:29 -0700 (PDT)
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
X-Inumbo-ID: c8a153e4-76b0-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754916210; x=1755521010; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B/8ybL7MvsDiewusQFnz68Ow+DYCryDfvpQw//n2idY=;
        b=WYCG7Yw5LiZQx0YdzJo1a43onDMlXqbdFsEIwaau+DxXc0lmfEDsYo5d3BAm6uOEfa
         F0iFl2ylqBrKLKIczYepoiNebfX92UNL31nsEC+s7yJurZ8+yVvJy1hhXzShBlVDmgw9
         YKp2+DKCnZ8FS0gpix72eB0H84pe4fT6kggp19rqV6TCZ9/fCa//oK9jpUPG3HCPQeH/
         kVsfa2j5v8AP6fKO4bZE2noAH2+XN8NlQlFWs13L3MfQ2N1AWi/3rI4GtizhnvABFOf7
         cCZ3qRaTwVS5b2HvTM7vBznYJcAdyuc+ystJ5B1TF4XZsNCSl3wdrWWXV6NQPclLpdyc
         fTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754916210; x=1755521010;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/8ybL7MvsDiewusQFnz68Ow+DYCryDfvpQw//n2idY=;
        b=YTPrLaUi0wL0DIGvmse5Z/fcASnH6wSpF6yz2MUE+0dgG9YzBdBzLK2D4/Afr2bPKt
         fKgCp3A+FrYS/h3ScM8i1LKsW0gcvXXrrHtM5fkYI4RoHWhxSyUaqBPeFtVm+of5/qId
         XiGUG3S7MwotBFOeY2zW3+Vhm/TZ73MISgAV9qn69OXvNJGIRJc0e6I1ObJW2QOVQG39
         3mobiO5uMH9rRXuOPCbJpmQY3JgL/Chic6Mo7r7HLcKYFXLRGY05FCoUA1UKXnd9SaQh
         AXrT7hP4sm47zzzEcOpzp9tUUWeZa4CwAhrGiu67UivIxKW23w026KJjE6xAjRlwCgRV
         eUFA==
X-Forwarded-Encrypted: i=1; AJvYcCVHw8SM7SBQL7J3vAOtTVkGprIgA31Dnwq++9k3fXj2dqmXnzz8SCT09C2nEfL9q12fxIe1tyod4b8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4fMCNmUeP0jq1KJYILJGjMmJTl0jknhf3ijOKQVIn6FeeWaPx
	7cRgTsXiC9qB9M1qalKuQubZtAVDMvv37GLHtMrHyTib9LqLQH7U142Vl5KHrr9/mg==
X-Gm-Gg: ASbGncv+AUj6+6kVfEl3mZ3I7Pn/SIs+E5KxSX78VEEZlKfWoUhb2cS7BXw8IG5MVi1
	ld5LQ3M2eSqTu5jKTIelS1eUUrJAtXXZydvai29gbUKLG3X61rwKwffXLOA0OT+J5c+bH2mhJ0v
	nSJFABrP/6HkkfNr1vFuY95v4RLeBeCJYbo8frnBiRomNZkahHPUwnLs/c+g/jLDYW0pSIg0HyJ
	UnUAWvnq2oYyd5U6BXjv9T9IRkwqfUzZc6I6NvUf3RDUsphhx2vQflp5pWYpiqF9ERxu4Bui7ZA
	nISC5H5mgKyiCo5h8IdWYuD5mp7Ueob2HCYflFlUG4mnA+acEXPQYSfLp0lk09xNqL5ui1jtORY
	W7y/pM4ky/yF6hCq14sbcBaPQ73/uXZtZZdBGvetaGsSNEQxu6VU35FZVF5AH5jZjwWvZwKB2yN
	9OLfGcjrE=
X-Google-Smtp-Source: AGHT+IG4M2se9fxD7BIN0yyAyRe4OsX1HunqHYhQxHyl3ErTy36vdNdU67wJy3d7WIVnQdzkFzUxNQ==
X-Received: by 2002:a05:6402:5107:b0:617:eb72:b207 with SMTP id 4fb4d7f45d1cf-617eb72b6camr9098409a12.11.1754916209564;
        Mon, 11 Aug 2025 05:43:29 -0700 (PDT)
Message-ID: <aaf27a60-9f3c-4b4b-bad1-ace6f24260cf@suse.com>
Date: Mon, 11 Aug 2025 14:43:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/20] xen/riscv: implement put_page()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <7a7c07d431fc943e655216d389322638a640b2cd.1753973161.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <7a7c07d431fc943e655216d389322638a640b2cd.1753973161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 17:58, Oleksii Kurochko wrote:
> Implement put_page(), as it will be used by p2m_put_code().

I would have ack-ed the code change, but the description is irritating:
Who or what is p2m_put_code() (going to be)?

> Although CONFIG_STATIC_MEMORY has not yet been introduced for RISC-V,
> a stub for PGC_static is added to avoid cluttering the code of
> put_page_nr() with #ifdefs.

There isn't any put_page_nr() being introduced (anymore), though.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B550CA96486
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 11:36:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962375.1353587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7A2e-00085I-Sq; Tue, 22 Apr 2025 09:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962375.1353587; Tue, 22 Apr 2025 09:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7A2e-000837-QB; Tue, 22 Apr 2025 09:35:48 +0000
Received: by outflank-mailman (input) for mailman id 962375;
 Tue, 22 Apr 2025 09:35:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7A2d-00082x-FB
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 09:35:47 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29e2f8b3-1f5d-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 11:35:44 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so39282045e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 02:35:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4931c3sm14502789f8f.77.2025.04.22.02.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 02:35:44 -0700 (PDT)
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
X-Inumbo-ID: 29e2f8b3-1f5d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745314545; x=1745919345; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bwXGvhhQgN3p6ubTvnfZSVqjPEeYrrFxNRv75IimuIM=;
        b=CijB3j41i2Tv3eBd64dZHnZtlF2X0vDht+i2ERIwaKYDHrQrApPY9BQAA2NgbIh0nA
         9QsXW5gwfcn3rLHv+AoBO+iHwnIVUkFY+2BiRw44m/yG4Bib0UFyZTa8tTs/PIyS1Wu4
         lb1eq2BfsdOnDY6jOwUP9RShJVzXiv0GiTX9IaHMegT4jeb8yXmfkaiSEh369+SblnNR
         QgZkSGamzxLzbfltr0ZidaiAZd4Ja25aCGYgWY0kzHYclJcHEN7bQHJi/Y1z7Iw+ICaj
         +sFF5OLmEupmoWpRGMo0raPncRrFu/wBzRi+7JuGkBwEYspGyTmmuBvM8H1nmqxEfGFy
         Gd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745314545; x=1745919345;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwXGvhhQgN3p6ubTvnfZSVqjPEeYrrFxNRv75IimuIM=;
        b=cIw1qzUtQphHscH9hEt+iZj2UNsMz8Ssj0g65c1XbIo/4PtcN6vJly8ua8nk35vRUs
         BbzCb7jaQxI+3c6XqhLSrMahw3c+bGVU+guJPvl4Jf7zdSdLsb+AF6ClNSAvzlRILDgz
         ZHEG0KMUBYjknraSX1kO/OMTWbl1unVEVq1UQ0f96Us7OhXECGVC9/o/4vBI5P6jhlFI
         naoU77/NM+vXEmdaaP6ZI+96pQGR9FskAND1zEerlfk5Zcuyu6c3xAIMnlEQ8Kc8yZb0
         2X4lZBL5cm+avFszkFnsvYwzg3246t6u1Wmz4ZYo/FFnCkJry3QUDDrjvFuLJVNzNDx5
         XtUw==
X-Forwarded-Encrypted: i=1; AJvYcCUkD/go1QWWlpw+QXP60O5uik7cgEzHN0Ln5hGT4NH1mEJmsUbP8LaGhvCExcRu7QCiKbuCArbZe2Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzW6GeZQ2t2VnL5EYHT3UDMu9jPzlPWJYs2lDfzBB4z0RXLoToj
	rflHFeIVCGGtWtir6bSk/H+FpNz5R6DJ35OcomW5GMKzQwR9lRrx0TzIHSJrhg==
X-Gm-Gg: ASbGnctjRbmoq0KoOMROpAxzm9labVw7eM1HHb0AE9ZkUgkW5HaxYOeh19cn04bKvbG
	9oi6PFhNNfVFgkM1dz9TQ5KUkAsdnaZpzlUioCHzH4Jj5IFGrzEAsa0ZoKyW+cXDB87fUe/CKKO
	iT1Wtghp0NO5Dh3+LvRiYWwPsKsTW7RoMJ5zGS81QyuPT3bBQbx/ddX3TIO1vUCZtBZgpLFQRKM
	X/xfZAurITbx9BL5iDx6oSOUyfAduKeLW5DzY0Br5iq0s/9SCIRTfcwCZfzowRUaDys2+Sp5WQQ
	Yu9Pja3RwVi1jz2Jvv9wP5BQdEuaZqnN87F+oIxnBOQRR2aC6KbIjetvn9+sRF/Ukw36acjua/4
	orv+4vV9+mgWfh+otkWGLXMzPaA==
X-Google-Smtp-Source: AGHT+IFHr6Ylp6Snel56WwTgDBEVa14oLhrnxZ7jdih+hC+d+LpHAE0Ip6b8jTjzCQ/eAj4hCi7E8A==
X-Received: by 2002:a05:600c:b8c:b0:43c:fc04:6d48 with SMTP id 5b1f17b1804b1-4406aa8955bmr144869835e9.0.1745314544630;
        Tue, 22 Apr 2025 02:35:44 -0700 (PDT)
Message-ID: <ad19c0b3-a7c8-4416-832f-7cb92119cc52@suse.com>
Date: Tue, 22 Apr 2025 11:35:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen/riscv: Increase XEN_VIRT_SIZE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <9fbb5e1389b84bed2e95f99e4c383d0215c7a524.1744889185.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <9fbb5e1389b84bed2e95f99e4c383d0215c7a524.1744889185.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2025 18:08, Oleksii Kurochko wrote:
> A randconfig job failed with the following issue:
>   riscv64-linux-gnu-ld: Xen too large for early-boot assumptions
> 
> The reason is that enabling the UBSAN config increased the size of
> the Xen binary.
> 
> Increase XEN_VIRT_SIZE to reserve enough space, allowing both UBSAN
> and GCOV to be enabled together, with some slack for future growth.
> 
> Additionally, add checks to verify that XEN_VIRT_START is 1GB-aligned
> and XEN_VIRT_SIZE is 2MB-aligned to reduce the number of page tables
> needed for the initial mapping. In the future, when 2MB mappings are
> used for .text (rx), .rodata (r), and .data (rw), this will also help
> reduce TLB pressure.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>




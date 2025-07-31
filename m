Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20615B16DF4
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 10:54:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065097.1430423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhP3f-00017k-QR; Thu, 31 Jul 2025 08:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065097.1430423; Thu, 31 Jul 2025 08:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhP3f-00015u-NK; Thu, 31 Jul 2025 08:54:39 +0000
Received: by outflank-mailman (input) for mailman id 1065097;
 Thu, 31 Jul 2025 08:54:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhP3e-00015m-Uf
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 08:54:38 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcd5c82f-6deb-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 10:54:37 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b79bd3b1f7so83064f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 01:54:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef67a3sm12179515ad.15.2025.07.31.01.54.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 01:54:36 -0700 (PDT)
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
X-Inumbo-ID: fcd5c82f-6deb-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753952077; x=1754556877; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WV2jvmr3ACX4NpQjszgNxjVAHM7xu0gdYz7/L4YCN+g=;
        b=V2pXHqZFUWkhvsda6jvQF24+PqoZpjPSjdmJ7hk5aexGlYcd0Aj431Y+qlhjMcIfsg
         9/NFQR7flgFcXSJqhOPdB7UBBDBDk9k4Bkqw7YMpP8BOjjPwKlKBDF/EbHJdQZwHmRzR
         lCbxNGJbXlsMw2e/sRORnZoZ2PAxx1MegF5b/UYKkAUPpWzeZ8W96iFaq1Hc6ZfVjF6V
         iDmReLhkWMtecM6v/ayn/BsvYbOQUvWGs5/bm9qhfnzcdZnJv1r1l9uymHWu+Z/n1T5O
         lNybA/4vpQOj0GDfzVoFu6hQA0F2vK7irbxWJR8BKC0ZFMSinofdydPoHcGaIG3Nki8i
         FGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753952077; x=1754556877;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WV2jvmr3ACX4NpQjszgNxjVAHM7xu0gdYz7/L4YCN+g=;
        b=XRddAEZxwXY26UTcd4CCrrPdGz2ZKEamWlRoRmPaKkxcjMOlwEhvd2HBkCTSNt64qZ
         eU3rpL/xibfafTawfYglOl84sOmJBXNnrb8UxP7MNlse3Kgd2Bj6xK6rEfdpHhQHR3be
         nM5jOv1XxStIFDw6mPpUthJlT3tXBCqjeUqjMcZ/re9iXwBwMpE0OwzRx6aAIAqzKnPK
         Tmcu7qyJx53Ex4W8lQBHLuLbdeOQe9D2wc9H58IA6VxuOwSqkH3DKbMJV2OLFSX0XjKx
         5ltQBD7z0YyIZVGc7k2U+i6ax08kI1SbLl0mY0NZ7bTxuIp6tyPEts6A5C6E1s4MerdU
         b+JA==
X-Forwarded-Encrypted: i=1; AJvYcCVdlhYi40vYll8/+fS0GxpPip2J9dFz/1xTjva0+mgbH5Q6bRJcHljEcT6HT6F2v2RTR/BwO+14aII=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4Gwf15SINczuJMmqI3UIEUKYTV1dIHNShB2oWltj5nYTd7JXH
	jxInUTKdYs50YYN1Qo7hgL+6ItFdxIgQP6KcCjG68Z1m5+leXMaLxRz6KbLwpKD9ug==
X-Gm-Gg: ASbGncuQ4P/12L01OzXhwW7NareNf1//OuIx7B5vrjJ1AtNY56ciKjAIHg4zUG6xuj6
	/atVFJpD406A26OAJjmEjEbUTEjhcfkj0SVDxwiOecCV6YWCp3E85ZXnNfG2FYmIAKfLrfRi+ke
	SysTEsQ41/riOCAipfN0bYrUX447yVnvjpQiBQmr+RaWbwHj33VfvviXTe0kpCxNuA8jVMRGdia
	jqIDGqfBVZSDXtNcEpx6Jscb/Ktq1XCIHnCxxpeNb/grhOEqeUK8XYU4AjsBptWqLjAy3zVLwbW
	9EcM4OwFlvNV8NXnwPOriexz88Ge8w1fg4EoB1/cqjULRmEeV/WVkRtKzno3TBcZwMxFYFEzKQh
	KsVBJeHlUD8LPLXedGgXXiJYuARg3CXJhy/Fr3Nx/DBtXpKH8Qi79xF/eXHr48LROZpuwxS5a5H
	LHyvHGc9E=
X-Google-Smtp-Source: AGHT+IE5S95KbFvrjO2uomuo2HFn46+OrgM6nK3P9UpOAa+/miE3/LgDFkgFdT0E0sxfIVjPUvZiHw==
X-Received: by 2002:a05:6000:40ce:b0:3b7:8473:30a5 with SMTP id ffacd0b85a97d-3b794fbe201mr4485628f8f.8.1753952077137;
        Thu, 31 Jul 2025 01:54:37 -0700 (PDT)
Message-ID: <4156db18-349f-4832-a609-3a778521a44c@suse.com>
Date: Thu, 31 Jul 2025 10:54:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/6] altp2m: Drop p2m_altp2m_check() stubs on non-x86,
 move prototype, and guard uses
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1753871755.git.w1benny@gmail.com>
 <ee9b656301dfc7dbe09a729ff8c2febbfddb61c7.1753871755.git.w1benny@gmail.com>
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
In-Reply-To: <ee9b656301dfc7dbe09a729ff8c2febbfddb61c7.1753871755.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.07.2025 12:38, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> Remove the no‑op stubs from the ARM, PPC, and RISC‑V p2m headers and stop
> providing a stub in arch/x86/include/asm/p2m.h.
> 
> Declare p2m_altp2m_check() in xen/include/xen/p2m-common.h and gate all
> call sites with CONFIG_ALTP2M:
>  - wrap the fast_single_step block in hvm/monitor.c with #ifdef CONFIG_ALTP2M
>    (IS_ENABLED(CONFIG_ALTP2M) is not used here, because in the following commit

s/following/subsequent/ - the series may go in piecemeal, after all.

>    hvm_vcpu::fast_single_step will be guarded by CONFIG_ALTP2M)
>  - make the vm_event.c path conditional via IS_ENABLED(CONFIG_ALTP2M)
> 
> No functional change intended: on builds without ALTP2M the calls are
> compiled out; on builds with ALTP2M behavior is unchanged.
> 
> Signed-off-by: Petr Beneš <w1benny@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Happy to make the adjustment while committing, provided other necessary
acks trickle in.

Jan


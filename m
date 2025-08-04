Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD407B1A3EB
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 15:56:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069419.1433271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uivfM-0006m7-Fb; Mon, 04 Aug 2025 13:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069419.1433271; Mon, 04 Aug 2025 13:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uivfM-0006jv-C1; Mon, 04 Aug 2025 13:55:52 +0000
Received: by outflank-mailman (input) for mailman id 1069419;
 Mon, 04 Aug 2025 13:55:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uivfK-0006jp-Cs
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 13:55:50 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b98d9f38-713a-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 15:55:48 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6152faff57eso7812538a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 06:55:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8eff596sm6906762a12.5.2025.08.04.06.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 06:55:47 -0700 (PDT)
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
X-Inumbo-ID: b98d9f38-713a-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754315748; x=1754920548; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+qsbDAu9n7j04Iuujn77wTlIrVSjN8SCrQfzwXDs46g=;
        b=K0IzVgjENtwZ0rBszd+Mmwpek0zNPZjtZsAQMHhkW9jy2O01qAPz3ohYkbXQivLQ7u
         CPVrjYvZnCge/e/GRGt56Gd+xmjfcHufYT7V5P8JHVG9RWEciQcCA5XL1LQ1+5UI/E8v
         W2BBiU6FJk2+QiFizy/EZ8RYNs2CaR4X4ICMjcXSLt4RyoXn9IJHNraNiYSVky80QVmh
         VeJ18kzH809y0SktbkLGfOTQwmyiyVMBprLic/QTdzR+gqOUrZLSO4MPFVZxoSHp7zC1
         ejQWBSU0H41j7X5TIEWE0yOAAdFdo5wvz90lF8GD2jDhpPZq8JFWxLU6Orv2L1LyhPHX
         aHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754315748; x=1754920548;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qsbDAu9n7j04Iuujn77wTlIrVSjN8SCrQfzwXDs46g=;
        b=IOhlAYJ0BkMldvc9BGOPoEwBK5NpBRCN+xWb/wychD1Ttn3M61O0tUqFlSKyi8arzP
         xQ2/Ikw5pGNb/d0Zrv7mYdpZ49gst7cydpkLc7rg2GaTZ4RE2gp/V9WJdTEEvo3N+c+h
         HcWe+dCJmPYRLtem55/Vt5Yw/owPOst+RjwgfqMWIhdTV/nu7EjNfekndGumHixqqReo
         fbfvgh2zWsFzKOt9cxe6ZJsRMYzJ0GIW2BSN5xCC6dnLwF+C2Prh6OCw5ueTtkgmHuEi
         hcttz6+7eSOhxdeEnG9tiGkZJKXVdvYlD/A5ghDx6X7ZmmZeFGCIoe4nVCO/2fLLBqq9
         A0TA==
X-Forwarded-Encrypted: i=1; AJvYcCUEMJEv8RBMtchbRM4sjecE+6a9Qo2ShG4NYteIIFIodoPcVeJPbofFULAf+P9lqUKY+o2PIMjt4Nc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzHUekPLWoXcTG9ZWqo4Wr0DoLfm+IqHR9pGFix4VOuGtcFpuY
	5h6rZaiYM0lA/xMHE93m1m62uhroKhdnZV5PErRanT8jplNOXfPWnnpjipyVChBpRQ==
X-Gm-Gg: ASbGncsRO7MMneFRW/r6R5SYTScxQlrOzgPtOfk5JSIth7YmD15XGopak0Z4MIS23el
	5jqjm+OIMvn7jE4n4kc8qEy67x3KWU3ywcjndSXJptdtCNFK6WeDNOzNHXec28mQ7Mk6UdDZcrR
	zbmArxr+Zr53zjjmgDSXK3DpoTwRva+gXBFps7Ht4vfuDqOo2DvqsdjO9ri23MlVFGEke3R4qf+
	QQmseVa6XzKpbTXhvoDQ2ucsNLUrtPGLs0BeFD5D4iy7QbHa03M3TRZBL53AzOD0ZS3AwNMYYQ4
	3H8ZyRj5jNnL0leFGSW/4TDzA5RG5et7YLupurq1ScKxu3uYHbXYhe/6Q8CrOLFvvRkVRhzR+AK
	1cNn2kfMspEwXEhx+0dU9+YNZjWwcvyiCjSEcglMpcynbLmS5s4Hemk/CjQh4xUygSO/a7GZ6AZ
	wBhux6HPQ=
X-Google-Smtp-Source: AGHT+IELEwfsQMhy+6a5o1zeJqyLeL06POL/645SlSNi10K5jJig7PKTI7OKZnDBKzQC3vSVRvtaPg==
X-Received: by 2002:a05:6402:5110:b0:615:7899:5734 with SMTP id 4fb4d7f45d1cf-615e716ed94mr9545459a12.28.1754315747734;
        Mon, 04 Aug 2025 06:55:47 -0700 (PDT)
Message-ID: <164e0f8e-3986-4c9a-8201-14ea006405c7@suse.com>
Date: Mon, 4 Aug 2025 15:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/20] xen/riscv: introduce
 sbi_remote_hfence_gvma_vmid()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <de83ed75b0d7109d007389ec4809320c59c10bf7.1753973161.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <de83ed75b0d7109d007389ec4809320c59c10bf7.1753973161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 17:58, Oleksii Kurochko wrote:
> It instructs the remote harts to execute one or more HFENCE.GVMA instructions
> by making an SBI call, covering the range of guest physical addresses between
> start_addr and start_addr + size only for the given VMID.
> 
> The remote fence operation applies to the entire address space if either:
>   - start_addr and size are both 0, or
>   - size is equal to 2^XLEN-1.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with perhaps a similar on-commit edit as suggested for patch 1.

Jan


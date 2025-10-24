Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EACC04C08
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 09:37:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149966.1481330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCCM1-0005X7-Fh; Fri, 24 Oct 2025 07:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149966.1481330; Fri, 24 Oct 2025 07:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCCM1-0005U8-B6; Fri, 24 Oct 2025 07:36:53 +0000
Received: by outflank-mailman (input) for mailman id 1149966;
 Fri, 24 Oct 2025 07:36:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+XhT=5B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vCCLz-0005K0-NP
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 07:36:51 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 345b8c04-b0ac-11f0-9d16-b5c5bf9af7f9;
 Fri, 24 Oct 2025 09:36:51 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so11248445e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Oct 2025 00:36:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c4342368sm142242915e9.9.2025.10.24.00.36.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 00:36:50 -0700 (PDT)
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
X-Inumbo-ID: 345b8c04-b0ac-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761291410; x=1761896210; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+2Cykt8ADAlDg0LMzqT6da8IvfV3wQHi37+72mLk5wU=;
        b=GRk+nd0h6yGgYyfzFqfv+sERte1cjxsdLaHAO95T9lAgMt7rcKc20ell7eMGEBGofs
         T6Qr1Rgs0hC2Tfb+EW/mpY6ygIXnP/sMSHigyJ6Ni6rhjz76AI64qVG+QOq1+JNU3lV2
         8WHjnnkMGNALPZm3qMaYEvWc+9j5h2pB2PaO2XI/BPk0sB1Ax1U1hYvRPK2IVJH7uxX6
         Ap86xOkcuK1tN0UqppKDWx4+Thh6fuMtmkBYEV6TewXrskjGWQ48Q2RzdfEaAHDMM3gT
         ICh3se23nHtCMU35HMdjp6y27KvJMvlN+umMsN+/edAHpLkIxM8zQYPIkTF++0iZ+YPT
         N+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761291410; x=1761896210;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2Cykt8ADAlDg0LMzqT6da8IvfV3wQHi37+72mLk5wU=;
        b=iTEJldNkoBqHEP/qy4bRkdPHSmL+7bNf/UEzLfYOkM56xrl7F4dfYZO42gb1i2ERIR
         74yVhJ1W81chdiumqnBxh/Z010CWp9ELwQNoAwPmgBnZhhSjqihl2k4vh2ApUS+sn1Do
         jTyLeFbQNL0GRCSUFGOinJguxQLZKJiU3U5mO+Sbl3EODFD8MuqM5Ete7STXrN6/2r9F
         KlCW1XHG1Bxc3QBhcHJVVzoohPX2Tl/cMEP0dkmUgVvn/EfTKJEgwcPHPytY9EC/27WW
         YSuUZst0SKCS/g8szYUZhtTLiv2hT74VLkBgSyWACc1XKI3aKKN56PjB5l1H/4xjrSWi
         aC2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXvXYrtJ7DWTWNxuzPVL9H6ha16OWzZoDk2pbFqeJDmvSTt1czi6fLvQQoGemfZkNUt/J4VynobHM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yytw8g7iFnWFAIiTdo0d1XXo4ZaJkJtXiNDgyp/BY6b38i9q1Df
	6hGBAR2cYn5TDgSmXB38Sq62EU9hJJdpw3msB43yXyz1Gz5S+mZE04KpWO1eVwIlYQ==
X-Gm-Gg: ASbGncs9PrvEwVyYHIW700fo3PJyBhED6NSnGRtct82G3zol6XyVoj0SfK9w5MdUwTD
	s6/gW82u07FbQFPoTFGZDmQhzD7QoIJB9CeQTfQ8XA1totp7CqKcjJVTU1Varej8R8TuoenRafB
	eyTZIrnyz4PQ3qWZgh7FB+B+b1vRONGc6+Bb5ts2cHp0jkR7Lv3V3gEG5x8Uy+0P1UqM/wNgg2v
	5IjD371UDfwuFU45Uu+3ZsB//AiSjEH31CTwl3IWAB2XY+ajY2I1mz5c5aTTrK68eM2n9tGiBh0
	a6/HaBpOe7+uJABivWH9UdFQELd7PA4nKKsi1oJKT2zGMjtILwjULAR52d1tvbCyFPw/tbXjwW3
	Lw22Enp+yfnJvV1w8O7KSmAbCYtLoh9mRbRnVfh6Awqco2SuIbRMkuc6q/+ARwdZ3EQLfDSgHMd
	BdDwEQm+petvWm6hfa82QoUKLuNn8AFuuxlWYkdkV7/2A5iNcdfLFjD7+56wO2
X-Google-Smtp-Source: AGHT+IE9zPuGN9+xLD5cHm1aqPuTB1GAbtKtOS6F5iSybq50wNnc6rhrKBqzaFOkK8eXupMtYQ36Cg==
X-Received: by 2002:a05:600d:62b1:b0:46f:b43a:aef4 with SMTP id 5b1f17b1804b1-471b5341411mr94463235e9.38.1761291410307;
        Fri, 24 Oct 2025 00:36:50 -0700 (PDT)
Message-ID: <0cdcf77a-5387-4447-a4fe-56c8ae7300de@suse.com>
Date: Fri, 24 Oct 2025 09:36:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Support LLVM raw profile versions 5, 6, 7, 8, 9, and
 10
To: Saman Dehghan <samaan.dehghan@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wentao Zhang <wentaoz5@illinois.edu>,
 Matthew L Weber <matthew.l.weber3@boeing.com>, xen-devel@lists.xenproject.org
References: <3dc1fe6ee55d973a25a0441d0f6b41e00a58227b.1759355762.git.samaan.dehghan@gmail.com>
 <06646f747f21c3f388cf6e9d59a20238a4a91170.1761263588.git.samaan.dehghan@gmail.com>
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
In-Reply-To: <06646f747f21c3f388cf6e9d59a20238a4a91170.1761263588.git.samaan.dehghan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.10.2025 02:16, Saman Dehghan wrote:
> This change enables compatibility for measuring code coverage
> with Clang versions 14 through 20 by supporting their
> respective raw profile formats.

Isn't the 14 here stale now?

> 1- Added support for LLVM raw profile versions 5, 6, 7, 8, 9, and 10.
> 2- Initialized llvm_profile_header for all versions based on llvm source code in
>    compiler-rt/include/profile/InstrProfData.inc for each version.
> 3- We tested this patch for all Clang versions from 11 through 20 on x86 platform.
> 4- Fixed linking warnings related to coverage code in x86.
> 
> Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
> ---
>  xen/arch/x86/xen.lds.S     |  6 ++++
>  xen/common/coverage/llvm.c | 73 ++++++++++++++++++++++++++++++++++----
>  xen/include/xen/xen.lds.h  | 18 ++++++++++
>  3 files changed, 91 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index 966e514f20..5d02f83a40 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -186,6 +186,8 @@ SECTIONS
>    } PHDR(note) PHDR(text)
>  #endif
>  
> +  LLVM_COV_RO_DATA
> +
>    _erodata = .;
>  
>    . = ALIGN(SECTION_ALIGN);
> @@ -323,6 +325,8 @@ SECTIONS
>         *(.data .data.*)
>    } PHDR(text)
>  
> +  LLVM_COV_RW_DATA
> +
>    DECL_SECTION(.bss) {
>         __bss_start = .;
>         *(.bss.page_aligned*)
> @@ -357,6 +361,8 @@ SECTIONS
>  
>    DWARF2_DEBUG_SECTIONS
>  
> +  LLVM_COV_DEBUG
> +
>  #ifdef CONFIG_HYPERV_GUEST
>    hv_hcall_page = ABSOLUTE(HV_HCALL_PAGE - XEN_VIRT_START + __XEN_VIRT_START);
>  #endif

Since only x86 is documented to support building with Clang, adding just to
x86's linker script is likely fine.

Oleksii, what's your thought towards still taking this for 4.21?

In any event, a ChangeLog entry should likely be added.

Jan


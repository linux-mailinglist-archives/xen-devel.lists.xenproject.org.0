Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDF7CCC297
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 15:04:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189682.1510388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWEbj-0005ur-Su; Thu, 18 Dec 2025 14:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189682.1510388; Thu, 18 Dec 2025 14:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWEbj-0005sD-QK; Thu, 18 Dec 2025 14:03:55 +0000
Received: by outflank-mailman (input) for mailman id 1189682;
 Thu, 18 Dec 2025 14:03:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vWEbi-0005s7-D5
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 14:03:54 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 629b08e4-dc1a-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 15:03:53 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47d182a8c6cso10485e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 06:03:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be395d9cfsm15304755e9.0.2025.12.18.06.03.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 06:03:50 -0800 (PST)
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
X-Inumbo-ID: 629b08e4-dc1a-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766066632; x=1766671432; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x41PlVoPoBnSuapMab1S8DcsdXZGFis3BzTh2EeyhfE=;
        b=hBjItQFsHSYeMXxhn6YcZVtutCLlC6fAg0GOHIRSi1GxYkNKD1c44KegMWy8JXGr3X
         oWaLpVI1wEt5CFeKAXeUep5WDIn47eHF1ZqZqTmyrrBWNU+0xETmVweUJcHpshaQd1b8
         IYMfLG0tGj1bemdu40r6r67cbnoIg+lzyxyLSs1ZmlMiu/eXZPqrtzHPULD6DsysrHPB
         7Wp08Ds80Zpq9xBN3E99JGMf+Lq+xri2iAPVE7laEAVhtWA/AUJ9sKhJnElVqb9v5zus
         9cZ0KLhQIXEfTPZ5yeJilyV4oZ8sAo7zkTPdkTOARZWKeG+oe8VVw+nIgue/TbCNtJsP
         YqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766066632; x=1766671432;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x41PlVoPoBnSuapMab1S8DcsdXZGFis3BzTh2EeyhfE=;
        b=ld4Hsfb7n1AAet90DcPYt23VaKgnZjqtfaAU+Qymtv6qCcKWwyMP3e8iTGk4RgCNOz
         5w+BS1ll19SuWHCwtIX1G2+b8hxhZhvZrCJC9NZgTK03OQFVoyVNSMlbRcHSPttckh9y
         mV93/LFZr3PlmmsB67HJY13jVjUt7lXe2ArOHmpI6cPHNyZia+Tg2SNisod9HW8iNC+C
         qugeWPJ3TZpY/cTZ4Na7L/YKUAaS777tERbsaKI3IhSPNQjIW9lfypP3Eb20Qo5rT9CA
         +ofsc497TphGNJMH2P93bTWBhxMmL3h/ZSiGs49WPpWq+nexxpv83Dvo079ekFi/f2ri
         COqg==
X-Forwarded-Encrypted: i=1; AJvYcCUESrqSjLmUGHFpvAH+HY7OuEC1n3WVJN7Y5eU3gs7mOvrwqxgQ6v7LFcUXxhhiKe8eBt1Od/hTlvY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyK6p7XEzqxRpmdy8fFY2H92DHrfkAgH9Jye4JsQOT/ci+P+RnW
	m4LqSpL7cGrKK5tIQmPiq6Q/jUzPLNLgM3nPrnKdQa4cI6kL29yUnR6p714Le4C/Hg==
X-Gm-Gg: AY/fxX5L3nl6GW6y8VCSlzFrJSg7c8O31Sj5we2tMSyo3LJLnh3pGKGVfY1PLQX6k6Z
	yoCqFLfjjpYbCWrLQlxeP8juLDd9GuQe9PfYBtSfywHSSjbdkElQrr7tcaWIDDHeb7i7BB6Zya1
	1PCgjpWDlGdh4Y9A3iwcZYJGIc/D1fbgW10CY1gnjefMN+A9cHzSaI5qMjYNDTs+MrY/VWSakXU
	iOBDzM/qk1uApuvOvJ07NVPnj0g4w78DmUb5//IHzw3qwCtzl5zHm92/u4ZEeZ5HrzTQfFR1C61
	42iFkj/gMt97zUffvNGf1X0Nxm1Q2zlkFVB/eZQT8gW5sUwvk9f0GGbWeWwuy/fbWF5CyJoxxN5
	25Z76oKszXpUeMta8jBGhntpNJgUNfNCEk/7nVKXBIrro0bI4xw3CEfkfKSylm/Jlp02Xatmd8T
	GWCJgmtynHl4oelJmn8LfpabHsrooJGc3e4nl6UDt/rnII6sKeW3CoA0jAiryuJ10t2w4ReaiFa
	6U=
X-Google-Smtp-Source: AGHT+IE9Lh90pvkHeZhtN32t3L6rT9OpkxumNPVWxOi4aGkvPtxF5qe86n0XKAljkPQA3o5sVjoZBQ==
X-Received: by 2002:a05:600c:3f10:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-47a8f710100mr232611005e9.0.1766066630900;
        Thu, 18 Dec 2025 06:03:50 -0800 (PST)
Message-ID: <ac7db3d8-b2fc-4383-8f7c-52debc601349@suse.com>
Date: Thu, 18 Dec 2025 15:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/riscv: introduce vSBI extension framework
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1765888425.git.oleksii.kurochko@gmail.com>
 <dc1045d1831908678a1e4a79571adab2ab362ef6.1765888425.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <dc1045d1831908678a1e4a79571adab2ab362ef6.1765888425.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.12.2025 17:54, Oleksii Kurochko wrote:
> This commit introduces support for handling virtual SBI extensions in Xen.

Nit: As before, no "this commit" in commit messages, please.

> The changes include:
> - Added new vsbi/core.c and vsbi.h files to implement virtual SBI extension
>   handling.
> - Modified traps.c to handle CAUSE_VIRTUAL_SUPERVISOR_ECALL by calling
>   vsbi_handle_ecall() when the trap originates from VS-mode.
> - Updated xen.lds.S to include a new .vsbi.exts section for virtual SBI
>   extension data.
> - Updated Makefile to include the new vsbi/ directory in the build.
> - Add hstatus register to struct cpu_user_regs as it is needed for
>   a check that CAUSE_VIRTUAL_SUPERVISOR_ECALL happens from VS-mode.
>   Also, add storing/restoring of hstatus register in handle_trap().
> - Introduce vsbi_find_extension() to check if vsbi extension is supported
>   by Xen. For now it is called only inside vsbi/core.c, but in future
>   it is going to be called from other files.
> - Introduce check_vsbi_ext_ranges() to check if there EIDs ranges
>   overlapping between extensions.
> 
> The implementation allows for registration and handling of SBI
> extensions via a new vsbi_ext structure and ".vsbi.exts" section,
> enabling extensible virtual SBI support for RISC-V guests.
> 
> Note: All EIDs are printed in the format #%#lx and all FIDs in #%#lu, as
> the SBI spec uses these formats. Printing them this way makes it easier to
> search for them in the SBI spec.

Luckily the oddity exists only here: I don't think '#' would be very
useful with 'u'.

Jan


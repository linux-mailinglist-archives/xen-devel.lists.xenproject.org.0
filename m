Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 363CFCB22EF
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 08:25:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182552.1505415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTEZm-0006vd-Aq; Wed, 10 Dec 2025 07:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182552.1505415; Wed, 10 Dec 2025 07:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTEZm-0006uC-7q; Wed, 10 Dec 2025 07:25:30 +0000
Received: by outflank-mailman (input) for mailman id 1182552;
 Wed, 10 Dec 2025 07:25:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K7qh=6Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTEZl-0006tz-Ae
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 07:25:29 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6660f8be-d599-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 08:25:27 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-42e2e5da5fcso3735047f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 23:25:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbfeadesm35587108f8f.10.2025.12.09.23.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 23:25:26 -0800 (PST)
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
X-Inumbo-ID: 6660f8be-d599-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765351527; x=1765956327; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PgvsZxZi8/3tji1mtIJHvj0/V1Zc/8cPHf2LB2s0MQI=;
        b=L7Wvq7BCV3M76LFywPS3C5n6qp3FRbuSWE6vEyu7Gloul/3ZD3KmlzaWXeyQwIvV/y
         9j3xsB9FZZ69EnS95Eq7SRE/PTLLS/z9qigVPwUCHt30HvHXDxJyEpn8XO8Qw9A/8zGN
         WoAWuHseuplB7wZetL+jFEodCk3oefdbEl/r9QeS4OQvs4VKw4dO0Y4PxTF0mnPxVupr
         IGCabD+Ah24vh5Bqp6halGBpJvFyIWPbUNX6xaWC70+MoAR2DDtDJfYyU1L5OaYadFsE
         QWsMz6lxQI05d2oKddc1zfF4jILotKd91U8UlT3Arq4akC18O1MQlIOEZ2QnmRBBWOQk
         gVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765351527; x=1765956327;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgvsZxZi8/3tji1mtIJHvj0/V1Zc/8cPHf2LB2s0MQI=;
        b=ly7bcV+9kmcBcJXU4Qr1lad/qzbcOk8Xj4CxZRb0GwVZImBaP2veBWNDkq2kgKsIg0
         629LJScvhDl8BPAWKL2r4GDlyvAKqgvH6Z8SlAkV1IwsnXldmVCOOuHts5weFRkeGymB
         c2P+Kz4jRCYzsqkc0aM7blbg/wBKq5eee6M4Qp4wBSS8imrP9XaSIyfstqwi+ZdR8s3g
         AAqzzkJ5hfa1AB/ECoLKF0Jp2EbiQXQH7MxCb4XgFdRqDGJOpNdiqwnokV+lYtIDVMn+
         amgujilUdIxKlRtfODrEvTf1uoKAN2jSMn3knq6gEjZPrvQ0RPxceFjGeBA+ZGsVwC+x
         Eqgw==
X-Forwarded-Encrypted: i=1; AJvYcCW8j10AVYctLgaQ59QxeGi4XEjAOlR+dQHaOZpRy66AID6SqX9F7LlRhzXJhSwi8AUkVv49DCwLJOo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwhQhPoMJeSOXNV30iTs9M10NFSSNW29UUi3nNRcK1lA29Qe8vX
	Y1+5B5yFiSjnySL9oTfSH3lCPbQfpRaayJ0yRgxfxx46S/xD+71GyR+5trM8ycNVTg==
X-Gm-Gg: AY/fxX4VAbFZ5RPDA4mBTAmkboutbY3EJy4IuOt0Or5WFBHIAkdrOyNsZsqNj197Qf/
	J0gMICmzC3pOIaJQuuFWsNl+o6voJWyXtU3iqy2jWlBViwmL7AaDsMS5/OWHQHJWrYDvcTRdaiK
	qBbhU0VVwRywrmZhZHgHt8IpuWxdcW+m4jR2Ns0SgS3NjIs/Iy8tmtjGbpRFsT//AjenvJBTSSo
	cYgUvO9E/lFQ1Sg1C2KYMzgGCREFiTyKWBKngVh1fq614EhjmqFaHUSL2p4+nKRqq/9bAPRtYmk
	fB6Fu8Upn2fVUwOmyOYqISpcRd0218+q/SR3l+KlJAg9/Vw719RlwAYvAauOfEFleZNrUnUKkGw
	Awquspy7kO8waPnb15CXYKCmhO5uxFgV7O7evueKVuty24iS6jcGToh8Vlsm8GbtvET7fOAATQP
	EErbAqf/X2SYuiUiLSkXveShXPBHqwdv5TAeQH9yVqmoiUv3/54ndG6oPYRIxJDtqfRErO9Wuww
	JY=
X-Google-Smtp-Source: AGHT+IEQFsPPDCp1qWx2r2jFqA2YLxk+vMABwAEVt5u5DoIun/KEAGe4Ormzv67TYA/z5+n7rYTMqA==
X-Received: by 2002:a5d:584a:0:b0:42b:3dfb:645f with SMTP id ffacd0b85a97d-42fa3b07c26mr1304505f8f.47.1765351526793;
        Tue, 09 Dec 2025 23:25:26 -0800 (PST)
Message-ID: <51d10106-14b3-4f5b-91f1-4cd0492dec03@suse.com>
Date: Wed, 10 Dec 2025 08:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RFC: xen/x86: Enable --gc-sections
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20251205222813.277164-1-jason.andryuk@amd.com>
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
In-Reply-To: <20251205222813.277164-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2025 23:28, Jason Andryuk wrote:
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -76,7 +76,7 @@ SECTIONS
>    _start = .;
>    DECL_SECTION(.text) {
>          _stext = .;            /* Text and read-only data */
> -       *(.text.header)
> +       KEEP(*(.text.header))

Andrew already commented on the KEEP()s, yet I'd like to extend on that. The
one above looks to be necessary (from an abstract pov; in practice it shouldn't
be necessary due the entry point being there), but ...

> @@ -98,7 +98,7 @@ SECTIONS
>  #endif
>         *(.text.__x86_indirect_thunk_*)
>  
> -       *(.fixup)
> +       KEEP(*(.fixup))
>         *(.gnu.warning)
>         _etext = .;             /* End of text section */
>    } PHDR(text) = 0x9090
> @@ -116,12 +116,12 @@ SECTIONS
>         . = ALIGN(8);
>         /* Exception table */
>         __start___ex_table = .;
> -       *(.ex_table)
> +       KEEP(*(.ex_table))

... these two for example should be strictly be omitted (as Andrew also hinted
at). I think more preparatory work is necessary here: We may need to use
section groups to associate auxiliary sections with their main ones. Otherwise,
by pulling in full .fixup or .ex_table from an object file, technically unused
.text.* would also need to be retained (due to .fixup / .ex_table having
references into there).

Jan


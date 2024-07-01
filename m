Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFEB91E1F5
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 16:11:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751711.1159744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHka-0006c7-BR; Mon, 01 Jul 2024 14:11:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751711.1159744; Mon, 01 Jul 2024 14:11:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHka-0006a2-7v; Mon, 01 Jul 2024 14:11:24 +0000
Received: by outflank-mailman (input) for mailman id 751711;
 Mon, 01 Jul 2024 14:11:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kQX2=OB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOHkZ-0006Zw-1I
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 14:11:23 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca71814b-37b3-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 16:11:20 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ec0f3b9cfeso36243641fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 07:11:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-73aba14b007sm2856709a12.85.2024.07.01.07.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 07:11:19 -0700 (PDT)
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
X-Inumbo-ID: ca71814b-37b3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719843080; x=1720447880; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kLLmKrCv/xlyFN0iGWWF1FaWX+anc+UtteN1Vq13fy0=;
        b=JDv6aQ28EutMUrdFZ93eDgAdQIWyoM22R3RPteQycmF7xAMyXa+dkPupK8k+y3ZMW7
         5KuxPUoSNRlQWQqezV3BkDKJrdajXI6h0QYcjRY+KLxDTRqnm4qnSUxKRpe2dlC0HUn1
         W8YOH5LT25dlfgAhUDhgBhghw0Nucj0hi6QIrtO27XysSYY8z9vHsTfRZcgEnjdXvpHc
         c8czSAbetr23JWIDgGdFtU0jk7wwTv43Fzej2Pdaj3wg8oiQBUJMVCBosSCAR5Q1Aove
         7WujDobY7GMgTm5R06AUzUYTkbokN7LfyEPGALDOlOkTc9FAgKnwee4HjFd8MaVcPQHQ
         HT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719843080; x=1720447880;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLLmKrCv/xlyFN0iGWWF1FaWX+anc+UtteN1Vq13fy0=;
        b=c7qk0baBPa4hbE4haVlCFRur6273zRon5KPcBPLDFv/iHW8F2YglFXtTv0+zQGRv79
         iPiVliGP2sWvcAbhPR5rrVcf5oA8QfbCf75fJJ2wU9oMQQOC9nHHxLqgHA1bf/FNjobs
         blHszmJ3UwE40BSrtW8mWUU96jaCPTUg9Bs4TO6NIfaVzNhQ84coP2ruIf2XW18W6lhO
         N16p4FnprzG5j5IsVZZv622HD+iu2BwD+kkXRYY+3Iu9Fbv85nD0kUsxa5UE23ioB6m/
         YVrt5wLSRLutrWBoIDfSlH4OI1N0MF8gPVg1MmES6qBYBIbvLDLNT4Yqh+RyhbSq4llu
         +CxA==
X-Forwarded-Encrypted: i=1; AJvYcCXGzGMI0gfPJl7yxVrFVp03PEVL8PhC7yWhtsuhkTyuAotq3J2xjG2XKP7HQWqfXR6RfUNiLJs2IA0CbwxXxcdJYISFQUGBTwpZfgtvKLo=
X-Gm-Message-State: AOJu0YyKjJV3Ht66MlkFlpkTtyZ7TFHLluMnyVGJQ3pv5V51PsQ5dLWX
	lljRjt8kto3aT97MP6W5mDNGybh+PukMBgYIuz0Ta92P2SAIu/lGatcpQPWdSQ==
X-Google-Smtp-Source: AGHT+IGe9Ktv+W+afuwwSj3TxEUHxLAbPG/nCL5BVEs8BGPygXK+7DWLObjawXpvfyybpJhBia6sqw==
X-Received: by 2002:a05:651c:893:b0:2ee:6277:a888 with SMTP id 38308e7fff4ca-2ee6277a9f3mr35070051fa.38.1719843080056;
        Mon, 01 Jul 2024 07:11:20 -0700 (PDT)
Message-ID: <a02442b6-b286-4fda-8814-cb939f29a355@suse.com>
Date: Mon, 1 Jul 2024 16:11:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/17] x86/EFI: address violations of MISRA C:2012
 Directive 4.10
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: nicola.vetrini@bugseng.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
 <0267af93ae969b67a77c3a9aca9f4ad6525de1b9.1719829101.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <0267af93ae969b67a77c3a9aca9f4ad6525de1b9.1719829101.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.07.2024 15:36, Alessandro Zucchelli wrote:
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -3,6 +3,11 @@
>   * is intended to be included by common/efi/boot.c _only_, and
>   * therefore can define arch specific global variables.
>   */
> +
> +#ifndef X86_EFI_EFI_BOOT_H
> +#define X86_EFI_EFI_BOOT_H
> +
> +
>  #include <xen/vga.h>
>  #include <asm/e820.h>
>  #include <asm/edd.h>

Nit: No double blank lines please, anywhere.

Jan


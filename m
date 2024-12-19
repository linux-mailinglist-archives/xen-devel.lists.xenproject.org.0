Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6284F9F77B2
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 09:49:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860899.1272880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOCDu-0001P7-Fy; Thu, 19 Dec 2024 08:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860899.1272880; Thu, 19 Dec 2024 08:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOCDu-0001Mg-D8; Thu, 19 Dec 2024 08:49:34 +0000
Received: by outflank-mailman (input) for mailman id 860899;
 Thu, 19 Dec 2024 08:49:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tOCDs-0001Ma-V3
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 08:49:32 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29f6b1b0-bde6-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 09:49:31 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-385e3621518so240599f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 00:49:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c832e74sm1016182f8f.30.2024.12.19.00.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 00:49:30 -0800 (PST)
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
X-Inumbo-ID: 29f6b1b0-bde6-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734598171; x=1735202971; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pZha6CRepn+kvo6dN/6fOPku6KxKZxMF2UiC4SlhuBE=;
        b=QRbpdXBZ034XpDShQ8qD6wRUfPo3eCO26Ig4pwW5GzVR39dFr6DQWa0qIP1TGgYf+S
         oe3EZuPfC0NVDOe0PJmQGDTUenUBezNYwTceGcFsxEc+u1+i9i1sGjtFY75j6MckTb6R
         mxAOY8jc9ies7Gb4+LsYGhgVM7V6OLIqXkmKPmbzROjRjrsPA5ali+hVTPzuCerBz5wc
         g5Vd4wzf6yLu4aC0IWyrD8Lb8kkbdLZ8uGjykHeWe6b1M/8bnQJsct54rabbW8Ycp8IP
         ahs9tSGIxNuD2/3F4Dy47u5YCfrXv3IFHqQl3KgmMPxO0vrCeWxq7NBdYFNYoSk6+wCQ
         Eqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734598171; x=1735202971;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZha6CRepn+kvo6dN/6fOPku6KxKZxMF2UiC4SlhuBE=;
        b=cHQWZTWDijQ8/+oPsBTAL28hmEy+CZYaO9jfnoxF9ecnxwXp1k98/GrrAjmPeXh/Ko
         fhyNNns8OE5ie/qmUk2LoXLcJ7fSNhkVnZIWtKvXUBQKn/juOyY84EqcYKylclEqrFv0
         p4lEgKOPu2iCr08mqoanxiAWQmFdxKzPruRNW3XBwWgQHKP9gyanAPaww3s1llKIBoxX
         qh97rYyGF4CrxZxp3bYT17Io+/1T7QxB+DQkyQjJbbyZdIkSwYCkt1z9qUdHNOQpOkBb
         sVevzfsG2zjqkHhKlKNljtH7X+cZzgCDid2neIVPyLd5RQ95+PXGNX9i8lvAua8dEyQI
         OxzA==
X-Forwarded-Encrypted: i=1; AJvYcCU/n1HYbv5n6BtFmazRfGqrWEGSs8L9ModPB7z5Om5vshYvXtixYlmX5fz8xod39NjV0ZergWpr3NA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxa8NJzUbSOITA2y8tsxuSrJGXYo6sORAygMc6F6Ljs34VSbWxp
	5IA1b8k143nM88VHwJk4mYvEfR7i7BuU3DmqZiLopcsPdZmBajHIvSDJP0Teow==
X-Gm-Gg: ASbGnctsW3B5qBsoRhkmpQrVOXS3rwFQs7St5tgy/Tj2McsNlI7I4x+eSEeUodoKup+
	zyInZ/3sSct2L1HQJUioLZ1AD/z9MDf59df7svmEJcSi0tKmdeUd9DN+Irw6pwgpLor5qG3QnCb
	ffX+nRRHooKFEFejIzrjOAe3gNaRdL5iEOJmq1XwUHs4ojpHCEx+B99220ISYW7lFJYM6LkM3Dc
	Cd65VoeJBAQbF5x1c+NBy1t71hSscBcN2V1iJWLpNDrz+VKf6w/wWLU64SvhwGcP2H6yRnvIRrH
	g0SF/Tzas2eFkfuGbqfdiTzR4NGxolwnnq+9NEqeug==
X-Google-Smtp-Source: AGHT+IE9VvPbXowUlGMR0NuKfIyu5U90knTcEPj1g1FEgcr7KAnezv9SNTJDeYwSZ42tdjNExquWRQ==
X-Received: by 2002:a05:6000:389:b0:382:5aae:87c7 with SMTP id ffacd0b85a97d-388e4d7a897mr6913011f8f.31.1734598171005;
        Thu, 19 Dec 2024 00:49:31 -0800 (PST)
Message-ID: <d312a46a-238a-4fa3-84d7-4836c610c8ea@suse.com>
Date: Thu, 19 Dec 2024 09:49:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: add deviation for MISRA C Rule R11.8.
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <7e4f836606d72769a80299c5451f6f7241471d8a.1734530952.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <7e4f836606d72769a80299c5451f6f7241471d8a.1734530952.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.12.2024 15:25, Alessandro Zucchelli wrote:
> Rule 11.8 states as following: "A cast shall not remove any `const' or
> `volatile' qualification from the type pointed to by a pointer".
> 
> Function `__hvm_copy' in `xen/arch/x86/hvm/hvm.c' is a double-use
> function, where the parameter needs to not be const because it can be
> set for write or not. As it was decided a new const-only function will
> lead to more developer confusion than it's worth, this violation is
> addressed by deviating the function.
> All cases of casting away const-ness are accompanied with a comment
> explaining why it is safe given the other flags passed in; such comment is used
> by the deviation in order to match the appropriate function call.
> 
> No functional change.
> 
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> ---
> As this patch introduces a deviation for service MC3A2.R11.8, it
> depends on the following patch and shall not be applied prior to its
> application.
> https://lore.kernel.org/xen-devel/cf13be4779f15620e94b99b3b91f9cb040319989.1733826952.git.alessandro.zucchelli@bugseng.com/T/#u

This wasn't applicable anymore at the time you posted the patch, I suppose?

> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -393,6 +393,12 @@ Fixing this violation would require to increase code complexity and lower readab
>  -config=MC3R1.R11.8,reports+={safe,"any_area(any_loc(any_exp(macro(^container_of$))))"}
>  -doc_end
>  
> +-doc_begin="Function __hvm_copy in xen/arch/x86/hvm/hvm.c is a double-use
> +function, where the parameter needs to not be const because it can be set for
> +write or not"
> +-config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(text(^.*__hvm_copy.*HVMCOPY_to_guest doesn't modify.*$)))"}

This is probably good enough for now, yet still: It constrains re-formatting
that we may want to do on such function calls. Personally I'd consider it
entirely unexpected if I ended up (re)introducing a violation just by re-
formatting one of those function calls to

    return __hvm_copy(
               (void *)buf /* HVMCOPY_to_guest doesn't modify */,
               addr, size, current, HVMCOPY_to_guest | HVMCOPY_linear,
               PFEC_page_present | PFEC_write_access | pfec, pfinfo);

yet aiui the pattern above would have this effect (I don't think .* matches
newlines; instead I expect such regex-es to be applied to individual lines
only). Thoughts anyone?

Jan


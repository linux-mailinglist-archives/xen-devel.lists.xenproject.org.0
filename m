Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9718B522B
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 09:20:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713881.1114762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1LIl-0004uH-ML; Mon, 29 Apr 2024 07:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713881.1114762; Mon, 29 Apr 2024 07:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1LIl-0004sM-Hq; Mon, 29 Apr 2024 07:19:51 +0000
Received: by outflank-mailman (input) for mailman id 713881;
 Mon, 29 Apr 2024 07:19:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1LIk-0004sG-LE
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 07:19:50 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd4282ee-05f8-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 09:19:49 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-51abf1a9332so5596722e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 00:19:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n3-20020a05600c4f8300b0041be58cdf83sm7435435wmq.4.2024.04.29.00.19.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 00:19:48 -0700 (PDT)
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
X-Inumbo-ID: dd4282ee-05f8-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714375189; x=1714979989; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q0oSIncWfRdUdmaIGvx5u0B7hRxtNRvDMgL4G/hlfXE=;
        b=VG9/3kxu7cicE4o57/QfWPTA+F3B46lUgn1xQ412vcXL6rDwbkQ8kSXEumWodqwFUC
         Fncsc/tsYB02FAtuQb2lGsXVra5gJ0yDVyF9n3n1nFTb1PnN5jk/iNcKtyzRqzRNe9vg
         l4uh4WPEcbBKScVdPBXXt8y5qA0jSxZDHZI57IqAC5XU+/4s7U8u7NCZx3eU+VTrs3qC
         pfXyFcCN/zl+2DKWwG5Shdme104C7cqUIWvDL6/2UQWHf0LYwML9C8ypgbexZ31xEom/
         HGBp9YE+NPCJZnC3C6uc1kTYkp5rjfz4DlCdXFZje2Nz1gtpSUmU007cTkC02lfPVze4
         WLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714375189; x=1714979989;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q0oSIncWfRdUdmaIGvx5u0B7hRxtNRvDMgL4G/hlfXE=;
        b=YUq0TWI4ibf8exPZLtnxokQl+ajCf3aius6xa+UjbeY0yVQhN+tjScSSBTCyhi+sxc
         lDd/R7AnggjYq0GRKSAH9dS6bPxLDulz1rCxjluCDuWbuENxrxnpLl4p/X6Pz5kzIWba
         lha5dkEvP4TXHzMk0Rv+nTElfwUXffFGjor0VP0ftw5VE0LXYu14zZ1Q4YaTW35bPO3s
         yKSxkFb6IhDIfNVCcY+C63HYgqcAiJZUfm0aGUeCoEnNmHfpktCA114C3Ni3+B145Oaf
         MpljQ8mZOdk0C/ZYyeuFJK4eGGQ+/T3Sz44zoAXo+d++v2LKhDde0ewJ5BwG6TtIAuhE
         t1nA==
X-Forwarded-Encrypted: i=1; AJvYcCUOLr9N/N/DhG61F8KsS4buZR6yBjpTGELLo17QrmqFUqr+U9AV45sprVQlYOyp4++WhjtHL5Y0cNzayUqXXDPRuIjYXHZYLllzU//gvTc=
X-Gm-Message-State: AOJu0YyG+99jdQt6nnq6m34ssxIpYl7zdmTYgWM+BZHhGSoTkAyOijcO
	sk7Sjd35EJeLgwnPGf13ZG+mwDXX50TyjN7dq/x3SpP220AmlhDOc3Q6zeYutg==
X-Google-Smtp-Source: AGHT+IFslbAe7sCaUDcXJdoLn0Ibvrnyq2U62k2ZaoTHYU45dvyDPsy2zHE5zfFRkiX83bUBYieCOA==
X-Received: by 2002:a19:9157:0:b0:516:d33a:7571 with SMTP id y23-20020a199157000000b00516d33a7571mr6316012lfj.8.1714375188896;
        Mon, 29 Apr 2024 00:19:48 -0700 (PDT)
Message-ID: <9d9decb2-ee5b-4e0c-9f27-b65e7c274e5b@suse.com>
Date: Mon, 29 Apr 2024 09:19:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MISRA and -Wextra-semi
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <5ef9fef8-e5ee-4ce3-a78f-ee7c35e5a1a4@citrix.com>
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
In-Reply-To: <5ef9fef8-e5ee-4ce3-a78f-ee7c35e5a1a4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.04.2024 13:33, Andrew Cooper wrote:
> Hi,
> 
> Based on a call a long while back, I experimented with -Wextra-semi. 
> This is what lead to 8e36c668ca107 "xen: Drop superfluous semi-colons".
> 
> However, there are a number of problems with getting this working
> fully.  First, we need workarounds like this:
> 
> diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
> index d888b2314daf..12e99c6dded4 100644
> --- a/xen/include/xen/config.h
> +++ b/xen/include/xen/config.h
> @@ -26,7 +26,7 @@
>  
>  #include <asm/config.h>
>  
> -#define EXPORT_SYMBOL(var)
> +#define EXPORT_SYMBOL(var) typedef int var##_ignore_t

For this specifically, could we perhaps finally get rid of most (all?)
EXPORT_SYMBOL()? If not all, then at least as far as permitting the
stub #define to be moved to linux-compat.h?

Jan


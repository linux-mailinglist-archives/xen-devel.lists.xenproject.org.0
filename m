Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5ECC1FBC4
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 12:12:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153513.1483835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEQZl-0005ma-Nd; Thu, 30 Oct 2025 11:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153513.1483835; Thu, 30 Oct 2025 11:12:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEQZl-0005k9-KE; Thu, 30 Oct 2025 11:12:17 +0000
Received: by outflank-mailman (input) for mailman id 1153513;
 Thu, 30 Oct 2025 11:12:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vEQZj-0005k1-IZ
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 11:12:15 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49d07af0-b581-11f0-9d16-b5c5bf9af7f9;
 Thu, 30 Oct 2025 12:12:14 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-429b85c3880so628524f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 04:12:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952cb55asm31617277f8f.17.2025.10.30.04.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 04:12:13 -0700 (PDT)
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
X-Inumbo-ID: 49d07af0-b581-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761822734; x=1762427534; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t6pg0tkMpRg5zJ6c+s0afH5KumfJRk5TOLT72LUWPVM=;
        b=Qm4eEhTiQWv5eSasSqgdBzSHm6P4AcsOwqlHJdRHaBYjI40RyT7mwNyXw44ylRQjPw
         UafSpHT7SwiGZsyfmCPQyZf5oRY15hq6lEGgu6YkI/iNX4KAnTIrGYAtpS6NtcW56ckZ
         eSKPyiisBau2wrid8Da3b0lo/epxD9KR/RuvVMNPdOY8+PGj88rXsIIVA/3SqA9eMNlb
         mejrMWFlgU7AHpHtiUe/K/cfUjmttQgcHFsvDHb2nn6nE420mQ6SfEbaQzLZEMcHXjKs
         GRmEZtiQf6oTLg5BDuvipwJ2np460sLCEhWf+hfdz+EDWmJBuTC7yduNvAlK/BSHmsOX
         Nq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761822734; x=1762427534;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6pg0tkMpRg5zJ6c+s0afH5KumfJRk5TOLT72LUWPVM=;
        b=kecMBOPzqin2d2tsDpmM2NOiJA1QxXkFRViJezpqvb9c1FM1ndCWACOAxQnNTb0Pxi
         mnZnSEUSw/ZxuWeGHd6cD97XoylmmFSonBZ83AoeaaRCuVJUjbBOQEKu+V3Y0C4aHskq
         N1j8PgncKTjeBVpLcHQn/h2vNsJY/FfC7Y4mWtROx26X84foXv6v4O91DJgDfC6oTdQy
         0rCcVcKAe6N4xVnSQJNn7rJ0DeClOADmSRlkpsUSNA5F0bXwSiz+VU+E1daUrH6U84w+
         GC/Uv3odrnzQfbECJ99XGY8oAX8OE6QNdbg8xwagTmjh31Ho/I+Ji1S6tXjacDnuzDE3
         d9jg==
X-Forwarded-Encrypted: i=1; AJvYcCU/mUiDNzFjxRFHiEnK1KrFxN9BdV8qsnk+3OA+DLdfl/vERugSHhM5KP0X7Ut0Yy5KQcxoENkaPD4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8Tn7OivfJ0la9ctc7hOwL1Ye8SeE5Gt22tMQNpGTVnJ9XI/rB
	kQWyXtg288m4TyeEr+9GnBtgPBC7MO1JSAhiFXzjQ4cUZ2heTSq+AIflVUphH9R2cw==
X-Gm-Gg: ASbGncvCfru/4aiG7ELTLsb3WW16FBOShg1XssYzwYTHSlPEhnjOPWZN1fkQz0wkZGD
	htVXgh9XUi/uXUHHKZpMXnmsGTncTr9+54ic+bKsAipBdXs/q6j7n740WwhVDu3Sj9rXUH0syNJ
	p1gyw/bPZotPm8KBKO2qKEWNpkJEODjhHFhcn9skmSg3JlHlj1MN3qehL7YYuQ8Xe1sSIPJ7f7J
	eETUITgNm0WRhYQ4Lx67dA0FB67uUHIY6+mfpG0S+9jvRABtymtiYsh+5Rw2MKuar2pLrrRs/T0
	1vkMuGYgQ0xf15NVgOQjXdTZpUapeChxNFJ4/CxCpqGjdsXVDSonDV0u4Yg0MrziEZIvJFQx5lP
	/JOiF3DurUKCOfiwLCcMTseev+b/yzXeuXGGPQSkmrVrFgJdYmgaPs+cbWTbrQ4dY7y5nlKzrZw
	TflJiAAUz4gJX5/QneJil/HG2WxKTSgU2fbp7aAQ6xmoejjnX8NWT7XUIvOlcl
X-Google-Smtp-Source: AGHT+IEt0MiQ7zg/8DI8tgyNkMeuq1IzuaZlFaMPeEvdTw2AyOwpOx/geB7ed8WF5k5HO5aKurkO0Q==
X-Received: by 2002:a05:6000:491c:b0:429:8bfe:d842 with SMTP id ffacd0b85a97d-429aef735c9mr5187353f8f.4.1761822733882;
        Thu, 30 Oct 2025 04:12:13 -0700 (PDT)
Message-ID: <32fd9825-45b7-470c-ad0e-f1941faa4d52@suse.com>
Date: Thu, 30 Oct 2025 12:12:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 2/3] x86/hvm: vmx: account for SHADOW_PAGING when use
 hvm_shadow_handle_cd()
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251029235448.602380-1-grygorii_strashko@epam.com>
 <20251029235448.602380-3-grygorii_strashko@epam.com>
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
In-Reply-To: <20251029235448.602380-3-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.10.2025 00:54, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> The hvm_shadow_handle_cd() can be used only with SHADOW_PAGING=y,
> so guard hvm_shadow_handle_cd() call with IS_ENABLED(CONFIG_SHADOW_PAGING).
> 
> bloat-o-meter
>  add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-290 (-290)
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Requested-by: <me> (or some other of the available tags)?

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -1506,7 +1506,7 @@ static int cf_check vmx_get_guest_pat(struct vcpu *v, u64 *gpat)
>  
>  static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
>  {
> -    if ( !paging_mode_hap(v->domain) )
> +    if ( IS_ENABLED(CONFIG_SHADOW_PAGING) && !paging_mode_hap(v->domain) )

I don't think there's a need for IS_ENABLED() here - you can simply switch to
using paging_mode_shadow(). That would be more correct anyway, for the abstract
case of there being a 3rd paging mode. With the adjustment:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


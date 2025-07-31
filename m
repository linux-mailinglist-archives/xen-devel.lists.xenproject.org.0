Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0D0B17434
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 17:52:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065844.1431155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVa3-0007pT-B7; Thu, 31 Jul 2025 15:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065844.1431155; Thu, 31 Jul 2025 15:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVa3-0007ns-7y; Thu, 31 Jul 2025 15:52:31 +0000
Received: by outflank-mailman (input) for mailman id 1065844;
 Thu, 31 Jul 2025 15:52:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhVa2-0007nm-2G
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:52:30 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c86c62d-6e26-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 17:52:29 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b78315ff04so471625f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:52:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1f101e1sm21396245ad.58.2025.07.31.08.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 08:52:27 -0700 (PDT)
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
X-Inumbo-ID: 5c86c62d-6e26-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753977148; x=1754581948; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hGtzY6yXPDYgMw+ChiEBe3azFxNoD1nx+4iFsKpruaI=;
        b=cFjdC1uC/EudaV5nmu5pcogRP9MP5FMu/oLhdB3ydDpghpt69xB52IYqbw43iVbLv+
         TUSR6YjHYOcl8EWJFiIbOdwISjEizHH9rd57++3l3c5vxzSyk1EMFnVgZl/IsunHmQbv
         e5BA9Nd6UtmEdqMhKX9ui/u/7BvclncnevTxnmRbf97xL0rQvuQ7k/1QL5PHVtLHa3V6
         k+7FMLqTpKVPbM8DT0XzJq50xEdNabg9IG+zG8i/gsu3cObkIUNPry+lgN+rNa0iu2U6
         elK/Sknf7tebFkeJ3+Qjz7e0q6jgjCi9I37S/+cUn0WN00AXf3Oq2IYKe5jeqljxJuNy
         LHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977148; x=1754581948;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGtzY6yXPDYgMw+ChiEBe3azFxNoD1nx+4iFsKpruaI=;
        b=OBxik4GV4GnAbIsx5QfAm3Qn1A3QPcAv8jXmTnTM0xzVQ0hpn3Juiy//wk04XqFbaw
         nr6Jj8n9DuvmIw5Hkwi9RFPyutIoWiWYSYIv3QI4FtTjIfIDw/Z3SQ8j/mYDon14MjUm
         96rRNyU46kg90Mjr4dGB1fQYDObhlMJZMycD48ERr4RZLqVwxwbAe/dXE1imgadQjQZE
         bYu4yLa24lq24VGWOIp62hpmDOzDyXugiTxhQj5ykNA6ZYSBwPEAmZtvMP+JJySpD6Yx
         3Xn0O96AHke89Pfh3ejOCJA20cGb8wjsnTnT4g/L5ecJu282gZjT6e95W+oxp3crfSRg
         OIFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfnUiLzRzFVJ+2/4OBAqMdVcxF3ZU7MxeAYP8/co12/5x/ok3qgkhkHdTFGddqaKUXhU/UkwiOfU0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKdOSTfJLT7O2U040MMwV+zXsNiZBxCSe7ObZlBpAcQmyxt5cn
	zKm9bxKaeFNLBiND/VYHpbAu963ROf8QIKTYC48CYi+DguTGiH0zWlOfWJsqr3n4vg==
X-Gm-Gg: ASbGncsV4MMJogRqu2vvxRpR/wiRFiXeQjB1dNu8/ezRu52dZxNYZyG5/CNOMobPLuc
	WMIUPBewZTZzbo3ha8VDmC9ldO+ktIJCXkF/ZrZ6ch/RnXMb/VHaAFep1IA/t115hQRVgLoH9Ye
	9KKbXbKRQ7fCNisVW7WxqNhiGio/OmCy6IVU6FSltEoKuh0UbuB9q2rue5slwy6h+VSs6M5/HaS
	+0t8sZ8pNY1xtNfo3f25sSAY+OK/pRFBfAdY5kRYVhqvcpGOrhIVCDecOLBkaW4P4Yfr3GFEGRG
	G1LNTjrxA2GPcldSjFZqlh/nNV4h+3m7iDVf0mLivL9aBwDfbH+rl0eBdGVhNm6lAoQjoOSzjkB
	KQFNbJGb6A9eKl3iUxdZnPTxOy1TvgaLUZCx1g8zj+YnTosSMJKsDtG0dGk8YLyAVt5XFJVui2+
	goqQPYEKI=
X-Google-Smtp-Source: AGHT+IHaoHS0+Bp6yDjyBVb7m9e/FGnBe4TvhIUdvrMbIXXLgGeNUoJlbnDFJBZyv/H54N5lv06gJA==
X-Received: by 2002:a05:6000:290f:b0:3a5:2599:4178 with SMTP id ffacd0b85a97d-3b794fee7camr5747166f8f.19.1753977148359;
        Thu, 31 Jul 2025 08:52:28 -0700 (PDT)
Message-ID: <edb8bd9d-e5ca-42ad-a551-b7162d5e0f80@suse.com>
Date: Thu, 31 Jul 2025 17:52:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/3] vmx: Rewrite vpid_sync_vcpu_gva
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1750770621.git.teddy.astie@vates.tech>
 <f92b18bd9ec6b5b83a4b8a66dea2440b65060c27.1750770621.git.teddy.astie@vates.tech>
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
In-Reply-To: <f92b18bd9ec6b5b83a4b8a66dea2440b65060c27.1750770621.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2025 16:01, Teddy Astie wrote:
> Rewrite this function such as it doesn't rely on goto, also change the
> type of "type" to match the __invvpid function call.

While this type change is probably okay (and benign to code generation), ...

> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> @@ -287,10 +287,10 @@ extern uint8_t posted_intr_vector;
>  #define cpu_has_vmx_vpid_invvpid_single_context_retaining_global    \
>      (vmx_caps.vpid & VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL)
>  
> -#define INVVPID_INDIVIDUAL_ADDR                 0
> -#define INVVPID_SINGLE_CONTEXT                  1
> -#define INVVPID_ALL_CONTEXT                     2
> -#define INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 3
> +#define INVVPID_INDIVIDUAL_ADDR                 0UL
> +#define INVVPID_SINGLE_CONTEXT                  1UL
> +#define INVVPID_ALL_CONTEXT                     2UL
> +#define INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 3UL

... I don't follow the need for these extra adjustments. Preferably with
them dropped
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


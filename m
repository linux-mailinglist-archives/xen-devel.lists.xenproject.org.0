Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56649A2A89D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 13:37:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882832.1292922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg18g-00053F-Hs; Thu, 06 Feb 2025 12:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882832.1292922; Thu, 06 Feb 2025 12:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg18g-00051i-F4; Thu, 06 Feb 2025 12:37:50 +0000
Received: by outflank-mailman (input) for mailman id 882832;
 Thu, 06 Feb 2025 12:37:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tg18e-00051a-Vf
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 12:37:48 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b4caec8-e487-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 13:37:47 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ab7430e27b2so157908866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 04:37:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab77364444csm92040766b.164.2025.02.06.04.37.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 04:37:46 -0800 (PST)
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
X-Inumbo-ID: 2b4caec8-e487-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738845466; x=1739450266; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6/xNXHvWKvogxC0VBbz6UQ6ujqQ123VeosggDCfOZcM=;
        b=OhxUNB85KPYzHsWKstJD4liOijmYHEdDz+kBNr2/G5MymU2P8T4HQTWekDXqGZnjRJ
         Mo8/33FI+qG/OOprcAmp7byxeX0WZPVX8A8ixFSdzkM7WHQM1KbcweA0T96BaZ9yo2L/
         98HAaL+HN7wV2RZvh14DZRvPwq/qGjKnjDW2pnwzuzb+d64d7ZcsUFrDvmbeAeHMhn/O
         NoahHjK7Pl/bOG5ZGNtaESXEN/hJEPQvmFmFq+N7Vh8rJwYawm2Tl6BTXzyr4yaGkDeS
         Pgf0FCK9paFOLAN0zP4s2XFPVjfHIsrkIPc/bbm6CC38uVkAlLJ5P4hI19EZIAKUWfy8
         LTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738845466; x=1739450266;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/xNXHvWKvogxC0VBbz6UQ6ujqQ123VeosggDCfOZcM=;
        b=m9ki6bUeHwS5NHLC6AVdKzIlzaR9JWryjGPNYvNRySzbD7uDb3Bj10tmYQLbXlNbcQ
         UCwzdqlIWjhCu5efuIDKXSMDkPDMGThX2Mtr20ikj+Q/t31eFQHs+SCSEOfJSxCLJcEP
         TEMO0bCed7eLM3eMse9VeEkjxippx6PSDjTmL9a5xsjN5Tj86w8gPPrrw71CP4kzM5mO
         ZK8Vaw8cl/2bku82b7fjemDff5MH+fufdSPt1ulDwdkmbddlFuEqiSL5n46m2tSwVCVr
         vzcV3GWsYd3lbqNZGWKD5ig+cOSLNZT86unPod453s44uMg8ijcTHLzxtkaTe2jSfx8M
         JstA==
X-Forwarded-Encrypted: i=1; AJvYcCWTqx2Y9lxfYAfI9K8lZoglmvw6p9H9leB93k9pNOXLj50F+xyqU4xLwOlriJ4GcRMHINGVfxk8spY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvtANbMjfyHo86QS19tpunzQToJ0wP0kT+Md0xwGW9vuejxqyz
	+mhNb2hHeBvXaKGq4xxIAlEG+/pykPzlc9f3hIc2n3g2uNjig7zTmytWgpZ8lDu4/I+URcaR2Ik
	=
X-Gm-Gg: ASbGnctB/fWuPye5ptdITgTzKtKR6GtY707Uunv7UVxfA3yeA6ixRLuWuk1O7Tbyuz2
	K6+/GWeFuZNQx6pFzLy8Vm9TvFr+PW5C5d0V5lrrUGnvNTxMHkVJH6Ljd8RjZ6/OH9NqUpu/rMv
	M7+h2sOPcPV5nP/3QV7K8yeHDkwE54Syn7oa7V41MZpejA2zmbkRk8kMK83RPKgp5gfWildCfqg
	qLqehPNpRpe9Fn/4QZNJszmZZLoZCvNODqYg7JyZbtSmM0u9jxMEj+BVxac2bn641JJK8HMUl18
	facxu3S1+v8H3yHeAJnDSdtpp0uDtQB4cuK5zIyI+2Qah8Owiw9qPMBnFIqZ3Yy0yYt1yxqVFYc
	t
X-Google-Smtp-Source: AGHT+IFWkV6CNbQYpFDi1liIDCHpryjF8sOfNzl0VUA37gwuoDWOdKGXMZyCM6KPo4GqRhdrnYjm/A==
X-Received: by 2002:a17:906:856:b0:ab7:6606:a8d5 with SMTP id a640c23a62f3a-ab76606b5camr519467966b.48.1738845466580;
        Thu, 06 Feb 2025 04:37:46 -0800 (PST)
Message-ID: <c7788ba7-dccd-4c34-ae75-6159c9dbaeef@suse.com>
Date: Thu, 6 Feb 2025 13:37:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/9] init-dom0less: allocate xenstore page is not
 already allocated
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, julien@xen.org,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop>
 <20250206010843.618280-7-stefano.stabellini@amd.com>
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
In-Reply-To: <20250206010843.618280-7-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2025 02:08, Stefano Stabellini wrote:
> --- a/tools/helpers/init-dom0less.c
> +++ b/tools/helpers/init-dom0less.c
> @@ -16,8 +16,35 @@
>  
>  #include "init-dom-json.h"
>  
> +#define XENSTORE_PFN_OFFSET 1
>  #define STR_MAX_LENGTH 128
>  
> +
> +static int alloc_xs_page(struct xc_interface_core *xch,

While this isn't my area of maintainership, may I nevertheless ask that you
please avoid introducing double blank lines?

Jan


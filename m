Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E363A64D18
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 12:43:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916607.1321671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu8s1-0000EG-DJ; Mon, 17 Mar 2025 11:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916607.1321671; Mon, 17 Mar 2025 11:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu8s1-0000BQ-Ag; Mon, 17 Mar 2025 11:43:01 +0000
Received: by outflank-mailman (input) for mailman id 916607;
 Mon, 17 Mar 2025 11:42:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tu8rz-0000BC-Hm
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 11:42:59 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f921a0ce-0324-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 12:42:58 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3913d45a148so3772759f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 04:42:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d2010e2d6sm101906695e9.38.2025.03.17.04.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 04:42:57 -0700 (PDT)
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
X-Inumbo-ID: f921a0ce-0324-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742211778; x=1742816578; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rGBnGMkAk/QHHPpUZbvk5VOrYxSoBDxDtkxmgI5Sh30=;
        b=C1WJn04G9xcsin4qWrVxaSOubKv5FDX4GJDIyV8WDJecMDn0JNMat5xCNWQxb9JdUc
         4nx84Axd7FekhWPT3q/R4OrHvdlIGlZVCYdU+GegJL187s7MpbVc8WEtx6bufO/v+xIe
         RER3zFVyo+3WJCHOv0IIC1qmyIWxmjsU15Iizf65VDiehv45G17a/XPdpg/efJZdHCbP
         PE5+vDqTmeWMgur/N0dseOGK4NJXoGtnNh3AzTE5XgGAHd5sUWcqaHlQNZX6LCyPgxW1
         E2MCB7v4my+SJ0dj+kSvffmrOirv2kI0UUc/bWsHdVWCTr9Qo6vXv1M0adms0m+bw9Tb
         KBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742211778; x=1742816578;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGBnGMkAk/QHHPpUZbvk5VOrYxSoBDxDtkxmgI5Sh30=;
        b=BWc9m0IbrEVsDH44SXKH0DtDjkIIwiMRgOOdamoAJ/kmcwOlIEgzwxk0RiaVIyh5OV
         LR8umFb1Wn8gPWNqL+5vYg7Zf6S5pVejeMYdtmDSE7LfvkUanKf79WOXo3/yryl8U6uj
         1vy42NOaT5HZaish0RgiuhatsASVlokyFEoJVzw35fsmA4gXQsMVqbhDxFfAjG/Q7c8A
         OyObXtCgPAl9MK3t7riLM/jHCgpvFf3ouVxm6D94AqcmYbD8BmProueEaWaA28HmI5/j
         IjbSTuB+0nd0kH3aDKozE8IoJ5ugZpnYzcQ4AyIKxZdkxv9pCSEFQ3Pj8DzjD96y2Sk6
         E/yA==
X-Forwarded-Encrypted: i=1; AJvYcCWv1agqkK38szpyzSTiH/oXtRBmAAHO0oefsi9n1QKUQNLeJ6PQ6Lpa2DLFFu01woWTmDopP1WcxXw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBcljQLpQKJ5ce4Jk+tX3kqt9kL/1ugOJEIpSSEcwRWEJRzgvW
	WcMgmubrbm0qU2jBYL8nPQRCBB29nWZeZWRZ5lCaA7mQFv0uOp1OylngOBwoDQ==
X-Gm-Gg: ASbGncslo/652Dz4zqi/ra2+5+2qLCwwj59yNpWeSVAh8IrL0/gWyFG7uDSstTLJ+f8
	urXYJh+OCHANCpqxnBWzXFCqiEPmQaqumJppgBV7jPwSixNlPW7glN49tOIRknJLor4FzSIX/tp
	/u3fgr9gBAoHUPemGg8x1/96IQAGZKDPy2rxDtn7T1czHdyHwkSxnjGsA89N7AYyK5gPeY4wKyp
	cVgUPLOftNPbB/1aj30iFboJlAxUsdchiC4VhwzJx+zq3kuR7qQ5HFsDgFCyf4D2UDrGbDZ8QEn
	yAEC8IrQijfkPMQ8+lOSRRKWkN87/0FR5VVFqYQhEsxQy54nmuMRkSyVqBTNA6H/xwMe30mIJtx
	pgu0TgniHCvn7S+Ll5THvH6fDVv1JmQ==
X-Google-Smtp-Source: AGHT+IFI5TvlocnyP0u8xhvclmLsHJsmsHMdKNd48kTEtHMuQ4I+xv1rx5SXi8RgBiEvzJqMgA0Ohw==
X-Received: by 2002:a05:6000:1548:b0:38f:4acd:975c with SMTP id ffacd0b85a97d-3971dae99d2mr14627602f8f.27.1742211777847;
        Mon, 17 Mar 2025 04:42:57 -0700 (PDT)
Message-ID: <1cd10c63-4e86-45fa-b4b3-cb750ad9f39b@suse.com>
Date: Mon, 17 Mar 2025 12:42:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] x86/domctl: Stop using XLAT_cpu_user_regs()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
 <20250311211043.3629696-6-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250311211043.3629696-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 22:10, Andrew Cooper wrote:
> --- a/xen/include/xlat.lst
> +++ b/xen/include/xlat.lst
> @@ -34,8 +34,6 @@
>  ?	pmu_intel_ctxt			arch-x86/pmu.h
>  ?	pmu_regs			arch-x86/pmu.h
>  
> -!	cpu_user_regs			arch-x86/xen-@arch@.h

Maybe worthwhile to keep the line, just switching ! to #, in order to
indicate the type isn't accidentally missing here?

Jan


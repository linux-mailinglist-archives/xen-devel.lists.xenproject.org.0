Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB4590B1A8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 16:22:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742361.1149151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJDFb-0001OQ-Kc; Mon, 17 Jun 2024 14:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742361.1149151; Mon, 17 Jun 2024 14:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJDFb-0001M7-H1; Mon, 17 Jun 2024 14:22:27 +0000
Received: by outflank-mailman (input) for mailman id 742361;
 Mon, 17 Jun 2024 14:22:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E9YK=NT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJDFa-0001M1-3C
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 14:22:26 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04aa5163-2cb5-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 16:22:25 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-57cbc66a0a6so475679a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 07:22:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cf709b49dsm76051a12.49.2024.06.17.07.22.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 07:22:24 -0700 (PDT)
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
X-Inumbo-ID: 04aa5163-2cb5-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718634145; x=1719238945; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RDYlK32PcEbzjDkBUw1Lslht69kdYDtkHTsgamegvR4=;
        b=QdijaweahB0/Bd8sFP/XpqVj8bgplMplUdYc7ryY2br//8oGuokXielPcFP/Fha6MP
         eNyWPbN61a6Xj6XR/Gs2oSC/5dd/Qj4MPbzk3D2iP+K4fjjLBW9/lLmt+QIsJcN/5boH
         sWMZplN5T8V4hrk3WWB0Cm+/nXbzWLBIyTq+nbH9NW0dOkOP+34+vuuc9mV2+FpBoN3w
         GHtvNxj/+OLiixmnbwUVw/tHyS6AtnIFc5MuX4iHWdaM8uIE4jlrQ0y6QuHnJme2k26F
         PI1rHPLxrDAvyWQoowwmzHhdXX1iS2wS7XgFzNvIfV2aAzUHkUjikRa1E53FVk6B14PX
         mq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718634145; x=1719238945;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDYlK32PcEbzjDkBUw1Lslht69kdYDtkHTsgamegvR4=;
        b=h/8bCh8DB+p6rUyo8oJDJ/ozE/vHXUeChmKFjVFoaNo6TwErq9koiTxqQG2e+KzQGF
         EH8PtwWZK9HrjPQEaJB5zbRkvoXRTqxKw+EM1iXiVFwwx/R/pHI2R27KrkrorbILG3xE
         kN7sa3HFfni+nR9VlWFE+zQ8x+fpAPKqdGCKgDwykICqybfWwf+vlacnvF0xuJ3AzP6O
         gHwFr3t5PEtY56FZJ8Z08ix+F47WnC0aogMilYJ/blmzNk4OP8zUGMkxn0PhftRreOTZ
         X/FIm6Vjuxh6kZ24WA1d1iA0d6B50jLhChP+2oWBptU9fgZ4pXclUSuK2aiwCqK5Kxxf
         n0lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrOpTgsyhe9bU+kA3JPd99Kmg9Duvw3zI5w4x/RYSuNdN64NBdSKBhqYKhpqIZtkTrhvEeWHZpCS2r/Ei0p8yAtq5D9/ps6dRTp6L2q5Q=
X-Gm-Message-State: AOJu0Yxg6NG5Nwpq1y6CYaJMA7UkyM/puU/S9ItRH4temMLYp5vdwwbj
	1a2rIBns+ffq/pKRPqen+mgdjdlCuIh3yrSO8A+xYKjeFt5noLqBwHUShyo6Rw==
X-Google-Smtp-Source: AGHT+IGTdnNmx/lrvgSy2nQrknFrK5oVSLM37bT6s12vjnAcrOUwqPbxH/dj19ONIPn97Cv2O4Ww2A==
X-Received: by 2002:aa7:cb87:0:b0:57c:a796:ed6e with SMTP id 4fb4d7f45d1cf-57cb4bb0d49mr9430677a12.6.1718634144499;
        Mon, 17 Jun 2024 07:22:24 -0700 (PDT)
Message-ID: <2fe6ef97-84f2-4bf4-870b-b0bb580fa38f@suse.com>
Date: Mon, 17 Jun 2024 16:22:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen/time: Reduce Xen timer tick
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20240617141303.53857-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240617141303.53857-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.06.2024 16:13, Frediano Ziglio wrote:
> Current timer tick is causing some deadline to fail.
> The current high value constant was probably due to an old
> bug in the Xen timer implementation causing errors if the
> deadline was in the future.
> This was fixed in Xen commit:
> 19c6cbd90965 xen/vcpu: ignore VCPU_SSHOTTMR_future

And then newer kernels are no longer reliably usable on Xen older than
this?

> --- a/arch/x86/xen/time.c
> +++ b/arch/x86/xen/time.c
> @@ -30,7 +30,7 @@
>  #include "xen-ops.h"
>  
>  /* Minimum amount of time until next clock event fires */
> -#define TIMER_SLOP	100000
> +#define TIMER_SLOP	1000

It may be just the lack of knowledge of mine towards noadays's Linux'es
time handling, but the change of a value with this name and thus
commented doesn't directly relate to "timer tick" rate. Could you maybe
help me see the connection?

Jan


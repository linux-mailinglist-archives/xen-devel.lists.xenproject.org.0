Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59137971D75
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 17:05:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794657.1203684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snfws-0007zc-6c; Mon, 09 Sep 2024 15:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794657.1203684; Mon, 09 Sep 2024 15:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snfws-0007xD-3g; Mon, 09 Sep 2024 15:05:02 +0000
Received: by outflank-mailman (input) for mailman id 794657;
 Mon, 09 Sep 2024 15:05:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snfwr-0007x7-Ce
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 15:05:01 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1baf62a-6ebc-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 17:04:59 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c263118780so4653381a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 08:04:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd51f84sm3062088a12.41.2024.09.09.08.04.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 08:04:58 -0700 (PDT)
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
X-Inumbo-ID: e1baf62a-6ebc-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725894299; x=1726499099; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V5aI1bVkzJGuz49f5V9XDiIshQynVSNIGL/zG79mHNw=;
        b=J0jsEHM9bS+zeMojCr9adTKFnwfjvYclRSt9xI+1o5Tzbus7kj/9t8uPw+RIaRUvlZ
         kgnFIz7s4OemxBdW0C5IlnHg5DlWux3pJU7TDzD3ZhxswmvYq8H0XXznM1ZYq4NVGpJX
         c+5HqVxfsj/qZup4Nx/+h+j4f6xTJbG7vQngGIoiWeAxJBN1ypHFwLNdRPCRjT5p6q2y
         fJTjV63o6xVk4KcBNvHUXNAAkzpOUc9v8rBPLbd3X+JmZJPfGRfX05OcfMCi0p1wgZ6l
         QxekDF/69UIoHNXCbNsrITF6JqlsZ96E2nT4zpx6nTSLh+NQ02PT9ijpz+gFTcO8vQ9h
         4oTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725894299; x=1726499099;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5aI1bVkzJGuz49f5V9XDiIshQynVSNIGL/zG79mHNw=;
        b=EUzczm6VUEugE7JVsYu/tIgfgtqkxEKJ3w51Iqcu+Sc+RBuxIrZWL3N+971m6U/KRd
         jViJ2EluLTkJYbb54fOvCeOIOXYICYuGifBHYN0qJFoxKxlP5E7R6ljepIUKWv3vlYKe
         CuGYr/fFRQyW2/e4cNzcGL5S4rOl21O+v7XWgpRqAZ5gNQgyC63vwJgss9xnLpxXdIxG
         rsY9UBn1dLQ035x3Vi9qk7jXPMcMvvi5TMvZ01K9+6s7RIeSuUpvDkA8QJ6o5VR3csgm
         iRABE8J6BT1xu8+WHCsqwwq3Uiyb2CFWn1ONn7MS+lliOcaEH20HiD27draaqEeX6JAF
         qFkw==
X-Forwarded-Encrypted: i=1; AJvYcCUQX3SI0fAkM+lFWd5WzPLAELSD0jghD/QVRE0LMEHf2e6e7xny3PLg/JApytX+9AKHDf1E01pE2xs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDf0thyUZGFjCocae79tyn5yrABuuLSECDM4ndeejBrxz12KKF
	G+BrPkqliwW2V1iEePp2GXWM+RYWefc0p2kkv54WDtzVJoFpidWh6vC0MWTG+MBUNQ16AEa8GSo
	=
X-Google-Smtp-Source: AGHT+IEJRrQKCCj3B4N6b5XcDbclU782MOr0e2AY4LU5TOVvkkwQCde1shjTf7yo2FdnYs40Rea/+g==
X-Received: by 2002:a05:6402:2106:b0:5be:fc0b:9a6a with SMTP id 4fb4d7f45d1cf-5c3dc7c0564mr10066946a12.32.1725894298623;
        Mon, 09 Sep 2024 08:04:58 -0700 (PDT)
Message-ID: <201ce8a6-ee8f-44e7-a975-5d267e1dacef@suse.com>
Date: Mon, 9 Sep 2024 17:04:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] x86/time: pull cmos_rtc_probe outside of function
 and rename
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240909145455.7517-1-roger.pau@citrix.com>
 <20240909145455.7517-2-roger.pau@citrix.com>
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
In-Reply-To: <20240909145455.7517-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.09.2024 16:54, Roger Pau Monne wrote:
> Rename cmos_rtc_probe to opt_cmos_rtc_probe in order to better describe it
> being a command line option, and rename cmos_probe() function to
> cmos_rtc_probe().
> 
> Also move opt_cmos_rtc_probe to being a static global variable in preparation
> for further changes that will require the variable being global to the file.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>




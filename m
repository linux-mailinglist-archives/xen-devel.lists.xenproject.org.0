Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA86A65412
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 15:45:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917078.1322081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBi5-0002lU-3l; Mon, 17 Mar 2025 14:44:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917078.1322081; Mon, 17 Mar 2025 14:44:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBi5-0002iz-0Z; Mon, 17 Mar 2025 14:44:57 +0000
Received: by outflank-mailman (input) for mailman id 917078;
 Mon, 17 Mar 2025 14:44:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuBi3-0002ir-P3
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 14:44:55 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6352911f-033e-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 15:44:53 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso24883805e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 07:44:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe292d0sm107231695e9.20.2025.03.17.07.44.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 07:44:53 -0700 (PDT)
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
X-Inumbo-ID: 6352911f-033e-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742222693; x=1742827493; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zozXyHVCUgMEwbNld1UXQkRy7P/EFUIXePZm5+E7ZEc=;
        b=BSpbMHhYRna5P4RMH2aktXs/08zSc9M04KgIU/RZsRufybvJlVDFccVxOK5T9rJ42U
         mnPAvbRLQpQ4EglPCAIX2hT/K5VbkOG5q7ONK2TUDIvYUEyrxyMbxjjTbhYwhKT95cd+
         4C4008RFORxJO4YmQTKRs6lYugSeDbyesxFGbQEGgtRZxYrzY5uhoyUDbWsjNyt16z/V
         lfaOnD6QrfREiKK9FjPALGVMDKHfIDa1N/Xj8/Mm0xCVhTHF+zWid+Sj61KfqGlP3+tJ
         K83e08RaIfmG1nafOcYbYElI9Ic4/H9G1qgEJ88cPTOfCU6GcA8t9u5RviB14prvQtfa
         4BOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742222693; x=1742827493;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zozXyHVCUgMEwbNld1UXQkRy7P/EFUIXePZm5+E7ZEc=;
        b=sGwEs9IQvFDRymPtRUART8F0bDmXn+Hk+I6Nsdu/xg8WL0K7F4B5gpt7vekWuYUU+X
         faqsIvKkz+6+tiW2WpMjtGW0QaTUibmMrIl7G2T/y1IERcIz4GdjfiNXRxTR4rbOpF3D
         yjll6a353tTTWqtW8DOjP/LAWJF38xtvQC1eRSu9uJonSeg9VgVDWq7aXOruD57cIqbr
         A/YniPBZf6Il5jbvVZzenwAbBPftMFCezZxyYcmIeo7CY0bX37v1tVJpefZA+U6RiLTx
         Ad5xDxgki/s0JZgULV7Y5UD5y8G7wwGPNru6FQSZE5ziV56iSotju+qF77SqH9Qy0yKF
         Keyw==
X-Forwarded-Encrypted: i=1; AJvYcCUTBoS3fiGn4A3Wp5HVwV1bPAWGzVl8Aym111oisJ/Vn/teZKqSM8MQhfIMNryOXbQNoHABr1kklmM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0VgYmvZ093m/AjuvgxQVMl7jbQ6GMkz+aZmv0l7KhaHD6O+X7
	NW52iiWrWF75Q38eKQZDRxk/qf8YWHkMAtfO7xBU2r/HOb24a7GcXTbjCVcwSg==
X-Gm-Gg: ASbGncuwTeDVhlK3ySh9JjoXXKHmapM53KIsDwem+pIKDxU/O6PTutz9GMnu9JE0sJK
	7m6gqtfPDyBYtTv04RBMiBW2iz4K+bsPaEs1NY7C8cwsL364E7TZ3/1WCVQpRJ45QI9CI8liO30
	uBRteFTZBYGdGOk9OFc3ep84VV5rVSwajGVctQ6duWyGEhZgH9nDHgxQ9IBhDtnGch8DVBrR+ZF
	q3D1cVdP/I0HOhILDfHk500O8WBdWtzZ5mBHwJ4LyRfSrbx+w/Sj2Piyx1WAAT7y9eBVldh1QFd
	JEv0CjxxtRv1/mgfccfiw33LsYxihuPzZkWH3J6RO0TpmmGB6IuG7+2qUw7t9Y6ULmC0OqmKMn8
	DZu17fweGAw+faiujfpdc9FPdbkhfdPk8zEzWA8nP
X-Google-Smtp-Source: AGHT+IGs2YO7ekLkGSOvBi4bEogj+Oa85LIR4EFgRpStsOd8Re++mgtZBVHdlsYvBNoDci4tof6ZWg==
X-Received: by 2002:a05:600c:154d:b0:43c:f184:2e16 with SMTP id 5b1f17b1804b1-43d3897185cmr1213335e9.5.1742222693280;
        Mon, 17 Mar 2025 07:44:53 -0700 (PDT)
Message-ID: <79f4771d-9087-471f-9de9-d6142215e31d@suse.com>
Date: Mon, 17 Mar 2025 15:44:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/23] xsm/silo: Support hwdom/control domains
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-21-jason.andryuk@amd.com>
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
In-Reply-To: <20250306220343.203047-21-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 23:03, Jason Andryuk wrote:
> The is_control_domain() check is not sufficient for a split
> hardware/control domain.  Add is_priv_domain() to support allowing for
> either control or hardware.
> 
> Without this, a xenstore/hardware domain is unable to map a domU's
> grants.
> 
> This silo check is for grants, events and argo.  The dummy policy
> handles other calls, so hardware is prevented from foreign mapping
> control's memory with that.
> 
> This would need to be expanded for a standalone Xenstore domain.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

I think what first needs spelling out is what the function of SILO is
when it comes to specifically the control and hardware domains. Should
the two be able to communicate? The answer isn't obviously "yes" imo.
Yet if it isn't, ...

> --- a/xen/xsm/silo.c
> +++ b/xen/xsm/silo.c
> @@ -20,6 +20,11 @@
>  #define XSM_NO_WRAPPERS
>  #include <xsm/dummy.h>
>  
> +static always_inline bool is_priv_domain(const struct domain *d)

(Side note: I don't think always_inline is warranted here. Even inline
we prefer to only put on functions defined in headers.)

> +{
> +    return is_control_domain(d) || is_hardware_domain(d);
> +}
> +
>  /*
>   * Check if inter-domain communication is allowed.
>   * Return true when pass check.
> @@ -29,8 +34,8 @@ static bool silo_mode_dom_check(const struct domain *ldom,
>  {
>      const struct domain *currd = current->domain;
>  
> -    return (is_control_domain(currd) || is_control_domain(ldom) ||
> -            is_control_domain(rdom) || ldom == rdom);
> +    return (is_priv_domain(currd) || is_priv_domain(ldom) ||
> +            is_priv_domain(rdom) || ldom == rdom);
>  }

... this would end up being overly lax.

Jan


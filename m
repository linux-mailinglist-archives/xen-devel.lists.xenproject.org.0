Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC25E8802B6
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 17:49:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695507.1085330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmceC-0004ok-KY; Tue, 19 Mar 2024 16:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695507.1085330; Tue, 19 Mar 2024 16:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmceC-0004mL-Hu; Tue, 19 Mar 2024 16:49:08 +0000
Received: by outflank-mailman (input) for mailman id 695507;
 Tue, 19 Mar 2024 16:49:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmceA-0004j8-9N
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 16:49:06 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 983de763-e610-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 17:49:04 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-566e869f631so6629277a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 09:49:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x1-20020a056402414100b00568d2d4e4besm2947416eda.54.2024.03.19.09.49.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 09:49:03 -0700 (PDT)
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
X-Inumbo-ID: 983de763-e610-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710866944; x=1711471744; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ak6OBi7xOtHRafKXxTWNWHJwCs6mqQu4V0EKs1GUWCk=;
        b=glxM+z7pWX1s22IKBJzw6DgBBr+77XFKsby3zujCbuDCvJKxy3/yOa2wgoKMsOu9OW
         Itm+5FxnZMkelGy8PfDbiajspl9vwy+KwTBDkbjt3GRrbC3X/LM/QeTdSct/ssgmedYM
         05jcyMYxU5q1+UwF7d2X/dI5EZIzra9ocHZjU8xur+r4w/ki/pg028Il1LmRdn2G1tja
         wysxPRatjW+FAGXqw7cPpnTDpNUy61VP3Xr8alVxvPgkjh4/TZkkuRjcfsOoDRoJV58X
         IowrpvbE+u3PuOpN71Au/WxyOFxIMOebLiV7Xzawf97LTtNk8pmG5xdvnlzwXf0J+oug
         gHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710866944; x=1711471744;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ak6OBi7xOtHRafKXxTWNWHJwCs6mqQu4V0EKs1GUWCk=;
        b=dRuhtbApkq4G9DjmKY0EYUapDInnX166doPWbFE9I6D+8Nrj+tt0CW4ykYRGWxCaY2
         D1gmwHYWTZOkSjbjupg5MEqHgNKKqoF18xc41clGHNHUwxh2JmU0/0IJN/M/WnILoZJA
         AdFpPL6CXV9Ost7UyfXABWqstPQoFFDSHvB0r3g/tj6zqgcQPdxRZOnZbfv6yjx3ZZXg
         CpEkVhcLHI61vMbzs4qntNheyIyIj2pIQaQ79VUgdkkNXTvNkY9D5hScZKRZq7Dwg4Y8
         bnwgqW9UhqbbPaomhZI2cPYhgScrKVSkOhujx+YV0rDFuYOGZXXiXTbajt8SwxIxl/+X
         UTqg==
X-Forwarded-Encrypted: i=1; AJvYcCUHY+aSouV9NjL6nwblOHbrqXUbX/hI8N+6ECy6TY/memjocqP4rnXNuxp8sIzrMT1BhJ4q7lxrNketDqSXToQtrZjexyF6C4CHDZNU5fc=
X-Gm-Message-State: AOJu0Yz81AinJlL2BVlXNjf8sVKFLcsJkC7JeZBcgrULVCOIgAXPrJXw
	cVXPzD1hShaGQ/qpw7W/yIftpJyB2eYYBSNBIdTNRHAM3SGtmMrlxVN28yCFKQ==
X-Google-Smtp-Source: AGHT+IGAYEN5Kczb5Lz7KHcRf/+98ZXMvWFAjvH5S2gIZjbEiOKFPIJYoH0+wj+tW+24GMSxZQeNAg==
X-Received: by 2002:a05:6402:1f82:b0:566:6640:10e5 with SMTP id c2-20020a0564021f8200b00566664010e5mr2819072edc.12.1710866943977;
        Tue, 19 Mar 2024 09:49:03 -0700 (PDT)
Message-ID: <baa244dc-eec4-43ea-bc0a-41f3e4340975@suse.com>
Date: Tue, 19 Mar 2024 17:49:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/boot: Fix setup_apic_nmi_watchdog() to fail more
 cleanly
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240319144802.3894710-1-andrew.cooper3@citrix.com>
 <20240319144802.3894710-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240319144802.3894710-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2024 15:48, Andrew Cooper wrote:
> Right now, if the user requests the watchdog on the command line,
> setup_apic_nmi_watchdog() will blindly assume that setting up the watchdog
> worked.  Reuse nmi_perfctr_msr to identify when the watchdog has been set up.
> 
> Rearrange setup_p6_watchdog() to not set nmi_perfctr_msr until the sanity
> checks are performed.  Turn setup_p4_watchdog() into a void function, matching
> the others.
> 
> If the watchdog isn't set up, inform the user and override to NMI_NONE, which
> will prevent check_nmi_watchdog() from claiming that all CPUs are stuck.
> 
> e.g.:
> 
>   (XEN) alt table ffff82d040697c38 -> ffff82d0406a97f0
>   (XEN) Failed to configure NMI watchdog
>   (XEN) Brought up 512 CPUs
>   (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>




Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0700D8B032F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 09:27:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711185.1110967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzX1j-0003ja-If; Wed, 24 Apr 2024 07:26:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711185.1110967; Wed, 24 Apr 2024 07:26:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzX1j-0003ho-Ft; Wed, 24 Apr 2024 07:26:47 +0000
Received: by outflank-mailman (input) for mailman id 711185;
 Wed, 24 Apr 2024 07:26:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzX1i-0003ej-1N
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 07:26:46 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0085c1b2-020c-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 09:26:44 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41a1d88723bso24942225e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 00:26:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o12-20020a05600c4fcc00b00418a6d62ad0sm26604454wmq.34.2024.04.24.00.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 00:26:43 -0700 (PDT)
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
X-Inumbo-ID: 0085c1b2-020c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713943604; x=1714548404; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M5X0Zdmp/5vAXHNnlark0kMUOgAR7ijjsaVoa8nppOY=;
        b=JjX/hayPh8BDXNyzaZNyaV4mZ2SAHAcLKOUuRUehoZWxlhg1q0m1YECd0HWo7JpssX
         sgKdKY2H8pLXRN3taIksfGW5+uuM+R4jDVOrTK8mfY0GPR9Q4pUfJ36nx4iEZszsZzAx
         Wq0dATwA3xl88pBACKYyLQHPSpCOWh3t5YpMWsIq8TKq8WqzLEBw7wYmi9TN236rkdL7
         0GdilqJvdXkaS4odDrVQxBV5hihhXL2LAumloFQdVibCUwqNOKO7VQKQ7kGHNml95j9P
         /GwHcqxLHII/KEa9fZCZ1tZm5fHtul8w7WIR6cPt3KqKb7G+fR9mSAJglvTsrzcCZv2V
         IwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713943604; x=1714548404;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5X0Zdmp/5vAXHNnlark0kMUOgAR7ijjsaVoa8nppOY=;
        b=KF7nglCoCIIOwABtCVQvZVAIrQwJ/AKxQZ/EQWyYbYsAV9Ipkbl0k5e05JDL4xSfSc
         hwsx78hwtsJbjJQGQMkHsV3hDcdHzrTQyFTCt3U2xXNPZZT6ysAC6JRRoHIhJM7rZLtI
         WVtYTxxiobz9GzbdWoc2LBVRi1atN+uobFNRQIad+1FvdezNSxuzv04/WByE4X1fIsh+
         Tk2IgiOunq7r4JmAP0a6R5y9FxOJsfjACsZVsL4LuC7W96bl04P8wOXJ/IWme7hI3ssu
         UPsED/WDQXyUta8DNpBK6Ri9pz2hniMBqbu9FMSs1OefT72ZCT+lzeBYr9vIwXcwBaD9
         lXBg==
X-Forwarded-Encrypted: i=1; AJvYcCUEwk/tsiFj2JBITuaod427aEFPOkNmcJMtGuP0mVY/IvPIzEvvFV3Ho0hxa0Srg6GTHOViz2aFGkHqZ2e9v10l5GYhWRg1xA+TjPbzVWI=
X-Gm-Message-State: AOJu0YxhMCil91mAqjCUIa5zUmpzPLGjA3a1hCrbeXUqH3xskLW530mK
	Auq4yVM7+gR/yW/flGgijyL3HT8vKb2k/f5FhpvzqaYpKPxHLzyVRVZ4duv02Q==
X-Google-Smtp-Source: AGHT+IFL6c6aZfyLIfunsuk5w5/g6d7vcpSIFDYDRURn/vwbXzshyaNWKtvYHfSrHoCRklxzndr8Rg==
X-Received: by 2002:a05:600c:3108:b0:41a:ac28:1fc8 with SMTP id g8-20020a05600c310800b0041aac281fc8mr984347wmo.33.1713943604004;
        Wed, 24 Apr 2024 00:26:44 -0700 (PDT)
Message-ID: <19c9e4a0-90ba-46d0-a0c0-9fd14db79be1@suse.com>
Date: Wed, 24 Apr 2024 09:26:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 07/10] x86/acpi: power: address violations of MISRA
 Rule 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1713885065.git.nicola.vetrini@bugseng.com>
 <9f159a0c653c3fb9dd192c1f888a16052f1b026f.1713885065.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <9f159a0c653c3fb9dd192c1f888a16052f1b026f.1713885065.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2024 17:12, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>




Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B33A78735A4
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 12:34:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689089.1074062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhpXI-00024P-Sf; Wed, 06 Mar 2024 11:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689089.1074062; Wed, 06 Mar 2024 11:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhpXI-00022d-Q5; Wed, 06 Mar 2024 11:34:12 +0000
Received: by outflank-mailman (input) for mailman id 689089;
 Wed, 06 Mar 2024 11:34:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhpXI-0001zq-8B
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 11:34:12 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72eb2168-dbad-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 12:34:10 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a456ab934eeso102439266b.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 03:34:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h5-20020a1709062dc500b00a45beb1c671sm416534eji.13.2024.03.06.03.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 03:34:09 -0800 (PST)
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
X-Inumbo-ID: 72eb2168-dbad-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709724849; x=1710329649; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dNS0gCLcootkBbIZxm+AA/f3JUpLYF19paH20sxMMq4=;
        b=Yw0xXKEYY9FBY9LMoWb2sIabhjHRIRSrpK5EEzGHt9mivq+vnG8BvkaEqFrdlB3Rn7
         eb6loRGvHxkFN3E8gWA3PuZgb37Py01hlIPbJxnwRVRWR2Iq76wa8g7hIDxCU9giBowT
         ze62zn3tDFWVpqYjGLcZ9JSlQSCIe1sQaiD1M36kcjbjBSX+s7jfA35CK3TL5816JzBY
         EpABC4Hm+PIgiQbGts4AEHEIrxzg7sCXevdjcXv2XgVnTbdpVKLvm3+oUyzGsIU4LTCn
         CzCGbHTDEkXDLnC00kFSEtSN13PrXT1B4Fhw3CrGtef1pOiocdagxCmWFy2R0ypY3+oB
         XKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709724849; x=1710329649;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dNS0gCLcootkBbIZxm+AA/f3JUpLYF19paH20sxMMq4=;
        b=WwVBljDUhfMTriAHQIt04/MPFFsk7DE0lkcgye+/0rwPw8CKszzZn0Mtlg+jdmPy79
         sG0MbkL4a3DD+ZdYMwgC5CsFeaVwVvXl5behwtE4cj2/91d4UY/+Y5L8LXBRNyG/ETl2
         JHLMXWEvsgb5pG9MijFCP5tKLsEmR0tjDI4mC1EkzFJ8mSfK1v5wb1pzUrwo1XVP0JPy
         D0/xfBF0M6xsra73uZbFrYwQjm3xzhWf1C5RXyTNVuelFKuLZi70Bx4i5bPIlMPsnqHo
         iYkFx7oXQPvJPMYBBrCC/QOAkS661vsqzfg3SDmtjj071E64SgL52aGkSGbXtIB9eR1w
         DD9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqv0K/LWIScw1x1MOogU+Csmne236k/SrjX8ybviHo7zEOLMtTQ9jLttgYx9AYNKlBM+mU65eBqEQuWPHzNE6pHXORP8yUOcMNypjHKzI=
X-Gm-Message-State: AOJu0YzOKQYUMY3LBJubvGgg81l4XwTXQT2Eewzoyv9xkJbfCR+68qX/
	YBScG5OJQwVWyV8TqMoYj1SzfTALM88SM3qfVhNMl4LqwbR8bdormgONWAYYJg==
X-Google-Smtp-Source: AGHT+IHJ2eRNl2iKwCCxtsP61JUNxJ9mSoja+Kto8uOBjqx6nHeBQ5v6xNo2JPwqdBLXXqXSS8vViA==
X-Received: by 2002:a17:906:6b10:b0:a45:9e62:ff54 with SMTP id q16-20020a1709066b1000b00a459e62ff54mr4045071ejr.46.1709724849430;
        Wed, 06 Mar 2024 03:34:09 -0800 (PST)
Message-ID: <dd7a28de-a58d-40a2-88cb-81e59efe083f@suse.com>
Date: Wed, 6 Mar 2024 12:34:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] SUPPORT.md: add xen-9pfsd
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240306112736.2546-1-jgross@suse.com>
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
In-Reply-To: <20240306112736.2546-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2024 12:27, Juergen Gross wrote:
> Add a support statement for the new xen-9pfsd backend. Set it to
> "Experimental", as some functionality for Linux guests is missing
> (only tested to work with Xenstore-stubdom).
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>




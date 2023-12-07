Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F53480843C
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 10:19:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649654.1014428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBAXZ-0007Z6-6Y; Thu, 07 Dec 2023 09:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649654.1014428; Thu, 07 Dec 2023 09:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBAXZ-0007Ws-38; Thu, 07 Dec 2023 09:19:29 +0000
Received: by outflank-mailman (input) for mailman id 649654;
 Thu, 07 Dec 2023 09:19:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBAXY-0007Wm-0D
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 09:19:28 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6efddcc-94e1-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 10:19:25 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33349b3f99aso689029f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 01:19:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e24-20020a5d5958000000b003332fa77a0fsm921384wri.21.2023.12.07.01.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 01:19:25 -0800 (PST)
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
X-Inumbo-ID: b6efddcc-94e1-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701940765; x=1702545565; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+0ZQvbqBO2hFg0p1rdyjyhc9/Ztec2xTeb+rkYkL8rU=;
        b=Q0oeoOjEtsLSsWAKNdMeTiSQh+0UC4FcEN6AHHZwBli4gxJ04tJq6/ziXT0+cpvnBc
         sTLCCwrBkL5XgzjcYN9eD/Lu48wuAVXuQXq4Sk4E0QjPeQiFF/sl+TxW0RB/9Insa6Ld
         eOBhnsN5CGsQtMafUg94/apU98u24rAOMG8EIzFw/mwoyd8ExIbNrHMyBsCPdJ2FDhx2
         BjAiPNdReqeGblNca3w7B+VZYG8MyUS3UsFLXvq8Qu4OAAgyAOm2/YJWitKTdtJiXANC
         J8w+VuOHOGq+EtOMzhx7QTh+wqcNaoja5gQXHhRUfUckV3FQzkaoDP+R8UtHX1enoAdZ
         ck8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701940765; x=1702545565;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+0ZQvbqBO2hFg0p1rdyjyhc9/Ztec2xTeb+rkYkL8rU=;
        b=slgrsMIQcrFUckE99aPtTsWs88XrlZaSzrf3aAWCq/JgDULgDE2JXD1Z9s4vQv0KiF
         uVGIhkgMJ9fvcNllVggqsDTT31voeSvrFAKf/brMQV0fXLfiAHusrg6Kh5mQFr1QeST7
         wbkqq8fNqsWt9voLjanPAynB4kQBVuj5OsG9YKziQuxW+kg5OXbSNM9y+fOditH6Fx4t
         XdixDx5QReDDpMUWDXyBarQ1OfMIc6rCQDb55f+KykAb0+6yapcNMICA2hKRqv5VtXIG
         twIx7SfdBW/S9kPO+X30WGHfQkDqGCM5hxP7ov5OmELCWtHJaGDNCNuCcM1QFbjM3a6z
         VGlQ==
X-Gm-Message-State: AOJu0YyjJPFxYsmY9DXk11GhLNGJjGS8pTE4bDFKy/fTtYdw3lN3rO0u
	nXMMTywW/Wwc7HBCEglNBBEd
X-Google-Smtp-Source: AGHT+IGXgatIxeqyY8VwVrKKuNFldLfdCUrGL+7VXQlcwT9J6qlr4SSc8LMtdR0dBIUnSkxE1EaTHg==
X-Received: by 2002:a5d:6511:0:b0:333:2fd2:51d1 with SMTP id x17-20020a5d6511000000b003332fd251d1mr1190540wru.74.1701940765504;
        Thu, 07 Dec 2023 01:19:25 -0800 (PST)
Message-ID: <2205366c-c66a-419a-9232-ec41432127c1@suse.com>
Date: Thu, 7 Dec 2023 10:19:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/5] x86/acpi: remove acpi_pic_sci_set_trigger()
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1701936906.git.federico.serafini@bugseng.com>
 <f0c7d42c12a0b89c61265cdfe67a35b07d220aa0.1701936906.git.federico.serafini@bugseng.com>
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
In-Reply-To: <f0c7d42c12a0b89c61265cdfe67a35b07d220aa0.1701936906.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.12.2023 09:47, Federico Serafini wrote:
> Remove apci_pic_set_trigger() declaration: there is no definition and there are
> no calls to such function in the XEN project.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

A reference to the offending commit would have been nice, the more that iirc
I had already gone and fished that out for you.

Jan


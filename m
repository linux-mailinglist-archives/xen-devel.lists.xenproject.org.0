Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB0A8CD63B
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 16:53:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728622.1133630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9pC-0000Ac-TV; Thu, 23 May 2024 14:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728622.1133630; Thu, 23 May 2024 14:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9pC-00007A-QI; Thu, 23 May 2024 14:53:46 +0000
Received: by outflank-mailman (input) for mailman id 728622;
 Thu, 23 May 2024 14:53:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sA9pB-00006r-9f
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 14:53:45 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fae73fd-1914-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 16:53:43 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56e1bbdb362so9613849a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 07:53:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b01a2esm1943060566b.185.2024.05.23.07.53.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 07:53:42 -0700 (PDT)
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
X-Inumbo-ID: 3fae73fd-1914-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716476022; x=1717080822; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cpsNufTSxl5uFSh8vwPZqZgoWvtPcUnSgHFo5kmo+6M=;
        b=bIOK8SegaknRCRTlw+bkA/lyaNvqQBMS1cNeAbS9/1rwBWmBN99UOaTbV+On6J5trs
         CPZHJ/CGoXMXGAFYP0UMO1/xM0+SJQdzCBj9PhPNAPMjWjY3QxN72WW+6CNGyxC/G8zn
         flzxd8AOY77vZIXHx7hEYyFo/R9UuETeHscsSv3F7evmCkJ/mLnJQNqASHGldJM8CIzJ
         aAJEpeLF75jIxepaywiA7OQNwdqkvxbXgKwpr9q2cOiumSB4nmkMcginqRixFFXFLquk
         RjVL53yR+3aE4on1I/Ta26UGNNitY07X1u2tK6auG41okvBnXo1LtO8p5ekv74RuJXw0
         +jcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716476022; x=1717080822;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cpsNufTSxl5uFSh8vwPZqZgoWvtPcUnSgHFo5kmo+6M=;
        b=QjEna6ZODNrghVxA3f1SIfxTOKrSkHYCzQzcuNtHs6DeCv+RTqVFbRHw43QO5VqE7U
         w4d1aH/zjJeb03FnNWaCpXihWUOvs/MkOFQwmn19Cfk17wq+W56mC6+l6g9UF1Zj07hk
         yv4rgxQIgAJwR4KWgvYHmOAJyeYc09ToJ/cNTUjWLLNEeqMRhQiaerUQ6CYnK6rKRiJS
         mlsSD6szVPjWJwjAaW8Jn/yRjK4y3Sj7FRuTDpd77709YQAaF8FEqPIq6wP/leOIZC+t
         xR3Lv+f0hoR566or7TGVlZcR6meKr14Q2IfJmX4jSKFwRmWJ23l9WCRRL4bdfLFeYSMK
         2mww==
X-Gm-Message-State: AOJu0YyI8dm+L5BDxY+Hk85M4TfqrdUVpwAFonU7R0N0+S15JQ0qh1nq
	X4ySyVaZY02DVtSXsM0gPs2EctYN1J0MqtGXAzxhOw8mn0zjWKbv3Pj6Ar3+EtGxBsz+3IoZF3s
	=
X-Google-Smtp-Source: AGHT+IH9iXYtnBw1AZH2BewLNNWfoNxFcWseBv+hERq2zEhcfoA6mdP29P96Wslv6pLobJoT64gm0w==
X-Received: by 2002:a17:906:6b93:b0:a53:ed1b:f3ba with SMTP id a640c23a62f3a-a62280d68admr471088566b.28.1716476022573;
        Thu, 23 May 2024 07:53:42 -0700 (PDT)
Message-ID: <6ad6074e-26ce-43e0-918f-63f28723397b@suse.com>
Date: Thu, 23 May 2024 16:53:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [xen-4.17-testing test] 186087: regressions - FAIL
Content-Language: en-US
To: osstest service owner <osstest-admin@xenproject.org>
References: <osstest-186087-mainreport@xen.org>
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <osstest-186087-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.05.2024 16:40, osstest service owner wrote:
> flight 186087 xen-4.17-testing real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/186087/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-amd64                   6 xen-build                fail REGR. vs. 185864
>  build-amd64-xsm               6 xen-build                fail REGR. vs. 185864
>  build-i386-xsm                6 xen-build                fail REGR. vs. 185864
>  build-i386                    6 xen-build                fail REGR. vs. 185864
>  build-amd64-prev              6 xen-build                fail REGR. vs. 185864
>  build-i386-prev               6 xen-build                fail REGR. vs. 185864

These look to be recurring, yet at the same time these look to be infrastructure
issues. This not happening for the first time I'm not sure we can simply wait
and hope for the problem to clear itself.

Jan


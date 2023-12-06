Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB894806A31
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 09:56:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648991.1013185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnhh-0006DA-IJ; Wed, 06 Dec 2023 08:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648991.1013185; Wed, 06 Dec 2023 08:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnhh-0006Ak-Ff; Wed, 06 Dec 2023 08:56:25 +0000
Received: by outflank-mailman (input) for mailman id 648991;
 Wed, 06 Dec 2023 08:56:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAnhg-00066u-QA
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 08:56:24 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54b73f38-9415-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 09:56:23 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3335397607dso602402f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 00:56:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e8-20020adfe388000000b00333381c6e12sm11594901wrm.40.2023.12.06.00.56.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 00:56:22 -0800 (PST)
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
X-Inumbo-ID: 54b73f38-9415-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701852983; x=1702457783; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MvhoTOQccWtGwDlA1/GoMpYHcbH1FC3jtYoGV65iBR0=;
        b=RyeCpDOlvr7bfj+OyMNI4NpvFxEakpCemeiGOAY+jx2dWcoxmVAQTLgbGtVvJov4yv
         Zvxiug7Da1tR/ykagpUUmD+lpZ5xVmcwte9lCRVG+Ya9Zi5N1z2uZPFPy11Yzshq1Ict
         ADv3BdzA/rZIbj/OGokaTxqCBPKPseg2egdzztAXoglGwJloaENIRdfQ3C+Q+1+84wlj
         jL1AdQYUe7hR2TO79WpjV7jNxlehZT9/5myAZBZK1V2GAkCJp5kqv4W5ZTn7ZEs6WX0m
         ZRKk5TQqKO6ur79InhpdZLbby7l0lHNvkfNBF2zXuxadt/lyjaqUBe0hGKIVmaOaigkj
         VikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701852983; x=1702457783;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MvhoTOQccWtGwDlA1/GoMpYHcbH1FC3jtYoGV65iBR0=;
        b=kIU6U3Xbo0ZgxEnhBWP620b49gLFc//nJicSCMqabvdtY8zsEizQZHCjCocrBr3YKf
         /tBnZUMSMFsc//xGpZmz/qPgRRNUlz8d51Fh/EBv6BbCIkEyHV1C9BEIbs8xoMznc25C
         FuDqY2qW8APDprzM46Wrp0yWMpi0LrCOoiG1XNou8B5a7YH0Yt66095Ap//tcpuZmLAE
         cyZzAyKCZK0oCFKkZ2+MtgE6RniSTekhAQ6lpIiEJM7wmttLQHh2pNLbhKTfUDcZw6K5
         UJifRwgOvtiB5MhUvOL4ACc5pIEKZwmB1ciFAPfZ3xIKlNc5uIiiBUYTiFAJ32jRq5FM
         pn9Q==
X-Gm-Message-State: AOJu0YyWI6lyrGIkio93FMtY7r5Taqr8QH81MV0rRcATiy3hU1/lVd1q
	XyObZ8MTuT7Bu976FPSEbndj
X-Google-Smtp-Source: AGHT+IF7uoQvfWHcyQbPXSX+B0exZAX16AVdpMqYS+/9BcH4swgCMrWB/nPG+d3+fQ/ma4vPEuCcCA==
X-Received: by 2002:a5d:6108:0:b0:333:2fd2:2ef8 with SMTP id v8-20020a5d6108000000b003332fd22ef8mr294689wrt.113.1701852982949;
        Wed, 06 Dec 2023 00:56:22 -0800 (PST)
Message-ID: <168ecf81-35ed-43dd-9f68-f2cb3246fbb4@suse.com>
Date: Wed, 6 Dec 2023 09:56:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/6] x86/mce: address violations of MISRA C:2012 Rule
 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1701764980.git.federico.serafini@bugseng.com>
 <16a4587adaac7b116026c0df4addd254d4a33715.1701764980.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2312051918430.110490@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312051918430.110490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2023 04:18, Stefano Stabellini wrote:
> On Tue, 5 Dec 2023, Federico Serafini wrote:
>> Add missing parameter names. No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>




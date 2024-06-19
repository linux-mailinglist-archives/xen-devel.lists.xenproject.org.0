Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC3F90EF44
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 15:43:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743819.1150802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJvaA-0003cL-03; Wed, 19 Jun 2024 13:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743819.1150802; Wed, 19 Jun 2024 13:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJva9-0003ap-Tg; Wed, 19 Jun 2024 13:42:37 +0000
Received: by outflank-mailman (input) for mailman id 743819;
 Wed, 19 Jun 2024 13:42:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJva9-0003aj-4g
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 13:42:37 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c96ccc5a-2e41-11ef-90a3-e314d9c70b13;
 Wed, 19 Jun 2024 15:42:36 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3632a6437d7so638095f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 06:42:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c7a2ae3f36sm2835110a91.13.2024.06.19.06.42.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 06:42:35 -0700 (PDT)
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
X-Inumbo-ID: c96ccc5a-2e41-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718804555; x=1719409355; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=et1j6vvmM1PMcLpImEW2C1YU37Ft6lKHqo+EnZSq9Yw=;
        b=gd2KbCYORAuR5FrwbrC7NYKgHzQXbD1WQ/u4bh/dVNeC0CzYGCGx3AolRKRXpM1VAw
         Yp50Sf1DL2nGJpMmB2foEGvqGo9fizuh012Kt6Ut5M+nnAWXYMKJHXSrzsWJdsR084Tv
         SeIbynOnz+eVqMuVQ4fOvb5ML0Y5itnX4LunOEt9sB1zr5R2msefj/9jkFzf0/S3sFTA
         ZFoWinxrR8GJf3BGw3eXo2EzIJzaddDoCeAsKu77OXjQ+Dwc1cxXpq76swTpnMnRgTKA
         MPdFBena74f+thaSDy7D4MxIMBav0n0P9sVjaZQnVHwoZJvs8HBKuUxYgw0jNpu8Bdmn
         1+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718804555; x=1719409355;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=et1j6vvmM1PMcLpImEW2C1YU37Ft6lKHqo+EnZSq9Yw=;
        b=mZbJm8xMctSXyHbxu7ZjLIqQdcjymPqwp8WbHWRmAJlU6/TJ+m+9IA4yYuR9XdJ/3E
         0yiTc7dLgqnW28z3Stf/hRk/l92taR5ZS869l6hCqtT32P+i/6TsEiaWqHQQvaC2asZM
         1TKnVONclyfJ3ZfVpzExXR8jLX2fVnSukDKaCHjbdYEXDttuGfz6KG9RaW8Pf+tvXe7k
         MoUIm9/6nKcj+Lh3kL0CvTb5547flIg1yGgz3NJptk8TVZfsJCmfgZKsqIwdZMA+1Pqf
         jjfTDXl86s4WQuc3sHPM+YSUnZOUR00PeiKa2JU/ZNdBksUvJkMCNfKlsdzY8wkI90Tu
         0uqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaUuPyc3QMNmJMInKUWhK2ack4MpzhJUKIQC02QoOPs0eFEDS0tovVHspLQli7M50fB3eLqlLx/l2vACkhXSe+tmWmBXqwfh//EdkDthA=
X-Gm-Message-State: AOJu0Yz6XNC81mFNXYN9JWq4zXiohegjt3VorRb3389ZwuFMmZjo6h3D
	3Y9jxJdPhe2HQaUzrXuTXjsqzTyKpvMsncu3DEBTOS8U7nO9hBk9QZnmo3BIdA==
X-Google-Smtp-Source: AGHT+IEPH4GnVL/N9nbRQiPuJI+QqGbYUtMdakW8VkrtB6klUMim4f0o8qqdyTPOaEQB3DYdicTgrQ==
X-Received: by 2002:a5d:6d4c:0:b0:360:7856:fa62 with SMTP id ffacd0b85a97d-3609ea6c58emr6029379f8f.15.1718804555442;
        Wed, 19 Jun 2024 06:42:35 -0700 (PDT)
Message-ID: <f14f15ad-7d16-4bec-9edc-82956ccc7bb4@suse.com>
Date: Wed, 19 Jun 2024 15:42:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MISRA C Rule 5.3 violation - shadowing in mctelem.c
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Simone Ballarin <simone.ballarin@bugseng.com>
Cc: Andrew Cooper3 <andrew.cooper3@citrix.com>,
 Roger Pau <roger.pau@citrix.com>, Consulting <consulting@bugseng.com>,
 Xen Devel <xen-devel@lists.xenproject.org>
References: <f351f904fab43f88396b3ae1b5d64e95@bugseng.com>
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
In-Reply-To: <f351f904fab43f88396b3ae1b5d64e95@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.06.2024 15:23, Nicola Vetrini wrote:
> I was looking at the shadowing due to the struct identifier and the 
> local variables "mctctl" in x86/cpu/mcheck/mctelem.c (see [1], the 
> second report). This kind of shadowing seems very intentional, and the 
> initial naive approach I devised was to simply rename the local 
> variables.
> This, however, results in build breakages, as sometimes the shadowed 
> name seems to be used for accessing the global struct (unless I'm 
> missing something), and as a result changing the name of the locals is 
> not possible, at least not without further modifications to this file, 
> which aren't obvious to me.
> 
> It would be really helpful if you could point me to either:
> - avoid the shadowing in some way that does not occur to me at the 
> moment;

Could you please be more specific about the issues you encountered? I
hope you don't expect everyone reading this request of yours to (try to)
redo what you did. The only thing I could vaguely guess is that maybe
you went a little too far with the renaming. Plus, just from looking at
the grep output, did you try to simply move down the file scope variable?
It looks like all shadowing instances are ahead of any uses of the
variable (but I may easily be overlooking an important line contradicting
that pattern).

> - deviate this file, as many similar files in x86/cpu are already 
> deviated.

I question the presence of these in those files. They were apparently all
added when the files were introduced, and said commit - from Simone, acked
by Stefano - came with no justification at all.

Jan


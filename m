Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64604A7F615
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 09:22:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941497.1340960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u23I4-0003Ih-5H; Tue, 08 Apr 2025 07:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941497.1340960; Tue, 08 Apr 2025 07:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u23I4-0003HD-2D; Tue, 08 Apr 2025 07:22:36 +0000
Received: by outflank-mailman (input) for mailman id 941497;
 Tue, 08 Apr 2025 07:22:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u23I2-0003H7-Kt
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 07:22:34 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cc2a884-144a-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 09:22:33 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3913958ebf2so4607510f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 00:22:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301b72d5sm13882720f8f.47.2025.04.08.00.22.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 00:22:32 -0700 (PDT)
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
X-Inumbo-ID: 3cc2a884-144a-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744096952; x=1744701752; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PBJ1/01DLy56cXg76sfjWaapcTytbNbg4uSVjJPNke8=;
        b=bngiWC3SiOt2NmhXaDfhvcTlSgAgPfkvWvfVVebVXteIrY/WNCRFHZ71a2d9YOA+nL
         RIWwhS4mNy4MyY6KUadZaT5t7BiguHVvh369fYiw5oOl8u86Zvo0R3K9HfLPDeglACtL
         ulBUEQmb4jqjqMu8nMgHFef156KQ+MgrsOiZM5l/u8OfZF2Q2HcaA6sbSRj7D/2g7caG
         dCmwzfFtneh3Hmo16YnjAJt6nGVLhj8A8o/Ek2+eRJY9afyy5j4yE9SK+q0cNe8sZQaA
         IBiAQZlTLrctVgEbHCmMkRGxvLmwibJrdIHL4Kg4QgEGlpWO3HYojM1y6BmGpSMNVo5F
         7kVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096952; x=1744701752;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBJ1/01DLy56cXg76sfjWaapcTytbNbg4uSVjJPNke8=;
        b=D9n57JaJD7B7bHQG88pZORdi1kVsMtSvD9VSgyn7sKYx/tWnNyaAZbqL85AELd9wJm
         HFZvwbg+tEJRLeTb2DDUM7fUHbwxGmTsXsNlKMTBkPhbwUVT5rZ2ZgdKE73qGOtE+HBT
         Vp2RPGy3BJFi610zyF6oVoxqHpXL8dUccV92LN0Hf1KTCi6Olt8lEf7vMdmMjGafMRw0
         XpyqlN0SfLgl5KIWvLwD3asDz/sD3uO5e7ociS+0NML8LWcNNRROsE/qoJipYXmh1KDu
         KKuws3+8nCJajsErZIZ1HHeUcMSkWZLwDlHKSLidcoqHwU/jN10QUeJpUu8Xk+YxIPhN
         YVJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp2hRHjIqB8Vo2IB2tWzFJ/Ax3iqFymGZx5ShkYV6pr2/GaGvJJFHmFhxYDeqI8v7f0jhqefHmmEE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwaIJJFMDgADrEFQYdLlnGbPqaFUyS/dHW7uJ2gPOr0pr0v9XxK
	mQcl+zPKqBraTmM254L8jBPlBkTYLBtNAR2p9aSEySu3+fitEpWkYxhVPNh97g==
X-Gm-Gg: ASbGnctf+p8OJapPCGSKdhWxbjWCB45PRCfKVCn+jIdLZ/PXSODrXIfziuRKsq7rcJA
	3q1J4JL2O1m7PiA4CRZw/zmJoyhhlxyq2mx9wpDralFsx/SxJEOvionNk7pjtvknL+QeM4F87tf
	xTOAo5A1ZxvGJbuhft5QdU14goedeEIzfIIAB8fkkY2Mtge30cmeUoTCFySVNqwM0TPB8UOESvZ
	iwfCiO93CyFqcpIfW4QF1xa3a6I59xdOjd8GUmRxmRTlvAIr7Vq2p49f8YYvjKse5VQU06S3ANP
	bwO7t2W6kFUbx8YfLLhzrJOR3THlT9Vc4I6ekcQWOFch2tX3cqyw8kaUkilWVuVNw6GjfZD0uFX
	RLacBjTvbCr7IoyKBTV2UPAEli1ARMg==
X-Google-Smtp-Source: AGHT+IFNLk+NG3lepXxkK26KmqCiTe8sd0qK6nwP/ufLeFE8bESZVz7+0vnn7je/mIf/USzxjQQYsg==
X-Received: by 2002:a05:6000:2909:b0:39a:c80b:8283 with SMTP id ffacd0b85a97d-39d6fc7c97emr8286894f8f.31.1744096952409;
        Tue, 08 Apr 2025 00:22:32 -0700 (PDT)
Message-ID: <5eb838a3-b18b-4d7d-8f09-93d92c2e2728@suse.com>
Date: Tue, 8 Apr 2025 09:22:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86/vmx: Rework __vmread()/vmread_safe()/vmr()
From: Jan Beulich <jbeulich@suse.com>
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, dmukhin@ford.com,
 xen-devel@lists.xenproject.org
References: <20250408011454.2274613-1-dmukhin@ford.com>
 <e6e43d87-4e6d-498f-b234-a2b577fce7b6@suse.com>
Content-Language: en-US
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
In-Reply-To: <e6e43d87-4e6d-498f-b234-a2b577fce7b6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 09:12, Jan Beulich wrote:
> On 08.04.2025 03:15, dmkhn@proton.me wrote:
>> +static inline enum vmx_insn_errno vmread_safe(unsigned long field,
>> +                                              unsigned long *value)
>> +{
>> +    asm goto ( "vmread %[field], %[value]\n\t"
>> +               "jc %l[vmfail_invalid]\n\t"
>> +               "jz %l[vmfail_error]"
>> +               :
>> +               : [field] "r" (field), [value] "m" (*value)
> 
> See comments on the vmr() adjustments you're making.

Oh, and - why is "+rm" lost here and there? We shouldn't be taking away from
the compiler the option of not going through memory here. Aiui that's solely
because you figured that you can't use "rm" (i.e. an input). But then you
drew the wrong conclusion.

Jan


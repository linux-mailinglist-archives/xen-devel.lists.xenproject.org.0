Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD1F843DD4
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 12:10:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673934.1048532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV8TQ-0004ni-TI; Wed, 31 Jan 2024 11:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673934.1048532; Wed, 31 Jan 2024 11:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV8TQ-0004lR-Qg; Wed, 31 Jan 2024 11:09:44 +0000
Received: by outflank-mailman (input) for mailman id 673934;
 Wed, 31 Jan 2024 11:09:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rV8TP-0004kO-J8
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 11:09:43 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bbcbef8-c029-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 12:09:42 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d04fb2f36bso31247041fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 03:09:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bp20-20020a5d5a94000000b0033afa93c2acsm4352900wrb.62.2024.01.31.03.09.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 03:09:41 -0800 (PST)
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
X-Inumbo-ID: 3bbcbef8-c029-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706699382; x=1707304182; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YHywtMK3dRTqor7SVO7Tfa7v0h4uIkmQM2EDjbMfjRo=;
        b=gjbSE9WCXebnXaC5OD0a71M7ctLZjpGv73f/ChkXMmN3D/SEj/oDRxpDcUxP7lp3go
         kN4LIbmxRGMTyAWuVoQEDIiqJrKS7NE9jDQ9T1nF7HKpdpApeQAWKMlibmJARrqCPV4n
         nKBcV1o1NGYCwP4PccXoGwKZDHNop0/+MFGKXiRQI2GBqUBhLLT8txi1gKnFBRdhv8OZ
         pJW2mFnzKZiQT5kK/woL3/uSU9XxxJaDJxtTIXApC3eGxRQVuZLs7xgCCwEmBD5FdvnS
         zMdf6Zaesz+kqHEvwJ/DQLz1HLG2cXByteSBZegzvWfm5v0jmgTeh27MNRRs37bj28ve
         KHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706699382; x=1707304182;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YHywtMK3dRTqor7SVO7Tfa7v0h4uIkmQM2EDjbMfjRo=;
        b=IBlDpy5UQkyPytbYGqk8ZxHutoCbqPABzjDkC5ZUzN2/HTX5SCdNukyYLyapTr3HRf
         O3bXWoADmOrvSwjiPGkvgU5Ckp+JgT0l+2vuauVU2G7zV55XnvGtqY+C0fqp0BtOLToF
         Ot+hc0TZ9QBG8iHB9YaLGadFwBV+xUxobOzXp4Y0J/WZpuezrMEDehZW+Or1F0An+uO+
         wwAwtFAq0vtgBhbrLHeO/2xWLxxukAsKnOwbyxiPXgUobxcv72I8Fe+gOY+7uBNIzURd
         XCP6slTiePr5AqZlmxPJULH4ngOuKrscMzikuua2w1nnjjysvWSy2RuB1eWJlSdbECle
         pwsA==
X-Gm-Message-State: AOJu0YwVQLI1sIaCuY7crVgO4vhlzxdwmvf8B4jdH3ILP/1CDdvZ915W
	CFnxAD/Ycq7V473MlNkvQ1LS+FsQG4SRWOQB6MBSbYmHQACtWTv8PO3BFr+dJA==
X-Google-Smtp-Source: AGHT+IGaZHD8BsEfxDJA/2opbsbVLKJf5aa5Gi4xXKG1KBpLLC13llNbqtNhD2duBfDDlfWG9G4kHQ==
X-Received: by 2002:a2e:7d02:0:b0:2cf:2499:b94a with SMTP id y2-20020a2e7d02000000b002cf2499b94amr895121ljc.43.1706699381906;
        Wed, 31 Jan 2024 03:09:41 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVpogwH1wdDp/w5EG+WJZSpgRmAuxL4JZSlBblFN8y5w5wVyBRngnPTO303lR+35CwPUW4qDn+4CQCNbbCi1nzPiq4VOWIggxMqrbFyG9C6AA4/5cS2A5jtzqt5ldcV8SSus9vdt5D4UmSRAsAHys+td8Wk4esI/M0XUQ==
Message-ID: <e8859e7a-d6f6-4146-95d0-fc7a70919ff0@suse.com>
Date: Wed, 31 Jan 2024 12:09:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] IOMMU: iommu_use_hap_pt() implies CONFIG_HVM
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <61084180-d44a-4664-be13-462706587668@suse.com>
 <c9f2d1ae-6793-4c0c-a1b9-ea12a4b63132@citrix.com>
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
In-Reply-To: <c9f2d1ae-6793-4c0c-a1b9-ea12a4b63132@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.01.2024 11:40, Andrew Cooper wrote:
> On 31/01/2024 9:20 am, Jan Beulich wrote:
>> Allow the compiler a little more room on DCE by moving the compile-time-
>> constant condition into the predicate (from the one place where it was
>> added in an open-coded fashion for XSA-450).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks, but ...

> I'm surprised that's happy compiling if it's actually doing anything at
> all, given that it's an unguarded variable reference.

... I'm afraid I don't understand: What "unguarded variable reference"
are you seeing me add? Even if you were talking about the hap_pt_share
struct field (which was accessed before as well) - that's part of
struct domain_iommu no matter what .config has.

Jan


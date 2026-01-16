Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE74D2CDB5
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 08:02:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1206209.1519890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgdpX-0000CK-2u; Fri, 16 Jan 2026 07:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1206209.1519890; Fri, 16 Jan 2026 07:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgdpW-000097-WF; Fri, 16 Jan 2026 07:01:11 +0000
Received: by outflank-mailman (input) for mailman id 1206209;
 Fri, 16 Jan 2026 07:01:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgdpV-000091-Pr
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 07:01:09 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21c83e05-f2a9-11f0-b15e-2bf370ae4941;
 Fri, 16 Jan 2026 08:01:08 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-4308d81fdf6so962960f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 23:01:08 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a3e:55b2:6ac3:5c03:be67?
 (p200300cab70c6a3e55b26ac35c03be67.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a3e:55b2:6ac3:5c03:be67])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569926648sm3454354f8f.10.2026.01.15.23.01.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 23:01:06 -0800 (PST)
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
X-Inumbo-ID: 21c83e05-f2a9-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768546867; x=1769151667; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ayJPgyHpxlsc7HAnLOHjxLMRPJOVx07qFlR3E0f2ywY=;
        b=HNnttfQfVk7PDkafR/yloaTstYw8dYR1eCt6U+8e7jwZfGHTXMvWN/9zHsUrjVsxVB
         l1O0KkeRScXY697ErvALif2/FVvZKHG6r4sSnQ4rqgrU6oMAingNgqGS6pWCucEkOu7H
         b0luEqpyZ0lDWyDZFfEQBcuvTFI8o2jlVPkACUvNDkoL78hXTosB9+lIyJSLShHCdZY8
         2pt4BT+uXlLma2x5Mfum8eHdI3QXdurvIE5yyhKi8XUfWAxs2e5ICbNDqdcBSnQLb5z7
         IffSIHTr0Nqucvhb/aBDx1Jlb4WluIUR+oIFhygySs5At18wHEVCmzXae2WH8ZY3gNRl
         6T2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768546867; x=1769151667;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayJPgyHpxlsc7HAnLOHjxLMRPJOVx07qFlR3E0f2ywY=;
        b=c4C2Jomf5elfj4abG/9WW67E/nV8slfMOaPyhH/9mQhWNKiF0qEngwLU7NAfVc5nIz
         I9qu1OXE7rnVHGcqPBl7hSBV1vmcGUGWymjDT5O8OrWmcHDfDlUl7MyFVUa23q2s3HvH
         tKg+AmzWT8uBV+QIJopOHrlKTaxkaR+ORcZHIJbBTwCoEPCmFtUV8Q3iMmRg+A+2RI7o
         lEtMfPe3EN2Rmxu5l3jondnTRJHvpDbwGRK1xx+A8dU3brDaphTIpNKAxucD0vL3gk26
         7I2CcFHHtciwSXE1m5DsQ3XFRI0WDebL1/iLSPj12Oc7KCEWJG5F4l5MuKwNNYf9TRsO
         +flg==
X-Gm-Message-State: AOJu0YwCWJnYhbDuB2/R7uVPKtIdlJVrqujCPcmuI0kHRqXKwDPaO1Az
	ToBadfWEdlcbghr+c2ln9W1WiszKom+zVjJHINjuuupNorwzme9gp8loph/SSCnV5A==
X-Gm-Gg: AY/fxX5YQR70DJK3TfrRbr/Ub/s7nNpTlxMB2ipP7LlKTM+qm8y6/4JF0nqipD2ROHB
	LGU2moUFIPTxUylxh30rBSe9WUNFcv0rbf0cU4+ic+xsdmTPL/Ht6uJrjSuRw+T9R5MMv7BmzbI
	idqP0x/jwWLo/2WfuY+U6DgnqgyQqZQXiU7L4p5WekrHPEkKlGM8gQP+umr5Tuoad61WUq/SCr8
	MIZWICQJO8gZYklzkZoqEAPTEUOKPoPkvwJJIJKX0OzCUuCfF42oCUqD/eAJ4Qn6qspoBakq7T2
	h+uvMlk6Azq0DHHK69yGOu7G5p/cGfRkQbX4Wz2JGJGzjTRVIR9tsdil3ncfLO3P7qKomkjRJRG
	GDczb2DHQh4OCwbAbyvHt66G8XpQBkCS8kdE34qzPEsMrByBuLJnhMaNk77Z2auXZu9hx6uWCCV
	gz4RfBu7A2MXXa0fH+4cD+jrS1tahiGDkK5xaJ1pjRseKHahBCFHW8ksMB7aAUBNkKlCcPx/0PD
	n4T79LYHuQWcdgvycoDkuZIC1U4RtZ7RwALbx10Ncmou4/p
X-Received: by 2002:a5d:5f53:0:b0:431:266:d13a with SMTP id ffacd0b85a97d-43569bcb7bbmr2065190f8f.48.1768546867285;
        Thu, 15 Jan 2026 23:01:07 -0800 (PST)
Message-ID: <e72232b9-5d7f-4a96-88f0-38bb1e8d1438@suse.com>
Date: Fri, 16 Jan 2026 08:01:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] xen/x86: move declaration from mem_access.h to
 altp2m.h
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: xen-devel@lists.xenproject.org, jason.andryuk@amd.com, ray.huang@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Penny Zheng <Penny.Zheng@amd.com>
References: <20260115092841.2651224-1-Penny.Zheng@amd.com>
 <20260115092841.2651224-2-Penny.Zheng@amd.com>
 <CABfawhnvTZmSRcofpG=ts5=NTs4KCjsnTKBP2WTsDRmj1_EsEg@mail.gmail.com>
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
In-Reply-To: <CABfawhnvTZmSRcofpG=ts5=NTs4KCjsnTKBP2WTsDRmj1_EsEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.01.2026 00:07, Tamas K Lengyel wrote:
> On Thu, Jan 15, 2026 at 4:29 AM Penny Zheng <Penny.Zheng@amd.com> wrote:
> 
>> Memory access and ALTP2M are two seperate features, and each could be
>> controlled via VM_EVENT or ALTP2M. In order to avoid implicit declaration
>> when ALTP2M=y and VM_EVENT=n on compiling hvm.o/altp2m.o, we move
>> declaration
>> of the following functions from <asm/mem_access.h> to <asm/altp2m.h>:
>> - p2m_set_suppress_ve
>> - p2m_set_suppress_ve_multi
>> - p2m_get_suppress_ve
>> Potential error on altp2m.c also breaks Misra Rule 8.4.
>>
>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

Thanks for the ack here as well as the ones for 4 and 6. What about 2, 3,
and 5 though?

Jan


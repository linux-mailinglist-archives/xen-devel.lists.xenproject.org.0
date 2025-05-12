Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B53B3AB33ED
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 11:44:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981072.1367459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEPhH-0000ea-7d; Mon, 12 May 2025 09:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981072.1367459; Mon, 12 May 2025 09:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEPhH-0000cc-51; Mon, 12 May 2025 09:43:43 +0000
Received: by outflank-mailman (input) for mailman id 981072;
 Mon, 12 May 2025 09:43:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEPhF-0000cW-Gn
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 09:43:41 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 953f27c1-2f15-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 11:43:39 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ad23db02350so314900466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 02:43:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2417f2341sm319056866b.19.2025.05.12.02.43.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 02:43:38 -0700 (PDT)
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
X-Inumbo-ID: 953f27c1-2f15-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747043019; x=1747647819; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CArXeoVkfSTjrHO91BI3DtDiZgfxPGCnLmt7jUBicWc=;
        b=QdOOir8EsvtQJn+IODdPl35zYk7L9tUVCsBnu9BsxYsR7nzn/oX7Np6CJf2swU/KAo
         F2G465oaNNjlZBJS2SbHbFDCAnRZVX9c4N8rf1fIpOah2J/feZ9mv5QBArM10hTU5Txb
         7OfaKXv7kTmDQ7swYJF9GICD19AwmTnxRDv/K3QE2fzzyj8SN7HB8h5yieiZCeRrsHqw
         s1Ao4/rzu4sAJxEsJrgX2e9eeFDr0pjlyFaEWbW3yzQKnDlbMjS1AX7hHX1axgtKnt3w
         QpHEBQ581Vlq/Gt7n/EZpIkORprchXvmwCNJaK6/lP3r+/Zvp9OSvX0oasfqBhCVrLHD
         lVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747043019; x=1747647819;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CArXeoVkfSTjrHO91BI3DtDiZgfxPGCnLmt7jUBicWc=;
        b=ITvu2K1b+3xceWeL5sZO3+YNEtyOu2zVNTYwxjr3VLI6q17SETddwF0B6LJSs1z/TT
         0k6xmj8PjTxQBh3Z8Z8NbyNlfRrr1ZuY/u4Socr162UZIfboWO+dVE9fbmysRxITxUN9
         DqNkHFUZhZr0X9Qm9Xh6juhwpa4ZxuhiidBqW6Wzoe/HwCT5S/yIKSuNjTp4tZ2jBgpK
         xG/beH2Q6fIveiXHdeyBUyKtIkkmqKA2ErrE21s3iiZJMeRgHX/iexDq3bAzx1qLiEu0
         KvoRozz6+8KrETEujMYsbEhFp6RVg6P9Vf8suBQMzZAevXqjD+niKI51ek89uvtDX5IG
         rVYw==
X-Gm-Message-State: AOJu0YxPBfS7+HjPpOfl/+YJQFBoXynUphqhurfRd5eIuQDnLg2D6NTc
	HcWuwPtPGd2Hc7feY4DERSXPGc4E6yT7zVeLpaNfTz0RTj5KeKFTeGmnhSmapg==
X-Gm-Gg: ASbGncs7maJEb3IyNDk2q1EStinjxj904pjYPH8HfOJl162DqWg2isJKJHThQgoOa3d
	c3XWnpxsR1FiwgWjZAx3EDSPmsNT1DoXtlSKhnFvkVY3m89yl/38KPB+hEY3p9xEVhNQFSr1DGW
	h9802QueVJlTzHyX0kjZ9k9sXn+4Fs681CuaeaUnjDvyq89iFrYzhS6svwKLQBJ/pvMnF1cyy5o
	o2gyLWygstoeu3mhjeGNds/6syEx2H6BWYdLER5ur3+4MQ/dcnrq6IwBCX6oWIo2KJn8gNRDDux
	xohGycmlTpFWr/W3CU57KfNvaZKC7VUk2DEx0Z+nJ4Tj9+slKkilB+DZiZTfVEWF2FLD4s6PWHe
	IIuftUsbR01BAaJs7Co6vZi0S/AfuU0OKwR/R3bqC7gtoynY=
X-Google-Smtp-Source: AGHT+IHAZjCcvNc7r6A8B2zlm6U2APdg32Z1I9lQCvneTa3qjJoO8d/CH89nO8khnthh1yzWWeZ+Nw==
X-Received: by 2002:a17:907:8b95:b0:ad2:4b0c:ee8c with SMTP id a640c23a62f3a-ad24b0cf5a5mr422369266b.35.1747043018925;
        Mon, 12 May 2025 02:43:38 -0700 (PDT)
Message-ID: <381841d2-08af-46cf-9647-6ef16eeaba21@suse.com>
Date: Mon, 12 May 2025 11:43:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pmstat: Check size of PMSTAT_get_pxstat buffers
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20250417103000.827661-1-ross.lagerwall@citrix.com>
 <37065e8d-33c2-4e6e-8c2c-f4f8a9cd3ce1@suse.com>
 <CAG7k0EoSEZruueJP3Xwu309tjx+wEnC28Q4D2DE=DcRF=cJAeg@mail.gmail.com>
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
In-Reply-To: <CAG7k0EoSEZruueJP3Xwu309tjx+wEnC28Q4D2DE=DcRF=cJAeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.05.2025 16:37, Ross Lagerwall wrote:
> On Thu, Apr 17, 2025 at 2:23 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 17.04.2025 12:30, Ross Lagerwall wrote:
>>> --- a/xen/drivers/acpi/pmstat.c
>>> +++ b/xen/drivers/acpi/pmstat.c
>>> @@ -104,6 +104,14 @@ int do_get_pm_info(struct xen_sysctl_get_pmstat *op)
>>>          cpufreq_residency_update(op->cpuid, pxpt->u.cur);
>>>
>>>          ct = pmpt->perf.state_count;
>>> +
>>> +        if ( op->u.getpx.total < ct )
>>> +        {
>>> +            spin_unlock(cpufreq_statistic_lock);
>>> +            ret = -ENOSPC;
>>> +            break;
>>> +        }
>>
>> Simply producing an error is not an option imo. See pmstat_get_cx_stat()'s
>> behavior. Imo the calculation of ct wants to become
>>
>>         ct = min(pmpt->perf.state_count, op->u.getpx.total);
>>
>> yet then the copying of the 2-dim array of data becomes more complicated
>> when ct < pmpt->perf.state_count. An option may be to document that this
>> array is copied only when the buffer is large enough.
> 
> Another option would be for the caller to explicitly pass in both array sizes
> and Xen can copy as much as fits since in either case there would need to be a
> way for Xen to return how much it has (separately) copied for both arrays. Does
> that make sense?

May be an option, but would require adjustments to the interface itself.

Jan


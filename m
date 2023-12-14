Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39139812ADD
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 09:57:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654356.1021181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDhWh-0001AK-V7; Thu, 14 Dec 2023 08:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654356.1021181; Thu, 14 Dec 2023 08:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDhWh-00018G-Ri; Thu, 14 Dec 2023 08:57:03 +0000
Received: by outflank-mailman (input) for mailman id 654356;
 Thu, 14 Dec 2023 08:57:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDhWg-000187-L4
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 08:57:02 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bef4bda9-9a5e-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 09:57:01 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a22f2a28c16so290076166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 00:57:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cu3-20020a170906ba8300b00a1d818ebcadsm9179844ejd.19.2023.12.14.00.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 00:57:01 -0800 (PST)
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
X-Inumbo-ID: bef4bda9-9a5e-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702544221; x=1703149021; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=deaBW+/DdML7CUJQTraMIt7liSMXRSWBsIeHtj+ukCo=;
        b=QHeXWZUC/9eqDs9ae7y7Av4lwFbiUxE5O7DrmGaMG1d4KpVFNdlJ2GWPjbC1J3qzHM
         OShXVgY5l6FzAKXcbiyXPp/vIdP5LoD7N/+yPfV0j3tkwgPBu1vtrbTCkSYwPYYZujos
         MDKy7B+zDezqHc4180S/BcBFbki9gv6NYZ7e0LDej2xIsx+ayXNN/iaTc2972XHaqFIt
         wYwfeD/dJIRH/dmH9SU7+wjnMKi2bwULeFALmYuFpgchgTw0+WXCCQDJo6pPlCZfO+Vv
         ANTDn1PFUSDTMKx8LOXPusXfZldF3blD8/nTFGDOjn/4cUk5SJAdocw8NMLwz1RxEiOI
         9eNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702544221; x=1703149021;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=deaBW+/DdML7CUJQTraMIt7liSMXRSWBsIeHtj+ukCo=;
        b=Cx15WQUSlBTjGzqDngSbvug3OLaRlPuFpSI04LTE1SRXHSg5stqVBSPbX8c84E1fX1
         9CgSpuEZwneSLuXya9M7AhRWsFgFC3Hy3DEi25NVQxBZ+oH20MePFcNFe87pSWrIPW34
         FLQYI40yz8DNTKEyQH2hijHsUDdZYNpSnRCzcZxRhV5WQ+pq+cEDJQ4iuCCmccYMj+9F
         5NAqSaMqfTGmujua9FeiQomkTGsxtXqbxO69O/ynOSrjd20xxMOt7o/dgDfHSBB10XyF
         CbzQqt4Uj0JiPUpi72mJ3rUyvJ2vuIEI0Fkgmxrfy9IvVgoneKRomxSQzCd5FDwGBPyM
         YRzA==
X-Gm-Message-State: AOJu0YxAM9KN6Srho2WOTmxtJoTZCg7y0kbNzhY337jhB3olaQmuuAgv
	XV3VGKfKYBkcEkLHnOmLORJQ
X-Google-Smtp-Source: AGHT+IGb97bTrR8Hrn6loqZ3SSVSW2YHmegvZwcwzjWlISKltEu7ZBGkpQD6BucFCqft4jiQx3bYGg==
X-Received: by 2002:a17:906:454f:b0:a19:a19b:421d with SMTP id s15-20020a170906454f00b00a19a19b421dmr2720578ejq.136.1702544221319;
        Thu, 14 Dec 2023 00:57:01 -0800 (PST)
Message-ID: <7222b529-ab39-4a18-a448-2a007992b9aa@suse.com>
Date: Thu, 14 Dec 2023 09:57:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: X86: MISRA C:2012 Rule 5.6
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
References: <9de5ec9d-1ebd-4fa9-89d4-e962d7c377e0@bugseng.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 "consulting@bugseng.com" <consulting@bugseng.com>
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
In-Reply-To: <9de5ec9d-1ebd-4fa9-89d4-e962d7c377e0@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.12.2023 12:44, Federico Serafini wrote:
> I have another question regarding Rule 5.6 ("A `typedef' name shall be
> a unique identifier"), this time for X86:
> the violations left [1] involve guest_intpte_t, guest_l1e_t and
> guest_l2e_t, which seem to be deliberately defined differently depending
> on the number of guest paging levels.
> I would like to propose a deviation for these types, do you agree?

Yes. In fact I think we said so already when discussing this rule. The
whole rebuild-same-file-for-multiple-purposes can hardly work without
something along the lines of multiple ways of defining the same macros
and/or typedefs for each of the instances.

Jan

> [1]
> https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/staging/X86_64-2023/446/PROJECT.ecd;/by_service/MC3R1.R5.6.html
> 
> Regards



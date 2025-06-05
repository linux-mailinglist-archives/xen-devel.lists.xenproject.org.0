Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0201ACEDD6
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 12:38:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006592.1385810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7zX-0000sj-Vt; Thu, 05 Jun 2025 10:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006592.1385810; Thu, 05 Jun 2025 10:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7zX-0000pr-TD; Thu, 05 Jun 2025 10:38:35 +0000
Received: by outflank-mailman (input) for mailman id 1006592;
 Thu, 05 Jun 2025 10:38:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN7zW-0000pl-2I
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 10:38:34 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39b35611-41f9-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 12:38:32 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a50fc819f2so636506f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 03:38:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3132bff67ddsm1243128a91.2.2025.06.05.03.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 03:38:30 -0700 (PDT)
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
X-Inumbo-ID: 39b35611-41f9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749119911; x=1749724711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eTrMlXczbRTbKd5+LNoMLF92jZcYMThqFApi1ccyYoY=;
        b=WjmLc0W4a3rVtYquPitUving88Mz9XL26LC2FFCiQJh6kEqBER0kh7DTXsMN1TkNis
         icPTYupkSufYXNcbS/SxGlnBHFhtZB8iw3c0sNnpTsXnCyWEu6S440aV5It2lFUBVqA5
         Q/zUdoxBgcwQ4blAbWgYsDxIe6zHws4sEv/bEURDiGTOsDcDzN56MffzbIScdxluE4f7
         neDFNwD5wSvL6j2RqXh9S9y2owOge5fSnd4BPe22wY/1kRoTnOfJoeT9BL/ga6MQMiI0
         kw/J85S62gYUSimVjFLhYyoJHnLYihvZAdcrKHdhrx6s385bw5dlUzuiYIT2ewhu+HqL
         JCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749119911; x=1749724711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTrMlXczbRTbKd5+LNoMLF92jZcYMThqFApi1ccyYoY=;
        b=w+FDTxPO9Gm9jll4Cdf37vPXGusoB7co5+H8MKBzXtlsRDkyhRjZNty+NJhA7z+TWc
         O2KhRmEk73iOSZAEZnigp1XVguFilC1BniDLNBTzlwJ2ZkFOstMFchldcpsgQRYi7APZ
         /e9cubCqdILUSBtdOEvnRVNeH4z4g9ZhJodKSnJTezZ68I4SDRNy8D+VCLaTp75q57bW
         sYlyQ2hy0MOWeKYq7RdS/dyT1s1o48SRRmktiMYXMPBDAVraUAz8F2Klczp6j6fq1sOo
         0VvJ1He0EeKDq6bqwmaJUlj9lU5AioYAbWV8J3oY2cI2Xk+aTMJfBxcLKtxSxHx3JDrK
         PnQA==
X-Forwarded-Encrypted: i=1; AJvYcCVgX0db8gaOc8sF/ISgkBrF0QEI6hAHJrrf2BiFBdx8oyz6W32d/sWyZ1dkTFF16JjFEWDNwbI7Nhk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAWW6+Zw1Gfs41VBPTxyMdrnkn7e4Z33fiWmCOpKEvBTZm8J4W
	340XJia4G/4/MFfO8Mv2g2l/z8QlFBCrleKpM+tluvuUuZuRcDbTfTFRZda9vzeHXA==
X-Gm-Gg: ASbGnctTCjfMVPax5oTHC94DSq4VaLgcp2o8/RXdXOFgmwNxoefKOLlvQEcltN4CjU3
	S3NdaA8sfkkZuTCIIIA4fkxQbnH5Qdx6TrkIfW01KSwePsjDIiwpptbSzoAplqpPn4zt1iKaHQ8
	pc+O4g4djBrqT/M7PHOzhvDEtRMV4/YOAGp3YzvMoYJU+3gYXAJrd5OjZeGMaw+lKdQL9URQfWJ
	b3My5fDj5qfAW3tNj0C9eouxZJV1ApvjEwg8292zXh70Rk+nD59LSMW3ZxKFzncOXrU6m77JCz4
	OqotmSgGzSehmW6LQZfMbAEGQ014TbTF6UiWtYlN2UUFy1Nr3eUWDxb/Gw3mtSmsNY3Nxmr5MzK
	zivYFfD+IzlqoOjMl4yf9OhaGCmjkbv80lMAp
X-Google-Smtp-Source: AGHT+IHQNNF19xtS4AyWOZL+m96C5xwyE0xK4mmj/hDjdmXjt8SJsXbqgV4LSfCV78eQwZHDWL9rrA==
X-Received: by 2002:a5d:5f85:0:b0:3a4:ee51:8144 with SMTP id ffacd0b85a97d-3a51d91e0f3mr4670163f8f.13.1749119911433;
        Thu, 05 Jun 2025 03:38:31 -0700 (PDT)
Message-ID: <bb8b92a9-fade-41c7-bf4e-ec37a246c992@suse.com>
Date: Thu, 5 Jun 2025 12:38:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] vpci: use separate rangeset for BAR unmapping
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250531125405.268984-1-stewart.hildebrand@amd.com>
 <20250531125405.268984-5-stewart.hildebrand@amd.com>
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
In-Reply-To: <20250531125405.268984-5-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.05.2025 14:54, Stewart Hildebrand wrote:
> Introduce a new per-BAR rangeset, unmap_mem, for p2m unmapping. Rename
> existing mem rangeset to map_mem, which is now only used for mapping.
> Populate unmap_mem by moving just-mapped ranges from map_mem to
> unmap_mem. In modify_bars(), skip recalculating the ranges when
> unmapping as they are already stored in unmap_mem.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Already when per-BAR rangsets were introduced I questioned that, resource
efficiency wise: A BAR fundamentally is a single range. For e.g. the MSI-X
table we punch a hole, but it then is still questionable if representing
the result as a rangeset is appropriate. Now you further extend the waste.
Since unmapping something that was never mapped should not be a problem,
does what needs unmapping really need representing as a rangeset, rather
than as a plain range?

Jan


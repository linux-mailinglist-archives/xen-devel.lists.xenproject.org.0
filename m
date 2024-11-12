Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2BA9C524C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 10:45:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834287.1249908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAnSu-0008Gr-8f; Tue, 12 Nov 2024 09:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834287.1249908; Tue, 12 Nov 2024 09:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAnSu-0008FP-62; Tue, 12 Nov 2024 09:45:40 +0000
Received: by outflank-mailman (input) for mailman id 834287;
 Tue, 12 Nov 2024 09:45:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAnSt-0008FJ-44
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 09:45:39 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de4ee6e8-a0da-11ef-a0c6-8be0dac302b0;
 Tue, 12 Nov 2024 10:45:36 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-431481433bdso47733005e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 01:45:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa6b35b3sm231930195e9.18.2024.11.12.01.45.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 01:45:35 -0800 (PST)
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
X-Inumbo-ID: de4ee6e8-a0da-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzQiLCJoZWxvIjoibWFpbC13bTEteDMzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImRlNGVlNmU4LWEwZGEtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDA0NzM2LjY3NTI4NSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731404736; x=1732009536; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iGU1PQ0zStrU0E8d0kvdc8f2CeFpLfahIaeDIoG6Ozc=;
        b=Q0F0aV1XnAUWuXYZNThpgZZX//vlxLVWO3DF+F9ET1k63OpnWCUwkKN9+0VDaV4/II
         CYmeFObSBoOjINM6v4U+uOFO8kJChvnFDB55T+a3c112BcvJj0SrIid7MhdlDly961rd
         6Lzp2ZUzXraBBtnLE7rVX6XwNz2YhYoAZsn+FwFOzctLZQp0gztYROaHcQNfJov/Ffcs
         0HxoecPZ0IdXwV16YtmRAvLYv2BPXbCWF9ACPagNNel9gPQfhqQpOUpBorw9Ei80nFsS
         KPZC/lXuVWYKAF0CrTVnADD7zvWjPp4uJLIrMqLyssQCGk/iybbIoG23tA27Y8HvKNao
         o2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731404736; x=1732009536;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGU1PQ0zStrU0E8d0kvdc8f2CeFpLfahIaeDIoG6Ozc=;
        b=nPpySeG+qV220HTyf8n0GsxVcXCjlYIHRjl7b99GQ0PcmAi3PjdlaGkAewMXyNu439
         TRWUh3rYk+b+dLQebLZ7n9uUVSbBcSjyrCK6U5bhGGqPFVtuquNLOtO/a4kqAGAd+FyG
         HZGz27ei8xWeVrSoVmeq2fAg1ynQ0ZNlcgdsu2D39dlk9UmOWZ/kv28v551uDIoPlZyF
         3wufSap+rrXoJssWAwPSiaroCs+YpL1b1rlEPB9Ru7a+B+UNVWQsqX4pNQu4o9i3UVUX
         jTI6Mg1VFpQNSGbTGHkjm/2vCYUahtA6KNmZJnRepDIrBJND9Ilxs4+xxPkRTYMTxzzU
         5poQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5b4y+AnYbEyYxhP+SMolx8foRVnT2c6BrdNHNJJHoFtQARi7W4EOzXL6k7zw//b8lM2hZqBITejs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUTp+0S/Chp7NyOajM2Dwu/jN6oP8lZ5sCTy2BWngNDng/7pTp
	KruPCG4myYnptIBmUJ/JEfGvohp/zueRk50ED8wk5LsSpJqTKwEmNu6qGNCteQ==
X-Google-Smtp-Source: AGHT+IEd0N2LzHybZ6KspsEKYlKr9+1M0fetJfoccPvlXV5P1ohCyXbRxL6sEg9gFKEkGtHBxDxu5Q==
X-Received: by 2002:a05:600c:3544:b0:42c:b187:bde9 with SMTP id 5b1f17b1804b1-432b7522c3emr131199595e9.30.1731404736032;
        Tue, 12 Nov 2024 01:45:36 -0800 (PST)
Message-ID: <67fa8dc0-a58f-48d4-97df-25d7f8a0447d@suse.com>
Date: Tue, 12 Nov 2024 10:45:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Enclose all iommu related access within
 CONFIG_HAS_PASSTHROUGH
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241111180635.1198552-1-ayan.kumar.halder@amd.com>
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
In-Reply-To: <20241111180635.1198552-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.11.2024 19:06, Ayan Kumar Halder wrote:
> As CONFIG_HAS_PASSTHROUGH is enabled only for MMU, thus any common code
> accessing iommu needs to be enclosed within CONFIG_HAS_PASSTHROUGH.

I'm not an Arm maintainer, so my opinion may not count much, but that's
quite a bit of #ifdef-ary. In at least some of the cases using stubs instead
may result in better legibility ...

Jan


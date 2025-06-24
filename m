Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA818AE5DD0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 09:33:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023209.1399147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTy9d-0005hy-Qd; Tue, 24 Jun 2025 07:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023209.1399147; Tue, 24 Jun 2025 07:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTy9d-0005fl-NQ; Tue, 24 Jun 2025 07:33:17 +0000
Received: by outflank-mailman (input) for mailman id 1023209;
 Tue, 24 Jun 2025 07:33:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTy9c-0004u1-Ey
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 07:33:16 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d1eb873-50cd-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 09:33:14 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso3989704f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 00:33:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d86e8fddsm100210615ad.210.2025.06.24.00.33.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 00:33:13 -0700 (PDT)
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
X-Inumbo-ID: 7d1eb873-50cd-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750750394; x=1751355194; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K0TGZ6rbmQMWuCm67eAqErb6H0rHOvPUz009tcPefSY=;
        b=dFUWQSyOj0m6E4+S5hWjBm14JQGaPWSAPCB6SEyM0XuKF0C5CKuT0zPk0G7UTIZ5b4
         exogsa4iygODHnUKTZBNY5yb48yjD6ToCb1Rn9oT2u2QqDtzzsE/25Ouh2oUkbejPZBA
         d1g8W4kvqo2vzNqZJVPz0hV4+ySt2zOu92v3X+3YouSEBGU2QDFC9q4jRCucfGUm4O2x
         4nq6M6eKR00j/g36bfC0kiSdcaQYp76daEXpvdiTrxeh6dt15wRbE5YAJfFSAX9cyA7k
         QR5/PlGOOmo/zjHD2BhV/7hNHQZJWbEimWec+kA5OH+n7NRU4mte+Vk8Jjz2OwOeD7lK
         FGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750750394; x=1751355194;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0TGZ6rbmQMWuCm67eAqErb6H0rHOvPUz009tcPefSY=;
        b=B8x/UyMc3+SdV3bpMyE7SBqLF1CHdkru0x4k+99ka1o1dUc5y0fUUP79hyzaR9tA0B
         m7eKgC1KUSyIksGN5FkFeKVFWBapljPE5D5MOoFl0jbyQQQ/7EzzIrf2RQ8siAxGceyy
         LFShWhLCUxmfR69oVtqQLSM0ZGVoZFRC+NFW7gcdt0+FeWN8q7fNu4m4HAOvQO+9PcxT
         l0LENs9Lf0FNbCjCnA1ClTv0HfideUB56gFaYWiXi/PiuwYozUIL/JGqQJq2wUK9o8Op
         7pzU3U3sqLPTcODWd/pVI8u8D91oPWBmf5LJaDR+FmzGAtwRseyKNNDHthO+hq/yYEz5
         iuKA==
X-Forwarded-Encrypted: i=1; AJvYcCWQZVyI89JK7NmpWiC39moq9nI4m+qrWNYkKit7jM0LDI65fz6r9CLV4EpE7HHDOqaWaMFAd4NsZuY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwY7N6Y4ZXC0cgn2yzu5q4HchvdREZcVqbOTQ476GJa1XJFNCkv
	NKcYbHjY4DZFyyXfKCh/RRZQtRDn2Rp2v9aZlBicy0qTJ9GXid6ZkUGlrNMDzOz2sQ==
X-Gm-Gg: ASbGncs/a3mCgfvYsCeIeeHmS3LKTzHaYl6mwMh+It9Jwfqmmw94u88ekq+91AcR6Fv
	vU17gbL59E8Xc4wAhs+StxQPS6JZBexJb2XVjji7P0jCPDD/Zk/cZrn5+TYSMOQUu8zMFNxx+KQ
	7IY8HhhDuvesvu1YyoZzoyFTf3D4Hqg2ln8Jfd9VUfauVoO3A76TU3BHzdslXt4A35NgwL5g/0Y
	D7z4a/qhhWY5CGKsFUJxfIBWrgEUJfBqwuf5TjMZrUfU5783nXyQec+z/t4gpEC+n2y7rkKWHY9
	naLvl0NdMkIbuIsKKVSis9g8rCCMyqJSrjw7xjSkNfbTYB6cVx3MTo3Hku3Ili0KyLnoRyIvGfH
	3JUocN9v0eJqX8l5B2T0GKxL7JD0ESQ2xGtvSy2bMehhXqsQ=
X-Google-Smtp-Source: AGHT+IGe9ZnhqBEM/BgvR7Hz+Dof3t/CKhKOaBsoD1TVykpNTVuMuWW7bhSuoSBGa65+dYngPFBRRQ==
X-Received: by 2002:a05:6000:178f:b0:3a4:f038:af76 with SMTP id ffacd0b85a97d-3a6d1331ef9mr13547349f8f.53.1750750394130;
        Tue, 24 Jun 2025 00:33:14 -0700 (PDT)
Message-ID: <3da8604c-797c-4ad2-b059-4bf9c5bfb86a@suse.com>
Date: Tue, 24 Jun 2025 09:33:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/16] drivers/vuart: move PL011 emulator code
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com,
 sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250624035443.344099-1-dmukhin@ford.com>
 <20250624035443.344099-14-dmukhin@ford.com>
 <6b2938a2-aa42-421f-b948-44e74f463b21@suse.com> <aFpUNB8BP6+COTRp@kraken>
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
In-Reply-To: <aFpUNB8BP6+COTRp@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 09:31, dmkhn@proton.me wrote:
> On Tue, Jun 24, 2025 at 07:50:33AM +0200, Jan Beulich wrote:
>> On 24.06.2025 05:56, dmkhn@proton.me wrote:
>>> From: Denis Mukhin <dmukhin@ford.com>
>>>
>>> Move PL011 emulator to the new location for UART emulators.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>>> ---
>>>  xen/arch/arm/Kconfig                               |  7 -------
>>>  xen/arch/arm/Makefile                              |  1 -
>>>  xen/drivers/Kconfig                                |  2 ++
>>>  xen/drivers/Makefile                               |  1 +
>>>  xen/drivers/vuart/Kconfig                          | 14 ++++++++++++++
>>>  xen/drivers/vuart/Makefile                         |  1 +
>>>  .../arm/vpl011.c => drivers/vuart/vuart-pl011.c}   |  0
>>>  7 files changed, 18 insertions(+), 8 deletions(-)
>>>  create mode 100644 xen/drivers/vuart/Kconfig
>>>  create mode 100644 xen/drivers/vuart/Makefile
>>>  rename xen/{arch/arm/vpl011.c => drivers/vuart/vuart-pl011.c} (100%)
>>
>> I question the placement under drivers/. To me, driver != emulator. I
>> wonder what others think. But yes, we already have drivers/vpci/. That
>> may want moving then ...
> 
> re: driver != emulator: I agree; but I followed drivers/vpci.
> 
> Do you think common/vuart would be a better location?

Or maybe common/emul/... This wants discussing, I think.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BB1A77475
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 08:25:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933477.1335419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzV3U-0002dC-1o; Tue, 01 Apr 2025 06:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933477.1335419; Tue, 01 Apr 2025 06:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzV3T-0002aJ-Uf; Tue, 01 Apr 2025 06:24:59 +0000
Received: by outflank-mailman (input) for mailman id 933477;
 Tue, 01 Apr 2025 06:24:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzV3S-0002aD-B5
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 06:24:58 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07e41c1a-0ec2-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 08:24:57 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-391342fc1f6so4558447f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 23:24:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e141sm13268647f8f.77.2025.03.31.23.24.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 23:24:56 -0700 (PDT)
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
X-Inumbo-ID: 07e41c1a-0ec2-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743488696; x=1744093496; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XkzftAsK1g18/pFY5bDveb4EsOHn6gCqvCtwAMMOZ+A=;
        b=XCUd8W3o/6TJzevLQnmgnjMMMy8ly4SJS8U+69TBuUhfjCUoY1PqLHPndDUdoFO26p
         rHQVV1iGJVKx67RXVm0zVvnTuMh/CKFj2JoqahYzJz10qDS9sfDxefnSaa4QU/W6JBwy
         RA7XQYRQSvCy0UiUnzSu3eSrDthZl3HzwpTHoavYJe3YDgm3rtapRZ1LkDNv2WKHaCku
         QOBHzfzs4IW0gk682KI+U+Yo2cGoQD1S6L69oNSVIjdAAEjznDrNUrfzGvr7ssjaVVcd
         1OY5drvJVGI3WCw7VN74ss0I+uR6k9xhWMpHL/3pWKzbCLwBDe79mAbiqUIOyMUh7r28
         Q7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743488696; x=1744093496;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkzftAsK1g18/pFY5bDveb4EsOHn6gCqvCtwAMMOZ+A=;
        b=o1tzXmBDNsLLYVarVX0r4A9Ya/FJ1nt0uJqfZLlNQtjmRZrKGNLyW4yXo+EUOnAPyG
         fMM241DM7mdAfjwaBOdKGbx7X8qxGcYHUulEH7pqokRbqupnLvnWOw3rSCsyTMYd5AM0
         nJ+dn0UotFQepenY5OSVTunSjRbtJBdy0nP/lk9xhUl1FldWcKt82uZNWCmV3qQuQKJK
         gXlVocNjibdvTkbuSZchxoTJ9hLie2vPlj7qR42ZeTj83SGxOj+Y/0tRKhycMEttgvpC
         +xAdHm7p2bQNX82l6vOko/BYy0JkyshNykmZkdLTMiFsCewmaa8KIZp//BJAewJNS5uO
         FIag==
X-Forwarded-Encrypted: i=1; AJvYcCWmqlgvhZtIx5ox9FPCiivopusfLJR0NT1Ub134QJI/sgaUMVs4Z7ndCQhYGtx3QZH2aJl7MPT9iUc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbjofNdxwVyh/oVoWdw4AgN1X4M/TY3Y+u+3rbkqLDUev7R2qU
	d+8lt5qnkafGGRoBryXrLoiKmzp/od/V+pmudrtJN1XKQK+mjS43eTor33xW0A==
X-Gm-Gg: ASbGncsPRpy/CuW1dbq7s0fr3kVeBTKtnB/4SAhLYWqrrROL3ptS7KS3vV3CWYphSwc
	ghzHEuqZp0Wb754oh+d6peG1/Zkm9WY43xNvzw6ZZpOLagKbAA2rURy1PmqB2nEb4P7unPUGj73
	UqjYJr9yQ7E4AQpDJ09f7oI67Yk0GYMmZeTqVSkQ7x2AuBQ+o3YZkW8RgEkipO7GnExTSxn8+wg
	QVKLR7tpz0R2puUjfWx2xWZwh6NvrbhCrg8Y2L1rLcm0By0/YEuu3zVlea9I4QidDfXhFheFo/M
	f0NsffXa6aX3cgL+GOhIm0XFE01hdeMvTnQ+ozmWZo46IH8B6rcpjesSPuawZA83GIT1snevM18
	vycs3dSC6FK/P0R6NDSgHwpy5XKt/R1RHhORGM14K
X-Google-Smtp-Source: AGHT+IGSgQ9q+ZoHfUGWJtE9oREClZyIGm0YR+T9P7ad+XI1cV4rz9NCu6Mx1GRcVoQm+2dDvLgTDg==
X-Received: by 2002:a05:6000:1acf:b0:390:f358:85db with SMTP id ffacd0b85a97d-39c120e0bafmr8972304f8f.30.1743488696318;
        Mon, 31 Mar 2025 23:24:56 -0700 (PDT)
Message-ID: <c8a786f0-cc78-41f4-8323-dabde70a7c91@suse.com>
Date: Tue, 1 Apr 2025 08:24:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/riscv: Increase XEN_VIRT_SIZE
To: Julien Grall <julien@xen.org>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <e5fa4219ccf43125e2489cc8c49b4404e6ed22ce.1743434164.git.oleksii.kurochko@gmail.com>
 <54ebdcb7-071f-411f-803a-930dc330a497@suse.com>
 <6f0efa9a-876e-4ae1-9367-ccd89f51bab0@xen.org>
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
In-Reply-To: <6f0efa9a-876e-4ae1-9367-ccd89f51bab0@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.03.2025 18:17, Julien Grall wrote:
> On 31/03/2025 17:14, Jan Beulich wrote:
>> On 31.03.2025 17:20, Oleksii Kurochko wrote:
>>> A randconfig job failed with the following issue:
>>>    riscv64-linux-gnu-ld: Xen too large for early-boot assumptions
>>>
>>> The reason is that enabling the UBSAN config increased the size of
>>> the Xen binary.
>>>
>>> Increase XEN_VIRT_SIZE to reserve enough space, allowing both UBSAN
>>> and GCOV to be enabled together, with some slack for future growth.
>>
>> At some point you may want to use 2M mappings for .text (rx), .rodata
>> (r), and .data (rw).
> 
> OOI, why would we want to switch to 2MB? At least on Arm, Xen is tiny 
> enough that it can fit in less than a couple of MB. I would expect the 
> same for RISC-V.

For TLB efficiency reasons for example. On x86 we switched to using 2Mb
pages quite some time back, just to find that (at least) one of the
bootloaders choked on the then larger binary. Hence we ended up with
the XEN_ALIGN_2M Kconfig symbol plus the unconditional use of 2Mb
mappings for xen.efi. For the original change see cf393624eec3 ("x86:
use 2M superpages for text/data/bss mappings").

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4921FAE4708
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 16:39:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022540.1398387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTiKL-0000Qd-JC; Mon, 23 Jun 2025 14:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022540.1398387; Mon, 23 Jun 2025 14:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTiKL-0000Ny-F9; Mon, 23 Jun 2025 14:39:17 +0000
Received: by outflank-mailman (input) for mailman id 1022540;
 Mon, 23 Jun 2025 14:39:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTiKJ-0000No-Uj
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 14:39:15 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5662ad0-503f-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 16:39:14 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso2390140f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 07:39:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f119f124sm8178499a12.32.2025.06.23.07.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 07:39:13 -0700 (PDT)
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
X-Inumbo-ID: d5662ad0-503f-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750689554; x=1751294354; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XD+oT9x3mct9Hqqk3TA0A1N/gtRTla4B0dmhwOlBLng=;
        b=GVWfrHoDJds8K2p0bHtXG7UA3DIo3t0Qz8vsjYC985wxV9d4KbS2b8HAf7jMQ050og
         LzHv4QIYIZIvHyWPQCfaiKOBfQ2RJ5XRct3jo5bdOMCcYTgNV6r8sUr2o8mnMG/+ZApO
         3fUb5lmT9nxy68UnASddlGzNV6r4PqpiTTFygxKgci+tsRioIOrUzQ/tYxmaKxlfXhpw
         553IqsqBOoOb2OzuzWuBx6VwWZvB4sXrwpMgrEk9noMFyLTRIr9/hdVlRFdmEMCBpXIP
         x/youUs9fz96RVRSv/9EitW/8YlHb5bm00Mby0QY65LlAYdAUfHOT4qvcXqwMKbP0BAe
         VB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750689554; x=1751294354;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XD+oT9x3mct9Hqqk3TA0A1N/gtRTla4B0dmhwOlBLng=;
        b=AWR1Ut452qdSi0Yue5k/5V+3A/w4PqKM/1IQXOxhFekxYqw3yrARENp7Yd1U+9jUmp
         yASrIgLHcYIDPUlqLB3MR2TyR8x/qlNkXBPIXa4OYEk4dDjExEe20ffq3OvBwzMmXHyx
         +eFvzpvDNMeSQOnWDferIGS4sgQziSlEFDS0ILaY8w3tTNcVdwaKTGwufWersVy8XTWq
         Z+y6LkpMCstfOU2W1sFahFtZt60i1cs3ulplXtTOEgxTgJwh0kO1vIQb7S3CU4tCnJYR
         xeL94174zMNBbdHwTcOK0awRFHDB6rAroE/u9NZhSDydjSKPRDiiuk/ms9BDncpKMsrG
         GNnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtqIKjf5x7oKhSn5Ib4zKwhvN28m0gOvgfY7equG0rGEk+bGoS/KxomyxFuBJX7xwSmeF2g6jLOQg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKV0BJtto91xYUGc0xH6PaCq2BD/uhZW7lxJKrSRg9r69vPINL
	DRKmtab/5Y+WCluXwlCNTxrzp8GED3jj71GeHnM4VMxdWdBOccvgSBEbj7Wh7Lpczg==
X-Gm-Gg: ASbGncuo8hpIZIhtN9fip84XMm7g/yK5+WYg6wye0GXWhU5rFt20GhtOmyn+JILS2dm
	oJRzIYoXeB799SVLd75Xz8XHZwWw3dq7Hinqk85A9t9e5IQaVHiGT/IUfaRHodJAhx+YD+oSHq+
	0fQPj/9e3WrIJeGcP6IQobIrt6QY79k6j5Ba5MluDxt5Ilam8L9eRwp1JFYn7Gr8yjJv78DfXlP
	zrCMzu4QItgWlxpVOjdIHlvneJzl8v+4jyv49JL+2LnB6vNdDNPbRno0BAlDsKbQQGU62YB9sBF
	QZBf1C088w4neXnUEztHGQN/DnBVBiYAFhcp4+DHhd3ZJn7Yf3zS6JSE+Cj6ihd0t/LG6JNsdaZ
	FLfKofkAuFXfm3W3168Bmu8UmAMIS7qjE+EfgdaB/VYJ1MY+N0Z5uGOYhWg==
X-Google-Smtp-Source: AGHT+IFtvNieIQxzEUJKmlC3oJvG03h7dqurBJ9owRG2bLzPhRX7z/2HfHGxpQH6UInADmHxivCjug==
X-Received: by 2002:a05:6000:4284:b0:3a4:e844:745d with SMTP id ffacd0b85a97d-3a6d13315c2mr11268301f8f.56.1750689553896;
        Mon, 23 Jun 2025 07:39:13 -0700 (PDT)
Message-ID: <670d4fa7-fc94-465d-a174-a73fedd1ee9f@suse.com>
Date: Mon, 23 Jun 2025 16:39:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/17] xen/riscv: implement sbi_remote_hfence_gvma()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <ea7a15c0ecfd2bae95c11a92e4c0cb71b155140f.1749555949.git.oleksii.kurochko@gmail.com>
 <728ee92b-0e4f-4ccb-8c6e-54687bd75c62@suse.com>
 <80460b90-ffb9-44e9-83ba-0f81b3b05e92@gmail.com>
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
In-Reply-To: <80460b90-ffb9-44e9-83ba-0f81b3b05e92@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.06.2025 16:31, Oleksii Kurochko wrote:
> On 6/18/25 5:15 PM, Jan Beulich wrote:
>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>> Instruct the remote harts to execute one or more HFENCE.GVMA instructions,
>>> covering the range of guest physical addresses between start_addr and
>>> start_addr + size for all the guests.
>> Here and in the code comment: Why "for all the guests"? Under what conditions
>> would you require such a broad (guest) TLB flush?
> 
> Originally, it came from Andrew reply:
> ```
> TLB flushing needs to happen for each pCPU which potentially has cached
> a mapping.
> 
> In other arches, this is tracked by d->dirty_cpumask which is the bitmap
> of pCPUs where this domain is scheduled.
> 
> CPUs need to flush their TLBs before removing themselves from
> d->dirty_cpumask, which is typically done during context switch, but it
> means that to flush the P2M, you only need to IPI a subset of CPUs.
> ```

Hmm, but the word "guest" doesn't even appear there. "Each pCPU" isn't quite
the same as "all guests".

> But specifically this function was introduced to work in case no VMID support
> as we can't distinguish which TLB entries belong to which domain. As a result,
> we have no choice but to flush the entire TLB to avoid incorrect translations.
> 
> However, this patch may no longer be necessary, as VMID support has been
> introduced and|sbi_remote_hfence_gvma_vmid()| will be used instead.

Good.

Jan


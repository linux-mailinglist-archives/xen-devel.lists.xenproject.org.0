Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOBRKgH1gmn6fgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 08:28:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD75E2B24
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 08:28:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220067.1528789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnXIY-0000Lu-QV; Wed, 04 Feb 2026 07:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220067.1528789; Wed, 04 Feb 2026 07:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnXIY-0000Jx-Mi; Wed, 04 Feb 2026 07:27:38 +0000
Received: by outflank-mailman (input) for mailman id 1220067;
 Wed, 04 Feb 2026 07:27:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnXIX-0000Jr-PO
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 07:27:37 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8800ea5-019a-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 08:27:33 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-432d2c96215so6049510f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 23:27:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436180659b8sm3908468f8f.43.2026.02.03.23.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 23:27:32 -0800 (PST)
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
X-Inumbo-ID: f8800ea5-019a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770190053; x=1770794853; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dkHK1xR5LyDogbbBR9kB4+iKJzwueKzkK3V+QZTM/+A=;
        b=T3G4XnicaaP+nlx032o2A3g4dwFTdT73TpUh1a1WO8iVGW11LDuZAdF2u3vE3RyeE+
         0mH/iyj2AmjZ8loD4qZJjEcwVyYS3x19HgYgd6/y+qPerf1lTZeVb61NUTr4V21iu2QD
         CpZ8q0wEdtwvKikyUKojH/Sryk/9wzXofeZ5BvmEVhGiDG++hdStaUfZAgTNXZmjNCRh
         JUFW3XfxkKWNY/L6+/WQBl1cKdwcCbyFlHr/DV9rDJA47zMKWSkxnEUVl3zM76B+KXNR
         duBJg7oZJ9bPDL5PcLDH+60WBOBHaNcUX9xc9pMwxnwDsgi0dWX3McnUOid7mzzLMxNj
         PRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770190053; x=1770794853;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkHK1xR5LyDogbbBR9kB4+iKJzwueKzkK3V+QZTM/+A=;
        b=ZSdBcucUUvxz+cUuRoXvLPKqOPAQtPupYGNqKP9hE7ZfY/d+4sgXkzGxRs3eiEA1tO
         5zkILSYwZ4sqaKuwV3IWTDGiRD2NuXdv6TvLQ6ooi9tEaaFKwvjsdtoNnCaIjBmQ9drS
         xtxgo3kBlu+Vyo9pirTNGT3KNy+cNquvFXz8zA5NWWaKC5G64CPj8PkEbweVmmKXFpzT
         8vsxFvIPpn5IZUY0NqGBz/Wc53LdJOCqVyZm+qeZtHfLTYoSdQCCqOw3i4E9vt/VnDZ7
         9gFm6jNOvxPQ6YNb3ZsAiN065P0Qy5/6ldaGrBahhPbDCsMkgRiII7P9LtKFPIt65f7C
         S4MA==
X-Forwarded-Encrypted: i=1; AJvYcCXE4zWA8OcxgWGWzr0PaV9Hjjogi5EQSuZ/+RwTaR3jlDtCJf3ghQP0Sn0mZbPbXEdeooq1Rqh8ibY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyw4FNLab7ICTHbBUxSuhIERe5t3ky0kCGBvZaIEjZvrF6LebfK
	aNbsC1vS7OPX0q1SWxCHkRLq2agYIMbwmWHri5edc6Lqe1BUtICc1lZ6rpa/DFiA+zjcNw+Zu+I
	dQMY=
X-Gm-Gg: AZuq6aJ8Gn0KbYNaeSjiujOpk3KTZG4gq2BwQcWsKRsqxUXlQwpsuWLlfjS1sqan/BO
	gxn5tVk22D4Bahg5FV7Tj+RPo4mi0zTWxBhGUWZnqaIMYmk6qZFDb237qTH3N/mY5M97wt1pdi5
	vlBKX77DLHW2+rc8dyGQAlFEgEe0zm3DNvQmsY7Q2TCwviYrhEsYNbnX/1jpB8izamFfZPUMhBR
	roL632psQMRcgPFpJG+FZuMQw0788uSaiLUjLV5FXdaYUONrXdJH4WuLwyd5pD3AuCgfZsEq6+n
	EB66Lf3wO51hiZPyXN7FD30dxPgViconUNgZaBvhOgdd8mjJsl3kqaB+7r7slN8WtV+8S6BqNG3
	7LqYtVGr/QdJ+BXK4OY4GjaDI8ShZrLH+VCGxlSuWiVFYfGbeRihaEwC12ybJWe2Jl3nFQDMFfp
	GNJJ0L9dygWKi8ic1j98/W21JHRHf9bBluemyuxjheyHha9Ju+EL5FK+HLdZ+/dUQOp9e5Wm/mv
	/Y=
X-Received: by 2002:a05:6000:2310:b0:431:32f:314d with SMTP id ffacd0b85a97d-43617e405eemr2736279f8f.25.1770190052664;
        Tue, 03 Feb 2026 23:27:32 -0800 (PST)
Message-ID: <9396b300-2698-4bb1-a856-0a4b3bcc6e6a@suse.com>
Date: Wed, 4 Feb 2026 08:27:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Ping: [XEN][PATCH v4] xen: make VMTRACE support optional
From: Jan Beulich <jbeulich@suse.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Teddy Astie <teddy.astie@vates.tech>, Penny Zheng <Penny.Zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <20251119193120.1011448-1-grygorii_strashko@epam.com>
 <90ac9206-10ce-4c46-83e3-82ac8ef0d152@suse.com>
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
In-Reply-To: <90ac9206-10ce-4c46-83e3-82ac8ef0d152@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tamas@tklengyel.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:aisaila@bitdefender.com,m:ppircalabu@bitdefender.com,m:teddy.astie@vates.tech,m:Penny.Zheng@amd.com,m:xen-devel@lists.xenproject.org,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0BD75E2B24
X-Rspamd-Action: no action

On 02.12.2025 11:57, Jan Beulich wrote:
> On 19.11.2025 20:31, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> The VMTRACE feature is depends on Platform/Arch HW and code support and now
>> can be used only on x86 HVM with Intel VT-x (INTEL_VMX) enabled.
>> This makes VMTRACE support optional by introducing HVM Kconfig option:
>> - CONFIG_VMTRACE to enable/disable the feature.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>> changes in v4:
>> - format changes
>>
>> changes in v3:
>> - drop vmtrace stubs for HVM=n case from hvm.h (VMTRACE depnds on HVM)
>> - hvm_vmtrace_reset() fix return err code
>> - add comment about using func declaration without definition
>>
>> changes in v2:
>>  - fix comments from Jan Beulich
>>  - move CONFIG_VMTRACE in HVM
>>  - drop HAS_VMTRACE
>>
>> v3:
>>  https://patchwork.kernel.org/project/xen-devel/patch/20251114142207.279834-1-grygorii_strashko@epam.com/
>> v2:
>>  https://patchwork.kernel.org/project/xen-devel/patch/20251112202442.3879997-1-grygorii_strashko@epam.com/ 
>> v1:
>>  https://patchwork.kernel.org/project/xen-devel/patch/20251031212005.1338212-1-grygorii_strashko@epam.com/
>>
>>  xen/arch/x86/domctl.c                   |  4 +++
>>  xen/arch/x86/hvm/Kconfig                | 12 +++++++++
>>  xen/arch/x86/hvm/vmx/vmcs.c             |  2 ++
>>  xen/arch/x86/hvm/vmx/vmx.c              | 11 ++++++++
>>  xen/arch/x86/include/asm/guest-msr.h    |  2 ++
>>  xen/arch/x86/include/asm/hvm/hvm.h      | 36 ++++++++++---------------
>>  xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  2 ++
>>  xen/arch/x86/mm/mem_sharing.c           |  2 ++
>>  xen/arch/x86/vm_event.c                 |  8 +++---
>>  xen/common/domain.c                     | 10 +++++++
>>  xen/common/memory.c                     |  6 +++++
>>  xen/common/vm_event.c                   |  3 ++-
>>  xen/include/xen/domain.h                |  4 +++
>>  xen/include/xen/sched.h                 |  4 +++
>>  14 files changed, 80 insertions(+), 26 deletions(-)
> 
> Tamas - any chance of an ack here?

I guess I will time out on this early next week.

Jan

> Grygorii - chasing missing acks is generally the submitter's responsibility.
> 
> Jan


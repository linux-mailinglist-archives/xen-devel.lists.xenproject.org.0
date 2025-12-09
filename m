Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E03ACAF33B
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 08:51:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181217.1504302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSsV9-0008Md-8b; Tue, 09 Dec 2025 07:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181217.1504302; Tue, 09 Dec 2025 07:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSsV9-0008KX-62; Tue, 09 Dec 2025 07:51:15 +0000
Received: by outflank-mailman (input) for mailman id 1181217;
 Tue, 09 Dec 2025 07:51:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sSjK=6P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSsV8-0008Iq-Kh
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 07:51:14 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5b8e931-d4d3-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 08:51:13 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-477632d9326so35630975e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 23:51:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a7d6fa0f6sm24703715e9.4.2025.12.08.23.51.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 23:51:12 -0800 (PST)
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
X-Inumbo-ID: d5b8e931-d4d3-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765266673; x=1765871473; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rcuKfpljgdksu4+01HqEAe+OkfUPKdSm4XJx26cTmtc=;
        b=eI6hTa5mN2qRn2Ilzczy5ecju6h7TsFFuoU8kD8T+tJ/Y8N7tetnAooimfqJz1Tjr4
         snMnCRHXIfQ12UTVE8Z2N328Qf7FYLR4x77qZEe14gk/pjVM9QuG2YFpouwiKB18o6zr
         Qf80CsJh+ETHopsPoaODefqLy9pv4HJJYF5A+z//Zcrzd5aIAtZ1H9SSkq8BgeqDpByB
         p78N/qatyFNFqQxjSgfQO27NtPe3igSq3G5ThvIGkcCtfxeNvygnVSf1CRHh8ZE3BkuX
         6fKUxsxir0hB2yE6iFIaxxrtwAJbC8mG/5VY28+rz1aDAYdVZYgmId5zHMiSG/h90Ane
         RrGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765266673; x=1765871473;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcuKfpljgdksu4+01HqEAe+OkfUPKdSm4XJx26cTmtc=;
        b=S/1j54Fvkl0LfsOy+bMc/oiHujfVOjA98QijC0r0rFTBdXxGqKb/79uvnIYC8JN2AD
         CmhYDVFuTjzhbIGYLgc5Fe2cMNH3K6YIVjfMiZYY3anfH5NHMison5OQf/X+MV8j4W1W
         zI+xMRlI0yQvn/S3RgqRIFCndcH9dYuQ6gnnD380NMNg6h6KzP2KUcGpk4s2KAEMSf9E
         +zei0VFbIqVTtBIWr/WJD4+kJv2ksJ3FhjhkN6ElEHpJxqUlu9NZgmoBKASus0/rAD+K
         m5eqGtmCMPwHOfGyEdoGZl+J5/CijjQcakBqHTwNocjJrJiC8aChA9H2y4bs24W9RP9U
         MOhA==
X-Forwarded-Encrypted: i=1; AJvYcCX0aw9hXrizvhOTuaGliJESluXYSluuSX+MVh9tWRnqRlvN0/L1vFJdvCpqtrE6NIJodicoyEzZswk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMUtk//8eSvPn6X9AeKTLgtVeHvGG4WvlbQVCdkPxyM/bIlCer
	2IXTp+ECtzq8XNPS0wsqG/EtDURjiVoSG3zZuqcsFhPTgMhTZGO9CC98wbbokOYGNA==
X-Gm-Gg: ASbGnct6X4SF6soLRn59SHLec0uWi1xd+4rJeJmgpMlHmmj7qNvF1quLsO7yEDpJWOL
	cRYUdIGdaGhQGVHm5M0uK+OyKje57daY/ITov68//+9eYDND4Yk4tfGZc+kkTI5ELNS1ulnlneT
	qvyGV+DDPo0kjcIGTCty0E4C/AH3crD3EUZPVuBEDWHAUJV82BRW+uoi/YpWduhk3oE2BkxvNGv
	S5uNRk0FOsN8O8XRnaSxberADi0ULv6zgxoPgWj0HNNPRxck+NpGbUQGKiqbEe5AqRkPBiwoYwU
	iXbgQ/SwKiyysEjDeXcYqZgPVpRxpyRFk7dRS1jWXohJPW5LfBNhLuXvxTQ3HAS7iIhlCf+xd40
	CCjBM4Pd2bnHo3JIioHoFgs0UDr5y0FFBv3DptE3zF6oeh4rkvuiEbONEyNlabMtRi8CXbCbcdp
	PWFhp+MkUop45VeJ5/vb2E9ME+8ZI/Sk8rdkBklK9I6Juh66qLzFH6YGV9tP/TMo/BVeCrvC+AG
	vWraLJGILzB7Q==
X-Google-Smtp-Source: AGHT+IFZNBhyY3nSmUSMW7HgUBNq2kqveFIiwht+JjUfvXdJ5jqPOvx7VLb+PVOesJw94H3ZgRNUlA==
X-Received: by 2002:a05:600c:37c3:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-47939e37b60mr107541435e9.27.1765266673304;
        Mon, 08 Dec 2025 23:51:13 -0800 (PST)
Message-ID: <11680d9e-bbe8-4457-a7cc-c73f649276e3@suse.com>
Date: Tue, 9 Dec 2025 08:51:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/19] xen/riscv: introduce VMID allocation and
 manegement
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
 <7805662d530eca29c5b0d0afa05a3cd0aac963bb.1763986955.git.oleksii.kurochko@gmail.com>
 <debd3ec1-2836-4481-aea9-833f04601a7a@vates.tech>
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
In-Reply-To: <debd3ec1-2836-4481-aea9-833f04601a7a@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.12.2025 18:28, Teddy Astie wrote:
> Le 24/11/2025 à 13:36, Oleksii Kurochko a écrit :
>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
>> index 34004ce282..6c4bfa3603 100644
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -3096,3 +3096,12 @@ the hypervisor was compiled with `CONFIG_XSM` enabled.
>>   * `silo`: this will deny any unmediated communication channels between
>>     unprivileged VMs.  To choose this, the separated option in kconfig must also
>>     be enabled.
>> +
>> +### vmid (RISC-V)
>> +> `= <boolean>`
>> +
>> +> Default: `true`
>> +
>> +Permit Xen to use Virtual Machine Identifiers. This is an optimisation which
>> +tags the TLB entries with an ID per vcpu. This allows for guest TLB flushes
>> +to be performed without the overhead of a complete TLB flush.
> 
> Should we regroup all asid/vpid/vmid (which are pretty much the same 
> thing with different names and for different arch) under a single 
> command-line option ?

How would you name such an option, without losing it being recognized by people
knowing the respective arch?

Jan


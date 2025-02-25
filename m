Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A2EA43DC5
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 12:36:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895649.1304310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmtDz-0001iB-6c; Tue, 25 Feb 2025 11:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895649.1304310; Tue, 25 Feb 2025 11:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmtDz-0001gJ-3O; Tue, 25 Feb 2025 11:35:43 +0000
Received: by outflank-mailman (input) for mailman id 895649;
 Tue, 25 Feb 2025 11:35:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmtDx-0001g5-Hn
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 11:35:41 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3cdb71e-f36c-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 12:35:40 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4398e3dfc66so48038795e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 03:35:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab15476f0sm22729555e9.23.2025.02.25.03.35.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 03:35:39 -0800 (PST)
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
X-Inumbo-ID: a3cdb71e-f36c-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740483340; x=1741088140; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gcC6pezk/4Gx3yFitnhPDG4c8pYzM+gSGsCfBAkjr2Q=;
        b=fy4HeQr28skDrsLmo8SUBmdyUD+tZKkBGL32lHYuaSwaNqPBNncEo5dw8AE7Fz9CLV
         QhzCI5a9jEE6F/UNbSlNn5ftFIq4FQB0Hb4U+OLYKBRE1ao7ZqmHpzfBeKW4ZZy6Xdil
         9RM1AmJeA9Hmv/mgXdmXXq3BXzJ5N0EdvO2JEqht6EjuKkMBN38rYVE2F1eYZHYmIc/t
         7W2K7MRHEM0s1JbH0ADsHTv00vyQDWsQJkZ22QlD3877YMdLb8nlIpnhdurFMb5M59mY
         awmgE8PDFv/WpdHEOI1NHgEzDnKGiMGTpk+ifeRtZnjYO9234XwzsYux0yy+UZ07ttlm
         s7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483340; x=1741088140;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gcC6pezk/4Gx3yFitnhPDG4c8pYzM+gSGsCfBAkjr2Q=;
        b=E8XyNsGTlE8546SllYjD+omyBoDBtsazsPJH0UTBdmP8ILRLQtCmDhdN5DJnWQ2Xd2
         SKWF9RDcXgrLRLZ6HLlOTdParrHMcj/EiV8DRlehQjBkr0PfvW3X0AcjjRs8dzipZSUR
         9hQ757NJ3mfl0ikCDYG8uQvXMLC/Vf6Xl0qlf2+DPDHqlmhgOPD2FhgOFc0tKvUi8/mS
         JGH99+1wz7326mU8/MfrBKOPVEVBR6QcRX9NJSU+83+APgWKOl42V5vzgIYEyfhc3J3D
         jvTbc0wz9UyQaUhvvSDDaXtVTkfD+cAdPFqomumQ4PAgFSe0XsH3Cclngh22Zfk7GzZl
         sR4Q==
X-Gm-Message-State: AOJu0Ywk3OxN2iySZGCfiF4lqRZxKCHr6LENuaX6FKnb/vmxQdweB5ZB
	n56n9pgm9Rsl6QdotzEOMQZCXbN9naff4eSYlAKhZhdCq5iItc0Gp8qf71v0uX+5jefP5pxfjkM
	=
X-Gm-Gg: ASbGnctFI23f7rhspUOls8hA0s3YngaU5u/AcyQUegFzqsfAMM4phFtfE4NpAyUWKZ7
	cNYkip2PSsTftFVicy32jlGlPCgO+DOVs5QoVad9WwAc7UsoIJkPjySAVrYK5gbgVY/kzyTkdLW
	O7Qt6Vc6wCzLNYe3d9tZd3Yh3sTEcw9gHgmKOctr/DhGAmxytKjKTmN6DsnjdsmCfmBWfq7heBE
	WQK2hOPJLsfZP22gF9XAQdRVOfpN2eUTFu7YSr2zvMPiwnmTTpkFFpgtTMt8Y9jCbsCGFGtBJzv
	H8zTzlbT0yzuC6iKwQHjTQEJfaBS5oYAuS0x7fkQ0RXGBrWcsdQp1ugUmAYN1PojfJkrQUM2lud
	SL1AYjT1yYiU=
X-Google-Smtp-Source: AGHT+IGvZgiystBFAHlLkCiLQ2/Eeoial+6O+XqLKxoHYK/rdM97TJxFb8GqNcgzFz6JqizO/CDJBg==
X-Received: by 2002:a05:600c:354c:b0:439:91dd:cfaf with SMTP id 5b1f17b1804b1-439ae1f2b3fmr143765395e9.18.1740483339724;
        Tue, 25 Feb 2025 03:35:39 -0800 (PST)
Message-ID: <748548e8-79e5-4957-be16-c5ea4d202d21@suse.com>
Date: Tue, 25 Feb 2025 12:35:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 00/11] x86/HVM: misc tidying
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

01: x86/HVM: improve CET-IBT pruning of ENDBR
02: VMX: drop vmcs_revision_id
03: VMX: convert vmx_basic_msr
04: VMX: convert vmx_pin_based_exec_control
05: VMX: convert vmx_cpu_based_exec_control
06: VMX: convert vmx_secondary_exec_control
07: VMX: convert vmx_tertiary_exec_control
08: VMX: convert vmx_vmexit_control
09: VMX: convert vmx_vmentry_control
10: VMX: convert vmx_ept_vpid_cap
11: VMX: convert vmx_vmfunc

Jan


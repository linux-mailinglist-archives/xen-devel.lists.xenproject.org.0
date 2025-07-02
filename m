Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9333AF0B49
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 08:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030194.1403811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWqdr-0005ZO-Im; Wed, 02 Jul 2025 06:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030194.1403811; Wed, 02 Jul 2025 06:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWqdr-0005Wz-Fj; Wed, 02 Jul 2025 06:08:23 +0000
Received: by outflank-mailman (input) for mailman id 1030194;
 Wed, 02 Jul 2025 06:08:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWqdq-0005Wt-Ah
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 06:08:22 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3b7cf19-570a-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 08:08:20 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so4163182f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 23:08:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2e3badsm124699255ad.21.2025.07.01.23.08.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 23:08:18 -0700 (PDT)
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
X-Inumbo-ID: f3b7cf19-570a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751436499; x=1752041299; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4hkd+FfK3Zh/MvmPYynZHAPoxoQw1ydaVp1vM3CM7DU=;
        b=fTvFr9jUxlSzPUJvrfUiGCiWz49L6d//tGsB4cgyzsusgVHeYiilRLgD/scMlMneTs
         MQaaNtW3dRGIzrJqBCuKzjfdFZwi6SZGpj9uivRdzp+j9vnG/Md3NpNiWOoqDnS2+om5
         lGPMSalcgT8mcevXaC35/OgX2fHyJZfj2WSqI9PPWvYRMmqzEVMnR6XSqTahT4qk15sr
         Pgcz1IbPDN0lLR4yH/St9jrcVaW5kbtEOEoWRnKAxIWz7yFvAZXRuLH7BXZ5Y0BiVRB3
         Q0oBs7K9jFqch+mno4o28Vn9BOTr5/0R1I6vMO3gEh0G2zIuZXWCozEFzWGhDzb8PcuY
         tejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751436499; x=1752041299;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hkd+FfK3Zh/MvmPYynZHAPoxoQw1ydaVp1vM3CM7DU=;
        b=CP5zfKFw4e7SzIrM2Fk16UIdfXL9cynR38vJqwzkVAxTvay4xQhZQ4ZTNN2rw+ixPD
         vpk+9H38KCUq+YHzAB+6ES9Uwa3eyqexLxYoaKvoJTSHZtxoMPdXZynapatyMHsR9d9b
         7//iH8hEC9MeF3euqzAPyVeZ5uEJgdF4kOSA+RMYxt4kP2T+3lbCUDqkwvY8eHn694vg
         nAvM6wpd5hv+iYgeY9f+gw/KF5yD22Cd5Pdb19XnJrwddBcvacwmLM3Y56r3GRrCfWw2
         mzzhhapVAqrsGX61MGoCPS5x2ElMeadyN3D6749TIkVt/0skwn2ysJqnFWVeuXTy5Kid
         Wsaw==
X-Gm-Message-State: AOJu0YxHym+ZjBU0ZnI6XvmElqn5JXgUrZJxkHlEft+YPjFEmjMX63WW
	0NND2JQuyBO9qKSTNWeo2XGx4bVx23IHJGYXm1TrAYggsY5HAmvLTIHAK2M4k+AnWA==
X-Gm-Gg: ASbGnctl46LNfqxojrNUK4e0I/PM0uHGTv8OKXLTiINej/cyfFGwhrtKqgqRQUhXIi3
	KaHfq4w9mhjm4tWyQlp/QuvqCXoBEvV0DuRq9HeD2wYfA9dcTP618qdTGjA6JK0rhPx5hNglXDz
	2KtJKSxQmuUcz7ifOhFKc9OuLbXyzsCgpKlwKsj4AInPokvqtsTtJuLkFqBoz2lt76QheEB5KwI
	RyBvDpHy2Ra8DRLYwNpttmyC5d/xpV/BAuLDfopNov7ai+wTetTm3YHGQdPcCWRcFHxQlZGTQaC
	/HIoRxp7czrUkgVCR5DJ7GhfEkeAGaSvZcQOfWfyzqhgy603AL+e+Zq8YmgKmU7uyq1Owh8q6Hb
	XGOyYninE53U9VY2deszjEI5AnFgsXfqh5i8L/FMEppWVD+g=
X-Google-Smtp-Source: AGHT+IH+lkzKuV7dymIp75U+XrEwvVShFgZk9ofvKQb07dlrH42CVl75l+8pgTfJwR5C4Ceu9/9NKw==
X-Received: by 2002:a05:6000:4211:b0:3a5:8977:e0fd with SMTP id ffacd0b85a97d-3b1f2b7bc7emr935856f8f.0.1751436499326;
        Tue, 01 Jul 2025 23:08:19 -0700 (PDT)
Message-ID: <86f06cf4-b3f1-43ab-94ee-7630b2564b65@suse.com>
Date: Wed, 2 Jul 2025 08:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] pdx: introduce a new compression algorithm
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2506271905350.862517@ubuntu-linux-20-04-desktop>
 <aGKnDHtRD5OLGaYj@macbook.local>
 <alpine.DEB.2.22.394.2506301726500.862517@ubuntu-linux-20-04-desktop>
 <1507b441-dd3c-4a24-beda-0d1d3143faf9@suse.com>
 <alpine.DEB.2.22.394.2507011338360.862517@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2507011338360.862517@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.07.2025 22:46, Stefano Stabellini wrote:
> On Tue, 1 Jul 2025, Jan Beulich wrote:
>> Sadly from this you omitted the output from the setup of the offsets
>> arrays. Considering also your later reply, I'd be curious to know what
>> mfn_to_pdx(0x50000000) is.
>  
> Full logs here, and debug patch in attachment.

Interesting. Up to ...

> (XEN) Checking for initrd in /chosen
> (XEN) RAM: 0000000000000000 - 000000007fffffff
> (XEN) RAM: 0000000800000000 - 000000087fffffff
> (XEN) RAM: 0000050000000000 - 000005007fffffff
> (XEN) RAM: 0000060000000000 - 000006007fffffff
> (XEN) RAM: 0000070000000000 - 000007007fffffff
> (XEN) 
> (XEN) MODULE[0]: 0000000022000000 - 0000000022172fff Xen         
> (XEN) MODULE[1]: 0000000022200000 - 000000002220efff Device Tree 
> (XEN) MODULE[2]: 0000000020400000 - 0000000021e2ffff Kernel      
> (XEN)  RESVD[0]: 0000000000000000 - 0000000000ffffff
> (XEN)  RESVD[1]: 0000000001000000 - 00000000015fffff
> (XEN)  RESVD[2]: 0000000001600000 - 00000000017fffff
> (XEN)  RESVD[3]: 0000000001800000 - 00000000097fffff
> (XEN)  RESVD[4]: 0000000009800000 - 000000000bffffff
> (XEN)  RESVD[5]: 0000000011126000 - 000000001114dfff
> (XEN)  RESVD[6]: 000000001114e000 - 000000001214efff
> (XEN)  RESVD[7]: 0000000017275000 - 000000001729cfff
> (XEN)  RESVD[8]: 000000001729d000 - 000000001829dfff
> (XEN)  RESVD[9]: 000000001a7df000 - 000000001a806fff
> (XEN)  RESVD[10]: 000000001a807000 - 000000001b807fff
> (XEN)  RESVD[11]: 000000001d908000 - 000000001d92ffff
> (XEN)  RESVD[12]: 000000001d930000 - 000000001e930fff
> (XEN)  RESVD[13]: 000000001829e000 - 000000001869dfff
> (XEN)  RESVD[14]: 000000001869e000 - 00000000186ddfff
> (XEN)  RESVD[15]: 0000000800000000 - 000000083fffffff
> (XEN) 
> (XEN) 
> (XEN) Command line: console=dtuart dom0_mem=2048M console_timestamps=boot debug bootscrub=0 vwfi=native sched=null
> (XEN) [00000006bfc302ec] parameter "debug" unknown!
> (XEN) [00000006bfcc0476] DEBUG init_pdx 294 start=0 end=80000000
> (XEN) [00000006bfcd2400] DEBUG init_pdx 294 start=800000000 end=880000000
> (XEN) [00000006bfce29ec] DEBUG init_pdx 294 start=50000000000 end=50080000000
> (XEN) [00000006bfcf1768] DEBUG init_pdx 294 start=60000000000 end=60080000000
> (XEN) [00000006bfd015a4] DEBUG init_pdx 294 start=70000000000 end=70080000000
> (XEN) [00000006bfd1444f] DEBUG setup_mm 252
> (XEN) [00000006bfd3dc6f] DEBUG setup_mm 273 start=0 size=80000000 ram_end=80000000 directmap_base_pdx=0
> (XEN) [00000006bfd5616e] DEBUG setup_directmap_mappings 229 base_mfn=0 nr_mfns=80000 directmap_base_pdx=0 mfn_to_pdx=0
> (XEN) [00000006bfd7d38a] DEBUG setup_directmap_mappings 237 base_mfn=0 nr_mfns=80000 directmap_base_pdx=0
> (XEN) [00000006bfd92728] DEBUG setup_mm 273 start=800000000 size=80000000 ram_end=880000000 directmap_base_pdx=0
> (XEN) [00000006bfdaba3b] DEBUG setup_directmap_mappings 229 base_mfn=800000 nr_mfns=80000 directmap_base_pdx=0 mfn_to_pdx=800000
> (XEN) [00000006bfdcd79c] DEBUG setup_directmap_mappings 237 base_mfn=800000 nr_mfns=80000 directmap_base_pdx=0
> (XEN) [00000006bfde4d82] DEBUG setup_mm 273 start=50000000000 size=80000000 ram_end=50080000000 directmap_base_pdx=0
> (XEN) [00000006bfdfaef0] DEBUG setup_directmap_mappings 229 base_mfn=50000000 nr_mfns=80000 directmap_base_pdx=0 mfn_to_pdx=50000000
> (XEN) [00000006bfe35249] Assertion '(mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) < (DIRECTMAP_SIZE >> PAGE_SHIFT)' failed at ./arch/arm/include/asm/mmu/mm.h:72

... here there's no sign of PDX compression actually being set up; all that's
there are the init_pdx() messages. Do you perhaps have an ordering problem on
Arm? The register values ...

> (XEN) [00000006bfe68507] ----[ Xen-4.21-unstable  arm64  debug=y  Not tainted ]----
> (XEN) [00000006bfe766bf] CPU:    0
> (XEN) [00000006bfe832e0] PC:     00000a00002da70c setup_mm+0x284/0x308
> (XEN) [00000006bfea5b1a] LR:     00000a00002da6b0
> (XEN) [00000006bfeb1032] SP:     00000a0000327e00
> (XEN) [00000006bfebf403] CPSR:   00000000200003c9 MODE:64-bit EL2h (Hypervisor, handler)
> (XEN) [00000006bfed4634]      X0: 0000000000000017  X1: 0000000000000000  X2: 0000000050000000
> (XEN) [00000006bfee4d11]      X3: 000000004fffffff  X4: 0000000000000020  X5: 0000000000000000
> (XEN) [00000006bfef48cf]      X6: 0000000000000000  X7: 0000000000000000  X8: ffffffffffffffff
> (XEN) [00000006bff047ac]      X9: fefefefefefeff09 X10: 0000000000000080 X11: 0101010101010101
> (XEN) [00000006bff153b4]     X12: 0000000000000008 X13: 0000000000000009 X14: 0000000000000030
> (XEN) [00000006bff2620d]     X15: 00000a0000a00000 X16: 00000a0000291478 X17: 0000000000000000
> (XEN) [00000006bff35c41]     X18: 000000007be9bbe0 X19: 00000a0000292c40 X20: 00000a00002ade68
> (XEN) [00000006bff465a5]     X21: 0000050080000000 X22: 0000000000000000 X23: 0000000180000000
> (XEN) [00000006bff57a51]     X24: 0000000000000002 X25: 00000a0000292c50 X26: 0000000050000000
> (XEN) [00000006bff67d91]     X27: 0000000000080000 X28: 0000050000000000  FP: 00000a0000327e00

... also suggest (x2, x3, and x26 in particular) that offsets are still all
zero, i.e. PDX == MFN. And aiui DIRECTMAP_SIZE is 5Tb.

Jan


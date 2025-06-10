Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0D8AD3CF6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 17:27:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011055.1389354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP0sS-0007lr-Lb; Tue, 10 Jun 2025 15:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011055.1389354; Tue, 10 Jun 2025 15:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP0sS-0007kN-Iu; Tue, 10 Jun 2025 15:27:04 +0000
Received: by outflank-mailman (input) for mailman id 1011055;
 Tue, 10 Jun 2025 15:27:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uP0sR-0007kH-Ai
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 15:27:03 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 573f5511-460f-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 17:26:55 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a503d9ef59so4690444f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 08:26:55 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53229e014sm12527194f8f.3.2025.06.10.08.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 08:26:54 -0700 (PDT)
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
X-Inumbo-ID: 573f5511-460f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749569215; x=1750174015; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EJHvElI3KNhjRfVxoLk49hH8Wf1ZGRCL8DjojWz/gWE=;
        b=cVoxK7ocsIIb1Fj/XODSxoApE7BcM+PnRxBpubBgrggL96RfsLHkrqJkl0yjnVrOss
         BsqoWZ4ySiyX2CX86ikEaJ3TtKkxTvwn29L1z5S820+yaORvoWYT4JPukrubxjv8FKSq
         PvEUSAOLj5P/BcTUnSXTV1vFnz/0y4vGolM9m75lt6KZ7Zd7CJrr4aLKyjnqx/nJ5xbQ
         lkyjMmtRuVbh7bp2qJvNarUBd637Je/rtcNJ4fRIzGx0RFqkRvavsN1nIhmbSZtuqPa1
         k4QLroYqDWRCvytzL3DWedtVs5GWx+Si8lxoISeWaFjWHoiXtly2w44mn0u5kauq4Wd+
         xeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749569215; x=1750174015;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJHvElI3KNhjRfVxoLk49hH8Wf1ZGRCL8DjojWz/gWE=;
        b=U8AXv+gWqhTwsqCyTXs9iDq/KfwgQD8wDhnzhv+/Tr2AGhHQXNzVgfb2pfaUMpzeRY
         NroWyOexyah3ed5jlBIiDCdNL1M4kNdqKgudTwAOJbC8muegPqmzWLfvH/RelNKdESXQ
         ikVNpL7hIfR01ycb1C0PoXzjAKhEpMdTQSqzAM+Tu/ssW1TH5Rca38lCi/1v9644VRC+
         F/IMWOs4dNeJQEYM8otIJ4XfdIG4VWEFo7wA6ZAvytcyfT3t7iH8ZwwHYBA8Vpq60uIp
         +7L5BfAs3qQY4qxU0I24BpEGhiqo67nxhVjkVVQkcDb+GqguyGEeZb/THvTXJu1AJ1/x
         9C3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8cwSwjjM8MBMmzQHbcduEVnu2cemE5sk4UIjj9zVzKfOHOnzifgWfDWHqTrSou6IQSlCPVmFahuQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxP9K8im2WRhsNWEXkgCoZ3YEcm5ty7jAvrFSgd7DlBnzGWnUIe
	F8cp8SZK0cK7s3McVXR+I56cnPZof+zbLXX40KasoS1v+4yEG4jsj+FXPWJmvdzexA==
X-Gm-Gg: ASbGnctxpHIZFX5Ny3sINSeNGMQh/n5v3B9Tw8rFB7BVVZm1/8MrglDmQbxqq6X9eWc
	RRq4l5fClOVo5S2DDZTlucv/Z9UGq7wWZXAqH2qV2l4sO3S2hXW5sIOlmhdNJJMEpukQ1QOi1xV
	MIFCQcEWLpXGXKYIt5SqosRd4ZEwa+PLWuWVPOR5JpWx53+mORUps/PZ9UlxF0qlFmSxp46gFyZ
	wpLmOuKffWzMTQHCAiTXNhldm0E8kW+Mg/c1hff3fuWsukc5MDWsUpmWbpTg2g6AEsZ524HmNwX
	Xr8XG4eVQjikxXtlj1BH/BeEOno2vkGs4bzao/K/yvSWqRZSvBdJbLV2UvSwlRopleYjoSMGQPj
	ncWaFIGBulMkS7e3D0s/RWSNlFPAQKiKgqASucpVpcyJVpmIkObSrCGR1fkcnc0gCxFs/DIUs5K
	vSiZb0rm0QjiIHJeI+G/Gi
X-Google-Smtp-Source: AGHT+IGTp7klgxZ2iBkdgy2VXV3eo2EX4dr++tru2KhxzhCWUJ3ai1p6g1uF3qjYQy4pAZYcY9yDeA==
X-Received: by 2002:a05:6000:26c8:b0:3a3:7077:aba1 with SMTP id ffacd0b85a97d-3a531ce677bmr14547341f8f.48.1749569214662;
        Tue, 10 Jun 2025 08:26:54 -0700 (PDT)
Message-ID: <072c6c93-7633-4662-982d-e57697993eed@suse.com>
Date: Tue, 10 Jun 2025 17:26:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] xen/riscv: implementation of aplic and imsic
 operations
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1749121437.git.oleksii.kurochko@gmail.com>
 <2135173f5ca0e43b54e97052c221ba04c25f830c.1749121437.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2135173f5ca0e43b54e97052c221ba04c25f830c.1749121437.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2025 17:59, Oleksii Kurochko wrote:
> Introduce interrupt controller descriptor for host APLIC to describe
> the low-lovel hardare. It includes implementation of the following functions:
>  - aplic_irq_startup()
>  - aplic_irq_enable()
>  - aplic_irq_disable()
>  - aplic_set_irq_affinity()
> 
> As APLIC is used in MSI mode it requires to enable/disable interrupts not
> only for APLIC but also for IMSIC. Thereby for the purpose of
> aplic_irq_{enable,disable}() it is introduced imsic_irq_{enable,disable)().
> 
> For the purpose of aplic_set_irq_affinity() aplic_get_cpu_from_mask() is
> introduced to get hart id.
> 
> Also, introduce additional interrupt controller h/w operations and
> host_irq_type for APLIC:
>  - aplic_host_irq_type
> 
> Patch is based on the code from [1].
> 
> [1] https://gitlab.com/xen-project/people/olkur/xen/-/commit/7390e2365828b83e27ead56b03114a56e3699dd5
> 
> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



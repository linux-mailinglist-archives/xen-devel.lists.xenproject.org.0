Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A38AD555E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 14:23:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011667.1390131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPKTd-0000Hd-Eg; Wed, 11 Jun 2025 12:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011667.1390131; Wed, 11 Jun 2025 12:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPKTd-0000G0-B2; Wed, 11 Jun 2025 12:22:45 +0000
Received: by outflank-mailman (input) for mailman id 1011667;
 Wed, 11 Jun 2025 12:22:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPKTb-0000Fu-6F
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 12:22:43 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfeb8e9c-46be-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 14:22:32 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a53359dea5so2955820f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 05:22:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2f5f7823c7sm8311543a12.56.2025.06.11.05.22.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 05:22:31 -0700 (PDT)
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
X-Inumbo-ID: bfeb8e9c-46be-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749644552; x=1750249352; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h2Usbbx70jDuByGmRoimETVcLg8DV/t01fI+LAvTcvw=;
        b=CI85jUCp3n6CeXMieQmqjU7fqIhvDd/sDfazUsGESF/8w91JzCSQUHL93twQYUaY09
         SmC2XgxwjHMX0Y8MDBUDBvx5KnlUtFHYNY7M9ieTI5BPIDeAyjPJsA6+kEL6E9IJwIyw
         S6I/wffiSL1NjPirO4TYt6qmBei0pHaHCx8rQ2P1K/y2DazaC95cHclBi5hNPGQmV49K
         vHdO2kwFbKswhj73IlrMZaGAoGBhTF7K+LwAVGyiqfMKlPrjgRkS6zgkeU/qohbOWrm5
         oc9QO7CoQF7q95U1eqj0Uhc7YVnPD8xjLs/H29TAjH0JVzt3k5ehRe9sRbv9pq9/NiGT
         E2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749644552; x=1750249352;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2Usbbx70jDuByGmRoimETVcLg8DV/t01fI+LAvTcvw=;
        b=OoYwta4lUusCsZvMl+fODhqAR8jHhvQaVV/5haRiT7SIS0RGGQsgLMi7Aq3IsATEMd
         SXBp4WKlc5iUtfKtJLhjuBGqsK7v4kE42/F9QXyVELNWx/nR5eQUh/1ooRaTCCBn2fy9
         64YOq6D0V2aP5+ZVp1kVaQcaNn41mFX1gme87RVEcC+pHFhVKxLPWVfVBynqLR6Sw7bC
         TxWMTRIwqjKIoVwAQ9+uLW2ZpXtsisxJACbGMpstO30Pg0po9gbMnwrZwJG4224KOh7P
         JMNHwIq9uZAeP6x1FjwDodulBm6CnICBHKQb+Jim/HoLAfim++9OSbZ+vIJDVCiWYg/8
         I6aA==
X-Forwarded-Encrypted: i=1; AJvYcCWIFOs43FybAjBgo7PfYwdS19x8QYYXG8e0XP4cWmidv486lEUh8e/B5ehgIt2FTRAN3mIeKmae7Kc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyxw/LyzzGasrQ133mrQJXFqctcxGSValHgu1S3/0dCQOAf+Z6+
	1CfieCF3cZGGpkqCq0ZQ5Cv9QEeW0tYwje+mJ0D7PUI0o579n9VoBTUYGqgaA6cujg==
X-Gm-Gg: ASbGnctZJNK3+hvCEj/JYHxqF9eE8/vz5b4uSCmFcZvqmEJVpvQi1sgBx4pIkyOeUgk
	cJHtUQOWfjthk0B9FWqrj39dmmji6XB7RvI2FjU4jRkBzZVysqd2lBJcXKSYz+l3GPA3qwXMcdC
	FZpPxgHXD7kYxL3v8hmUepSbdzNxNJQwLoma8idoaksZF1mBf/zdo4rZIIvecDMyKFXDgdjcnVV
	PqYRjIVoXf7N3G1dekivvE7E52ka+2cuSNam4hqX2PoNuP/MHDVaxif4f2+YDk/J0r7OYgEY/+2
	uZreHFX6iW+kdYCOjZwhXUjpSlYO1LAq9DfLQnBtaJ6VjEw5qiwmRoh6u/3Dquwu5hRQ20yH5mW
	C8s+g8H3VcbppPxDe1krpCaU+kKfru/0m6fBO9NiuBMIr3jg=
X-Google-Smtp-Source: AGHT+IH+pVbEMLmnwJE1ZCiyM6J/NGZRtJOI4fc+ZoXrBSWlKk0IxeVndR6MaAkBoIBADY7BRkQjJw==
X-Received: by 2002:a05:6000:2382:b0:3a4:eae1:a79f with SMTP id ffacd0b85a97d-3a558a325e3mr2527626f8f.33.1749644552147;
        Wed, 11 Jun 2025 05:22:32 -0700 (PDT)
Message-ID: <3e5713bc-93ee-45e3-ad45-b79904539284@suse.com>
Date: Wed, 11 Jun 2025 14:22:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/hvmloader: select xenpci MMIO BAR UC or WB MTRR
 cache attribute
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Anthoine Bourgeois <anthoine.bourgeois@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20250610162930.89055-1-roger.pau@citrix.com>
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
In-Reply-To: <20250610162930.89055-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.06.2025 18:29, Roger Pau Monne wrote:
> The Xen PCI device (vendor ID 0x5853) exposed to x86 HVM guests doesn't
> have the functionality of a traditional PCI device.  The exposed MMIO BAR
> is used by some guests (including Linux) as a safe place to map foreign
> memory, including the grant table itself.
> 
> Traditionally BARs from devices have the uncacheable (UC) cache attribute
> from the MTRR, to ensure correct functionality of such devices.  hvmloader
> mimics this behavior and sets the MTRR attributes of both the low and high
> PCI MMIO windows (where BARs of PCI devices reside) as UC in MTRR.
> 
> This however causes performance issues for users of the Xen PCI device BAR,
> as for the purposes of mapping remote memory there's no need to use the UC
> attribute.  On Intel systems this is worked around by using iPAT, that
> allows the hypervisor to force the effective cache attribute of a p2m entry
> regardless of the guest PAT value.  AMD however doesn't have an equivalent
> of iPAT, and guest PAT values are always considered.
> 
> Linux commit:
> 
> 41925b105e34 xen: replace xen_remap() with memremap()
> 
> Attempted to mitigate this by forcing mappings of the grant-table to use
> the write-back (WB) cache attribute.  However Linux memremap() takes MTRRs
> into account to calculate which PAT type to use, and seeing the MTRR cache
> attribute for the region being UC the PAT also ends up as UC, regardless of
> the caller having requested WB.
> 
> As a workaround to allow current Linux to map the grant-table as WB using
> memremap() introduce an xl.cfg option (xenpci_bar_uc=0) that can be used to
> select whether the Xen PCI device BAR will have the UC attribute in MTRR.
> Such workaround in hvmloader should also be paired with a fix for Linux so
> it attempts to change the MTRR of the Xen PCI device BAR to WB by itself.
> 
> Overall, the long term solution would be to provide the guest with a safe
> range in the guest physical address space where mappings to foreign pages
> can be created.
> 
> Some vif throughput performance figures provided by Anthoine from a 8
> vCPUs, 4GB of RAM HVM guest(s) running on AMD hardware:
> 
> Without this patch:
> vm -> dom0: 1.1Gb/s
> vm -> vm:   5.0Gb/s
> 
> With the patch:
> vm -> dom0: 4.5Gb/s
> vm -> vm:   7.0Gb/s
> 
> Reported-by: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com> # hvmloader



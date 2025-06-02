Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA34FACABCE
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 11:47:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003092.1382551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM1kn-0007yU-81; Mon, 02 Jun 2025 09:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003092.1382551; Mon, 02 Jun 2025 09:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM1kn-0007wA-5K; Mon, 02 Jun 2025 09:46:49 +0000
Received: by outflank-mailman (input) for mailman id 1003092;
 Mon, 02 Jun 2025 09:46:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM1km-0007w4-9r
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 09:46:48 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fbf9635-3f96-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 11:46:47 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a36e0d22c1so2377993f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 02:46:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cd3563sm66885735ad.158.2025.06.02.02.46.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 02:46:45 -0700 (PDT)
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
X-Inumbo-ID: 7fbf9635-3f96-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748857606; x=1749462406; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6RjksbLPTo8f+oxer9pDxbI9XQzHTDeaZ6gGyOCdedY=;
        b=GotDI3eKem9rSNPed7WEZJej0TmVWGhBNHFt68LWG+QeI8KqibC/NqeRABZqsp6f9E
         knfq22nFQ1UStnBfBuweMB44269Abi9q8DpAhYrUdcK5jL3rd1w/JWKDKRoVZZrdrhvS
         kvLjRoIf1mqEN4OtK5EOHsQ8U1/yB3U9Zcsip/8nZSNV5IpR4Era2jOnh0L2+p99l+iK
         UOy5TI3aXgI/0J1otg4yyXaQWqyRqgKcRdFmxrAZlsXsBKZ7YCifFS08VEK5q5yZvMMR
         la5ZAoxnAOaDHHkO34XoQm61L+9bG8ymrKvQwKgY1s5C1g2faCWfNR5mjv1yI3qMpsEo
         21ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748857606; x=1749462406;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RjksbLPTo8f+oxer9pDxbI9XQzHTDeaZ6gGyOCdedY=;
        b=Es5zaMrT+k5HV3KgpZ/Sp//M3Z4bjiIQ/EgjIdgakvt88YkIWJ8hRg1jB90w9YacHj
         h7aZ6x7lV6F9zhKoMaj1kiynP4cV7XXiIsmJEh5uzGSmm9pw0w2yBkrw31JuQBgI9tQp
         Sg/cdFpRq8FWxgPzwCvRzcYN0vN5gfuWvW+MbcnZT9yWbrk8eOmUY2rLQESBq68cSM56
         M30kP3RgNreQPCUI37p+v+IZJHWHkuvbRi/i/+slrhgRDETSidPA/pCfiD2kEUbnjkP2
         fULEW/74FotfE7iQGl5Pot9OigSTMZwCLRr69QjBMOaWq4rup0IRdsVeXtMQNBFZ6WSY
         c5ow==
X-Forwarded-Encrypted: i=1; AJvYcCXi9tvhhin+49nV1h3s5Gmoakm+Me6HmXtlzdFKHLBRGKqCFJC8zkK0rC6sDtr4o845EAi1q9/fsqA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPLyt2bFc06JxvKyytSuBTBCmNdGXKc5pDnpaxcI6SDOrWPNQx
	YNqAQ0NChWVmGCLlevB6XCjQ8Xf0cuOPD3UbS2JyQOF1hN8tE9aMuQvbxNap4szy+WDijqd8P2n
	AxwQ=
X-Gm-Gg: ASbGnct7ty7BAvjFKErQKZ0n6PiRPyEoDikGtZEfsX3gmRkRMsx0EIxdNCj04vki2YC
	vqnwm9SuLRVinGS14vXWfyTer3rrmGbZdhgoKo4dRBYBzhua3OQfbDZw068Haux2gpt+d0q/PPb
	6tLlPi3M170fkaTAm3lLTlIIIQeGhExYwcI20QxnGca570kF6Re/iAATeAhfUyEqYHNmtlaIar+
	xO5MGfP68sYzjMBLgDJYebbBqktumbaW3xeDVfUIwvNxSLp0AhT7mpTsNDi4CTCRolC6QqjMOP2
	Rfx9XGJvpSTb9BzKzJDAMeb0Qnw3r8x57fDt5WjBc75s3xZeIYqit2oWry6WIsmknkdj2Q1JAuV
	h9a3+ur7OnoJ299cqXiE3iUZunk85felpjdbQ
X-Google-Smtp-Source: AGHT+IGAjNViutzTuoJON9wvQDBcxid9RrXa3/0MsHh9PVWh1RXkDT2e1/vjRCWeS9X8bRyJFBhm2w==
X-Received: by 2002:a05:6000:2907:b0:3a4:f6b7:8b07 with SMTP id ffacd0b85a97d-3a4f89dd0e0mr9505658f8f.48.1748857606438;
        Mon, 02 Jun 2025 02:46:46 -0700 (PDT)
Message-ID: <58c0499c-cdde-4cc3-9441-606a0eea4652@suse.com>
Date: Mon, 2 Jun 2025 11:46:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvmloader: don't set xenpci MMIO BAR as UC in MTRR
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Anthoine Bourgeois <anthoine.bourgeois@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20250530092314.27306-1-roger.pau@citrix.com>
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
In-Reply-To: <20250530092314.27306-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.05.2025 11:23, Roger Pau Monne wrote:
> The Xen PCI device (vendor ID 0x5853) exposed to x86 HVM guests doesn't
> have the functionality of a traditional PCI device.  The exposed MIO BAR is
> used by some guests (including Linux) as a safe place to map foreign
> memory, including the grant table itself.
> 
> Traditionally BARs from devices have the uncacheable (UC) cache attribute
> from the MTRR, to ensure correct functionality of such devices.  hvmloader
> mimics this behaviour and sets the MTRR attributes of both the low and high
> PCI MMIO windows (where BARs of PCI devices reside) as UC in MTRR.
> 
> This however causes performance issues for the users of the Xen PCI device
> BAR, as for the purposes of mapping remote memory there's no need to use
> the UC attribute.  On Intel systems this is worked around by using iPAT,
> that allows the hypervisor to force the effective cache attribute of a p2m
> entry regardless of the guest PAT value.  AMD however doesn't have an
> equivalent of iPAT, and guest PAT values are always considered.
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
> memremap() special case the Xen PCI device BAR in hvmloader and don't set
> its cache attribute as UC.

Can we (fully compatibly) make such a change? IOW do we know all possible
guests would be at least unaffected (ideally affected positively)? Imo ...

>  Such workaround in hvmloader should also be
> paired with a fix for Linux so it attempts to change the MTRR of the Xen
> PCI device BAR to WB by itself.
> 
> Overall, the long term solution would be to provide the guest with a safe
> range in the guest physical address space where mappings to foreign pages
> can be created.

... this is the only viable path.

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
> ---
> I don't think the ACPI tables builder consume the PCI window size
> information, I'm not seeing any consumer of the acpi_info->pci_{min,len}
> fields, yet I've keep them covering the xenpci device BAR, hence the
> adjustment to hvmloader_acpi_build_tables() part of this patch.

acpi_build_tables() copies the field, and the comment ahead of struct
acpi_info clarifies where the uses are: It's the PLEN field, which does
have a use in dsdt.asl. Aiui the change you make is therefore a necessary
one.

Jan


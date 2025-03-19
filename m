Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5CCA689F0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 11:47:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920246.1324469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuqwN-0007yI-45; Wed, 19 Mar 2025 10:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920246.1324469; Wed, 19 Mar 2025 10:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuqwN-0007vU-12; Wed, 19 Mar 2025 10:46:27 +0000
Received: by outflank-mailman (input) for mailman id 920246;
 Wed, 19 Mar 2025 10:46:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuqwM-0007vO-0T
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 10:46:26 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66f77f4d-04af-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 11:46:25 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3913fdd0120so3552833f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 03:46:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c82c249csm20215008f8f.21.2025.03.19.03.46.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 03:46:23 -0700 (PDT)
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
X-Inumbo-ID: 66f77f4d-04af-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742381184; x=1742985984; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Lj2KzgTX9J4nlnRoJMx44xMinjBuaoBGVzEIuYIfPco=;
        b=bcT6gWaSocGeiDhaLhHDyA1T1e5jXE4RQ/l+DRKsEzpc4UXTMCavOwpvc/gTyQE4jV
         xXfCunlVqeV/HXQMERPNaUZZne9HgeaenHlAxWl56RmH8EDu+TsMvVyGUY1M6+HRoLfe
         qWsjOpYrOhyKpA6LI65+uSrO++laJEyU8X7yRx/8YHHAAj2FlpAT7GHefskDv/2BYD1z
         gME6r4hybxHefrVIs6sd6Ff89u5RMtZo8VoKAnf5hioNE15p2mycAJpzyt0c0mLKZFSw
         pqHoF3sjTqMUZXHNtEGWQbXXxhixhhAgZNlLHSUrcLyCMP66+AChf1JjXw5hdv4827QM
         nMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742381184; x=1742985984;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lj2KzgTX9J4nlnRoJMx44xMinjBuaoBGVzEIuYIfPco=;
        b=ZxJ/+p1pxWqY3e4KOdqJGnQHwnc4Z1l6OPCJ+9ws4xqGCLepULqQ7QIqwmygTQ9czG
         UFeAZDxwmTKg3P0r0e6tmleW9Q0XY6HOoHOPVkE1gtsFOkNpUdubFuN23zPT0h5nT6Kj
         4HdBKYYu+gsqnr+T4BxbGR2FZW9gKICChTiNkuGj1ZxQylluT3d0TbHEclelaZH4Q5X8
         peQzttC+xe0BvZf/q8YI5cW5ajrv3V/q8ekrglKFeAnlbRMdKT7UCpKu21pqmQXSg8yh
         Og1LrZQqf5MpNLvR/RFmXygZAaWsp4f+vSihn+sO58yhwy3s2CB5moPdtwlgbGY1cTKy
         6FUg==
X-Forwarded-Encrypted: i=1; AJvYcCXF8gzDpCCZCtdQnc5VpD1t94QmDtZ379jCDmDA6xfJu/y8m8pAcjlKan+cyzfCkGUlVFJhOasGHhU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSIgfICGip/sUMxiDGTuW5AKaTpkPYRr0YIPFZbOZbNNUU/doL
	X1AGBnmzwiCR9PQQXX8bw98UCtFK0ayXlxJlx4rntDupCw4iSHPkQJhcX+qBlQ==
X-Gm-Gg: ASbGncspIAEpSIkzMW+VkY6ME0sZRzPt1nNkPcCFqzD1fm0T22nTX/hcv7xx1T+XKBh
	TNWd1X2yA7cvDgjkzetxqcztMz6gRjemTeAt44IgYrBRSUjX0Y+080PmzEh/NQs33zU8SKcE56m
	nUWmnqJ+Uvxsss3PMQWylM1cBAenQcp1TFKio6dIZ3ZiWSGYoUdLJ4SJvYlZArWbBAGkk5QG+hv
	bfHmhgQBRz7NDWS5j/c7jf5gQr2E2rgt0vGU8JuRs4joprmuGXg9a+6ffTb/wrbX4gYQWD/03+e
	tOBW2Zr9FhLJD8F/8IC7XydzXeHDYVnTLTOxNax8/FuajtZ8D0i10SMI0Yb1LgypT1fJUUKUx5t
	nYrGt1rx+EtZpRL3c3OxYh9GCq9I3yA==
X-Google-Smtp-Source: AGHT+IGNuf6/nrxEztrLrxR4m18P4zuoCs5y3UcY7FqgYRk4YRngDQn8Eu1BnCzICoZV+V/mytfF6w==
X-Received: by 2002:a05:6000:381:b0:391:3cb7:d441 with SMTP id ffacd0b85a97d-39973af23c0mr1698805f8f.25.1742381183690;
        Wed, 19 Mar 2025 03:46:23 -0700 (PDT)
Message-ID: <27ebf169-ab63-4def-a98b-751ae1758293@suse.com>
Date: Wed, 19 Mar 2025 11:46:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] x86/mkreloc: remove warning about relocations to RO
 section
From: Jan Beulich <jbeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-6-roger.pau@citrix.com>
 <a3c70637-b354-40f4-9a67-9d2aa7bcdcb0@suse.com>
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
In-Reply-To: <a3c70637-b354-40f4-9a67-9d2aa7bcdcb0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2025 11:32, Jan Beulich wrote:
> On 18.03.2025 18:35, Roger Pau Monne wrote:
>> Relocations are now applied after having moved the trampoline,
> 
> That's two entirely different sets of relocations, isn't it? What we generate
> here is what is to be encoded in the PE binary's .reloc section, for the PE
> loader to process. And for us to then process again once we move Xen back to
> its linked position (by virtue of leaving physical mode). Therefore what
> matters here is whether these relocations are still carried out while on the
> page tables to boot loader created, or when already on page tables we control.
> In the former case any relocation to a non-writable section would be liable
> to fault when applied.

And yes - both calls to efi_arch_relocate_image() are ahead of switching page
tables. The first call is benign - no writes occur there. The second call
would cause #PF though for any relocs applied to .text or .rodata or .init.text
or whatever else is non-writable.

Jan


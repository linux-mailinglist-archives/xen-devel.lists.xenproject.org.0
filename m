Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D70CFB0F51E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 16:21:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054221.1422945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueaLc-0006mE-TL; Wed, 23 Jul 2025 14:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054221.1422945; Wed, 23 Jul 2025 14:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueaLc-0006jZ-Qf; Wed, 23 Jul 2025 14:21:32 +0000
Received: by outflank-mailman (input) for mailman id 1054221;
 Wed, 23 Jul 2025 14:21:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueaLb-0006jT-Dr
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 14:21:31 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53b7287c-67d0-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 16:21:30 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b5e6bfb427so3626098f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 07:21:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e51a3db1dsm1810859a91.45.2025.07.23.07.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 07:21:29 -0700 (PDT)
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
X-Inumbo-ID: 53b7287c-67d0-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753280490; x=1753885290; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fsMsa4HAciSyKykbPrbaXhSlYuXtu3gP6rJTVOOQKOs=;
        b=CUHMpmmZV3cTkltqTMa7HzuwE3jptcWIWkLJRxZlbfnlZ67ak+CsftBDfP0dtIBYcl
         n1c9fKafx3/YbjTwYC9+Op0jB0oKx7uTLfZD5BrkQPMxmElL2j2aOCpfN6Onc1mDWynM
         bxji2gAAWY9kIW5olzU0G31Jl6qWrf9MeIyYJvcUuhXB7/3QAdZZTgD/EhPwYPowlUpO
         HDEVxAxHW1Ge1Mf+4nupIrkk8x5jPRv6oMTswjf8Ip5z6U2fC5n41vSbjgjjIfbs79Ey
         hHomRKY1+dweXB/bSUXd/SKyJcL+x6KnJi3tO8h0ycR45Tw26kzHcgCEd67fJUZ3jSzF
         ejlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753280490; x=1753885290;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsMsa4HAciSyKykbPrbaXhSlYuXtu3gP6rJTVOOQKOs=;
        b=UyJyndN7r75bQ9KBHnifTu7siTJK1IMSbfezkGdM63BYAbToaHBJF6ChmxUt4uTLwV
         SYHOmh5LxZRbkZTKtP29rdYtdx2ocCpaHONFZdnu+DY9zB/tzW9pLDyAxD3CfnoZ/ksW
         3ZWgkjkzwbtDY4/sq7JqDLPR+Cw0WHMfzNG7xvDwU9Cm3oeQ5F2wEeVuqNHI94QevbFj
         lW0E8YRZ7OZrCRmcW4fs87nzUHJaUwbySL6FRwYX8kD9hEj0Q0II5eitneVgxBJ1zXDM
         E7L1z5y1CTQIXUrOTnpqCA1e5jB+0/krbHpDT37LFvhaVeEhSZWqJ2jX4pFKYbRIdlFU
         IjeA==
X-Forwarded-Encrypted: i=1; AJvYcCX+pKEKHyx751t5Fcjdj1DZF8Hlqd9F/2wkSTV3fR1OzHJGqiHUXN+ChjODPSWdVgAIiIUlta2ESMg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwIoZcuhhbdZpz1BeIuPJT4b+jRqDlJi6YYMcpHe3/fGyshDh7Q
	DTOA9R/Nj+/lIJXEC/GlmNi3ORxdaCV/ReqNnSM11neQKpZ2zRJBdHe57iZkI5Qeqg==
X-Gm-Gg: ASbGnctAjl5Y1NXxvy1pm7N5vQxVq+aLcFCqzWx+C27dNbAAn01OGi4DhpNGQNN5Xrt
	B/Ep75s6Twv7pemL2iK+NqBFa4QDNDLJAwrL+kK5HIfyNn8R4k0BBj0P+x3EHZQkYizyTJvt+Ze
	9yKLa+b6bMOYVMkdD88yBjvjw6lXxsoRQDqnxMavxTTr+vSStzaf181HD3u9/EI++BoraAl8vwk
	k2oMSYhvpbUlTcunUB/9Qx8IqqYaNeDu4BsJGJjV43BliXRYa/HN0SrUDZefxtNcVCIvK+1nYp3
	Y0f1I/excTZHN1YlOqrWvorUQMVnNRRlSY8ikUvFSnhe2myloW5jmG8iKuI/DdTJQfTK6eYi4Dn
	rcHtJI0rCzZSNQOMvnudtEDKeW4E7dV3DwbGlxO9nNaOByarPr+SSd4mrJQRkMyEYIS7yIHnc+7
	2jc5UASK0=
X-Google-Smtp-Source: AGHT+IGlWjHHR32uZ+QbFwompZRqHN8khyoNQTk1deuTk/SSgRrYaZf3AmzFVP5BP5HRX/3AEALCsQ==
X-Received: by 2002:a5d:584a:0:b0:3b5:def6:4b2 with SMTP id ffacd0b85a97d-3b768f23098mr2748839f8f.45.1753280489891;
        Wed, 23 Jul 2025 07:21:29 -0700 (PDT)
Message-ID: <1f0e94a1-09eb-470f-9eea-af3d4d310cde@suse.com>
Date: Wed, 23 Jul 2025 16:21:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: fix xen.efi boot crash from some bootloaders
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yann Sionneau <yann.sionneau@vates.tech>, xen-devel@lists.xenproject.org
References: <20250723135620.1327914-1-yann.sionneau@vates.tech>
 <fb0cc1f6-bbc0-4413-998a-6fa55192f73a@citrix.com>
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
In-Reply-To: <fb0cc1f6-bbc0-4413-998a-6fa55192f73a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.07.2025 16:13, Andrew Cooper wrote:
> On 23/07/2025 2:56 pm, Yann Sionneau wrote:
>> xen.efi PE does not boot when loaded from shim or some patched
>> downstream grub2.
>>
>> What happens is the bootloader would honour the MEM_DISCARDABLE
>> flag of the .reloc section meaning it would not load its content
>> into memory.
>>
>> But Xen is parsing the .reloc section content twice at boot:
>> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/common/efi/boot.c#L1362
>> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/arch/x86/efi/efi-boot.h#L237
>>
>> Therefore it would crash with the following message:
>> "Unsupported relocation type" as reported there:
>>
>> * https://github.com/QubesOS/qubes-issues/issues/8206#issuecomment-2619048838
>> * https://lore.kernel.org/xen-devel/7e039262-1f54-46e1-8f70-ac3f03607d5a@suse.com/T/#me122b9e6c27cd98db917da2c9f67e74a2c6ad7a5
>>
>> This commit adds a small C host tool named keeprelocs
>> that is called after xen.efi is produced by the build system
>> in order to remove this bit from its .reloc section header.
>>
>> Signed-off-by: Yann Sionneau <yann.sionneau@vates.tech>
>> ---
>>  xen/Makefile           |   5 +-
>>  xen/arch/x86/Makefile  |   1 +
>>  xen/tools/Makefile     |   3 ++
>>  xen/tools/keeprelocs.c | 119 +++++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 127 insertions(+), 1 deletion(-)
>>  create mode 100644 xen/tools/keeprelocs.c
> 
> I'm sick and tired of the hoops we have to jump through for broken
> tooling.  This is now rewriting the PE+ metadata because apparently the
> linker can't do it correctly.

The linker is doing it correctly. It is us (and very likely just us) who
have special needs here.

> Either fix the linker (or the way we drive it/etc), or we're doing away
> with PE+ emulation entirely and writing the MZ/PE headers by hand like
> literally every other kernel does.

"Fixing" the linker was suggested, but with my binutils maintainer hat on
I'm inclined to not accept a Xen-only option into the linker.

Jan


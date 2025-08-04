Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C13CB19ED1
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 11:35:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068990.1432839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiraW-00010p-83; Mon, 04 Aug 2025 09:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068990.1432839; Mon, 04 Aug 2025 09:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiraW-0000z7-4u; Mon, 04 Aug 2025 09:34:36 +0000
Received: by outflank-mailman (input) for mailman id 1068990;
 Mon, 04 Aug 2025 09:34:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uiraV-0000ys-2r
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 09:34:35 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39bcbdc3-7116-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 11:34:32 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-af925cbd73aso670545366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 02:34:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3792sm701998966b.50.2025.08.04.02.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 02:34:31 -0700 (PDT)
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
X-Inumbo-ID: 39bcbdc3-7116-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754300071; x=1754904871; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+GE+zGTv9O+mdDD0ctcHl8vIDE2iHIW9l++of6DZ9A8=;
        b=CCv/UqX4vPQR4LOcU/hHp8a5HfZYzRXC3h3d647KkuFrkOXuCrGx7I/k+ad8r/AIV4
         kGJ1B3feUXCbaI9kmdA3xufG3IIutOtCQ+Udk0j6xQj8Z72kZrOmOtKibtRmU86lkFpP
         dZNlGGYO+sC2CUR1cXEz6Rk7lkBz9rj7vfe0o8mOi+evC27VrLRIz8e/1n0y+unHjVjx
         6uWZzGUHGesoPvekgM6KVwEnWKcL4kfHz+4Nx1kRfCUQR1z/TAQJzUs44rTbbJ9keDVO
         ss0StQ4LlgZ3LvH5Cx2+Lw+FLbYabusGS/5TurbZbwrgioPaJHX3Hl7/rXfwXGcbhORG
         kKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754300071; x=1754904871;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GE+zGTv9O+mdDD0ctcHl8vIDE2iHIW9l++of6DZ9A8=;
        b=v9Wf24Of1ZKn7mIlRqonn87VIvs1O9hz4OGWweFtk2dPtbnaxiU9+AB2gSEdkdLK3D
         B0cY6JduxW2Ao+JnUVHRebG9rWURRZbrTqKcXmszagCroWtwMn3pD++7JZV7jm14ErG6
         WFzvqwens0dkgfKE81nmwW9YLon8qPaxKTNm6AK5sbQJ3GCLyimyZHfZ8aAtAZQgkRPL
         vStlycIIv2KRevkHH1xEhyWQSImP+gy6CbHD8D84KR4zuR6ep/Rztb0gglgUwqjizyK7
         xXAXnsexkZe38aqu+YlUkPRivpkBe9WLJN9mUFqbI8Z60xG8QOQPO+FnivBLM+R7rPY1
         QgPg==
X-Forwarded-Encrypted: i=1; AJvYcCUTbSLX/rbHfHRnY8q+nW6yVxKhpQcDB2zNI0X2V0EUcMjRJxMvmJaFUp+siTHx5nTtFQcNMZRwCBE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrDgYDj5Vznuswi00uBwFK4mJY5FGEppjftwpIi7niruYPoFfP
	16WMn1Bf1r886MHsTCMrO8HWUM7Rx+b98kkmPxZi4xH9+W7f+g7Okt++agkoJ9A4kg==
X-Gm-Gg: ASbGncvu8JF/rsMkdzdUfqiJG1DgCJj7wDSdA7ea0BB3QCmKS+2X2bNpbz9x/SGJjux
	YUQluaWcvPB63Ojlpda5HE5OWIqSFpBgqT/h0euAPwNrm0RkUBSh1prJI0nbO/WUV1a9JuUmUo9
	d/62Xk+mizAWDHVQ5a3H4Ej2KjpmcJiSSkRAm1EPoG97RZPCAoR7Eu2L0DpmHMmRrrlycvGAX14
	tJxZsqFvey/sfYUVpJ+NPlWo94E68RyTWY6Q7HZjuqAXUHKRpGpHrpGZz6TlnuFZcsTQpt0OvW9
	FZY58opPIiAwjpbdmxgDwfqR0e1DdGGpMB2mibRGiCRr8HRf52/IZzBkCxc+GUahoQHXo97NOyA
	ezl214o7+59S4r8hAZ4kSJYfRc7IbKluh69h4IBdjfrHse6N2DxzOJEW2BO5TtxPLpWi/ZdN6rO
	g1x4ovZ30=
X-Google-Smtp-Source: AGHT+IGRyfG0jEfscZ9nBBlqUPrcyGWQmWyVvnvNBVsoWBj/UsO5ktFFMlA9OZ5rrPYuZt2jnOd+lg==
X-Received: by 2002:a17:906:c10b:b0:af9:3d0a:f37d with SMTP id a640c23a62f3a-af9401679d4mr931111666b.37.1754300071508;
        Mon, 04 Aug 2025 02:34:31 -0700 (PDT)
Message-ID: <4ceb64fa-d7cb-4c77-8a60-1526046c037c@suse.com>
Date: Mon, 4 Aug 2025 11:34:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/x86: fix xen.efi boot crash from some bootloaders
To: Yann Sionneau <yann.sionneau@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250724140731.1502774-1-yann.sionneau@vates.tech>
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
In-Reply-To: <20250724140731.1502774-1-yann.sionneau@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2025 16:07, Yann Sionneau wrote:
> xen.efi PE does not boot when loaded from shim or some patched
> downstream grub2.
> 
> What happens is the bootloader would honour the MEM_DISCARDABLE
> flag of the .reloc section meaning it would not load its content
> into memory.
> 
> But Xen is parsing the .reloc section content twice at boot:
> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/common/efi/boot.c#L1362
> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/arch/x86/efi/efi-boot.h#L237
> 
> Therefore it would crash with the following message:
> "Unsupported relocation type" as reported there:
> 
> * https://github.com/QubesOS/qubes-issues/issues/8206#issuecomment-2619048838
> * https://lore.kernel.org/xen-devel/7e039262-1f54-46e1-8f70-ac3f03607d5a@suse.com/T/#me122b9e6c27cd98db917da2c9f67e74a2c6ad7a5
> 
> This commit adds a small C host tool named keeprelocs
> that is called after xen.efi is produced by the build system
> in order to remove this bit from its .reloc section header.
> 
> Signed-off-by: Yann Sionneau <yann.sionneau@vates.tech>

So I found a way to deal with this at the linker side, without any new command
line options. Behavior is solely driven by the attributes of any incoming .reloc
sections (of which there would be none by default, retaining original behavior).
The important patch is [1], but at least the first patch of the series [2] would
in most cases also be wanted/needed (patch 04 is obviously a mechanical prereq
for the main patch). Need for other of the prereqs there depends on the scope
and purpose of one's binutils build(s).

Jan

[1] https://sourceware.org/pipermail/binutils/2025-August/143153.html
[2] https://sourceware.org/pipermail/binutils/2025-August/143141.html


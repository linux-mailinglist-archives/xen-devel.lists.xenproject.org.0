Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8665871688
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 08:16:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688604.1072983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhP1i-0000xE-IM; Tue, 05 Mar 2024 07:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688604.1072983; Tue, 05 Mar 2024 07:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhP1i-0000uo-FG; Tue, 05 Mar 2024 07:15:50 +0000
Received: by outflank-mailman (input) for mailman id 688604;
 Tue, 05 Mar 2024 07:15:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mek3=KL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhP1h-0000ui-9U
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 07:15:49 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3040cefe-dac0-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 08:15:47 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a450615d1c4so383120466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 23:15:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x23-20020a170906135700b00a3e4c47bad1sm5681042ejb.8.2024.03.04.23.15.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 23:15:46 -0800 (PST)
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
X-Inumbo-ID: 3040cefe-dac0-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709622947; x=1710227747; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UrOIQqrlLnse7tBZRX2qhEt+nOD1UM1Foj/eyt7sbUc=;
        b=OlMa+VN2D5KMtvGeNsx+QJPS7QIPbCJs81+aOM9Cm8F9s11FJS1AOO0XxgbQ+ViVvO
         NijXkB6K9psiBBXH6HIlVkD9M2c9vox/DtxOJg+P5x1HtBUd2pHLZkc2mkur+x9JF/MK
         5z1QeKxYi+vH8/SWGn+FYiqh2MnDa1GOwKNxZ/yC9jt7YchEFsOENDpZflSYSer4ZG5J
         uUrk8UoBXCIV9fsnkKncuQo5qpxfTWMAdMEkvSvHwN/ByqBPjr9CPYcYPduVrZysnRLz
         zzXcfsA+dvGMEN8dJZdATlusG3jA75UTRjHcTq3yImQAXM034K53/s/DCZuVJFd1dU28
         YKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709622947; x=1710227747;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UrOIQqrlLnse7tBZRX2qhEt+nOD1UM1Foj/eyt7sbUc=;
        b=eyZWs0SxPpRCDliNo01202x1Kwtwm6qcqlpAMYKrIdPGm5KzrAXmmC9rPgbTRmAySE
         BqvWiANxMMbzXAAGjze1le0fhjYTRSs0qD5+z66lDlZ8njBwzJJhgv27bG/5kyvF0mBh
         EcZtcUCt/XKKBghZsQrCocXVxea1yKVaq3BwyR+LI3rISyhhkhZFUq9b6rKv+aRw2dTm
         LU7AzsOtkhKiv6kzDw+Y7ay/87A96Q1GpQ5gumlS27JKf/E920knKK8Y81Ot2QchiY3C
         YYo/LBA8ZWrm3meVOUlZKN5oCDmxP8xm/Y/nbrV37/G22ukBO5xYAsvRR3msclsKqEti
         j+Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWwvaE2i81YADUAs6aI+0DsPY9RIQLXhmzLOd5R+nP/CWIRiFLAeRX60SN3+ACGiKV7dDOnJwgEBI20AOQmSnXLF16NAKadtWcYCnLijSY=
X-Gm-Message-State: AOJu0YyQir7p2iDjMiJPWZ6MHQKfaVclC6VBYbhsfaEElr8TxBJuVuMd
	jOoRRmvtDbJUHnZxnjHDtLoKvHoz4MmtiA3eSVJOAl9jhMWJM/Sm/1fF0tihkg==
X-Google-Smtp-Source: AGHT+IGyRoTrXJSoEbCIRT/b8sMy5rgR/gsp2T9aaZ93KKvx0x956GDLkJ/l3B8U8Nu8874gzSv+3w==
X-Received: by 2002:a17:906:7fd8:b0:a45:297d:52b9 with SMTP id r24-20020a1709067fd800b00a45297d52b9mr1758865ejs.26.1709622946935;
        Mon, 04 Mar 2024 23:15:46 -0800 (PST)
Message-ID: <620ac7e0-b6ce-4ea4-be0e-ec97984eebec@suse.com>
Date: Tue, 5 Mar 2024 08:15:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/*/nospec: Provide common versions of
 evaluate_nospec/block_speculation
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240304161041.3465897-1-andrew.cooper3@citrix.com>
 <20240304161041.3465897-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240304161041.3465897-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.03.2024 17:10, Andrew Cooper wrote:
> It is daft to require all architectures to provide empty implementations of
> this functionality.
> 
> Provide evaluate_nospec() and block_speculation() unconditionally in
> xen/nospec.h with architectures able to opt in by providing suitable arch
> variants.
> 
> Rename x86's implementation to the arch_*() variants.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Upon further thinking and with Julien's recent reply in mind:
Acked-by: Jan Beulich <jbeulich@suse.com>

Still I'd prefer if the arch_* were left out. They look to me to go this
half step too far (despite now having looked at patch 2 as well; I'll
reply there separately). And it is this which was why I decided that
going the other half step (moving these handful lines of code) wasn't
really worth it, when considering whether to make such a patch myself.

Jan


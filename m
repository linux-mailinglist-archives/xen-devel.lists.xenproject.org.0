Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 661B487230E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 16:44:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688850.1073520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhWxD-0000Tv-VH; Tue, 05 Mar 2024 15:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688850.1073520; Tue, 05 Mar 2024 15:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhWxD-0000S6-S8; Tue, 05 Mar 2024 15:43:43 +0000
Received: by outflank-mailman (input) for mailman id 688850;
 Tue, 05 Mar 2024 15:43:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mek3=KL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhWxC-0000Rw-SF
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 15:43:42 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23ce3a77-db07-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 16:43:40 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-512bc0e8ce1so5925065e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 07:43:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ef11-20020a17090697cb00b00a44bc99cd89sm4468776ejb.42.2024.03.05.07.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 07:43:39 -0800 (PST)
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
X-Inumbo-ID: 23ce3a77-db07-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709653420; x=1710258220; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c2R+5X1nNtdhwGjUXAHlzPD1ubux/g3yfQA9c9bszBI=;
        b=GufEDD4qlUmfT/TVXLnzV82bPmHIkyKbwUlaL/9aKZftYgZGdvdOaQ2FPWK8PUsD3u
         dQkt1I7LQ5/9BZ6g7OdG/XZpH2uZCvscaYCjPv9x0iqg0ytqu6K3nWHg9OLFXvltSzyg
         Ak1dr+VQKwMJSTrj9O0FZhYW+L5CKceDY3USvvtW1uVNysaB79qEMRVADDQisOc4Ug5C
         QQ0+wMM8XYWIKrYH5X0LOgMHGiTJR3NrQNJRMZlHgrkUXKpdGJdtxuzDqRnt3B4RtL/K
         QwoPdaDTeiyeCCXqZt4KBrkgYgSYZKIYn6Y2oycITGhPdG+3ELAY0ogPPppflZuC7876
         CdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709653420; x=1710258220;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c2R+5X1nNtdhwGjUXAHlzPD1ubux/g3yfQA9c9bszBI=;
        b=HUqZk/F9OdG0QgY4X4jHhLYQskuNz88hd1hQltUuxb6UDmXy5yXjQaqhCQYHUocvKG
         ikEZcG5Teoq9mZaR20CpLHgXkQ5INRXVKx8fs4IVrBopbzYh1/+gXpl39mMfYAkowjHe
         WxIFlijyCg/NUx5M91FK/MJetRf+AODhfsZVcylefmahDUHUgVZbk7YRrXZkenamvYpv
         SFkFBy51WiaHERatFafAa2RxKK7s/OPofqGKXDiKktZqyqrCRQ3AEHztb4z+4ZLD3YKs
         J0NlDWhHpTt0S8IfRLcnwJk0WA66F+esaDyaVn/Zwn7mjJGeFkQ179ZgJDSBQ8cLOUAZ
         Y8FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvXm+TdxdtXRDJ/pEl5DShW0TLqP0lQr2YHjLCIebdiUcgAJ4p6v68QaMcgMSv3FSEHNhM88wS7tftgPmTOPndVmAcQA9nLkz/wOChW/U=
X-Gm-Message-State: AOJu0Yw7fMGykmvEzUrsUQgXpeNwWkHHVjxE4v5TOMvFdzvAqKbUFJLU
	Y+Nmu/v/DFYyl++cUCxuSRXhnEPQmX/QHGzFP2DLp4xUh2USJZlMqqLGSiFJEA==
X-Google-Smtp-Source: AGHT+IG7ni1+CrQYF7+X6UI7i6/Z5vxaz6KvxEDt3f/XqRH8IwWOn3AmnNsb4z1A9cz5ALgwXcLG0w==
X-Received: by 2002:a05:6512:358c:b0:513:3e94:7ca3 with SMTP id m12-20020a056512358c00b005133e947ca3mr1504465lfr.48.1709653420231;
        Tue, 05 Mar 2024 07:43:40 -0800 (PST)
Message-ID: <3d585715-7729-4a5a-b4e4-c0eb96601882@suse.com>
Date: Tue, 5 Mar 2024 16:43:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/*/nospec: Provide common versions of
 evaluate_nospec/block_speculation
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
References: <20240304161041.3465897-1-andrew.cooper3@citrix.com>
 <20240304161041.3465897-2-andrew.cooper3@citrix.com>
 <c9f92495-2c00-443f-bffd-1b09cb8a8c84@xen.org>
 <d343c58c-2a3a-45a9-8d67-64d1506d973c@suse.com>
 <5c06c437-b62c-4bee-8694-1be597887718@xen.org>
 <141ed8a2-df4f-492c-a192-4ffa7f4c8384@suse.com>
 <4fb729fa-8519-4244-a795-cc66a79cd346@citrix.com>
 <c6f9c9fa-a252-41c4-b92f-435c57044cd2@xen.org>
 <3bc0b828-d3c5-447d-b338-c478d8e337fc@citrix.com>
 <7df33568918536487ec75a05cd47cee128150c0c.camel@gmail.com>
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
In-Reply-To: <7df33568918536487ec75a05cd47cee128150c0c.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.03.2024 16:15, Oleksii wrote:
> I agree that upon examining the current state of the code around these
> functions, it appears safe to provide stubs. However, the reason my
> patch was rejected is that it may not be entirely safe, as Julien
> pointed out that even with Arm, some functions shouldn't be empty.
> 
> What I would like to propose is that it might be beneficial, at least
> in CONFIG_DEBUG=y, to have a warning message. Does that make sense?

A warning message to what effect? And are you thinking of a build-time
warning, or a runtime one? Plus wouldn't different aspects quickly lead
to proliferation of warnings?

Jan


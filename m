Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBE186C8A5
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 12:56:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686960.1069608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rff1R-0003vj-3B; Thu, 29 Feb 2024 11:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686960.1069608; Thu, 29 Feb 2024 11:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rff1R-0003tO-03; Thu, 29 Feb 2024 11:56:21 +0000
Received: by outflank-mailman (input) for mailman id 686960;
 Thu, 29 Feb 2024 11:56:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rff1O-0003tD-Td
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 11:56:18 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bd33da1-d6f9-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 12:56:17 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a3122b70439so147499966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 03:56:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j12-20020a170906094c00b00a3e5adf11c7sm609513ejd.157.2024.02.29.03.56.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 03:56:17 -0800 (PST)
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
X-Inumbo-ID: 8bd33da1-d6f9-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709207777; x=1709812577; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KKTlU9l00RReVLNiskghv+Ya2Ums+IDx8IJVD/f+928=;
        b=TqjDNyE/OvOLzEdmUSKZj5Hpiv5W0Nx8/530DPr4Fy7lgzqBGR8ocRmKd+Qu6RepRa
         YkG0nml4bcGwFgl59Kc9Jcl2orUbvAzGAYll8IGPH+0pEfHUlaHmT8e/MrReolLl+G0x
         gZpjySW/ZNvAy/ySbeezvCPbpZpUCZROJ0g3dXERuRBKQhs7v0qlg5ZlPc57xiPbVBVU
         6QhET0YXw8Tmmfl3S3vUUqHSb1lLc0do8AU1AXKN40MXjlTvyAPVPryQ9/TwLqTBEupw
         N4UisxJZTAVV4fsOoJLXfEXtJDs1/Xsi+3ANoPSeXrgu0bku5t03Yqal6gvDCDJWnhZm
         tCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709207777; x=1709812577;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KKTlU9l00RReVLNiskghv+Ya2Ums+IDx8IJVD/f+928=;
        b=d9ylIjgQ7SaHTLQlpdbOXm9Hqz64VGRn2YKUmq8pVqIsAOZ4zm/BEYL45K/2pCju2i
         ZT8uWM7coXXoWlR/FpqnIOAgSgePLkF5zdrBRdJAtgVOO9Li70vVIEhDdoqdJgnpzPcu
         8jBhWamy0f5keRd06qU8JWAslzAJjhkqhM2o+BUvAx/OxJexnHzFiSHw35PdWNZ0PmTx
         lzBJcWknYGGcPUdn1JmmdnmSadN0CWyQg4VTYyYt2pQi5cxdzWV7+yBtaYP//S32xvkO
         FajLAM/oJBBQe2p25TQCQ39aQjqKyHVIpEk+3RtY7vufRC+ju1Zgn4VuHDHJ7y2EQbMw
         nNkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWey0ATX4NU4shoIc1pRq6Mh++Z4e1zAiRlkXU8OHvHWEqXIrHj4TIYrVhkrme71ebfeDMXCCTd2RTdHCOP15NrLXVvY4uSwXTLvvCWFp8=
X-Gm-Message-State: AOJu0Yx7WDgmkJPeucjuruRA/yJM11UF61vbRS4UXYjbxkAP53p5p/st
	wd8MaM1CcPyYbzJUdEaPA99tE0WKY0CgfPOkLqCIgt90cVwW+Da/HP4Pkg9Ujw==
X-Google-Smtp-Source: AGHT+IFOlm8N5jbpiJOBoY38ro1ICF4a6Ffl6wdTjvhU+ee0WYi+g8SBg7eEaoO9/38EN8k5W6bFLw==
X-Received: by 2002:a17:907:20d5:b0:a44:752:ad4e with SMTP id qq21-20020a17090720d500b00a440752ad4emr1265641ejb.75.1709207777262;
        Thu, 29 Feb 2024 03:56:17 -0800 (PST)
Message-ID: <751bc87b-c8a4-4905-92bf-fc50f9102d4a@suse.com>
Date: Thu, 29 Feb 2024 12:56:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/23] xen/README: add compiler and binutils versions
 for RISC-V64
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <ebaa05ded3cfddb1e3f7c87cd806b866312878fb.1708962629.git.oleksii.kurochko@gmail.com>
 <73a38d85-0798-4cfa-8625-0f8c9e05b2a3@suse.com>
 <80fb8091-9a26-40a4-b2e7-371df9411861@xen.org>
 <889b132b-b92e-465b-94af-4e4133e4c297@suse.com>
 <52188e88-374c-449f-a71c-bfce9b6d07f4@xen.org>
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
In-Reply-To: <52188e88-374c-449f-a71c-bfce9b6d07f4@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.02.2024 11:23, Julien Grall wrote:
> On 29/02/2024 07:58, Jan Beulich wrote:
>> Therefore being too
>> eager there would mean I can't really / easily (smoke) test Xen
>> anymore on ancient hardware every once in a while. When afaict we do
>> too little of such testing already anyway, despite not having any
>> lower bound on hardware that formally we support running Xen on.
> 
> Can you provide more details of what you mean by "ancient"?

Formally we support running Xen on any x86 hardware supporting 64-bit
mode. I don't think I have any 1st gen systems left, but I think a
2nd gen SVM and a 2nd gen VMX one is what I still have around.

>> (And
>> no, upgrading the ancient distros on that ancient hardware is not an
>> option for me.)
> 
> May I ask why? Is it because newer distros don't support your HW?

Because as part of my job I also need to support ancient versions of
Xen on ancient distros. Since I need to keep those around, it makes
sense to me to then also test modern Xen there (every now and then, as
said, and not really extensively).

Jan


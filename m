Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CA0AE3728
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 09:42:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022087.1397804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTboP-0004b5-7S; Mon, 23 Jun 2025 07:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022087.1397804; Mon, 23 Jun 2025 07:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTboP-0004Zd-3Q; Mon, 23 Jun 2025 07:41:53 +0000
Received: by outflank-mailman (input) for mailman id 1022087;
 Mon, 23 Jun 2025 07:41:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTboN-0004ZV-Ku
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 07:41:51 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85961fc6-5005-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 09:41:49 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so1959365f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 00:41:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d83ce31asm75397495ad.63.2025.06.23.00.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 00:41:48 -0700 (PDT)
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
X-Inumbo-ID: 85961fc6-5005-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750664509; x=1751269309; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XMdWL9Tv7PcuHNqz3JjNNm8rkUET8PY00BOKBsqoT8k=;
        b=fVCstzFEemoCwyF79byaUTsr5pBcgxc1ugtSLrovrFC65Tq2bWFaYLPiMG3rhB+jaH
         07O4C5mC8PxmELVSfkkMxaZ7TlId5ifkltTiP0T8NHCLBlhnBUud3Y19teViDSAuH143
         qTgwwoMsaWZ/R3NCjMQ7HQztiwaTEuQddsgj9fIl8obtbEdAYaoJH3cIyhCTjFnshvJx
         Cp422t8CaYOb2IZAGRq9qLuvf/BM1TLZbljx0D1XxRcRevjxA3xw1NjvsRqs/YFr7yj2
         Yq56hfSL/U3IQ2Q9F86X2QA0ZATeER9KRWhggeDUR/jLJoS/piXz8IIFmgFTgehGrhcs
         f2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750664509; x=1751269309;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XMdWL9Tv7PcuHNqz3JjNNm8rkUET8PY00BOKBsqoT8k=;
        b=OJ86rjwvJLsm7UD2Js4dOt8z8Q5C8A1Kh7vjhW/23TN1z1jGX9nLqI/nw+ChNzuYsI
         3K8NeVEqX2mb1O4yEmOquhjNgTlj2K0Y+VM3AA0geDTiSeoJRHKpK9RIFm8QO8jdWetR
         tUDiEgBrihjGhdugCHv4vkmX+GbvjqCBEmfL0E7zulCjxxVedm7F9gKs3ppfi8YuZM/w
         uTPdlxpT5EUEId13GC3HO/ytOpUtakl7FzYv9kQX0L8BIuDLiypbbEArbgC8C5WnBpga
         wPMvU3XGa9jPTVlP5oicPnIyPDWB/nCR2mJYHyLVixA25Pe+AIn0QRc5uPwC9CBW+7Cb
         suEw==
X-Forwarded-Encrypted: i=1; AJvYcCUaFq5qVSn1nDLKmPWVFR35oBNZpoMg4qP8jXAKPH3SM/OKQcEKIoR6eDTCGFL0WNY5rhmE3t4AJME=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1SEI9Egl6bOe+8LghGGcRReXSOa4nkOLbraqBXwhp04GLVBly
	Y2fudBrp6zvjFUnc3QwsbLnJJ00s+MOsUZlM4/+x5uP0x9xgRmb6NSBmzhudi9oB7Q==
X-Gm-Gg: ASbGncu0ufU4DQlfOa1h2K8AtUhLW4Wpx8ShXJqsD7M/GYqT4409c3sMt/09B5/DUSV
	FH4rPN5ACJILSZ/SsYy6aSTtoVckbUJD9oQtTbP+Kqr8h1XOqxtwt82DrUC5WC2gisjpnF8ueSq
	nxJPxb9BzLMwP8cmakJK0yaL0099aEKzq6+tKeekF4NUPLFEmy860X+rj1LygjjVmSfzAE7j6Pu
	qiZUTY+5CSSVnHh4rmb3qTDkRBbtt+a8rjknzm6LKIvGbBzSwu7bvfMiloo6SLsoSk5dOCbhxvq
	Db7T0DRLKZ1JgpGieEoVpPlfzL8zzivgfzHi45udmPeW1cXLABEI1uxdH2vAh3AyetnguY1OBkJ
	RQN/AcaaXwkyclTp5YKf94Jv9C0xOO78agB92BfxhE9uPPDA=
X-Google-Smtp-Source: AGHT+IHKDFHSBai0nQOILkTNK0wT8hZPlceFu4La8gFOdigynT63tBXGi3leavrt1tZMikW6RjBHPg==
X-Received: by 2002:a05:6000:2890:b0:3a4:d4e5:498a with SMTP id ffacd0b85a97d-3a6d130d49cmr9387770f8f.42.1750664509017;
        Mon, 23 Jun 2025 00:41:49 -0700 (PDT)
Message-ID: <9c3803ff-0ae4-40fd-8bc5-aa4bab4d5264@suse.com>
Date: Mon, 23 Jun 2025 09:41:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] xen: Rename CONFIG_HAS_DEVICE_TREE to
 CONFIG_HAS_DEVICE_TREE_DISCOVERY
From: Jan Beulich <jbeulich@suse.com>
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250620182859.23378-1-agarciav@amd.com>
 <20250620182859.23378-11-agarciav@amd.com>
 <490ee7bf-cb10-43e3-9416-9a68e7529b96@suse.com>
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
In-Reply-To: <490ee7bf-cb10-43e3-9416-9a68e7529b96@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.06.2025 09:39, Jan Beulich wrote:
> On 20.06.2025 20:28, Alejandro Vallejo wrote:
>> Moving forward the idea is for there to be:
>>   1. Basic DT support: used by dom0less/hyperlaunch.
>>   2. Full DT support: used for device discovery and HW setup.
>>
>> Rename HAS_DEVICE_TREE to HAS_DEVICE_TREE_DISCOVERY to describe (2), while
>> DOM0LESS_BOOT is left to describe (1).
> 
> Considering hyperlaunch this feels wrong to me. Did you consider splitting
> HAS_DEVICE_TREE into HAS_DEVICE_TREE_PARSE and HAS_DEVICE_TREE_DISCOVERY,
> as I suggested on the committers call? You weren't there, but Stefano said
> he was taking notes.

Oh, ftaod: I wouldn't insist on the _PARSING suffix. Having HAS_DEVICE_TREE
and HAS_DEVICE_TREE_DISCOVERY (with the latter selecting the former) would
be equally fine with me.

Jan


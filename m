Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1B88173CB
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 15:38:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656058.1023987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEkb-0000xK-LW; Mon, 18 Dec 2023 14:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656058.1023987; Mon, 18 Dec 2023 14:37:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEkb-0000uW-I0; Mon, 18 Dec 2023 14:37:45 +0000
Received: by outflank-mailman (input) for mailman id 656058;
 Mon, 18 Dec 2023 14:37:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFEka-0000uQ-1r
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 14:37:44 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffddea13-9db2-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 15:37:41 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c3fe6c08fso36104855e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 06:37:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c17-20020a05600c0a5100b0040b4fca8620sm45283539wmq.37.2023.12.18.06.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 06:37:41 -0800 (PST)
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
X-Inumbo-ID: ffddea13-9db2-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702910261; x=1703515061; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6BOCyboTJUyTx5eGqSPVb5AwGu5hDn9koJAC1IHPpVo=;
        b=IfRi+XxNhg/Pxl1vuQCGXyA/HYKRwkdOdHG5Yk+uAepoBKUwyyOaUuH7ZPJdXqGC9I
         xYfof/u/xLwAWBJ2wKSw84fUWrXxOcO3M+GYOddmHe6vdwti8lHWa1HKudoKqwgAxEs7
         uMyrYyyrsU44bSL9s8sXwEWfwE+75ZPiD9QDJ/j9U0m/ACz6O2oDA+nD20imrsHEqZbu
         l87p6uVunI2y6qXdxBBa3VzuZ8K/IZSVIpSeuDfdMLm5aKioPIyMS1twYIK3xi7g8TEm
         k7zABlB8EY70IcCaTQ9cvC+2S/PBcLbN/gtRoxZMSRRHHFKAWuFTA1nZdy2XYodt/+g0
         eKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702910261; x=1703515061;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6BOCyboTJUyTx5eGqSPVb5AwGu5hDn9koJAC1IHPpVo=;
        b=EQb4Zltey5P0OQ4merudjK8lf1xlamfewwhS1M6pWk1gmj9ASBjRrkaKY3jIR27N29
         swLbGm2uFveIrdxkD5ncNNr7enxDrEnqBbfuKT10qSHtXu3ck7WgGZg/etw9mIBJ3DV/
         v0xb1AW5iyZadVVegER+BqVzaAnprHjtgvaVlxd8bTNZtneqf2US8zsG53IAfzDa+G/V
         rURrZiN3INZRQ2i04VHrtlQ+51qSY1b6RdWEm4nSmVcM0otDB+w7Gb2Z4wLEF0aNBmdN
         6Fuiuxvao678hr4HY5/06CU/jVl4dwoFyvnmEaFZHeUNOdDyF3ya1SySumPsixln+bP2
         PdNA==
X-Gm-Message-State: AOJu0Yxjq571UZpcn/ubjwKbmmKE9r949hRS/0BI+abdnoaP5yaogU3j
	xoBU15fDOaHALcZNy7q7eQIjEczaO2OTqAcAbefA
X-Google-Smtp-Source: AGHT+IE2bImCpdhhJ3RQKbpIM51mgYn8gCvOo+FBg8/GDb1cIvMC6IX5LMsOUWKhLIeQQsZdLJTHHw==
X-Received: by 2002:a7b:c44b:0:b0:40b:5f5b:758a with SMTP id l11-20020a7bc44b000000b0040b5f5b758amr5453781wmi.145.1702910261314;
        Mon, 18 Dec 2023 06:37:41 -0800 (PST)
Message-ID: <1e855575-8c0f-4222-80ba-e64305ea714b@suse.com>
Date: Mon, 18 Dec 2023 15:37:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 0/5] x86/HVM: load state checking
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

With the request to convert bounding to actual refusal, and then
doing so in new hooks, the two previously separate patches now need
to be in a series, with infrastructure work done first. Clearly the
checking in other load handlers could (and likely wants to be) moved
to separate check handlers as well - one example of doing so is
added anew in v4, the rest will want doing down the road.

1: HVM: split restore state checking from state loading
2: HVM: adjust save/restore hook registration for optional check handler
3: vPIT: check values loaded from state save record
4: vPIC: check values loaded from state save record
5: vIRQ: split PCI link load state checking from actual loading

Jan


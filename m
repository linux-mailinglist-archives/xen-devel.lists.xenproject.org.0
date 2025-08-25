Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB9AB33A40
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 11:13:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092779.1448411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqTFo-0000Cx-A3; Mon, 25 Aug 2025 09:12:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092779.1448411; Mon, 25 Aug 2025 09:12:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqTFo-00009Y-6E; Mon, 25 Aug 2025 09:12:40 +0000
Received: by outflank-mailman (input) for mailman id 1092779;
 Mon, 25 Aug 2025 09:12:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqTFm-00009M-70
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 09:12:38 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3fa82d1-8193-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 11:12:36 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-afcb7a0442bso668749166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 02:12:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe92b3dc53sm28701866b.3.2025.08.25.02.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 02:12:35 -0700 (PDT)
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
X-Inumbo-ID: a3fa82d1-8193-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756113155; x=1756717955; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=re/N3WGkACOd7gptwqe2YM3wDerFrWUv6TdTVIy+Ae8=;
        b=a1vm4Z9HFD3TS1kkUXhKBwShBzfrr1NZM2COBrAnhbnKZDR2JNceahjL26hSKi4ZWg
         etQxZ5Qsm+fCePM5f6ThK4Ie/6L9r1LeHh7MVEio0QfDwxFwHhOhYaVPe2jKgH2SeRRY
         cq8qF3ISdjVpErRXk4W0chDGixdM1wtbdz7CAswKWDYMM12+0bBkz3JhUMbxbzuI+22l
         tXQO+9ZL4TlrUNAoNW3yLjhaKTajL7TX5tQlRHJ/+HUiduPKXGS9amcLeY3dLS8lr5iw
         Q7QPNGMEV+QPpU3pWieZQ0kc6Odo5tWt0RTEqzTldmEgZlWptQiHXR/HXZ7FSitgoCVq
         OCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756113155; x=1756717955;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=re/N3WGkACOd7gptwqe2YM3wDerFrWUv6TdTVIy+Ae8=;
        b=UnBhRywF9Od7Lv4SDgCPTfYWF9Fr6Y3D3T7weasWsRiX/HFWwKlDbGOG1mtu2O9EG6
         mWlHX8tTix0DKj2YzhfKKPXfo1obHRf4fLYOi8kvRhmgV/99zo7HXJEtqS+QtuCJ1Iit
         VGBAlmS+PBANtw0HvG/WS+nvE4i6FlfbzapdQsh4F4qfAhWjkU6zw3AIqeBTBPi6ebpf
         TaGKTW+HMarp4yzd6Si+7abvTvmxC1CSIxgXqxPdzspKgMKWyzcVY75AmI7m718gLYXY
         wFYroa9fMV3E6oEftBdew/aUGBXdbi1oA3ivV2pDQKOyESBXWdr10CWyhroFaewH/V3P
         M4Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVy4bSHfui9HyBjpaNaGqXmgMel4MU4/ugrrEfxQe3tAgJYVBF3m3yY/m1Cxxf4Al6KqkRZsPmZoKY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz55QZi7BUPiHkUX3Ia+0Bb6hLUn3wZW14RqhGEC9IzsE3ZoCsU
	LcxBskG3dD01LCIdTSc+Zc0Gbckck2hYNjh1XmnfATdA86/IVXRlcGqRYRzKNrdeSw==
X-Gm-Gg: ASbGncvnGJkDrXE9gn5Y9AKUw+NzuTKBW+atNzME7cCHgXrn3kQCWDJhl344G3xXcHd
	Kqj8EYl6cFElAh/G5myl2GJkf6WMRv0B1unTsBqmBCtzrxUhFdq8qN2G0RAgtPRJBiZKGRVeEL/
	5TNGz8A01wPC+pn1Qqc5Nz2y626v5zj3KB+lkWbmF8t4SC9qxvjiMP9Mcrei2M3Wbg0R+osaZWD
	BNR+VVTkV78WJAMpIH8cQyC92uuXwUTHJKd69WvM95A4GOiexjJxOHcBsEYANL64yF6bPWnwWFK
	EvM5OedC40Yjuc1A5MXx+7TfpnpFbuH0vOQnEqjuFQP3yT3ckp+0xlx7Bwdc8dXIz26yDG8QBAy
	Ai42SRYmT7dI7rxbPpK+FaDQ73qWXhF/GKz8sI7w2N5MGoFSTBu9pt6lv4IeZ7F42x+nLKToXq9
	FhGnDQigFApHBakS/l/A==
X-Google-Smtp-Source: AGHT+IHb7GEVwuOfA100JgIjxFhtRBKB5Mp3yKztUgE75EISxENbLVtCRDjIvaUxM8c3d3+Gw1UU1w==
X-Received: by 2002:a17:907:1b1e:b0:af9:10c7:59b6 with SMTP id a640c23a62f3a-afe295d2e67mr1055376466b.32.1756113155496;
        Mon, 25 Aug 2025 02:12:35 -0700 (PDT)
Message-ID: <7dae9a1a-a112-4db4-b7fd-bb45b14ed662@suse.com>
Date: Mon, 25 Aug 2025 11:12:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/22] x86/boot: Use RSTORSSP to establish SSP
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-20-andrew.cooper3@citrix.com>
 <5ad64534-514c-412a-b2a2-23adaf835f60@suse.com>
 <757e3b87-bb4f-410a-84b7-cf3607bf3eb3@citrix.com>
 <1576d28d-bdd9-488e-a374-29695fca4ca5@suse.com>
 <536cce8a-46f2-4a90-837b-09ed8f1a9ef2@citrix.com>
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
In-Reply-To: <536cce8a-46f2-4a90-837b-09ed8f1a9ef2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.08.2025 00:09, Andrew Cooper wrote:
> On 15/08/2025 10:03 am, Jan Beulich wrote:
>> On 14.08.2025 22:09, Andrew Cooper wrote:
>>> On 14/08/2025 4:11 pm, Jan Beulich wrote:
>>>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>>>> Under FRED, SETSSBSY is unavailable, and we want to be setting up FRED prior
>>>>> to setting up shadow stacks.  As we still need Supervisor Tokens in IDT mode,
>>>>> we need mode-specific logic to establish SSP.
>>>>>
>>>>> In FRED mode, write a Restore Token, RSTORSSP it, and discard the resulting
>>>>> Previous-SSP token.
>>>>>
>>>>> No change outside of FRED mode.
>>>>>
>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Why is it that in patch 17 you could use identical code, but here you can't?
>>> This caught me out at first too.
>>>
>>> For S3, we're going from "no shadow stack" to "back to where we were on
>>> an active shadow stack".  All we need to do is get saved_ssp back into
>>> the SSP register.
>>>
>>> Here, we're going from "no shadow stack" to "on a good, empty, shadow
>>> stack".  For FRED we only need to load a value into SSP, but in IDT mode
>>> we must also arrange to create a busy Supervisor Token on the base of
>>> the stack.
>>>
>>> We could in principle conditionally write a busy supervisor token, then
>>> unconditionally RSTORSSP, but that's even more complicated to follow IMO.
>> Why would the write need to be conditional?
> 
> Because the tokens are different.  One has the value &addr, and one has
> &addr + 9.
> 
> The Supervisor Shadow Stack Token for IDT needs to survive for the
> lifetime of Xen, while the Restore Token for FRED is temporary and
> discarded by the logic added in this patch.
> 
>>  Can't we write what effectively
>> is already there? Or is it more a safety measure to avoid the write when
>> it's supposed to be unnecessary, to avoid papering over bugs?
> 
> I genuinely don't understand what you're trying to suggest here.

I think I misunderstood your earlier reply, so the questions probably
indeed didn't make a while lot of sense.

Jan


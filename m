Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F5BCAD81F
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 15:58:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180794.1503914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vScgB-0004Fz-Vd; Mon, 08 Dec 2025 14:57:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180794.1503914; Mon, 08 Dec 2025 14:57:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vScgB-0004EP-So; Mon, 08 Dec 2025 14:57:35 +0000
Received: by outflank-mailman (input) for mailman id 1180794;
 Mon, 08 Dec 2025 14:57:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vScg9-0004ED-Rn
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 14:57:33 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39746f25-d446-11f0-b15b-2bf370ae4941;
 Mon, 08 Dec 2025 15:57:32 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so35880545e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 06:57:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d2226c5sm26406434f8f.23.2025.12.08.06.57.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 06:57:31 -0800 (PST)
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
X-Inumbo-ID: 39746f25-d446-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765205852; x=1765810652; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bz/WMXUC4IcSRraXhVTFDQQTGMT6gXw7EEupWue5usg=;
        b=T6isvvGF+XOQD+xMCNM0+HEGeFh31ldJyBBKiJ6xA/7jqY04tIgDN0m3K+lLBFzB7H
         TyE8qqiqNNwdUIFWLA0F2RG5csXQyWUFPJvhXX3mLTmQt6tZxviLmGnmnCOdOWD/g8sH
         acis057VSoIt1biLToVs0fXU51dEdqd1+k3GnYfNXNclC9o4Va0n/tT/UDgeeru4cP5G
         qVFq1of2Fm2wDp+Up2eqKVu7f2bTXunZpHW16jJGfqh04zU3NmZb94ygyoKo5ERqdiEP
         fnIjJp6qYrUraLpo1Fiuxdq9hP5uERoZryYj33h2muWV+yvBd4PoetkjfF9keEZ3/ik9
         Fuwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765205852; x=1765810652;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bz/WMXUC4IcSRraXhVTFDQQTGMT6gXw7EEupWue5usg=;
        b=NIEZee6hSa1f1XCABgp5BBshv7u/FTR1UKU8w+/SXqB89YGaJ/2dP+gwgnshISFKF8
         TzS6LP5n8wqo6+QKMjYNTfYuSYh13HlrjWXdCABG++M0i/OdRdVpyjR7m/+cgHlYe1ff
         SNs0L4YFu7hhj1O+S5/HkrhDQeJR9YLrl5DIAfjTs6UAyan4ELKpL3xjilXR/caVMoiW
         z21AGB+/6F64h/j+putljaFzbhk6BTBqmtNT2vj7omIbqowveHx4EruP4g8yCImnG+3G
         jzYYtJAglLGcfWtLZib7/cSegaVVPaq4amBxIRI1sSkzDISwzf5jX9rwzc/EzqgzNzYh
         exUg==
X-Forwarded-Encrypted: i=1; AJvYcCUKLzd0lo6AqTuUlzEcMyWBZxBKleN6eZpx1gvjJUnbB4+5uhzpxtmvvvbR42/0S+dZi2BbR6rp1o8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNbIqVNQgNGjnLYXVMSRI5IOnI7EqX3d2/UtMoUNUvd10rruRn
	Iz41MfLVzwNM05+52ubYbrVZpUIfQOZU/zNav15poEcBvP62AfJC3ocdfJCXJJuhSQ==
X-Gm-Gg: ASbGncvcdmWMBOY+KFBJa6lWMAlWkFyhMXWsNTTLbV9+lKSWie25QwyvYU36XA0YCDy
	Rcqb+Ap4Elt6A8a2+QqtJHobo1KzD0AsV6KPx+nDC8Wv6y42B3V/ZcVvfNe+/USgsxji7NNV5WH
	Tpgt8l87CXNmS9iXVVyBSpsoXhlgVwRCbDg71ctKWQVVmEr7IFkFYU134z6TCO9lE7XV/B3YHDe
	h8IukW0U+WbSKNPd0ZHI2MJZyJ6zlDIEUWujWVtAxUIcXi2OEhAx3f5ij2OSFqMFGy9EtTshRmT
	QkIUDtJunDvcWeG5NqjMWfnDF8soflboeouP2ch9f8MKOSDQrDCVBiHmbXDlogP4c6ZfzX3e3+g
	hjJkqi5DfLCatUCGLT5hEKXCpPaJlfmhhIVOhnfgnBmLEnyi0sEumIWMB2asQk43inViniJIHD5
	wTMlIjAr3g+0e1HeoxE29aF8XxxMosVk77tUJs0cEL3I0nWeAfrmv69K/wkvDwZxfimN1Ehp5ux
	Bw=
X-Google-Smtp-Source: AGHT+IHgFO+3jgtLukrZFolABk7LE5UhVJEUqoYZc2eisz4HNmRuKzvpP2+gfqQ/obFbuGBIckE26g==
X-Received: by 2002:a05:600c:474d:b0:477:7bd2:693f with SMTP id 5b1f17b1804b1-47939dec8e1mr66916705e9.6.1765205852000;
        Mon, 08 Dec 2025 06:57:32 -0800 (PST)
Message-ID: <265bbc9b-d9e6-4e1c-b59d-cf77fb4d6786@suse.com>
Date: Mon, 8 Dec 2025 15:57:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] symbols: drop symbols-dummy.c
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
 <639fb816-c2f6-45d6-9081-238a6b3c5c08@suse.com>
 <ae96860a-02b2-4ae1-ae98-eba0b749ff90@suse.com>
 <47070C53-9EAE-48F8-BACE-B554BAF2DFA2@arm.com>
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
In-Reply-To: <47070C53-9EAE-48F8-BACE-B554BAF2DFA2@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.12.2025 15:51, Luca Fancellu wrote:
> Hi Jan,
> 
>> On 8 Dec 2025, at 14:48, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 26.11.2025 14:47, Jan Beulich wrote:
>>> No architecture using it anymore, we can as well get rid of it.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Should we also drop common/symbols.h again then, by moving its contents
>>> back into common/symbols.c?
>>>
>>> --- a/xen/common/Makefile
>>> +++ b/xen/common/Makefile
>>> @@ -74,8 +74,6 @@ ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
>>> obj-y += domctl.o
>>> endif
>>>
>>> -extra-y := symbols-dummy.o
>>> -
>>> obj-$(CONFIG_COVERAGE) += coverage/
>>> obj-y += sched/
>>> obj-$(CONFIG_UBSAN) += ubsan/
>>> --- a/xen/common/symbols-dummy.c
>>> +++ /dev/null
>>> @@ -1,24 +0,0 @@
>>> -/*
>>> - * symbols-dummy.c: dummy symbol-table definitions for the inital partial
>>> - *                  link of the hypervisor image.
>>> - */
>>> -
>>> -#include "symbols.h"
>>> -
>>> -#ifdef SYMBOLS_ORIGIN
>>> -const unsigned int symbols_offsets[1];
>>> -#else
>>> -const unsigned long symbols_addresses[1];
>>> -#endif
>>> -const unsigned int symbols_num_addrs;
>>> -const unsigned char symbols_names[1];
>>> -
>>> -#ifdef CONFIG_FAST_SYMBOL_LOOKUP
>>> -const unsigned int symbols_num_names;
>>> -const struct symbol_offset symbols_sorted_offsets[1];
>>> -#endif
>>> -
>>> -const uint8_t symbols_token_table[1];
>>> -const uint16_t symbols_token_index[1];
>>> -
>>> -const unsigned int symbols_markers[1];
>>>
>>
>> Now this is (to me at least) absurd: I'm removing a file, just to find the pipeline
>> fails because cppcheck doesn't like docs/misra/exclude-list.json containing a
>> reference to a non-existing file.
>>
>> I'll amend the commit with
>>
>> --- a/docs/misra/exclude-list.json
>> +++ b/docs/misra/exclude-list.json
>> @@ -170,10 +170,6 @@
>>             "comment": "Imported from Linux, ignore for now"
>>         },
>>         {
>> -            "rel_path": "common/symbols-dummy.c",
>> -            "comment": "The resulting code is not included in the final Xen binary, ignore for now"
>> -        },
>> -        {
>>             "rel_path": "crypto/*",
>>             "comment": "Origin is external and documented in crypto/README.source"
>>         },
>>
>> but I think such tidying should be optional.
> 
> Can you share the error? 

+ xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra -- -j16
ERROR: Issue with reading file /builds/xen-project/hardware/xen-staging/docs/misra/exclude-list.json: Malformed path: common/symbols-dummy.c refers to /builds/xen-project/hardware/xen-staging/xen/common/symbols-dummy.c that does not exists

Jan


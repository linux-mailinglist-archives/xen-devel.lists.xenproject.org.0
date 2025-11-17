Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D66AAC64A85
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 15:36:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164040.1491058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL0Kk-00055z-W0; Mon, 17 Nov 2025 14:35:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164040.1491058; Mon, 17 Nov 2025 14:35:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL0Kk-00053C-Sb; Mon, 17 Nov 2025 14:35:58 +0000
Received: by outflank-mailman (input) for mailman id 1164040;
 Mon, 17 Nov 2025 14:35:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vL0Kk-000536-9T
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 14:35:58 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bac385c2-c3c2-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 15:35:57 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b72bf7e703fso729053066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 06:35:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b737c38c619sm658872066b.1.2025.11.17.06.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 06:35:56 -0800 (PST)
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
X-Inumbo-ID: bac385c2-c3c2-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763390157; x=1763994957; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3XSFc8dCzaScDWBfWwXHJYgNQnHQF8vfqawUnKpLjMI=;
        b=MzAM4QBy/krf2t99lDlsBSDXW6XIgxn0EUDum2RKPItKIfyIYlm2SiR0pynSV4NZLX
         y1XHtysjP6W6um7G5gEwYIm4KvpZmKVpzPHBlswExalNbApDgEZ633Y38TDegxCrP/7r
         sR03emCJvjJqiyHC9zdZB7uF4HLdcvg9vtaqogRf7LSU7oELYilHEHxSgRt4Kn0l9QD3
         J39iRdE6Eh1UWRf6NznWuT+Z/WTb2AHObvG0PhCi7JyEwlqSmIEZuNKkTUCBwVkdh9OF
         wJCpUGOnL1PJghYnGdVk2daAqUlAs+u/ppa9munNNQcsYYlZaBS5pM6X7n3R89x30rag
         KqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763390157; x=1763994957;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3XSFc8dCzaScDWBfWwXHJYgNQnHQF8vfqawUnKpLjMI=;
        b=HNBDLQaA2szQOif2MF3Y2yscJ+kk9F7BxiFCYEAIoLdT4bT4lo1ItKoF6GjWD3m1w2
         EcZe4L5AMQiUFDXt1YB5YcQlr/U7tm3pfAQvXiUmSdokXVuKBbJFHEeG27dnM4c793aV
         rvel/Ku0RYNKP5Wvj5gFEprlcqRTpxPOFqxoJ1UMr2voNh18ePfym6+J4MWIhc6jif4r
         jSgQmmmKuWcrKbS3aiTxqk4oh2x1bLF02oGVESsZyBdp85oRnioVXc1CXL75gC8txBvo
         Yw7Vm/JbK8PZvPF7qE7Kz3x36MvBMnPgLBcciKZek+Z36z1YSPIFLesZgClEnvxxz4o2
         5i5g==
X-Gm-Message-State: AOJu0YwaNsoWVtnt7vPS8oBuN3hJ2L0ZssECdFahO5cTcMKdo4Mc4+e8
	wXDhN8po4zRxebEArVWqhQotapjFQ9JrnuwomitTd7fAzb0jSs/4Z/FT/RWgot3anQwY+8uygvq
	xB+k=
X-Gm-Gg: ASbGncuGerNtIgM7jnIiQV68R9Z5MPWhbDZVWKR0ECG/jxmHDjr/n0ssG3SpW9Ejha0
	1xayccJlwxTculgxcYOdjqJvZsJ3Qv3X8/r5Inza9TwBpZoqwFw1Bw1o0zqV3gvoCUxuBNdqRgK
	hZkfeo8Zm9Vkns61/ZpHtJilTylN4ZUgYBMA88x4gwkPIID8WnGmmCJFKKNqJvNHEhq7r9+MFdV
	ERMDRDLiEMxfNIvqq/b7gH4h2BPtLmA2s5UdLMm40wh4DHg+qoDLUjlvd0TXZzdrO6552Abj6uo
	K3hoCywfv7TRIOxLDmVZTxW9AsKYVTK3BNoTv6u8LoiXAxLzVXDhIIwCC3QQG2/iIbgKwcX6Cmj
	0+bpo4L5En5f1M7ngPdmChuMdabbMetwmi7V25sV857EuRvyKH+XnxzPLQm2c0lbSKqMLqb+gVk
	ZlPXOLuLKcWLnZkMuSmL/dgh8VVGLHMZN5nxC8FWYCAMtt5t3yjEU+7pHR9RRGRUJ1wrJEV4NxQ
	9u0skuTz4xT6z83Db1ZzNrL
X-Google-Smtp-Source: AGHT+IHnKzULAS2jxptJwtFRJE4piTSy4+UsmOY4UV7EnoyGatdXdfptZit2QNwwAs6Km6Pq5J07tw==
X-Received: by 2002:a17:907:980b:b0:b72:eaba:aac2 with SMTP id a640c23a62f3a-b73678be1admr1190067166b.26.1763390156842;
        Mon, 17 Nov 2025 06:35:56 -0800 (PST)
Message-ID: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
Date: Mon, 17 Nov 2025 15:35:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 0/8] x86/HPET: tidying / improvements
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
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

v4 is what is left from the broadcast-IRQ series, plus yet another two new
changes. Logically the changes are largely independent, and can likely go in
in about any order.

1: avoid indirect call to event handler
2: make another channel flags update atomic
3: move legacy tick IRQ count adjustment
4: reduce hpet_next_event() call sites
5: drop "long timeout" handling from reprogram_hpet_evt_channel()
6: simplify "expire" check a little in reprogram_hpet_evt_channel()
7: drop .set_affinity hook
8: don't arbitrarily cap delta in reprogram_hpet_evt_channel()

Jan


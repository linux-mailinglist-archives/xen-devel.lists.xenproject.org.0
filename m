Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 388F3C8075A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:28:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170460.1495527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVfz-0003eB-F3; Mon, 24 Nov 2025 12:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170460.1495527; Mon, 24 Nov 2025 12:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVfz-0003bn-BQ; Mon, 24 Nov 2025 12:28:15 +0000
Received: by outflank-mailman (input) for mailman id 1170460;
 Mon, 24 Nov 2025 12:28:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNVfx-0003bh-Tz
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:28:13 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b2fafed-c931-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 13:28:12 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47778b23f64so22271515e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:28:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf1e872esm193205815e9.5.2025.11.24.04.28.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:28:11 -0800 (PST)
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
X-Inumbo-ID: 0b2fafed-c931-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763987292; x=1764592092; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a5xACJNstFCx0OCIQA97Vmzs5Dhxf3koo9EBA7XvBas=;
        b=AjiChrSTEXV943TuK/69T4cm6EDuVKodEh7WQ2ns32Pj08sEmqEFdW0ZJRU/8JSSk5
         4g3N+CDweibHcKwCEVkLIsgCtAZv0gQIP+15IBweaPTyl84o31YCJGKB1FslbbQ3BFWF
         ly6eAjKKQ14ZbfgaDXaEOSee4p35elp1oIcPa79Fz/l4RMja9zJtXCJRpM+lsh7Q0tWL
         aTq925ZLGMscY8JlUdj8ZoOriogZkxkjqkpg0mxRzfHc+VZgf9Xpz3fttOEeEiukrTJy
         2PPEMaFJ4EpfJIz6yLjGLyzRX2yPH9xc8CVvHNqm8mqZ8f77TrBirKgsfYajFxSKp+X/
         boOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987292; x=1764592092;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a5xACJNstFCx0OCIQA97Vmzs5Dhxf3koo9EBA7XvBas=;
        b=fH6U8/RxduzHYhmC6v8/dy2tFp8z6Jnyqozx+eFr7qzEIGlUJVhFeh0v0Isaad7iL7
         XEvc8U8ldMgyatlY1RZGyPQObWT6h3jdailE1vQ5yni7B39wl4ZdTSeZD0v/38/qSmfJ
         +DmmcvOTn6iKjFcOR4hr3dYF4e9GqF/Peibm99KyOzk9qAMGgziQhLwanYrXBE6M4dcK
         BW+p0D6eieTrWeGVPbkEg02GlfQnug4J26ENNgrg+VRnMbXBFlFAzBWLLdgMlErEZmg3
         7gAv3KZg2kF9alK6xPnUYSYbn2Ywum1Il15dwOWIRtR8x+yse4Pracks7vJbBB6TbQ3E
         1Jfg==
X-Gm-Message-State: AOJu0Yx2DEFi29h+RsL1FqGSJX9y2Glz9hQY9nbWde/3RLMjAEJtfuaJ
	GasiT8qBIDiQUJ9AELwCbXL185DlZV+Wn7jKZj1GEdxVH58YDF8SV4Av6M9tjnLymKn8wla6tOw
	QKw8=
X-Gm-Gg: ASbGncsDGpWn/V2lYxkGE4rlkdV0JVkdcbe4JU3UGNIyY1lMw4Bi2bFgiy0JTGuMxIu
	+RDKK3w23gNthaDNrde7ZctI+RyneLvUfYeJri5arnoQLYmU/ps8PwPZhDUX+tl1VWdCKbFQRKw
	Zw9ovfIXBUdGo20tIcpfQlHjdyB6zopcYrJIjX71Db9z2p5yi5kce3B6N7p00R0neboPBEouCuX
	JS6mACIxO7WJfC0PiPvb7Iqt2wP1dfpeDkFBbsKOcgkPS31JUvRLzSArY/HtyBtitCcauk53TTW
	SXMK81a713DN/z0/PNtVvvJkyS1iRaM3AUM1N936fN2ZAbWEZnMNM8oimUqdW1sqlGJZIxRZcRz
	quUw7LzZN4PEsIKi61Eilp1m7PmoS29g/KkTZn/mn6tF+k3duCgYTQPugHYinQ+CFaYBQx23pLi
	9Bevf7syIbgeW5KjnYKZOC5yx3vzHScTzCHLqMl9WeUnq+ncHDlcJyouETA21lDmYs8WXmU+I96
	uU9mYNXU4LRYA==
X-Google-Smtp-Source: AGHT+IEuvsjzw9/2J2OSgS+2HUecvgFI0qzXWeBmdXx9dMgwhKBroUi9Bv3v/DHRFB0W2J9yiyXe9w==
X-Received: by 2002:a05:600c:c492:b0:477:8985:4039 with SMTP id 5b1f17b1804b1-477c1143024mr110303345e9.17.1763987292141;
        Mon, 24 Nov 2025 04:28:12 -0800 (PST)
Message-ID: <1c1a8995-4d37-4680-8a18-2286732bd7f0@suse.com>
Date: Mon, 24 Nov 2025 13:28:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 4/4] x86: direct APIC vector adjustments
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

The setting up of such vectors really is a boot-time-only thing. vPMU also
doesn't need any vector when it's no in use anyway (which is the default).
The first patch also is a pretty much unrelated change to tidy things up
first.

1: vPMU: move APIC ack past the handling of the interrupt
2: MCE: restrict allocation of thermal and CMCI vector to BSP
3: IRQ: direct-APIC-vector setting is now init-only
4: vPMU: don't statically reserve the interrupt vector

Jan


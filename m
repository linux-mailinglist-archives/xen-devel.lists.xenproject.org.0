Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDDCD3ACAB
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jan 2026 15:46:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208126.1520362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhqVj-0008Jx-9b; Mon, 19 Jan 2026 14:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208126.1520362; Mon, 19 Jan 2026 14:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhqVj-0008Gs-6D; Mon, 19 Jan 2026 14:45:43 +0000
Received: by outflank-mailman (input) for mailman id 1208126;
 Mon, 19 Jan 2026 14:45:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5NKf=7Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vhqVi-0008Gm-D0
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 14:45:42 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8623d1f0-f545-11f0-b15e-2bf370ae4941;
 Mon, 19 Jan 2026 15:45:40 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-432d2c7a8b9so3826016f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jan 2026 06:45:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356992201csm24093209f8f.2.2026.01.19.06.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 06:45:39 -0800 (PST)
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
X-Inumbo-ID: 8623d1f0-f545-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768833939; x=1769438739; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=loz6VaQwHDOaYVDwdyAXRHZWLIJTAzZg2oeK0GPCLSc=;
        b=SOgtBlCN/6K++OA1q6kNcYxToEYK3+bcrj2zMT4DT4t+Q2rXTqadyp5KQwuSzItPZB
         r6hxdvmCLnJgeRJNNMaz4FA/DOmi/cgsJwUgQ8zuASsTWV7ruhLoNkPwnlQ0c0Ap7oKF
         4O6R/mMqeTpUyrVLIFZ4PsuFmViN5+j1vOTWWNcZLMQDLEuHEw5nAgABQfYW16vUrmh/
         Q1KsPG/4kWTk97ThvX/lfEaZwYXiwmOzpPM9X919SGWFHy2EzqqXduvmLhi9lH2SjRm8
         mqPFXalmhjf+g/aB/sWH/1tWNvGwQSy4z/cdmwobBVfuz8B2+MNPN/nX3rINETUaKTJi
         MCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768833939; x=1769438739;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=loz6VaQwHDOaYVDwdyAXRHZWLIJTAzZg2oeK0GPCLSc=;
        b=gQBWODwP655rIit7MtvcY3ooOqQvNEJUzjVG7Z1kIR5DfdPu2q7tSWvbC001dlr3Pm
         x+YnrTaENKUd2vflw6zPgTNoSlNtqxBwXliMl3SS7atOX29aOImK6i90j9JIdm5Qv5Wb
         PwA259xVSdXnFnJhoC6DhdkbooW61CSWDhC0oWIRRwhv4lWkjfyX+ocD15JjAFXqMRVm
         WjBfAjis7Sfqk6eTUwaWkVnHR/8JN5JDDvs6SSmnjvrWmsZvny6MJBBDNIjC/Hqpbrz6
         0jHfEMls7J+lvyM1fme4C5ldhj73v2s6xZ/T3yr9aZkhEf/P2u0RKYykb0Jph6AyHUc0
         vlXQ==
X-Gm-Message-State: AOJu0YwfK0uUP+KnAxPPP+LGXZ5c0cE54Tb1d8VCOeIkiXR5JJa5zBvG
	La04T1QYZhQi4luC/ZAPFmalpyzUFjdQmt0Mn8UeD5fwmMtPH3pmvKfHLu9G88vhgTW3CHtCW2F
	Yigw=
X-Gm-Gg: AZuq6aJ39qOojSswQPpKYmjyS12iKhJjPtT9HpZDvup+fchBYUDRCqc3DDmYC6SPR3z
	v+rNtzQKeEI40AnbRsMmiM1fNHQjSH97RGgqvdOkn9JqWUvgRGdrkhK2nubD+zfuWDbzg+b2hs6
	cXUd2VkrQAPj6xidXDaplgrqSuPD4ExYmvAtIVmm7IWOefkvfiS2O8Q6qquP0Plm/toZgrvcbDZ
	3iY4ViwBZ2dUx0Vp6Q37y7+/2PGMh0ex6lTuBrQUeQ4bMlo9iKpsTG/5v00FyXFzN7G8bFso0t/
	wo1bv4R/T3lk1IZxXOYffZib2qpwY5vWbjj3SeYbg9HxMTnEqot3Vkf3eOZBiuU6YVs4rJrzD03
	iMVkoBb0qMGNzhM0U6Q0OC6q75C+Luq8yP/mHGNAqt71F/Gu0W9qDVAGoVRlJL9AFmJUhSskM0H
	Bu4a3ebItGHnwgdpW8FqrYJWVnMKXqyBfqevGjgAkPnn9ELdHGH7Of90fYaJs5jRaX8zrp8IPm7
	Lk=
X-Received: by 2002:a05:6000:428a:b0:430:f5ed:83ee with SMTP id ffacd0b85a97d-4356a03323fmr12832537f8f.7.1768833939576;
        Mon, 19 Jan 2026 06:45:39 -0800 (PST)
Message-ID: <58091dc1-7bda-4536-8200-2d0a5679d4d1@suse.com>
Date: Mon, 19 Jan 2026 15:45:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/4] (v)PCI: extended capability handling
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
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

This is a follow-on to 'vPCI: avoid bogus "overlap in extended cap list"
warnings', addressing further issues noted there.

v2: New first patch and significantly re-worked 2nd one. See there.

1: PCI: handle PCI->PCIe bridges as well in alloc_pdev()
2: PCI: determine whether a device has extended config space
3: PCI: don't look for ext-caps when there's no extended cfg space
4: vPCI/DomU: really no ext-caps without extended config space

Jan


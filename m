Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJ/ZMv13sWk2vgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 15:11:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7368526520E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 15:11:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251153.1548398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0KH5-0006JF-Dl; Wed, 11 Mar 2026 14:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251153.1548398; Wed, 11 Mar 2026 14:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0KH5-0006HQ-Ag; Wed, 11 Mar 2026 14:10:59 +0000
Received: by outflank-mailman (input) for mailman id 1251153;
 Wed, 11 Mar 2026 14:10:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0KH3-0006HK-VS
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 14:10:57 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c4dd145-1d54-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 15:10:51 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-439c944bb62so5477193f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2026 07:10:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f820a2f1sm6922475f8f.30.2026.03.11.07.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 07:10:50 -0700 (PDT)
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
X-Inumbo-ID: 1c4dd145-1d54-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773238251; x=1773843051; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jBjKyQK+QtIz3+tlMNJQwtl6c0fxdaVvvsMhigp5ihQ=;
        b=RV+C9BqT+QebWJI57ojyhZDh7U2UqN2Sd5DtrsCfJrBOqDFA44izFoLIubR0F2fEbx
         D7828hEsCP8bWcty4opsw9VcshJSwuMfgjUwccmTsGJjRATxuZIBrljXfP739iwqy1/b
         3UlkRd0tMY1cvaYPhFY7GPf2DcsRUENKN/G1akC4C8/Z0Xna9zal0yW/la7NRUoBzjXA
         Vy1/tHZR57+YlsdW4SLVp75MLYVIPVwAdnCPKky7f97EBwq4QpJhInqj5Fln0oH6SBt+
         iA/KSfZsTJglQSZZuVqhFeoHgxBpI7MP2Nvz72zgDmJFeN6cocenMXVICDkbbKRXnaLc
         hDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773238251; x=1773843051;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBjKyQK+QtIz3+tlMNJQwtl6c0fxdaVvvsMhigp5ihQ=;
        b=K7GZE5NquHkD8QNhihHOLpJ4KF1TrokMBUlf9bEL7iYJNzNI5vt+z5HOCs2NvOE5J9
         gni2svaOBmwqsAxqc+mmgViGmOQRv/ow1XwIncg7Trl4nqVjTYaRefYQfr+zrgaeh2sM
         LdsB7yi/k6YL8un9l7tN2uEBL2lfGB0iKBnkPpU40L0F1kenheS+AXDb0iZPrsYHouQV
         JQfx7q0L+Bfi8zTLq2wPlJGZvdGajOS+FMLeZIPZDA8sc4nuTd9w78xQM+lj9142HUcz
         sWu9L2dEf64mKH95VMuNARbxwfcDTJTl2jtFEXL73LbdBpgceWVQfUw8cI5+MZ8GYX9l
         WKCA==
X-Gm-Message-State: AOJu0YyIrsLCAxbZlkL4Rh7nz7YAyNJwX30sclj96+nuUL82rlLqQkEq
	qsMp1GArR8NOqnnSoV2kZu3VG5HxOMg6rq34gWeTd/k3hZ/Z4m79l8AWW2ZVqP9G4w==
X-Gm-Gg: ATEYQzyoC39HfKRw10gRFelE/CVRLYrFWsUHkt1DLUk+0LJW6cPnfgO8FgOyQ4k8AuF
	A/BAb/gvPSOGkcdxtm9L6Lwde1gXu48g5vFYVB97UxrDT+HyKOZtpCRXIyZB2PYh54PfcTY9+GX
	7BKgtPcbYNxaZsdxzMHPKKeRv6mMZAdTJtgKfcNOvxTgpph0YGBBJc0BcdvA57oYrs1sdGwZ2yi
	9rBVxQ4aldYUH/IubLb3agS0DlBRb+Gi7O49ysZlLCqltqDfuSK+ugtxBdoEREtgAesQM/9h54s
	+FZ9BxqM/C++ftMq1nfw4XokHns1Iz8fRQn2oAwTj/edwiG7yUJr1dfW2/b/XvtAdumyLPcUde8
	9de7vufCQnqQ1lVXP9lwXnN61em5HwDJ7NN9GL0sJN64LRhAWhkT8+J2Ah774j+pQM5eFuoaU+M
	x7InCIPv8CCM6jEqwmGf4LgBb2KHRcoROBJzu7aobJEd7JA0idUWfsiRAfxHrWgByN+Ckk8+wkO
	rbE6OGdMMgYuCo=
X-Received: by 2002:a05:6000:2913:b0:439:b3d2:3768 with SMTP id ffacd0b85a97d-439f81c8cc0mr5545785f8f.21.1773238250940;
        Wed, 11 Mar 2026 07:10:50 -0700 (PDT)
Message-ID: <d8e51210-5749-4a96-a6f0-e7e23242296f@suse.com>
Date: Wed, 11 Mar 2026 15:10:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] core-parking: shrink core_parking_cpunum[]
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <29922662-8b95-4a69-9401-11480df59cdf@suse.com>
 <aa_fUpLqaPDal_-l@macbook.local>
 <fdd0ab2a-54f7-4f80-a896-c6c21e3ad5ad@suse.com>
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
In-Reply-To: <fdd0ab2a-54f7-4f80-a896-c6c21e3ad5ad@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7368526520E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 10.03.2026 10:20, Jan Beulich wrote:
> On 10.03.2026 10:07, Roger Pau Monné wrote:
>> You possibly want to adjust the subject, instead of shrink I would use
>> "dynamically allocate" or similar.
> 
> I've changed it, albeit the goal really is the shrinking.

And it's only now that I notice that I committed the patch with its old
title, sorry. I failed to properly propagate the adjustment.

Jan


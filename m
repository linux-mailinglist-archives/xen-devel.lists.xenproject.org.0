Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8640FAA084D
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 12:17:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971827.1360227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9i1Q-0005ZJ-Le; Tue, 29 Apr 2025 10:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971827.1360227; Tue, 29 Apr 2025 10:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9i1Q-0005X1-Ic; Tue, 29 Apr 2025 10:17:04 +0000
Received: by outflank-mailman (input) for mailman id 971827;
 Tue, 29 Apr 2025 10:17:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9i1P-0005Ws-C5
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 10:17:03 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16fedb3e-24e3-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 12:17:01 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ac339f53df9so1114138966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 03:17:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6edb1580sm768372066b.175.2025.04.29.03.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 03:17:00 -0700 (PDT)
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
X-Inumbo-ID: 16fedb3e-24e3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745921821; x=1746526621; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rN3GflvUnGY4OfqsVWVon5csRcxWvoII9uJg/IA1kSg=;
        b=c2So+8vuv55NY3Giew2ii5m7aTDogrQ4blCCxSpBdPhKeJtCduFVpibWSZF+kXs7jT
         tBjlLeezW5IedqW5zTBsupuIjTXiHFslTTeLG8dKGF8gl1uK9OLoyvpzkLcbJb87hh2d
         6HYP1j+H2PmlrCOqZtoburAjF6JHLUIWG0KpfKrwsD0GNCHCkqRzQDXpYRxOk7a/2y3p
         /7sHVOpobN12l8uUEgZDka5S/Y+jPG65p0pvniBwkgnXw2+Ya2n7k8Xp0T9sdf5JmSVj
         HzSQU6fTQCf0N/pk+YBDBe5UfK9AjnRXTInh8/xMrVsIs9v9qrDAjn0ZT4+ng0t4JMcY
         517Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745921821; x=1746526621;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rN3GflvUnGY4OfqsVWVon5csRcxWvoII9uJg/IA1kSg=;
        b=Xa/Yf/mk7DZVfQSO+JiRUE6yb87PLAoyXdmEdbfjiMW4kq21Tn3eyV+eGeifo8RMAB
         xqdCAZpIWEGCtFEl4Ol03Mimhmm2DDC11RTyTdv+qgRCYhQ5EqOweOIug+LRQ7HC2CL1
         SAN1M8o9qP04mzH7Ltws7hG1yKRfWy7anHIB8gpNDRKsBthYq+8NLlixFsvdtdPMdLo/
         ysFZtNN0w8f2AYbK13/v1VP96rVMwlHNGlShMKLZlL7dT2Hrf9mkr8MSgQdg8jvjCVIS
         +NrEsWxC1+3QOfAld0gAygQEkJmcJRfisIDRFStdXrvPqH+LaYwV8Cbbl+2ercg5oW4o
         /ciA==
X-Gm-Message-State: AOJu0YwKkk5q7iNADCXMsWmIvMp9KWl48Dz972xQ0v2cLDy2OvBc6EFX
	J+yJ2WNxL327KA15MgvbmqGzBtZpbYSJGEhViWLGvKtwvVu6FDYFRMGLT0UP+kKIoPFtATY7ee8
	=
X-Gm-Gg: ASbGncsnJZYxlPyfFWFQZmRNU/BwQ34JQsUZ1fahJD4OmLUzvxSmFFhSOfbFS9eGOuo
	MqxXUmO6ajasZMcLVFwK6QGFIah8bVvgVYkX6FYm0PmBhV9i7VIJrrw261lpIB6ICYGXhOdQO6q
	29rNbqVvTMMq7Negc4LcEmOpgUWk3e2RfUxDFQjzbHAArThMbUOltsj6cbHgO6taopurg9cyMnp
	G7CX0W79Wzl0eQaSJT23NJtw8S7dnOcVJcEK7cJQPs75XRtLE/n8v+awiJcsFsBq1bIU9A9CjzY
	ORM0g1NYGEspdrkisgd+wjBfgJppG8OIUGNQmLhACV+pkQac/tEq7T78kbaevAKo/Iw3DE1dYyX
	CqMAV07vbYB3zCZSsdOXNUJ/O4TgsKz2ju3dl
X-Google-Smtp-Source: AGHT+IFMdBCJcus3s2S+6mMOkpspXljNCuj/JAiuW0xyPE89aQUbUAzwdRU6kMXtBHsA2ghsD3Rqvg==
X-Received: by 2002:a17:907:1c8d:b0:ac7:efed:3ab with SMTP id a640c23a62f3a-ace848f745dmr1135124866b.21.1745921820617;
        Tue, 29 Apr 2025 03:17:00 -0700 (PDT)
Message-ID: <9742416e-b698-4d31-956f-9214955cecb4@suse.com>
Date: Tue, 29 Apr 2025 12:16:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: preparations for 4.18.5
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Kelly Choi <kelly.choi@cloud.com>,
 Anthony Perard <anthony@xenproject.org>
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

All,

the release intended to be cut in about two weeks. Please point out backports you
find missing from the respective staging branches, but which you consider relevant.
This one I have queued already:

a88b99300aed	xen/link: Include .debug_str_offsets in DWARF2_DEBUG_SECTIONS

Note that 4.18.5 is going to be the last Xen Project coordinated ordinary bugfixing
release from the 4.18 branch; the branch will move into security-only support mode
afterwards.

Jan


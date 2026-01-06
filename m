Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD01BCF8A3C
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 14:58:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196149.1514027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7ZY-0000jw-N2; Tue, 06 Jan 2026 13:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196149.1514027; Tue, 06 Jan 2026 13:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7ZY-0000hT-Jc; Tue, 06 Jan 2026 13:58:08 +0000
Received: by outflank-mailman (input) for mailman id 1196149;
 Tue, 06 Jan 2026 13:58:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vd7RZ-0004MT-DD
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 13:49:53 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 937f2561-eb06-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 14:49:52 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47d3ba3a4deso6092685e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 05:49:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f69e13bsm43099975e9.7.2026.01.06.05.49.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 05:49:51 -0800 (PST)
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
X-Inumbo-ID: 937f2561-eb06-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767707392; x=1768312192; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2cfIXKgHYTFCKsrX1bFpAF8sQFG6ytaJSHI//BPGSL8=;
        b=HgCtGjAIicX+vNFSnc8f4jIhsV7yovP/PhlrweB0mNJBeSixojNOdvr6NTsPpZTZUR
         3eCSMBjmZTBH5uFQ84qnd0aJSF2iiDOgXxeQAMqylPbMbBdn+sIIEgzknwcBf72jlj3h
         BIeE8osIDuY12KKkSl7LyI0Nzg/zGZ8LFIWVZhUTOwDsS8XPEzytxvKPwU+oQkCao3Fg
         rZ2yM9MrSgiDHZz5itam+IaDd+mFxRzdVFMW4yNDDVNE4B10YNQz8epEY13jnhNLHXhL
         53jFpr3T8wvQdtwhnKOh+BI3O1iNy9Wyl5TDbA3U9HR3xKbL4Yp2NM4g+WZwY14Mb8Fm
         Vqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767707392; x=1768312192;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cfIXKgHYTFCKsrX1bFpAF8sQFG6ytaJSHI//BPGSL8=;
        b=FMY9GBP7C0ts8itM2xB4MMuNIHQ5zH0gqaUoIsu41iUvy1RWPwS6c3zqWIoDdtiT9N
         Bl4NqhwdbAIAES+VdfJ7iByFMJ+cp2zF3Vpdh+e3ApbckNSkNBRMZoBTEiuQpqQdib4M
         N287IFTAcYh9tLKBfNayOlGNpRXTqDfql7ObX7H+rTtyovOmnwH3h6OtxVrw8R1Zq2qp
         HXV7lvieYzdY8vJ9/BM90r83D3k73vbOwKuB3NCcoMJzJGuOzC+IREZ6MOGApGoBNYP6
         /vnH3uutv046BnM4f1FPmbNLwMYcSqM4pGTZG6joS7jyreS9exApBWaBCdqdocbUEAK9
         bUGg==
X-Gm-Message-State: AOJu0YxKXFswTGOJkRc22VEqpeFo7udM9xn6NbBmujmR9qWckkiQuttA
	YqMFJ2g6mUI72hTQ2dVzE/tAsSkWltGtDK48ePsQgvnz8AR8V1VutgAMsJOVCglSwBw2CwMUp10
	33GA=
X-Gm-Gg: AY/fxX6NDM/7f23vfSTsXAUhGe2SfsEfIo83puKfDhJE0fkWZy7ejBue6NQiDhlmMp9
	5kNmH4Na+3PH0Yow8BlNnIY5QeXzvvRS3h+u0jzgVAIb0mZSieXr53QWIC7rgRuvflbrFn2DeuN
	EOj4p9DPtHaaPOcLKzKNYmYE2JtnTHbp/tgE/Pg78sZC/sdYnlMeZaHdDqC+vePwYbzU+w/Ut/K
	wx6X8ZZDp8xJsNCnOXiDDEDrbdZWByuUg3+Pq7SL9JFfHzQ2vyoRFmiGcnl02e+pDkuiaTrcX9o
	hayjVn8HaZAYbedGO799j8ZAMfKUzg64U9OYfzAtkoDaFt3YD6beyoF4FY7THlb8jBa9qusTlIP
	yqi68PffjXasjWdskXiNaZsoQnnVuTr8VQ9VHcAVq5v6mffVFNXaPNbZukZt8auHVv2ovyA8fUm
	nqT/uXqEuMpIVnEvlpF7TP8aFUas1bZtcOzYZp1we1POgxovh9ezjX13pbvkOJroYLWfRztan/V
	k0=
X-Google-Smtp-Source: AGHT+IExk9a4kJflf5MXqX0+A74y+swup+hf1gx6iK7W3f/9V+3U0r2+q1yX0qkByPjLKAKoVBZhgA==
X-Received: by 2002:a05:600c:620c:b0:477:54cd:200a with SMTP id 5b1f17b1804b1-47d7f066c8emr33236895e9.6.1767707392064;
        Tue, 06 Jan 2026 05:49:52 -0800 (PST)
Message-ID: <e2c5f47a-9f57-4bac-99ad-71e3163cb0ea@suse.com>
Date: Tue, 6 Jan 2026 14:49:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/6] PCI: don't look for ext-caps when there's no extended cfg
 space
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <05bc9acd-3054-4c5a-be87-cfd8d7bfa0f8@suse.com>
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
In-Reply-To: <05bc9acd-3054-4c5a-be87-cfd8d7bfa0f8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Avoid interpreting as extended capabilities what may be about anything. In
doing so, vPCI then also won't mis-interpret data from beyond base config
space anymore.

Fixes: 3b35911d709e ("Enable pci mmcfg and ATS for x86_64")
Fixes: a845b50c12f3 ("vpci/header: Emulate extended capability list for dom0")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Because of the multiple prereq changes, despite the Fixes: tags I'm not
quite sure whether to backport this. (I'm leaning towards "no".)

--- a/xen/drivers/pci/pci.c
+++ b/xen/drivers/pci/pci.c
@@ -113,6 +113,12 @@ unsigned int pci_find_next_ext_capabilit
     int ttl = 480; /* 3840 bytes, minimum 8 bytes per capability */
     unsigned int pos = max(start, PCI_CFG_SPACE_SIZE + 0U);
 
+    if ( !pdev->ext_cfg )
+    {
+        ASSERT(!start);
+        return 0;
+    }
+
     header = pci_conf_read32(pdev->sbdf, pos);
 
     /*



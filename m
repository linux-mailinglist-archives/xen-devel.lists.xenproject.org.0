Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3887AAB6424
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 09:23:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983891.1370064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6SC-0007TC-IJ; Wed, 14 May 2025 07:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983891.1370064; Wed, 14 May 2025 07:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6SC-0007Qg-E5; Wed, 14 May 2025 07:23:00 +0000
Received: by outflank-mailman (input) for mailman id 983891;
 Wed, 14 May 2025 07:22:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uF6SB-0007QX-6v
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 07:22:59 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4106f6e0-3094-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 09:22:55 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-acae7e7587dso1004108066b.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 00:22:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197be6d7sm885487566b.157.2025.05.14.00.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 00:22:54 -0700 (PDT)
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
X-Inumbo-ID: 4106f6e0-3094-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747207375; x=1747812175; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41miFATeZxHupvacOlvavkzA6h39zZkxJdVTAm5UTt0=;
        b=TWetoAFl2Z/53yhuE71U7u7o7jPTXHs564TxB32GUGtj9C4jKrzDc/l7XXIF77BCEt
         +T419JgacXDNu+EG5vyBPQZeL7qCRplwKggP0H3yr4w8UjQQYNN6JB8qsW5/thJO84nF
         YUFqyaKo2O22U+0bg2fhT1k7Bi/qICz5dzo5Sqe+7cInIAadSbclSc39CCcCofCyCE3+
         Dn/nopb1udkk3iX23wyg0RHdCpNeLt/TXdibhdPzwIETKNwLWx6VprvXoAiEYVK/gNWl
         WIayfzvNEtQW8poiVYTdvtygVovee5w2tNHB+oZRVWZTCgcGGR64LX5HXF9zqeG5V2Zd
         dRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747207375; x=1747812175;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=41miFATeZxHupvacOlvavkzA6h39zZkxJdVTAm5UTt0=;
        b=cPEXmsYJnnV2Cw2wlxNF5sgj4rkDKz4524JTitYkQpZLyuTsQ0etXI8tRk4FHdZzOF
         FWGyy9okYbWqyFpNaVUd439KGpb2FnDqrXvyUNQAUKSwUl7FbiCqs6Nt0G7YOonX1vpS
         ufsxGQotRH1sxvXQpo3mXoEAolD/At0VQn6dNA2/g+wbwqI4NL+FHQrckopBa9yC4Jcy
         lgOG1y3pEWAny6EqYryZwmfQ+2GtR0ZOwfaO5hSRZdSzrRSwnIxiO3OkIeWiZvzZViCG
         +N7gPkJ52zN75Kt1p6XtlSJcP5N2kZHOBWnuuBCT2P/l/mXfDBJpv6Go1UgD7HyUbRE/
         cu8Q==
X-Gm-Message-State: AOJu0YyqEjBfq2ciTZP++Kgbqx1hu6N1GdYfVwctZQBMjYlCxNefkj8T
	eT6wUZ8O2WxKIYmmmqZkC13PXb3YD5a0+SCN/McwG2Nf3wmnp+okzOsTTU5jd7fo+QOzjm5gXIc
	=
X-Gm-Gg: ASbGncuGvfEsfbrTNrFJn/ZdGGCuemKC5xP0FrtGKEiwu5AjCZmk0KMdAz083VFAmVk
	RPfABRovFvC4y/VNn+vfX7Obu9DQ6ua+md2jYIly5/gbIwi7tQ8E/4EiT6Gl0jSZnYFfqJdSYPj
	rEtNqUxeUwj9XfPmeTPFDwcXBcQbj8hYvRaN29fifnckAWWF57pK7tY9cUuQRZ0dtz1tJROUCHx
	GYBaeRRQPsCaBdWh7DQiN7t6k01AS5e2INhOJJudaD3XSWBMkbdoovRuevQwSkGu7NDEEn3fXnn
	53JcgHPoI7yN6/wOXZH9RfRFuu5FgQQlEZVDpnzJIKPLGW7Zz9EB7BKh7Y2XFWKGG1rM42DXawJ
	ynhrvMaX0HLD945mwhKVE/a+sJc3sDQKnkE0s
X-Google-Smtp-Source: AGHT+IHCClQI09DEi9cT6JHCGyFKxMsoBdXLVYdEZYWM4XF2wOvaifvoW4EVNr2LY4DnsQs3mPjGsQ==
X-Received: by 2002:a17:907:7fa5:b0:ad2:1d12:fd68 with SMTP id a640c23a62f3a-ad4f72935d3mr248789166b.48.1747207375178;
        Wed, 14 May 2025 00:22:55 -0700 (PDT)
Message-ID: <9fc0b9d1-15e5-47e9-a532-a25e1ac32ba2@suse.com>
Date: Wed, 14 May 2025 09:22:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/IRQ: constrain creator-domain-ID assertion
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
Content-Transfer-Encoding: 8bit

If init_one_irq_desc() fails, ->arch.creator_domid won't be set to the
expected value, and hence the assertion may trigger. Limit it to just
the success case of that function call.

Fixes: 92d9101eab ("x86: allow stubdom access to irq created for msi")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -289,9 +289,9 @@ int create_irq(nodeid_t node, bool grant
                 mask = NULL;
         }
         ret = assign_irq_vector(irq, mask);
-    }
 
-    ASSERT(desc->arch.creator_domid == DOMID_INVALID);
+        ASSERT(desc->arch.creator_domid == DOMID_INVALID);
+    }
 
     if (ret < 0)
     {


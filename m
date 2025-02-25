Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AD4A443B8
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 15:59:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895840.1304480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmwOO-0007XD-7W; Tue, 25 Feb 2025 14:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895840.1304480; Tue, 25 Feb 2025 14:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmwOO-0007VY-4h; Tue, 25 Feb 2025 14:58:40 +0000
Received: by outflank-mailman (input) for mailman id 895840;
 Tue, 25 Feb 2025 14:58:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmwOM-0007VS-IH
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 14:58:38 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fccc8309-f388-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 15:58:36 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4394a823036so54580635e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 06:58:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f2475sm142600555e9.20.2025.02.25.06.58.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 06:58:34 -0800 (PST)
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
X-Inumbo-ID: fccc8309-f388-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740495515; x=1741100315; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKiOFU7yLZ8utHN14N2KMOiuRrqZQa4CzFbTvEvQnK4=;
        b=OMbZ52soX2vwSXECtV8kLTzmMgj76Dg4ksP+e5hpbusGrfquWaGGWIXsIKjAncsd+w
         8wVOAaJb11DOs+bjW4uq8mIwKVVCPbgWrGPW9RLeg0qEBA7WMNXIiHoW4REkuoU0qPkF
         Bm9099LFC2ShBkzMuXxZgV1C/BfXBryZv+vG87GlI1ShLw1jtnds86FoxCW1IeNKe+pz
         zXRWqlLEsC6a8JnPkbuc68rOz/gmu5Zqh/mFmCAfM7x1iDvdGYlGSstRfm4OpFqodg7W
         a/QPff51LCKMmlf/qMrtSQnpLSNm13reshaLWoMkCSXuDyvdVr3RQGsLBqdeRH46WGy5
         +G8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740495515; x=1741100315;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qKiOFU7yLZ8utHN14N2KMOiuRrqZQa4CzFbTvEvQnK4=;
        b=qdszm+DX5sIf0MTTRQBmco1VLHUJy2QG9lME3DFtk8nxvbvC6tCY3pPbdscxyrk2sn
         LaqmWMJzlnXmGf3RzRb+uG7Af0slocMnfXaqtdvLT4t57QLifvBvn4zY/icSmAC9xqjk
         vcqzeHMPGJIBir74CVHtQ+Ah5UpNssql+0vNFrESyL7OMxORknL4aiyU8kekOnkjPwjb
         HtIxPEqPWYZRgu/vsFF/5EIdQDSfGvGeyhE/0XokaiBXkxVzqHBSgreYmm9uwcdPy5eo
         udkxtO8C6sIxjB+Q//C0jW2apQt02ii0JBf2CrW1zX0+0CY3Ke1+YMH8ZRXJE7MPqQL3
         Tlvg==
X-Gm-Message-State: AOJu0YxPpB2Dpit7FbNv5NWfwf/+tZJEeBIXu++MAN/MW+3Ytf93QQMs
	YwKH3bZm/CNIsE/kKlIm1pjwauCglzOVP4KqdZ5oy0bSOUfx4W12E8uRTwZKowGX4VKZnv9w6lY
	=
X-Gm-Gg: ASbGncvGQ/Cnb06qa3NiWY9q+BIStitPK7DqPAIveUeVkWzqz8SBGtqZS9ZKB2H2HPI
	N7QZsWgkwkHHv+Dsv05M+UPQx40+O/UXe1GXwBzNzoU6EhWJO8u56AXf6RXFBJJ6O2Nde82Wizv
	hYe/9EfgrwB4B5VpSsAxS054aGVSc1mpNDbU96LrFKOp0wh3JHyhrudMl3RcyFhlewvt9ERqszf
	5plHGq+Y8NAEC73+Ayp1w6xGHVsxcjAZTeL6UbyozmmNwS20+FZxXPj7n+ek+l4t0USgCXBRWo5
	UFuXojKg8mrHSngw46DtlaSbx+Np0b/jFkdI2TPMIp0vunwnrCQnCBFmaSZMPRCGjJLyvy7nbDT
	i1F0nCvnJyLU=
X-Google-Smtp-Source: AGHT+IHtMWpQ+P1MyU3ZLOTBbkdsoKZoWKJ4NN0zrA3+Ro0VkIuVNbvsRfng+sD9idktTCa95qbWfg==
X-Received: by 2002:a05:600c:470a:b0:439:a139:7a19 with SMTP id 5b1f17b1804b1-439aebb3155mr140887225e9.23.1740495515023;
        Tue, 25 Feb 2025 06:58:35 -0800 (PST)
Message-ID: <6565e881-ec59-4db4-834a-f694bf1b9427@suse.com>
Date: Tue, 25 Feb 2025 15:58:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] memory: arrange to conserve on DMA reservation
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

Entities building domains are expected to deal with higher order
allocation attempts (for populating a new domain) failing. If we set
aside a reservation for DMA, try to avoid taking higher order pages from
that reserve pool. Instead favor order-0 ones which often can still be
supplied from higher addressed memory, even if we've run out of
large/huge pages there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: More generally for any requests targeting remote domains?

--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -192,6 +192,14 @@ static void populate_physmap(struct memo
          * delayed.
          */
         a->memflags |= MEMF_no_icache_flush;
+
+        /*
+         * Heuristically assume that during domain construction the caller is
+         * capable of falling back to order-0 allocations, allowing us to
+         * conserve on memory otherwise held back for DMA purposes.
+         */
+        if ( a->extent_order )
+            a->memflags |= MEMF_no_dma;
     }
 
     for ( i = a->nr_done; i < a->nr_extents; i++ )


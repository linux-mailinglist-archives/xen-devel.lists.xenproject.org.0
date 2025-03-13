Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B06A5F606
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 14:34:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912174.1318496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsihZ-0005vY-JI; Thu, 13 Mar 2025 13:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912174.1318496; Thu, 13 Mar 2025 13:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsihZ-0005ta-GH; Thu, 13 Mar 2025 13:34:21 +0000
Received: by outflank-mailman (input) for mailman id 912174;
 Thu, 13 Mar 2025 13:34:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsihY-00054A-8G
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 13:34:20 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd26f5e5-000f-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 14:34:18 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43d0782d787so8833465e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 06:34:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2af67sm20481095e9.26.2025.03.13.06.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 06:34:17 -0700 (PDT)
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
X-Inumbo-ID: dd26f5e5-000f-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741872858; x=1742477658; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/cFDH4BsF1WCIyJLCwf7ShUHdgAtkyNcWW6hhvurbhQ=;
        b=Q48VOlgvQXsYyX4BDU8e/qz8sJpMQkyG/v80fOQNt3U7+HChm5PXo3ORanD1lWyYcQ
         utZT/YQ5VZHXqIgwxozIHtFCk8rgsP0OArgRSgMjj3pyKaQLZjJ8DWjWNUfHYQiHd52j
         jB/L2PplPHqZGjt3+e/dnRm3mY0R5NPMXfTeYj6I4kFcwE7KsBcA/jPZ1Xfn0YJ29rgh
         OAjVa0YUKfWo7EKlYMlZHUbUrWtZOzsiH4PweRFVOB2ObCv6NmUtTM+OQsS1sOh1EMoz
         x6W7oGTLZ7eeY28ZWMp6KbgfGLcOkCm+ym6ax+6P4T+8VRycBqUTivmz5N7xDg0tslVd
         hCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741872858; x=1742477658;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cFDH4BsF1WCIyJLCwf7ShUHdgAtkyNcWW6hhvurbhQ=;
        b=Z2G5Bn+vZL+PAnk6pAhrlZHY5g+Rg5Y1D2hHoh29KH5laEi/vgZb8Cu/NSU9JhudR0
         c0+lKAX4m3VAgENd1WlTmpnfegUVJf0jGP7L4At1a9GO3OZjvNv3V59HlbAOxbC1d02f
         oWsA5lAx680yfso5q3C4PbcFYYE09C7s+x+WCOboj4Fi6C0s8S3l+HOyLZxMPbuGY9Dk
         qH4abFTdhiFwnDTNgzRrP0Q3EPEXvEe5mCBPma9Hc79WPm3upmfHD5BwZaB+QEXQnXZd
         CVJUKQNgJZCNrRbPNa81UZPN2a9wkg1D93x4R32xbSTSMZ3+KFx+vBZlAbAkTtiOic7W
         LrLg==
X-Gm-Message-State: AOJu0YweI9MTsixRiinkKZz5v7i45WJ6/GnaSOjS+JKyBVUhgf6Iekgs
	aB17gFBLAfxwyIWV91Sktgf5it41AXs/RXd6btfCIiKYEUw4diTG5iBp8Agq44F17blWDg50IA4
	=
X-Gm-Gg: ASbGncvBSV7iJnN2Ix1Hs7xLTgsDwT/Hyu+MpzOxFqICxhnyncbMPzlU1enOjHSZm2T
	zw8cE2/294586u9KXc+sTiZR0PfydU6wIcxcyQ1kf80xv7BiuUyAG4vUvKnYW7T12RG4ZZZuYFJ
	9R5POgAXuA0vAFPNP9Zrg5WOoyiCWVB9wPsQhOnafe+dzTE/c4WQY/bd1dmftV3O1vv5u3+zLD5
	WpzvqfbMwzr+NhOU1T/RYxH9a3B1W0UyuzGwCaMYWiUkliH9CQH8k3cZLfkwguPZHuzLKnb79lx
	0aDIrkcU+wxJwFCekE5mt0yQDhe90RJERTI0AiG5gLjLGOQLD+mv0VeN4HNzz3iHDVXOMWy0sj+
	OviZzhmFKoa4Ji+GJfBnEzwvc70FrWA==
X-Google-Smtp-Source: AGHT+IFInBjcEUX6YGaTOvYShhvblVrxOubP1v8/7fEIqiL2wpKZJJ1Sm4z4Yd2eH5Kw1c6PzyxFzQ==
X-Received: by 2002:a05:600c:1d1b:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-43cfcbc9883mr118885555e9.25.1741872857884;
        Thu, 13 Mar 2025 06:34:17 -0700 (PDT)
Message-ID: <6468c44a-772e-45a6-b712-0732c9017234@suse.com>
Date: Thu, 13 Mar 2025 14:34:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] VT-d: have set_msi_source_id() return a success indicator
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <8b610dba-0ce9-47ed-808d-035dc48f4f04@suse.com>
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
In-Reply-To: <8b610dba-0ce9-47ed-808d-035dc48f4f04@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Handling possible internal errors by just emitting a (debug-build-only)
log message can't be quite enough. Return error codes in those cases,
and have the caller propagate those up.

Drop a pointless return path, rather than "inventing" an error code for
it.

While touching the function declarator anyway also constify its first
parameter.

Fixes: 476bbccc811c ("VT-d: fix MSI source-id of interrupt remapping")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -436,15 +436,13 @@ void cf_check io_apic_write_remap_rte(
     __ioapic_write_entry(apic, pin, true, old_rte);
 }
 
-static void set_msi_source_id(struct pci_dev *pdev, struct iremap_entry *ire)
+static int set_msi_source_id(const struct pci_dev *pdev,
+                             struct iremap_entry *ire)
 {
     u16 seg;
     u8 bus, devfn, secbus;
     int ret;
 
-    if ( !pdev || !ire )
-        return;
-
     seg = pdev->seg;
     bus = pdev->bus;
     devfn = pdev->devfn;
@@ -485,16 +483,21 @@ static void set_msi_source_id(struct pci
                             PCI_BDF(bus, devfn));
         }
         else
+        {
             dprintk(XENLOG_WARNING VTDPREFIX,
                     "d%d: no upstream bridge for %pp\n",
                     pdev->domain->domain_id, &pdev->sbdf);
+            return -ENXIO;
+        }
         break;
 
     default:
         dprintk(XENLOG_WARNING VTDPREFIX, "d%d: unknown(%u): %pp\n",
                 pdev->domain->domain_id, pdev->type, &pdev->sbdf);
-        break;
-   }
+        return -EOPNOTSUPP;
+    }
+
+    return 0;
 }
 
 static int msi_msg_to_remap_entry(
@@ -509,7 +512,12 @@ static int msi_msg_to_remap_entry(
     bool alloc = false;
 
     if ( pdev )
-        set_msi_source_id(pdev, &new_ire);
+    {
+        int rc = set_msi_source_id(pdev, &new_ire);
+
+        if ( rc )
+            return rc;
+    }
     else
         set_hpet_source_id(msi_desc->hpet_id, &new_ire);
 



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAECB1033E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 10:18:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055432.1423856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uerA1-00039s-JN; Thu, 24 Jul 2025 08:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055432.1423856; Thu, 24 Jul 2025 08:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uerA1-00037l-GT; Thu, 24 Jul 2025 08:18:41 +0000
Received: by outflank-mailman (input) for mailman id 1055432;
 Thu, 24 Jul 2025 08:18:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uerA0-00037Z-JD
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 08:18:40 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cde71bda-6866-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 10:18:40 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4560d176f97so7196055e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 01:18:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fc6e694sm1405020f8f.26.2025.07.24.01.18.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 01:18:39 -0700 (PDT)
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
X-Inumbo-ID: cde71bda-6866-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753345119; x=1753949919; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDYBidlo9z9SuCfARfAozkzp336V9FGAk4OecVdaPOc=;
        b=T8Qz3Buwrajgigte4Ph18cXXu40Ty872o+D9RVrwYcuiYkqdgyxvTmJm02ueGN02wW
         Bo9q3TTHyFPZbCCTItwLmZUUf7ifuHU2XxWTFkGes6o0lcYyDltI4vEDgSl7l3NXWfdI
         5K8s/Fn0ePu1RuKFqgMfvVxHtMf+9U/McIISNY/gp+4umQCS3YaRLpC3uy/wdadmJcKm
         amNkPqLrR3a+vOUsIK4lY5p647KSHJmf/OFaALN3VQXV/YbZWBxmInxdXTt04e1wyxmn
         WgJOdzkCyXOvcscaqWKVg4FSYvMsr5vNR07MXvvt7U31fEYcVhVUfYNTOrOUeX5WMwkf
         zo0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753345119; x=1753949919;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VDYBidlo9z9SuCfARfAozkzp336V9FGAk4OecVdaPOc=;
        b=NRk1b+ZelH5uCls7tgSGhkIAnHhqfCFtlq9Uddd6b7kKbmoXjEMWSCW11NTEe/AhVF
         eHIxwAEd8xNGeeZqHj3KasdIXFidgwOl/Mfnh/N8vmFkMi2FzeICfGoeXGmyYDJtclAz
         Irt7+cNFl+vqBJyLtmm7vcsyhSPJN2DCanNCP3qKZoIr0bNta3kQhZBPqlGk/9HCrRjg
         JvECQojJC3bMOYW+yO1SJYgenUAvGFQOibt6YLn0F0VqAiIqzkUXdR4br0z8gPb0pjgp
         dC4WdTbikWAAwh1V6MeGV80Vdz2MeFV7Jn6Ms1elDlkiSGbCng0r5mtxj7s9phcui9dB
         Kc+Q==
X-Gm-Message-State: AOJu0YyT77Yx33M2Y4qb9KPD+SFj5ieuWbZLnxJK8coo1Qn8TSJAa0V5
	AEN0GT9mbczx/tKQNDOsCqIFU2BKKNvbmXZQQ/ikFbQs/+W6XLrE/wq2mHe3kMkTY08DBvrmvsQ
	pO4c=
X-Gm-Gg: ASbGncsPROEvuRGAj9hSGzI43o6OGr5MTBTYcZnWDK7lVxcE6jRbZFERiXc8YgbNRlV
	AIGSPBlpObwtuM6WfOstPeqhMvGSF7apikBML+lUUpM7wegZySWpCZgr8yT+Jo5vJbx7LAXrMB6
	SIU2W/UIILBipXNJLUo71RZQzxZB0gKH8VDmj+7iQrG8uClu8f6aLo73aBORQn9ZftQRneFPmj7
	uB/8HUs8NZZQ9t++wtmLj9ZeLmRLqgdTV5CMyfL8JgID6DsNLjBai308uuYRUsRqYHZA3zIUqn/
	fS/4QVBBkESFL6uKfeOc3qN0uV2H7OrAaOL935vs+rCQMHNSB5eRMn+YvqPb+oEX8MJyQwb7nsK
	Z14B1GjkIb17TudhDmmjEHo8bkbCftE0mB+O/bEVJzRYX/P6U+fI5rzdKux/14q+/lqkj2hWpvJ
	nW/tQj0BSd3HG/MOSOVg==
X-Google-Smtp-Source: AGHT+IGtCrB85k3uapWNe5YEjxX4JXh7wePELfS7hfg20dVWFEV+E/jrDIgCNe3pohf1yW+jD2qVYA==
X-Received: by 2002:a05:600c:3b2a:b0:456:10a8:ff7 with SMTP id 5b1f17b1804b1-45868d29cc5mr47749965e9.28.1753345119369;
        Thu, 24 Jul 2025 01:18:39 -0700 (PDT)
Message-ID: <5dce6693-0a04-4cac-8a68-929f9ae2c124@suse.com>
Date: Thu, 24 Jul 2025 10:18:37 +0200
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
Subject: [PATCH] video/lfb: switch to xv[mz]alloc*()
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

Use the more "modern" form, thus doing away with effectively open-coding
xmalloc_array() at the same time. While there is a difference in
generated code, as xmalloc_bytes() forces SMP_CACHE_BYTES alignment, if
code really cared about such higher than default alignment, it should
request so explicitly.

Also clear the pointers when freeing them.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Use xv[mz]alloc_array().

--- a/xen/drivers/video/lfb.c
+++ b/xen/drivers/video/lfb.c
@@ -7,6 +7,8 @@
 #include <xen/kernel.h>
 #include <xen/lib.h>
 #include <xen/errno.h>
+#include <xen/xvmalloc.h>
+
 #include "lfb.h"
 #include "font.h"
 
@@ -147,9 +149,10 @@ int __init lfb_init(struct lfb_prop *lfb
 {
     lfb.lfbp = *lfbp;
 
-    lfb.lbuf = xmalloc_bytes(lfb.lfbp.bytes_per_line);
-    lfb.text_buf = xzalloc_bytes(lfb.lfbp.text_columns * lfb.lfbp.text_rows);
-    lfb.line_len = xzalloc_array(unsigned int, lfb.lfbp.text_columns);
+    lfb.lbuf = xvmalloc_array(unsigned char, lfb.lfbp.bytes_per_line);
+    lfb.text_buf = xvzalloc_array(unsigned char,
+                                  lfb.lfbp.text_columns * lfb.lfbp.text_rows);
+    lfb.line_len = xvzalloc_array(unsigned int, lfb.lfbp.text_columns);
 
     if ( !lfb.lbuf || !lfb.text_buf || !lfb.line_len )
         goto fail;
@@ -165,8 +168,8 @@ fail:
 
 void lfb_free(void)
 {
-    xfree(lfb.lbuf);
-    xfree(lfb.text_buf);
-    xfree(lfb.line_len);
+    XVFREE(lfb.lbuf);
+    XVFREE(lfb.text_buf);
+    XVFREE(lfb.line_len);
     lfb.lfbp.lfb = ZERO_BLOCK_PTR;
 }


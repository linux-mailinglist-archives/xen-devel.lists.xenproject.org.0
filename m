Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20E2C571B4
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 12:10:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161008.1489033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJVDY-0008W5-5K; Thu, 13 Nov 2025 11:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161008.1489033; Thu, 13 Nov 2025 11:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJVDY-0008Tm-1w; Thu, 13 Nov 2025 11:10:20 +0000
Received: by outflank-mailman (input) for mailman id 1161008;
 Thu, 13 Nov 2025 11:10:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJVDW-00071B-Po
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 11:10:18 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 565afd64-c081-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 12:10:18 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b472842981fso81494066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 03:10:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fed80f0sm138517166b.66.2025.11.13.03.10.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 03:10:17 -0800 (PST)
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
X-Inumbo-ID: 565afd64-c081-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763032218; x=1763637018; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L0v3DkxT0rMrBP+phTdGWD9D4HrfyHtMTjxGYVRGi64=;
        b=azkMXHmthTNSE0JtAmQvjX/gZCm1wHvtfeJRgrPvz8Q/BAE5/vOuZhDOxRxXyPH3aA
         ONQ4ri0B+AZSsJadrxewwEqHGW7bHQq+Zsls9XI4U2d8HuI650JHGS+2SRVpUG1zP4B7
         yAk0nmuapOidv+owkDWda8DSRve2v3+mtfN04NHKftUG8J5o3Z0j6ikxV6bsKWMWinXR
         AImuyGpSFVFgJIQPA+XYyG3k1QdvxeNBZ23lfpCgZkmSa12Lcga4+FKt9Q5BU5uo2O+c
         p2oojfhlcf/UZR5Qt3tgrOZ40vhC7K8JE7p853IJBf0y7wbrm+uMaUlR2N9iiJ+lmqUT
         DCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763032218; x=1763637018;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0v3DkxT0rMrBP+phTdGWD9D4HrfyHtMTjxGYVRGi64=;
        b=iRA96084bRMM3tCUVYV0bQRsbc+ErRZ4R/2WIcyXDfz1Rzk5bnTIvda15C4BbQNnyL
         a0zDpPN2MrEs4tcuj0HwGBYOY3EYBBCstm1sMHAscvPDbemhtiDExb8gI0ZVX3mjVh2j
         ywquzyoh4KIC/NTNloWoemn3VbZxP/nbDae7QFG3vAOcDMZgIXTDZxvaPsp/OKiU2Je1
         6GYgi4xkOftDz8UCeQSZ2VIxTjnH3J9ux5PHc8SQXO9YqPD4FcrgilOQZaUBMECvrODU
         5HB3e8J6oh7zjGljAJMdVnsvu9XWQlSoWSSB1Vi5i99CPtBe1HwcRdpmnP28GeTDa+M+
         iF5w==
X-Gm-Message-State: AOJu0Yxw8rdoAu20S0DO5bWJXeqkFCpEwV3cz8IrJij3r/O/5E/jHhD2
	o650xibp3oec97NkBz/SnLLrFGWYrTah7CEzDGsluHwaShf1qGR3TnHlSRbaQp9baS7O0s53CjE
	8pdY=
X-Gm-Gg: ASbGncs///Am+kRKPw6rF6KAi+hNpH5rl4oNZysyg3NIFnaGw9WLVUX5UVCFe/4RTJq
	J7XXZFqa/zTMmHWY59a2I/Vs2+PlH1JRJv3DtY72oU6SsxIYkjifzBDaqijHFHsyTLn1lsXBZcX
	mPov2WTS0jkJUcadlMh1MZslOz6a8+hl4Tc6pDFntp1L3suLnxKSiv9dGXyziLmJWBr4+EZrALg
	TplGZl4q0FoJpM6Lez7q2lqIjr31aNU2uSQGJDfonDyAEpfRpnw2R4iP3GPBCEumXhy9frTFhBN
	4jh40SryS4yYQAgthqEhu+iuuQrkCNN/toiaqA69B58ph42JHlV1FPP2vDuuFMNlLqnM17+Jsdu
	y1sA4+cS0tnP+glYA8Drpl/oO3EpjW1R0RT+KA8/N/aucpqttD7YIvDfzJiwkMAI4IRxHSfO25r
	TRmpv7ts4pJgTIUv/R1tdRwSRS64TJLwLqrtMJbogNFGey979hy9xJqvn5kuUQNYJTMfzfPxO7p
	dY=
X-Google-Smtp-Source: AGHT+IFYExKU88g8Yz6PKEyLXWcACOU6b/Klwd/BLxiJMRvN18WS/41F60lg5t9Fl3F8UF/+Q81JaA==
X-Received: by 2002:a17:907:2d06:b0:b72:a40e:d10 with SMTP id a640c23a62f3a-b7331a6b9e5mr691249866b.40.1763032217422;
        Thu, 13 Nov 2025 03:10:17 -0800 (PST)
Message-ID: <bec55a88-00f3-4961-b1dc-5b9e38d94a32@suse.com>
Date: Thu, 13 Nov 2025 12:10:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/3] xhci-dbc: use brk_alloc()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <bdbb2884-c2d2-415a-8891-a598d112e34c@suse.com>
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
In-Reply-To: <bdbb2884-c2d2-415a-8891-a598d112e34c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This way the relatively large chunk of DMA buffers can be freed when the
driver isn't in use.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -27,6 +27,8 @@
 #include <xen/serial.h>
 #include <xen/timer.h>
 #include <xen/types.h>
+
+#include <asm/brk.h>
 #include <asm/fixmap.h>
 #include <asm/io.h>
 #include <asm/string.h>
@@ -1321,7 +1323,7 @@ static struct uart_driver dbc_uart_drive
 };
 
 /* Those are accessed via DMA. */
-struct dbc_dma_bufs {
+struct __aligned(PAGE_SIZE) dbc_dma_bufs {
     struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
     struct xhci_trb out_trb[DBC_TRB_RING_CAP];
     struct xhci_trb in_trb[DBC_TRB_RING_CAP];
@@ -1335,8 +1337,7 @@ struct dbc_dma_bufs {
      * DMA-reachable by the USB controller.
      */
 };
-static struct dbc_dma_bufs __section(".bss.page_aligned") __aligned(PAGE_SIZE)
-    dbc_dma_bufs;
+DEFINE_BRK(xhci, sizeof(struct dbc_dma_bufs));
 
 static int __init cf_check xhci_parse_dbgp(const char *opt_dbgp)
 {
@@ -1413,24 +1414,33 @@ void __init xhci_dbc_uart_init(void)
 {
     struct dbc_uart *uart = &dbc_uart;
     struct dbc *dbc = &uart->dbc;
+    struct dbc_dma_bufs *dma_bufs;
 
     if ( !dbc->enable )
         return;
 
-    dbc->dbc_ctx = &dbc_dma_bufs.ctx;
-    dbc->dbc_erst = &dbc_dma_bufs.erst;
-    dbc->dbc_ering.trb = dbc_dma_bufs.evt_trb;
-    dbc->dbc_oring.trb = dbc_dma_bufs.out_trb;
-    dbc->dbc_iring.trb = dbc_dma_bufs.in_trb;
-    dbc->dbc_owork.buf = dbc_dma_bufs.out_wrk_buf;
-    dbc->dbc_iwork.buf = dbc_dma_bufs.in_wrk_buf;
-    dbc->dbc_str = dbc_dma_bufs.str_buf;
+    dma_bufs = brk_alloc(sizeof(*dma_bufs));
+    if ( !dma_bufs )
+    {
+        dbc->enable = false;
+        printk(XENLOG_ERR "XHCI: not enough BRK space available\n");
+        return;
+    }
+
+    dbc->dbc_ctx = &dma_bufs->ctx;
+    dbc->dbc_erst = &dma_bufs->erst;
+    dbc->dbc_ering.trb = dma_bufs->evt_trb;
+    dbc->dbc_oring.trb = dma_bufs->out_trb;
+    dbc->dbc_iring.trb = dma_bufs->in_trb;
+    dbc->dbc_owork.buf = dma_bufs->out_wrk_buf;
+    dbc->dbc_iwork.buf = dma_bufs->in_wrk_buf;
+    dbc->dbc_str = dma_bufs->str_buf;
 
     if ( dbc_open(dbc) )
     {
         iommu_add_extra_reserved_device_memory(
-                PFN_DOWN(virt_to_maddr(&dbc_dma_bufs)),
-                PFN_UP(sizeof(dbc_dma_bufs)),
+                PFN_DOWN(virt_to_maddr(dma_bufs)),
+                PFN_DOWN(sizeof(*dma_bufs)),
                 uart->dbc.sbdf,
                 "XHCI console");
         serial_register_uart(SERHND_XHCI, &dbc_uart_driver, &dbc_uart);



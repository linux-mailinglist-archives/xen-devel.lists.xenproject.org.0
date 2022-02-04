Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077154A9410
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 07:35:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265005.458278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBX-0008Vm-9M; Fri, 04 Feb 2022 06:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265005.458278; Fri, 04 Feb 2022 06:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBX-0008PB-43; Fri, 04 Feb 2022 06:35:07 +0000
Received: by outflank-mailman (input) for mailman id 265005;
 Fri, 04 Feb 2022 06:35:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tguk=ST=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nFsBV-0008DX-E1
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 06:35:05 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95396f71-8584-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 07:35:03 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id z4so10781282lft.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Feb 2022 22:35:03 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id f34sm163027lfv.165.2022.02.03.22.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 22:35:01 -0800 (PST)
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
X-Inumbo-ID: 95396f71-8584-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nEZ0S5ylp2hVxPb59duUWX5SgzLrq0RrV7CsGFnmgls=;
        b=ljHuqvmKZbx3pFGEj/9BQ+VGUO0+7SGsf8IYTF0oPk5K7zJA+Zr6P+5sPWUUM3wNcm
         uFX87jQNZi3n/maFzKdEA/l/k2sUOk4VpkAjR909ZkhY72pxTXP2Fyn9dWwaRJkMBUPl
         eOMzJLCi+HMPk+E6eEuqNzWx1aQ4UEu12T0cOs1IUIiywh3ZkboZbkDy5X62/60XjssH
         yFzcne58IqIbGWH6pXBQlFnMX7cbxGetb8lKBVjz4H39Rg0MYKcbag/jFj4OnVqEtZdV
         jf/JsKtTUOIEixmw3rh/gOqAoJREqDDSbHMwWxPDzYh173+NMq0yFXxf3fbLCROk3AnB
         QbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nEZ0S5ylp2hVxPb59duUWX5SgzLrq0RrV7CsGFnmgls=;
        b=zOtFIaLgqCPJHjfoO6CUfXTuQm1xvwAdEPk9uf0qEU1QUnChXnWNYEmm0p+Cgnv6PA
         AXVwXYlJZEIJbm64tjNafNykRWDmniXtpst7ACOPpPhxZxTjZneCWITRMr7hh0OZuv9t
         sMDADbzkz5/TSWsYAhBYh8FhKssNP+fUDAXteHWFDYUn5PQWx4w7WhaMiwx8LNvExVyZ
         HJ7lrbWOO3/6m65PmYzIPHd4B+de8XGuQZ+UFTE8e+qkZx4hZiGxnJZLJwP4E9fBs6F1
         eC9d6Khd+peZgkGpDY64JnpKA047tNliFly4agCSchw3/vx84Y2hA1zuhVM0LVQYcsRh
         pRrg==
X-Gm-Message-State: AOAM533EpdA17k7ga4xjQ1m2zWQ/bqdSIClwC1kj47yo5HqN/w7bL2Qd
	QYb4C5tOFcdbyhjoQEAZ8MNxuWowOxo=
X-Google-Smtp-Source: ABdhPJyb52ecDgdNTkD06qSr2ws0sAPXn71t/8qeE3T7ubzYIIgJyTlltqbfnCKWdc26bSW7BjWMnQ==
X-Received: by 2002:a05:6512:2354:: with SMTP id p20mr1320036lfu.215.1643956502200;
        Thu, 03 Feb 2022 22:35:02 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	artem_mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v6 01/13] xen/pci: arm: add stub for is_memory_hole
Date: Fri,  4 Feb 2022 08:34:47 +0200
Message-Id: <20220204063459.680961-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204063459.680961-1-andr2000@gmail.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add a stub for is_memory_hole which is required for PCI passthrough
on Arm.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
New in v6
---
 xen/arch/arm/mm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index b1eae767c27c..c32e34a182a2 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1640,6 +1640,12 @@ unsigned long get_upper_mfn_bound(void)
     return max_page - 1;
 }
 
+bool is_memory_hole(mfn_t start, mfn_t end)
+{
+    /* TODO: this needs to be properly implemented. */
+    return true;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.25.1



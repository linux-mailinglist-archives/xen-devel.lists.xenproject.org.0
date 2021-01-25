Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0C3302B24
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 20:09:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74299.133541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47Ee-00008y-Mh; Mon, 25 Jan 2021 19:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74299.133541; Mon, 25 Jan 2021 19:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47Ee-00008G-HB; Mon, 25 Jan 2021 19:09:12 +0000
Received: by outflank-mailman (input) for mailman id 74299;
 Mon, 25 Jan 2021 19:09:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTVL=G4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l47Ec-0008N7-GC
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 19:09:10 +0000
Received: from mail-wm1-x32c.google.com (unknown [2a00:1450:4864:20::32c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a001e2ed-890d-44c7-a0c3-1544d1748298;
 Mon, 25 Jan 2021 19:08:56 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id m187so387134wme.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jan 2021 11:08:56 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k6sm12991031wro.27.2021.01.25.11.08.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 11:08:54 -0800 (PST)
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
X-Inumbo-ID: a001e2ed-890d-44c7-a0c3-1544d1748298
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OsLFEZreg7YqeEEhgK+SjAQbSMvohSeO9g6je9KBEsI=;
        b=T9dfsa7gmJ7W9ij7E90dOw8sQ/oEP/vrOLg+A0tjx3SjZX4SrPb2qHgRYjl0PEz4Kk
         rk7w2UJWqOUt/sUs8II+69Lyx4U5q/TgT3A9isaOt4HDH8XvXgVZE8LWQYEHT/kjA9Y/
         sGc0/fc6a4BPVVORdbe7QgkGTNbU7K69s19JY/LIxU1TC2W4YasNYnJILuy7XcfdFA/t
         k18laMJGxy+Rfd/iXdogqLPOyge+FU+fWAd6TpRcAsh2ALXeaLhDDLXtVt6OXOEJ62q4
         yAxveXM2N0oVD+c/yemTrUIUSJz2dTKdFsgVaur6CH6YVjHfCqzjhtEpwpr5XgO9ZBXF
         dbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OsLFEZreg7YqeEEhgK+SjAQbSMvohSeO9g6je9KBEsI=;
        b=spEGlAgaZxCOjcV89sijeFe7qmeShWouMkvL9HB64lq9++5RkAdzTO62wLq9CVCD1F
         vVtXoc1EvdgDvKuUs1pIb4YBDKNtCd6K//Ivx6QIcYQzEv3Y/4PjcQmitLZZv458xjmp
         VLIHFoLAy5Htb6Jv4vsgmsapt/4p71XT7ElVFq07T1gnn5AaopOUNNm/fj9MrRJLa/4d
         jAdtj3+6/J49hbMB2p5Q3KKhLCBs7XFBw5s1HTrzFll+L8ZcYK7pWQfJ39kBpU58ZgVj
         7EdQTu+21mIocOuuXto/7jPNsND24/6fI6yjOAwelqjvCbZVvtbeMdlkwFdUW+nDrjYV
         ME9A==
X-Gm-Message-State: AOAM531kRpOWOYMGGaVDkotLwOOdtvXRS1NAUzDLWeprhfG1gK4uQSqA
	x0UgjeqBzATNr2beYUAqECyjIXJ7Q2wdLg==
X-Google-Smtp-Source: ABdhPJwicXK5X8XYRb1eHofoVzV3U5TxlFZM1E98xbSQrWkgmoNYx3frsyt+PgqQkKp03Nm5JT78/g==
X-Received: by 2002:a7b:c09a:: with SMTP id r26mr1494547wmh.64.1611601735366;
        Mon, 25 Jan 2021 11:08:55 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V5 03/22] x86/ioreq: Provide out-of-line wrapper for the handle_mmio()
Date: Mon, 25 Jan 2021 21:08:10 +0200
Message-Id: <1611601709-28361-4-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The IOREQ is about to be common feature and Arm will have its own
implementation.

But the name of the function is pretty generic and can be confusing
on Arm (we already have a try_handle_mmio()).

In order not to rename the function (which is used for a varying
set of purposes on x86) globally and get non-confusing variant on Arm
provide a wrapper arch_ioreq_complete_mmio() to be used on common
and Arm code.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Paul Durrant <paul@xen.org>
CC: Julien Grall <julien.grall@arm.com>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch

Changes V1 -> V2:
   - remove "handle"
   - add Jan's A-b

Changes V2 -> V3:
   - remove Jan's A-b
   - update patch subject/description
   - use out-of-line function instead of #define
   - put earlier in the series to avoid breakage

Changes V3 -> V4:
   - add Jan's R-b
   - rename ioreq_complete_mmio() to arch_ioreq_complete_mmio()

Changes V4 -> V5:
   - rebase
   - add Alex's, Julien's and Paul's R-b
---
---
 xen/arch/x86/hvm/ioreq.c | 7 ++++++-
 xen/include/xen/ioreq.h  | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 27a4a6f..30e8724 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -36,6 +36,11 @@
 #include <public/hvm/ioreq.h>
 #include <public/hvm/params.h>
 
+bool arch_ioreq_complete_mmio(void)
+{
+    return handle_mmio();
+}
+
 static void set_ioreq_server(struct domain *d, unsigned int id,
                              struct hvm_ioreq_server *s)
 {
@@ -226,7 +231,7 @@ bool handle_hvm_io_completion(struct vcpu *v)
         break;
 
     case HVMIO_mmio_completion:
-        return handle_mmio();
+        return arch_ioreq_complete_mmio();
 
     case HVMIO_pio_completion:
         return handle_pio(vio->io_req.addr, vio->io_req.size,
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index d0980c5..b95d3ef 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -24,6 +24,7 @@
 #define HANDLE_BUFIOREQ(s) \
     ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
 
+bool arch_ioreq_complete_mmio(void);
 bool arch_vcpu_ioreq_completion(enum hvm_io_completion io_completion);
 int arch_ioreq_server_map_pages(struct hvm_ioreq_server *s);
 void arch_ioreq_server_unmap_pages(struct hvm_ioreq_server *s);
-- 
2.7.4



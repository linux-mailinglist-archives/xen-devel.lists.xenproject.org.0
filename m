Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D860AE5F22
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 10:27:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023333.1399297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTz03-0007WO-2F; Tue, 24 Jun 2025 08:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023333.1399297; Tue, 24 Jun 2025 08:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTz02-0007Uv-Vh; Tue, 24 Jun 2025 08:27:26 +0000
Received: by outflank-mailman (input) for mailman id 1023333;
 Tue, 24 Jun 2025 08:27:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LEHU=ZH=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uTz01-0007Un-85
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 08:27:25 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e22a3d3-50d5-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 10:27:24 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-553bcba4ff8so5148558e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 01:27:24 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e414c2aasm1728209e87.55.2025.06.24.01.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 01:27:22 -0700 (PDT)
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
X-Inumbo-ID: 0e22a3d3-50d5-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750753644; x=1751358444; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bTAXSifYpKVVsl3+dj7jPUHgCEs/mNfGsj01sXZJxbY=;
        b=LqluetwuNPmQWZNU3k4lqY4XuRAXqZBGUXe3MYt18OS2RMUMRhfU0C01cBDKjhYJMF
         r0Td64UxPbm2nCyaXOeC+zlc5GhJPjrN6UQssdUnUB05mv+Hpsx/48rf3c3WPuUewk50
         v+lKUAvDt9gsIVaoZ1PSYxO8Jmfj5/s/750FEZRpGg59OgII8vttQAbwS8WB5i+r3AJf
         owk4qF8RfdDOQb+2365+sEctXQvMRA5idPVhiQ+ey9XMmRIboZWcc3STgv2uzDWyslsl
         5p2R8RIlrJAXr3sSkJ7v0OMBnpYXQEgqXZ02S/2PsLhPA/xxexXaXyP8pCAAnwcMFU6A
         JgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750753644; x=1751358444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTAXSifYpKVVsl3+dj7jPUHgCEs/mNfGsj01sXZJxbY=;
        b=l+QL7IBtmUVfzamicL2ncL4BsBWqP8KLKsY8vfVj1PNOvHavF4WmOUlN3MoRoti8yn
         fXrEygKHSVpRl5vWrddxGjlCothD335i1EaTVtf4VFVfCjCzMnwA4GxVEN5Dqg7veHsq
         jlg5eWUMt3bTu2IupX7ZZCWYMjzkGXSAGMPccxwIF+4N5td8fAJTfdAuWKDukWJL5wxq
         awHINDwCuDjk8X9n/u2/3GkIef9YwpSXeAUShXQ5NahrzA1VTyApJT9aELkQfv6oVxZf
         BioeZxCv1erKbpNIICgIcbTbe6lNtYxKgn4CjEkiRUPe8Jg1sl78RCS+IbymFCYCScw1
         Rb+g==
X-Gm-Message-State: AOJu0YxeTgclFsUBa8DCZF2NPvN1k/yD328UMzTXVkZyY6rJXudX1VTZ
	2GtOKcj+/cSlULgsCbUn9qhyTDsIHgptnkOSAhzIv1YTM2vAyKYVAQHn9De9Qg2ZWko=
X-Gm-Gg: ASbGncuO7BJBhH/EC3AKzGkDFdap1AXXDik+a5RP+91ivVD/8mRIA/sdfv3JNMY0HpW
	WvhWF9dcA6rauWbScZ6gg+cpS886Py5PkD3978qShiEaV0hcMXjiMA6JZW6Lo8to4tDUVLSExPR
	D2VtmIWcBeFKBWAkbc8MGNnGq5QxQKtDHvIXlsyO/BWfXes+3Xrwd7Z86BxxfCEeOP9Nt9mqMd/
	lRAj30pJneaOBuroMBEDdf47LR0VrMp5LE7r7XtMAve340u/V6FKVxovIjsSeQpEMxUdFL3vT+h
	RnPGVumBXBoNii00wIqWvLvV5PKDAPLlZSzA3xbKXIOWsXKnc41hjnG1Sfi5JP2bAYtx2A7bFXy
	EzxvGElPoAEd3/C6ghX1QzdOdug==
X-Google-Smtp-Source: AGHT+IEYxeXLaimuOjL//P1be+9wjvf8JP85KsTj4iF0g6PW9mduNTiv6q/MMDzYNehBPxFOw3cy8Q==
X-Received: by 2002:a05:6512:224b:b0:553:ce07:de8e with SMTP id 2adb3069b0e04-553e3c053e8mr4889291e87.42.1750753643308;
        Tue, 24 Jun 2025 01:27:23 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] xen/common: Guard freeze/thaw_domains functions with CONFIG_SYSTEM_SUSPEND
Date: Tue, 24 Jun 2025 11:27:20 +0300
Message-ID: <b7f35a20342dace6e107c4c358514c304f0bf0dd.1750753310.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

This patch adds CONFIG_SYSTEM_SUSPEND guards around freeze_domains
and thaw_domains functions.

This ensures they are only compiled into the hypervisor when the system
suspend functionality is enabled, aligning their inclusion with their
specific use case.

This addresses two Misra Rule 2.1 violations.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v2: Mentioned that this patch fixes a MISRA rule violation
in the commit message after review, and added the Reviewed-by tag
---
 xen/common/domain.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8c8f70347a..303c338ef2 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -2411,6 +2411,8 @@ domid_t get_initial_domain_id(void)
     return 0;
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
 void freeze_domains(void)
 {
     struct domain *d;
@@ -2436,6 +2438,8 @@ void thaw_domains(void)
     rcu_read_unlock(&domlist_read_lock);
 }
 
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /*
  * Local variables:
  * mode: C
-- 
2.48.1



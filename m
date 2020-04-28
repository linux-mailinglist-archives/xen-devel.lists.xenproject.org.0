Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 163061BB4F9
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 06:07:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTHWM-0001Ku-CM; Tue, 28 Apr 2020 04:06:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vxmr=6M=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTHWK-0001Iw-3t
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 04:06:56 +0000
X-Inumbo-ID: 9e6a4e92-8905-11ea-9887-bc764e2007e4
Received: from mail-qv1-xf43.google.com (unknown [2607:f8b0:4864:20::f43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e6a4e92-8905-11ea-9887-bc764e2007e4;
 Tue, 28 Apr 2020 04:06:21 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id y19so9757487qvv.4
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 21:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tSVk0kCBf7n4qF0esOSMv85t4GqldCzE2h0PjonxwNo=;
 b=tb3C2eJPTwYyxOnSmKGXZljy6Xj8fMhjs5HuQD8Vo64C3gCYuL18KIppYOHXsYwK7S
 9MlT9sfKYnoL164NSLh0g6nALsr6TQLbIT5Z2v0NJr2du8KnF0ipA624WA5okByRMqq8
 suG1EkswxIIiMTevCVjug9Jd1YYMRxRWK/E6+kwITZef1w/hcKo2Bqtdu2DThZwJC7Qd
 MPnmf0qOCrzws/GMBLD/u+mm9eoezCeUVSMG4LRCY3xIz0eOgWm/R1dFNyzAc7bogJa0
 c4Z9mXQcIDTqcU6jL7yB8uCpOcU/Kue6I2mQHzlW3Y2fuq7ybh95BI57VZi25QTcxmnQ
 6rdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tSVk0kCBf7n4qF0esOSMv85t4GqldCzE2h0PjonxwNo=;
 b=cVcmxGvUqxisn40Y+HCmsk+ESt2+nZFpw511vF3NMncUwnVdqPcgpQDNINeoxJq1Pf
 qWjsK3JtjV828HfwwFlNZUp4f1hBTx/LQNw54oB2WEHgUQUyt7SwVUzCr5T9LGfTpZZh
 10WvZ7RnsoFJcTQ90QEdVf2fMQfiSlXREZg4QR/kwbwldmpboRQ36kk/qHhViYoa2A+D
 VLdwfkcwLvPMIWqNTXNS4Owu/FrtfsGHioHDLpnCDwoOj/XU2CgfiIq7IBPJg8IfS+Rl
 Btlpwu4G1gaCVrpWisybvGGtftPnp9pmUlP2Br6lQvV8h2rMZb3N37yZArTZ/f1qhdA9
 jmBQ==
X-Gm-Message-State: AGi0PuYqG2kLqTMemEywuf2p6QN9ehtKBWzmf4F8ZXsynXtsFh6c6JJm
 1wJ9qlPsI8copSYHlS7oP++Dw/AY
X-Google-Smtp-Source: APiQypKCttcK2Qg1o1j3J3JV4xEZ+88l5p38LSqrSIpq5oCLR1KYCeyyYSPJ6jK6YDCgqvheDVdG6w==
X-Received: by 2002:a0c:da0e:: with SMTP id x14mr26232279qvj.47.1588046780850; 
 Mon, 27 Apr 2020 21:06:20 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:f1d1:23b9:fc94:a1a9])
 by smtp.gmail.com with ESMTPSA id v2sm13445480qth.66.2020.04.27.21.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 21:06:20 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 18/21] libxl: Check stubdomain kernel & ramdisk presence
Date: Tue, 28 Apr 2020 00:04:30 -0400
Message-Id: <20200428040433.23504-19-jandryuk@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200428040433.23504-1-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Just out of context is the following comment for libxl__domain_make:
/* fixme: this function can leak the stubdom if it fails */

When the stubdomain kernel or ramdisk is not present, the domid and
stubdomain name will indeed be leaked.  Avoid the leak by checking the
file presence and erroring out when absent.  It doesn't fix all cases,
but it avoids a big one when using a linux device model stubdomain.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libxl/libxl_dm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index 5d61da1de8..a57c13bdf4 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -2316,6 +2316,22 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
         dm_config->num_vkbs = 1;
     }
 
+    if (guest_config->b_info.stubdomain_kernel &&
+        access(guest_config->b_info.stubdomain_kernel, R_OK) != 0) {
+        LOGED(ERROR, guest_domid, "could not access stubdomain kernel %s",
+              guest_config->b_info.stubdomain_kernel);
+        ret = ERROR_INVAL;
+        goto out;
+    }
+
+    if (guest_config->b_info.stubdomain_ramdisk &&
+        access(guest_config->b_info.stubdomain_ramdisk, R_OK) != 0) {
+        LOGED(ERROR, guest_domid, "could not access stubdomain ramdisk %s",
+              guest_config->b_info.stubdomain_ramdisk);
+        ret = ERROR_INVAL;
+        goto out;
+    }
+
     stubdom_state->pv_kernel.path = guest_config->b_info.stubdomain_kernel;
     stubdom_state->pv_ramdisk.path = guest_config->b_info.stubdomain_ramdisk;
 
-- 
2.20.1



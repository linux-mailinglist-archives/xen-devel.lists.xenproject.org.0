Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 622791BB4F8
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 06:07:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTHWH-0001F1-1o; Tue, 28 Apr 2020 04:06:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vxmr=6M=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTHWF-0001DT-3g
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 04:06:51 +0000
X-Inumbo-ID: 9d2d764e-8905-11ea-b9cf-bc764e2007e4
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d2d764e-8905-11ea-b9cf-bc764e2007e4;
 Tue, 28 Apr 2020 04:06:19 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id 20so20510772qkl.10
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 21:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RNheJoXDK0K0JeJe6uhrnBacMxojGYzO1+cdpKez/ow=;
 b=WF44xZ98MbEqysIwXm59CFTp7aVINuuJNv49m5uht/uEANPnERO56jm3GpsAysKbpp
 u5GIEPaV4UCT/QZXDhHMriZYU6011lernF5uW+ohugKx5G44zXnSN8ZByu7OWQpHXRkL
 u7Inx1zus8PDNMjAu0Dysd7egNcSc4xA92TpeZitx5E4fN1bYilHbHABK5olfjgis1EG
 cf5Vc34F96HxiNUYtPXN75X5Xa/iHdt8JAeys/zcXKdpSR2zpc2diqkbKJ4Z+WPWaOvf
 /zdS2Qk3sG/+dchcPINlOHQaP+C5vQ36JgllafTIn5V8CHjaYHFrjjrnxB5rzHcb/m33
 WdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RNheJoXDK0K0JeJe6uhrnBacMxojGYzO1+cdpKez/ow=;
 b=mlgOyzwVCXw1auTsyzmRMeE8ro4j0Y1yVQUZ7Dli8e3aZyowm1fTq3+oLTYVmDrshm
 ME9TxU4mwvr/AVdkiN3ITS6LRaVhmFwx3lrRkWWsRhgaWRxd9A6QLDkGStbsHytpkjaw
 PrcGjnh8vh9lkaHxLNBRqZypHloJHpvnTNRxKs03A+ogmzW1fjHU2tO9mfdOnlIO6TCF
 1LppCLCNm/z9Vn7KmgGAUrKNeuyMLG1Tdi0DL2K/VmAyZM3rIRvFHxLKiEGzGkBW4ynV
 C2X35sP84SQm6tMUoNwQ+lxiGZoj6F3KjEBx+dpoEEQpG3Eng3/uZ11hycBLHV5/LxbV
 8UOg==
X-Gm-Message-State: AGi0PubKwC+i69Rv7wtzPESt00DhtmHmJ0bMebc1o5Zav9dL/YWPZzBb
 Nyg4DwNeGixaNXzZvl//nN6ne4W0
X-Google-Smtp-Source: APiQypKTQrnyHkhvu7IhjdgEeifBCZzOtEu99tsC1xbisqoyyUiV5TFZ2REIzDzPQ9iZAzsOuVpVMw==
X-Received: by 2002:a05:620a:13b5:: with SMTP id
 m21mr25161994qki.208.1588046778722; 
 Mon, 27 Apr 2020 21:06:18 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:f1d1:23b9:fc94:a1a9])
 by smtp.gmail.com with ESMTPSA id v2sm13445480qth.66.2020.04.27.21.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 21:06:17 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 17/21] docs: Add device-model-domid to xenstore-paths
Date: Tue, 28 Apr 2020 00:04:29 -0400
Message-Id: <20200428040433.23504-18-jandryuk@gmail.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Document device-model-domid for when using a device model stubdomain.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 docs/misc/xenstore-paths.pandoc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/misc/xenstore-paths.pandoc b/docs/misc/xenstore-paths.pandoc
index a152f5ea68..766e8008dc 100644
--- a/docs/misc/xenstore-paths.pandoc
+++ b/docs/misc/xenstore-paths.pandoc
@@ -148,6 +148,11 @@ The domain's own ID.
 The process ID of the device model associated with this domain, if it
 has one.
 
+#### ~/image/device-model-domid = INTEGER   [INTERNAL]
+
+The domain ID of the device model stubdomain associated with this domain,
+if it has one.
+
 #### ~/cpu/[0-9]+/availability = ("online"|"offline") [PV]
 
 One node for each virtual CPU up to the guest's configured
-- 
2.20.1



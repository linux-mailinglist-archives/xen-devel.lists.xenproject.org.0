Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 656341A60CD
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2020 00:03:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jNkgw-0003Gh-UV; Sun, 12 Apr 2020 22:03:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6Dwh=54=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jNkgv-0003GM-Jg
 for xen-devel@lists.xenproject.org; Sun, 12 Apr 2020 22:03:01 +0000
X-Inumbo-ID: 597b2f70-7d09-11ea-83d8-bc764e2007e4
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 597b2f70-7d09-11ea-83d8-bc764e2007e4;
 Sun, 12 Apr 2020 22:02:49 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id z90so5859322qtd.10
 for <xen-devel@lists.xenproject.org>; Sun, 12 Apr 2020 15:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=xQseH+w2yE4yJYVdULOAupSEFUC15dIoKjSVtzW1RYQ=;
 b=mbXds/yMXXI77oozv1GEuKTLmqLlNMAuQy5DVvhXLICyJHvTtY/UBdkRokROlrE5iu
 ZZg4GrhROG5Aan+JfINU5GFQWhgErhwCAi7xcsj4m55nmWOpFSrkB2u7rY3KWAusdXuR
 XZErv2fJ0Jut+rjwSbd8tBDO9H+zCBFH+oNY+hOnyAYPjKlxDAglE3gAnu4a7NBU8s+7
 tF342TiNmwKvsMG2apnmqUyxALTHOaro2HI41a/EFWeZcQpWLeMlD2USNh3BpcZ47Tqj
 Gmebw/A5qgWNivdalS8VnZy62AHTOlnCpt0EDd3PB3znoZJ9wtMDzrgxxiHNTQNd3EQb
 aAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=xQseH+w2yE4yJYVdULOAupSEFUC15dIoKjSVtzW1RYQ=;
 b=lx58xuDUR7Nohsqs/Bxt30Jr9+tvusQ6dZ6bfc7zb44sBkyv8/F3ZYsTdQr5GOCYTa
 vbPsex0jLSahZ242UcA42tylGmIM/iOnO5P1oScDVwamieQDbLFFuIgzdl1jPLwC0S5N
 loycoacAo4jisazzg2KPRccYB87r7441wjbyikN/clPSLa5JBbP28b1wFdHrff9xZtT/
 yXq7foFiKOst/WiduSNQlpU3Dova2T6o773R2y2UhgfAvggbGfqBw+Lxgk8rYWy9ZM2A
 BUQtxDkzOX1pu7pZlYadQplb//osnh8t5HeSSPiUSdVGmLe1ERQg8kfM+mF05eap02Zc
 2sbQ==
X-Gm-Message-State: AGi0PubBP5zaFYg5ge7OM6B1RiQu9li5X++U5uZRSOe4QDja3NjeOPH6
 0H3JCpRzK1RmR5vAjTJhsqfX7q6o
X-Google-Smtp-Source: APiQypIacsGj1YC3T0eoqwBQppzvgi5VJQQlNAtetUcTtfDHNvyORLAg2oT9k2X/6y9Ww/MHRv7E5w==
X-Received: by 2002:ac8:6d23:: with SMTP id r3mr8470311qtu.84.1586728969148;
 Sun, 12 Apr 2020 15:02:49 -0700 (PDT)
Received: from four.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id
 s14sm3691128qts.70.2020.04.12.15.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:02:48 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 3/4] golang/xenlight: add DevicePciAdd/Remove wrappers
Date: Sun, 12 Apr 2020 18:02:41 -0400
Message-Id: <7f03220c9db0a377cd26c0c96d8a10981ec47282.1586727061.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1586727061.git.rosbrookn@ainfosec.com>
References: <cover.1586727061.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1586727061.git.rosbrookn@ainfosec.com>
References: <cover.1586727061.git.rosbrookn@ainfosec.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add DevicePciAdd and DevicePciRemove as wrappers for
libxl_device_pci_add and libxl_device_pci remove.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/xenlight.go | 34 +++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
index a56f913b81..c94b046667 100644
--- a/tools/golang/xenlight/xenlight.go
+++ b/tools/golang/xenlight/xenlight.go
@@ -1102,3 +1102,37 @@ func (Ctx *Context) DeviceNicRemove(domid Domid, nic *DeviceNic) error {
 
 	return nil
 }
+
+// DevicePciAdd is used to passthrough a PCI device to a domain.
+func (Ctx *Context) DevicePciAdd(domid Domid, pci *DevicePci) error {
+	var cpci C.libxl_device_pci
+
+	if err := pci.toC(&cpci); err != nil {
+		return err
+	}
+	defer C.libxl_device_pci_dispose(&cpci)
+
+	ret := C.libxl_device_pci_add(Ctx.ctx, C.uint32_t(domid), &cpci, nil)
+	if ret != 0 {
+		return Error(ret)
+	}
+
+	return nil
+}
+
+// DevicePciRemove removes a PCI device from a domain.
+func (Ctx *Context) DevicePciRemove(domid Domid, pci *DevicePci) error {
+	var cpci C.libxl_device_pci
+
+	if err := pci.toC(&cpci); err != nil {
+		return err
+	}
+	defer C.libxl_device_pci_dispose(&cpci)
+
+	ret := C.libxl_device_pci_remove(Ctx.ctx, C.uint32_t(domid), &cpci, nil)
+	if ret != 0 {
+		return Error(ret)
+	}
+
+	return nil
+}
-- 
2.17.1



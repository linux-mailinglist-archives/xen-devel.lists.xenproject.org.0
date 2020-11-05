Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5722A8551
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 18:53:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19961.45511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kajR5-0000MF-8E; Thu, 05 Nov 2020 17:52:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19961.45511; Thu, 05 Nov 2020 17:52:35 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kajR5-0000Ll-4g; Thu, 05 Nov 2020 17:52:35 +0000
Received: by outflank-mailman (input) for mailman id 19961;
 Thu, 05 Nov 2020 17:52:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWoZ=EL=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1kajR3-0000K9-Ck
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 17:52:33 +0000
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8fea320-2561-47f5-ad9b-5906052258ac;
 Thu, 05 Nov 2020 17:52:31 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b8so2802604wrn.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 09:52:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e6sm3707860wrs.7.2020.11.05.09.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 09:52:15 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D505B1FF9B;
 Thu,  5 Nov 2020 17:51:54 +0000 (GMT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aWoZ=EL=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
	id 1kajR3-0000K9-Ck
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 17:52:33 +0000
X-Inumbo-ID: f8fea320-2561-47f5-ad9b-5906052258ac
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f8fea320-2561-47f5-ad9b-5906052258ac;
	Thu, 05 Nov 2020 17:52:31 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b8so2802604wrn.0
        for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 09:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S2GIs58/W24s0fp90d9pmy8FUWIlpMCzYhDdwe9s8Gc=;
        b=y8VYfJKIVgovo9dlAt6OJzV2fWsBxN2k3Qtrdb4hD1XgOw6zMwhgc41Dig59hy8yaH
         O1kh16ITKRkR907lC8Js4Ia8jgKPNg5sUs0krQPcEwDAT3Z2C5HTiuetC+S36lkiAVZx
         bofeE7M1HpcodfKTdRNYMmbUyAPkKzHAI6Ed7yK0gieBk6E84RYpJpRJTVzlnKDN04D8
         qCxKR2hB3CbQkoutSoQqNta1PJIj1EpW8SSRQAaCqvWCSV3wgJ0heclI8x2ItRF6Wbwj
         9iR7hjEF4+AEsU0s00PT1p1dLSfHDo0bEiAnjgxIl+uKkXsN91x13BMkXwgi4KWwluWx
         j0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S2GIs58/W24s0fp90d9pmy8FUWIlpMCzYhDdwe9s8Gc=;
        b=pb2wfq62Rzia3x7rjN8SufxldoPDwgFfcD0mca4yMQvt+eXnOg0rS4ok0xTwqpdqs/
         K9fqDikKiTUcIAc499m/MLIGI6eReS+I3MX0djHlapj9SgMXnlqRwpIUIrSCx4ex3k8B
         ZVrH6ZR4/AnyFoARAgkLzNrpI2u+V1AwP8yucA1zV/W1G7WdY8aYE02RXM+amMAcDIAt
         E/EgMW4e6aW/Nz+FT3R6BQVbsB3fB6IR7GqtKxhPXeIS4oSv/Y/ztSz8oHhiQpxOZz7M
         sJYvlBk1VU78T086l5aD9kLLVsXewoDkdb3OXSMPV/CGg6n6EUhrYw8LryKa44PHfpUd
         U/Tw==
X-Gm-Message-State: AOAM5324wZHAFxsn3q5BRGLCrPs8XQYaeHqF/ERux69FvzNsPq3HIAvE
	8s6k9Gop4TEblhogrxI98KYSjwAixMU+zQ==
X-Google-Smtp-Source: ABdhPJxUNz66xbbtM4Jjtwf6tt59B2TjgPZjQafK+I+tj512i1f7vkBJ0d6klAGbXLkJQvMTFOkFIg==
X-Received: by 2002:adf:e443:: with SMTP id t3mr4398348wrm.14.1604598750991;
        Thu, 05 Nov 2020 09:52:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id e6sm3707860wrs.7.2020.11.05.09.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 09:52:15 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D505B1FF9B;
	Thu,  5 Nov 2020 17:51:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: julien@xen.org,
	stefano.stabellini@linaro.org,
	stefano.stabellini@xilinx.com,
	masami.hiramatsu@linaro.org,
	takahiro.akashi@linaro.org,
	andre.przywara@arm.com,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [RFC PATCH  12/15] stubs/xen-hw-stub: drop xenstore_store_pv_console_info stub
Date: Thu,  5 Nov 2020 17:51:50 +0000
Message-Id: <20201105175153.30489-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201105175153.30489-1-alex.bennee@linaro.org>
References: <20201105175153.30489-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We should never build something that calls this without having it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 stubs/xen-hw-stub.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index 2ea8190921..15f3921a76 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -10,10 +10,6 @@
 #include "hw/xen/xen.h"
 #include "hw/xen/xen-x86.h"
 
-void xenstore_store_pv_console_info(int i, Chardev *chr)
-{
-}
-
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
 {
     return -1;
-- 
2.20.1



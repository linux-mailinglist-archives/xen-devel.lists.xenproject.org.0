Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEF54041B5
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 01:21:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182436.330023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO6sc-0000zx-6f; Wed, 08 Sep 2021 23:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182436.330023; Wed, 08 Sep 2021 23:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO6sc-0000x7-17; Wed, 08 Sep 2021 23:21:22 +0000
Received: by outflank-mailman (input) for mailman id 182436;
 Wed, 08 Sep 2021 23:21:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=39dd=N6=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1mO6sa-0006qz-Vv
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 23:21:21 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 728db82a-10fb-11ec-b18c-12813bfff9fa;
 Wed, 08 Sep 2021 23:21:08 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-gyJtz0OhPtunCPLAYwdHHw-1; Wed, 08 Sep 2021 19:21:07 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 y188-20020a1c7dc5000000b002e80e0b2f87so46882wmc.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Sep 2021 16:21:07 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id t18sm13191wrp.97.2021.09.08.16.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 16:21:04 -0700 (PDT)
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
X-Inumbo-ID: 728db82a-10fb-11ec-b18c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631143268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=geCiN4saZ2frlXmhHZT44DYe1b4J1aCN7Xj/FRob9pQ=;
	b=CaYMj3N+mpDrdOYIZRw3OMS8+U1HPeApFqVvZrJ0UT+LcSu3TEg3HvtNM9os+t679YTvpe
	genSjISt4UB146LgJlsDk0k2YHFL0f2Z8fLX1oikJ83kr9o53TPnbkwsDKwwymEYFBSKJQ
	Q8XQTJmqzMkpuKzx1Lw+oAvxx0bhd+Y=
X-MC-Unique: gyJtz0OhPtunCPLAYwdHHw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=geCiN4saZ2frlXmhHZT44DYe1b4J1aCN7Xj/FRob9pQ=;
        b=l0oHGb9+yotHZR3/8j2KfSySbXpxrTJiLylNY39n3gmROqKuvnW2mZkuXwZy3WNLH+
         ap8YoiZU/Mf2g1altnKyZ55NTeEcu5vd48lFV3xilxot6Nh1JoiJqylvXIF8FQdO+TGg
         6sPTLq2uyzZJSzBwIrPUhvx9D46HzwO7pYF8HyXLFFXgW16zljBtztzSLfOLOUeCtAaz
         P3YLVU4gWCOoogcUstsI6wJ20OAYs5/SmZs6YYPZiixgWoWfw6XIUJrcrwIKaX/eScO6
         7wj9w+LLNxUbj46gigygl4CBTDOG7VI7EoWqJCIdM5O5R1GhU7ycQUDCZHFDzlSB8DNM
         OeYg==
X-Gm-Message-State: AOAM530xxyJ/5fZ/k9FmIb925hpg3nJG9GZ0O1/7rGqZn0hK5dL9MDlN
	r5wsCxq3kv+mCRQb3UIrRc/0CU+lr9Tsy6gTH/y+Wb65aRABGkrAGVUvZkru7NPpZ4zoHwHvFbJ
	CNuDFYJuSDqlPnlGrwPI1FJjI9mE=
X-Received: by 2002:a05:600c:3b84:: with SMTP id n4mr5902095wms.50.1631143265001;
        Wed, 08 Sep 2021 16:21:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCzGiWOShaEshb6oqBDiWr1/WLhbErNDpTZCYYbU0bD2w0oJKgL2kMezD9hKtqCektWiLpSA==
X-Received: by 2002:a05:600c:3b84:: with SMTP id n4mr5902087wms.50.1631143264855;
        Wed, 08 Sep 2021 16:21:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-block@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 08/10] hw/misc: Mark testdev devices as unsafe
Date: Thu,  9 Sep 2021 01:20:22 +0200
Message-Id: <20210908232024.2399215-9-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908232024.2399215-1-philmd@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/hyperv/hyperv_testdev.c | 1 +
 hw/misc/pc-testdev.c       | 1 +
 hw/misc/pci-testdev.c      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/hw/hyperv/hyperv_testdev.c b/hw/hyperv/hyperv_testdev.c
index 9a56ddf83fe..6a75c350389 100644
--- a/hw/hyperv/hyperv_testdev.c
+++ b/hw/hyperv/hyperv_testdev.c
@@ -310,6 +310,7 @@ static void hv_test_dev_class_init(ObjectClass *klass, void *data)
 
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     dc->realize = hv_test_dev_realizefn;
+    dc->taints_security_policy = true;
 }
 
 static const TypeInfo hv_test_dev_info = {
diff --git a/hw/misc/pc-testdev.c b/hw/misc/pc-testdev.c
index e3896518694..6294b80ec1b 100644
--- a/hw/misc/pc-testdev.c
+++ b/hw/misc/pc-testdev.c
@@ -199,6 +199,7 @@ static void testdev_class_init(ObjectClass *klass, void *data)
 
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     dc->realize = testdev_realizefn;
+    dc->taints_security_policy = true;
 }
 
 static const TypeInfo testdev_info = {
diff --git a/hw/misc/pci-testdev.c b/hw/misc/pci-testdev.c
index 03845c8de34..189eb9bf1bb 100644
--- a/hw/misc/pci-testdev.c
+++ b/hw/misc/pci-testdev.c
@@ -340,6 +340,7 @@ static void pci_testdev_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     dc->reset = qdev_pci_testdev_reset;
     device_class_set_props(dc, pci_testdev_properties);
+    dc->taints_security_policy = true;
 }
 
 static const TypeInfo pci_testdev_info = {
-- 
2.31.1



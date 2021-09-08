Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3568F4041B7
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 01:21:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182443.330046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO6sl-000229-Tp; Wed, 08 Sep 2021 23:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182443.330046; Wed, 08 Sep 2021 23:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO6sl-0001yo-Ol; Wed, 08 Sep 2021 23:21:31 +0000
Received: by outflank-mailman (input) for mailman id 182443;
 Wed, 08 Sep 2021 23:21:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=39dd=N6=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1mO6sl-0006qz-04
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 23:21:31 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 77d9edc6-10fb-11ec-b18c-12813bfff9fa;
 Wed, 08 Sep 2021 23:21:17 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-NgJ5RylbONODu41M2ITodQ-1; Wed, 08 Sep 2021 19:21:16 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so30001wmj.6
 for <xen-devel@lists.xenproject.org>; Wed, 08 Sep 2021 16:21:16 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id t64sm344074wma.48.2021.09.08.16.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 16:21:14 -0700 (PDT)
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
X-Inumbo-ID: 77d9edc6-10fb-11ec-b18c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631143277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZkBFAMCpq6n9y+VH8JjTuNHo5ej2dLMGMd9K3LlaeP8=;
	b=MbajT/kNKsg4SXBKvHTR6tDLMIIK9gQUeckCC931eQZSpF/3DAT0PItZYHI/N0H3/BXSkH
	mgVNMFrCiSG+J/8pX7Eo5vNPU5izZBGZXmdUjY39Rzc5qYqdr1iwlNITyuZWSRp48lgDbc
	BYG9oZIHlsPUzJa+vTOzD1n6xajIZpI=
X-MC-Unique: NgJ5RylbONODu41M2ITodQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZkBFAMCpq6n9y+VH8JjTuNHo5ej2dLMGMd9K3LlaeP8=;
        b=kIG9GwTh0qeSOI/bbSX68+/c00cIiyJgEW4DPhZtRPs+XYLojOQVOLx+XsPw3sm+5p
         6g9+fcSsCqDtSLnu5BLfagZ91hMd8wkC6HuVRD6waavbK0tBxtxXGgHLvrUWY78x7hH9
         ZjJLosWWWiHB/bFK5WodzZ1El/2FOMGg7s6QvgPAUvitBEXLON5SEE99Jkdzlf1rzJLw
         NzXxKqOE9j5Cp0iQvkSxNHZQJhkRyNlGLK69ORDkp/CWSfhWw+te6Bq/goAaHLYn2FQ3
         Y9p5xeMKK+etVYZLjOKNWVKs/JmbThi6quAHDXvNpafrVVoBxMEICd1zr5RISKI/kY00
         +iwA==
X-Gm-Message-State: AOAM531hMa7IJdvVUFWDH9mCuPpCaf+JdghZlNgVZ/4QnykVPkZhAhyD
	vgkbKYeOPawhafgboEAZpQ/v4ws2vVyGJCu/hd8qYBqtbyVr4PeYzGaWzFwjH2waVCs15ELLEDU
	hm24l+E7JyfzqMJjcmWM/aS/tSUI=
X-Received: by 2002:a7b:c4cd:: with SMTP id g13mr5796244wmk.91.1631143275278;
        Wed, 08 Sep 2021 16:21:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybmoGBTuN4rPAmVNoHLJ613PnCRxyUI7oFmyfrpx3hP5AYKM4updonQnfJItVUJwu02OE/7Q==
X-Received: by 2002:a7b:c4cd:: with SMTP id g13mr5796223wmk.91.1631143275096;
        Wed, 08 Sep 2021 16:21:15 -0700 (PDT)
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
Subject: [RFC PATCH 10/10] hw/sd: Mark sdhci-pci device as unsafe
Date: Thu,  9 Sep 2021 01:20:24 +0200
Message-Id: <20210908232024.2399215-11-philmd@redhat.com>
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
 hw/sd/sdhci-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/sd/sdhci-pci.c b/hw/sd/sdhci-pci.c
index c737c8b930e..7a36f88fd87 100644
--- a/hw/sd/sdhci-pci.c
+++ b/hw/sd/sdhci-pci.c
@@ -64,6 +64,7 @@ static void sdhci_pci_class_init(ObjectClass *klass, void *data)
     k->device_id = PCI_DEVICE_ID_REDHAT_SDHCI;
     k->class_id = PCI_CLASS_SYSTEM_SDHCI;
     device_class_set_props(dc, sdhci_pci_properties);
+    dc->taints_security_policy = true;
 
     sdhci_common_class_init(klass, data);
 }
-- 
2.31.1



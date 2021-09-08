Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF324041B6
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 01:21:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182439.330035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO6sh-0001bR-IU; Wed, 08 Sep 2021 23:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182439.330035; Wed, 08 Sep 2021 23:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO6sh-0001YZ-Da; Wed, 08 Sep 2021 23:21:27 +0000
Received: by outflank-mailman (input) for mailman id 182439;
 Wed, 08 Sep 2021 23:21:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=39dd=N6=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1mO6sf-0006qz-W6
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 23:21:26 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 75dabf6e-10fb-11ec-b18c-12813bfff9fa;
 Wed, 08 Sep 2021 23:21:14 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-rMRz529aM0mahUiIOwrOvA-1; Wed, 08 Sep 2021 19:21:11 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 m22-20020a7bcb96000000b002f7b840d9dcso39609wmi.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Sep 2021 16:21:10 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id e2sm29478wra.40.2021.09.08.16.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 16:21:09 -0700 (PDT)
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
X-Inumbo-ID: 75dabf6e-10fb-11ec-b18c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631143274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/j1jkBDfrokHKQKoDNuT1x0UKxyqYOGBFYU13ViaHTo=;
	b=T1Y/2Ag6QNLFp+5TDQD6naC0EfJRjM1DIO0yKMS+yi1kJLp8RQZ8Q8ySHDA0LubfeN5wqt
	Ct6Xp0aJPCRCg6EVMi8vptt0ZaeeGkf3llMwD7D9/4m7aQIwYrUcvKe8IcaF+OodnT/q+9
	Ui2KNrt8EYk0Gn/ZJ4vGhACGMtwi8bQ=
X-MC-Unique: rMRz529aM0mahUiIOwrOvA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/j1jkBDfrokHKQKoDNuT1x0UKxyqYOGBFYU13ViaHTo=;
        b=TglR5A+LlYq/bZe6lkoCh2XLmH8W5q2887ulhXHC20+i3wcWnx2q5E8eT9w8uWX4+x
         sie6sX27guZiUnc0RUBNbia4olFhCxBw4xceAW3ddW2ZYzVyiMUmw7Vu1oz9518skLAo
         ROFIg691e3kllE/TTTxrb4sPLxs4zXJTUh3Yol4XQpAEdpchHnAVJi7+UNaoti5wlIrB
         1b/N6PdvgWOYTMB9zFQju8vaB7oDLF3ytPpgHhdHOEa5WYpnCVLXqd53vPNPotGYninI
         dr+g4kgmigO1V79bvIJ0YZDdjhS5zW8HYBnDz5s61etlB/V6IscGP45NelQ1CSD5QNCr
         AG7w==
X-Gm-Message-State: AOAM5326pTzA0gKZXJGzRLVBYp0QGWK8re0DeBErzQPBuLe69HelN2Ja
	qUOAJCtht0IFuNo3PQwMAauAFXiu7Hrh9LZlziDg5D/NZ44hAquhdQZHYL2KwPzpzu/vi6cX4hA
	Z7E4TVzgelkHoVxCgQPXkDDT7/Yk=
X-Received: by 2002:a1c:f709:: with SMTP id v9mr5800239wmh.124.1631143269932;
        Wed, 08 Sep 2021 16:21:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsU5M2MRY44dKoBP/lcBIPQuM1MTJ8pmbiG93tEMNWtoFxyRNm7Nzd/6gGAEAcV0FSbIvT1A==
X-Received: by 2002:a1c:f709:: with SMTP id v9mr5800221wmh.124.1631143269808;
        Wed, 08 Sep 2021 16:21:09 -0700 (PDT)
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
Subject: [RFC PATCH 09/10] hw/net: Mark Tulip device as unsafe
Date: Thu,  9 Sep 2021 01:20:23 +0200
Message-Id: <20210908232024.2399215-10-philmd@redhat.com>
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
 hw/net/tulip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index ca69f7ea5e1..eaad3266212 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -1025,6 +1025,7 @@ static void tulip_class_init(ObjectClass *klass, void *data)
     device_class_set_props(dc, tulip_properties);
     dc->reset = tulip_qdev_reset;
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
+    dc->taints_security_policy = true;
 }
 
 static const TypeInfo tulip_info = {
-- 
2.31.1



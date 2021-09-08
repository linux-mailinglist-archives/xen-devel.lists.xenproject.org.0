Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 864D74041B3
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 01:21:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182420.330001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO6sK-0007cI-IO; Wed, 08 Sep 2021 23:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182420.330001; Wed, 08 Sep 2021 23:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO6sK-0007ab-DZ; Wed, 08 Sep 2021 23:21:04 +0000
Received: by outflank-mailman (input) for mailman id 182420;
 Wed, 08 Sep 2021 23:21:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=39dd=N6=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1mO6sI-0006qz-W6
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 23:21:03 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6ed5206a-10fb-11ec-b18c-12813bfff9fa;
 Wed, 08 Sep 2021 23:21:02 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-BNSDJFlcOr6a8RcCnT7r_Q-1; Wed, 08 Sep 2021 19:21:01 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 y188-20020a1c7dc5000000b002e80e0b2f87so46767wmc.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Sep 2021 16:21:01 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id e8sm14000wrc.96.2021.09.08.16.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 16:20:59 -0700 (PDT)
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
X-Inumbo-ID: 6ed5206a-10fb-11ec-b18c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631143262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qceza/WB3CtMew9GJDkTkDK3S8IfTB0xLv9ykQRmWEY=;
	b=BZf5flKneby/HH/TUn+2En4hcuRn0nmqUQlhObaQRtHRTS85+MH3RYybtdnDIP/nlNwvYl
	OqT0y4+C9/70yYBTF9ExiumHax9KbbMvWoqxYzsKno14Lq6ti5oo0k+SYsOzxIrHtDInIZ
	Ay6kf2TslFss/rF3NzONLuSpIgUsdmU=
X-MC-Unique: BNSDJFlcOr6a8RcCnT7r_Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qceza/WB3CtMew9GJDkTkDK3S8IfTB0xLv9ykQRmWEY=;
        b=wOCRkgEQuiqwpczRegApAqmrcK2g7v20+z3jfm/JbUOQq41fbLpyBc4SHbYcfil34H
         3arakN1/uPO+uBzBLSbmVNjBnDthriJf5w5n0ZPHM3eEq5j3dJpeDZlCUE2YOOvhnchp
         x+5GIXvDXQqTLsikSUG11TMSvdPicBMZKQHx/uGqY7TbQVsNI58sJvoLhIK1rjrMy2gB
         jLQh1pFYhQtEmM+zfJ3UVOkGQjSGo0uZveJ2aDmcTmd4YNXQ5KInPjOpMoMRayG0hES3
         RMyJNWRZS5GnPZzr21xI1BUIMbOxNZfYQhUNFXDJaNOt2zYCUc6R0XoCTHIUEmV3nG1H
         9awA==
X-Gm-Message-State: AOAM5302j9ezc/2MHgqp6LObCdCJTe7aRS1bSPUe1Sdag9UGtIfQGzUU
	FU3TQmPpe2NPBA2nP0bCI5N60ydooLTKVrzAlIFyPZP1IukCO/ifAiZnmAjKXvt6Rf3PaXHp+SF
	s9CblitN6aNxGu+QettFmU7bBfKo=
X-Received: by 2002:adf:fd51:: with SMTP id h17mr109105wrs.178.1631143260116;
        Wed, 08 Sep 2021 16:21:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGCdGOUWAMH7ZAThbx+xTDgHh6zdyfVzIsc9P7NbgQbnC+meNZTqgQ/wi8QkKk51AhWel3JA==
X-Received: by 2002:adf:fd51:: with SMTP id h17mr109093wrs.178.1631143259991;
        Wed, 08 Sep 2021 16:20:59 -0700 (PDT)
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
Subject: [RFC PATCH 07/10] hw/display: Mark ATI and Artist devices as unsafe
Date: Thu,  9 Sep 2021 01:20:21 +0200
Message-Id: <20210908232024.2399215-8-philmd@redhat.com>
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
 hw/display/artist.c | 1 +
 hw/display/ati.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 21b7fd1b440..067a4b2cb59 100644
--- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -1482,6 +1482,7 @@ static void artist_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &vmstate_artist;
     dc->reset = artist_reset;
     device_class_set_props(dc, artist_properties);
+    dc->taints_security_policy = true;
 }
 
 static const TypeInfo artist_info = {
diff --git a/hw/display/ati.c b/hw/display/ati.c
index 31f22754dce..2f27ab69a87 100644
--- a/hw/display/ati.c
+++ b/hw/display/ati.c
@@ -1024,6 +1024,7 @@ static void ati_vga_class_init(ObjectClass *klass, void *data)
     device_class_set_props(dc, ati_vga_properties);
     dc->hotpluggable = false;
     set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
+    dc->taints_security_policy = true;
 
     k->class_id = PCI_CLASS_DISPLAY_VGA;
     k->vendor_id = PCI_VENDOR_ID_ATI;
-- 
2.31.1



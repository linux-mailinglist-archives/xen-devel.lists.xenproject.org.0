Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F253C686D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 04:16:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154966.286216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m37xp-0005LL-Dn; Tue, 13 Jul 2021 02:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154966.286216; Tue, 13 Jul 2021 02:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m37xp-0005IT-Ac; Tue, 13 Jul 2021 02:16:01 +0000
Received: by outflank-mailman (input) for mailman id 154966;
 Tue, 13 Jul 2021 02:16:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lsEr=MF=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1m37xo-0005IN-0h
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 02:16:00 +0000
Received: from mail-qk1-x735.google.com (unknown [2607:f8b0:4864:20::735])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f40fb3f-71d8-4df6-8f2e-032d2b5b96c8;
 Tue, 13 Jul 2021 02:15:59 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id 18so3006889qka.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jul 2021 19:15:59 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:9378:603d:7cd:adab])
 by smtp.gmail.com with ESMTPSA id i2sm7373697qko.43.2021.07.12.19.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 19:15:58 -0700 (PDT)
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
X-Inumbo-ID: 7f40fb3f-71d8-4df6-8f2e-032d2b5b96c8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wdFnm7RRtRSFE80bwUaEsdN3yV2SV0vP3Z2kzFYnnlc=;
        b=KLvkyE6NIO+HnpW500TF1rsk7wL1s1nRmBBwARovCS6WsK/Pw7sUPDlVNr02S9m2OM
         boL6JgcMW9ffHlkUZEKbzWa5LdW3q45N35Bbltm8t7zZrE8N0tmd+NXugEhkCT3O14ZI
         zw5+ZugrmKpWbuh9ssrdLBKsWjis3lsLp95wu3ndVBDF2DrY81FYdiyvmp/HaLn00f9Z
         s4NAOJifObvuFtnVbNpfxvqxdlhOaK0jRytrSU9vv9TVBGg1jPW82Osd6DvdQjI0GQKe
         OyvZKri+ag4HbUvKPPYiQyYm4aGEN7rrzEdlU3qi7jyVugodmtKpeb/o08xXNqnFwlTE
         MYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wdFnm7RRtRSFE80bwUaEsdN3yV2SV0vP3Z2kzFYnnlc=;
        b=dezuxWT+SjF4kVAaxfoebEwrIXRipR2En5Yg9tTfh33ZLkIqZhPztIjiJVu/i4bRPq
         4++XC7orxSA7NIF2u6kCONJOGx14P+sdiddnCguFFZZXpWITzAIun3H5sOlxQmHhWywb
         EQgbgaL3coEAzLtgT4JywwTTWRCjnOj2HFxtWuUeTqNKWaIlCLntpw1i1g6+QShI43dn
         ppVnJIyFfiQExIkVD4MU7BtQhmoW6tSJHnVFTyR3ZRbsucJFLxHISsiwKxMPBUrRjkvH
         ZIAvzzZTbai49PBLjuRVrb7CFTD+jVkHCj+xTOjI7Cj9wp4gDbgKvS/lIMwTOwf32GKy
         17BQ==
X-Gm-Message-State: AOAM5327SfjgTc+XODbPKvtrDtWNAq8V77/Afee4Lal1j6ArPKKDbVRW
	kwJLI22+GZ845NNMIo03QY8=
X-Google-Smtp-Source: ABdhPJxh39sItlBbypn5s+6CpMU8gblLRgspg+iwxnB/h0Z++e0kBQYb+IZ7woPGm+m+cRaoBZWkFw==
X-Received: by 2002:a05:620a:15b:: with SMTP id e27mr1858216qkn.488.1626142558861;
        Mon, 12 Jul 2021 19:15:58 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: jandryuk@gmail.com
Cc: anthony.perard@citrix.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH] vl: Parse legacy default_machine_opts
Date: Mon, 12 Jul 2021 22:15:52 -0400
Message-Id: <20210713021552.19110-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <CAKf6xps07sbk7MnehPTKes52sst0UyaHiHjjSdEX0bFjT+E_ag@mail.gmail.com>
References: <CAKf6xps07sbk7MnehPTKes52sst0UyaHiHjjSdEX0bFjT+E_ag@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qemu can't start a xen vm after commit d8fb7d0969d5
"vl: switch -M parsing to keyval" with:

$ ./qemu-system-i386 -M xenfv
Unexpected error in object_property_find_err() at ../qom/object.c:1298:
qemu-system-i386: Property 'xenfv-3.1-machine.accel' not found
Aborted (core dumped)

The default_machine_opts handling doesn't process the legacy machine
options like "accel".  Call qemu_apply_legacy_machine_options to provide
the legacy handling.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 softmmu/vl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 4df1496101..f4d8630fc6 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2126,6 +2126,7 @@ static void qemu_create_machine(QDict *qdict)
         QDict *default_opts =
             keyval_parse(machine_class->default_machine_opts, NULL, NULL,
                          &error_abort);
+        qemu_apply_legacy_machine_options(default_opts);
         object_set_properties_from_keyval(OBJECT(current_machine), default_opts,
                                           false, &error_abort);
         qobject_unref(default_opts);
-- 
2.30.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF03442324
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 23:10:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219434.380314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfUs-0002SC-KC; Mon, 01 Nov 2021 22:09:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219434.380314; Mon, 01 Nov 2021 22:09:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfUs-0002Mm-Bx; Mon, 01 Nov 2021 22:09:42 +0000
Received: by outflank-mailman (input) for mailman id 219434;
 Mon, 01 Nov 2021 22:09:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z02t=PU=redhat.com=quintela@srs-us1.protection.inumbo.net>)
 id 1mhfUq-0007pr-Na
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 22:09:40 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5e1b86de-3b60-11ec-854e-12813bfff9fa;
 Mon, 01 Nov 2021 22:09:23 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-e9dEX5IDPS6KcGtwNBm01Q-1; Mon, 01 Nov 2021 18:09:22 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 a186-20020a1c7fc3000000b00332f1a308e7so179935wmd.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Nov 2021 15:09:22 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id 126sm621666wmz.28.2021.11.01.15.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:20 -0700 (PDT)
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
X-Inumbo-ID: 5e1b86de-3b60-11ec-854e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635804563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YZFYZZ5zEoiyMjFkwTDaD6Kc9ekYQT7iiG9Yos9LPnM=;
	b=Qn9qhXotRnwBbwLmjzCtMMto2U5LxwpkSjjGEVeEWEhPSiND5Mlpnn54ojKwbNKtPi3ACN
	xEnHVfw73opWa9JppxShtcD/DIEW1/Z/ilkWdtOeObrfD2Q0FkBgaUQkW5MgebV0lDpBui
	9W8fQnjW6mDUXIJ1RXJBJ2FHhfh6kDk=
X-MC-Unique: e9dEX5IDPS6KcGtwNBm01Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YZFYZZ5zEoiyMjFkwTDaD6Kc9ekYQT7iiG9Yos9LPnM=;
        b=Z6vcBSVFQgk9s+Qdgfdlde2St/yIkhZ3posiWHl/pYnd3Fl3llDwqHAdjVAYGDCqAy
         0GKHlfbtpJgcdCOTC3ALaMYvrxZI3VqTWUWK8TwCtDTZZkofPnhfh4BjeoOvYZSIoUhC
         E8Hl+SaRhKJWUC+/Dw0g2Ym8ApbIFeKFdCbCxP03vS+xiiK6wqhWoHCnK+QfUaiC3OLE
         rXlXmP1OVTBjkbH+gICYn6Hhh9h3p3DkylvuDuJU3Nzha5ri1+7Qd7LbovlGEkEmmGzq
         0AtTntX3S+rfo6/sM1oYWBM5uS5X2SM5VRqiU6rMyv1DuUQ3okKuLL5RvRJE0xkBbcRq
         MoUA==
X-Gm-Message-State: AOAM532cEzFwFLLxd5s1SXANW5l5wPeYFSk91IdVosrjurdmDuhkmDpz
	G32buH7aj+Bbmzo0VqmUrj//D3zIeonZe3HCdFoaZ3bY1gml8Sq6tA6fvJP0eOj/z0vBdYUFPyY
	c6keWnjtSqDapJJqQck7e8FoCdQM=
X-Received: by 2002:a1c:e90a:: with SMTP id q10mr2002273wmc.108.1635804561243;
        Mon, 01 Nov 2021 15:09:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxa8vqOhjEPyDeA8zcYXC8Gdajcc+LdPsZwKy493tocqfCdmTr3IvnHpn4ZYtHQE6XeYkTmSQ==
X-Received: by 2002:a1c:e90a:: with SMTP id q10mr2002245wmc.108.1635804561097;
        Mon, 01 Nov 2021 15:09:21 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	kvm@vger.kernel.org,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Hyman=20Huang=28=C3=A9=C2=BB=E2=80=9E=C3=A5=E2=80=B9?= =?UTF-8?q?=E2=80=A1=29?= <huangy81@chinatelecom.cn>
Subject: [PULL 05/20] migration/dirtyrate: adjust order of registering thread
Date: Mon,  1 Nov 2021 23:08:57 +0100
Message-Id: <20211101220912.10039-6-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101220912.10039-1-quintela@redhat.com>
References: <20211101220912.10039-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>

registering get_dirtyrate thread in advance so that both
page-sampling and dirty-ring mode can be covered.

Signed-off-by: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>
Message-Id: <d7727581a8e86d4a42fc3eacf7f310419b9ebf7e.1624040308.git.huangy81@chinatelecom.cn>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/dirtyrate.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index e0a27a992c..a9bdd60034 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -352,7 +352,6 @@ static void calculate_dirtyrate(struct DirtyRateConfig config)
     int64_t msec = 0;
     int64_t initial_time;
 
-    rcu_register_thread();
     rcu_read_lock();
     initial_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
     if (!record_ramblock_hash_info(&block_dinfo, config, &block_count)) {
@@ -375,7 +374,6 @@ static void calculate_dirtyrate(struct DirtyRateConfig config)
 out:
     rcu_read_unlock();
     free_ramblock_dirty_info(block_dinfo, block_count);
-    rcu_unregister_thread();
 }
 
 void *get_dirtyrate_thread(void *arg)
@@ -383,6 +381,7 @@ void *get_dirtyrate_thread(void *arg)
     struct DirtyRateConfig config = *(struct DirtyRateConfig *)arg;
     int ret;
     int64_t start_time;
+    rcu_register_thread();
 
     ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_UNSTARTED,
                               DIRTY_RATE_STATUS_MEASURING);
@@ -401,6 +400,8 @@ void *get_dirtyrate_thread(void *arg)
     if (ret == -1) {
         error_report("change dirtyrate state failed.");
     }
+
+    rcu_unregister_thread();
     return NULL;
 }
 
-- 
2.33.1



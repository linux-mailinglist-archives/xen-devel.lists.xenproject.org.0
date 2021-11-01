Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8404442320
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 23:10:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219440.380330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfUx-0003VY-SR; Mon, 01 Nov 2021 22:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219440.380330; Mon, 01 Nov 2021 22:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfUx-0003R9-NS; Mon, 01 Nov 2021 22:09:47 +0000
Received: by outflank-mailman (input) for mailman id 219440;
 Mon, 01 Nov 2021 22:09:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z02t=PU=redhat.com=quintela@srs-us1.protection.inumbo.net>)
 id 1mhfUv-0007pr-Ny
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 22:09:45 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5fdced30-3b60-11ec-854e-12813bfff9fa;
 Mon, 01 Nov 2021 22:09:26 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210--p4wCkVRNFiI7wBM2qGXGQ-1; Mon, 01 Nov 2021 18:09:23 -0400
Received: by mail-wr1-f72.google.com with SMTP id
 p17-20020adff211000000b0017b902a7701so3974679wro.19
 for <xen-devel@lists.xenproject.org>; Mon, 01 Nov 2021 15:09:23 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id n15sm637153wmq.38.2021.11.01.15.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:21 -0700 (PDT)
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
X-Inumbo-ID: 5fdced30-3b60-11ec-854e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635804566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UH6qFcOvOngPka/Fe9lzsDNdrqD8p0gmRL7v9NgF7Ts=;
	b=U+vt9jf4jS/HiIfTMU0r9zWFdythg50gtGQSjozlCZzWEI6wtMtj7+Xt1m5IZfj+g8Luob
	XU2CUH3ouytVFrW0wLPjGujJNqcbhDTMOJET9qZgANrChSQTOOJC0yNJdgz7oKa7Reg0ji
	wpsM2LEAOgt2NDcrr4HIXsft3rjRNfU=
X-MC-Unique: -p4wCkVRNFiI7wBM2qGXGQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UH6qFcOvOngPka/Fe9lzsDNdrqD8p0gmRL7v9NgF7Ts=;
        b=okvxTuVmYhnI4rLf8HhIpYHBGE3nvBm4QgBga8AAiHghp0KQSwMU9mk1rApgddm9Tf
         9Bc8qWEAE/4cpH+342uNiWcuSyLfvCVPGnF63b3AOwVZvdjoRmHxGwGLw61gBzb9jxXC
         WGXsl4rWeRTmz7pIXQbKrBHHn1DE18pG7nq04UlzwbCdOC47l7WV+Bvorgo294aproOf
         edydQDvqjLLXNNT8K8GqAywI3scupP0mpUglqbJnXZAuEEytJhzccYkyS1P+A20WoB3T
         is9tk7iVjqwhGE6vciQ9XNxUbAWZuAHcIICLVK7rkysftiAM7cC9j9tSpv3w4ZJ+jkhC
         kUGg==
X-Gm-Message-State: AOAM533q5prTnaEGRhDnSop/M2ppJqHXBoXe0y6uSOZpkRtWgFc+vDgy
	4fe5gJfXygBkxm8bOH65WBPBS6Q6OzW+R22sNgxJA+RXFaO/h1wuPXEkEvNfxVpBbOLetOEo6Y0
	hCWwz4KTQAJNQ1zF52KXjX568KYg=
X-Received: by 2002:adf:d20e:: with SMTP id j14mr33297701wrh.220.1635804562476;
        Mon, 01 Nov 2021 15:09:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkffbvXrtYSeZN/zNmfpHm8cIwzDDYcEpAf91jdU0NQr69iLSppRQMuLbVQCsCLOwkm5qiNw==
X-Received: by 2002:adf:d20e:: with SMTP id j14mr33297679wrh.220.1635804562331;
        Mon, 01 Nov 2021 15:09:22 -0700 (PDT)
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
Subject: [PULL 06/20] migration/dirtyrate: move init step of calculation to main thread
Date: Mon,  1 Nov 2021 23:08:58 +0100
Message-Id: <20211101220912.10039-7-quintela@redhat.com>
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

since main thread may "query dirty rate" at any time, it's better
to move init step into main thead so that synchronization overhead
between "main" and "get_dirtyrate" can be reduced.

Signed-off-by: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>
Message-Id: <109f8077518ed2f13068e3bfb10e625e964780f1.1624040308.git.huangy81@chinatelecom.cn>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/dirtyrate.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index a9bdd60034..b8f61cc650 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -380,7 +380,6 @@ void *get_dirtyrate_thread(void *arg)
 {
     struct DirtyRateConfig config = *(struct DirtyRateConfig *)arg;
     int ret;
-    int64_t start_time;
     rcu_register_thread();
 
     ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_UNSTARTED,
@@ -390,9 +389,6 @@ void *get_dirtyrate_thread(void *arg)
         return NULL;
     }
 
-    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
-    init_dirtyrate_stat(start_time, config);
-
     calculate_dirtyrate(config);
 
     ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_MEASURING,
@@ -411,6 +407,7 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
     static struct DirtyRateConfig config;
     QemuThread thread;
     int ret;
+    int64_t start_time;
 
     /*
      * If the dirty rate is already being measured, don't attempt to start.
@@ -451,6 +448,10 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
     config.sample_period_seconds = calc_time;
     config.sample_pages_per_gigabytes = sample_pages;
     config.mode = DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
+
+    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
+    init_dirtyrate_stat(start_time, config);
+
     qemu_thread_create(&thread, "get_dirtyrate", get_dirtyrate_thread,
                        (void *)&config, QEMU_THREAD_DETACHED);
 }
-- 
2.33.1



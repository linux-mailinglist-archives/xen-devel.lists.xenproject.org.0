Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6240B31FDF9
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 18:39:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87024.163952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9k7-0000bQ-Af; Fri, 19 Feb 2021 17:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87024.163952; Fri, 19 Feb 2021 17:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9k7-0000an-6m; Fri, 19 Feb 2021 17:39:03 +0000
Received: by outflank-mailman (input) for mailman id 87024;
 Fri, 19 Feb 2021 17:39:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ml8x=HV=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lD9k5-0000XE-B1
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 17:39:01 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d2238aa9-c85f-4066-8cda-567a796caf2f;
 Fri, 19 Feb 2021 17:38:59 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-YWgzFbeeOcuLgbEabV4mPA-1; Fri, 19 Feb 2021 12:38:57 -0500
Received: by mail-wm1-f69.google.com with SMTP id z67so2789276wme.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Feb 2021 09:38:57 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i7sm23525949wmq.2.2021.02.19.09.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:38:56 -0800 (PST)
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
X-Inumbo-ID: d2238aa9-c85f-4066-8cda-567a796caf2f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613756339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=98X4DsBNdk1BN09KWcHx0mE3/gzzTZdKxOLSGajyIeI=;
	b=Q9/iEHjDqTF80Mo33cOYrt6p2Mpt3KYt2U3Ws869lT0OTof6ZPlwvl5CIILLX0q5dD0TsJ
	GREqXguURm4OuiYckfiL8llnByBBclUng2Ga0xYg7sctKg9dbGPCq2yoHwHUfwCC5Ta4Ih
	L4BjB9lWVIOwISa+z4fduSomV3HSW/o=
X-MC-Unique: YWgzFbeeOcuLgbEabV4mPA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=98X4DsBNdk1BN09KWcHx0mE3/gzzTZdKxOLSGajyIeI=;
        b=MIxZDyB4rhoproujRx7EA2h20999aup5Yyg4JCWOFz7ywkb0p3iZ0KMiUFaFImJ2Hn
         iDBwm93zJTmRovy0gt5mBYfO9L007q+3TgG9LzVvrNGt38zCQoy1nuU0Z+g0vv7YH88f
         +lqSsUKR7OfmjGy8knZfYjVIPYSdAJOn+2+vq9PqjeKrnYOwOdD8uBgMR1Fe4/4dL1y6
         9VdQAbgbvjkPWjqEuWybmZoCuWp5H5NXalfiqoiQJnUmsG6YJaDyWtoYhQlkhr+ecsZv
         j5/tBA8wH2JLbi5y82oEQipQMmRbJWidopJC0yHMfepZcmHvIS3v7l4N8n7ZwpWczc2c
         nzMg==
X-Gm-Message-State: AOAM533bJYw7hgx2ZwITLnZBy8k3iwCCBIi1DqKWUMRgJ8wj/MdoUL9r
	WensgOpMA2gs+oHQGOj4lFfh/bj2m3/oFLUrIEl2ypu22KUP2UfecPFzmdy5xH9pUv3u36d+sL9
	rJ208jeyWw4c+RLUCLCCNaTXjSJ4=
X-Received: by 2002:adf:b60f:: with SMTP id f15mr10395952wre.83.1613756336822;
        Fri, 19 Feb 2021 09:38:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzk+AP79F8l3TWLxyR5RU8SmferiSbz3yhDIC5dQKM04uA2QaqDVPRO6H3UVoBxcUQFmDZVKw==
X-Received: by 2002:adf:b60f:: with SMTP id f15mr10395942wre.83.1613756336683;
        Fri, 19 Feb 2021 09:38:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	xen-devel@lists.xenproject.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-arm@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Leif Lindholm <leif@nuviainc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alistair Francis <alistair@alistair23.me>,
	Paul Durrant <paul@xen.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Greg Kurz <groug@kaod.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 01/11] accel/kvm: Check MachineClass kvm_type() return value
Date: Fri, 19 Feb 2021 18:38:37 +0100
Message-Id: <20210219173847.2054123-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219173847.2054123-1-philmd@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

MachineClass::kvm_type() can return -1 on failure.
Document it, and add a check in kvm_init().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/boards.h | 3 ++-
 accel/kvm/kvm-all.c | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index a46dfe5d1a6..68d3d10f6b0 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -127,7 +127,8 @@ typedef struct {
  *    implement and a stub device is required.
  * @kvm_type:
  *    Return the type of KVM corresponding to the kvm-type string option or
- *    computed based on other criteria such as the host kernel capabilities.
+ *    computed based on other criteria such as the host kernel capabilities
+ *    (which can't be negative), or -1 on error.
  * @numa_mem_supported:
  *    true if '--numa node.mem' option is supported and false otherwise
  * @smp_parse:
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 84c943fcdb2..b069938d881 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2057,6 +2057,12 @@ static int kvm_init(MachineState *ms)
                                                             "kvm-type",
                                                             &error_abort);
         type = mc->kvm_type(ms, kvm_type);
+        if (type < 0) {
+            ret = -EINVAL;
+            fprintf(stderr, "Failed to detect kvm-type for machine '%s'\n",
+                    mc->name);
+            goto err;
+        }
     }
 
     do {
-- 
2.26.2



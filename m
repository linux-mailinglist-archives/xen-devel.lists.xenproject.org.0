Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ADA4E579E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 18:36:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294033.499783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4u6-0005XR-K6; Wed, 23 Mar 2022 17:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294033.499783; Wed, 23 Mar 2022 17:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4u6-0005VO-Fn; Wed, 23 Mar 2022 17:36:14 +0000
Received: by outflank-mailman (input) for mailman id 294033;
 Wed, 23 Mar 2022 17:36:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s5zF=UC=gmail.com=philippe.mathieu.daude@srs-se1.protection.inumbo.net>)
 id 1nX4ep-0004Zy-1T
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 17:20:27 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 872bd760-aacd-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 18:20:26 +0100 (CET)
Received: by mail-pl1-x62f.google.com with SMTP id k6so2138366plg.12
 for <xen-devel@lists.xenproject.org>; Wed, 23 Mar 2022 10:20:26 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 o24-20020a17090a5b1800b001c6aaafa5fbsm282644pji.24.2022.03.23.10.20.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:20:24 -0700 (PDT)
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
X-Inumbo-ID: 872bd760-aacd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ed6iY8pMEzMkAOvdT6TEMCudwvjmYJcGMMpCaTIv/yU=;
        b=RyKgoe5HgJCJpFJvPNUJVGX9nExg70mZzCcSsKHkmRw2HUwXJBO+ViJY8Cg1JFjM2H
         G0OgG2uMd3kfN/cqwIfkckDdV0ro4mD03PEFsBMGgIFVHwNisdMFtViW7UEW0QokyJ18
         /1sVuSemm0/QC9FQEH4gtz9xLl3QWzTjGmS6U6thAkmdoZhRJ3tRO1ZYnvykNZfNtAY7
         hsT8RrSJ2JYd++oXi25BCbjpyRPtyPQS4TfqKZj1OE2g3DX3iSvXB/fb6naDgvDbxoVg
         v/pUtMjxZ1idxkWkbRDhcEj5lEdEAR20mwKPOE/HmsGKZUkhhIAWrUbX6M9OiZDfFKNS
         ulEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ed6iY8pMEzMkAOvdT6TEMCudwvjmYJcGMMpCaTIv/yU=;
        b=i278VbzLftkQZp95rC7K7vxypA5PJEp5DEBFWhwvEw9DgsK+SoUP+CkzaZnKCmH0Uf
         c1PWrnJygLgCiDJwHMbq1H8byi5VfA8ABsy3J4NlbCfdVRCh2QFbd86kgCTYVRpJn0l+
         g0trnk4/9dgou/Z+WVzp4j6W1qVIfbRSAz3A7SO89UpbT1ItnSCETXtUlYH1No2jMvY4
         XRS1zwSRMjfCaSjMbcpJNdUs41h7YebXF8bCO/Fq9/1TlwLbS0RtZnr568b4Gdg/vmaJ
         R43oCxHcGusQSmvQfKpjjTRJpzdt6PTP3l25CDbDvDLxDE36p+xBLH25cASqZDU7XneV
         1RUg==
X-Gm-Message-State: AOAM530kqP6uzTlSr38ts8QZ3oXqRNr2Qc6IRddLeyipkZ8AHdHgl27s
	A/kRx3nIcoJbZk1vtdbVDHs=
X-Google-Smtp-Source: ABdhPJwqx6x4zfaaNXs3hip1MrGQWDzMJ1aziOlNPCMVNNhEzttDkRqQAwuDm1jVkFyWnxpwXzRJYA==
X-Received: by 2002:a17:903:2406:b0:14d:6447:990c with SMTP id e6-20020a170903240600b0014d6447990cmr1048970plo.22.1648056024958;
        Wed, 23 Mar 2022 10:20:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Wenchao Wang <wenchao.wang@intel.com>,
	Laurent Vivier <lvivier@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Cameron Esfahani <dirty@apple.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	haxm-team@intel.com,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Colin Xu <colin.xu@intel.com>,
	Mark Kanda <mark.kanda@oracle.com>
Subject: [PATCH v4 12/13] softmmu/cpus: Free cpu->thread in generic_destroy_vcpu_thread()
Date: Wed, 23 Mar 2022 18:17:50 +0100
Message-Id: <20220323171751.78612-13-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mark Kanda <mark.kanda@oracle.com>

Free cpu->thread in a new AccelOpsClass::destroy_vcpu_thread() handler
generic_destroy_vcpu_thread().

vCPU hotunplug related leak reported by Valgrind:

  ==102631== 8 bytes in 1 blocks are definitely lost in loss record 1,037 of 8,555
  ==102631==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
  ==102631==    by 0x69EE4CD: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5600.4)
  ==102631==    by 0x92443A: kvm_start_vcpu_thread (kvm-accel-ops.c:68)
  ==102631==    by 0x4505C2: qemu_init_vcpu (cpus.c:643)
  ==102631==    by 0x76B4D1: x86_cpu_realizefn (cpu.c:6520)
  ==102631==    by 0x9344A7: device_set_realized (qdev.c:531)
  ==102631==    by 0x93E329: property_set_bool (object.c:2273)
  ==102631==    by 0x93C2F8: object_property_set (object.c:1408)
  ==102631==    by 0x940796: object_property_set_qobject (qom-qobject.c:28)
  ==102631==    by 0x93C663: object_property_set_bool (object.c:1477)
  ==102631==    by 0x933D3B: qdev_realize (qdev.c:333)
  ==102631==    by 0x455EC4: qdev_device_add_from_qdict (qdev-monitor.c:713)

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Message-Id: <20220321141409.3112932-3-mark.kanda@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/cpus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 37325b3b8d..efa8397f04 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -619,6 +619,7 @@ static void common_vcpu_thread_create(CPUState *cpu)
 
 static void common_vcpu_thread_destroy(CPUState *cpu)
 {
+    g_free(cpu->thread);
 }
 
 void cpu_remove_sync(CPUState *cpu)
-- 
2.35.1



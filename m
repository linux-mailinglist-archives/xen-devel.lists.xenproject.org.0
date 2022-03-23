Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8DC4E5790
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 18:34:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294014.499728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4rt-0002hu-TN; Wed, 23 Mar 2022 17:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294014.499728; Wed, 23 Mar 2022 17:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4rt-0002fg-Q0; Wed, 23 Mar 2022 17:33:57 +0000
Received: by outflank-mailman (input) for mailman id 294014;
 Wed, 23 Mar 2022 17:33:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s5zF=UC=gmail.com=philippe.mathieu.daude@srs-se1.protection.inumbo.net>)
 id 1nX4f1-0004Zy-UB
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 17:20:40 +0000
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [2607:f8b0:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ed3205c-aacd-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 18:20:39 +0100 (CET)
Received: by mail-pg1-x52e.google.com with SMTP id c2so1663318pga.10
 for <xen-devel@lists.xenproject.org>; Wed, 23 Mar 2022 10:20:39 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 y12-20020a17090a784c00b001c6bdafc995sm5775028pjl.3.2022.03.23.10.20.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:20:37 -0700 (PDT)
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
X-Inumbo-ID: 8ed3205c-aacd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=32I90XyrSsgFhoTvAz7kFHmgBFJVrEU2lmj8L6zrA7w=;
        b=HziQehOw9rA6WaAjt6GWtN96OEZQKNeqtt8BUYKzQhy7osdWurjWlBG20QGQW/EB+F
         jeu4GS9/mQNcxaXFiYXQHD+Newqzq1veJVbG2jRb7R8WXmdqG/gVdrZDjIlDxW4lRXOq
         I71naYjPm4YaQCCMtZQaseOvo60Lz/IkNWzSHUBWsfnNXC2oOABAKojB2mfg+D9g7D1D
         aCifnKvwu9gBP/efpCWO8b9KL2IWYDxFdNbknFbXsjBT6YGAcCikhEVWZMzFhjo4Dyoi
         m5OUOkfn3o+MT9iQ4opD1tk8fsbzJgw5Qcb9c/JxYjHFhN6Q4eH03QkTyrPcQEV21Vlq
         Vusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=32I90XyrSsgFhoTvAz7kFHmgBFJVrEU2lmj8L6zrA7w=;
        b=hoDzNMtLr98gAiXwnT/9dSSVZLcHaMv7grg300hG6EcH2/SCBDDeauoRmhCeSoIPkQ
         hxq1T1k7Bk8at4m+qenGo5nvQZ4wnI+ambWD8LI5m2bwU7AfOJNSR39twij1Y138V6Dz
         eJt75pXFs4JJX9hwmoFDyt4HLJiOgPWCg7DsgEfHXViQXwxBzx707TDib0c7JAWg91k/
         mYwowiTZoy+kMEBHd3c0Pe8gXIfShW3k5xFIRk/AMf8pYkx0j8wagp/tlHZd/4MlOAf/
         tWjnuY179qMERV9V8tLcVCMABuF67ovzX12UwrTjs8IsW9S6/E4VaHl2UKqTxq7D3XBY
         bitw==
X-Gm-Message-State: AOAM533wR8LDc1ymNWwEtJl6sk/h4zpUJMwjD1Rhifbo8Yo3fEAemuWd
	64z8Z2/sBDG34TLy50t8E6o=
X-Google-Smtp-Source: ABdhPJzitqpHPUzN1FOlO6Xy6wxyKTy6324HAUZa9Y29UTDRmfk9C7LuqvIVu5doI3n8WNcv+vf6iw==
X-Received: by 2002:a63:1e52:0:b0:380:ae84:256e with SMTP id p18-20020a631e52000000b00380ae84256emr758991pgm.84.1648056037806;
        Wed, 23 Mar 2022 10:20:37 -0700 (PDT)
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
Subject: [PATCH v4 13/13] softmmu/cpus: Free cpu->halt_cond in generic_destroy_vcpu_thread()
Date: Wed, 23 Mar 2022 18:17:51 +0100
Message-Id: <20220323171751.78612-14-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mark Kanda <mark.kanda@oracle.com>

vCPU hotunplug related leak reported by Valgrind:

  ==102631== 56 bytes in 1 blocks are definitely lost in loss record 5,089 of 8,555
  ==102631==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
  ==102631==    by 0x69EE4CD: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5600.4)
  ==102631==    by 0x924452: kvm_start_vcpu_thread (kvm-accel-ops.c:69)
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
Message-Id: <20220321141409.3112932-4-mark.kanda@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/cpus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index efa8397f04..23bed29545 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -620,6 +620,7 @@ static void common_vcpu_thread_create(CPUState *cpu)
 static void common_vcpu_thread_destroy(CPUState *cpu)
 {
     g_free(cpu->thread);
+    g_free(cpu->halt_cond);
 }
 
 void cpu_remove_sync(CPUState *cpu)
-- 
2.35.1



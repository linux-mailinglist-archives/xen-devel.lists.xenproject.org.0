Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B0C4E5746
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 18:18:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293995.499662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4cw-0005Tw-3M; Wed, 23 Mar 2022 17:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293995.499662; Wed, 23 Mar 2022 17:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4cw-0005S2-0A; Wed, 23 Mar 2022 17:18:30 +0000
Received: by outflank-mailman (input) for mailman id 293995;
 Wed, 23 Mar 2022 17:18:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s5zF=UC=gmail.com=philippe.mathieu.daude@srs-se1.protection.inumbo.net>)
 id 1nX4ct-0004Zy-Ry
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 17:18:27 +0000
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4019c6a7-aacd-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 18:18:27 +0100 (CET)
Received: by mail-pj1-x1035.google.com with SMTP id
 o3-20020a17090a3d4300b001c6bc749227so2492351pjf.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Mar 2022 10:18:27 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 s6-20020a056a0008c600b004f667b8a6b6sm448750pfu.193.2022.03.23.10.18.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:18:25 -0700 (PDT)
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
X-Inumbo-ID: 4019c6a7-aacd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kr2xMtMFIyMaJvHp1QmAibj3cqEfTuMfM82zkP/aCIo=;
        b=GzQ9UQBsumIhsWs2W2K2ffiFYxEFSk/uJQDwHsoJE62lVsznZpDAk+rbusDkg4/pXh
         oYRTWwWf3XXjgqFP4meFBl7xIZslLNSKyF5Y1Nkqv7BIN9qrP/HEZc2GPulKuv+eyy0Q
         CSLUBGrImnHkarTBPYHhqd4Bz5klN6S1366sxNVa10mTmSfYbuDDmi6EMLlX9llM8fg1
         Rm4ZEgKbpo0wmx0loAPNkIBIdsbxwIgizQ0MiPiw3WJfDKD7pBaLfqF/gCCtKxZBp7LS
         gRHq1IcA4FNU/hF6TniJKOWUVqcOHD5j7pUDrlVzfih8abviJtAdwMVwFP6x0OrQ4GyB
         ud3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kr2xMtMFIyMaJvHp1QmAibj3cqEfTuMfM82zkP/aCIo=;
        b=nHHTaCFZaE6QoD/OuDLxcFvMeu05SRdgOgaO8m89OLe5t9A/k7m9s00Cki4J0Rtfex
         Ig5+FtLmNW795Tjg5/aI45IQEN3mmyaes3qJ/Zkj4ImW7glqpDyvk3BM+zTwaZ+jLaOt
         35l/zwMbfO9S8q83bhJYoeRpAc+D6M2Hh5CjVByzcy26kXCpTwpEpJo80laOQ9vHDHev
         u4CugEET9JJFLZL7H9Cyx3WRtMJVRxUNIizvVIIZwetFDfsU6tR51wMGrxjT/99bHUwl
         TZcxpfNtLm9HVVDOC/BOL+1kSUBrQR/UmPb7DYefhMEJjNUGRoicN6BxRA3iSupEYt0c
         GR+A==
X-Gm-Message-State: AOAM531aEnvK/QuxiidNDp69DFZA0wxPsF/w6vQvmsg7j9LDVC4KNu+q
	+bP67QJIdgMIjgzgaC1TTfc=
X-Google-Smtp-Source: ABdhPJyp9ousXQMjN1mFJdianu0WkJ5NuwBi+VzVmYIuZ9KnREKdbkqv1O8I5j4eIk26Y9GvJf6XJA==
X-Received: by 2002:a17:902:834a:b0:14f:3337:35de with SMTP id z10-20020a170902834a00b0014f333735demr1074863pln.8.1648055905736;
        Wed, 23 Mar 2022 10:18:25 -0700 (PDT)
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
Subject: [PATCH v4 02/13] target/i386/kvm: Free xsave_buf when destroying vCPU
Date: Wed, 23 Mar 2022 18:17:40 +0100
Message-Id: <20220323171751.78612-3-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Fix vCPU hot-unplug related leak reported by Valgrind:

  ==132362== 4,096 bytes in 1 blocks are definitely lost in loss record 8,440 of 8,549
  ==132362==    at 0x4C3B15F: memalign (vg_replace_malloc.c:1265)
  ==132362==    by 0x4C3B288: posix_memalign (vg_replace_malloc.c:1429)
  ==132362==    by 0xB41195: qemu_try_memalign (memalign.c:53)
  ==132362==    by 0xB41204: qemu_memalign (memalign.c:73)
  ==132362==    by 0x7131CB: kvm_init_xsave (kvm.c:1601)
  ==132362==    by 0x7148ED: kvm_arch_init_vcpu (kvm.c:2031)
  ==132362==    by 0x91D224: kvm_init_vcpu (kvm-all.c:516)
  ==132362==    by 0x9242C9: kvm_vcpu_thread_fn (kvm-accel-ops.c:40)
  ==132362==    by 0xB2EB26: qemu_thread_start (qemu-thread-posix.c:556)
  ==132362==    by 0x7EB2159: start_thread (in /usr/lib64/libpthread-2.28.so)
  ==132362==    by 0x9D45DD2: clone (in /usr/lib64/libc-2.28.so)

Reported-by: Mark Kanda <mark.kanda@oracle.com>
Tested-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/kvm/kvm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index ef2c68a6f4..e93440e774 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2072,6 +2072,8 @@ int kvm_arch_destroy_vcpu(CPUState *cs)
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
 
+    g_free(env->xsave_buf);
+
     if (cpu->kvm_msr_buf) {
         g_free(cpu->kvm_msr_buf);
         cpu->kvm_msr_buf = NULL;
-- 
2.35.1



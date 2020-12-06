Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 287F62D0699
	for <lists+xen-devel@lfdr.de>; Sun,  6 Dec 2020 19:56:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45757.81212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klzC2-0005k5-JT; Sun, 06 Dec 2020 18:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45757.81212; Sun, 06 Dec 2020 18:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klzC2-0005jY-EX; Sun, 06 Dec 2020 18:55:34 +0000
Received: by outflank-mailman (input) for mailman id 45757;
 Sun, 06 Dec 2020 18:55:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PoKi=FK=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1klzC0-0005ic-Lj
 for xen-devel@lists.xenproject.org; Sun, 06 Dec 2020 18:55:32 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id fa5d5863-28a5-4171-8c2d-6245d167b2af;
 Sun, 06 Dec 2020 18:55:31 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-zS-F1DX3OMGr4O9orLkbUg-1; Sun, 06 Dec 2020 13:55:30 -0500
Received: by mail-wm1-f71.google.com with SMTP id r5so4360870wma.2
 for <xen-devel@lists.xenproject.org>; Sun, 06 Dec 2020 10:55:29 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id i5sm12530329wrw.45.2020.12.06.10.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 10:55:28 -0800 (PST)
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
X-Inumbo-ID: fa5d5863-28a5-4171-8c2d-6245d167b2af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607280931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zj+VAsR2ZoGWNnB8pF1RFhJWmR0T2bfs3Brc/xrE4Jk=;
	b=eOjZ2gvY9aHksYNUJDp52FT47A5P6K4RubxOFKoEd9HpdjDLpHaWtEioazmo8xDuzBtTI+
	Yr1kKKbRgBovNZ4Qfi8Zd0MoI94kziJAyqLrHfDD1jrNKm9zs8d/k/kUpOx7zwlMr+MK12
	Je077ACTFDNQmt35UwBDGJaLxibUXQA=
X-MC-Unique: zS-F1DX3OMGr4O9orLkbUg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zj+VAsR2ZoGWNnB8pF1RFhJWmR0T2bfs3Brc/xrE4Jk=;
        b=XyI+UkARtPK1QFUZcgLv5Q/89csM6Y4NGgwq3gG8sYto/yyuq7gv4DYeRe0lp1zIS6
         pOfFnH5QtI8jlEkgirecbW2p38HJPZnyeJ5Y4ySbLjtXZOoeKDLsErAF+kH9guHayJ9J
         2RHv+OTBKQkVyp/aFruJpHHESlMtGYGTmgPFr1ZGd3juXRG15eqxRJptGdaL0EuMX4tx
         bIpJyUuxxSgleDd1DgAuNEGTyaj7sv6mtgKd7yPY0Mkt//LavVJgUSxu5Cdr0g+OfL7v
         UD/wGndrnZ482a9Jl5iHlczrdRh0PA++e5mS6vz9HoQ2LU0F9v0enJ1RBxQDcJHPa/Nk
         MUBw==
X-Gm-Message-State: AOAM533fq4CrCt7ISCguoM9cNX0cs0epbapd5A8fCvIRNxbUtyDPQl1A
	bWPjlQ8TI/iGYuAKMTeYBi3X3RNBM+yR0zYC88ASu6Cpr+xtAagLhqVIhnedc+sQNqcafglkFkk
	GdKnap0W403jkM7ygEuWbmXiJtuc=
X-Received: by 2002:a1c:a501:: with SMTP id o1mr9847440wme.44.1607280928821;
        Sun, 06 Dec 2020 10:55:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjfkR9jOQCSNmbsQLisARRNPGgWAcGrUN24/vbSdXT+mIj5Zt7/jygW8L9ukGbdalO0fSF2A==
X-Received: by 2002:a1c:a501:: with SMTP id o1mr9847417wme.44.1607280928628;
        Sun, 06 Dec 2020 10:55:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Huacai Chen <chenhc@lemote.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Claudio Fontana <cfontana@suse.de>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-s390x@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-arm@nongnu.org
Subject: [PATCH 3/8] gitlab-ci: Add KVM X86 cross-build jobs
Date: Sun,  6 Dec 2020 19:55:03 +0100
Message-Id: <20201206185508.3545711-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206185508.3545711-1-philmd@redhat.com>
References: <20201206185508.3545711-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Cross-build x86 target with only KVM accelerator enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds-kvm-x86.yml | 6 ++++++
 .gitlab-ci.yml                       | 1 +
 MAINTAINERS                          | 1 +
 3 files changed, 8 insertions(+)
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-x86.yml

diff --git a/.gitlab-ci.d/crossbuilds-kvm-x86.yml b/.gitlab-ci.d/crossbuilds-kvm-x86.yml
new file mode 100644
index 00000000000..9719a19d143
--- /dev/null
+++ b/.gitlab-ci.d/crossbuilds-kvm-x86.yml
@@ -0,0 +1,6 @@
+cross-amd64-kvm:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-amd64-cross
+    TARGETS: i386-softmmu,x86_64-softmmu
+    ACCEL_CONFIGURE_OPTS: --disable-tcg
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d0173e82b16..cdfa1f82a3d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -12,6 +12,7 @@ include:
   - local: '/.gitlab-ci.d/opensbi.yml'
   - local: '/.gitlab-ci.d/containers.yml'
   - local: '/.gitlab-ci.d/crossbuilds.yml'
+  - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
 
 .native_build_job_template: &native_build_job_definition
   stage: build
diff --git a/MAINTAINERS b/MAINTAINERS
index 68bc160f41b..8d7e2fdb7e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -427,6 +427,7 @@ L: kvm@vger.kernel.org
 S: Supported
 F: target/i386/kvm.c
 F: scripts/kvm/vmxcap
+F: .gitlab-ci.d/crossbuilds-kvm-x86.yml
 
 Guest CPU Cores (other accelerators)
 ------------------------------------
-- 
2.26.2



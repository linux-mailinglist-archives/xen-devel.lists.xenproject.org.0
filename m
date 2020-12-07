Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 629832D0EE1
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 12:24:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46266.82108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEcl-0005rN-UW; Mon, 07 Dec 2020 11:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46266.82108; Mon, 07 Dec 2020 11:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEcl-0005qf-R5; Mon, 07 Dec 2020 11:24:11 +0000
Received: by outflank-mailman (input) for mailman id 46266;
 Mon, 07 Dec 2020 11:24:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Pxd=FL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kmEcj-0005oS-Jx
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 11:24:09 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 45bbaa15-1bce-4220-9995-bfb0d29a3ca6;
 Mon, 07 Dec 2020 11:24:05 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-RUVXkkTgOOeyigoxdyCdaQ-1; Mon, 07 Dec 2020 06:24:03 -0500
Received: by mail-wr1-f70.google.com with SMTP id j5so2673264wro.12
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 03:24:03 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id k11sm13362266wmj.42.2020.12.07.03.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 03:24:01 -0800 (PST)
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
X-Inumbo-ID: 45bbaa15-1bce-4220-9995-bfb0d29a3ca6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607340245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U6QCRjxKvIwhYoV/41s2s2+6dI4wCbnqhxRPlqlth8U=;
	b=EfzQpQ/kqV49/D6sGFTAsOqsOLFZiRI2HKbkO+YuCnpL5UmPxJVmcpQyIpWrAOg2QMSpnF
	1/k90VajmPa2g2TPI5nIS809Km5vRJ5nnV5BwbaaBjyoWGJEq+73dWNZKyL9fWN6Z3RKGw
	dkU9z6fFhaV/DULnOwAUXui7lob1Ubg=
X-MC-Unique: RUVXkkTgOOeyigoxdyCdaQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U6QCRjxKvIwhYoV/41s2s2+6dI4wCbnqhxRPlqlth8U=;
        b=kXpfBmBZ1l4yCLwL2/JgGNV4fi/Dz408TViGA+hLTx+QmIWBYVnxz+0r10ZA1x9L46
         3wFpymw38B1MC4rHUIrQvioYK7JBzUdUT6RLuRqdVbsldpALsRxB/dYYFVjKFWA/bVU9
         fE67PKq/cijKTJb1rIveBSDsbPmzwzUg0qb3V8Dou0gvuIMYoR4TLiq57K9urRflafLn
         hEH2B/L+yOO+skYtGaTUZ2WgcwDRg5K47/iqB90PIpbUSo1wqcLuS4B32iZE/wmxC1sn
         NeRMd7J283Wg4YCVcOI++qNb0NP+ZewOisgieXij9fHCiXRffG2aKt/nnF1+wBH38dIT
         cEdg==
X-Gm-Message-State: AOAM53253XMOitZJRDBENSjPFj9bUU940PdTMGd0Xi0olC7J+L4vA6wM
	b6VuIDmK9UJuah0VxBWcSMigrrFMubq/eeB42qKOBj4639zgUBllRJssqwf60hwGKVmBfeH5Tkt
	G9DdCtysNHSSFlwiDO1YiRHhWOU4=
X-Received: by 2002:a1c:4907:: with SMTP id w7mr10183699wma.175.1607340242504;
        Mon, 07 Dec 2020 03:24:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUOPOj91GL2D5bWSF19z1crpAKZX/6htMwNjDW7CLNGlfCM/ktiYiE4SKzGGKVP6p9Vp9lvg==
X-Received: by 2002:a1c:4907:: with SMTP id w7mr10183684wma.175.1607340242361;
        Mon, 07 Dec 2020 03:24:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Willian Rampazzo <wrampazz@redhat.com>,
	qemu-s390x@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/5] gitlab-ci: Document 'build-tcg-disabled' is a KVM X86 job
Date: Mon,  7 Dec 2020 12:23:49 +0100
Message-Id: <20201207112353.3814480-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207112353.3814480-1-philmd@redhat.com>
References: <20201207112353.3814480-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document what this job cover (build X86 targets with
KVM being the single accelerator available).

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d0173e82b16..ee31b1020fe 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -220,6 +220,11 @@ build-disabled:
       s390x-softmmu i386-linux-user
     MAKE_CHECK_ARGS: check-qtest SPEED=slow
 
+# This jobs explicitly disable TCG (--disable-tcg), KVM is detected by
+# the configure script. The container doesn't contain Xen headers so
+# Xen accelerator is not detected / selected. As result it build the
+# i386-softmmu and x86_64-softmmu with KVM being the single accelerator
+# available.
 build-tcg-disabled:
   <<: *native_build_job_definition
   variables:
-- 
2.26.2



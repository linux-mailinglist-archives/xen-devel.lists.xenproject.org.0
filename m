Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B916A2D119A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 14:15:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46526.82575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmGMJ-0004De-8T; Mon, 07 Dec 2020 13:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46526.82575; Mon, 07 Dec 2020 13:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmGMJ-0004D4-4y; Mon, 07 Dec 2020 13:15:19 +0000
Received: by outflank-mailman (input) for mailman id 46526;
 Mon, 07 Dec 2020 13:15:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Pxd=FL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kmGMH-0004AL-Nr
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 13:15:17 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ce195ad8-dc95-405d-a39b-eba0d1d404d3;
 Mon, 07 Dec 2020 13:15:15 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-3jHvaCrGM4ix7YMFTP9OAA-1; Mon, 07 Dec 2020 08:15:14 -0500
Received: by mail-wm1-f70.google.com with SMTP id g198so4096852wme.7
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 05:15:13 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id k18sm2265572wrd.45.2020.12.07.05.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 05:15:11 -0800 (PST)
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
X-Inumbo-ID: ce195ad8-dc95-405d-a39b-eba0d1d404d3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607346915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DUD443fjC7TlYCq2Zs7qkYPHzlFo7vsq2RAf28zHG0Y=;
	b=b49Y+4DyR6uXgzYr3drfs9eM2NaovpAiJryrok+zE1zpgP+0GZJlY/9Apr+vIgcT8Xveo7
	jbAkDr/2jZGDMDIb95XFKAd+21AM+VaEWpYUvgc8DOa8nclMXIV3lg9Dzf2dkKPa5In1yf
	QnNEFAFVp14994KiswEMc6UsNe7OdU0=
X-MC-Unique: 3jHvaCrGM4ix7YMFTP9OAA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DUD443fjC7TlYCq2Zs7qkYPHzlFo7vsq2RAf28zHG0Y=;
        b=FgcJ+ktQ2c9T7D/4Pmw0aIg71534K1f3viN1MjIDLKTLeBSRcEwzqjtX857mIHZiQ0
         kJL3k4XYy4mlaHZuhWuWDzQ6ORYtP1/YRFmSGn8zXHbMh3XpvzzkSv5fHX5R5Z3N/Men
         aWhVdnXlBtne/6skXyYDIeQMOv9KWfZoIY+pcGXmTMwGmO0KPDRcbZYxp6/OpHvh48y7
         8F4NGJ7gcXogGfqfd7AP9JZCf/qHViLnVBuvfCk56dYV47Uzu7WxkukaRpd0cEmg4QOB
         CYmQowiRy33pQqddSWkeScwy9BC0OwSc8VjhPgyvr/oH13KU0Iz/g81Dxd/IXHioccAK
         EhiA==
X-Gm-Message-State: AOAM533AR709HvD9jAJT7ZVz7MvuhCNf4KwW/S6bDNCpFIPSn+X8LEhf
	hq+YPnz2Aw+MvdS6F71ouutp/xfv9a4Pnu/eXP5Wpdwt10XP4nYHTwrPIKFN3n/KU/wAwWb7qg2
	LK9TewN05c0HjATJIJlt9WL2zzzg=
X-Received: by 2002:a1c:c2d4:: with SMTP id s203mr18470517wmf.58.1607346912730;
        Mon, 07 Dec 2020 05:15:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0KSXp7DP6CDis0L6tP1I2Gzz9cpg1u4ccuV+5/oiKxMdma/cepl4uO8AaAxQi4CtlwH61VQ==
X-Received: by 2002:a1c:c2d4:: with SMTP id s203mr18470485wmf.58.1607346912558;
        Mon, 07 Dec 2020 05:15:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-s390x@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Cornelia Huck <cohuck@redhat.com>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Claudio Fontana <cfontana@suse.de>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 1/5] gitlab-ci: Document 'build-tcg-disabled' is a KVM X86 job
Date: Mon,  7 Dec 2020 14:14:59 +0100
Message-Id: <20201207131503.3858889-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207131503.3858889-1-philmd@redhat.com>
References: <20201207131503.3858889-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document what this job cover (build X86 targets with
KVM being the single accelerator available).

Reviewed-by: Thomas Huth <thuth@redhat.com>
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



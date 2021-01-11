Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEB22F197F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 16:21:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64949.114897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyyzl-0003fY-Be; Mon, 11 Jan 2021 15:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64949.114897; Mon, 11 Jan 2021 15:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyyzl-0003f6-8L; Mon, 11 Jan 2021 15:20:37 +0000
Received: by outflank-mailman (input) for mailman id 64949;
 Mon, 11 Jan 2021 15:20:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3k0/=GO=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kyyzj-0003dl-US
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 15:20:35 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 3da01946-4892-4707-9f23-bff586d8be1c;
 Mon, 11 Jan 2021 15:20:34 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-fxOlP0HeNFC9klyPomdPaA-1; Mon, 11 Jan 2021 10:20:32 -0500
Received: by mail-ed1-f69.google.com with SMTP id e11so8394406edn.11
 for <xen-devel@lists.xenproject.org>; Mon, 11 Jan 2021 07:20:32 -0800 (PST)
Received: from x1w.redhat.com (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id c12sm76932edw.55.2021.01.11.07.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 07:20:30 -0800 (PST)
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
X-Inumbo-ID: 3da01946-4892-4707-9f23-bff586d8be1c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610378434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=97BNT6jh6NRO0TVk+TL23RreQDhzFRma0TINePq+NK8=;
	b=gkISrOGj+re/41lTjOkWdcVMMaJMWpIBT1Bln1bCFxYZdv3LHcMD14FsqGWJmJJrs0v6HY
	TQ+2qNUyLHpXS12AK3JxwGaya7Sv12ZMHIg/QECG0TxArJWnBO2P+/wXdazOkNNWD/o0Qf
	sbIbuUKFYGtt8PUb2knBezRBaXVXfKM=
X-MC-Unique: fxOlP0HeNFC9klyPomdPaA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=97BNT6jh6NRO0TVk+TL23RreQDhzFRma0TINePq+NK8=;
        b=f8RyhASFZ7P6cD2RFfIM9msx5ngDGvrQFdlFha230L9OgOIN9Sbe9geLUr2fhYrLwF
         unGawZS4oXH/C2aqSv1zLhCX5QSdd6UzYPK3S5sfamUHcK3KulOrvfwgbgUvkN9tsbgj
         NofvT1ZV/eC0+bZtlVDvTVX6jlCfkXQ862VKRmstigYD9gWwXzV/RnXVCsQK4aqiUJ7y
         M+qooGa7yzBwFQ6MxUUAJY9QcmSHTJjJNRWCPzHXpCqnWy4V1jCSk1147IfJ9WHWBW52
         Uo2IITZXCq2OLPfeGWDq334ZYi7WmKLz6gs0GaN1BbeqOv4WJC+/ebdk09LEQBXYgu1c
         s+mg==
X-Gm-Message-State: AOAM530M37L53Ww4hWYYkwyo6fHgkeCrRZHP4Mp8tdHM00eE5v26C4EE
	ky87Tid5gc+114/PX4uVkSNbiVrr4cXFn52A+xDeTHLgheEFDqcOhuPWberlWzPsPI5qoYgr957
	hautCx/Oqbdsgi6E0zoZ1WlFzzDg=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr14237011edw.52.1610378431357;
        Mon, 11 Jan 2021 07:20:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfzQ4g/Xi77uXbjKsyJn2nZrlWGnmTOg2kIy8FkRbXj1BTf3rxwC5MxkZMkcW73D4xDrLEXw==
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr14236981edw.52.1610378431207;
        Mon, 11 Jan 2021 07:20:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Greg Kurz <groug@kaod.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-trivial@nongnu.org,
	Amit Shah <amit@kernel.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	qemu-arm@nongnu.org,
	John Snow <jsnow@redhat.com>,
	qemu-s390x@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Fam Zheng <fam@euphon.net>,
	qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Cornelia Huck <cohuck@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	qemu-block@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/2] sysemu/runstate: Let runstate_is_running() return bool
Date: Mon, 11 Jan 2021 16:20:19 +0100
Message-Id: <20210111152020.1422021-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111152020.1422021-1-philmd@redhat.com>
References: <20210111152020.1422021-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

runstate_check() returns a boolean. runstate_is_running()
returns what runstate_check() returns, also a boolean.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/runstate.h | 2 +-
 softmmu/runstate.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index e557f470d42..3ab35a039a0 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -6,7 +6,7 @@
 
 bool runstate_check(RunState state);
 void runstate_set(RunState new_state);
-int runstate_is_running(void);
+bool runstate_is_running(void);
 bool runstate_needs_reset(void);
 bool runstate_store(char *str, size_t size);
 
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 636aab0addb..c7a67147d17 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -217,7 +217,7 @@ void runstate_set(RunState new_state)
     current_run_state = new_state;
 }
 
-int runstate_is_running(void)
+bool runstate_is_running(void)
 {
     return runstate_check(RUN_STATE_RUNNING);
 }
-- 
2.26.2



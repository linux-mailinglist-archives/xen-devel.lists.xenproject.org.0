Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA01F650C55
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 14:02:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466035.724886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Fmj-0007Cb-Ng; Mon, 19 Dec 2022 13:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466035.724886; Mon, 19 Dec 2022 13:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Fmj-00077T-Gw; Mon, 19 Dec 2022 13:02:25 +0000
Received: by outflank-mailman (input) for mailman id 466035;
 Mon, 19 Dec 2022 13:02:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fa7U=4R=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1p7Fmi-0006zl-59
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 13:02:24 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60177011-7f9d-11ed-91b6-6bf2151ebd3b;
 Mon, 19 Dec 2022 14:02:22 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-rbAz9N-rM3GgWBs_tCRJuw-1; Mon, 19 Dec 2022 08:02:17 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B973D88743B;
 Mon, 19 Dec 2022 13:02:09 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C57F14171BA;
 Mon, 19 Dec 2022 13:02:09 +0000 (UTC)
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
X-Inumbo-ID: 60177011-7f9d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671454941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y/JPz/RYrixYpdTBpAkJB1EIwOzHLyPTKspd8A5hdhQ=;
	b=OIGzZZRUMOGxHlpk2/CfBdTi7o4wG8gHbniDrDEHu0o6y2YXcs4RJdH7Oih24haPN6mzRL
	qR7SbXrJjMOoLrmT8uKMEW8qLeLpNZtaGyblT+JDZ6v7rP9zq2UCg+kFk5Q5LXgWv08Gpr
	vVT9yLdUM3fExYbBbTu22+UhxAxg4/s=
X-MC-Unique: rbAz9N-rM3GgWBs_tCRJuw-1
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org,
	Laurent Vivier <lvivier@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	virtio-fs@redhat.com,
	Michael Roth <michael.roth@amd.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-block@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	John Snow <jsnow@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 4/6] util/error: add G_GNUC_PRINTF for various functions
Date: Mon, 19 Dec 2022 08:02:03 -0500
Message-Id: <20221219130205.687815-5-berrange@redhat.com>
In-Reply-To: <20221219130205.687815-1-berrange@redhat.com>
References: <20221219130205.687815-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 util/error-report.c | 1 +
 util/error.c        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/util/error-report.c b/util/error-report.c
index 5edb2e6040..6e44a55732 100644
--- a/util/error-report.c
+++ b/util/error-report.c
@@ -193,6 +193,7 @@ real_time_iso8601(void)
  * a single phrase, with no newline or trailing punctuation.
  * Prepend the current location and append a newline.
  */
+G_GNUC_PRINTF(2, 0)
 static void vreport(report_type type, const char *fmt, va_list ap)
 {
     gchar *timestr;
diff --git a/util/error.c b/util/error.c
index b6c89d1412..1e7af665b8 100644
--- a/util/error.c
+++ b/util/error.c
@@ -45,6 +45,7 @@ static void error_handle_fatal(Error **errp, Error *err)
     }
 }
 
+G_GNUC_PRINTF(6, 0)
 static void error_setv(Error **errp,
                        const char *src, int line, const char *func,
                        ErrorClass err_class, const char *fmt, va_list ap,
-- 
2.38.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ECA3FFC47
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 10:50:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177913.323700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4tQ-0007OR-5D; Fri, 03 Sep 2021 08:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177913.323700; Fri, 03 Sep 2021 08:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4tQ-0007M5-1n; Fri, 03 Sep 2021 08:49:48 +0000
Received: by outflank-mailman (input) for mailman id 177913;
 Fri, 03 Sep 2021 08:49:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FOYs=NZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mM4tP-0006nG-Gh
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 08:49:47 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0641dec-0c93-11ec-aefe-12813bfff9fa;
 Fri, 03 Sep 2021 08:49:41 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 67AF722666;
 Fri,  3 Sep 2021 08:49:40 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 1527913754;
 Fri,  3 Sep 2021 08:49:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id SD+dA6ThMWFjdAAAGKfGzw
 (envelope-from <jgross@suse.com>); Fri, 03 Sep 2021 08:49:40 +0000
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
X-Inumbo-ID: e0641dec-0c93-11ec-aefe-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1630658980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2A79ijv44MFRRI4yP9IKOdGZLkyzD6D8f46U5bOTMG8=;
	b=YaUyhefWzsHHkhY9meNyZ+nn5OZODEbPW68xXVIYL/Z3GsIY0wJ6ADl0f1uKxP/ao0IOzf
	7tkHLaKoHp2ra3Mq30rV0xmgUe0Zvl3BHYlchwLyMW2aH5QnXmYyUenSuhEv6x4NLizQQM
	xQiOoW4Iv3P3Ud7OZuNeMHRCHmstlzk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Len Brown <len.brown@intel.com>,
	Pavel Machek <pavel@ucw.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] PM: base: power: don't try to use non-existing RTC for storing data
Date: Fri,  3 Sep 2021 10:49:36 +0200
Message-Id: <20210903084937.19392-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210903084937.19392-1-jgross@suse.com>
References: <20210903084937.19392-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In there is no legacy RTC device, don't try to use it for storing trace
data across suspend/resume.

Cc: <stable@vger.kernel.org>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/base/power/trace.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/base/power/trace.c b/drivers/base/power/trace.c
index a97f33d0c59f..b7c80849455c 100644
--- a/drivers/base/power/trace.c
+++ b/drivers/base/power/trace.c
@@ -13,6 +13,7 @@
 #include <linux/export.h>
 #include <linux/rtc.h>
 #include <linux/suspend.h>
+#include <linux/init.h>
 
 #include <linux/mc146818rtc.h>
 
@@ -165,6 +166,9 @@ void generate_pm_trace(const void *tracedata, unsigned int user)
 	const char *file = *(const char **)(tracedata + 2);
 	unsigned int user_hash_value, file_hash_value;
 
+	if (!x86_platform.legacy.rtc)
+		return 0;
+
 	user_hash_value = user % USERHASH;
 	file_hash_value = hash_string(lineno, file, FILEHASH);
 	set_magic_time(user_hash_value, file_hash_value, dev_hash_value);
@@ -267,6 +271,9 @@ static struct notifier_block pm_trace_nb = {
 
 static int __init early_resume_init(void)
 {
+	if (!x86_platform.legacy.rtc)
+		return 0;
+
 	hash_value_early_read = read_magic_time();
 	register_pm_notifier(&pm_trace_nb);
 	return 0;
@@ -277,6 +284,9 @@ static int __init late_resume_init(void)
 	unsigned int val = hash_value_early_read;
 	unsigned int user, file, dev;
 
+	if (!x86_platform.legacy.rtc)
+		return 0;
+
 	user = val % USERHASH;
 	val = val / USERHASH;
 	file = val % FILEHASH;
-- 
2.26.2



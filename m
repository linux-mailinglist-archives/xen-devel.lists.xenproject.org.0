Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 338CB244D9D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:26:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTe-0004U4-Ue; Fri, 14 Aug 2020 17:26:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dRC-00024H-2M
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:24:18 +0000
X-Inumbo-ID: df00126f-7b1c-477e-b7cd-65eaef15690b
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df00126f-7b1c-477e-b7cd-65eaef15690b;
 Fri, 14 Aug 2020 17:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=9AKhCfm/1BqFPkQOzF0eCZveb5uEDpP3/r6hBuTaDWU=;
 b=cXUzS8fOItRDucrGknS6yM3y3J5cZXXs0mvFdSQC4TzAuZMhWx8dLfld
 AihCEKIXkanttD6xe/HvaTeV7nmqnG73dMDmGnoL7dOZRgq7PCP1A4p9b
 h+hAn11Z1I29NQU8gkuAJR101VNX2eko5PCECFlwoWMgpGZlQrVqjyibp A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: SENo5FDhy3QIJqjjqhN0YgzzQvC6XhG/zVSlqWh9KzytsK1lMr3iGQse5KFvQ38y3o5yDgD1Y8
 v4mL7uU48DjZYMFsYqYv6r20us/3Bwnn131HDb+9p+S/0ExMQS6VYlsJ7CIDyNQggbBh/IH2aq
 mi8XfIulczwkqL6nMPI2rrKhRBYkz9ck1doc/RUKzRN1U/L3+rwjTryu6dH9aLubISEYfosF7X
 Gk2ax/mou8GDuH4joLdcUNwPsPMldlIqUEoQLTR28JNbRdAOEUcNbLUbtygKtdn7HukVfYT5Vh
 xFo=
X-SBRS: 2.7
X-MesageID: 25487836
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="25487836"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 49/60] history reporting (nfc): Break out $url_ok_chars
Date: Fri, 14 Aug 2020 18:21:54 +0100
Message-ID: <20200814172205.9624-50-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
References: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

We will want this in a moment.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/HistoryReport.pm | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Osstest/HistoryReport.pm b/Osstest/HistoryReport.pm
index f8a49955..75ec75f3 100644
--- a/Osstest/HistoryReport.pm
+++ b/Osstest/HistoryReport.pm
@@ -45,6 +45,8 @@ BEGIN {
 
 use POSIX;
 
+our $url_ok_chars = '-+=/~:;_.,\w';
+
 our @key_cols;
 
 our $taskprint='';
@@ -163,7 +165,7 @@ sub url_unquote ($) {
 
 sub url_quote ($) {
     local ($_) = "$_[0]";
-    s{[^-+=/~:;_.,\w]}{ sprintf "%%%02x", ord $& }ge;
+    s{[^$url_ok_chars]}{ sprintf "%%%02x", ord $& }ge;
     $_;
 }
 
-- 
2.11.0



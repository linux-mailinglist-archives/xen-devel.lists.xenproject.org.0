Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F03D8326440
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 15:42:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90355.171008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeKG-0003Vk-OV; Fri, 26 Feb 2021 14:42:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90355.171008; Fri, 26 Feb 2021 14:42:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeKG-0003Ux-J7; Fri, 26 Feb 2021 14:42:40 +0000
Received: by outflank-mailman (input) for mailman id 90355;
 Fri, 26 Feb 2021 14:42:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=77G0=H4=amazon.de=prvs=684d0ac3b=nmanthey@srs-us1.protection.inumbo.net>)
 id 1lFeKF-0003Af-0i
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 14:42:39 +0000
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f72aee7e-87fb-4250-a417-5e8e4e12b4e6;
 Fri, 26 Feb 2021 14:42:35 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-579b7f5b.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 26 Feb 2021 14:42:35 +0000
Received: from EX13D02EUB003.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2c-579b7f5b.us-west-2.amazon.com (Postfix) with ESMTPS
 id 5220AA15CF; Fri, 26 Feb 2021 14:42:34 +0000 (UTC)
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D02EUB003.ant.amazon.com (10.43.166.172) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 26 Feb 2021 14:42:32 +0000
Received: from u6fc700a6f3c650.ant.amazon.com (10.1.212.27) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 26 Feb 2021 14:42:23 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f72aee7e-87fb-4250-a417-5e8e4e12b4e6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1614350555; x=1645886555;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=vbgIE8H3XZ85DmgU6vJvOMOFjDGWkhUCPA58yeFxSQY=;
  b=UP2scPgBu89tj4LtgnzPw/7OVOsUe84+39oH/hPuS7V5B6rEWmtIXNtl
   7kGsVAfPKE6KPNdpqt9yIjzO+za0Zx6zvvDgZjIXiwDdbTZHCzDEVFU8D
   Mf39rjqw4HbxJo5FuJXhEBdmZSEoW9ii9kUgq8tBGNl+WCgKMC4uBkN2j
   U=;
X-IronPort-AV: E=Sophos;i="5.81,208,1610409600"; 
   d="scan'208";a="88504759"
From: Norbert Manthey <nmanthey@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>, Wei Liu
	<wl@xen.org>, Julien Grall <jgrall@amazon.co.uk>, Michael Kurth
	<mku@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH XENSTORE v1 06/10] xenstored: handle port reads correctly
Date: Fri, 26 Feb 2021 15:41:40 +0100
Message-ID: <20210226144144.9252-7-nmanthey@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226144144.9252-1-nmanthey@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk

The read value could be larger than a signed 32bit integer. As -1 is
used as error value, we should not rely on using the full 32 bits.
Hence, when reading the port number, we should make sure we only return
valid values.

This change sanity checks the input.
The issue is that the value for the port is
 1. transmitted as a string, with a fixed amount of digits.
 2. Next, this string is parsed by a function that can deal with strings
    representing 64bit integers
 3. A 64bit integer is returned, and will be truncated to it's lower
    32bits, resulting in a wrong port number (in case the sender of the
    string decides to craft a suitable 64bit value).

The value is typically provided by the kernel, which has this value hard
coded in the proper range. As we use the function strtoul, non-digit
character are considered as end of the input, and hence do not require
checking. Therefore, this change only covers the corner case to make
sure we stay in the 32 bit range.

This bug was discovered and resolved using Coverity Static Analysis
Security Testing (SAST) by Synopsys, Inc.

Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
Reviewed-by: Thomas Friebel <friebelt@amazon.de>
Reviewed-by: Julien Grall <jgrall@amazon.co.uk>

---
 tools/xenstore/xenstored_posix.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_posix.c b/tools/xenstore/xenstored_posix.c
--- a/tools/xenstore/xenstored_posix.c
+++ b/tools/xenstore/xenstored_posix.c
@@ -116,7 +116,7 @@ evtchn_port_t xenbus_evtchn(void)
 {
 	int fd;
 	int rc;
-	evtchn_port_t port;
+	uint64_t port;
 	char str[20];
 
 	fd = open(XENSTORED_PORT_DEV, O_RDONLY);
@@ -136,6 +136,10 @@ evtchn_port_t xenbus_evtchn(void)
 	port = strtoul(str, NULL, 0);
 
 	close(fd);
+
+	if (port >= UINT32_MAX)
+		return -1;
+
 	return port;
 }
 
-- 
2.17.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879





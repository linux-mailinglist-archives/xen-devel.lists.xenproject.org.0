Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6279A3BE55F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 11:11:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152080.280968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m13a0-00084O-CR; Wed, 07 Jul 2021 09:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152080.280968; Wed, 07 Jul 2021 09:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m13a0-00082T-9I; Wed, 07 Jul 2021 09:10:52 +0000
Received: by outflank-mailman (input) for mailman id 152080;
 Wed, 07 Jul 2021 09:10:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dzvn=L7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1m13Zy-00082N-SF
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 09:10:50 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14fd9ce2-89e7-4425-b12e-ed4843cd12f7;
 Wed, 07 Jul 2021 09:10:49 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 73D1C1FD5C;
 Wed,  7 Jul 2021 09:10:48 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 3CDA613966;
 Wed,  7 Jul 2021 09:10:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 6ZHeDJhv5WDWOAAAGKfGzw
 (envelope-from <jgross@suse.com>); Wed, 07 Jul 2021 09:10:48 +0000
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
X-Inumbo-ID: 14fd9ce2-89e7-4425-b12e-ed4843cd12f7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1625649048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jBrTdZh0fhHdoZBmt7kZCO7hzkn6x3INTyY3C5pkFwM=;
	b=S2JKLryRPmjUmQr9qsJJMP4SAYWAeQdDK57J6LPLxK5z9x6x3XQrAFHaITXI3dWZAWazwE
	L7LZHl1Ecfl22mrcaxv93w06LSjduKdNmBf0P7ENfxbe5yed6jbPVBX7fEFsEiXK2/a3jd
	sC/5d4yUaeG8VZD/deLqErOUYhHNgho=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v2] xen/hvc: replace BUG_ON() with negative return value
Date: Wed,  7 Jul 2021 11:10:45 +0200
Message-Id: <20210707091045.460-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen frontends shouldn't BUG() in case of illegal data received from
their backends. So replace the BUG_ON()s when reading illegal data from
the ring page with negative return values.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- drop BUG_ON() (Christophe Leroy, Greg Kroah-Hartmann)
- replace WARN_ONCE() by pr_err_once() (Greg Kroah-Hartmann)
- break out from original series
---
 drivers/tty/hvc/hvc_xen.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
index 92c9a476defc..8f143c09a169 100644
--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -86,7 +86,11 @@ static int __write_console(struct xencons_info *xencons,
 	cons = intf->out_cons;
 	prod = intf->out_prod;
 	mb();			/* update queue values before going on */
-	BUG_ON((prod - cons) > sizeof(intf->out));
+
+	if ((prod - cons) > sizeof(intf->out)) {
+		pr_err_once("xencons: Illegal ring page indices");
+		return -EINVAL;
+	}
 
 	while ((sent < len) && ((prod - cons) < sizeof(intf->out)))
 		intf->out[MASK_XENCONS_IDX(prod++, intf->out)] = data[sent++];
@@ -114,7 +118,10 @@ static int domU_write_console(uint32_t vtermno, const char *data, int len)
 	 */
 	while (len) {
 		int sent = __write_console(cons, data, len);
-		
+
+		if (sent < 0)
+			return sent;
+
 		data += sent;
 		len -= sent;
 
@@ -138,7 +145,11 @@ static int domU_read_console(uint32_t vtermno, char *buf, int len)
 	cons = intf->in_cons;
 	prod = intf->in_prod;
 	mb();			/* get pointers before reading ring */
-	BUG_ON((prod - cons) > sizeof(intf->in));
+
+	if ((prod - cons) > sizeof(intf->in)) {
+		pr_err_once("xencons: Illegal ring page indices");
+		return -EINVAL;
+	}
 
 	while (cons != prod && recv < len)
 		buf[recv++] = intf->in[MASK_XENCONS_IDX(cons++, intf->in)];
-- 
2.26.2



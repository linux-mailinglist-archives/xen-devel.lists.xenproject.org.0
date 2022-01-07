Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2598A4875DE
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 11:47:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254357.436147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5mmA-0004iV-CU; Fri, 07 Jan 2022 10:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254357.436147; Fri, 07 Jan 2022 10:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5mmA-0004dU-8W; Fri, 07 Jan 2022 10:47:14 +0000
Received: by outflank-mailman (input) for mailman id 254357;
 Fri, 07 Jan 2022 10:47:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqIQ=RX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n5mm8-00042k-TJ
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 10:47:12 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 298be421-6fa7-11ec-9ce5-af14b9085ebd;
 Fri, 07 Jan 2022 11:47:09 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BFC3C1F3A2;
 Fri,  7 Jan 2022 10:47:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A158C13CCC;
 Fri,  7 Jan 2022 10:47:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mMMUJiwa2GHoEQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 07 Jan 2022 10:47:08 +0000
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
X-Inumbo-ID: 298be421-6fa7-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641552428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ns8EtRIR8x+IBI1Vuf5hHJfipnvDwTbW/7UbeMCK/V8=;
	b=eGpk+uGBBnD7UU57u0eCAaUYJMzN2y1rhbO5dCWDn9WdxJXdLs5LGhyL+Van6k5jOnj11t
	iNGQB65hdlhZOkAPKrXDHmeDbQWYeG2P7Bu642yWX1kfO1ZNQdMpDwl6tnbASB2jmuBoi8
	vyTpFcXov0As1rHT2UkjW0vHvQudEYc=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/2] mini-os: remove event channel specific struct file member
Date: Fri,  7 Jan 2022 11:47:05 +0100
Message-Id: <20220107104706.9859-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220107104706.9859-1-jgross@suse.com>
References: <20220107104706.9859-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The event channel specific union member in struct file is no longer
needed, so remove it together with the associated structure
definitions.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 include/lib.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/include/lib.h b/include/lib.h
index 7a0546b..cbfeea3 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -173,15 +173,6 @@ enum fd_type {
     FTYPE_TPM_TIS,
 };
 
-LIST_HEAD(evtchn_port_list, evtchn_port_info);
-
-struct evtchn_port_info {
-        LIST_ENTRY(evtchn_port_info) list;
-        evtchn_port_t port;
-        unsigned long pending;
-        int bound;
-};
-
 struct file {
     enum fd_type type;
     bool read;	/* maybe available for read */
@@ -189,9 +180,6 @@ struct file {
     union {
         int fd; /* Any fd from an upper layer. */
         void *dev;
-	struct {
-	    struct evtchn_port_list ports;
-	} evtchn;
 	struct gntmap gntmap;
     };
 };
-- 
2.26.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2662648B1E5
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 17:19:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255954.438945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Jqz-0002aq-RE; Tue, 11 Jan 2022 16:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255954.438945; Tue, 11 Jan 2022 16:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Jqz-0002Xx-Mq; Tue, 11 Jan 2022 16:18:33 +0000
Received: by outflank-mailman (input) for mailman id 255954;
 Tue, 11 Jan 2022 16:18:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7Jqx-0002Xi-TR
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 16:18:31 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d5583af-72fa-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 17:18:30 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EEFF01F3BA;
 Tue, 11 Jan 2022 16:18:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CCB8613AF0;
 Tue, 11 Jan 2022 16:18:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KKe+MNWt3WHnKgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 16:18:29 +0000
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
X-Inumbo-ID: 1d5583af-72fa-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641917909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uZ18grHw30dUH3BLs3eIcU1wR57IJVuCHAfGp2N6WvE=;
	b=FZfdqnGQIQGydf9tUo7Tg6r0qiyOYlTfpo47Z2neO/8pvhh+XLkqYq4vxabJaGBwT3PcvB
	YQ8t4LQ58+PYDQ0QQILv2VX4aY+VVc9KPPvY4hrrMPC+2zow9DA3Rwu1voj/CI9NvQ6P9O
	OoXZtP/VjDX6yl25UehINtsXuSxt0yU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 1/2] tools/libs/evtchn: make mini-os specific callback static
Date: Tue, 11 Jan 2022 17:18:26 +0100
Message-Id: <20220111161827.8982-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220111161827.8982-1-jgross@suse.com>
References: <20220111161827.8982-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is possible now to make the callback for Mini-OS static, as it is
only referenced via the file_ops vector.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/evtchn/minios.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
index c3a5ce3b98..b495362f6b 100644
--- a/tools/libs/evtchn/minios.c
+++ b/tools/libs/evtchn/minios.c
@@ -49,8 +49,6 @@ struct port_info {
 
 extern struct wait_queue_head event_queue;
 
-int minios_evtchn_close_fd(int fd);
-
 /* XXX Note: This is not threadsafe */
 static struct port_info *port_alloc(xenevtchn_handle *xce)
 {
@@ -80,7 +78,7 @@ static void port_dealloc(struct port_info *port_info)
     free(port_info);
 }
 
-int minios_evtchn_close_fd(int fd)
+static int minios_evtchn_close_fd(int fd)
 {
     struct port_info *port_info, *tmp;
     struct file *file = get_file_from_fd(fd);
-- 
2.26.2



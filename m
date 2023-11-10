Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D07627E7DA9
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:14:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630522.983438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1U9K-0005tu-4g; Fri, 10 Nov 2023 16:14:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630522.983438; Fri, 10 Nov 2023 16:14:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1U9J-0005qY-VT; Fri, 10 Nov 2023 16:14:25 +0000
Received: by outflank-mailman (input) for mailman id 630522;
 Fri, 10 Nov 2023 16:14:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1U4v-00048H-SK
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:09:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 953cd4ae-7fe3-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 17:09:53 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3DBD51F8BB;
 Fri, 10 Nov 2023 16:09:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A37613398;
 Fri, 10 Nov 2023 16:09:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EW8zBdFVTmUzCQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 16:09:53 +0000
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
X-Inumbo-ID: 953cd4ae-7fe3-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699632593; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/eJaaQzJFr9iaY84hbFZ6eF6VnkmvJwoY+5FWl4+J1Y=;
	b=j+9FbhVRixcfSc4RQoHkyGzsZgSrfAlaFfND6u3bft1XKup8BIMdyGvFS4HeI+a0FSkUXT
	JHLihcs+sW6R3DBE0rh376sv/QOwbx1MSpp9M8UjMZ3RWhcJ7oF4taK4RoUNLMpTS/J3J9
	gXRDE46ttNHHggIqKeHcQiTg6dkfEdg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v2 19/29] stubdom: extend xenstore stubdom configs
Date: Fri, 10 Nov 2023 17:07:54 +0100
Message-Id: <20231110160804.29021-20-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231110160804.29021-1-jgross@suse.com>
References: <20231110160804.29021-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the config files of the Xenstore stubdoms to include XENBUS
and 9PFRONT items in order to support file based logging.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
 stubdom/xenstore-minios.cfg    | 2 +-
 stubdom/xenstorepvh-minios.cfg | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/stubdom/xenstore-minios.cfg b/stubdom/xenstore-minios.cfg
index a41704bb6b..239da519b9 100644
--- a/stubdom/xenstore-minios.cfg
+++ b/stubdom/xenstore-minios.cfg
@@ -3,7 +3,7 @@ CONFIG_NETFRONT=n
 CONFIG_FBFRONT=n
 CONFIG_KBDFRONT=n
 CONFIG_CONSFRONT=n
-CONFIG_XENBUS=n
 CONFIG_LWIP=n
+CONFIG_9PFRONT=y
 CONFIG_BALLOON=y
 XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
diff --git a/stubdom/xenstorepvh-minios.cfg b/stubdom/xenstorepvh-minios.cfg
index 6af51f5753..752b90d7d3 100644
--- a/stubdom/xenstorepvh-minios.cfg
+++ b/stubdom/xenstorepvh-minios.cfg
@@ -4,7 +4,7 @@ CONFIG_NETFRONT=n
 CONFIG_FBFRONT=n
 CONFIG_KBDFRONT=n
 CONFIG_CONSFRONT=n
-CONFIG_XENBUS=n
 CONFIG_LWIP=n
+CONFIG_9PFRONT=y
 CONFIG_BALLOON=y
 XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
-- 
2.35.3



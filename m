Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4897F6B57
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 05:22:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640141.998010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Nha-0005h3-Qg; Fri, 24 Nov 2023 04:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640141.998010; Fri, 24 Nov 2023 04:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Nha-0005dx-N0; Fri, 24 Nov 2023 04:22:02 +0000
Received: by outflank-mailman (input) for mailman id 640141;
 Fri, 24 Nov 2023 04:22:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUjn=HF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r6NhZ-0004tg-Fw
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 04:22:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02cac5da-8a81-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 05:22:00 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 88004219C5;
 Thu, 23 Nov 2023 15:23:12 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id A254913AA7;
 Thu, 23 Nov 2023 11:45:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id Tm35IkM7X2XTZQAAn2gu4w
 (envelope-from <jgross@suse.com>); Thu, 23 Nov 2023 11:45:07 +0000
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
X-Inumbo-ID: 02cac5da-8a81-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700752992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=auYIL4ADLnpxv2Ahr1ZD8qgG7UJTmeyfKp6AgbJ0rLA=;
	b=rK9grTyRDb1R2w0YJqS0Zw+KtOKlivPlOQDwIhOoGdtXV62p2/aepeJyeOrjoTqcGwA/Nu
	P1ho/7vjTFRa9VJyzwpQSb1uI1Y9WrqED2C17LKUpl2kwmaqoGrJ7ks4Wr9lRAz1Qa6oro
	G29GpJ2s6wfQoNDkHvwp1dz9nHQOGOQ=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 0/2] Mini-OS: hide mini-os internal symbols
Date: Thu, 23 Nov 2023 12:45:02 +0100
Message-Id: <20231123114504.29329-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ****
X-Spam-Flag: NO
X-Spam-Score: 4.90
X-Spamd-Result: default: False [4.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[37.04%]

In order to avoid conflicts due to symbols with the same name when
linking Mini-OS with an application, hide all Mini9-OS internal symbols
from the application by linking the Mini-OS kernel individually and
then removing all symbols which should be used internally only.

Changes in V2:
- added more symbols in patch 2

Juergen Gross (2):
  Mini-OS: link kernel separately
  Mini-OS: keep a positive list of externally visible symbols

 Makefile    |   8 +-
 mini-os.map | 295 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 301 insertions(+), 2 deletions(-)
 create mode 100644 mini-os.map

-- 
2.35.3



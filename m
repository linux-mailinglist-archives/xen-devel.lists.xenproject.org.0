Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4B87F2BEE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 12:41:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637747.993764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5P7e-0003pB-Bw; Tue, 21 Nov 2023 11:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637747.993764; Tue, 21 Nov 2023 11:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5P7e-0003mY-8x; Tue, 21 Nov 2023 11:40:54 +0000
Received: by outflank-mailman (input) for mailman id 637747;
 Tue, 21 Nov 2023 11:40:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AdV8=HC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r5P7d-0003mS-HK
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 11:40:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d24d2ec1-8862-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 12:40:51 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A2E6D1F8B9;
 Tue, 21 Nov 2023 11:40:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 737C8138E3;
 Tue, 21 Nov 2023 11:40:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Uw/gGkKXXGXscwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Nov 2023 11:40:50 +0000
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
X-Inumbo-ID: d24d2ec1-8862-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700566850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=a7y/wxv+N116JoU0Fers1UC7fVNEd7gYr2U9LeWhEqE=;
	b=AMhsUckPIe/KmvRFzYibqYNriFpj3fcT6Fec/WB9WmXjp9n4RI+ZDQikFcYa/uFTnVWeVD
	Xnc7wQ9HpPieKFAcSD+1meYlwNzVhmIGLTOVI6Tp0c2qdCw181hH7AozldN1jpjSLnAlzm
	xCGN6QrbYonGk7bDBXJgPoyXPbxj/14=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 0/5] tools/xenstored: remove some command line options
Date: Tue, 21 Nov 2023 12:40:43 +0100
Message-Id: <20231121114048.31294-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.63
X-Spamd-Result: default: False [3.63 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.07)[62.99%]
X-Spam-Flag: NO

Remove some command line options which have no real use case.

Changes in V2:
- moved removal of "-N" into last patch of the series, as this is the
  only option which seems to have a use case (OTOH using it has some
  downsides as well).

Juergen Gross (5):
  tools/xenstored: remove "-D" command line parameter
  tools/xenstored: remove "-V" command line option
  tools/xenstored: remove the "-P" command line option
  tools/xenstored: remove the "-R" command line option
  tools/xenstored: remove "-N" command line option

 tools/xenstored/core.c | 81 +++++++-----------------------------------
 1 file changed, 12 insertions(+), 69 deletions(-)

-- 
2.35.3



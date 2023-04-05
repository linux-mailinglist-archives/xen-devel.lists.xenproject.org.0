Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 458FC6D7E2A
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 15:56:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518539.805206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk3cp-0007oX-Rh; Wed, 05 Apr 2023 13:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518539.805206; Wed, 05 Apr 2023 13:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk3cp-0007mS-P5; Wed, 05 Apr 2023 13:56:35 +0000
Received: by outflank-mailman (input) for mailman id 518539;
 Wed, 05 Apr 2023 13:56:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wAG=74=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pk3cn-0007mI-UL
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 13:56:33 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab7fbc7e-d3b9-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 15:56:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8C40020634;
 Wed,  5 Apr 2023 13:56:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4458F13A31;
 Wed,  5 Apr 2023 13:56:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9Rt9Dw9+LWTBeAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 05 Apr 2023 13:56:31 +0000
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
X-Inumbo-ID: ab7fbc7e-d3b9-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680702991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=w87xtmd4g8BodHHbXoQ5bocxqFz/xo9ToPYB7CD8LlI=;
	b=XdlbCOExTZNMyIrlim6vD7Csa7IUMhkoLmDalpEf8/FwjTYBQYzpUOkBdm3meJ11MPxhK2
	jlKp0mUhfkAs8fcQKkiNIw9ZBRS+7G1PI61pbQWaFtkKAjY/4U73pO7CN9HAbUvPh9LF1r
	VnlGjjS5PF3JtSrxJWb4JLhfUdbQxEw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 0/2] xen: some CONFIG_DEBUG_INFO changes
Date: Wed,  5 Apr 2023 15:56:27 +0200
Message-Id: <20230405135629.21829-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling crash dump analysis of the hypervisor requires the hypervisor
having been built with CONFIG_DEBUG_INFO enabled. Today this requires
either CONFIG_DEBUG or CONFIG_EXPERT set, which are both not security
supported.

This small series changes that in order to allow security supported
Xen builds with the capability to do crash dump analysis via the
"crash" tool.

Note that due to problems with test machines proper support for EFI
booted systems hasn't been verified, so this will likely need some more
work.

Changes in V2:
- comments addressed

Changes in V3:
- comments addressed

Juergen Gross (2):
  xen: move CONFIG_DEBUG_INFO out of EXPERT section
  xen: update CONFIG_DEBUG_INFO help text

 xen/Kconfig.debug | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

-- 
2.35.3



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F226D4DAD
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 18:28:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517535.803002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjN2j-0007NA-N1; Mon, 03 Apr 2023 16:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517535.803002; Mon, 03 Apr 2023 16:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjN2j-0007KM-Jb; Mon, 03 Apr 2023 16:28:29 +0000
Received: by outflank-mailman (input) for mailman id 517535;
 Mon, 03 Apr 2023 16:28:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L93W=72=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pjN2h-0007KG-O2
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 16:28:27 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f30543a-d23c-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 18:28:26 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B70561FE5E;
 Mon,  3 Apr 2023 16:28:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7AA9D13416;
 Mon,  3 Apr 2023 16:28:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eBFRHKn+KmSoXgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 03 Apr 2023 16:28:25 +0000
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
X-Inumbo-ID: 8f30543a-d23c-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680539305; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BkZFoojUM+8fz39pkxsEFi2atMuRoJfIlL2aw5KVwkg=;
	b=hdAKyfRvOTyqR6Ux0Ll7IvLjr+WjyD/MIyYC3S90Jzwl7MO+MsAQyTRMP2AUwmsipxhTZR
	nbQ9V+PeJ1+C3W6xO+jbfALsVJMaB8K4gi5pAj7IDkUnwwbaXBNMWaquRTjORpebjBDHwY
	gC79h9DBvyLaUjb0cYAT4zJ8JUyXqEE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/2] xen: some CONFIG_DEBUG_INFO changes
Date: Mon,  3 Apr 2023 18:28:21 +0200
Message-Id: <20230403162823.30681-1-jgross@suse.com>
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

Juergen Gross (2):
  xen: move CONFIG_DEBUG_INFO out of EXPERT section
  xen: update CONFIG_DEBUG_INFO help text

 xen/Kconfig.debug | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

-- 
2.35.3



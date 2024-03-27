Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 206E888E891
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 16:23:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698600.1090480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpV6q-0007TC-CE; Wed, 27 Mar 2024 15:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698600.1090480; Wed, 27 Mar 2024 15:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpV6q-0007R5-9c; Wed, 27 Mar 2024 15:22:36 +0000
Received: by outflank-mailman (input) for mailman id 698600;
 Wed, 27 Mar 2024 15:22:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kcEO=LB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rpV6o-0007Qx-MK
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 15:22:34 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d51dba20-ec4d-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 16:22:33 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DF1E860602;
 Wed, 27 Mar 2024 15:22:31 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 7015113215;
 Wed, 27 Mar 2024 15:22:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id vpOxGbc5BGYvfQAAn2gu4w
 (envelope-from <jgross@suse.com>); Wed, 27 Mar 2024 15:22:31 +0000
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
X-Inumbo-ID: d51dba20-ec4d-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1711552952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pifUM0kraadzecww9tuC3K3Y5gQQqgQ0xhazJDRrVmc=;
	b=BpBOZ4Tf30PC+J1hT33G3hyPiUjizHxIRME08mdubDmibNUoFYJDfoy9Hi1uzVyy8ZGox4
	JjdZjFWX2AFi3QIjI2IAgL13LNd01FvImctHQrXW0T65c+x7lSy+ETAZVt0ghollwQdq8w
	Z/xXeUWp4dlf/+xuTFtpHpgbP45RE2s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1711552951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pifUM0kraadzecww9tuC3K3Y5gQQqgQ0xhazJDRrVmc=;
	b=rYyTdHb3kPtiG/tYPvYNaNJ9uVlUQqFNimUYZfKUcFcQEUSeABfXbdTDQFxuaofaBjQnD9
	ml6a1adBr9P92ZhzR3BnvW8UXw5Wms4xpmGgq2exWVTNQNZYbkxOCD72ddjdRSS1qv9IFF
	QOJcB5srAp2r4UuV6a2skJRu4t3Ah0c=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>
Subject: [PATCH v6 0/8] xen/spinlock: make recursive spinlocks a dedicated type
Date: Wed, 27 Mar 2024 16:22:21 +0100
Message-Id: <20240327152229.25847-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.51
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.51 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 RCPT_COUNT_TWELVE(0.00)[15];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:98:from]
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=rYyTdHb3
X-Rspamd-Queue-Id: DF1E860602

Instead of being able to use normal spinlocks as recursive ones, too,
make recursive spinlocks a special lock type.

This will make the spinlock structure smaller in production builds and
add type-safety.

This allows to increase the maximum number of physical cpus from 4095
to 65535 without increasing the size of the lock structure in production
builds (the size of recursive spinlocks in debug builds will grow to
12 bytes due to that change).

Note that rwlock handling is still limiting the number of cpus to 4095,
this is being taken care off in patch 12, which raises the rwlock limit
to 16384 cpus.

Iommu code imposes a limit of 16383 cpus.

Changes in V2:
- addressed comments by Jan Beulich
- lots of additional cleanups
- reorganized complete series

Changes in V3:
- addressed comments by Jan Beulich

Changes in V4:
- former patch 1 has already been applied
- fixed a coding style issue in patch 1

Changes in V5:
- new patches 1 + 10 + 12 + 13
- due to the recent Ghost-race patches the macro layer for calling
  spinlock functions is kept
- addressed comments

Changes in V6:
- patches 1-5 of V5 have been committed already
- addressed comments

Juergen Gross (8):
  xen/spinlock: add explicit non-recursive locking functions
  xen/spinlock: add another function level
  xen/spinlock: add missing rspin_is_locked() and rspin_barrier()
  xen/spinlock: split recursive spinlocks from normal ones
  xen/spinlock: let all is_locked and trylock variants return bool
  xen/spinlock: support higher number of cpus
  xen/rwlock: raise the number of possible cpus
  xen: allow up to 16383 cpus

 xen/arch/Kconfig              |   2 +-
 xen/arch/arm/mm.c             |   4 +-
 xen/arch/x86/domain.c         |  12 +--
 xen/arch/x86/mm.c             |  12 +--
 xen/arch/x86/mm/mem_sharing.c |   8 +-
 xen/arch/x86/mm/p2m-pod.c     |   6 +-
 xen/arch/x86/mm/p2m.c         |   4 +-
 xen/arch/x86/tboot.c          |   4 +-
 xen/common/domain.c           |   2 +-
 xen/common/domctl.c           |   4 +-
 xen/common/grant_table.c      |  10 +-
 xen/common/memory.c           |   4 +-
 xen/common/numa.c             |   4 +-
 xen/common/page_alloc.c       |  18 ++--
 xen/common/spinlock.c         | 181 ++++++++++++++++++++++++++--------
 xen/drivers/char/console.c    |  20 ++--
 xen/drivers/passthrough/pci.c |   2 +-
 xen/include/xen/rwlock.h      |  23 +++--
 xen/include/xen/spinlock.h    | 110 ++++++++++++++++-----
 19 files changed, 297 insertions(+), 133 deletions(-)

-- 
2.35.3



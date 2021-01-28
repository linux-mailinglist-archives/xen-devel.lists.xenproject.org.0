Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E053079D3
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 16:34:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77184.139646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l59J1-0005oN-NC; Thu, 28 Jan 2021 15:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77184.139646; Thu, 28 Jan 2021 15:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l59J1-0005ny-K1; Thu, 28 Jan 2021 15:33:59 +0000
Received: by outflank-mailman (input) for mailman id 77184;
 Thu, 28 Jan 2021 15:33:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e8hV=G7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l59J0-0005nt-G0
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 15:33:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e36f734-0846-4ce5-a4d3-54d90351b26e;
 Thu, 28 Jan 2021 15:33:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C8FC0ACB7;
 Thu, 28 Jan 2021 15:33:56 +0000 (UTC)
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
X-Inumbo-ID: 9e36f734-0846-4ce5-a4d3-54d90351b26e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611848036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=D5OYwaFxK/AYOwT4ncyOrXqBEV4/eu+1M6R/qN+DFI0=;
	b=W5AmWTVXQ+hg+J2XIu9xHUnE2UFHAlRi65K/7iy6cyqOvwRYgc9P+38qiTh4m01P02bJhG
	1dQGcW0pYJWZO/ujcxBa4nC4EonOH+6C65E3ZOO6zCQgA3DzMIMl/3uS5TKsuzBOAnY8fn
	upcXyenuXozBO410T9hiarsnJrOmMPE=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.11-rc6
Date: Thu, 28 Jan 2021 16:33:56 +0100
Message-Id: <20210128153356.13823-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.11-rc6-tag

xen: branch for v5.11-rc6

It contains the following fixes:

- A fix for a regression introduced in 5.11 resulting in Xen dom0 having
  problems to correctly initialize Xenstore.

- A fix for avoiding WARN splats when booting as Xen dom0 with
  CONFIG_AMD_MEM_ENCRYPT enabled due to a missing trap handler for the
  #VC exception (even if the handler should never be called).

- A fix for the Xen bklfront driver adapting to the correct but
  unexpected behavior of new qemu.


Thanks.

Juergen

 arch/x86/include/asm/idtentry.h   |  1 +
 arch/x86/xen/enlighten_pv.c       | 15 ++++++++++++++-
 arch/x86/xen/xen-asm.S            |  1 +
 drivers/block/xen-blkfront.c      | 20 +++++++-------------
 drivers/xen/xenbus/xenbus_probe.c | 31 +++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+), 14 deletions(-)

David Woodhouse (1):
      xen: Fix XenStore initialisation for XS_LOCAL

Juergen Gross (1):
      x86/xen: avoid warning in Xen pv guest with CONFIG_AMD_MEM_ENCRYPT enabled

Roger Pau Monne (1):
      xen-blkfront: allow discard-* nodes to be optional


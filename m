Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4E6286025
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 15:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3509.10071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ9WR-0007sT-53; Wed, 07 Oct 2020 13:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3509.10071; Wed, 07 Oct 2020 13:30:23 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ9WR-0007rx-19; Wed, 07 Oct 2020 13:30:23 +0000
Received: by outflank-mailman (input) for mailman id 3509;
 Wed, 07 Oct 2020 13:30:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kQ9WO-0007q4-Sg
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 13:30:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e65c696-701d-43f3-aeca-ad359a51a758;
 Wed, 07 Oct 2020 13:30:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 24A25AC6D;
 Wed,  7 Oct 2020 13:30:14 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kQ9WO-0007q4-Sg
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 13:30:20 +0000
X-Inumbo-ID: 5e65c696-701d-43f3-aeca-ad359a51a758
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5e65c696-701d-43f3-aeca-ad359a51a758;
	Wed, 07 Oct 2020 13:30:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602077414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=B547wPgCpWoZcZKQSWOEnN4FxgmeBKDw7JxS9keaVX0=;
	b=hm0W1oNIiSpPYNZ+t0FJ4+RG+ngqa0FrDLozYjkzzoErJ9Ujz/mio2FBFS61/jHXt66AmI
	+8PqVxeilEl4s4N1KOFekgfFZxQmMY0dhoYe7FYxR0T2b6+dSntNTfGne+JDO1OTwpYYul
	Ns+J0mQYiQ9fqhXNWIrhNKsBqxzT3HY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 24A25AC6D;
	Wed,  7 Oct 2020 13:30:14 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/2] xen/x86: implement NMI continuation as softirq
Date: Wed,  7 Oct 2020 15:30:09 +0200
Message-Id: <20201007133011.18871-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move sending of a virq event for oprofile to the local vcpu from NMI
to softirq context.

This has been tested with a small test patch using the continuation
framework of patch 1 for all NMIs and doing a print to console in
the continuation handler.

Version 1 of this small series was sent to the security list before.

Juergen Gross (2):
  xen/x86: add nmi continuation framework
  xen/oprofile: use set_nmi_continuation() for sending virq to guest

 xen/arch/x86/oprofile/nmi_int.c |  9 +++++++-
 xen/arch/x86/traps.c            | 37 +++++++++++++++++++++++++++++++++
 xen/include/asm-x86/nmi.h       |  8 ++++++-
 xen/include/xen/softirq.h       |  5 ++++-
 4 files changed, 56 insertions(+), 3 deletions(-)

-- 
2.26.2



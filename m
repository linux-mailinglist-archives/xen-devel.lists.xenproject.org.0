Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A47CE3A93F2
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 09:30:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142735.263288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltQ05-0006Tz-DJ; Wed, 16 Jun 2021 07:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142735.263288; Wed, 16 Jun 2021 07:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltQ05-0006Rv-8o; Wed, 16 Jun 2021 07:30:13 +0000
Received: by outflank-mailman (input) for mailman id 142735;
 Wed, 16 Jun 2021 07:30:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=my07=LK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ltQ04-0006Rp-80
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 07:30:12 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b025cbfe-4804-42be-a6fe-ade48f632676;
 Wed, 16 Jun 2021 07:30:11 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 538CE1FD47;
 Wed, 16 Jun 2021 07:30:10 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 0658A118DD;
 Wed, 16 Jun 2021 07:30:09 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id S9dVO4GoyWBfZAAALh3uQQ
 (envelope-from <jgross@suse.com>); Wed, 16 Jun 2021 07:30:09 +0000
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
X-Inumbo-ID: b025cbfe-4804-42be-a6fe-ade48f632676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623828610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ZIhury5ftO1rCyrI+1BJ+XupQSloUA5hjiMSaC8bUjc=;
	b=ucl+Y4z0TKifrQyD9WE/MlO6t3brYmjm8sEy7S2xiYkp9TKMEnNQoia7hROaajuttppBMM
	To/W7nAXMyuWTS0lz7aUfTW/F1lReXMCZAKCuFhIklT7Kjn/6peAFR9Ao0idHpnKbM7inl
	UTV9wIFj38OuUamOxFEy6iYkjsQaCJM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623828610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ZIhury5ftO1rCyrI+1BJ+XupQSloUA5hjiMSaC8bUjc=;
	b=ucl+Y4z0TKifrQyD9WE/MlO6t3brYmjm8sEy7S2xiYkp9TKMEnNQoia7hROaajuttppBMM
	To/W7nAXMyuWTS0lz7aUfTW/F1lReXMCZAKCuFhIklT7Kjn/6peAFR9Ao0idHpnKbM7inl
	UTV9wIFj38OuUamOxFEy6iYkjsQaCJM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	stable@vger.kernel.org
Subject: [PATCH 0/2] xen: fix max_pfn handling for pv guests
Date: Wed, 16 Jun 2021 09:30:05 +0200
Message-Id: <20210616073007.5215-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix some bad naming and setting of max_pfn related variables.

Juergen Gross (2):
  xen: fix setting of max_pfn in shared_info
  xen: rename wrong named pfn related variables

 arch/x86/include/asm/xen/page.h |  4 ++--
 arch/x86/xen/p2m.c              | 31 ++++++++++++++++---------------
 arch/x86/xen/setup.c            |  2 +-
 3 files changed, 19 insertions(+), 18 deletions(-)

-- 
2.26.2



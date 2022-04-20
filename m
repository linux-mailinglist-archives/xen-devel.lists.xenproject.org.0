Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E395084F0
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 11:25:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309043.525084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh6ab-0004Cz-06; Wed, 20 Apr 2022 09:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309043.525084; Wed, 20 Apr 2022 09:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh6aa-0004AH-SZ; Wed, 20 Apr 2022 09:25:32 +0000
Received: by outflank-mailman (input) for mailman id 309043;
 Wed, 20 Apr 2022 09:25:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nh6aZ-00046i-6h
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 09:25:31 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f20bfbb-c08b-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 11:21:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0849C1F380;
 Wed, 20 Apr 2022 09:25:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B698C13A30;
 Wed, 20 Apr 2022 09:25:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FzNFK3HRX2J1EAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Apr 2022 09:25:05 +0000
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
X-Inumbo-ID: 2f20bfbb-c08b-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650446706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3E7uGHyVSRLlv1q/BP8AWtqLSArF2xlrVNvb53ZZO3Q=;
	b=NMLVxS0XMRvWXReWNfowiUHySlIATTs0qYOx3BLmMovlp82yKFTiB3IwQ4F/agcqzd0JHr
	VFlhKH2x+iPFwtXn4eQ7JsfcC3e4ClBot4vi8F3e+C75NLAw9vAQuyx0PZQpDvYC1ln1AS
	4YxztFMutLngFG/7ISGEdFELcUZmNEc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH 0/4] xen/pv-scsi: update header and harden frontend
Date: Wed, 20 Apr 2022 11:24:59 +0200
Message-Id: <20220420092503.11123-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the Xen PV-scsi interface from the Xen tree and adapt the
related drivers to use the new definitions.

Harden the frontend driver to be no longer vulnerable to a malicious
backend.

Juergen Gross (4):
  xen: update vscsiif.h
  xen/scsiback: use new command result macros
  xen/scsifront: use new command result macros
  xen/scsifront: harden driver against malicious backend

 drivers/scsi/xen-scsifront.c       | 168 ++++++++++++++++++++++-------
 drivers/xen/xen-scsiback.c         |  82 +++++++++++++-
 include/xen/interface/io/vscsiif.h | 133 ++++++++++++++++++++++-
 3 files changed, 340 insertions(+), 43 deletions(-)

-- 
2.34.1



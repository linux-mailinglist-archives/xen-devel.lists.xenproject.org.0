Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C780512D67
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 09:53:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316082.534809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njyxu-0003mc-7U; Thu, 28 Apr 2022 07:53:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316082.534809; Thu, 28 Apr 2022 07:53:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njyxu-0003k8-4Z; Thu, 28 Apr 2022 07:53:30 +0000
Received: by outflank-mailman (input) for mailman id 316082;
 Thu, 28 Apr 2022 07:53:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KUQd=VG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1njyxs-0003jr-OX
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 07:53:28 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49bd0ef9-c6c8-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 09:53:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 354692186F;
 Thu, 28 Apr 2022 07:53:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E100C13AF8;
 Thu, 28 Apr 2022 07:53:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qNCTNfZHamIoHAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Apr 2022 07:53:26 +0000
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
X-Inumbo-ID: 49bd0ef9-c6c8-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651132407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3E7uGHyVSRLlv1q/BP8AWtqLSArF2xlrVNvb53ZZO3Q=;
	b=r3XSYHwZGjPKGDDJnE8y1TzQDS660lC8ubSYtSgv3fDXdqTjp7PRW3yk4VmEGD0yYctRb6
	N2Cad7N/zT3wVToO0LIRMHi7Q5SA4KFmR6GDtMgWqzUho8hMvGo68rdSEeCKN5QsOTJ96V
	OTggVTVRIKMzc52CNcHY5fN1SxcXrG0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH v2 0/4] xen/pv-scsi: update header and harden frontend
Date: Thu, 28 Apr 2022 09:53:19 +0200
Message-Id: <20220428075323.12853-1-jgross@suse.com>
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



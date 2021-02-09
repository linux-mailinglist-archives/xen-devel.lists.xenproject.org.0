Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0218B31530C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 16:46:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83309.154693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9VCz-0001RZ-Bo; Tue, 09 Feb 2021 15:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83309.154693; Tue, 09 Feb 2021 15:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9VCz-0001RA-8B; Tue, 09 Feb 2021 15:45:45 +0000
Received: by outflank-mailman (input) for mailman id 83309;
 Tue, 09 Feb 2021 15:45:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhOK=HL=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1l9VCx-0001R5-R2
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 15:45:43 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66c33846-4cae-4a22-8f71-3e369ef80446;
 Tue, 09 Feb 2021 15:45:42 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.17.1 DYNA|AUTH)
 with ESMTPSA id 604447x19Fje1k5
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 9 Feb 2021 16:45:40 +0100 (CET)
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
X-Inumbo-ID: 66c33846-4cae-4a22-8f71-3e369ef80446
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612885541;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
	bh=gL+mi1IlTYrjtEMwDgnPgLG4B4OTkjoS2M85wDEpNlo=;
	b=TMfI2NW9UoNXoSzKFa+8ql3WnHgqaQkHwOzDHJEkjMVrGmSNfLX5sBS7f7Q/fCHJ5D
	jVKRtzA/08rvYoZu+Trcumv3y55QHMG6BRIhGOPeWz8uhvRJuV25W6wx1K3EP3Srdpqh
	tDO8JdRW0PZmvKxTTqbiPkrFgRIw/D9q+HR/tDT7mOenf4b9yl8fEQsgMe5OwuVLsmKw
	uTVqvDLM+4PxnBXOEtv7ePRZAwOfPJDfo0iCGIgs3O1tuY7X/qcV1iRZy3am/tw/j9g/
	2q8A8mKLfaWlOxCRrDu3eh7CIUGN3d7ezbAFlqZ1KJyT3KkAE+DkgVVcIgEn/dHBqjyL
	y4Bw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3GxPjw=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>
Subject: [PATCH v20210209 0/4] tools changes
Date: Tue,  9 Feb 2021 16:45:32 +0100
Message-Id: <20210209154536.10851-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As discussed in the v20210111 thread, split out and redo a few xl and configure.ac specific changes.

Olaf

Olaf Hering (4):
  tools: move CONFIG_DIR and XEN_CONFIG_DIR in paths.m4
  tools: add with-xen-scriptdir configure option
  xl: optionally print timestamps when running xl commands
  xl: disable --debug option for xl migrate

 docs/man/xl.1.pod.in   |  8 ++++----
 m4/paths.m4            | 23 ++++++++++++++---------
 tools/xl/xl.c          | 18 +++++++++++++-----
 tools/xl/xl.h          |  1 +
 tools/xl/xl_cmdtable.c |  1 -
 tools/xl/xl_migrate.c  | 16 +++++++---------
 6 files changed, 39 insertions(+), 28 deletions(-)



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E689B69071C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 12:24:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492343.761851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ51l-0002MH-VO; Thu, 09 Feb 2023 11:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492343.761851; Thu, 09 Feb 2023 11:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ51l-0002J7-Rc; Thu, 09 Feb 2023 11:23:45 +0000
Received: by outflank-mailman (input) for mailman id 492343;
 Thu, 09 Feb 2023 11:23:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iTR=6F=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pQ51k-0002J1-H5
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 11:23:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35cd24b9-a86c-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 12:23:43 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AAEC05C830;
 Thu,  9 Feb 2023 11:23:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 30D901339E;
 Thu,  9 Feb 2023 11:23:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XWZfCr7X5GNtPAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 09 Feb 2023 11:23:42 +0000
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
X-Inumbo-ID: 35cd24b9-a86c-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675941822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YZDBQEJqdfzaqhG2vhc/FlqleNU9E8m2vwmBY9M2pBs=;
	b=dZdZmNv5wXxkGx7h2v4aY9ZeNCOc6+hJNfbWm9lZFd6KenT7OFYtpkuMqoDRFZpD1FerAm
	x5f+S3JjtwGgJ9EaLRFKl/+MZJw3m++xSaamPoXqslX06aIcPcZmzSameVMsiUxaH6B5d2
	CBqKRpVVmCZWbjBg1vGix1xQXsu/sY4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	sstabellini@kernel.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 0/2 RESEND] xen/public move and fix 9pfs documentation
Date: Thu,  9 Feb 2023 12:23:36 +0100
Message-Id: <20230209112338.26287-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resend of the remaining 2 patches adding some more people to Cc:

Changes in V4:
- patch split into 3 patches

Juergen Gross (2):
  xen/public: fix 9pfs Xenstore entry documentation
  xen/public: fix 9pfs documentation of connection sequence

 xen/include/public/io/9pfs.h | 44 +++++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 16 deletions(-)

-- 
2.35.3



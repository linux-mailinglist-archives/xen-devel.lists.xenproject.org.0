Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D14BA404703
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 10:27:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182751.330503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOFOz-0000Lq-HV; Thu, 09 Sep 2021 08:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182751.330503; Thu, 09 Sep 2021 08:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOFOz-0000IY-AZ; Thu, 09 Sep 2021 08:27:21 +0000
Received: by outflank-mailman (input) for mailman id 182751;
 Thu, 09 Sep 2021 08:27:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vCZp=N7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mOFOx-0000Fc-9b
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 08:27:19 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd7e9cea-1147-11ec-b1a7-12813bfff9fa;
 Thu, 09 Sep 2021 08:27:16 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D9C8A1FDD8;
 Thu,  9 Sep 2021 08:27:13 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 7F3841365E;
 Thu,  9 Sep 2021 08:27:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 19N2HWHFOWHPEAAAGKfGzw
 (envelope-from <jgross@suse.com>); Thu, 09 Sep 2021 08:27:13 +0000
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
X-Inumbo-ID: bd7e9cea-1147-11ec-b1a7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631176033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=m6etc4M/6aJ6ZeXC29srC0CnM+jaYzvg6C/U2YvOZrg=;
	b=bdK7ODzHl98S6s38rnRPwJHhUVB3WTcGkzKvLhhHtB8ZIN1FQvDA1uAOXpRrtKyACQIwjN
	mRNMjX2HN8TSrCAbgHiUiRfTj/BgiSqFHONiAg5FtovP9vwyQ4bOSrF8U084xCnikUNRXe
	khXJCYkHKmJUEidnM7ervUdDl3IHaWU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH 0/2] stubdom: disable building of pv-grub per default
Date: Thu,  9 Sep 2021 10:27:03 +0200
Message-Id: <20210909082705.9434-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a first step of deprecating pv-grub. Switch the default to not
building it.

NOTE: This should be mentioned in the release notes!

Juergen Gross (2):
  stubdom: fix build with disabled pv-grub
  stubdom: disable building pv-grub

 Makefile             |  4 ++--
 stubdom/Makefile     | 13 +++++++++++++
 stubdom/configure    |  8 ++------
 stubdom/configure.ac |  2 +-
 4 files changed, 18 insertions(+), 9 deletions(-)

-- 
2.26.2



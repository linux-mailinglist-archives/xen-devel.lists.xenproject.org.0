Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D88A508231
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 09:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308937.524855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh4o7-0006Wc-OR; Wed, 20 Apr 2022 07:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308937.524855; Wed, 20 Apr 2022 07:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh4o7-0006Tq-K9; Wed, 20 Apr 2022 07:31:23 +0000
Received: by outflank-mailman (input) for mailman id 308937;
 Wed, 20 Apr 2022 07:31:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nh4o6-0006Ta-6h
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 07:31:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfe4db5d-c07b-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 09:31:21 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EE0BE1F380;
 Wed, 20 Apr 2022 07:31:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BDE2213A30;
 Wed, 20 Apr 2022 07:31:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ghAgLci2X2IhXAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Apr 2022 07:31:20 +0000
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
X-Inumbo-ID: dfe4db5d-c07b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650439880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=As+I3XR+3ocfIVeZPpOomgQREBczlDKKa12v3cJeq4M=;
	b=reVQNy5NgGUJFI554Hp+gx7q59KPZo3sKXwS+R1y+Jw4aU7hWK7SVw7ETO1zCHPyeHV7A3
	5ZCj+BAOUdDzL0DCjGUAip/O9mgAb2jeHxK7vxLKo7AXKWnsiLt9uCgr3c6xF+r9oheWeX
	G+4Pau4UEnEU+XDWsxQZEC7OOLbIirc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 0/4] tools/libs: don't set errno to negative values
Date: Wed, 20 Apr 2022 09:31:15 +0200
Message-Id: <20220420073119.16974-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are a few places in the libs where errno is set to a negative
value. Fix those.

Juergen Gross (4):
  tools/libs/evtchn: don't set errno to negative values
  tools/libs/ctrl: don't set errno to a negative value
  tools/libs/guest: don't set errno to a negative value
  tools/libs/light: don't set errno to a negative value

 tools/libs/ctrl/xc_domain.c    | 4 +---
 tools/libs/evtchn/freebsd.c    | 2 +-
 tools/libs/evtchn/minios.c     | 2 +-
 tools/libs/evtchn/netbsd.c     | 2 +-
 tools/libs/evtchn/solaris.c    | 2 +-
 tools/libs/guest/xg_dom_core.c | 2 +-
 tools/libs/light/libxl_linux.c | 2 +-
 7 files changed, 7 insertions(+), 9 deletions(-)

-- 
2.34.1



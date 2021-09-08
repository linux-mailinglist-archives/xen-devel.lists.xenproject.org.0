Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E83C8403A17
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 14:43:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181906.329247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNwv2-000708-EC; Wed, 08 Sep 2021 12:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181906.329247; Wed, 08 Sep 2021 12:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNwv2-0006xP-Ar; Wed, 08 Sep 2021 12:43:12 +0000
Received: by outflank-mailman (input) for mailman id 181906;
 Wed, 08 Sep 2021 12:43:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RTps=N6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mNwv0-0006xJ-TG
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 12:43:10 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52653518-10a2-11ec-b151-12813bfff9fa;
 Wed, 08 Sep 2021 12:43:10 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3E8C020141;
 Wed,  8 Sep 2021 12:43:09 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 1593013A8B;
 Wed,  8 Sep 2021 12:43:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 6EPBA92vOGEgGgAAGKfGzw
 (envelope-from <jgross@suse.com>); Wed, 08 Sep 2021 12:43:09 +0000
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
X-Inumbo-ID: 52653518-10a2-11ec-b151-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631104989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NHBNiheUYg9gphq65/36gve6J5qXevlzv8FdaBzRsBQ=;
	b=I37rPJW9BXtjr2SyvCrJuOncYKspk84WiuuqRVj5TGx2gZhW9+T4ZTLEsWuzurWRh3Zoy0
	Lqjp5wDSVZZzzYrC265DOyKBnCVYVFAfBB+K4GTKThTL4lgtqQa3ZquxfqFDF0tVp9ZOvU
	vTMM0UAnCa+I6P6Ku4LZ6n5XFBaJGzY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] tools/libs: fix build of stubdoms
Date: Wed,  8 Sep 2021 14:43:03 +0200
Message-Id: <20210908124303.20680-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case abi-dumper is available the stubdom builds will fail due to a
false dependency on dynamic loadable libraries. Fix that.

Fixes: d7c9f7a7a3959913b4 ("tools/libs: Write out an ABI analysis when abi-dumper is available")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/libs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 84130ccbaf..ebdb2a4782 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -98,10 +98,12 @@ lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR): $(PIC_OBJS) libxen$(LIBNAME).map
 
 # If abi-dumper is available, write out the ABI analysis
 ifneq ($(ABI_DUMPER),)
+ifneq ($(nosharedlibs),y)
 libs: $(PKG_ABI)
 $(PKG_ABI): lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) headers.lst
 	$(ABI_DUMPER) $< -o $@ -public-headers headers.lst -lver $(MAJOR).$(MINOR)
 endif
+endif
 
 .PHONY: install
 install: build
-- 
2.26.2



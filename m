Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 285272922E8
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 09:21:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8601.23050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUPUE-0005be-Km; Mon, 19 Oct 2020 07:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8601.23050; Mon, 19 Oct 2020 07:21:42 +0000
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
	id 1kUPUE-0005bI-H9; Mon, 19 Oct 2020 07:21:42 +0000
Received: by outflank-mailman (input) for mailman id 8601;
 Mon, 19 Oct 2020 07:21:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUPUC-0005b8-Mc
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 07:21:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d53d7282-ed35-47c9-9f7f-68a60b4a4cf4;
 Mon, 19 Oct 2020 07:21:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3956AB0E;
 Mon, 19 Oct 2020 07:21:38 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUPUC-0005b8-Mc
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 07:21:40 +0000
X-Inumbo-ID: d53d7282-ed35-47c9-9f7f-68a60b4a4cf4
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d53d7282-ed35-47c9-9f7f-68a60b4a4cf4;
	Mon, 19 Oct 2020 07:21:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603092098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QX2MHQbpg3wjWq1A1IoLHU+ocuPAEaIOhlM4GNE6C+o=;
	b=nwKqcS7kPpBWrpUpyuCJRoOpTcJV4fStXdAlG/L0Itto5ZgeKpA3nMTpinwb0tfCwiWZTT
	8AasZKgHHN+d5OjmabWLIHtbWx+0mTC193mBun4lhksol/AqiOy7cm/ihfdcfxTOxMBT2Y
	DcXJu06Gdr31Kpw6VJoEgHo9EqSX+7w=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A3956AB0E;
	Mon, 19 Oct 2020 07:21:38 +0000 (UTC)
Subject: [PATCH 2/2] tools/libs: fix uninstall rule for header files
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <2c9a0407-1bd1-6898-d1e3-9be4c869684b@suse.com>
Message-ID: <74c629db-0f63-aba0-f294-9668c29b8f70@suse.com>
Date: Mon, 19 Oct 2020 09:21:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <2c9a0407-1bd1-6898-d1e3-9be4c869684b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This again was working right only as long as $(LIBHEADER) consisted of
just one entry.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
An alternative would be to use $(addprefix ) without any shell loop.

--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -107,7 +107,7 @@ install: build
 .PHONY: uninstall
 uninstall:
 	rm -f $(DESTDIR)$(PKG_INSTALLDIR)/$(LIB_FILE_NAME).pc
-	for i in $(LIBHEADER); do rm -f $(DESTDIR)$(includedir)/$(LIBHEADER); done
+	for i in $(LIBHEADER); do rm -f $(DESTDIR)$(includedir)/$$i; done
 	rm -f $(DESTDIR)$(libdir)/lib$(LIB_FILE_NAME).so
 	rm -f $(DESTDIR)$(libdir)/lib$(LIB_FILE_NAME).so.$(MAJOR)
 	rm -f $(DESTDIR)$(libdir)/lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR)



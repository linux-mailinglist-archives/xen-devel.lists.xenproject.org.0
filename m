Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FF038090D
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 13:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127332.239296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhWQb-0008J4-Vj; Fri, 14 May 2021 11:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127332.239296; Fri, 14 May 2021 11:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhWQb-0008GR-Rp; Fri, 14 May 2021 11:56:25 +0000
Received: by outflank-mailman (input) for mailman id 127332;
 Fri, 14 May 2021 11:56:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sDpF=KJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lhWQa-0008GF-B8
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 11:56:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8146b39-3b69-41b9-96e2-c2199d651479;
 Fri, 14 May 2021 11:56:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6DE6EAEA6;
 Fri, 14 May 2021 11:56:22 +0000 (UTC)
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
X-Inumbo-ID: d8146b39-3b69-41b9-96e2-c2199d651479
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620993382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tdOBs2NkLw0YS/tdRPalc0PWkKYkTcp857mDLm1t7FE=;
	b=QOSmSUIrvYIulLhS0Lryzj2QP8HHxprHuMCYhwNjkOA6l8/T//HIO+4mKNZLtaNSNKtb3g
	vEUvhSp1c0cXCD5iwnWM/U7k799cnr3ERaocUVsqg16KasqQYEkNCEh0CxsdBVfQyKaHz3
	I/kvbjS5ThBezmzAlGu2HNJePfeDnqw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/2] tools/xenstore: simplify xenstored main loop
Date: Fri, 14 May 2021 13:56:18 +0200
Message-Id: <20210514115620.32731-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Small series to make the main loop of xenstored more readable.

Changes in V2:
- split into two patches
- use const
- NO_SOCKETS handling

Juergen Gross (2):
  tools/xenstore: move per connection read and write func hooks into a
    struct
  tools/xenstore: simplify xenstored main loop

 tools/xenstore/xenstored_core.c   | 121 ++++++++++++++----------------
 tools/xenstore/xenstored_core.h   |  21 +++---
 tools/xenstore/xenstored_domain.c |  15 +++-
 3 files changed, 79 insertions(+), 78 deletions(-)

-- 
2.26.2



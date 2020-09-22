Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8C9274035
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 12:58:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKg0L-0002fJ-35; Tue, 22 Sep 2020 10:58:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1J9w=C7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kKg0J-0002eB-KV
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 10:58:35 +0000
X-Inumbo-ID: 1e491c93-2f47-4a9a-9042-e020bb228108
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e491c93-2f47-4a9a-9042-e020bb228108;
 Tue, 22 Sep 2020 10:58:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600772308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/nDVjs2/5IIOEfLogSRalGlMj00tL33mRUyuagMoW00=;
 b=Pa/F6yNn5XFlOaw+AL0haAAIUm2vuo1k4uuy0TyYMBevI8dNi+esrRqhWXieetEoxLJJPV
 SzgXv9pGK5UxmVmk2wGBOJq3EBvyfHlHBeb2J8AL3YveQLlBcAQLKCXFzoXW4DNSUZxwc2
 c0sLdCns7sKTonRQNZJfsi3uZkxtshI=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 63E35AD85;
 Tue, 22 Sep 2020 10:59:05 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org, Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2] mini-os: netfront: fix some issues
Date: Tue, 22 Sep 2020 12:58:24 +0200
Message-Id: <20200922105826.26274-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Fix two issues in mini-os netfront:

- undo init_netfront interface change and replace it with an alternative
- fix mini-os suspend/resume handling in netfront

Juergen Gross (2):
  mini-os: netfront: retrieve netmask and gateway via extra function
  mini-os: netfront: fix suspend/resume handling

 include/netfront.h |   4 +-
 lwip-net.c         |   4 +-
 netfront.c         | 173 ++++++++++++++++++++-------------------------
 test.c             |   2 +-
 4 files changed, 84 insertions(+), 99 deletions(-)

-- 
2.26.2



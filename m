Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EAA1A3585
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 16:13:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMXvE-0002nl-0V; Thu, 09 Apr 2020 14:12:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lf15=5Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jMXvC-0002nf-Jx
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 14:12:46 +0000
X-Inumbo-ID: 2ef84fb6-7a6c-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ef84fb6-7a6c-11ea-b4f4-bc764e2007e4;
 Thu, 09 Apr 2020 14:12:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CD799AD6C;
 Thu,  9 Apr 2020 14:12:43 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 0/3] mini-os: fix several double frees and memory leaks
Date: Thu,  9 Apr 2020 16:12:37 +0200
Message-Id: <20200409141240.28876-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, samuel.thibault@ens-lyon.org, wl@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This series fixes two double free() introduced by suspend/resume
patches and several memory leaks.

Juergen Gross (3):
  mini-os: fix double free() in netfront
  mini-os: fix double free() in xenbus
  mini-os: fix several memory leaks related to xenbus

 blkfront.c       |  4 ++--
 console/xenbus.c |  2 +-
 fbfront.c        |  4 ++--
 netfront.c       |  4 +---
 pcifront.c       | 28 +++++++++++++---------------
 shutdown.c       |  2 +-
 xenbus/xenbus.c  |  8 ++++++--
 7 files changed, 26 insertions(+), 26 deletions(-)

-- 
2.16.4



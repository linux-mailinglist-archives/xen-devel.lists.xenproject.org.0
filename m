Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8B01D3537
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 17:36:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZFuL-0007AF-NV; Thu, 14 May 2020 15:36:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WGWk=64=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jZFuK-0007A7-78
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 15:36:24 +0000
X-Inumbo-ID: a76a2436-95f8-11ea-a4ad-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a76a2436-95f8-11ea-a4ad-12813bfff9fa;
 Thu, 14 May 2020 15:36:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D2228AC37;
 Thu, 14 May 2020 15:36:19 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 0/3] xen: Fix some bugs in scheduling
Date: Thu, 14 May 2020 17:36:11 +0200
Message-Id: <20200514153614.2240-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.1
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Some problems I found when trying to find a problem with
cpu-on/offlining in core scheduling mode.

Juergen Gross (3):
  xen/sched: allow rcu work to happen when syncing cpus in core
    scheduling
  xen/sched: don't call sync_vcpu_execstate() in
    sched_unit_migrate_finish()
  xen/sched: fix latent races accessing vcpu->dirty_cpu

 xen/arch/x86/domain.c     | 16 +++++++++++-----
 xen/common/keyhandler.c   |  2 +-
 xen/common/sched/core.c   | 18 ++++++++++--------
 xen/include/xen/sched.h   |  2 +-
 xen/include/xen/softirq.h |  2 +-
 5 files changed, 24 insertions(+), 16 deletions(-)

-- 
2.26.1



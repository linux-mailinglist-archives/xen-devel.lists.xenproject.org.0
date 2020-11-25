Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAE62C3E71
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 11:51:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37535.69945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khsOV-000790-K6; Wed, 25 Nov 2020 10:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37535.69945; Wed, 25 Nov 2020 10:51:27 +0000
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
	id 1khsOV-00078a-Fv; Wed, 25 Nov 2020 10:51:27 +0000
Received: by outflank-mailman (input) for mailman id 37535;
 Wed, 25 Nov 2020 10:51:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X3kr=E7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1khsOT-00078P-RB
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 10:51:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0601c2df-d943-428a-8bfb-055d745599b0;
 Wed, 25 Nov 2020 10:51:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 41431AC65;
 Wed, 25 Nov 2020 10:51:24 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X3kr=E7=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1khsOT-00078P-RB
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 10:51:25 +0000
X-Inumbo-ID: 0601c2df-d943-428a-8bfb-055d745599b0
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0601c2df-d943-428a-8bfb-055d745599b0;
	Wed, 25 Nov 2020 10:51:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606301484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Tzn7L8iu9XOgwrfAALgNnm2P5rnHXcOHz63aLo4MSgM=;
	b=bEqOmJFOPO7C6jy8lxPlZJeRHkYBLvjzMPvSQx8gVDtzkNxLdXWwkzRP+jWVR5DxKb8P3z
	KKDOblV2Tr+DIGf6DLukHT7IS39MGVyTTzYY8hsyIi1nyuzmOi3Nzxrk60+YSQ01kofciZ
	oVejyIAQ52M8sXn3N3Fn/0Gm7z7ZCuY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 41431AC65;
	Wed, 25 Nov 2020 10:51:24 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v8 0/3] xen/events: further locking adjustments
Date: Wed, 25 Nov 2020 11:51:19 +0100
Message-Id: <20201125105122.3650-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an add-on of my event channel locking series.

Juergen Gross (3):
  xen/events: modify struct evtchn layout
  xen/events: rework fifo queue locking
  xen/events: do some cleanups in evtchn_fifo_set_pending()

 xen/common/event_fifo.c | 152 +++++++++++++++++++++-------------------
 xen/include/xen/sched.h |  34 ++++-----
 2 files changed, 98 insertions(+), 88 deletions(-)

-- 
2.26.2



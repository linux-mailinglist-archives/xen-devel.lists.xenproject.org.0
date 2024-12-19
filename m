Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA3E9F880D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 23:47:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861510.1273479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOPIZ-0007TE-RY; Thu, 19 Dec 2024 22:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861510.1273479; Thu, 19 Dec 2024 22:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOPIZ-0007QI-Ok; Thu, 19 Dec 2024 22:47:15 +0000
Received: by outflank-mailman (input) for mailman id 861510;
 Thu, 19 Dec 2024 22:47:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQ2H=TM=eurecom.fr=ariel.otilibili-anieli@srs-se1.protection.inumbo.net>)
 id 1tOPIY-0007QC-22
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 22:47:14 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f011f5c-be5b-11ef-99a3-01e77a169b0f;
 Thu, 19 Dec 2024 23:47:11 +0100 (CET)
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago1i.eurecom.fr with ESMTP; 19 Dec 2024 23:47:10 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net
 [88.183.119.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id 407792397;
 Thu, 19 Dec 2024 23:47:10 +0100 (CET)
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
X-Inumbo-ID: 2f011f5c-be5b-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734648431; x=1766184431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=twcOgW39ORCy6kaIQzutC0BWyK65sKKIGGvefmUpGtk=;
  b=V6u9HNUVPLEbp60jfAA1N/ittrGnq3281VqNAwcTPB/QIcYmwRH1aBDO
   OVAfptc213torSwb6iAplWXxY/mB/T6fJvgP3wO72mV0FVzNFK/HahIOU
   3metn7VYxTXrGKhS72tGADHTpL+HrZ0KJsbYK3AX+l1jA8Q5lzkWtiv68
   E=;
X-CSE-ConnectionGUID: MVYnHboYSxmeIGDqDZlqVA==
X-CSE-MsgGUID: 3M+NuwlYT6WjxfuyxFg5LA==
X-IronPort-AV: E=Sophos;i="6.12,248,1728943200"; 
   d="scan'208";a="28263085"
From: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>
To: linux-kernel@vger.kernel.org
Cc: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>,
	stable@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 0/1] lib: Remove dead code
Date: Thu, 19 Dec 2024 23:45:00 +0100
Message-ID: <20241219224645.749233-1-ariel.otilibili-anieli@eurecom.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241219092615.644642-1-ariel.otilibili-anieli@eurecom.fr>
References: <20241219092615.644642-1-ariel.otilibili-anieli@eurecom.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch removes a dead code in lib/inflate.c; it follows from a discussion
in Xen.

The dead code is tracked by Coverity-ID 1055253 in Xen, was triggered by a file
taken unmodified from Linux.

Thank you,

Link: https://lore.kernel.org/all/7587b503-b2ca-4476-8dc9-e9683d4ca5f0@suse.com/
--
v2:
* Cc stable

Ariel Otilibili (1):
  lib: Remove dead code

 lib/inflate.c | 2 --
 1 file changed, 2 deletions(-)

-- 
2.47.1



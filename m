Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2F467353C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 11:15:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480909.745529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIRwD-0007W0-OX; Thu, 19 Jan 2023 10:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480909.745529; Thu, 19 Jan 2023 10:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIRwD-0007TE-LV; Thu, 19 Jan 2023 10:14:29 +0000
Received: by outflank-mailman (input) for mailman id 480909;
 Thu, 19 Jan 2023 10:13:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7itS=5Q=amazon.com=prvs=3763fc082=mstrasun@srs-se1.protection.inumbo.net>)
 id 1pIRvP-0007Ri-3P
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 10:13:39 +0000
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com
 [99.78.197.217]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee3750bf-97e1-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 11:13:36 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2c-m6i4x-8c5b1df3.us-west-2.amazon.com)
 ([10.25.36.210]) by smtp-border-fw-80006.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 10:13:30 +0000
Received: from EX13D40EUA003.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-pdx-2c-m6i4x-8c5b1df3.us-west-2.amazon.com (Postfix)
 with ESMTPS id 849C240E16
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jan 2023 10:13:30 +0000 (UTC)
Received: from EX19D039EUA003.ant.amazon.com (10.252.50.203) by
 EX13D40EUA003.ant.amazon.com (10.43.165.253) with Microsoft SMTP Server (TLS)
 id 15.0.1497.45; Thu, 19 Jan 2023 10:13:29 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX19D039EUA003.ant.amazon.com (10.252.50.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.7;
 Thu, 19 Jan 2023 10:13:29 +0000
Received: from dev-dsk-mstrasun-1c-15417e94.eu-west-1.amazon.com
 (172.19.92.214) by mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP
 Server id 15.0.1497.45 via Frontend Transport; Thu, 19 Jan 2023 10:13:28
 +0000
Received: by dev-dsk-mstrasun-1c-15417e94.eu-west-1.amazon.com (Postfix,
 from userid 17415739)
 id 8947921426; Thu, 19 Jan 2023 10:13:27 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ee3750bf-97e1-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1674123216; x=1705659216;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=K5VL5ZsFxWze3LkbqRpgB3nh8/LKnJaOy26zW4qwXA4=;
  b=t94a0XrZoTC749ME7ap9GIYx+x/Rskgf+30YYi2EosDJXi7OGEJG4+cQ
   LKBanhaqcwqROY3zGgxLhKQUGGKRxNxieU0aA2XzBA2G3XH4BTyQo2EWS
   C1fnFhI0xrzZMImuchB/kZvdkBobPd6SCYZREJtWYgh3PNUzeNG0GD1cr
   0=;
X-IronPort-AV: E=Sophos;i="5.97,228,1669075200"; 
   d="scan'208";a="172704163"
From: Mihails Strasuns <mstrasun@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <mstrasun@amazon.com>
Subject: [PATCH v1 0/4] Collection of livepatch-build-tools tweaks
Date: Thu, 19 Jan 2023 10:12:59 +0000
Message-ID: <cover.1673623880.git.mstrasun@amazon.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Small series of unrelated patches currently used by AWS fork of
livepatch-build-tools but not present upstream. Symbol alias patch is only
relevant for the case of stacking multiple patches and thus may be of no use to
xen in general but still submitting it for extra visibility.

Michael Kurth (1):
  common.h: Flush stdout before writing to stderr

Raphael Ning (2):
  livepatch-build: Allow a patch to introduce new subdirs
  livepatch-gcc: Ignore buildid.o

Stanislav Uschakow / Mihails Strasuns (1):
  create-diff-object: Add new symbols for relocation aliases

 common.h             |   1 +
 create-diff-object.c | 132 +++++++++++++++++++++++++++++++++++++++++++
 livepatch-build      |   1 +
 livepatch-gcc        |   1 +
 4 files changed, 135 insertions(+)

-- 
2.38.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879





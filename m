Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4B93E1669
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 16:07:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164245.300495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBe1v-0001Iw-1O; Thu, 05 Aug 2021 14:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164245.300495; Thu, 05 Aug 2021 14:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBe1u-0001GO-UJ; Thu, 05 Aug 2021 14:07:26 +0000
Received: by outflank-mailman (input) for mailman id 164245;
 Thu, 05 Aug 2021 14:07:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DXIG=M4=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mBe1t-0001GA-Eq
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 14:07:25 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80a86636-fd0f-461e-87de-4e3e43b68f6c;
 Thu, 05 Aug 2021 14:07:24 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1628172437013763.6145872632648;
 Thu, 5 Aug 2021 07:07:17 -0700 (PDT)
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
X-Inumbo-ID: 80a86636-fd0f-461e-87de-4e3e43b68f6c
ARC-Seal: i=1; a=rsa-sha256; t=1628172440; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q5N5nQSUgjg9TRcNiIYAQCduOn4zCVKDuVEHzqUtOCvz67XVtbf43UVXzE35XgdUw/XJsasoDRjDQbeKMbeO5XCGoiyupLjN2FReNeiTZpe8ijls3iNG1Y4fxdrC81uQtT+lJjVm1rjsbl0oZhaC9YnoVzRSuG0Vin1LDUm0Bic=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1628172440; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=yrWUhJXauL3bTDO8cx+gFuPwjJr3KglGzmwa4fRVgTw=; 
	b=kQ2jk8qu61sgH199kCwHU1fj5aTcZ202dpfSDs11iubC5HHy6Pxt6kRgtIkeSzY+J24mTBXaBR06cjxnZg87BMOj53XHxsxAk+aVxvNTwJWhA8NPYd2PPx2s6aX6FC1xhtwREG/Mle9mXGXRxQJKhgrTGaAE80QvH5XUIVLRe14=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1628172440;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=yrWUhJXauL3bTDO8cx+gFuPwjJr3KglGzmwa4fRVgTw=;
	b=d/Qq6MFo52fU+aT1J3G+wXKuSS6UgCqLSrh/qAyZOHUk7N4/mhAeo7kfKcLPf4jX
	pSI1vPCJoU+oWn/HjhSx6oZ5L3u/DuzXP8yS6E36/XrZpyoUnXmUdBiTJzVEXlxFRvb
	aR7uhPwYfw1kxlcIz6sbkGo+BdB/WXvukwJO7FyA=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v3 0/7] xsm: refactoring xsm hooks
Date: Thu,  5 Aug 2021 10:06:37 -0400
Message-Id: <20210805140644.357-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Based on feedback from 2021 Xen Developers Summit the xsm-roles RFC patch set
is being split into two separate patch sets. This is the first patch set and is
focused purely on the clean up and refactoring of the XSM hooks.

This patch set refactors the xsm_ops wrapper hooks to use the alternative_call
infrastructure. Then proceeds to move and realign the headers to simplify the
unnecessarily complicated header inclusions, remove the facad of being able to
enable/disable XSM, and simplify the XSM hooks down to a single interface and
implementation. The remainder of the changes are clean up and removing no
longer necessary abstractions.

v2:
 - restructured the patches, breaking them up as needed
 - incorporate Andrew Cooper's alternative call common code
 - change XSM module registration, removing register_xsm
 - incoporate KConfig recommendations
 - reworded commit messages
 - incorporate macro expansion recommendations
 - misc clean-up fallout from recommendations

v3:
 - renamed struct xsm_operations to struct xsm_ops
 - flask and silo ops structs made __initconst
 - fixed misplacement of __init on flask/silo_init
 - lots of coding style alignment
 - further clean up from FLASK_DISABLE removal
 - addressed commit message comments
 - removed missed guard around alternative-call include
 - reworked approach to XSM hooks, merging the two interfaces instead of
   dropping one

Andrew Cooper (1):
  xen: Implement xen/alternative-call.h for use in common code

Daniel P. Smith (6):
  xsm: remove the ability to disable flask
  xsm: refactor xsm_ops handling
  xsm: convert xsm_ops hook calls to alternative call
  xsm: decouple xsm header inclusion selection
  xsm: drop generic event channel labeling exclusion
  xsm: removing facade that XSM can be enabled/disabled

 xen/arch/x86/Kconfig               |    1 +
 xen/common/Kconfig                 |   50 +-
 xen/include/public/xsm/flask_op.h  |    2 +-
 xen/include/xen/alternative-call.h |   63 ++
 xen/include/xen/sched.h            |    4 -
 xen/include/xsm/dummy.h            |  711 +----------------
 xen/include/xsm/xsm-core.h         |  247 ++++++
 xen/include/xsm/xsm.h              | 1145 +++++++++++++++++-----------
 xen/xsm/Makefile                   |    3 +-
 xen/xsm/dummy.c                    |  160 ----
 xen/xsm/flask/flask_op.c           |   30 -
 xen/xsm/flask/hooks.c              |   12 +-
 xen/xsm/silo.c                     |   23 +-
 xen/xsm/xsm_core.c                 |   72 +-
 14 files changed, 1083 insertions(+), 1440 deletions(-)
 create mode 100644 xen/include/xen/alternative-call.h
 create mode 100644 xen/include/xsm/xsm-core.h
 delete mode 100644 xen/xsm/dummy.c

-- 
2.20.1



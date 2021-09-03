Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C4A4001B5
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 17:07:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178120.323996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMAm9-0005nn-0W; Fri, 03 Sep 2021 15:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178120.323996; Fri, 03 Sep 2021 15:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMAm8-0005kz-T2; Fri, 03 Sep 2021 15:06:40 +0000
Received: by outflank-mailman (input) for mailman id 178120;
 Fri, 03 Sep 2021 15:06:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yFRs=NZ=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mMAm7-0005kt-Nt
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 15:06:39 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2c0082e-686b-4760-b90e-0f7fdcb53c2d;
 Fri, 03 Sep 2021 15:06:38 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1630681592656284.14797840719837;
 Fri, 3 Sep 2021 08:06:32 -0700 (PDT)
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
X-Inumbo-ID: c2c0082e-686b-4760-b90e-0f7fdcb53c2d
ARC-Seal: i=1; a=rsa-sha256; t=1630681596; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E2oZLva+iHX9+Zc88gM7a7iGmT8mb9EStMMvtU73/v3qRt+V+muRRXZw12qB5H+sNR+05kxZU1rfEd8iEAFhHsJggDyk7PTTFHm/28TIKSEONkZELEVtZ9A+3qHlyjiUvpuqBomYG4ZgaiArsUYBelM6VcAciOvKIGEmv2Z15Nk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1630681596; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=DY8SumKHy69+y3Ky8ZXpZgjykeZw2efDQnmXyQdCT7I=; 
	b=KzC69ufgi3jJTaSVSrXTOevHYq2d/Sx2ojmKZ3PsXiBsmc5bDjT4GCk6lxtL9j14ALyZ2KhQ9GEpYFsqy2cunu2hT/Zl56eTVasu/I0jIAJW6zHxQwacDJlEEv9lsFczrSfgHqowhzSpCyAH2EoLFR74cMWGpHl8T8xDioQ+ehs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1630681596;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=DY8SumKHy69+y3Ky8ZXpZgjykeZw2efDQnmXyQdCT7I=;
	b=csHVsu2HGGmCXToKfqdM5cZAqNkSdhU0AnJAka7lU2tQX30O9p4ZE5KcnwUzhTfH
	/yNdQaj8UePYzjJ57chw/dbmLNY1IaRGOxBOtpoUcDilRvIOvW5ccyH2HOj6LNRF6bk
	zAmhlLuo01z5G+TRTQuitv1iSvRV/YzP7DG4QdeA=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v4 00/11] xsm: refactoring xsm hooks
Date: Fri,  3 Sep 2021 15:06:18 -0400
Message-Id: <20210903190629.11917-1-dpsmith@apertussolutions.com>
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

v4:
- make __alt_call_maybe_initdata resolve to __read_mostly when
  CONFIG_ALTERNATIVE_CALL is not set
- removed the masking of void with xsm_op_t
- moved all the coding style conformity to an early commit
- fixed declaration on real and stub declarations in xsm.h
- corrected to __initconstrel
- made the xsm_ops global __read_mostly
- adjusted blank lines in xsm_ops struct to provide consistent grouping
- moved extern references to built in policy to where they are used
- Added back in the #ifdef CONFIG_XSM into struct evtchn
- split the patch removing the duplicate interface up further

Andrew Cooper (1):
  xen: Implement xen/alternative-call.h for use in common code

Daniel P. Smith (10):
  xsm: remove the ability to disable flask
  xsm: drop dubious xsm_op_t type
  xsm: apply coding style
  xsm: refactor xsm_ops handling
  xsm: convert xsm_ops hook calls to alternative call
  xsm: decouple xsm header inclusion selection
  xsm: drop generic event channel labeling exclusion
  silo: remove circular xsm hook call
  kconfig: update xsm config to reflect reality
  xsm: remove alternate xsm hook interface

 xen/arch/x86/Kconfig               |   1 +
 xen/common/Kconfig                 |  52 +-
 xen/include/public/xsm/flask_op.h  |   2 +-
 xen/include/xen/alternative-call.h |  63 +++
 xen/include/xen/hypercall.h        |   4 +-
 xen/include/xen/sched.h            |   4 +-
 xen/include/xsm/dummy.h            | 774 ---------------------------
 xen/include/xsm/xsm-core.h         | 273 ++++++++++
 xen/include/xsm/xsm.h              | 804 +++++++++++++----------------
 xen/xsm/Makefile                   |   4 +-
 xen/xsm/dummy.c                    |   7 +-
 xen/xsm/dummy.h                    | 739 ++++++++++++++++++++++++++
 xen/xsm/flask/flask_op.c           |  32 +-
 xen/xsm/flask/hooks.c              |  16 +-
 xen/xsm/silo.c                     |  25 +-
 xen/xsm/xsm_core.c                 |  94 ++--
 16 files changed, 1535 insertions(+), 1359 deletions(-)
 create mode 100644 xen/include/xen/alternative-call.h
 delete mode 100644 xen/include/xsm/dummy.h
 create mode 100644 xen/include/xsm/xsm-core.h
 create mode 100644 xen/xsm/dummy.h

-- 
2.20.1



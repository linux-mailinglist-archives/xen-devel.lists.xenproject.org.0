Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA586406F41
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 18:13:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184575.333270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOj99-0006Oh-AO; Fri, 10 Sep 2021 16:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184575.333270; Fri, 10 Sep 2021 16:12:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOj99-0006Mu-7E; Fri, 10 Sep 2021 16:12:59 +0000
Received: by outflank-mailman (input) for mailman id 184575;
 Fri, 10 Sep 2021 16:12:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyUy=OA=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mOj97-0006Mo-Cx
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 16:12:57 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b40aa41c-c8c4-45f7-922e-27ac559ccc0a;
 Fri, 10 Sep 2021 16:12:56 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1631290370242444.1939855081141;
 Fri, 10 Sep 2021 09:12:50 -0700 (PDT)
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
X-Inumbo-ID: b40aa41c-c8c4-45f7-922e-27ac559ccc0a
ARC-Seal: i=1; a=rsa-sha256; t=1631290373; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S7zH1Yr+e5vBmhRWJYSz9bqQdfjzzlKQLDc1erq4JGAZCaaudXm9QJxvYErSAlXqsUmXBpFckBfnXxg2nTrgM8LCojU8xmV1XN/drrsLWRzZMCZ2qQhx87Wdf+kFTF/QT7YfNL/kGsFQw5Fc8X7my5qcZXi50H+pD4ucMU2VzTk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1631290373; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=2Q9d75Ru4N44075sHiEBdOazR6OiC0qVA4Rjf8vgGlM=; 
	b=CThCCe2uhc/ol9EpIeA17vAYVkjYxy5D5eoNehKmIXsgX11f8/AfaTkjgH0e3NqZGk8RSsT5j1i++NUqRJzLp7Jn2eoPIxh+YxzxGfCsUGujMYQFSu9k1zyx0hCof4AwcAgERHD9PiOhw4V4PCu/0fshESX1/WPtLNW3qcb2UKc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631290373;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2Q9d75Ru4N44075sHiEBdOazR6OiC0qVA4Rjf8vgGlM=;
	b=YniGmm+PdOuDK0xEwillFqEVU9D6Y5uU7DTZsHpDrIsA102bV5IhySvcRZQCswNg
	jTiPHccYTvwuHthnQCIJO5giGhFvDUszUiHoiZe2TJlmpgukAaulW5Ghj+SgZ4U+YZS
	Ms1JoA3cPPabOZH57ziLqXxO/5p0JjJP2PUt0Sas=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v6 00/10] xsm: refactoring xsm hooks
Date: Fri, 10 Sep 2021 16:12:55 -0400
Message-Id: <20210910201305.32526-1-dpsmith@apertussolutions.com>
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

v5
- changed 80 col wrapping style to preferred style
- a few additional code style cleanups caught in v4 review
- made xsm_ops_registered __initdata
- pulled duplicate if out of switch cases in xsm_core_init()
- dropped struct evtchn commit
- dropped silo hooks direct calls to xsm_default_action

v6
- adjusted alt call documentation comment
- fixed the leak of hard tabs into the commits

Andrew Cooper (1):
  xen: Implement xen/alternative-call.h for use in common code

Daniel P. Smith (9):
  xsm: remove the ability to disable flask
  xsm: remove remnants of xsm_memtype hook
  xsm: drop dubious xsm_op_t type
  xsm: apply coding style
  xsm: refactor xsm_ops handling
  xsm: convert xsm_ops hook calls to alternative call
  xsm: decouple xsm header inclusion selection
  kconfig: update xsm config to reflect reality
  xsm: remove alternate xsm hook interface

 xen/arch/x86/Kconfig               |   1 +
 xen/common/Kconfig                 |  52 +-
 xen/include/public/xsm/flask_op.h  |   2 +-
 xen/include/xen/alternative-call.h |  63 +++
 xen/include/xen/hypercall.h        |   4 +-
 xen/include/xen/sched.h            |   2 +-
 xen/include/xsm/dummy.h            | 215 +++++---
 xen/include/xsm/xsm-core.h         | 266 ++++++++++
 xen/include/xsm/xsm.h              | 802 +++++++++++++----------------
 xen/xsm/Makefile                   |   4 +-
 xen/xsm/dummy.c                    |   7 +-
 xen/xsm/dummy.h                    | 659 ++++++++++++++++++++++++
 xen/xsm/flask/flask_op.c           |  32 +-
 xen/xsm/flask/hooks.c              |  16 +-
 xen/xsm/silo.c                     |  11 +-
 xen/xsm/xsm_core.c                 |  93 ++--
 xen/xsm/xsm_policy.c               |   7 +-
 17 files changed, 1564 insertions(+), 672 deletions(-)
 create mode 100644 xen/include/xen/alternative-call.h
 create mode 100644 xen/include/xsm/xsm-core.h
 create mode 100644 xen/xsm/dummy.h

-- 
2.20.1



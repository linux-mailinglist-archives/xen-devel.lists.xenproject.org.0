Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA8A405F43
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 00:13:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183571.331836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOSHZ-0003et-6g; Thu, 09 Sep 2021 22:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183571.331836; Thu, 09 Sep 2021 22:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOSHZ-0003cQ-3T; Thu, 09 Sep 2021 22:12:33 +0000
Received: by outflank-mailman (input) for mailman id 183571;
 Thu, 09 Sep 2021 22:12:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mNcr=N7=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mOSHX-0003c4-QP
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 22:12:31 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f3d50f6-4828-449e-8654-149f939dc103;
 Thu, 09 Sep 2021 22:12:30 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1631225544701162.02198658548343;
 Thu, 9 Sep 2021 15:12:24 -0700 (PDT)
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
X-Inumbo-ID: 5f3d50f6-4828-449e-8654-149f939dc103
ARC-Seal: i=1; a=rsa-sha256; t=1631225548; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Tlnm4EJ05rZzsP9cknZFvs/tffNhjJyL2Ja6MkLClKvXZNffMYaZkALdOXFCu7vRamvzBGq9p3sklT7BXfgbYnoLLtJ+sv5752kLFzSXW4Ad91IgACwN/tZuZvCrPv2CMFBskkaRsb4JYOfe+EAiVjvxvwIlC9fr1kSVUuBkWko=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1631225548; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=jfgI+YuhgZ+q3DewpTocAmdfPzKAzfGL5vsDIKUFnGE=; 
	b=g+gl71bTI1pHUlGZo3cpLKKKzIej8hq/+O0x7LSU06s91kDKN9nU0/oEV7vO5fyapmQyzDMvnO/UIS6av8gJJP4I3NrzmN+WoK1lpuRfB6QHjAG+FJuFoXt7h66qZohDNIuGNF6XkEP08jX0f7umgyP5n3dh/Wo97yjbJ1uVQfc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631225548;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jfgI+YuhgZ+q3DewpTocAmdfPzKAzfGL5vsDIKUFnGE=;
	b=a9+u4zwMP9eMIUn9slvQuoii671WB7whRF4nomXfMXV9tTHPRjAhPECw9wBlLjbZ
	4VcvCbdzBP6uZwrg4kmbJHP9HRCbVPLIhj58uJ99QvrVkDv2Ayb7msjMJb1EYm6IanH
	fCtnRI0mMyvXolQAw5mALtwTTJzy22KORnaVT7To=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v5 00/10] xsm: refactoring xsm hooks
Date: Thu,  9 Sep 2021 22:12:25 -0400
Message-Id: <20210910021236.15082-1-dpsmith@apertussolutions.com>
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
 xen/include/xsm/dummy.h            | 774 ---------------------------
 xen/include/xsm/xsm-core.h         | 266 ++++++++++
 xen/include/xsm/xsm.h              | 806 +++++++++++++----------------
 xen/xsm/Makefile                   |   4 +-
 xen/xsm/dummy.c                    |   7 +-
 xen/xsm/dummy.h                    | 659 +++++++++++++++++++++++
 xen/xsm/flask/flask_op.c           |  32 +-
 xen/xsm/flask/hooks.c              |  16 +-
 xen/xsm/silo.c                     |  11 +-
 xen/xsm/xsm_core.c                 |  93 ++--
 xen/xsm/xsm_policy.c               |   7 +-
 17 files changed, 1436 insertions(+), 1363 deletions(-)
 create mode 100644 xen/include/xen/alternative-call.h
 delete mode 100644 xen/include/xsm/dummy.h
 create mode 100644 xen/include/xsm/xsm-core.h
 create mode 100644 xen/xsm/dummy.h

-- 
2.20.1



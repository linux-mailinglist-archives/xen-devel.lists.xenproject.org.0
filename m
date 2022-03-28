Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ADE4E9C5A
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 18:36:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295531.502968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYsLH-0001eE-Ut; Mon, 28 Mar 2022 16:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295531.502968; Mon, 28 Mar 2022 16:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYsLH-0001bc-Rp; Mon, 28 Mar 2022 16:35:43 +0000
Received: by outflank-mailman (input) for mailman id 295531;
 Mon, 28 Mar 2022 16:35:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3mb0=UH=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nYsLF-0001bP-MQ
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 16:35:41 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 189181fc-aeb5-11ec-a405-831a346695d4;
 Mon, 28 Mar 2022 18:35:39 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1648485332535493.0992602782029;
 Mon, 28 Mar 2022 09:35:32 -0700 (PDT)
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
X-Inumbo-ID: 189181fc-aeb5-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1648485334; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AuxhZiSizSrTt6uFL8noR1zwcYqQ+mwJHswRmYUavt4CriU2+Nkg+E5KrIl2gIShNWujYkkp+7W4kunG+hWuhoxboTtLZ1xRF9u0AzAkytcx3+h6VGbZR/99qIj1gXnN1uYhXQ7C5bd+wR/CAW7O2yye8/RYUgg3ig5Ox00NszE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1648485334; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=rVSicid7cDP30cTP7xbd0CtnuhwtVXsNfPS2mJ2odxM=; 
	b=Jt0xt/T/0Rz71KuHa6zuWpMAcgDyZiUvTgYzbKm4lEx6z88v2PHKcY7uJgBjYm3FIyYmY0sHSbNWLsD0wnfEFEPq96N9FEOZUZHrANdvKzVZBMbZic06PnB+clql8IXwr59r2uNv5hoMj+IovkV809S/UCu7NaX7cnDLTR0WgrQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1648485334;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=rVSicid7cDP30cTP7xbd0CtnuhwtVXsNfPS2mJ2odxM=;
	b=sbF8yx5QlHpQLANJ2Q+nGv8QxdV+s5LYtle4OSem00wnx7f1K/G8YKRE2YgZouX3
	nWc+VtiBP/I4UeaVGCM2ecxHDAkjPJ2wy2OK0mislfLly8k5M6f2u8HFHfYNtO5zFv7
	XT4ZIKgk9kivEF9cYZpI/VdINqo2XnguWeGZwvVE=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	jandryuk@gmail.com,
	sstabellini@kernel.org
Subject: [RFC PATCH 0/1] allow system domains to allocate event channels
Date: Mon, 28 Mar 2022 16:36:21 -0400
Message-Id: <20220328203622.30961-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

In the discussion thread on patch `[PATCH v3 2/5] xen: make
evtchn_alloc_unbound public` there were a few suggestions on the appropriate
way to handle allowing the hypervisor to allocate event channels for domains
being constructed by dom0less and hyerplaunch. After taking another look at how
to generalize the suggested approach to temporarily promote the idle domain to
`is_privileged` it became clear there was a simpler and a longer term fix.

Since it was not discussed and with others are on limited time, I have not done
any testing beyond making sure this compiles and therefore I am sending this as
an RFC to allow everyone to review it. This also provides a patch should
dom0less would like to include it into their patch series.

Daniel P. Smith (1):
  xsm: allows system domains to allocate evtchn

 xen/common/event_channel.c | 4 ++--
 xen/include/xsm/dummy.h    | 8 ++++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.20.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABECC6EB87
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 14:09:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165959.1492626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLhvr-0003yf-Je; Wed, 19 Nov 2025 13:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165959.1492626; Wed, 19 Nov 2025 13:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLhvr-0003w7-GR; Wed, 19 Nov 2025 13:09:11 +0000
Received: by outflank-mailman (input) for mailman id 1165959;
 Wed, 19 Nov 2025 13:09:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aBqX=53=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1vLhvq-0003iP-Pd
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 13:09:10 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef6e9ebf-c548-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 14:09:10 +0100 (CET)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-232-WePI68LnPQCITVv1F2bMiQ-1; Wed,
 19 Nov 2025 08:09:04 -0500
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6E5D219560AD; Wed, 19 Nov 2025 13:09:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.18])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 720CA180047F; Wed, 19 Nov 2025 13:08:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 766DA21E6A27; Wed, 19 Nov 2025 14:08:55 +0100 (CET)
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
X-Inumbo-ID: ef6e9ebf-c548-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763557749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Js6BO4VeBey2OiZe7AjXj3GXLYuEHV85DWPD2FEQA2I=;
	b=hWZ7Yv65+kQoFiDL2iLN9JWViSTd+Y+g80ACGb3/OnRsAd/izKPt0dgmcs3IVaF/Z5M6uu
	PkJbFkmiN82vP2Y0MxhmaJMMOUyi1j5Igv+1zrtbsLBNEWUX/JiJlcImFFZxVQvEje68YP
	prNA5LHB9yzPIcZ4GBzLwOqaoA5WTf4=
X-MC-Unique: WePI68LnPQCITVv1F2bMiQ-1
X-Mimecast-MFC-AGG-ID: WePI68LnPQCITVv1F2bMiQ_1763557741
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	hreitz@redhat.com,
	mst@redhat.com,
	imammedo@redhat.com,
	anisinha@redhat.com,
	gengdongjiu1@gmail.com,
	peter.maydell@linaro.org,
	alistair@alistair23.me,
	edgar.iglesias@gmail.com,
	npiggin@gmail.com,
	harshpb@linux.ibm.com,
	palmer@dabbelt.com,
	liwei1518@gmail.com,
	dbarboza@ventanamicro.com,
	zhiwei_liu@linux.alibaba.com,
	sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	berrange@redhat.com,
	peterx@redhat.com,
	farosas@suse.de,
	eblake@redhat.com,
	vsementsov@yandex-team.ru,
	eduardo@habkost.net,
	marcel.apfelbaum@gmail.com,
	philmd@linaro.org,
	wangyanan55@huawei.com,
	zhao1.liu@intel.com,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 0/5] A bit of cleanup around Error
Date: Wed, 19 Nov 2025 14:08:50 +0100
Message-ID: <20251119130855.105479-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Note: the last patch adds a drive-by FIXME.  I asked for advice on how
to fix it:

    Subject: Incorrect error handling in xen_enable_tpm()
    To: qemu-devel@nongnu.org
    Cc: Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, Paul
     Durrant <paul@xen.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
     xen-devel@lists.xenproject.org, Vikram Garhwal <vikram.garhwal@amd.com> 
    Date: Fri, 14 Nov 2025 10:16:58 +0100
    Message-ID: <87jyzt0y9h.fsf@pond.sub.org>

No reply so far.

Markus Armbruster (5):
  hw/core/loader: Make load_elf_hdr() return bool, simplify caller
  hw/nvram/xlnx-bbram: More idiomatic and simpler error reporting
  nbd/client-connection: Replace error_propagate() by assignment
  error: error_free(NULL) is safe, drop unnecessary conditionals
  error: Consistently name Error * objects err, and not errp

 include/hw/loader.h         |  4 +++-
 block/crypto.c              |  8 ++++----
 hw/acpi/ghes.c              |  8 ++++----
 hw/acpi/pcihp.c             |  4 +---
 hw/arm/boot.c               |  6 +-----
 hw/core/loader.c            |  8 ++++++--
 hw/nvram/xlnx-bbram.c       | 18 ++++--------------
 hw/ppc/spapr.c              | 16 ++++++++--------
 hw/riscv/spike.c            | 10 +---------
 hw/xen/xen-pvh-common.c     | 13 ++++++++++---
 io/channel-websock.c        |  4 +---
 io/task.c                   |  4 +---
 migration/migration.c       |  6 ++----
 nbd/client-connection.c     |  3 +--
 nbd/common.c                |  6 +++---
 tests/unit/test-smp-parse.c |  5 +----
 16 files changed, 51 insertions(+), 72 deletions(-)

-- 
2.49.0



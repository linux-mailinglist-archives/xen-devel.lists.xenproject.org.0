Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FDE962571
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 13:04:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784705.1194080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjGSm-0006Rx-L8; Wed, 28 Aug 2024 11:03:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784705.1194080; Wed, 28 Aug 2024 11:03:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjGSm-0006QV-Ib; Wed, 28 Aug 2024 11:03:44 +0000
Received: by outflank-mailman (input) for mailman id 784705;
 Wed, 28 Aug 2024 11:03:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=933A=P3=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sjGSk-0006QP-Ju
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 11:03:42 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c9534be-652d-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 13:03:40 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id C9F3A2EAB7;
 Wed, 28 Aug 2024 07:03:35 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id B25B02EAB6;
 Wed, 28 Aug 2024 07:03:35 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [46.211.119.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 8C6BF2EAB5;
 Wed, 28 Aug 2024 07:03:31 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: 2c9534be-652d-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=oeuHNhYVPMSGHHFU+SsBAnXlLn7c83Viv0J+IyHHYIo=; b=Ep95
	tuXmsWrLVHQTZMlC2dVhqu4vg41ekwIV05H+4ON0ywkO8OLuueUz95zlr8iPUQJb
	bgE5wh3mssZb/XMBc86sBcruwpBdv6rqTOSlIk3pLFx155Aro3MY+81It7uWqU3Y
	VdBYmJVKj0RGpbOcSBVqfhSt6E4KZxjwLCxiRPM=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [XEN PATCH v7 0/2] x86: make CPU virtualisation support configurable
Date: Wed, 28 Aug 2024 14:03:27 +0300
Message-Id: <cover.1724842645.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 297F73F6-652D-11EF-84A2-E92ED1CD468F-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

These are final 2 patches of the series for making VMX/SVM support in Xen
configurable:

https://lore.kernel.org/xen-devel/cover.1723110344.git.Sergiy_Kibrik@epam=
.com/

Minor changes comparing to v6, changelogs are provided per-patch.

  -Sergiy=20

Xenia Ragiadakou (2):
  ioreq: do not build arch_vcpu_ioreq_completion() for non-VMX
    configurations
  x86/hvm: make AMD-V and Intel VT-x support configurable

 xen/Kconfig              |  7 +++++++
 xen/arch/arm/ioreq.c     |  6 ------
 xen/arch/x86/Kconfig     | 19 +++++++++++++++++--
 xen/arch/x86/hvm/ioreq.c |  2 ++
 xen/include/xen/ioreq.h  | 10 ++++++++++
 5 files changed, 36 insertions(+), 8 deletions(-)

--=20
2.25.1



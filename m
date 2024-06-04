Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3228FADDC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 10:46:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735226.1141410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEPoa-0003jJ-8K; Tue, 04 Jun 2024 08:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735226.1141410; Tue, 04 Jun 2024 08:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEPoa-0003hh-5T; Tue, 04 Jun 2024 08:46:44 +0000
Received: by outflank-mailman (input) for mailman id 735226;
 Tue, 04 Jun 2024 08:46:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WX0/=NG=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sEPoZ-0003hb-G1
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 08:46:43 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5d8c29b-224e-11ef-90a1-e314d9c70b13;
 Tue, 04 Jun 2024 10:46:41 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 348B8196BB;
 Tue,  4 Jun 2024 04:46:39 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 2D4EC196BA;
 Tue,  4 Jun 2024 04:46:39 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 0865C196B8;
 Tue,  4 Jun 2024 04:46:36 -0400 (EDT)
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
X-Inumbo-ID: f5d8c29b-224e-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=P9ViT+kByA/nS2oeEkrB3i3OCLuzrwsXL0AtZYq0SDs=; b=sztl
	ItHCErinkS2tgsfI1DY82krVXhIK4EVp/o4zHxKiRTeATPmi+1jqZkclsaXXRo0i
	rkpmOH7MudPwDrMe3I/bAdD2gmB4hlhdjUyEJkyXDZFtzULP/5wpbgoMIdijt5e7
	ppZClWS2zmMoS44Vy8mJiBz3pZIh79xC4otr7xY=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH] x86/cpufreq: clean up stale powernow_cpufreq_init()
Date: Tue,  4 Jun 2024 11:46:29 +0300
Message-Id: <20240604084629.2418430-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 F38A66C8-224E-11EF-83AA-8F8B087618E4-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

Remove useless declaration. The routine itself was removed by following
commit long time ago:

   222013114 x86: Fix RevF detection in powernow.c

No functional change.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/include/acpi/cpufreq/processor_perf.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi=
/cpufreq/processor_perf.h
index 5f48aceadb..301104e16f 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -7,7 +7,6 @@
=20
 #define XEN_PX_INIT 0x80000000U
=20
-int powernow_cpufreq_init(void);
 unsigned int powernow_register_driver(void);
 unsigned int get_measured_perf(unsigned int cpu, unsigned int flag);
 void cpufreq_residency_update(unsigned int cpu, uint8_t state);
--=20
2.25.1



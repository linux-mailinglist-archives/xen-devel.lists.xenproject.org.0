Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5598C6356
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 11:02:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722024.1125809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AWQ-00080L-C7; Wed, 15 May 2024 09:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722024.1125809; Wed, 15 May 2024 09:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AWQ-0007ye-8q; Wed, 15 May 2024 09:02:02 +0000
Received: by outflank-mailman (input) for mailman id 722024;
 Wed, 15 May 2024 09:02:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJut=MS=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s7AWO-0007yU-Ky
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 09:02:00 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c972cd5e-1299-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 11:01:59 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id B7E011AE9D;
 Wed, 15 May 2024 05:01:58 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id AEFA81AE9C;
 Wed, 15 May 2024 05:01:58 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id CD3601AE9B;
 Wed, 15 May 2024 05:01:57 -0400 (EDT)
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
X-Inumbo-ID: c972cd5e-1299-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=0h3VDZqzxvclJXa5ig4GCZlFK
	w9kvRilSok7LMNliA4=; b=tYioIXoEbVaYnBVUQFf+TZ979ZYN5ixxzYuibjcWs
	YOlpH0krxzhbyvOsprIjv3PACrLl6Td7ZBK7EnAUtxKARZsd38sTTEbh9w4PnkMj
	0Oknt+u/3yqEtTgH/uu3fXxJDxYvO+4t35m5rjoqD0IBtWJ1UqT2wtA3rdNRwcWR
	Zc=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [XEN PATCH v2 02/15] x86/monitor: guard altp2m usage
Date: Wed, 15 May 2024 12:01:55 +0300
Message-Id: <01767c3f98a88999d4b8ed3ae742ad66a0921ba3.1715761386.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 C8B7F45C-1299-11EF-9E0A-78DCEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

Explicitly check whether altp2m is on for domain when getting altp2m inde=
x.
If explicit call to altp2m_active() always returns false, DCE will remove
call to altp2m_vcpu_idx().

The puspose of that is later to be able to disable altp2m support and
exclude its code from the build completely, when not supported by target
platform (as of now it's supported for VT-d only).

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v2:
 - patch description changed, removed VMX mentioning
 - guard by altp2m_active() instead of hvm_altp2m_supported()
---
 xen/arch/x86/hvm/monitor.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
index 2a8ff07ec9..74621000b2 100644
--- a/xen/arch/x86/hvm/monitor.c
+++ b/xen/arch/x86/hvm/monitor.c
@@ -262,6 +262,8 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t g=
fn, uint32_t pfec,
     struct vcpu *curr =3D current;
     vm_event_request_t req =3D {};
     paddr_t gpa =3D (gfn_to_gaddr(gfn) | (gla & ~PAGE_MASK));
+    unsigned int altp2m_idx =3D altp2m_active(curr->domain) ?
+                              altp2m_vcpu_idx(curr) : 0;
     int rc;
=20
     ASSERT(curr->arch.vm_event->send_event);
@@ -270,7 +272,7 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t g=
fn, uint32_t pfec,
      * p2m_get_mem_access() can fail from a invalid MFN and return -ESRC=
H
      * in which case access must be restricted.
      */
-    rc =3D p2m_get_mem_access(curr->domain, gfn, &access, altp2m_vcpu_id=
x(curr));
+    rc =3D p2m_get_mem_access(curr->domain, gfn, &access, altp2m_idx);
=20
     if ( rc =3D=3D -ESRCH )
         access =3D XENMEM_access_n;
--=20
2.25.1



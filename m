Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 167B492AF9D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 07:57:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755763.1164221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR3qM-0002BC-28; Tue, 09 Jul 2024 05:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755763.1164221; Tue, 09 Jul 2024 05:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR3qL-00029F-V4; Tue, 09 Jul 2024 05:56:49 +0000
Received: by outflank-mailman (input) for mailman id 755763;
 Tue, 09 Jul 2024 05:56:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGp0=OJ=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sR3qK-0001zP-Bp
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 05:56:48 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0654c391-3db8-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 07:56:47 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id BF69D200AB;
 Tue,  9 Jul 2024 01:56:45 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id B7167200AA;
 Tue,  9 Jul 2024 01:56:45 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 51580200A9;
 Tue,  9 Jul 2024 01:56:42 -0400 (EDT)
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
X-Inumbo-ID: 0654c391-3db8-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=PZhVY9LIzVXZ4htpEIfnL3NvI
	7Nfr1WjFpp0WOKYq8E=; b=pmcakE4hRD2kxNMVBqE88T7zF3Oc3gMwA9E8EtXMV
	hINC87/+j6Dqzi4vGCD/RXy1IP4QoZzX5V+nxvrpOPO+RgHvzfkvcavrzjP8UDDl
	a/HEdbUuuh607wEPbKtEmJvvPSuTAyvEPBBM3bAIHwi42srmVleGho8UKkN4rtJ4
	cY=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v4 06/14] x86/p2m: guard EPT functions with using_vmx() check
Date: Tue,  9 Jul 2024 08:56:38 +0300
Message-Id: <d51ae897890ec01de70c44d15450e888f84d34c4.1720501197.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 04140D3A-3DB8-11EF-A90D-DFF1FEA446E2-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

Replace cpu_has_vmx check with using_vmx(), so that we do check if functi=
ons
ept_p2m_init() and ept_p2m_uninit() can be called.
Since currently Intel EPT implementation depends on CONFIG_VMX config opt=
ion,
when VMX is off these functions are unavailable.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
changes in v4:
 - changed description a bit
 - added tag
 - adjusted call to using_vmx(), as it has become an inline function
changes in v3:
 - using_vmx instead of IS_ENABLED(CONFIG_VMX)
 - updated description
---
 xen/arch/x86/mm/p2m-basic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-basic.c b/xen/arch/x86/mm/p2m-basic.c
index 08007a687c..e126fda267 100644
--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -40,7 +40,7 @@ static int p2m_initialise(struct domain *d, struct p2m_=
domain *p2m)
     p2m_pod_init(p2m);
     p2m_nestedp2m_init(p2m);
=20
-    if ( hap_enabled(d) && cpu_has_vmx )
+    if ( hap_enabled(d) && using_vmx() )
         ret =3D ept_p2m_init(p2m);
     else
         p2m_pt_init(p2m);
@@ -72,7 +72,7 @@ struct p2m_domain *p2m_init_one(struct domain *d)
 void p2m_free_one(struct p2m_domain *p2m)
 {
     p2m_free_logdirty(p2m);
-    if ( hap_enabled(p2m->domain) && cpu_has_vmx )
+    if ( hap_enabled(p2m->domain) && using_vmx() )
         ept_p2m_uninit(p2m);
     free_cpumask_var(p2m->dirty_cpumask);
     xfree(p2m);
--=20
2.25.1



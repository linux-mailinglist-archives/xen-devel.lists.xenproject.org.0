Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED1E8D8112
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 13:22:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734844.1140949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5ln-0005fc-AW; Mon, 03 Jun 2024 11:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734844.1140949; Mon, 03 Jun 2024 11:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5ln-0005de-7y; Mon, 03 Jun 2024 11:22:31 +0000
Received: by outflank-mailman (input) for mailman id 734844;
 Mon, 03 Jun 2024 11:22:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G0SM=NF=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sE5ll-0005dC-8v
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 11:22:29 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ef92e04-219b-11ef-90a1-e314d9c70b13;
 Mon, 03 Jun 2024 13:22:28 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 56746317B7;
 Mon,  3 Jun 2024 07:22:27 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 4EE87317B6;
 Mon,  3 Jun 2024 07:22:27 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 20D17317B5;
 Mon,  3 Jun 2024 07:22:23 -0400 (EDT)
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
X-Inumbo-ID: 8ef92e04-219b-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=zTRJcrxkkTEClYsuRZF33f4dO
	2xkoYPQYVqoFLYitDA=; b=OhEv95fhpMwMEbss3+HIzhjyAfx9PiUxSJglyEpM+
	6D5t5J+swdquc1xTU6Y00z23wh0hxZpAEa87x5eZNVIOtAtzww0XJjXZyW+4tZaI
	6sRSdOgdRU9GwNM7tB9XIU+m29ZAIbtJLp1KqcTuvg3On2s4U381gi+xQZhXyqo+
	FE=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v3 08/16] x86/p2m: guard EPT functions with using_vmx macro
Date: Mon,  3 Jun 2024 14:22:21 +0300
Message-Id: <52c64ffd589f289fda271422fee1e957f94aac6e.1717410850.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 8D074668-219B-11EF-92C9-8F8B087618E4-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

Replace cpu_has_vmx check with using_vmx, so that presence of functions
ept_p2m_init() and ept_p2m_uninit() in the build gets checked.
Since currently Intel EPT implementation depends on CONFIG_VMX config opt=
ion,
when VMX is off these functions are unavailable.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
changes in v3:
 - using_vmx instead of IS_ENABLED(CONFIG_VMX)
 - updated description
 -
---
 xen/arch/x86/mm/p2m-basic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-basic.c b/xen/arch/x86/mm/p2m-basic.c
index 08007a687c..442284fb40 100644
--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -40,7 +40,7 @@ static int p2m_initialise(struct domain *d, struct p2m_=
domain *p2m)
     p2m_pod_init(p2m);
     p2m_nestedp2m_init(p2m);
=20
-    if ( hap_enabled(d) && cpu_has_vmx )
+    if ( hap_enabled(d) && using_vmx )
         ret =3D ept_p2m_init(p2m);
     else
         p2m_pt_init(p2m);
@@ -72,7 +72,7 @@ struct p2m_domain *p2m_init_one(struct domain *d)
 void p2m_free_one(struct p2m_domain *p2m)
 {
     p2m_free_logdirty(p2m);
-    if ( hap_enabled(p2m->domain) && cpu_has_vmx )
+    if ( hap_enabled(p2m->domain) && using_vmx )
         ept_p2m_uninit(p2m);
     free_cpumask_var(p2m->dirty_cpumask);
     xfree(p2m);
--=20
2.25.1



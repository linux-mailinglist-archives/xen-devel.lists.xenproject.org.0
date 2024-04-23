Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9448AE052
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 10:54:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710440.1109681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzBv8-0004pu-SH; Tue, 23 Apr 2024 08:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710440.1109681; Tue, 23 Apr 2024 08:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzBv8-0004na-PI; Tue, 23 Apr 2024 08:54:34 +0000
Received: by outflank-mailman (input) for mailman id 710440;
 Tue, 23 Apr 2024 08:54:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKuO=L4=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1rzBv7-0004kK-F3
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 08:54:33 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1925f680-014f-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 10:54:32 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 76ED42F58C;
 Tue, 23 Apr 2024 04:54:30 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 6F3552F58B;
 Tue, 23 Apr 2024 04:54:30 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id E65F52F588;
 Tue, 23 Apr 2024 04:54:26 -0400 (EDT)
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
X-Inumbo-ID: 1925f680-014f-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=qBdCaQo8xXPRL9koiygD4Doyw
	FZCckSSqeafkQGDihU=; b=WCbm9Gvv8A5FY/iF7cCg5LLERujQJjvAcQ7N4+Dt3
	vqIta6Fh56FnKa8UtNPKzhLjZANpOdRqMvbn+C8YgYVkN6UpTLWfPuth1CEP8kvn
	trXWAn04JfsQlWO2FNsN3Mo7QvrUcAaTe+xQgo6yojDA4nh0UfMpP8+nOcsw2X8n
	pc=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 4/7] x86/MCE: guard lmce_support/cmci_support
Date: Tue, 23 Apr 2024 11:54:23 +0300
Message-Id: <d5fa50b3056b96f3046be39ed682a8b347f1b425.1713860310.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 16E01ED6-014F-11EF-9FC5-F515D2CDFF5E-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

Guard access to Intel-specific lmce_support & cmci_support variables in
common MCE/VMCE code. These are set in Intel-specific parts of mcheck cod=
e
and can potentially be skipped if building for non-intel platform by
disabling CONFIG_INTEL option.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/cpu/mcheck/mce.c  | 4 ++--
 xen/arch/x86/cpu/mcheck/vmce.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.=
c
index 2844685983..72dfaf28cb 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -611,7 +611,7 @@ static void set_poll_bankmask(struct cpuinfo_x86 *c)
     mb =3D per_cpu(poll_bankmask, cpu);
     BUG_ON(!mb);
=20
-    if ( cmci_support && opt_mce )
+    if ( IS_ENABLED(CONFIG_INTEL) && cmci_support && opt_mce )
     {
         const struct mca_banks *cmci =3D per_cpu(no_cmci_banks, cpu);
=20
@@ -1607,7 +1607,7 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_=
mc)
             break;
=20
         case XEN_MC_INJECT_TYPE_LMCE:
-            if ( !lmce_support )
+            if ( IS_ENABLED(CONFIG_INTEL) && !lmce_support )
             {
                 ret =3D x86_mcerr("No LMCE support", -EINVAL);
                 break;
diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmc=
e.c
index be229684a4..6051ab2b2e 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -546,7 +546,7 @@ int vmce_enable_mca_cap(struct domain *d, uint64_t ca=
p)
=20
     if ( cap & XEN_HVM_MCA_CAP_LMCE )
     {
-        if ( !lmce_support )
+        if ( IS_ENABLED(CONFIG_INTEL) && !lmce_support )
             return -EINVAL;
         for_each_vcpu(d, v)
             v->arch.vmce.mcg_cap |=3D MCG_LMCE_P;
--=20
2.25.1



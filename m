Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHTdJLn+6Gl5SgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 19:00:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF6344916B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 19:00:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290937.1570362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFavZ-0001JH-Dx; Wed, 22 Apr 2026 16:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290937.1570362; Wed, 22 Apr 2026 16:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFavZ-0001Go-B5; Wed, 22 Apr 2026 16:59:53 +0000
Received: by outflank-mailman (input) for mailman id 1290937;
 Wed, 22 Apr 2026 16:59:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db6223737000f373@swg.vates.tech>)
 id 1wFavX-0001Gi-Cx
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 16:59:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFavW-001Hpq-Pz
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 18:59:50 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db6223737000f373@swg.vates.tech>)
 id 69e8fe7d-2eae-0a2a0a5409dd-0a2a4502a690-16
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 18:59:50 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db6223737000f373@swg.vates.tech>)
 id 69e8fe86-af86-0a2a45020019-b9ff1c22b50b-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 18:59:50 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19db6223737000f373.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 22 Apr 2026 16:59:48 +0000
Received: from localhost.localdomain (88-175-170-134.subs.proxad.net
 [88.175.170.134]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2E0A9812CF;
 Wed, 22 Apr 2026 18:59:48 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=RYW9LEhTjgrrty/Kgi/iBI7ELi7kv90yjoE0T2nBmwo=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=NvhoYzIQDvS9yJ0ocD/Jm33hoy5MMidIdf9ggu2ulh3p3I766Uno3mz7EM3n1irVF42zijL1g
 sMX+VD3QgrZwLTlAu2BscANFN3LAXulY27nu08DMnwEB0+DDEkSanVhhyJ//JqdqMd/ygIoLlFQ
 WqaO9YfYii9yXwPXGohFV6Oq2q9f5uqbnyqKmUYnrM5gr06bMpvyOLF7AXmHzIGbpQ6w1JZ3vDQ
 c8rR1tvVeWJZZ3sAbMdsGCXiX9q9FEvqCdyOQhq9DJ0USPwtezWRIlzCbRBo75IDsmiUNpmG/3Q
 plDhd/OdX1yGxTUdQ8so1gSHEDuyOCCvjOBYaFM+gWlQ==
X-Zone-Loop: 1cf038f0cfac31ff9d52a162034aab7002f8486a3398
x-campaign-type: default
x-transaction-id: 923cbf1c-426c-489d-9b5d-9383b5133609
x-swg-uid: 01-8f7c7fb4-76b1-4cac-a66e-d138f73c7fcb
X-Mailer: Sweego
Message-ID:
 <1776877188.8631fc262581453bbf619ec5b2062170.19db6223737000f373@vates.tech>
x-swg-bid: 1776877188.8631fc262581453bbf619ec5b2062170.19db6223737000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] x86/amd: Drop allow_unsafe parameter, tune down XSA-9 mitigations
Date: Wed, 22 Apr 2026 18:58:06 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.25f9.4f43d121d0e65c6c.19db6223500.165d7aa55d327c7c=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776877188352
X-purgate-ID: tlsNG-720697/1776877190-80B78161-84CD3524/0/0
X-purgate-type: clean
X-purgate-size: 5218
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MAILSPIKE_FAIL(0.00)[192.237.175.120:query timed out];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0BF6344916B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.25f9.4f43d121d0e65c6c.19db6223500.165d7aa55d327c7c=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

XSA-9 mitigations prevents Xen from properly running if a affected CPU
is detected=2E While the vulnerability has no mitigations (aside not runni=
ng
64-bits PV guests), it's only outcome is a DoS=2E

There is no real point in preventing Xen from working here and it would
be preferable to just log the vulnerability to the user so it can act
appropriately=2E

Also reword the errata message regarding that it only affects PV64 guests=
=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
It's hard to tell whether or not we would want to drop allow_unsafe, but
currently, Xen is allowed to boot with XSA-304 mitigations disabled
(intentionnaly) which has a similar outcome than this one=2E

From a user standpoint, preventing the system to boot or starting guests i=
s
too extreme and would be in practice seen as a bug, even if it's justified
policy which can be overriden=2E

 docs/misc/xen-command-line=2Epandoc | 12 ------------
 xen/arch/x86/cpu/amd=2Ec            | 21 +++++----------------
 xen/arch/x86/domain=2Ec             | 14 --------------
 xen/arch/x86/include/asm/amd=2Eh    |  2 --
 4 files changed, 5 insertions(+), 44 deletions(-)

diff --git a/docs/misc/xen-command-line=2Epandoc b/docs/misc/xen-command-l=
ine=2Epandoc
index 6c77129732=2E=2E04d206f919 100644
--- a/docs/misc/xen-command-line=2Epandoc
+++ b/docs/misc/xen-command-line=2Epandoc
@@ -133,18 +133,6 @@ resume=2E
 `s3_mode` instructs Xen to set up the boot time (option `vga=3D`) video
 mode during S3 resume=2E
=20
-### allow_unsafe (x86)
-> `=3D <boolean>`
-
-> Default: `false`
-
-Force boot on potentially unsafe systems=2E By default Xen will refuse
-to boot on systems with the following errata:
-
-* AMD Erratum 121=2E Processors with this erratum are subject to a guest
-  triggerable Denial of Service=2E Override only if you trust all of
-  your PV guests=2E
-
 ### altp2m (Intel)
 > `=3D <boolean>`
=20
diff --git a/xen/arch/x86/cpu/amd=2Ec b/xen/arch/x86/cpu/amd=2Ec
index 712734a6e7=2E=2Ef1f4a25754 100644
--- a/xen/arch/x86/cpu/amd=2Ec
+++ b/xen/arch/x86/cpu/amd=2Ec
@@ -20,10 +20,6 @@
=20
 #include "cpu=2Eh"
=20
-/* 1 =3D allow, 0 =3D don't allow guest creation, -1 =3D don't allow boot=
 */
-int8_t __read_mostly opt_allow_unsafe;
-boolean_param("allow_unsafe", opt_allow_unsafe);
-
 /* Signal whether the ACPI C1E quirk is required=2E */
 bool __read_mostly amd_acpi_c1e_quirk;
 bool __ro_after_init amd_legacy_ssbd;
@@ -1205,19 +1201,12 @@ static void cf_check init_amd(struct cpuinfo_x86 *=
c)
 	if (c->family =3D=3D 0x10)
 		__clear_bit(X86_FEATURE_MONITOR, c->x86_capability);
=20
-	if (!cpu_has_amd_erratum(c, AMD_ERRATUM_121))
-		opt_allow_unsafe =3D 1;
-	else if (opt_allow_unsafe < 0)
-		panic("Xen will not boot on this CPU for security reasons"
-		      "Pass \"allow_unsafe\" if you're trusting all your"
-		      " (PV) guest kernels=2E\n");
-	else if (!opt_allow_unsafe && c =3D=3D &boot_cpu_data)
+	if (cpu_has_amd_erratum(c, AMD_ERRATUM_121))
+	{
 		printk(KERN_WARNING
-		       "*** Xen will not allow creation of DomU-s on"
-		       " this CPU for security reasons=2E ***\n"
-		       KERN_WARNING
-		       "*** Pass \"allow_unsafe\" if you're trusting"
-		       " all your (PV) guest kernels=2E ***\n");
+			   "*** This CPU is affected with erratum 121"
+			   " 64-bits PV guests are able to cause a DoS (XSA-9) ***\n");
+	}
=20
 	if (c->family =3D=3D 0x16 && c->model <=3D 0xf) {
 		if (c =3D=3D &boot_cpu_data) {
diff --git a/xen/arch/x86/domain=2Ec b/xen/arch/x86/domain=2Ec
index 1d458f1372=2E=2E1d3b99cd50 100644
--- a/xen/arch/x86/domain=2Ec
+++ b/xen/arch/x86/domain=2Ec
@@ -833,20 +833,6 @@ int arch_domain_create(struct domain *d,
=20
     spin_lock_init(&d->arch=2Ee820_lock);
=20
-    if ( d->domain_id && cpu_has_amd_erratum(&boot_cpu_data, AMD_ERRATUM_=
121) )
-    {
-        if ( !opt_allow_unsafe )
-        {
-            printk(XENLOG_G_ERR
-                   "%pd: will not create domU on this CPU for security re=
asons\n",
-                   d);
-            return -EPERM;
-        }
-        printk(XENLOG_G_WARNING
-               "%pd: may compromise security on this CPU\n",
-               d);
-    }
-
     emflags =3D config->arch=2Eemulation_flags;
=20
     if ( is_hardware_domain(d) && is_pv_domain(d) )
diff --git a/xen/arch/x86/include/asm/amd=2Eh b/xen/arch/x86/include/asm/a=
md=2Eh
index d21df0741a=2E=2Ed8d9cd175e 100644
--- a/xen/arch/x86/include/asm/amd=2Eh
+++ b/xen/arch/x86/include/asm/amd=2Eh
@@ -74,8 +74,6 @@
 struct cpuinfo_x86;
 int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, =2E=
=2E=2E);
=20
-extern int8_t opt_allow_unsafe;
-
 void fam10h_check_enable_mmcfg(void);
 void check_enable_amd_mmconf_dmi(void);
=20
--=20
2=2E52=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.25f9.4f43d121d0e65c6c.19db6223500.165d7aa55d327c7c=---


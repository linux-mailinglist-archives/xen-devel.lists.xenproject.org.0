Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PG5INguC2qZEQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 17:23:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B6756FD92
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 17:23:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312036.1582239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOznz-0003aO-MD; Mon, 18 May 2026 15:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312036.1582239; Mon, 18 May 2026 15:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOznz-0003Y4-JB; Mon, 18 May 2026 15:22:55 +0000
Received: by outflank-mailman (input) for mailman id 1312036;
 Mon, 18 May 2026 15:22:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e3baeac47000f373@swg.vates.tech>)
 id 1wOznx-0003Uv-Lg
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 15:22:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOznx-00AUlP-25
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 17:22:53 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e3baeac47000f373@swg.vates.tech>)
 id 6a0b2ec3-2eae-0a2a0a5409dd-0a2a4509caf4-24
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:22:53 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e3baeac47000f373@swg.vates.tech>)
 id 6a0b2ec2-2497-0a2a45090019-b9ff1c229311-7
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:22:52 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e3baeac47000f373.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 18 May 2026 15:22:43 +0000
Received: from localhost.localdomain (88-175-170-134.subs.proxad.net
 [88.175.170.134]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id E8FF98109B;
 Mon, 18 May 2026 17:22:42 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=lCuB8OipHgX7QjdQDTipGB47RFvpJl4Bz4q0RfmxJBs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=hd9rHajzEWY8wNJdy32McJlSpsmZH1RhuUBwriwGo8dXVbzUxDs+3/VrwtNxSaN63Lj8HRQjd
 QXxoLePCqjCMEJc+qXL4mEZbB60ZAweyHu5x0ZEBCfWGUvnfW1S6BswrfFO6i/2Rk91npC5HDgr
 y+HcXqw1/uW4OGkcXVdwMNHj2Qjr+ikJGKcx+NuJEuAySuMnJxoh/rkEVC8vbFzt6lfO5IbRvOi
 St/gN7WEqpl5dxjY4BhQYIAf9GOqDvuciO3/D2qn2pWaHxXlzV2lWONGkPgRNH2WD5mHntmhGEA
 +SB6y5zOUkm4nLovGyb09ZJV5bovDbSIlogrhlEGw72w==
X-Zone-Loop: 8591f7294167705024c8cd2dfe97522cd371b033b7a3
x-campaign-type: default
x-transaction-id: 834ff78e-68be-46b5-b992-e9341c612e6d
x-swg-uid: 01-57342fb2-2da4-44a0-a703-05dace5f91f6
X-Mailer: Sweego
Message-ID:
 <1779117763.8631fc262581453bbf619ec5b2062170.19e3baeac47000f373@vates.tech>
x-swg-bid: 1779117763.8631fc262581453bbf619ec5b2062170.19e3baeac47000f373
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH 4/5] pci: Parse into pci_sbdf_t directly
Date: Mon, 18 May 2026 17:21:28 +0200
In-Reply-To: <cover.1779116255.git.teddy.astie@vates.tech>
References: <cover.1779116255.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.e13.6ca638ed955f5b82.19e3baeaa36.1a70f84ed571b8b4=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779117763126
X-purgate-ID: tlsNG-bad1c0/1779117773-40B60A53-503FCAF6/0/0
X-purgate-type: clean
X-purgate-size: 9094
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[3];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,vates.tech:url,vates.tech:email,vates.tech:mid,vates.tech:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F1B6756FD92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.e13.6ca638ed955f5b82.19e3baeaa36.1a70f84ed571b8b4=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Use the newly introduced parse_pci_sbdf() and parse_pci_sbdf_seg() in order
to parse into a pci_sbdf_t directly instead of reconstructing it afterward=
=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/char/ns16550=2Ec               | 24 +++++++++++-----------
 xen/drivers/char/xhci-dbc=2Ec              |  6 +++---
 xen/drivers/passthrough/amd/iommu_acpi=2Ec | 26 ++++++++++++------------
 xen/drivers/passthrough/vtd/dmar=2Ec       |  7 +++----
 4 files changed, 31 insertions(+), 32 deletions(-)

diff --git a/xen/drivers/char/ns16550=2Ec b/xen/drivers/char/ns16550=2Ec
index 878da27f2e=2E=2Efa2d0e5991 100644
--- a/xen/drivers/char/ns16550=2Ec
+++ b/xen/drivers/char/ns16550=2Ec
@@ -1572,22 +1572,22 @@ static bool __init parse_positional(struct ns16550=
 *uart, char **str)
 #ifdef CONFIG_HAS_PCI
     if ( *conf =3D=3D ',' && *++conf !=3D ',' )
     {
-        unsigned int b, d, f;
+        pci_sbdf_t sbdf;
=20
-        conf =3D parse_pci(conf, NULL, &b, &d, &f);
+        conf =3D parse_pci_sbdf(conf, &sbdf);
         if ( !conf )
             PARSE_ERR_RET("Bad port PCI coordinates");
-        uart->pci_device =3D PCI_SBDF(0, b, d, f);
+        uart->pci_device =3D sbdf;
         uart->ps_bdf_enable =3D true;
     }
=20
     if ( *conf =3D=3D ',' && *++conf !=3D ',' )
     {
-        unsigned int b, d, f;
+        pci_sbdf_t sbdf;
=20
-        if ( !parse_pci(conf, NULL, &b, &d, &f) )
+        if ( !parse_pci_sbdf(conf, &sbdf) )
             PARSE_ERR_RET("Bad bridge PCI coordinates");
-        uart->pci_bridge =3D PCI_SBDF(0, b, d, f);
+        uart->pci_bridge =3D sbdf;
         uart->pb_bdf_enable =3D true;
     }
 #endif
@@ -1671,22 +1671,22 @@ static bool __init parse_namevalue_pairs(char *str=
, struct ns16550 *uart)
=20
         case port_bdf:
         {
-            unsigned int b, d, f;
+            pci_sbdf_t sbdf;
=20
-            if ( !parse_pci(param_value, NULL, &b, &d, &f) )
+            if ( !parse_pci_sbdf(param_value, &sbdf) )
                 PARSE_ERR_RET("Bad port PCI coordinates\n");
-            uart->pci_device =3D PCI_SBDF(0, b, d, f);
+            uart->pci_device =3D sbdf;
             uart->ps_bdf_enable =3D true;
             break;
         }
=20
         case bridge_bdf:
         {
-            unsigned int b, d, f;
+            pci_sbdf_t sbdf;
=20
-            if ( !parse_pci(param_value, NULL, &b, &d, &f) )
+            if ( !parse_pci_sbdf(param_value, &sbdf) )
                 PARSE_ERR_RET("Bad bridge PCI coordinates\n");
-            uart->pci_bridge =3D PCI_SBDF(0, b, d, f);
+            uart->pci_bridge =3D sbdf;
             uart->pb_bdf_enable =3D true;
             break;
         }
diff --git a/xen/drivers/char/xhci-dbc=2Ec b/xen/drivers/char/xhci-dbc=2Ec
index c1ff528de6=2E=2Ec7fd554be0 100644
--- a/xen/drivers/char/xhci-dbc=2Ec
+++ b/xen/drivers/char/xhci-dbc=2Ec
@@ -1357,9 +1357,9 @@ static int __init cf_check xhci_parse_dbgp(const cha=
r *opt_dbgp)
     }
     else if ( strncmp(opt_dbgp + 4, "@pci", 4) =3D=3D 0 )
     {
-        unsigned int bus, slot, func;
+        pci_sbdf_t sbdf;
=20
-        e =3D parse_pci(opt_dbgp + 8, NULL, &bus, &slot, &func);
+        e =3D parse_pci_sbdf(opt_dbgp + 8, &sbdf);
         if ( !e || (*e && *e !=3D ',') )
         {
             printk(XENLOG_ERR
@@ -1368,7 +1368,7 @@ static int __init cf_check xhci_parse_dbgp(const cha=
r *opt_dbgp)
             return -EINVAL;
         }
=20
-        dbc->sbdf =3D PCI_SBDF(0, bus, slot, func);
+        dbc->sbdf =3D sbdf;
     }
     opt =3D e;
=20
diff --git a/xen/drivers/passthrough/amd/iommu_acpi=2Ec b/xen/drivers/pass=
through/amd/iommu_acpi=2Ec
index 39ae637959=2E=2E7b40da33ae 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi=2Ec
+++ b/xen/drivers/passthrough/amd/iommu_acpi=2Ec
@@ -682,8 +682,8 @@ static int __init cf_check parse_ivrs_ioapic(const cha=
r *str)
 {
     const char *s =3D str;
     unsigned long id;
-    unsigned int seg, bus, dev, func;
     unsigned int idx;
+    pci_sbdf_t sbdf;
=20
     if ( *s !=3D '[' )
         return -EINVAL;
@@ -692,7 +692,7 @@ static int __init cf_check parse_ivrs_ioapic(const cha=
r *str)
     if ( *s !=3D ']' || *++s !=3D '=3D' )
         return -EINVAL;
=20
-    s =3D parse_pci(s + 1, &seg, &bus, &dev, &func);
+    s =3D parse_pci_sbdf(s + 1, &sbdf);
     if ( !s || *s )
         return -EINVAL;
=20
@@ -707,7 +707,7 @@ static int __init cf_check parse_ivrs_ioapic(const cha=
r *str)
         }
     }
=20
-    ioapic_sbdf[idx]=2Esbdf =3D PCI_SBDF(seg, bus, dev, func);
+    ioapic_sbdf[idx]=2Esbdf =3D sbdf;
     ioapic_sbdf[idx]=2Eid =3D id;
     ioapic_sbdf[idx]=2Ecmdline =3D true;
=20
@@ -719,7 +719,7 @@ static int __init cf_check parse_ivrs_hpet(const char =
*str)
 {
     const char *s =3D str;
     unsigned long id;
-    unsigned int seg, bus, dev, func;
+    pci_sbdf_t sbdf;
=20
     if ( *s !=3D '[' )
         return -EINVAL;
@@ -728,12 +728,12 @@ static int __init cf_check parse_ivrs_hpet(const cha=
r *str)
     if ( id !=3D (typeof(hpet_sbdf=2Eid))id || *s !=3D ']' || *++s !=3D '=
=3D' )
         return -EINVAL;
=20
-    s =3D parse_pci(s + 1, &seg, &bus, &dev, &func);
+    s =3D parse_pci_sbdf(s + 1, &sbdf);
     if ( !s || *s )
         return -EINVAL;
=20
     hpet_sbdf=2Eid =3D id;
-    hpet_sbdf=2Esbdf =3D PCI_SBDF(seg, bus, dev, func);
+    hpet_sbdf=2Esbdf =3D sbdf;
     hpet_sbdf=2Einit =3D HPET_CMDL;
=20
     return 0;
@@ -1399,13 +1399,13 @@ static int __init cf_check parse_ivmd_param(const =
char *s)
         }
=20
         do {
-            unsigned int seg, bus, dev, func;
+            pci_sbdf_t sbdf;
=20
             if ( nr_ivmd >=3D ARRAY_SIZE(user_ivmds) )
                 return -E2BIG;
=20
-            s =3D parse_pci(s + 1, &seg, &bus, &dev, &func);
-            if ( !s || seg )
+            s =3D parse_pci_sbdf(s + 1, &sbdf);
+            if ( !s || sbdf=2Eseg )
                 return -EINVAL;
=20
             user_ivmds[nr_ivmd]=2Estart_address =3D start << PAGE_SHIFT;
@@ -1413,16 +1413,16 @@ static int __init cf_check parse_ivmd_param(const =
char *s)
             user_ivmds[nr_ivmd]=2Eheader=2Eflags =3D ACPI_IVMD_UNITY |
                                                ACPI_IVMD_READ | ACPI_IVMD=
_WRITE;
             user_ivmds[nr_ivmd]=2Eheader=2Elength =3D sizeof(*user_ivmds)=
;
-            user_ivmds[nr_ivmd]=2Eheader=2Edevice_id =3D PCI_BDF(bus, dev=
, func);
+            user_ivmds[nr_ivmd]=2Eheader=2Edevice_id =3D sbdf=2Ebdf;
             user_ivmds[nr_ivmd]=2Eheader=2Etype =3D ACPI_IVRS_TYPE_MEMORY=
_ONE;
=20
             if ( *s =3D=3D '-' )
             {
-                s =3D parse_pci(s + 1, &seg, &bus, &dev, &func);
-                if ( !s || seg )
+                s =3D parse_pci_sbdf(s + 1, &sbdf);
+                if ( !s || sbdf=2Eseg )
                     return -EINVAL;
=20
-                user_ivmds[nr_ivmd]=2Eaux_data =3D PCI_BDF(bus, dev, func=
);
+                user_ivmds[nr_ivmd]=2Eaux_data =3D sbdf=2Ebdf;
                 if ( user_ivmds[nr_ivmd]=2Eaux_data <
                      user_ivmds[nr_ivmd]=2Eheader=2Edevice_id )
                     return -EINVAL;
diff --git a/xen/drivers/passthrough/vtd/dmar=2Ec b/xen/drivers/passthroug=
h/vtd/dmar=2Ec
index 9f9b639eba=2E=2Edafe1b62f6 100644
--- a/xen/drivers/passthrough/vtd/dmar=2Ec
+++ b/xen/drivers/passthrough/vtd/dmar=2Ec
@@ -1215,7 +1215,7 @@ static int __init cf_check parse_rmrr_param(const ch=
ar *str)
         do {
             bool def_seg =3D false;
=20
-            stmp =3D parse_pci_seg(s + 1, &seg, &bus, &dev, &func, &def_s=
eg);
+            stmp =3D parse_pci_sbdf_seg(s + 1, &sbdf, &def_seg);
             if ( !stmp )
                 return -EINVAL;
=20
@@ -1224,12 +1224,11 @@ static int __init cf_check parse_rmrr_param(const =
char *str)
              * Segment will be replaced with one from first device=2E
              */
             if ( user_rmrrs[nr_rmrr]=2Edev_count && def_seg )
-                seg =3D PCI_SEG(user_rmrrs[nr_rmrr]=2Esbdf[0]);
+                sbdf=2Eseg =3D PCI_SEG(user_rmrrs[nr_rmrr]=2Esbdf[0]);
=20
             /* Keep sbdf's even if they differ and later report an error=
=2E */
             dev_count =3D user_rmrrs[nr_rmrr]=2Edev_count;
-            user_rmrrs[nr_rmrr]=2Esbdf[dev_count] =3D
-               PCI_SBDF(seg, bus, dev, func)=2Esbdf;
+            user_rmrrs[nr_rmrr]=2Esbdf[dev_count] =3D sbdf=2Esbdf;
=20
             user_rmrrs[nr_rmrr]=2Edev_count++;
             s =3D stmp;
--=20
2=2E52=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.e13.6ca638ed955f5b82.19e3baeaa36.1a70f84ed571b8b4=---


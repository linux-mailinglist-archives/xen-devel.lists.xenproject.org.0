Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tW2cODyqQmqg/QkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 19:24:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2446DDAC0
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 19:24:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=setti3+W;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1347847.1605791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFiH-0004NL-Op; Mon, 29 Jun 2026 17:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347847.1605791; Mon, 29 Jun 2026 17:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFiH-000471-5f; Mon, 29 Jun 2026 17:24:05 +0000
Received: by outflank-mailman (input) for mailman id 1347847;
 Mon, 29 Jun 2026 17:24:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f146888c6000701b@swg.vates.tech>)
 id 1weFiE-0003iY-2S
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 17:24:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weFiD-00FsZ2-FP
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 19:24:01 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f146888c6000701b@swg.vates.tech>)
 id 6a42aa23-bab6-0a2a0a5309dd-0a2a450be43e-38
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:24:01 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f146888c6000701b@swg.vates.tech>)
 id 6a42aa19-ac48-0a2a450b0019-b9ff1c128383-18
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:24:01 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f146888c6000701b.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Jun 2026 17:23:42 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2EA1886C08;
 Mon, 29 Jun 2026 19:23:42 +0200 (CEST)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=C6FoQP7JPFJ5YwpsfKGgqEF4qWqkVbWYYhCfGvEuQzk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=setti3+WmYUAuYuF8VmBkS/xhoAJXSieDeqj6vlJSsT6kD0ZilOC/1LjLBawxEDTAH0mZot0z
 Rb9bTFTi9yIUAUGe9CT2ywL1EF09iAl/eM/1xJW6TjArmZ1SwsXrPwKt3jjZNpSyi/YqQ162lfy
 tL9eq7d/tCsTe38V3rUlkGrV95he2LP1AIQefZnu2r7MHEuSUjf2SZpciLGMYF5leEtCLPZYInC
 dP3RS28QP5dRG8bMWH/fchnZWfyMgJJR7b2kROnaOnbmzYSC1mfRGH1FPtZRDBU4e8g59VscrZT
 j9KMYstqDHnK63VyW3FTPRDolPt/1e24ZFy0FJzx+eWA==
X-Zone-Loop: 1fb335777378465615b5b13571835d9facc69fdab008
x-campaign-type: default
x-transaction-id: c8c3b4bc-cf53-4247-9fed-ba1bf54bb5a3
x-swg-uid: 01-23cc33cc-589d-49e9-890c-38cec61e8746
X-Mailer: Sweego
Message-ID:
 <1782753822.8631fc262581453bbf619ec5b2062170.19f146888c6000701b@vates.tech>
x-swg-bid: 1782753822.8631fc262581453bbf619ec5b2062170.19f146888c6000701b
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
Subject: [PATCH v3 16/18] ehci-dbgp: Use pci_sbdf_t instead of (bus, slot, func)
Date: Mon, 29 Jun 2026 19:21:34 +0200
In-Reply-To: <cover.1782747421.git.teddy.astie@vates.tech>
References: <cover.1782747421.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.81b.5dc909e9297b842f.19f146886b9.6014b7ba1b508f74=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782753822394
X-purgate-ID: tlsNG-42698a/1782753841-A5B20220-7DF02396/0/0
X-purgate-type: clean
X-purgate-size: 11773
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F2446DDAC0

---=Part.81b.5dc909e9297b842f.19f146886b9.6014b7ba1b508f74=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

We also take the opportunity to allow the device to exist outside
of segment 0 (only when specified with pci@ syntax), since it's
not hardcoded anymore=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/char/ehci-dbgp=2Ec | 100 +++++++++++++----------------------
 1 file changed, 37 insertions(+), 63 deletions(-)

diff --git a/xen/drivers/char/ehci-dbgp=2Ec b/xen/drivers/char/ehci-dbgp=
=2Ec
index ab1e3c6de4=2E=2E01586bc5b3 100644
--- a/xen/drivers/char/ehci-dbgp=2Ec
+++ b/xen/drivers/char/ehci-dbgp=2Ec
@@ -334,8 +334,9 @@ struct ehci_dbgp {
     unsigned long timeout;
     struct timer timer;
     spinlock_t *lock;
+    pci_sbdf_t sbdf;
     bool reset_run;
-    u8 bus, slot, func, bar;
+    u8 bar;
     u16 pci_cr;
     u32 bar_val;
     unsigned int cap;
@@ -681,16 +682,14 @@ static int dbgp_control_msg(struct ehci_dbgp *dbgp, =
unsigned int devnum,
     return ret;
 }
=20
-static unsigned int __init __find_dbgp(u8 bus, u8 slot, u8 func)
+static unsigned int __init __find_dbgp(pci_sbdf_t sbdf)
 {
-    uint32_t class =3D pci_conf_read32(PCI_SBDF(0, bus, slot, func),
-                                     PCI_CLASS_REVISION);
+    uint32_t class =3D pci_conf_read32(sbdf, PCI_CLASS_REVISION);
=20
     if ( (class >> 8) !=3D PCI_CLASS_SERIAL_USB_EHCI )
         return 0;
=20
-    return pci_find_cap_offset(PCI_SBDF(0, bus, slot, func),
-                               PCI_CAP_ID_EHCI_DEBUG);
+    return pci_find_cap_offset(sbdf, PCI_CAP_ID_EHCI_DEBUG);
 }
=20
 static unsigned int __init find_dbgp(struct ehci_dbgp *dbgp,
@@ -704,27 +703,25 @@ static unsigned int __init find_dbgp(struct ehci_dbg=
p *dbgp,
         {
             for ( func =3D 0; func < 8; func++ )
             {
+                pci_sbdf_t sbdf =3D PCI_SBDF(0, bus, slot, func);
                 unsigned int cap;
=20
-                if ( !pci_device_detect(PCI_SBDF(0, bus, slot, func)) )
+                if ( !pci_device_detect(sbdf) )
                 {
                     if ( !func )
                         break;
                     continue;
                 }
=20
-                cap =3D __find_dbgp(bus, slot, func);
+                cap =3D __find_dbgp(sbdf);
                 if ( !cap || ehci_num-- )
                 {
-                    if ( !func && !(pci_conf_read8(PCI_SBDF(0, bus, slot,=
 func),
-                                                   PCI_HEADER_TYPE) & 0x8=
0) )
+                    if ( !func && !(pci_conf_read8(sbdf, PCI_HEADER_TYPE)=
 & 0x80) )
                         break;
                     continue;
                 }
=20
-                dbgp->bus =3D bus;
-                dbgp->slot =3D slot;
-                dbgp->func =3D func;
+                dbgp->sbdf =3D sbdf;
                 return cap;
             }
         }
@@ -1011,20 +1008,17 @@ static set_debug_port_t __read_mostly set_debug_po=
rt =3D default_set_debug_port;
 static void cf_check nvidia_set_debug_port(
     struct ehci_dbgp *dbgp, unsigned int port)
 {
-    uint32_t dword =3D pci_conf_read32(PCI_SBDF(0, dbgp->bus, dbgp->slot,
-                                              dbgp->func), 0x74);
+    uint32_t dword =3D pci_conf_read32(dbgp->sbdf, 0x74);
=20
     dword &=3D ~(0x0f << 12);
     dword |=3D (port & 0x0f) << 12;
-    pci_conf_write32(PCI_SBDF(0, dbgp->bus, dbgp->slot, dbgp->func), 0x74=
,
-                     dword);
+    pci_conf_write32(dbgp->sbdf, 0x74, dword);
     dbgp_printk("set debug port to %u\n", port);
 }
=20
 static void __init detect_set_debug_port(struct ehci_dbgp *dbgp)
 {
-    if ( pci_conf_read16(PCI_SBDF(0, dbgp->bus, dbgp->slot, dbgp->func),
-                         PCI_VENDOR_ID) =3D=3D 0x10de )
+    if ( pci_conf_read16(dbgp->sbdf, PCI_VENDOR_ID) =3D=3D 0x10de )
     {
         dbgp_printk("using nvidia set_debug_port\n");
         set_debug_port =3D nvidia_set_debug_port;
@@ -1046,15 +1040,13 @@ static void ehci_dbgp_bios_handoff(struct ehci_dbg=
p *dbgp, u32 hcc_params)
     if ( !offset )
         return;
=20
-    cap =3D pci_conf_read32(PCI_SBDF(0, dbgp->bus, dbgp->slot, dbgp->func=
),
-                          offset);
+    cap =3D pci_conf_read32(dbgp->sbdf, offset);
     dbgp_printk("dbgp: EHCI BIOS state %08x\n", cap);
=20
     if ( (cap & 0xff) =3D=3D 1 && (cap & EHCI_USBLEGSUP_BIOS) )
     {
         dbgp_printk("dbgp: BIOS handoff\n");
-        pci_conf_write8(PCI_SBDF(0, dbgp->bus, dbgp->slot, dbgp->func),
-                        offset + 3, 1);
+        pci_conf_write8(dbgp->sbdf, offset + 3, 1);
     }
=20
     /* if boot firmware now owns EHCI, spin till it hands it over=2E */
@@ -1063,8 +1055,7 @@ static void ehci_dbgp_bios_handoff(struct ehci_dbgp =
*dbgp, u32 hcc_params)
     {
         mdelay(10);
         msec -=3D 10;
-        cap =3D pci_conf_read32(PCI_SBDF(0, dbgp->bus, dbgp->slot, dbgp->=
func),
-                              offset);
+        cap =3D pci_conf_read32(dbgp->sbdf, offset);
     }
=20
     if ( cap & EHCI_USBLEGSUP_BIOS )
@@ -1072,13 +1063,11 @@ static void ehci_dbgp_bios_handoff(struct ehci_dbg=
p *dbgp, u32 hcc_params)
         /* well, possibly buggy BIOS=2E=2E=2E try to shut it down,
          * and hope nothing goes too wrong */
         dbgp_printk("dbgp: BIOS handoff failed: %08x\n", cap);
-        pci_conf_write8(PCI_SBDF(0, dbgp->bus, dbgp->slot, dbgp->func),
-                        offset + 2, 0);
+        pci_conf_write8(dbgp->sbdf, offset + 2, 0);
     }
=20
     /* just in case, always disable EHCI SMIs */
-    pci_conf_write8(PCI_SBDF(0, dbgp->bus, dbgp->slot, dbgp->func),
-                    offset + EHCI_USBLEGCTLSTS, 0);
+    pci_conf_write8(dbgp->sbdf, offset + EHCI_USBLEGCTLSTS, 0);
 }
=20
 static int ehci_dbgp_setup(struct ehci_dbgp *dbgp)
@@ -1320,19 +1309,15 @@ static void __init cf_check ehci_dbgp_init_preirq(=
struct serial_port *port)
     u32 debug_port, offset;
     void __iomem *ehci_bar;
=20
-    debug_port =3D pci_conf_read32(PCI_SBDF(0, dbgp->bus, dbgp->slot, dbg=
p->func),
-                                 dbgp->cap);
+    debug_port =3D pci_conf_read32(dbgp->sbdf, dbgp->cap);
     offset =3D (debug_port >> 16) & 0xfff;
=20
     /* double check if the mem space is enabled */
-    dbgp->pci_cr =3D pci_conf_read8(PCI_SBDF(0, dbgp->bus, dbgp->slot,
-                                           dbgp->func),
-                                  PCI_COMMAND);
+    dbgp->pci_cr =3D pci_conf_read8(dbgp->sbdf, PCI_COMMAND);
     if ( !(dbgp->pci_cr & PCI_COMMAND_MEMORY) )
     {
         dbgp->pci_cr |=3D PCI_COMMAND_MEMORY;
-        pci_conf_write16(PCI_SBDF(0, dbgp->bus, dbgp->slot, dbgp->func),
-                         PCI_COMMAND, dbgp->pci_cr);
+        pci_conf_write16(dbgp->sbdf, PCI_COMMAND, dbgp->pci_cr);
         dbgp_printk("MMIO for EHCI enabled\n");
     }
=20
@@ -1376,7 +1361,7 @@ static void __init cf_check ehci_dbgp_init_postirq(s=
truct serial_port *port)
=20
     ehci_dbgp_setup_postirq(dbgp);
=20
-    pci_hide_device(PCI_SBDF(0, dbgp->bus, dbgp->slot, dbgp->func));
+    pci_hide_device(dbgp->sbdf);
 }
=20
 static int ehci_dbgp_check_release(struct ehci_dbgp *dbgp)
@@ -1397,8 +1382,7 @@ static int ehci_dbgp_check_release(struct ehci_dbgp =
*dbgp)
      * so as to allow for reuse of the USB device, which means it is time
      * to shutdown the USB debug port=2E
      */
-    printk(XENLOG_INFO "Releasing EHCI debug port at %02x:%02x=2E%u\n",
-           dbgp->bus, dbgp->slot, dbgp->func);
+    printk(XENLOG_INFO "Releasing EHCI debug port at %pp\n", &dbgp->sbdf)=
;
=20
     if ( dbgp->timer=2Efunction )
         kill_timer(&dbgp->timer);
@@ -1431,9 +1415,7 @@ static void cf_check ehci_dbgp_suspend(struct serial=
_port *port)
     stop_timer(&dbgp->timer);
     dbgp->timer=2Eexpires =3D 0;
=20
-    dbgp->pci_cr =3D pci_conf_read16(PCI_SBDF(0, dbgp->bus, dbgp->slot,
-                                            dbgp->func),
-                                   PCI_COMMAND);
+    dbgp->pci_cr =3D pci_conf_read16(dbgp->sbdf, PCI_COMMAND);
=20
     dbgp->state =3D dbgp_unsafe;
 }
@@ -1445,10 +1427,8 @@ static void cf_check ehci_dbgp_resume(struct serial=
_port *port)
     if ( !dbgp->ehci_debug )
         return;
=20
-    pci_conf_write32(PCI_SBDF(0, dbgp->bus, dbgp->slot, dbgp->func), dbgp=
->bar,
-                     dbgp->bar_val);
-    pci_conf_write16(PCI_SBDF(0, dbgp->bus, dbgp->slot, dbgp->func),
-                     PCI_COMMAND, dbgp->pci_cr);
+    pci_conf_write32(dbgp->sbdf, dbgp->bar, dbgp->bar_val);
+    pci_conf_write16(dbgp->sbdf, PCI_COMMAND, dbgp->pci_cr);
=20
     ehci_dbgp_setup_preirq(dbgp);
     ehci_dbgp_setup_postirq(dbgp);
@@ -1505,36 +1485,31 @@ void __init ehci_dbgp_init(void)
         if ( !dbgp->cap )
             return;
=20
-        dbgp_printk("Found EHCI debug port on %02x:%02x=2E%u\n",
-                    dbgp->bus, dbgp->slot, dbgp->func);
+        dbgp_printk("Found EHCI debug port on %pp\n", &dbgp->sbdf);
     }
     else if ( strncmp(opt_dbgp + 4, "@pci", 4) =3D=3D 0 )
     {
-        unsigned int bus, slot, func;
+        pci_sbdf_t sbdf;
=20
-        e =3D parse_pci(opt_dbgp + 8, NULL, &bus, &slot, &func);
+        e =3D parse_pci(opt_dbgp + 8, &sbdf);
         if ( !e || *e )
             return;
=20
-        dbgp->bus =3D bus;
-        dbgp->slot =3D slot;
-        dbgp->func =3D func;
+        dbgp->sbdf =3D sbdf;
=20
-        if ( !pci_device_detect(PCI_SBDF(0, bus, slot, func)) )
+        if ( !pci_device_detect(sbdf) )
             return;
=20
-        dbgp->cap =3D __find_dbgp(bus, slot, func);
+        dbgp->cap =3D __find_dbgp(sbdf);
         if ( !dbgp->cap )
             return;
=20
-        dbgp_printk("Using EHCI debug port on %02x:%02x=2E%u\n",
-                    bus, slot, func);
+        dbgp_printk("Using EHCI debug port on %pp\n", &sbdf);
     }
     else
         return;
=20
-    debug_port =3D pci_conf_read32(PCI_SBDF(0, dbgp->bus, dbgp->slot, dbg=
p->func),
-                                 dbgp->cap);
+    debug_port =3D pci_conf_read32(dbgp->sbdf, dbgp->cap);
     dbgp->bar =3D (debug_port >> 29) & 0x7;
     dbgp->bar =3D ((dbgp->bar - 1) * 4) + PCI_BASE_ADDRESS_0;
     offset =3D (debug_port >> 16) & 0xfff;
@@ -1545,8 +1520,7 @@ void __init ehci_dbgp_init(void)
         return;
     }
=20
-    dbgp->bar_val =3D bar_val =3D pci_conf_read32(PCI_SBDF(0, dbgp->bus, =
dbgp->slot,
-                                                       dbgp->func), dbgp-=
>bar);
+    dbgp->bar_val =3D bar_val =3D pci_conf_read32(dbgp->sbdf, dbgp->bar);
     dbgp_printk("bar_val: %08x\n", bar_val);
     if ( bar_val & ~PCI_BASE_ADDRESS_MEM_MASK )
     {
@@ -1573,8 +1547,8 @@ int dbgp_op(const struct physdev_dbgp_op *op)
     case PHYSDEVOP_DBGP_BUS_UNKNOWN:
         break;
     case PHYSDEVOP_DBGP_BUS_PCI:
-        if ( op->u=2Epci=2Eseg || ehci_dbgp=2Ebus !=3D op->u=2Epci=2Ebus =
||
-            PCI_DEVFN(ehci_dbgp=2Eslot, ehci_dbgp=2Efunc) !=3D op->u=2Epc=
i=2Edevfn )
+        if ( PCI_SBDF(op->u=2Epci=2Eseg, op->u=2Epci=2Ebus, op->u=2Epci=
=2Edevfn)=2Esbdf !=3D
+             ehci_dbgp=2Esbdf=2Esbdf )
     default:
             return 0;
         break;
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.81b.5dc909e9297b842f.19f146886b9.6014b7ba1b508f74=---


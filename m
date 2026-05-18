Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMjZJ90uC2plEQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 17:23:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB74456FDA0
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 17:23:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312038.1582249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOzo2-0003sV-5A; Mon, 18 May 2026 15:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312038.1582249; Mon, 18 May 2026 15:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOzo1-0003pM-TO; Mon, 18 May 2026 15:22:57 +0000
Received: by outflank-mailman (input) for mailman id 1312038;
 Mon, 18 May 2026 15:22:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e3baeb295000f373@swg.vates.tech>)
 id 1wOznz-0003aM-R1
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 15:22:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOznz-00AUlP-70
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 17:22:55 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e3baeb295000f373@swg.vates.tech>)
 id 6a0b2ec3-2eae-0a2a0a5409dd-0a2a4509caf4-30
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:22:55 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e3baeb295000f373@swg.vates.tech>)
 id 6a0b2ec2-2497-0a2a45090019-b9ff1c229311-8
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:22:55 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e3baeb295000f373.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 18 May 2026 15:22:45 +0000
Received: from localhost.localdomain (88-175-170-134.subs.proxad.net
 [88.175.170.134]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id A9B3E8109B;
 Mon, 18 May 2026 17:22:44 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=FjIJ0qn6YXT/MB4DavtiFr+GFFMvwouh5zyGyQ5hzYk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=fQkTP4aNqatXkzLmnlzYgfTSCHJRk+GW+qpb64hDtyf6yVhAhSo34c8qaVvHFqTywe1AhBq2y
 vMFYGoC1ly3m/4gOEOGA+s1nTbZG8diMzSczi5aPEPNgbQBBNGvYu0N5/t4T1WTKfOsbpS52VBb
 3zQFtMHxMCR+hnagoS/Kl/8DI/vfzF5p4079bs9qimW+nCPkvZxQ+mwhrqkDAb1pDQxCnGpHEf3
 weFLK0RHZ36ppLBAl+gFVhoUOGLyn3K02gl9hnvQN1cQlVytLcHwIiteByi8vhehtnpX98pXPhJ
 7+Z+tMETYoBOs4BtQ03qMrrCowysRdvNw0XZcX4SgVRw==
X-Zone-Loop: 991f01706a5dd5a03324978a5c43df3809a4e90e3850
x-campaign-type: default
x-transaction-id: 885ea2e3-dc9b-4a16-b479-8f55638b1b54
x-swg-uid: 01-4f558138-cff9-40f0-910f-f83b480e3e1c
X-Mailer: Sweego
Message-ID:
 <1779117765.8631fc262581453bbf619ec5b2062170.19e3baeb295000f373@vates.tech>
x-swg-bid: 1779117765.8631fc262581453bbf619ec5b2062170.19e3baeb295000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 5/5] RFC: pci: Migrate pci_mmcfg_{read,write} to pci.c
Date: Mon, 18 May 2026 17:21:29 +0200
In-Reply-To: <cover.1779116255.git.teddy.astie@vates.tech>
References: <cover.1779116255.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.e14.e5f1b60d69208c0d.19e3baeb0f7.8800be35dc06f22b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779117764855
X-purgate-ID: tlsNG-bad1c0/1779117775-88F71A53-7813A008/0/0
X-purgate-type: clean
X-purgate-size: 16473
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EB74456FDA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.e14.e5f1b60d69208c0d.19e3baeb0f7.8800be35dc06f22b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Key parts of MMCFG access bits are in mmconfig_64=2Ec (in particular
pci_mmcfg_{read,write}()) while PCI configuration primitives (used accross=
 the
codebase) are in pci=2Ec=2E
This leads to situations where the compiler cannot optimize the `switch (l=
en)`
for MMCFG access for all pci_conf_{read,write}N(), because they are not fr=
om
the same file=2E

Move the pci_mmcfg_{read,write} in pci=2Ec and hint the compiler to inline=
 these
functions such that it's more likely that the compiler eliminates the
`switch (len)``=2E

Also take the opportunity to migrate to pci_sbdf_t to reduce the parameter=
 count
and drop many parameter domains checks=2E

On GCC 16=2E1, this leads to codegen where pci_conf_{read,write}N() doesn'=
t call
pci_mmcfg_{read,write}() anymore and directly perform the MMIO RW=2E

<pci_conf_read32>:
       55                      push   %rbp
       48 89 e5                mov    %rsp,%rbp
       53                      push   %rbx
       89 f8                   mov    %edi,%eax
       89 f3                   mov    %esi,%ebx
       c1 ef 10                shr    $0x10,%edi
       81 fe ff 00 00 00       cmp    $0xff,%esi
       77 26                   ja     ffff82d040301fab <pci_conf_read32+0x=
3a>
       85 ff                   test   %edi,%edi
       75 22                   jne    ffff82d040301fab <pci_conf_read32+0x=
3a>
       0f b7 f8                movzwl %ax,%edi
       c1 e7 08                shl    $0x8,%edi
       83 e3 fc                and    $0xfffffffc,%ebx
       09 df                   or     %ebx,%edi
       81 cf 00 00 00 80       or     $0x80000000,%edi
       ba 04 00 00 00          mov    $0x4,%edx
       be 00 00 00 00          mov    $0x0,%esi
       e8 2a 1c 03 00          call   ffff82d040333bd3 <pci_conf_read>
       eb 22                   jmp    ffff82d040301fcd <pci_conf_read32+0x=
5c>
       81 fb ff 0f 00 00       cmp    $0xfff,%ebx
       77 24                   ja     ffff82d040301fd7 <pci_conf_read32+0x=
66>
       0f b6 d0                movzbl %al,%edx
       0f b6 f4                movzbl %ah,%esi
       0f b7 ff                movzwl %di,%edi
       e8 f5 fd ff ff          call   ffff82d040301db6 <pci_dev_base>
       48 85 c0                test   %rax,%rax
       74 18                   je     ffff82d040301fde <pci_conf_read32+0x=
6d>
       89 db                   mov    %ebx,%ebx
       48 01 d8                add    %rbx,%rax
       8b 00                   mov    (%rax),%eax
       48 8b 5d f8             mov    -0x8(%rbp),%rbx
       c9                      leave
       e9 89 12 f0 ff          jmp    ffff82d040203260 <__x86_return_thunk=
>
       b8 ff ff ff ff          mov    $0xffffffff,%eax
       eb ef                   jmp    ffff82d040301fcd <pci_conf_read32+0x=
5c>
       b8 ff ff ff ff          mov    $0xffffffff,%eax
       eb e8                   jmp    ffff82d040301fcd <pci_conf_read32+0x=
5c>

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/arch/x86/pv/ro-page-fault=2Ec   |   3 +-
 xen/arch/x86/x86_64/mmconfig=2Eh    |  43 -----------
 xen/arch/x86/x86_64/mmconfig_64=2Ec | 106 +++++---------------------
 xen/arch/x86/x86_64/pci=2Ec         | 122 ++++++++++++++++++++++++++++--
 xen/include/xen/pci=2Eh             |   6 +-
 5 files changed, 138 insertions(+), 142 deletions(-)

diff --git a/xen/arch/x86/pv/ro-page-fault=2Ec b/xen/arch/x86/pv/ro-page-f=
ault=2Ec
index d89306d34f=2E=2E647041560f 100644
--- a/xen/arch/x86/pv/ro-page-fault=2Ec
+++ b/xen/arch/x86/pv/ro-page-fault=2Ec
@@ -331,8 +331,7 @@ static int cf_check mmcfg_intercept_write(
     offset &=3D 0xfff;
     if ( pci_conf_write_intercept(mmio_ctxt->seg, mmio_ctxt->bdf,
                                   offset, bytes, p_data) >=3D 0 )
-        pci_mmcfg_write(mmio_ctxt->seg, PCI_BUS(mmio_ctxt->bdf),
-                        PCI_DEVFN(mmio_ctxt->bdf), offset, bytes,
+        pci_mmcfg_write(PCI_SBDF(mmio_ctxt->seg, mmio_ctxt->bdf), offset,=
 bytes,
                         *(uint32_t *)p_data);
=20
     return X86EMUL_OKAY;
diff --git a/xen/arch/x86/x86_64/mmconfig=2Eh b/xen/arch/x86/x86_64/mmconf=
ig=2Eh
index 27c0ae5cb1=2E=2Ec1786a3ceb 100644
--- a/xen/arch/x86/x86_64/mmconfig=2Eh
+++ b/xen/arch/x86/x86_64/mmconfig=2Eh
@@ -23,49 +23,6 @@
=20
 extern unsigned int pci_probe;
=20
-/*
- * AMD Fam10h CPUs are buggy, and cannot access MMIO config space
- * on their northbrige except through the * %eax register=2E As such, you=
 MUST
- * NOT use normal IOMEM accesses, you need to only use the magic mmio-con=
fig
- * accessor functions=2E
- * In fact just use pci_config_*, nothing else please=2E
- */
-static inline unsigned char mmio_config_readb(void __iomem *pos)
-{
-    u8 val;
-    asm volatile("movb (%1),%%al" : "=3Da" (val) : "r" (pos));
-    return val;
-}
-
-static inline unsigned short mmio_config_readw(void __iomem *pos)
-{
-    u16 val;
-    asm volatile("movw (%1),%%ax" : "=3Da" (val) : "r" (pos));
-    return val;
-}
-
-static inline unsigned int mmio_config_readl(void __iomem *pos)
-{
-    u32 val;
-    asm volatile("movl (%1),%%eax" : "=3Da" (val) : "r" (pos));
-    return val;
-}
-
-static inline void mmio_config_writeb(void __iomem *pos, u8 val)
-{
-    asm volatile("movb %%al,(%1)" :: "a" (val), "r" (pos) : "memory");
-}
-
-static inline void mmio_config_writew(void __iomem *pos, u16 val)
-{
-    asm volatile("movw %%ax,(%1)" :: "a" (val), "r" (pos) : "memory");
-}
-
-static inline void mmio_config_writel(void __iomem *pos, u32 val)
-{
-    asm volatile("movl %%eax,(%1)" :: "a" (val), "r" (pos) : "memory");
-}
-
 /* function prototypes */
 struct acpi_table_header;
 int cf_check acpi_parse_mcfg(struct acpi_table_header *header);
diff --git a/xen/arch/x86/x86_64/mmconfig_64=2Ec b/xen/arch/x86/x86_64/mmc=
onfig_64=2Ec
index 940cf6d747=2E=2E483dff9c2c 100644
--- a/xen/arch/x86/x86_64/mmconfig_64=2Ec
+++ b/xen/arch/x86/x86_64/mmconfig_64=2Ec
@@ -26,93 +26,6 @@ struct mmcfg_virt {
 static struct mmcfg_virt *pci_mmcfg_virt;
 static unsigned int mmcfg_pci_segment_shift;
=20
-static char __iomem *get_virt(unsigned int seg, unsigned int *bus)
-{
-    struct acpi_mcfg_allocation *cfg;
-    int cfg_num;
-
-    for (cfg_num =3D 0; cfg_num < pci_mmcfg_config_num; cfg_num++) {
-        cfg =3D pci_mmcfg_virt[cfg_num]=2Ecfg;
-        if (cfg->pci_segment =3D=3D seg &&
-            (cfg->start_bus_number <=3D *bus) &&
-            (cfg->end_bus_number >=3D *bus)) {
-            *bus -=3D cfg->start_bus_number;
-            return pci_mmcfg_virt[cfg_num]=2Evirt;
-        }
-    }
-
-    /* Fall back to type 0 */
-    return NULL;
-}
-
-static char __iomem *pci_dev_base(unsigned int seg, unsigned int bus, uns=
igned int devfn)
-{
-    char __iomem *addr;
-
-    addr =3D get_virt(seg, &bus);
-    if (!addr)
-        return NULL;
-     return addr + ((bus << 20) | (devfn << 12));
-}
-
-int pci_mmcfg_read(unsigned int seg, unsigned int bus,
-              unsigned int devfn, int reg, int len, u32 *value)
-{
-    char __iomem *addr;
-
-    /* Why do we have this when nobody checks it=2E How about a BUG()!? -=
AK */
-    if (unlikely((bus > 255) || (devfn > 255) || (reg > 4095))) {
-err:        *value =3D -1;
-        return -EINVAL;
-    }
-
-    addr =3D pci_dev_base(seg, bus, devfn);
-    if (!addr)
-        goto err;
-
-    switch (len) {
-    case 1:
-        *value =3D mmio_config_readb(addr + reg);
-        break;
-    case 2:
-        *value =3D mmio_config_readw(addr + reg);
-        break;
-    case 4:
-        *value =3D mmio_config_readl(addr + reg);
-        break;
-    }
-
-    return 0;
-}
-
-int pci_mmcfg_write(unsigned int seg, unsigned int bus,
-               unsigned int devfn, int reg, int len, u32 value)
-{
-    char __iomem *addr;
-
-    /* Why do we have this when nobody checks it=2E How about a BUG()!? -=
AK */
-    if (unlikely((bus > 255) || (devfn > 255) || (reg > 4095)))
-        return -EINVAL;
-
-    addr =3D pci_dev_base(seg, bus, devfn);
-    if (!addr)
-        return -EINVAL;
-
-    switch (len) {
-    case 1:
-        mmio_config_writeb(addr + reg, value);
-        break;
-    case 2:
-        mmio_config_writew(addr + reg, value);
-        break;
-    case 4:
-        mmio_config_writel(addr + reg, value);
-        break;
-    }
-
-    return 0;
-}
-
 static void __iomem *mcfg_ioremap(const struct acpi_mcfg_allocation *cfg,
                                   unsigned long idx, unsigned int prot)
 {
@@ -133,6 +46,25 @@ static void __iomem *mcfg_ioremap(const struct acpi_mc=
fg_allocation *cfg,
     return (void __iomem *) virt;
 }
=20
+char __iomem *pci_mmcfg_base(unsigned int seg, unsigned int *bus)
+{
+    struct acpi_mcfg_allocation *cfg;
+    int cfg_num;
+
+    for (cfg_num =3D 0; cfg_num < pci_mmcfg_config_num; cfg_num++) {
+        cfg =3D pci_mmcfg_virt[cfg_num]=2Ecfg;
+        if (cfg->pci_segment =3D=3D seg &&
+            (cfg->start_bus_number <=3D *bus) &&
+            (cfg->end_bus_number >=3D *bus)) {
+            *bus -=3D cfg->start_bus_number;
+            return pci_mmcfg_virt[cfg_num]=2Evirt;
+        }
+    }
+
+    /* Fall back to type 0 */
+    return NULL;
+}
+
 int pci_mmcfg_arch_enable(unsigned int idx)
 {
     const typeof(pci_mmcfg_config[0]) *cfg =3D pci_mmcfg_virt[idx]=2Ecfg;
diff --git a/xen/arch/x86/x86_64/pci=2Ec b/xen/arch/x86/x86_64/pci=2Ec
index 8d33429103=2E=2Ec37e3edade 100644
--- a/xen/arch/x86/x86_64/pci=2Ec
+++ b/xen/arch/x86/x86_64/pci=2Ec
@@ -11,13 +11,123 @@
 #define PCI_CONF_ADDRESS(sbdf, reg) \
     (0x80000000U | ((sbdf)=2Ebdf << 8) | ((reg) & ~3))
=20
+/*
+ * AMD Fam10h CPUs are buggy, and cannot access MMIO config space
+ * on their northbrige except through the * %eax register=2E As such, you=
 MUST
+ * NOT use normal IOMEM accesses, you need to only use the magic mmio-con=
fig
+ * accessor functions=2E
+ * In fact just use pci_config_*, nothing else please=2E
+ */
+static inline unsigned char mmio_config_readb(void __iomem *pos)
+{
+    u8 val;
+    asm volatile("movb (%1),%%al" : "=3Da" (val) : "r" (pos));
+    return val;
+}
+
+static inline unsigned short mmio_config_readw(void __iomem *pos)
+{
+    u16 val;
+    asm volatile("movw (%1),%%ax" : "=3Da" (val) : "r" (pos));
+    return val;
+}
+
+static inline unsigned int mmio_config_readl(void __iomem *pos)
+{
+    u32 val;
+    asm volatile("movl (%1),%%eax" : "=3Da" (val) : "r" (pos));
+    return val;
+}
+
+static inline void mmio_config_writeb(void __iomem *pos, u8 val)
+{
+    asm volatile("movb %%al,(%1)" :: "a" (val), "r" (pos) : "memory");
+}
+
+static inline void mmio_config_writew(void __iomem *pos, u16 val)
+{
+    asm volatile("movw %%ax,(%1)" :: "a" (val), "r" (pos) : "memory");
+}
+
+static inline void mmio_config_writel(void __iomem *pos, u32 val)
+{
+    asm volatile("movl %%eax,(%1)" :: "a" (val), "r" (pos) : "memory");
+}
+
+static char __iomem *pci_dev_base(unsigned int seg, unsigned int bus, uns=
igned int devfn)
+{
+    char __iomem *addr;
+
+    addr =3D pci_mmcfg_base(seg, &bus);
+    if (!addr)
+        return NULL;
+     return addr + ((bus << 20) | (devfn << 12));
+}
+
+static inline
+int pci_mmcfg_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len, u=
32 *value)
+{
+    char __iomem *addr;
+
+    /* Why do we have this when nobody checks it=2E How about a BUG()!? -=
AK */
+    if (unlikely(reg > 4095)) {
+err:        *value =3D -1;
+        return -EINVAL;
+    }
+
+    addr =3D pci_dev_base(sbdf=2Eseg, sbdf=2Ebus, sbdf=2Edevfn);
+    if (!addr)
+        goto err;
+
+    switch (len) {
+    case 1:
+        *value =3D mmio_config_readb(addr + reg);
+        break;
+    case 2:
+        *value =3D mmio_config_readw(addr + reg);
+        break;
+    case 4:
+        *value =3D mmio_config_readl(addr + reg);
+        break;
+    }
+
+    return 0;
+}
+
+inline int pci_mmcfg_write(pci_sbdf_t sbdf, unsigned int reg, unsigned in=
t len, u32 value)
+{
+    char __iomem *addr;
+
+    /* Why do we have this when nobody checks it=2E How about a BUG()!? -=
AK */
+    if (unlikely(reg > 4095))
+        return -EINVAL;
+
+    addr =3D pci_dev_base(sbdf=2Eseg, sbdf=2Ebus, sbdf=2Edevfn);
+    if (!addr)
+        return -EINVAL;
+
+    switch (len) {
+    case 1:
+        mmio_config_writeb(addr + reg, value);
+        break;
+    case 2:
+        mmio_config_writew(addr + reg, value);
+        break;
+    case 4:
+        mmio_config_writel(addr + reg, value);
+        break;
+    }
+
+    return 0;
+}
+
 uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg)
 {
     uint32_t value;
=20
     if ( sbdf=2Eseg || reg > 255 )
     {
-        pci_mmcfg_read(sbdf=2Eseg, sbdf=2Ebus, sbdf=2Edevfn, reg, 1, &val=
ue);
+        pci_mmcfg_read(sbdf, reg, 1, &value);
         return value;
     }
=20
@@ -30,7 +140,7 @@ uint16_t pci_conf_read16(pci_sbdf_t sbdf, unsigned int =
reg)
     {
         uint32_t value;
=20
-        pci_mmcfg_read(sbdf=2Eseg, sbdf=2Ebus, sbdf=2Edevfn, reg, 2, &val=
ue);
+        pci_mmcfg_read(sbdf, reg, 2, &value);
         return value;
     }
=20
@@ -43,7 +153,7 @@ uint32_t pci_conf_read32(pci_sbdf_t sbdf, unsigned int =
reg)
     {
         uint32_t value;
=20
-        pci_mmcfg_read(sbdf=2Eseg, sbdf=2Ebus, sbdf=2Edevfn, reg, 4, &val=
ue);
+        pci_mmcfg_read(sbdf, reg, 4, &value);
         return value;
     }
=20
@@ -53,7 +163,7 @@ uint32_t pci_conf_read32(pci_sbdf_t sbdf, unsigned int =
reg)
 void pci_conf_write8(pci_sbdf_t sbdf, unsigned int reg, uint8_t data)
 {
     if ( sbdf=2Eseg || reg > 255 )
-        pci_mmcfg_write(sbdf=2Eseg, sbdf=2Ebus, sbdf=2Edevfn, reg, 1, dat=
a);
+        pci_mmcfg_write(sbdf, reg, 1, data);
     else
         pci_conf_write(PCI_CONF_ADDRESS(sbdf, reg), reg & 3, 1, data);
 }
@@ -61,7 +171,7 @@ void pci_conf_write8(pci_sbdf_t sbdf, unsigned int reg,=
 uint8_t data)
 void pci_conf_write16(pci_sbdf_t sbdf, unsigned int reg, uint16_t data)
 {
     if ( sbdf=2Eseg || reg > 255 )
-        pci_mmcfg_write(sbdf=2Eseg, sbdf=2Ebus, sbdf=2Edevfn, reg, 2, dat=
a);
+        pci_mmcfg_write(sbdf, reg, 2, data);
     else
         pci_conf_write(PCI_CONF_ADDRESS(sbdf, reg), reg & 2, 2, data);
 }
@@ -69,7 +179,7 @@ void pci_conf_write16(pci_sbdf_t sbdf, unsigned int reg=
, uint16_t data)
 void pci_conf_write32(pci_sbdf_t sbdf, unsigned int reg, uint32_t data)
 {
     if ( sbdf=2Eseg || reg > 255 )
-        pci_mmcfg_write(sbdf=2Eseg, sbdf=2Ebus, sbdf=2Edevfn, reg, 4, dat=
a);
+        pci_mmcfg_write(sbdf, reg, 4, data);
     else
         pci_conf_write(PCI_CONF_ADDRESS(sbdf, reg), 0, 4, data);
 }
diff --git a/xen/include/xen/pci=2Eh b/xen/include/xen/pci=2Eh
index d816dcad05=2E=2Eb3c91fea9c 100644
--- a/xen/include/xen/pci=2Eh
+++ b/xen/include/xen/pci=2Eh
@@ -258,10 +258,8 @@ void pci_conf_write16(pci_sbdf_t sbdf, unsigned int r=
eg, uint16_t data);
 void pci_conf_write32(pci_sbdf_t sbdf, unsigned int reg, uint32_t data);
 uint32_t pci_conf_read(uint32_t cf8, uint8_t offset, uint8_t bytes);
 void pci_conf_write(uint32_t cf8, uint8_t offset, uint8_t bytes, uint32_t=
 data);
-int pci_mmcfg_read(unsigned int seg, unsigned int bus,
-                   unsigned int devfn, int reg, int len, u32 *value);
-int pci_mmcfg_write(unsigned int seg, unsigned int bus,
-                    unsigned int devfn, int reg, int len, u32 value);
+char *pci_mmcfg_base(unsigned int seg, unsigned int *bus);
+int pci_mmcfg_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int len, =
u32 value);
 unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap);
 unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
                                    const unsigned int caps[], unsigned in=
t n,
--=20
2=2E52=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.e14.e5f1b60d69208c0d.19e3baeb0f7.8800be35dc06f22b=---


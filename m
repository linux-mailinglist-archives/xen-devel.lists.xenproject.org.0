Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PQMsEB3qT2rFqAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 20:36:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA51F73452C
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 20:36:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=aol.com header.s=a2048 header.b=DqdgcDyS;
	dmarc=pass (policy=reject) header.from=aol.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358457.1612583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whtat-0004Gh-KE; Thu, 09 Jul 2026 18:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358457.1612583; Thu, 09 Jul 2026 18:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whtat-0004ET-H1; Thu, 09 Jul 2026 18:35:31 +0000
Received: by outflank-mailman (input) for mailman id 1358457;
 Thu, 09 Jul 2026 18:35:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brchuckz@aol.com>) id 1whtas-0003o1-DT
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 18:35:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whtar-004bSK-Py
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 20:35:29 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brchuckz@aol.com>)
 id 6a4fe9ee-5cb7-0a2a0a5109dd-0a2a450b9898-2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 20:35:26 +0200
Received: from [98.137.68.31] (helo=sonic308-55.consmr.mail.gq1.yahoo.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <brchuckz@aol.com>)
 id 6a4fe9ed-b7da-0a2a450b0019-6289441fa20e-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 20:35:26 +0200
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Thu, 9 Jul 2026 18:35:24 +0000
Received: by hermes--production-ne1-7568ccb994-fjmzg (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 910e3b4d72a347495c18993f77062a0e; 
 Thu, 09 Jul 2026 18:35:23 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1783622124; bh=RWUWN1Khjj7dJNM0rQ3yGglWM1wDL1ijwxyNMLI6jYE=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=DqdgcDySsWQn3/hfhqx93w0tMHWTVlJYPc2ZhAOCQPfAMMIoP/uPvJ9TcMh1o2KSDl7zg5KTfN55CvOhskA0l1W7IEcOAJz5DV8P/EGSHkq2w1qAw5OJe5Lw3ZUgvhx1UbJh8oqXFLgz4NYWQvLpgeC6RKS6by8Ub6whBxQkXmc0SBrGsPJ9ep6IhsexQAtYmAhPCKuoWfc2CzvnBZNTCPBgRvyLRz/Kb+hFGsLLRg8F5Ex8oFeEnUTEllKyNFPdQthsMajmBPO4Tb/WF3IUx3X3qdBen7YVYEkZWMOHGWX779Uu5F8EdZ/X2SBmjFVQNO4Y5EEhOg1lyyB1MxZtgA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1783622124; bh=5qCBF6nm0C28qlJPoFBbn0E8KwxNV8yc5GrA4lxP5jX=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=oj6CFCXljEo5MSL5LpWL2CeqmwpowIrywm5/t97F5m1kSoATKqPVTPnz5n5X6DRxAqQ0yF49KB5OCDpZ/OHAONOqu1ZziIGhqsgB0RW9pWzs2dXbigBEDpZn1xvkyHkeV5WHpD6QpuNIDRKs20GxTqfSKGKggMDgS1Z92bH/7l1mj5dLu6/Wk5ADTzmKF5X/Qf49ZxsbqPEbVRlupr1v56fQiOO4RrP15pHynnZoFmt5I1UBm014shAbM1oJsTx1Fm3wW6L/qhNRJle2aaGRrXUc0TIkdp83FzghIiHcOEJSZYtNLi1I0zT4IwOLG5TORC54qUjLFffzJ3A4vQUrtQ==
X-YMail-OSG: L4MJRXUVM1kVp8VEtv0TmQ7TiWZogcFrMIf7kJDDTJoc.aD3bGM_FLa_204FUAs
 B6Gv4cVOakoVX_sRf03Z04sQ6w2kvCp5NXTEbU_oHO4W6euyUAvHjLKobrhDr1Q_QibA7.fpvJAj
 gEpLw5RdHx5JWh2sOYrF4fUXje9aF47i8D0sYFqgyh3hZTZCDuQebcRk3xB3e8RyCeaHHdnH.qOU
 5hzAGfD2M5.GXwf_hwklG7fi61plwdAMQcSMlmucxVWztU7CQ_cowAULQLSZmzITO3_G6a7MrszK
 fM4jjM1BVxvYLYb31eK992FJ3FLV1ctpaIFyA8oyZJnVir04xkEfcjjhHlzf32XW7XMG4ImtM.Gr
 mXnbiglz8tFkRFAn1tKPhOz1fdhloIrYSaNOipn18zjuTqZQxNvc9bYIwCuSGV0FcYDcQnqmYoxA
 BnUeWQYkdpEqHpMATznCq5OZwpuIZhFBvHAiiVhUbRwzKt4Azr0Qhi.pLaI3J_VRXtoaSwvv6lV0
 oSUmJvpGQUFFIvcuz2vVD3lhXYjXcf7P0oIcvyqwOk105ClfQb1k0eG.FWh.0qbZEnh9ODW2hdzk
 3e01D1u0UA1pfMqJDWsYBMoInDV0n_BKKrv0H5Fpycryp.eEeE8_V0qg83Hwmz5WreHRH0ccPZXJ
 ViHMtu_EaE0H4EI1ORsQFcPyKCDeBmioqPJ.S7cR.9I_6QQY1B8Z.e0BxDE.KNVCN2gVC.DXtGdA
 h61qeUpjTbb2OUPDpjJUR4FrIwDV1lzT_u7qDuPkVct1Rdx3D8wIK1SNbuh4HF0u.AXy3Ii1xYVN
 Q71qn9gduPxtY4CQuGWZXyb.oDXA0H8FhdsRMiZqSilyl.WvbyRXNkJtU.qg6.HUJ6LHXje7aMHG
 jju8ZkaU97x5s56YSB0_JEX4lkA6mOJgr2Dbpq_WiiqaItO.UwFkP8SSVmeWimfIbqis8vOjYRji
 ZngT_5M49Lrlg5ZzC9lf2yv_aqwGwV6IjjpgFIYwqSmc5o5J9myfOPGKp1dg3wdhkcOXvzBg0i31
 ZX1ifnVptpN.HQ6qKt.OK69Ib3gqty4sBM69atbKU_jZ0S9mFtK_CznWwgr.O13ovieijJqCmRc.
 CtRct.vennLz2h2udlPffW6S63ljA9FGOKJ69syHmGp6ZwGWcsiziGDSBSh43rJntCKnj5wGJ5.s
 8zzcpoT1pJMly_oearQMKEAftwYpQaBs4zCG_Sdksw5sjYgUFOAaOZGq0iFvs6XdJVO5hfOZ1Sel
 vccYSIxaZ42nVQBBGyQwaWl4Se2RRHQaXAgr21zNQqZfGcxLB6.Lugw9a2w6SSejA2RAvYAvUOPS
 YolWfFrFE4p3vjRhYrlGQJAilh_5mENmjeSmBw1i0M3qOgjJiB5YhVCGv2d2HceliK_OZyGgrewn
 H5jUxvtunbN97Lt1xyxr1hUAAcLXDtqaCBwaM1ZJwuTJQZjFs3RChHwZpcQ_4MVSsRzX9dJ0oKx9
 8ExgHNAiaArvOWDBBxlRI5w421XWY.my2G2NaJcZzc1HyaWme3SdNFvQ8mmQpgGR9Asj3F6R42ig
 zDcjyXN.Lpadm92Gf0IW9UKDyetiZMwdQVSS_lUZb9JG4fIeCx_9BN.YUJJUD3qwOAhKipB5xlaa
 LsHeYsmTP7Bz7JMTt537YOjPtYohyxpRfrVxGivTy.wFRLEWBxzjRc1jaOQqWf6yaJuJSeTSEBxw
 GB9nEMlmYkqKWWFQhJQYEi.hksmUoaHcpMIPCHmQXQikx3A4g85vWWnm9vPx0ZCHVwsrMsrWbPxH
 QNFX9mH8jDSHo3R9r_8h.sojbcDL3Ie65MuLmu8hjYJSiiEazCesmFIfiTJUd7pdyUDPximjDfiF
 _f9ngMsZteF5jSMLbQty6vLEslG6DUdfVWKEaVyCupJlvmfm5UukyA80KQY.WGLlD8kgzLuLegfE
 168HR46NsLD9x1.77_lOsXCAfKVJ3mdsv1SczGmXCNY2ifGbdmWfbAi_T7hHlzNHr77MbDYHjfHZ
 L1grRi8jhzl2zXyR4IeqPZyKijn4CjFOROUrCpef7ViO_3JmL9lx6FMUAUR8QEwd7D9e3B5m2a7o
 .pW26Q7WsiOkkWapCYMG5T0BsmP7OUX9ANCe_ZIL2BHPds2vUIE_MoAcWyU6nnE1FEpEf1OYDU5a
 o9b.ExeN.sS.grra_SWofdrAOZ0RDwZhan8NnNxgjnzDj0O54EFviAybg13DWxekJiYZQO9KLEsM
 VD7x1wllEcTAM1t7euqv6mh7p.cRSc1m8MkKZz.mY
X-Sonic-MF: <brchuckz@aol.com>
X-Sonic-ID: 5789bcb1-0729-48f7-807f-e36832099043
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v3 3/3] xen/igd: fixup device id before registering rom
Date: Thu,  9 Jul 2026 14:35:16 -0400
Message-ID: <20260709183517.25866-4-brchuckz@aol.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260709183517.25866-1-brchuckz@aol.com>
References: <20260709183517.25866-1-brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1783622126-4B36C9ED-BD7F74DB/0/0
X-purgate-type: clean
X-purgate-size: 3305
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[aol.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[aol.com:s=a2048];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:qemu-stable@nongnu.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[aol.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[brchuckz@aol.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[nongnu.org,lists.xenproject.org,kernel.org,xenproject.org,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[brchuckz@aol.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[aol.com:+];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA51F73452C

With the current implementation, Seabios does not see the fixup of
the device id done here and consequently Seabios does not load the
VGA bios and the guest screen does not light up until the guest OS
graphics driver is loaded. So there is no VGA output from the passed
through Intel IGD from either Seabios or the guest bootloader with
the current implementation in cases when the device id needs fixing.

Fix this by waiting until after doing fixup of the device id before
registering the option ROM. With this patch, Seabios sees the fixup
done here and loads the VGA bios, and both Seabios and the guest
bootloader light up the guest screen in cases when fixup of the
device id is needed.

Also, remove unused header hw/core/loader.h.

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
Changes in v2:
  - add a period to the end of the last sentence of the commit message
  - add stable to Cc list

Changes in v3:
  - fix Cc address for qemu-stable

 hw/xen/xen_pt_graphics.c |  3 +++
 hw/xen/xen_pt_load_rom.c | 18 ++++++++++++------
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/hw/xen/xen_pt_graphics.c b/hw/xen/xen_pt_graphics.c
index 2ef941e..aface0b 100644
--- a/hw/xen/xen_pt_graphics.c
+++ b/hw/xen/xen_pt_graphics.c
@@ -222,6 +222,9 @@ void xen_pt_setup_vga(XenPCIPassthroughState *s, XenHostPCIDevice *dev,
         }
     }
 
+    pci_register_bar(&s->dev, PCI_ROM_SLOT, 0, &s->dev.rom);
+    s->dev.has_rom = true;
+
     /* Currently we fixed this address as a primary for legacy BIOS. */
     physical_memory_write(0xc0000, bios, bios_size);
 }
diff --git a/hw/xen/xen_pt_load_rom.c b/hw/xen/xen_pt_load_rom.c
index 319efca..407b630 100644
--- a/hw/xen/xen_pt_load_rom.c
+++ b/hw/xen/xen_pt_load_rom.c
@@ -4,14 +4,22 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
-#include "hw/core/loader.h"
 #include "hw/pci/pci.h"
 #include "xen_pt.h"
 
 /*
- * Scan the assigned devices for the devices that have an option ROM, and then
- * load the corresponding ROM data to RAM. If an error occurs while loading an
- * option ROM, we just ignore that option ROM and continue with the next one.
+ * Normally xen_pt_register_regions will handle loading the option ROM,
+ * but in some cases, such as for the Intel IGD, the option ROM might
+ * need to be modified.
+ *
+ * For such cases, use this function to get a pointer to the option ROM
+ * from sysfs. Caller has the responsibility to edit the option ROM as
+ * needed, call pci_register_bar to register the modified option ROM,
+ * and set has_rom to true for the PCI device.
+ *
+ * This function must be called before xen_pt_register_regions is called
+ * because if xen_pt_register_regions is called first, it will register
+ * the option ROM and any attempt to register it again will fail.
  */
 void *pci_assign_dev_load_option_rom(PCIDevice *dev,
                                      int *size, unsigned int domain,
@@ -76,8 +84,6 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev,
         goto close_rom;
     }
 
-    pci_register_bar(dev, PCI_ROM_SLOT, 0, &dev->rom);
-    dev->has_rom = true;
     *size = st.st_size;
 close_rom:
     /* Write "0" to disable ROM */
-- 
2.52.0



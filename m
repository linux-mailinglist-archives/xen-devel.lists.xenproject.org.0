Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5061410097A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 17:45:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWk6l-0003D0-Cg; Mon, 18 Nov 2019 16:42:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gQuo=ZK=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iWk6k-0003Cr-AZ
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 16:42:34 +0000
X-Inumbo-ID: 6ab85fe2-0a22-11ea-9631-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ab85fe2-0a22-11ea-9631-bc764e2007e4;
 Mon, 18 Nov 2019 16:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574095352;
 h=to:cc:from:subject:message-id:date:mime-version;
 bh=7vdUBa863YV1zTZbHan3jqBJ0GFq6uaMSfqDsiYD69U=;
 b=bpCSUrIh/aEV1tiFImTxXtU+OpexetsjxJ0Xz/+Yqrcsv6XTOpmQTeh0
 UR6HFnBlsEVqGAz0ssQ72p6yky4aGlfmCiSRYevqlOHqbxOLwChaMegbK
 T4g7uIE105WWd9gMz8YMEhfrAYCDGOPNxRXZGC0upFcIn8ozSuPbRijMc s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1zFXopwsgOvpnT/nxp38vfNqrHf1BsFB3FrIPh+6/56YaQm60JgcK9IfNUG9YFvPATucox7ZJA
 yFCNzujMgclKfNy8SUQ1T5h+1QVztgpzd2DzE1ewJ0751THuHSjSY4u9865jKUU2lNWidr2KoD
 ZViPKZDunxdXLByw+SKBMlxXLe+RPm09TfgJWqJf66WcboLunb/Sop81+gWIRmok6KCkx6ZfSW
 1dDMKXPN0xxK8GNRnPmcBaV5LkkuY4Pa7vEX2Tcs060V36X39/gDR0z6Gp/aRE8IWNyrciaQ+f
 IF4=
X-SBRS: 2.7
X-MesageID: 9012027
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,320,1569297600"; 
   d="scan'208";a="9012027"
To: Xen-devel <xen-devel@lists.xenproject.org>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <5ef38d72-3a80-e2ef-68d9-ec498866d4eb@citrix.com>
Date: Mon, 18 Nov 2019 16:42:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------419963A47BD86483A550D16A"
Content-Language: en-US
Subject: [Xen-devel] livepatch-build-tools regression
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>,
 Andra-Irina Paraschiv <andraprs@amazon.com>,
 Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Martin Pohlack <mpohlack@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Norbert Manthey <nmanthey@amazon.de>, Martin Mazein <amazein@amazon.de>,
 Bjoern Doebel <doebel@amazon.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--------------419963A47BD86483A550D16A
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hello,

Trying to build a simple version of XSA-304 Live-Patch for 4.13 gives
the following error during LP upload:

    (XEN) livepatch: lp: Unknown symbol: .LC7

Bisecting identified the first bad commit as:

    commit 854a7ca60e35 "create-diff-object: Do not include all .rodata sections"

Base version of Xen used for this experiment is d13dfb02aafab
The patch file used for LP is attached.

--
Thanks,
Sergey

--------------419963A47BD86483A550D16A
Content-Type: text/x-patch; name="0001-live-patch.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-live-patch.patch"

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 451d213c8c..5e427a1cf8 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -918,7 +918,7 @@ Controls for interacting with the system Extended Firmware Interface.
     uncacheable.
 
 ### ept
-> `= List of [ ad=<bool>, pml=<bool> ]`
+> `= List of [ ad=<bool>, pml=<bool>, exec-sp=<bool> ]`
 
 > Applicability: Intel
 
@@ -949,6 +949,31 @@ introduced with the Nehalem architecture.
     disable PML.  `pml=0` can be used to prevent the use of PML on otherwise
     capable hardware.
 
+*   The `exec-sp` boolean controls whether EPT superpages with execute
+    permissions are permitted.  In general this is good for performance.
+
+    However, on processors vulnerable CVE-2018-12207, HVM guest kernels can
+    use executable superpages to crash the host.  By default, executable
+    superpages are disabled on affected hardware.
+
+    If HVM guest kernels are trusted not to mount a DoS against the system,
+    this option can enabled to regain performance.
+
+    This boolean may be modified at runtime using `xl set-parameters
+    ept=[no-]exec-sp` to switch between fast and secure.
+
+    *   When switching from secure to fast, preexisting HVM domains will run
+        at their current performance until they are rebooted; new domains will
+        run without any overhead.
+
+    *   When switching from fast to secure, all HVM domains will immediately
+        suffer a performance penalty.
+
+    **Warning: No guarantee is made that this runtime option will be retained
+      indefinitely, or that it will retain this exact behaviour.  It is
+      intended as an emergency option for people who first chose fast, then
+      change their minds to secure, and wish not to reboot.**
+
 ### extra_guest_irqs
 > `= [<domU number>][,<dom0 number>]`
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 06a7b40107..818e705fd1 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1833,6 +1833,24 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
             break;
         }
 
+        /*
+         * Workaround for XSA-304 / CVE-2018-12207.  If we take an execution
+         * fault against a non-executable superpage, shatter it to regain
+         * execute permissions.
+         */
+        if ( page_order > 0 && npfec.insn_fetch && npfec.present && !violation )
+        {
+            int res = p2m_set_entry(p2m, _gfn(gfn), mfn, PAGE_ORDER_4K,
+                                    p2mt, p2ma);
+
+            if ( res )
+                printk(XENLOG_ERR "Failed to shatter gfn %"PRI_gfn": %d\n",
+                       gfn, res);
+
+            rc = !res;
+            goto out_put_gfn;
+        }
+
         if ( violation )
         {
             /* Should #VE be emulated for this fault? */
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index ed27e8def7..668986eeaa 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -67,6 +67,7 @@ integer_param("ple_window", ple_window);
 
 static bool __read_mostly opt_ept_pml = true;
 static s8 __read_mostly opt_ept_ad = -1;
+int8_t opt_ept_exec_sp = -1;
 
 static int __init parse_ept_param(const char *s)
 {
@@ -92,6 +93,40 @@ static int __init parse_ept_param(const char *s)
 }
 custom_param("ept", parse_ept_param);
 
+int parse_ept_param_runtime(const char *s)
+{
+    int val;
+
+    if ( !cpu_has_vmx_ept || !hvm_funcs.hap_supported ||
+         !(hvm_funcs.hap_capabilities &
+           (HVM_HAP_SUPERPAGE_2MB | HVM_HAP_SUPERPAGE_1GB)) )
+    {
+        printk("VMX: EPT not available, or not in use - ignoring\n");
+        return 0;
+    }
+
+    if ( (val = parse_boolean("exec-sp", s, NULL)) < 0 )
+        return -EINVAL;
+
+    if ( val != opt_ept_exec_sp )
+    {
+        struct domain *d;
+
+        opt_ept_exec_sp = val;
+
+        rcu_read_lock(&domlist_read_lock);
+        for_each_domain ( d )
+            if ( paging_mode_hap(d) )
+                p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_rw);
+        rcu_read_unlock(&domlist_read_lock);
+    }
+
+    printk("VMX: EPT executable superpages %sabled\n",
+           val ? "en" : "dis");
+
+    return 0;
+}
+
 /* Dynamic (run-time adjusted) execution control flags. */
 u32 vmx_pin_based_exec_control __read_mostly;
 u32 vmx_cpu_based_exec_control __read_mostly;
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 220990f017..f06e51904a 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -174,6 +174,12 @@ static void ept_p2m_type_to_flags(struct p2m_domain *p2m, ept_entry_t *entry,
             break;
     }
     
+    /*
+     * Don't create executable superpages if we need to shatter them to
+     * protect against CVE-2018-12207.
+     */
+    if ( !opt_ept_exec_sp && is_epte_superpage(entry) )
+        entry->x = 0;
 }
 
 #define GUEST_TABLE_MAP_FAILED  0
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index e5e4349dea..ba126f790a 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -289,15 +289,20 @@ static void change_entry_type_global(struct p2m_domain *p2m,
                                      p2m_type_t ot, p2m_type_t nt)
 {
     p2m->change_entry_type_global(p2m, ot, nt);
-    p2m->global_logdirty = (nt == p2m_ram_logdirty);
+    /* Don't allow 'recalculate' operations to change the logdirty state. */
+    if ( ot != nt )
+        p2m->global_logdirty = (nt == p2m_ram_logdirty);
 }
 
+/*
+ * May be called with ot = nt = p2m_ram_rw for its side effect of
+ * recalculating all PTEs in the p2m.
+ */
 void p2m_change_entry_type_global(struct domain *d,
                                   p2m_type_t ot, p2m_type_t nt)
 {
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
 
-    ASSERT(ot != nt);
     ASSERT(p2m_is_changeable(ot) && p2m_is_changeable(nt));
 
     p2m_lock(hostp2m);
diff --git a/xen/include/asm-x86/hvm/vmx/vmx.h b/xen/include/asm-x86/hvm/vmx/vmx.h
index ebaa74449b..371b912887 100644
--- a/xen/include/asm-x86/hvm/vmx/vmx.h
+++ b/xen/include/asm-x86/hvm/vmx/vmx.h
@@ -28,6 +28,8 @@
 #include <asm/hvm/trace.h>
 #include <asm/hvm/vmx/vmcs.h>
 
+extern int8_t opt_ept_exec_sp;
+
 typedef union {
     struct {
         u64 r       :   1,  /* bit 0 - Read permission */
diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-index.h
index 637259bd1f..32746aa8ae 100644
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -52,6 +52,7 @@
 #define ARCH_CAPS_SKIP_L1DFL		(_AC(1, ULL) << 3)
 #define ARCH_CAPS_SSB_NO		(_AC(1, ULL) << 4)
 #define ARCH_CAPS_MDS_NO		(_AC(1, ULL) << 5)
+#define ARCH_CAPS_IF_PSCHANGE_MC_NO	(_AC(1, ULL) << 6)
 
 #define MSR_FLUSH_CMD			0x0000010b
 #define FLUSH_CMD_L1D			(_AC(1, ULL) << 0)

--------------419963A47BD86483A550D16A
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------419963A47BD86483A550D16A--


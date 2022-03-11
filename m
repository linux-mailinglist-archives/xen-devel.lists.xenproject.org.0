Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F90B4D5A56
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 06:15:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288685.489643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSXcU-0001i2-Vx; Fri, 11 Mar 2022 05:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288685.489643; Fri, 11 Mar 2022 05:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSXcU-0001fj-Sp; Fri, 11 Mar 2022 05:15:18 +0000
Received: by outflank-mailman (input) for mailman id 288685;
 Fri, 11 Mar 2022 05:01:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K7gA=TW=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1nSXPC-0008K2-6D
 for xen-devel@lists.xen.org; Fri, 11 Mar 2022 05:01:35 +0000
Received: from sonic306-19.consmr.mail.gq1.yahoo.com
 (sonic306-19.consmr.mail.gq1.yahoo.com [98.137.68.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e3cca5b-a0f8-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 06:01:31 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Fri, 11 Mar 2022 05:01:26 +0000
Received: by kubenode532.mail-prod1.omega.ne1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 654337a831c968b465ea7902d4a544cc; 
 Fri, 11 Mar 2022 05:01:24 +0000 (UTC)
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
X-Inumbo-ID: 4e3cca5b-a0f8-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1646974886; bh=pAmEpZGbTSxRF4ekSimPEO0xZW6MBXSMK/vuO4xoIuA=; h=Date:To:From:Subject:References:From:Subject:Reply-To; b=m9gYMXMvBB+ZYW+SitfH/N9S/e/wHYD5r4iFCyuMvUtn4RVEAWna+EzW4aU2gIBwny4Q3gUFlXhrp4hZzC0mP+ooFFH9ZELFQqpXCoZNXvD7qBlYaJu3a0zmML2y3YzvK1B7W+m0VVpkp24elD2PbGvskFgNXkN1H/TCu26uR5WcEk1xpZz8toH+Fu3AFmSIp3Urq5lCgASkoHzGo97cgq9jwo2Abt+TexapA0YXamCvfRY5jZSnGjAG2cizwSs591aphU9ExQ0U9JamqDQa2lHRyn8MwgkZOlVDOmTH0EJjAL5MwR+BN66pfO7mWcfyJWbhMBNNAshw3s+3TIfeBA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1646974886; bh=McAta/lzIfdVRKDixyRRN9NhlkuPJQEXYgVjly/Oww/=; h=X-Sonic-MF:Date:To:From:Subject:From:Subject; b=Iu+h3dqEwkx4pXdsfEDtrzq3wGdsA9ienkCaklKsqI5ilRD9G0mS+8H6LmZ94rmKQZFp5kajGWgqSpRq4uSuTfW3WujxqjV4tjCnK5ok62Nl6VWLcv6melhUIP/gmfAAxoOdE/ucHGhsrl4x6IVO0cureF61Lxu+f6spK3p15cl8W65XZ+RN14a5tdpPAgcomUodsO+6WCmHGZyJg3jyMUNN4V6BTZ0eopx5IHkGEWj+S0ickP8vxPMMusdhHVJ/viJjuKl2foe1fr7QvYP/Sr/vYijIsjT1ogGR4/fpeWE7bWDSSj4TRArGtZERTfg8cANdhLA7an+hMciN9y77jg==
X-YMail-OSG: pmz.5JIVM1lmwx8rKmmbE0K9nMFQd7aDaglsyRjgf9EHjcCjH_WN9zGxdDQH2jc
 wFwskDkgcUuYo8ysaOm2leKnIw7rGdhIwbrZludrb2qx7NP2DGJ6otF4_HBLeafDfSw0KC7_Mr1p
 e_E5CxoqUlHDKxhVB3OFOprEDhDNrwYk7U02vkC_N4trJJThM8Wn.QadvI2vUaw9QVg6d7hv5002
 bUIhhiUv5GUjAAPSuPGdn4FaMRA3Li8jQa4Z87j9KOfxT.UcPgkwY1PKh9X6IIjso7_s4uDjbM53
 IkyQ9uuTqrZkmOfah4nmylNdugQpzPBpb5Wkvcaz88rhaf6ICSdq1DEI42CJOKl3jwDsbwhiETW2
 bGBA0hpqJiCM4XBGBLxCRO.hebowD.bRdFWXfhzMOp_JYnuvRffuu.ATgY.21ioAGAn6oSHBoaUv
 BMVwmK62d2SvkWULAP9W0nvsQbQJ89Ci.rgeK_.X9mDSJOqKjjOc_Q3J0CLagJP70fbIu2CKfWIO
 DW7esSVUkqEejrKhrXrGWCO6xUtvas9YvQqtbElB4fCnHvkfBrC2QEeB0UDvUchkYaP9pKQ5VFTz
 _uwUmPBpDA4ZeGzbedBxNJk.vzDXTsAjhwLKz0MdodWg9rwn9Mvc87VXK9fxRKHzUh.O8tJCXRMT
 7hq1Er2T9XNsjGwh16ANt06HKqudVBfyahuoYdKPL80R4oMPAkU_ISVS4mw270Hdhpl0BuIPkWIL
 rkv6uhTXG.z.9.FuOnQ6BQw4tV7MtJdrCLlF7N6xISYOH1cnmXv.LneEjHncPH84D.fCJ3F5jFzz
 OExTmA2GcjjNBn6hQkJMu26vxuGslx55dXDO055WO0pLEPqX6cNqsY7N7X0lncCFwHlS4F4jAT7O
 jLio8Npps_8FNNpdcjfFNAvpd.Fl.rc7GnvO6LwWTIr8OtMS2HMAjZV6Fz5rJjBxuQIP9aiA6Btp
 dJUZ6pv4P0x8rmsfJQpQ5Bk7EekKaqwEAAubBZEAJePOWHhbvgaLyifqTRXvb3VgkSbwfLRP90Z9
 B.edIvQsMYtzonmIQcJDdRDyOJvQGJuKs2gCuQxa_Jw0bo1kXXNA2N.hNcprifhR_v4qhFFsml_1
 ESGK9uwxAw3N6ge_LO67jIEdoU4L2JIRFEG882f_c6bMKW0kmeG_pZqK0gahRg.89.RFnOlRa19w
 z9dvSdZOdEGsG25e.VxwL85464vnrcytMrNNdiDWQjkELGeXer2TA3EGFLtz4SV0fBs7hC9IOdHC
 G3rFd6xieqnKN_YNAIkETnL601hG7rm1HFJyCXAtNRLvJRxHHirVb4dmySbM1U6ZqtlHw9i76T3S
 DtP3JSy0fWsRt5TbVbnA3XQl1NekuYEmEerjw6sf.ZKAw.YTWUHcyiiQbvPOdit1uayFc7lx8y2W
 UX5mG718h5kGAYcw33TGM.to8bW0RIViniDXWy4JF1krWm.yzH3ULYjNtXzfWby0WDbKBYIRr7AA
 Cc9hra7YRlAK2AjH57_IQ205YBGna34kDUg84e7dG37bL4BdKZuCAfYXGusU_HPPaM2zWu191ZNO
 MN6NyZhJaHDGYRsq08zOfqSJ4yGXiGUYGmG2IAVN.OCVN.O04HvJxGbTVJJboEMw5qV5fsegI0jv
 KGw_gMef4o5AnQP.h3bLktqGXDp369Zd21e_B7kyQNrlg_XtVLyHFOQtsit01O3V2sv5XIqPRU34
 xIxflSJxYRmWox7unq9Rs8bgURVXOo8sFegs4IhOMdVb3rpIWTQlj29hUhHyoxiqBB6giNTrXISC
 vYcHUW8szWQy90o.m_1or8qIYnCOmV8HzJhWZvBsi9.FLaRDX10A0fjZSLKZsfGQy2BimcPK6hh8
 sLB0VHmRVPSiLHWziFeuUjlYZ3HLNt_yonDjVYgYjq6RQG7Kse9CaSFtcy_SCn2VKhzC71wJz25i
 9y8OFOQW2nBA2msaO6qt3S6DnywLt2EkK0yYwKZDoajPjP6JPXVnO40vqEF3CY2fMHmu9sFbKEHx
 .PKaicNOEjcwDft1hfvyMW.oJ2Q9hq0ymiuPmoIiYIbSJTt_wRq2ZKB1ODzCT7FUa1ZSNNpig14S
 fc1GmJGW.A0DhIv5qH.PnY2IW2htqjijdkwMqiKmYyqk2YU3e1PGIHQYVVSILiXgofuscohtKOeq
 2sKVBsN16i57JfwYObiQk9vNanePPzTTRAhI.C5osOqUYJXQWwMfFyrlqxWr1mT9O9gmgpMndnjr
 .X15uNjC7MOHPVr9XU7tj1rSYVge45AdHC4CyRLDG
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <4703b7f1-8d3c-5128-213c-e39f487e4cde@netscape.net>
Date: Fri, 11 Mar 2022 00:01:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: xen-devel@lists.xen.org
From: Chuck Zmudzinski <brchuckz@netscape.net>
Subject: BUG: libxenlight fails to grant permission to access Intel IGD
 Opregion
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
References: <4703b7f1-8d3c-5128-213c-e39f487e4cde.ref@netscape.net>
X-Mailer: WebService/1.1.19878 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

Hello,

Below is a proposed patch for a bug that I have noticed on
Debian versions of Xen going back to at least Xen 4.8, which
shipped with Debian 9 in 2017. In fact, the last Debian version
of Xen that did not have the bug was Xen 4.4 that shipped
with Debian 8 back in 2015. The bug causes passthrough of the Intel
IGD to a Linux HVM domain to fail.

On Debian BTS this is 
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=988333

I have provided a patch that fixes the bug on Xen-4.16 at the end of
this message.

A long time ago, during the development of Xen 4.5 in 2014,
two patches implemented a change to the way permission is
granted for an unprivileged domain to access PCI/VGA-related
I/O memory. Prior to this, AFAICT, permission was implicitly
granted to access the memory the domain requested when a
PCI device being passed to the domain was being configured.
After the change, permission to access such memory is not
granted without prior explicit permission being configured,
and this is still the current behavior.

The relevant patches are:

1. 
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=abfb006f1ff4af1424e5b0d0589f0226377fda36

and

2. 
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=0561e1f01e87b777bcc47971e4ae1f420314f4a0

I found these patches by brute force, building and testing various
versions of Xen 4.5-unstable until I found the patches that caused
passthrough of the Intel IGD to Linux to fail. I used the traditional
device model in my tests because back when Xen 4.5 was under
development, the upstream device model did not support Intel IGD
passthrough.

The first of these patches intended to implement explicit
granting of permission to access the I/O memory that is
needed to support the gfx_passthru feature in libxl_pci.c,
in the libxl__grant_vga_iomem_permission function. The second
patch implements the removal of implicit permission to access
the PCI/VGA-related I/O memory and causes requests to access
such memory by a domain to be denied unless prior explicit
permission had been configured.

Specifically, the first patch adds 32 (0x20) pages of data starting at
memory address (0xa0000 >> XC_PAGE_SHIFT) (in pages) to the memory the
domain is permitted to access. XC_PAGE_SHIFT is 12, so this memory
range shows up in the logs when running Xen 4.5 as:

memory_map:add: dom1 gfn=a0 mfn=a0 nr=20

But my testing of these old patches with added custom logging
shows that another two pages are needed:

memory_map:access not permitted: dom1 gfn=fdffc mfn=cc490 nr=2

The patch for custom logging was against the Xen-4.5 branch after the
second of the aforementioned patches was committed to Xen 4.5-unstable.

Here is the patch (against Xen 4.5) for custom logging, and I would
recommend adding it to Xen so a message will be printed in the dmesg
buffer when a domain tries to access memory it is not allowed to
access:

--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -1033,7 +1033,12 @@ long 
do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
          ret = -EPERM;
          if ( !iomem_access_permitted(current->domain, mfn, mfn_end) ||
               !iomem_access_permitted(d, mfn, mfn_end) )
+        {
+            printk(XENLOG_G_WARNING
+                       "memory_map:access not permitted: dom%d gfn=%lx 
mfn=%lx nr=%lx\n",
+                       d->domain_id, gfn, mfn, nr_mfns);
              break;
+        }

          ret = xsm_iomem_mapping(XSM_HOOK, d, mfn, mfn_end, add);
          if ( ret )
snip ---------------------------------------------- snip

Further research showed that these two pages at 0xcc490 are for the
Intel IGD opregion, and because this memory is not permitted to be
accessed by the domain, the passthrough of an Intel IGD to a Linux
HVM domain fails, causing a crash of the Linux i915.ko kernel module
in the HVM domain. My testing, which was on a desktop with a Haswell
Intel CPU/IGD, confirmed that these two extra pages need to be
permitted in order for passthrough of the Intel IGD to a Linux
domain to work properly.

I find that adding two pages is enough to fix the problem, but I
have read in other places that the Opregion is actually three pages,
and maybe newer revisions of the Intel IGD do need three pages instead
of two. I am testing on a Haswell Intel chip, which is over 8 years old
now. So the patch I propose adds two pages, but I am not sure if
it should be three pages for newer Intel chips.

The failure to map this memory with gfx_passthru enabled
is therefore a bug, a regression that was introduced with the two
aforementioned patches way back in 2014 when Xen 4.5 was under
development.

Once I developed a patch, I did more testing with the traditional
Qemu device model and Debian's package of Xen-4.16 for Debian
sid/unstable after I discovered where this bug first appeared in
Xen 4.5-unstable back in 2014. In my testing, Windows HVM domains are
not affected by this bug and they function properly, most likely
because proprietary Intel graphics drivers for Windows are more
forgiving than the Linux open source drivers for Intel graphics
regarding the details of how Xen and Qemu configure the domain.

This bug still exists in current supported versions of Xen
because in Xen 4.16, passthrough of my Haswell Intel IGD to a Linux
domain still fails with a crash of the i915 Linux kernel module in
the Linux unprivileged domain when the traditional Qemu device model
is used in dom0. The patch at the end of this message fixes it.

I have not yet succeeded in reproducing this bug with the
upstream device model because there is another bug in Qemu
upstream that breaks passthrough of the Intel IGD to a Linux HVM
domU, so for now, to reproduce it, please use the traditional device
model.

Also, as a starting point to reproduce the bug, first get Intel IGD
passthrough to a Windows HVM domain using the Qemu traditional
device model working on Xen 4.16. Then replace the Windows HVM domain
with a Linux HVM domain, keeping everything else the same including
the Qemu traditional device model. I tested using a Debian 11.2
(bullseye) HVM domain and Debian sid/unstable with Xen 4.16 and
a build of the Qemu traditional device model from source as
provided on xenbits.xen.org

I am using a desktop computer and the xl toolstack and Xen as
packaged by Debian, except that I added the traditional device
model that Debian does not provide.

If you need more info, please let me know. I am not subscribed to
xen-devel so please cc me with your replies.

Regards,

Chuck

Here is the patch that fixes the bug on Debian sid/Xen 4.16:

--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -24,6 +24,7 @@
  #define PCI_OPTIONS            "msitranslate=%d,power_mgmt=%d"
  #define PCI_BDF_XSPATH         "%04x-%02x-%02x-%01x"
  #define PCI_PT_QDEV_ID         "pci-pt-%02x_%02x.%01x"
+#define PCI_INTEL_OPREGION     0xfc /* value defined in 
tools/firmware/hvmloader/pci_regs.h */

  static unsigned int pci_encode_bdf(libxl_device_pci *pci)
  {
@@ -640,6 +641,45 @@
  }

  /*
+ * This function assumes prior verification
+ * that pci is an Intel IGD device.
+ */
+static uint32_t sysfs_dev_get_igd_opregion(libxl__gc *gc, 
libxl_device_pci *pci)
+{
+    char *pci_device_vendor_path =
+            GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/config",
+                      pci->domain, pci->bus, pci->dev, pci->func);
+    size_t read_item;
+    uint32_t igd_opregion;
+
+    FILE *f = fopen(pci_device_vendor_path, "r");
+    if (!f) {
+        LOGE(ERROR,
+             "pci device "PCI_BDF" does not have config attribute",
+             pci->domain, pci->bus, pci->dev, pci->func);
+        return 0xffffffff;
+    }
+    if (fseek(f, PCI_INTEL_OPREGION, SEEK_SET)) {
+        LOGE(ERROR,
+             "pci device "PCI_BDF": cannot find igd-opregion address",
+             pci->domain, pci->bus, pci->dev, pci->func);
+        fclose(f);
+        return 0xffffffff;
+    }
+    read_item = fread(&igd_opregion, 4, 1, f);
+    fclose(f);
+
+    if (read_item != 1) {
+        LOGE(ERROR,
+             "cannot read igd-opresgion address of pci device "PCI_BDF,
+             pci->domain, pci->bus, pci->dev, pci->func);
+        return 0xffffffff;
+    }
+
+    return igd_opregion;
+}
+
+/*
   * A brief comment about slots.  I don't know what slots are for; however,
   * I have by experimentation determined:
   * - Before a device can be bound to pciback, its BDF must first be listed
@@ -2531,6 +2571,34 @@
                    domid, vga_iomem_start, (vga_iomem_start + 0x20 - 1));
              return ret;
          }
+
+        /* Allow access to Intel igd-opregion */
+        if (sysfs_dev_get_vendor(gc, pci) == 0x8086)
+        {
+            uint32_t igd_opregion = sysfs_dev_get_igd_opregion(gc, pci);
+            if (igd_opregion == 0xffffffff)
+                break;
+            vga_iomem_start = ((uint64_t)igd_opregion) >> XC_PAGE_SHIFT;
+            ret = xc_domain_iomem_permission(CTX->xch, stubdom_domid,
+                                             vga_iomem_start, 0x2, 1);
+            if (ret < 0) {
+                LOGED(ERROR, domid,
+                      "failed to give stubdom%d access to iomem range "
+                      "%"PRIx64"-%"PRIx64" for IGD passthru",
+                      stubdom_domid,
+                      vga_iomem_start, (vga_iomem_start + 0x2 - 1));
+                return ret;
+            }
+            ret = xc_domain_iomem_permission(CTX->xch, domid,
+                                             vga_iomem_start, 0x2, 1);
+            if (ret < 0) {
+                LOGED(ERROR, domid,
+                      "failed to give dom%d access to iomem range "
+                      "%"PRIx64"-%"PRIx64" for IGD passthru",
+                      domid, vga_iomem_start, (vga_iomem_start + 0x2 - 1));
+                return ret;
+            }
+        }
          break;
      }

snip ---------------------------------------------------- snip


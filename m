Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 334A956244
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 08:21:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg1Fk-000390-MT; Wed, 26 Jun 2019 06:17:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3S3C=UZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hg1Fj-00038v-KH
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 06:17:55 +0000
X-Inumbo-ID: 20e24a21-97da-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 20e24a21-97da-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 06:17:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 99377AD47;
 Wed, 26 Jun 2019 06:17:51 +0000 (UTC)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1906241135080.2468@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1906241146530.2468@sstabellini-ThinkPad-T480s>
From: Juergen Gross <jgross@suse.com>
Message-ID: <3c16614d-fc50-1899-709c-45f49eb156b1@suse.com>
Date: Wed, 26 Jun 2019 08:17:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906241146530.2468@sstabellini-ThinkPad-T480s>
Content-Type: multipart/mixed; boundary="------------A88EDCB51F4F367D8E5FCD3B"
Content-Language: de-DE
Subject: Re: [Xen-devel] PCI Passthrough bug with x86 HVM
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
Cc: wl@xen.org, andrew.cooper3@citrix.com, jbeulich@suse.com,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, chao.gao@intel.com,
 roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------A88EDCB51F4F367D8E5FCD3B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.06.19 20:47, Stefano Stabellini wrote:
> + xen-devel
> 
> On Mon, 24 Jun 2019, Stefano Stabellini wrote:
>> Hi all,
>>
>> I might have found a bug with PCI passthrough to a Linux HVM guest on
>> x86 with Xen 4.12. It is not easy for me to get access, and especially
>> change components, on this particular system, and I don't have access to
>> other x86 boxes at the moment, so apologies for the partial information
>> report. The setup is as follow:
>>
>> - two PCI devices have been assigned to a HVM guest, everything is fine
>> - reboot the guest from inside, i.e. `reboot' in Linux
>> - after the reboot completes, only one device is assigned
>>
>> Before the reboot, I see all the appropriate xenstore entries for both
>> devices. Everything is fine. After the reboot, I can only see the
>> xenstore entries of one device. It is as if the other device
>> "disappeared" without throwing any errors.
>>
>> Have you seen this before? Do you know if it has been fixed in staging?
>> I noticed this fix which seems to be very relevant:
>>
>> https://lists.xenproject.org/archives/html/xen-devel/2018-11/msg01616.html
>>
>> but it is already included in 4.12.

Stefano, could you please try the attached patch? It is only compile
tested for now.


Juergen

--------------A88EDCB51F4F367D8E5FCD3B
Content-Type: text/x-patch;
 name="0001-libxl-fix-pci-device-re-assigning-after-domain-reboo.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-libxl-fix-pci-device-re-assigning-after-domain-reboo.pa";
 filename*1="tch"

From ea95dcdfc60a895cc43baf34c8e0fb088e10008d Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>
Date: Wed, 26 Jun 2019 08:15:28 +0200
Subject: [PATCH] libxl: fix pci device re-assigning after domain reboot

After a reboot of a guest only the first pci device configuration will
be retrieved from Xenstore resulting in loss of any further assigned
passed through pci devices.

The main reason is that all passed through pci devices reside under a
common root device "0" in Xenstore. So when the device list is rebuilt
from Xenstore after a reboot the sub-devices below that root device
need to be selected instead of using the root device number as a
selector.

Fix that by adding a new member to struct libxl_device_type which when
set is used to get the number of devices. Add such a member for pci to
get the correct number of pci devices instead of implying it from the
number of pci root devices (which will always be 1).

While at it fix the type of libxl__device_pci_from_xs_be() to match
the one of the .from_xenstore member of struct libxl_device_type. This
fixes a latent bug checking the return value of a function returning
void.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libxl/libxl_device.c   | 24 +++++++++++++++++++-----
 tools/libxl/libxl_internal.h |  2 ++
 tools/libxl/libxl_pci.c      | 35 ++++++++++++++++++++++++++---------
 3 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/tools/libxl/libxl_device.c b/tools/libxl/libxl_device.c
index db6c0203b7..a2569102ee 100644
--- a/tools/libxl/libxl_device.c
+++ b/tools/libxl/libxl_device.c
@@ -2026,6 +2026,7 @@ void *libxl__device_list(libxl__gc *gc, const struct libxl_device_type *dt,
     char *libxl_path;
     char **dir = NULL;
     unsigned int ndirs = 0;
+    unsigned int ndevs = 0;
     int rc;
 
     *num = 0;
@@ -2037,21 +2038,34 @@ void *libxl__device_list(libxl__gc *gc, const struct libxl_device_type *dt,
     dir = libxl__xs_directory(gc, XBT_NULL, libxl_path, &ndirs);
 
     if (dir && ndirs) {
-        list = libxl__malloc(NOGC, dt->dev_elem_size * ndirs);
+        if (dt->get_num) {
+            if (ndirs != 1) {
+                LOGD(ERROR, domid, "multiple entries in %s\n", libxl_path);
+                rc = ERROR_FAIL;
+                goto out;
+            }
+            rc = dt->get_num(gc, GCSPRINTF("%s/%s", libxl_path, *dir), &ndevs);
+            if (rc) goto out;
+        } else {
+            ndevs = ndirs;
+        }
+        list = libxl__malloc(NOGC, dt->dev_elem_size * ndevs);
         item = list;
 
-        while (*num < ndirs) {
+        while (*num < ndevs) {
             dt->init(item);
-            ++(*num);
 
             if (dt->from_xenstore) {
+                int nr = dt->get_num ? *num : atoi(*dir);
                 char *device_libxl_path = GCSPRINTF("%s/%s", libxl_path, *dir);
-                rc = dt->from_xenstore(gc, device_libxl_path, atoi(*dir), item);
+                rc = dt->from_xenstore(gc, device_libxl_path, nr, item);
                 if (rc) goto out;
             }
 
             item = (uint8_t *)item + dt->dev_elem_size;
-            ++dir;
+            ++(*num);
+            if (!dt->get_num)
+                ++dir;
         }
     }
 
diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
index 3be5c644c1..a3102871f3 100644
--- a/tools/libxl/libxl_internal.h
+++ b/tools/libxl/libxl_internal.h
@@ -3707,6 +3707,7 @@ typedef void (*device_merge_fn_t)(libxl_ctx *, void *, void *);
 typedef int (*device_dm_needed_fn_t)(void *, unsigned);
 typedef void (*device_update_config_fn_t)(libxl__gc *, void *, void *);
 typedef int (*device_update_devid_fn_t)(libxl__gc *, uint32_t, void *);
+typedef int (*device_get_num_fn_t)(libxl__gc *, const char *, unsigned int *);
 typedef int (*device_from_xenstore_fn_t)(libxl__gc *, const char *,
                                          libxl_devid, void *);
 typedef int (*device_set_xenstore_config_fn_t)(libxl__gc *, uint32_t, void *,
@@ -3730,6 +3731,7 @@ struct libxl_device_type {
     device_dm_needed_fn_t           dm_needed;
     device_update_config_fn_t       update_config;
     device_update_devid_fn_t        update_devid;
+    device_get_num_fn_t             get_num;
     device_from_xenstore_fn_t       from_xenstore;
     device_set_xenstore_config_fn_t set_xenstore_config;
 };
diff --git a/tools/libxl/libxl_pci.c b/tools/libxl/libxl_pci.c
index 4ec6872798..03beb865d9 100644
--- a/tools/libxl/libxl_pci.c
+++ b/tools/libxl/libxl_pci.c
@@ -1547,12 +1547,13 @@ int libxl_device_pci_destroy(libxl_ctx *ctx, uint32_t domid,
     return AO_INPROGRESS;
 }
 
-static void libxl__device_pci_from_xs_be(libxl__gc *gc,
-                                         const char *be_path,
-                                         int nr, libxl_device_pci *pci)
+static int libxl__device_pci_from_xs_be(libxl__gc *gc,
+                                        const char *be_path,
+                                        libxl_devid nr, void *data)
 {
     char *s;
     unsigned int domain = 0, bus = 0, dev = 0, func = 0, vdevfn = 0;
+    libxl_device_pci *pci = data;
 
     s = libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/dev-%d", be_path, nr));
     sscanf(s, PCI_BDF, &domain, &bus, &dev, &func);
@@ -1582,24 +1583,39 @@ static void libxl__device_pci_from_xs_be(libxl__gc *gc,
             }
         } while ((p = strtok_r(NULL, ",=", &saveptr)) != NULL);
     }
+
+    return 0;
+}
+
+static int libxl__device_pci_get_num(libxl__gc *gc, const char *be_path,
+                                     unsigned int *num)
+{
+    char *num_devs;
+    int rc = 0;
+
+    num_devs = libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/num_devs", be_path));
+    if (!num_devs)
+        rc = ERROR_FAIL;
+    else
+        *num = atoi(num_devs);
+
+    return rc;
 }
 
 libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid, int *num)
 {
     GC_INIT(ctx);
-    char *be_path, *num_devs;
-    int n, i;
+    char *be_path;
+    unsigned int n, i;
     libxl_device_pci *pcidevs = NULL;
 
     *num = 0;
 
     be_path = libxl__domain_device_backend_path(gc, 0, domid, 0,
                                                 LIBXL__DEVICE_KIND_PCI);
-    num_devs = libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/num_devs", be_path));
-    if (!num_devs)
+    if (libxl__device_pci_get_num(gc, be_path, &n))
         goto out;
 
-    n = atoi(num_devs);
     pcidevs = calloc(n, sizeof(libxl_device_pci));
 
     for (i = 0; i < n; i++)
@@ -1688,7 +1704,8 @@ static int libxl_device_pci_compare(const libxl_device_pci *d1,
 #define libxl__device_pci_update_devid NULL
 
 DEFINE_DEVICE_TYPE_STRUCT_X(pcidev, pci, PCI,
-    .from_xenstore = (device_from_xenstore_fn_t)libxl__device_pci_from_xs_be,
+    .get_num = libxl__device_pci_get_num,
+    .from_xenstore = libxl__device_pci_from_xs_be,
 );
 
 /*
-- 
2.16.4


--------------A88EDCB51F4F367D8E5FCD3B
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------A88EDCB51F4F367D8E5FCD3B--


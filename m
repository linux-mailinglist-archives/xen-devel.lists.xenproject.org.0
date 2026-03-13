Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBTbC1g9tGmDjQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:37:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F0D2872AD
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:37:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1254052.1550066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15W4-0000QV-MW; Fri, 13 Mar 2026 16:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254052.1550066; Fri, 13 Mar 2026 16:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15W4-0000Nj-It; Fri, 13 Mar 2026 16:37:36 +0000
Received: by outflank-mailman (input) for mailman id 1254052;
 Fri, 13 Mar 2026 16:37:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L2ae=BN=bounce.vates.tech=bounce-md_30504962.69b43cb8.v1-fdb286a6cc10436981f303e25614d07d@srs-se1.protection.inumbo.net>)
 id 1w15Tn-0006Ek-Nt
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:35:15 +0000
Received: from mail134-15.atl141.mandrillapp.com
 (mail134-15.atl141.mandrillapp.com [198.2.134.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9952ad39-1efa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:35:08 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-15.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4fXVT42VDCzPm0V3t
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:35:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 fdb286a6cc10436981f303e25614d07d; Fri, 13 Mar 2026 16:35:04 +0000
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
X-Inumbo-ID: 9952ad39-1efa-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773419704; x=1773689704;
	bh=R5584u5biB3YH5gAUKEPnNqwevOZ2xVZukEW5ifg0cU=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=K8fmtxl4tV4VUw1ecE5JmTIfKzMctA4yaJpZEuc1zolpDAYI7O5Rh8nnqVu6/xuoA
	 Mxa9pKq6ieNdc0UnkXW6SBSZP+6O0kFSspQr8P7afj+tAgZIGgWjUt1u019whoLcLx
	 5vmN8WGf2+nkd+C9xFYZKUeQ4NgrqWsl3C9QornuBENSbfe6nfLDEa3jLE9madLfFK
	 SX4lx5l7vjQHKpRaXOkuiPVTv+UAfbpA3SDpNwsLW8iszld2OsHi+av65+yqqFE12L
	 lQKmnsfj/3uVXk3cs6oWY+7rj/jLuw5RzVeGJGK+MUH6rjIp55NvxJSJvboYkNxv53
	 mY06geEHGf4Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773419704; x=1773680204; i=thierry.escande@vates.tech;
	bh=R5584u5biB3YH5gAUKEPnNqwevOZ2xVZukEW5ifg0cU=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=wzVwF4Kn0wqWWPxDk4RbPZB5FJ9YfNjPsIDIxv8xSXqqtOhv8STPnZes+IhMa0W3p
	 I4baaUD7usvgCeooAE90QKR5luoUiZVHRPOjUaLTyGiKTV/GJVJErBIxg2fEiU5qCN
	 VTmlr1KFvJIS+xLMAA632t09nYEsFPg0OpdR1PpjQNnBlD3PdkNhQLyXBcQbXDcrYr
	 kcfeuGmrHxgmI06gVePzooylPkxuNfX3bQMYbKHUp5bxbEC53AuTyHX5bvc12w62Qv
	 kAtKGsK1MeQXx0VtUUAaXDlAEnMrWyR7a2ek+wYkNXEF8UwWu5O7aK88VwB7WtNX8A
	 gUTVu/DULUS5A==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=2012/17]=20libxl:=20Q35=20support=20(new=20option=20device=5Fmodel=5Fmachine)?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773419703641
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Alexey Gerasimenko" <x1917x@gmail.com>
Message-Id: <20260313163455.790692-13-thierry.escande@vates.tech>
In-Reply-To: <20260313163455.790692-1-thierry.escande@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.fdb286a6cc10436981f303e25614d07d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 16:35:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url,mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:x1917x@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vates.tech,suse.com,gmail.com];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	NEURAL_HAM(-0.00)[-0.101];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 94F0D2872AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Provide a new domain config option to select the emulated machine type,
device_model_machine. It has following possible values:
- "i440" - i440 emulation (default)
- "q35" - emulate a Q35 machine. By default, the storage interface is
AHCI.

Note that omitting device_model_machine parameter means i440 system
by default, so the default behavior doesn't change for existing domain
config files.

Setting device_model_machine to "q35" sends '-machine q35,accel=xen'
argument to QEMU. Unlike i440, there is no separated machine type to
enable/disable Xen platform device, it is controlled via a machine
property only. See 'libxl: Add xen-platform device for Q35 machine'
patch for a detailed description.

Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 tools/libs/light/libxl_dm.c      | 16 ++++++++++------
 tools/libs/light/libxl_types.idl |  7 +++++++
 tools/xl/xl_parse.c              | 14 ++++++++++++++
 3 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 511ec76a65..36f2813cde 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1562,13 +1562,17 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             flexarray_append(dm_args, b_info->extra_pv[i]);
         break;
     case LIBXL_DOMAIN_TYPE_HVM:
-        if (!libxl_defbool_val(b_info->u.hvm.xen_platform_pci)) {
-            /* Switching here to the machine "pc" which does not add
-             * the xen-platform device instead of the default "xenfv" machine.
-             */
-            machinearg = libxl__strdup(gc, "pc,accel=xen,suppress-vmdesc=on");
+        if (b_info->device_model_machine == LIBXL_DEVICE_MODEL_MACHINE_Q35) {
+            machinearg = libxl__sprintf(gc, "q35,accel=xen");
         } else {
-            machinearg = libxl__strdup(gc, "xenfv,suppress-vmdesc=on");
+            if (!libxl_defbool_val(b_info->u.hvm.xen_platform_pci)) {
+                /* Switching here to the machine "pc" which does not add
+                 * the xen-platform device instead of the default "xenfv" machine.
+                 */
+                machinearg = libxl__strdup(gc, "pc,accel=xen,suppress-vmdesc=on");
+            } else {
+                machinearg = libxl__strdup(gc, "xenfv,suppress-vmdesc=on");
+            }
         }
         if (b_info->u.hvm.mmio_hole_memkb) {
             uint64_t max_ram_below_4g = (1ULL << 32) -
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index d64a573ff3..f9cd881b66 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -109,6 +109,12 @@ libxl_device_model_version = Enumeration("device_model_version", [
     (2, "QEMU_XEN"),             # Upstream based qemu-xen device model
     ])
 
+libxl_device_model_machine = Enumeration("device_model_machine", [
+    (0, "UNKNOWN"),
+    (1, "I440"),
+    (2, "Q35"),
+    ])
+
 libxl_console_type = Enumeration("console_type", [
     (0, "UNKNOWN"),
     (1, "SERIAL"),
@@ -613,6 +619,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("device_model_ssidref", uint32),
     ("device_model_ssid_label", string),
     ("device_model_user", string),
+    ("device_model_machine", libxl_device_model_machine),
 
     # extra parameters pass directly to qemu, NULL terminated
     ("extra",            libxl_string_list),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1a2ea8b5d5..a4346d1693 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2813,6 +2813,20 @@ skip_usbdev:
     if (!xlu_cfg_get_long (config, "stubdomain_memory", &l, 0))
         b_info->stubdomain_memkb = l * 1024;
 
+    if (!xlu_cfg_get_string (config, "device_model_machine", &buf, 0)) {
+        if (!strcmp(buf, "i440")) {
+            b_info->device_model_machine = LIBXL_DEVICE_MODEL_MACHINE_I440;
+        } else if (!strcmp(buf, "q35")) {
+            b_info->device_model_machine = LIBXL_DEVICE_MODEL_MACHINE_Q35;
+        } else {
+            fprintf(stderr,
+                    "Unknown device_model_machine \"%s\" specified\n", buf);
+            exit(1);
+        }
+    } else {
+        b_info->device_model_machine = LIBXL_DEVICE_MODEL_MACHINE_UNKNOWN;
+    }
+
 #define parse_extra_args(type)                                            \
     e = xlu_cfg_get_list_as_string_list(config, "device_model_args"#type, \
                                     &b_info->extra##type, 0);            \
-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



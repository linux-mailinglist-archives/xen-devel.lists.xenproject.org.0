Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wI+MCnQR2WlClwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:04:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D05D53D8E4A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:04:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279250.1563772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBDOq-0004Ea-Fc; Fri, 10 Apr 2026 15:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279250.1563772; Fri, 10 Apr 2026 15:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBDOq-0004CP-CM; Fri, 10 Apr 2026 15:04:00 +0000
Received: by outflank-mailman (input) for mailman id 1279250;
 Fri, 10 Apr 2026 15:03:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69d9115d.v1-ae297a03d26745569ddf3718bc0d083e@bounce.vates.tech>)
 id 1wBDOp-0004Bg-D4
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 15:03:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBDOo-005QoJ-PA
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 17:03:58 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69d9115d.v1-ae297a03d26745569ddf3718bc0d083e@bounce.vates.tech>)
 id 69d91149-2eae-0a2a0a5409dd-0a2a450cc890-40
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:03:58 +0200
Received: from [198.2.187.1] (helo=mail187-1.suw11.mandrillapp.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69d9115d.v1-ae297a03d26745569ddf3718bc0d083e@bounce.vates.tech>)
 id 69d9115d-f40c-0a2a450c0019-c602bb010fbb-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:03:58 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-1.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4fsg711hcRzBsV1YM
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 15:03:57 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ae297a03d26745569ddf3718bc0d083e; Fri, 10 Apr 2026 15:03:57 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="thierry.escande@vates.tech" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1775833437; x=1776103437;
	bh=4VJ9kFlhw+z/hCTPHjAS7qoiehNMI6uP2dnFVadsX98=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=rOyEwxwfdzr2WAEhRbG1wQYqHTDcK1+Ek+YCL2xrEq9PFzvC4m6aQkYHryYu8w392
	 2FwsCNLN5wQun3upCzZLVe9+H3zGIZkNPm+uXll6/5b1itWHmMSXDNwgOJjobHIvzZ
	 tbBQ7ElfPQuPRkq8m6AJnu2bxWKqjLrJ/cI+NBkICYRhNraAiLFOPNgdda1DehIQNZ
	 2OcpXnqmiMKzAWd/jousYC4mqzgORsdaKkwLw++Mb/oMdk69q1h5cXYMnbQ67Sch8k
	 ceuLYk5lZ7/RtQxeouGiZ7bJGT2B3GratzE/DWgyVH45/MSg+b+g9/hpWwm4+Ar5F2
	 IVpT6Kx9q72cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1775833437; x=1776093937; i=thierry.escande@vates.tech;
	bh=4VJ9kFlhw+z/hCTPHjAS7qoiehNMI6uP2dnFVadsX98=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=c4iVO3EKMywAXCLcVDfmnTSyDn6d4QWuuKZUDBgrjwPpPPjfZdttf6Aqbc4Z96GOL
	 UXrOlN+nktiO+fKeR3c3sB5ogfmp6iZCatEwrNmVycswLpSZdOtPZWHyv+qFsrqho4
	 CDDorczrMHpj7qPcCWM2PyfL94N99Dcpmh4q56Rc7qBFP3bo4pRKBXVJtD1ZbmG4dP
	 6xaOWT+DBQFd7NEu95HA7voF5H7Cs6FSAzbXw9SfZFNSTO58hhXgNkIu1oHTqzIjMJ
	 ozYJ1G94JKLA4P/viDMhVUZKNVBYtYFQnYkKEe+fZRGEOOlwiyt7X8JpJDybbxMiCp
	 i144Qv6Vu+Jzw==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v3=202/3]=20libxl:=20Allow=20PCI=20device=20passthrough=20using=20-device=20Qemu=20command=20line?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1775833436555
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "=?utf-8?Q?Daniel=20P=20.=20Berrang=C3=A9?=" <berrange@redhat.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <20260410150333.1533568-3-thierry.escande@vates.tech>
In-Reply-To: <20260410150333.1533568-1-thierry.escande@vates.tech>
References: <20260410150333.1533568-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ae297a03d26745569ddf3718bc0d083e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260410:md
Date: Fri, 10 Apr 2026 15:03:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1775833438-FE350A3D-E2F968E1/0/0
X-purgate-type: clean
X-purgate-size: 12267
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:berrange@redhat.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	NEURAL_HAM(-0.00)[-0.893];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D05D53D8E4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This change makes use of the new option 'hotplug' for host PCI devices
passthrough'd to the guest. If hotplug=0 is used in the pci device
configuration table, the device will be attached to the guest using the
Qemu command line as '-device xen-pci-passthrough,hostaddr=...'

The host device configuration is passed to the -device option as a json
array, just like it's done for hotplug using QMP. The json array is
created by a new internal function libxl__device_pci_get_qmp_json() that
is also used by pci_add_qmp_device_add().

Then, instead of sending the 'device_add' command, the device_add
callback is called to perform the 'query-pci' check to make sure the
passthrough'd device is present.

In the same way at shutdown, the device is not removed using QMP and
only the pci_remove_done() function is called.

As with QMP, the use of the 'hotplug=0' option honors the 'seize' option
by adding the PCI device to the assignable list if needed. This mimics
what is done in libxl__device_pci_add() with regards to seize option and
the assignable PCI device list. This allows to display a proper error
message if the device is not assignable before Qemu starts.
To do so the function pciback_dev_is_assigned() has been renamed as
libxl__pciback_dev_is_assigned() and made available internally, as well
as libxl__device_pci_assignable_add(). Also, libxl_pci_assignable() is
now exported in libxl.h and renamed as libxl_device_pci_assignable()
since its prototype looks like the other libxl_device_pci_*() APIs.

Example use:
 pci = [ "00:03.0,seize=1,hotplug=0" ]

Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
v2:
- Add support for YAJL json parser

v3:
- Move code block for device command line parameters creation to a
  correct place.
- Better handling of PCI device assignation check to display the correct
  error message if the device is not assignable.
---
 tools/include/libxl.h             |  1 +
 tools/libs/light/libxl_dm.c       | 85 +++++++++++++++++++++++++++++++
 tools/libs/light/libxl_internal.h |  7 +++
 tools/libs/light/libxl_pci.c      | 57 ++++++++++++++-------
 4 files changed, 132 insertions(+), 18 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 7c098edab6..efd2664a90 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -2666,6 +2666,7 @@ int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pci, int r
 int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci *pci, int rebind);
 libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num);
 void libxl_device_pci_assignable_list_free(libxl_device_pci *list, int num);
+bool libxl_device_pci_assignable(libxl_ctx *ctx, libxl_device_pci *pci);
 
 /* CPUID handling */
 int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str);
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 511ec76a65..28e4adbd4f 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1798,6 +1798,91 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             break;
         }
 
+        if (guest_config->num_pcidevs) {
+            libxl_device_pci *pci;
+            libxl__json_object *qmp_json;
+            char *json_str;
+#ifdef HAVE_LIBJSONC
+            json_object *jso;
+            const char *buf;
+#elif defined(HAVE_LIBYAJL)
+            yajl_gen hand;
+            /* memory for 'buf' is owned by 'hand' */
+            const unsigned char *buf;
+            libxl_yajl_length len;
+#else
+#           error Missing JSON library
+#endif
+
+            for (i = 0; i < guest_config->num_pcidevs; i++) {
+                pci = &guest_config->pcidevs[i];
+
+                if (pci->hotplug)
+                    continue;
+
+                if (pci->seize && !libxl__pciback_dev_is_assigned(gc, pci)) {
+                    rc = libxl__device_pci_assignable_add(gc, pci, 1);
+                    if (rc)
+                        return rc;
+                }
+
+                if (!libxl_device_pci_assignable(libxl__gc_owner(gc), pci)) {
+                    LOGD(ERROR, guest_domid, "PCI device %x:%x:%x.%x is not assignable",
+                         pci->domain, pci->bus, pci->dev, pci->func);
+                    return ERROR_FAIL;
+                }
+
+                qmp_json = libxl__device_pci_get_qmp_json(gc, pci);
+
+#ifdef HAVE_LIBJSONC
+                rc = libxl__json_object_to_json_object(gc, &jso, qmp_json);
+                if (rc)
+                    return rc;
+
+                buf = json_object_to_json_string_ext(jso,
+                                                     JSON_C_TO_STRING_PLAIN);
+                if (!buf) {
+                    json_object_put(jso);
+                    return ERROR_NOMEM;
+                }
+#elif defined(HAVE_LIBYAJL)
+                hand = libxl_yajl_gen_alloc(NULL);
+                if (!hand) {
+                    return ERROR_NOMEM;
+                }
+#if HAVE_YAJL_V2
+                /* Disable beautify for data sent to QEMU */
+                yajl_gen_config(hand, yajl_gen_beautify, 0);
+#endif
+
+                rc = libxl__json_object_to_yajl_gen(gc, hand, qmp_json);
+                if (rc) {
+                    yajl_gen_free(hand);
+                    return rc;
+                }
+
+                rc = yajl_gen_get_buf(hand, &buf, &len);
+                if (rc != yajl_gen_status_ok) {
+                    yajl_gen_free(hand);
+                    return rc;
+                }
+#endif
+
+                json_str = libxl__strdup(gc, (const char *)buf);
+                if (json_str)
+                    flexarray_vappend(dm_args, "-device", json_str, NULL);
+
+#ifdef HAVE_LIBJSONC
+                json_object_put(jso);
+#elif defined(HAVE_LIBYAJL)
+                yajl_gen_free(hand);
+#endif
+
+                if (!json_str)
+                    return ERROR_NOMEM;
+            }
+        }
+
         if (state->dm_runas) {
             if (qemu_opts->have_runwith_user) {
                 flexarray_append_pair(dm_args, "-run-with",
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index b65e0064b9..cab2ab4526 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -1729,6 +1729,13 @@ _hidden int libxl__device_pci_setdefault(libxl__gc *gc, uint32_t domid,
                                          libxl_device_pci *pci, bool hotplug);
 _hidden bool libxl__is_igd_vga_passthru(libxl__gc *gc,
                                         const libxl_domain_config *d_config);
+_hidden libxl__json_object *libxl__device_pci_get_qmp_json(libxl__gc *gc,
+                                                         libxl_device_pci *pci);
+_hidden int libxl__pciback_dev_is_assigned(libxl__gc *gc,
+                                           libxl_device_pci *pci);
+_hidden int libxl__device_pci_assignable_add(libxl__gc *gc,
+                                             libxl_device_pci *pci,
+                                             int rebind);
 
 /* from libxl_dtdev */
 
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 49d272d0de..07d005e71d 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -686,7 +686,7 @@ out:
     return rc;
 }
 
-static int pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pci)
+int libxl__pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pci)
 {
     char * spath;
     int rc;
@@ -755,9 +755,9 @@ static int pciback_dev_unassign(libxl__gc *gc, libxl_device_pci *pci)
     return 0;
 }
 
-static int libxl__device_pci_assignable_add(libxl__gc *gc,
-                                            libxl_device_pci *pci,
-                                            int rebind)
+int libxl__device_pci_assignable_add(libxl__gc *gc,
+                                     libxl_device_pci *pci,
+                                     int rebind)
 {
     libxl_ctx *ctx = libxl__gc_owner(gc);
     unsigned dom, bus, dev, func;
@@ -798,7 +798,7 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
     }
 
     /* Check to see if it's already assigned to pciback */
-    rc = pciback_dev_is_assigned(gc, pci);
+    rc = libxl__pciback_dev_is_assigned(gc, pci);
     if ( rc < 0 ) {
         return ERROR_FAIL;
     }
@@ -913,7 +913,7 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
     }
 
     /* Unbind from pciback */
-    if ( (rc = pciback_dev_is_assigned(gc, pci)) < 0 ) {
+    if ( (rc = libxl__pciback_dev_is_assigned(gc, pci)) < 0 ) {
         return ERROR_FAIL;
     } else if ( rc ) {
         pciback_dev_unassign(gc, pci);
@@ -1098,16 +1098,10 @@ out:
     pci_add_dm_done(egc, pas, rc); /* must be last */
 }
 
-static void pci_add_qmp_device_add(libxl__egc *egc, pci_add_state *pas)
+libxl__json_object *libxl__device_pci_get_qmp_json(libxl__gc *gc,
+                                                   libxl_device_pci *pci)
 {
-    STATE_AO_GC(pas->aodev->ao);
     libxl__json_object *args = NULL;
-    int rc;
-
-    /* Convenience aliases */
-    libxl_domid domid = pas->domid;
-    libxl_device_pci *pci = &pas->pci;
-    libxl__ev_qmp *const qmp = &pas->qmp;
 
     libxl__qmp_param_add_string(gc, &args, "driver",
                                 "xen-pci-passthrough");
@@ -1134,11 +1128,30 @@ static void pci_add_qmp_device_add(libxl__egc *egc, pci_add_state *pas)
     if (pci->permissive)
         libxl__qmp_param_add_bool(gc, &args, "permissive", true);
 
+    return args;
+}
+
+static void pci_add_qmp_device_add(libxl__egc *egc, pci_add_state *pas)
+{
+    STATE_AO_GC(pas->aodev->ao);
+    libxl__json_object *args = NULL;
+    int rc = 0;
+
+    /* Convenience aliases */
+    libxl_domid domid = pas->domid;
+    libxl_device_pci *pci = &pas->pci;
+    libxl__ev_qmp *const qmp = &pas->qmp;
+
+    args = libxl__device_pci_get_qmp_json(gc, pci);
+
     qmp->ao = pas->aodev->ao;
     qmp->domid = domid;
     qmp->payload_fd = -1;
     qmp->callback = pci_add_qmp_device_add_cb;
-    rc = libxl__ev_qmp_send(egc, qmp, "device_add", args);
+    if (pci->hotplug)
+        rc = libxl__ev_qmp_send(egc, qmp, "device_add", args);
+    else
+        pci_add_qmp_device_add_cb(egc, qmp, NULL, 0);
     if (rc) goto out;
     return;
 
@@ -1509,7 +1522,7 @@ int libxl_device_pci_add(libxl_ctx *ctx, uint32_t domid,
     return AO_INPROGRESS;
 }
 
-static bool libxl_pci_assignable(libxl_ctx *ctx, libxl_device_pci *pci)
+bool libxl_device_pci_assignable(libxl_ctx *ctx, libxl_device_pci *pci)
 {
     libxl_device_pci *pcis;
     int num;
@@ -1572,13 +1585,13 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
     rc = libxl__device_pci_setdefault(gc, domid, pci, !starting);
     if (rc) goto out;
 
-    if (pci->seize && !pciback_dev_is_assigned(gc, pci)) {
+    if (pci->seize && !libxl__pciback_dev_is_assigned(gc, pci)) {
         rc = libxl__device_pci_assignable_add(gc, pci, 1);
         if ( rc )
             goto out;
     }
 
-    if (!libxl_pci_assignable(ctx, pci)) {
+    if (!libxl_device_pci_assignable(ctx, pci)) {
         LOGD(ERROR, domid, "PCI device %x:%x:%x.%x is not assignable",
              pci->domain, pci->bus, pci->dev, pci->func);
         rc = ERROR_FAIL;
@@ -1820,6 +1833,14 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
     libxl_domain_type type = libxl__domain_type(gc, domid);
     libxl_device_pci *pci = &prs->pci;
     int rc, num;
+
+    /* Passthrough'd device has been passed to Qemu command line so there is
+     * no need to remove it via QMP */
+    if (!pci->hotplug) {
+        pci_remove_done(egc, prs, 0);
+        return;
+    }
+
     pcis = libxl_device_pci_list(ctx, domid, &num);
     if (!pcis) {
         rc = ERROR_FAIL;
-- 
2.53.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



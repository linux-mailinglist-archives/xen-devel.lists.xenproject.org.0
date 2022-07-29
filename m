Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 392FF5854CB
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 19:54:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377687.610989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHUBg-0006sZ-Ef; Fri, 29 Jul 2022 17:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377687.610989; Fri, 29 Jul 2022 17:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHUBg-0006pj-Aa; Fri, 29 Jul 2022 17:54:12 +0000
Received: by outflank-mailman (input) for mailman id 377687;
 Fri, 29 Jul 2022 17:54:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UihI=YC=citrix.com=prvs=202bfa127=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oHUBf-0006a9-6e
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 17:54:11 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71941a78-0f67-11ed-924f-1f966e50362f;
 Fri, 29 Jul 2022 19:54:09 +0200 (CEST)
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
X-Inumbo-ID: 71941a78-0f67-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659117249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VVD7G2LkVyNCzG/pHfe/kdLkRc8BoThzx8VPlS+iO60=;
  b=YlqEghSfC2dVITCfFJAh5TgyqqcIvFxtfI9TopN5DDx9N19z1CvPmmDF
   Oa5m4n6LAajMMLgUdw6X1+teSKVS5ypDt4/NfmgfVueVtg5OAJZLkkDTZ
   1JspD7BlueJ01fLM0vC1obExgEb3DOugM1yjjeUyZzndj9iUqqryoR2Vx
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76954906
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AfIy9p67Lxj81PkSfPwyxlgxR2vbMJaxDgicv2?=
 =?us-ascii?q?9bJVGNS3hzvzP4wXsRDTujRkuZqZDvb7yzGW0cUVF/XAW5zYYN0QI0iEgVdH?=
 =?us-ascii?q?alNNuE0JwZLfNgEvJfZhRHGoA4rYvCxxwf6MU/QvLN2GFB/zkPdL0Otk0MyZ?=
 =?us-ascii?q?8oTFLw3Hls8CtaUNQ2PKE6Stmcd7MkJoJLIo/zZhfLCG5ViXUDWnaHGg3yku?=
 =?us-ascii?q?wsATahAcdWKHbmZkmUkBzHbD5HkMeAv+fgf3YWQC0bYeJ7K/+0BmEjGvgyvU?=
 =?us-ascii?q?mCrvGXKMz5YOaEMiQUyAnuQrAZJuLVTDomDnj7lTWD3wB06U9lXJ2WkNZe/g?=
 =?us-ascii?q?yMO/tQWkac92fYRWHI5nLvf3fRhKVoZjhxI+8pZA018VmCqvbqJOpq75ZBxu?=
 =?us-ascii?q?W8VCuvVUxo5aFwC1cmz69W9LMk4Tqg/wQeLhbq5uZZKUNtZJ1YcRvE0HX3E+?=
 =?us-ascii?q?IsVDSzJyLV3lTqXt8r889jziweWKhFl5D2LsccW0gGdAImQVHMrCXFgu9wRu?=
 =?us-ascii?q?DeS0INK4lIZ5SSzlHiolQI4N0UgV+TQA+N9f8k34d81p7G+vOBCYV6x7JUAK?=
 =?us-ascii?q?CnsaIFEFzRZyXTZzodvknl1INy1BToPaKqpFZ8Q8uvna5pSoE3aAI9Hp4jqO?=
 =?us-ascii?q?nOB8X8GncY99nJcP8sjmlKGqtTR2u2DFuTrA8fTWUGu0HQ51bOqIdV6PmjDO?=
 =?us-ascii?q?G8Kx2ckT0Ao0xOL93YL68KvvDmPcHKhfCnpA87GwOWD4pib8eAc/BDtimUAw?=
 =?us-ascii?q?3sOAFGHiMGwHVyZOoESxcj1m3b3wBjsCvTEL1NaMGOm5k6utiB7evHtREQvT?=
 =?us-ascii?q?5I9iHwXYsSt4MvpC9zRL3VmMCaBfuDRJkdr6WWIjp5DzOlR/F4sZp6Iv5/kz?=
 =?us-ascii?q?X6LOchdZcL1JeMrLEt0Gw6YpnrgEXFfBuI+ysGad6o/oFlHrbnOho2vEFB3c?=
 =?us-ascii?q?ul0/WKsdGrvpFNmjaSfbkESpY71xJo6qTLMi0RAi9Rbv+GpTpQoqhJBpWWrv?=
 =?us-ascii?q?qWOeDMhb5UbXUBfWg/Ag6dUXnus4aT9MQWeFhqFsWzotA6BmaaR0wf3HOyot?=
 =?us-ascii?q?t5Ydk/Fr8haCWSiu9ldUJdGsk1Ij9BUVcWFe9lISCiPZ7Db0I3qjMT5pqV5k?=
 =?us-ascii?q?0uihnWGS67O2u8YzcnZ2ULFvNSURqPsANr0ejSUv/rY63PmkE3ib+MomOAEj?=
 =?us-ascii?q?7sSkbtLNlG4qLTmywdtwN3nqM4rpZMiBrYMSVQY0mlfX0++EohVI0N23MbAU?=
 =?us-ascii?q?/RLAAYd9AWB3+G6L5y6o2jW6Kftos7lNbwKc/vWgAk/RuDGT/g0QLkaoKHcn?=
 =?us-ascii?q?s27Zgdn32+ucmh08g8YC49tM5IRay6yZBvm2F8mLVFt3oADGStIjcJsoRja3?=
 =?us-ascii?q?G5t7Azc/ZlLxgPRWATFB8s0tw1tsNdAjKIlzC5oz/R/sxZj2Jl+Kox72jmkd?=
 =?us-ascii?q?TKr1bcbaA3B/2B9ASfSTP2k1R88cw4nZ1ZIivLf3RAHeFuP9SGYeTH93kRYN?=
 =?us-ascii?q?n/HvcxY3WuiPidbyPwLVpaqQSjzKoc2SckDoGUlwIKHAKSGRw0ao2hPuCpCn?=
 =?us-ascii?q?51nKg0Z1tyPb5jbAqNWuMF2Cxh4dxACBO0ufDFUGc9GDFqtma0xxGuwyuzw7?=
 =?us-ascii?q?Ma47UXjcxk35hy3cgPROotxhThul8tIJIDV5f2zD+ED1CWLlfr4NDNF0603u?=
 =?us-ascii?q?24Dbr/HADikB+M/WI6N8DRO/u2eHg5AFdzW3vOIvmNKUkLqiFXkKh/2RzTnv?=
 =?us-ascii?q?nz5YHye6VDnJNcbxvEGwd1CCAs3H80/oyZX5zI60SXef3janVH6Swe35VS19?=
 =?us-ascii?q?bz7UzYBJAl6ROC/uwlmLkw93tvJTTpHwgf9aQfB+uW5myV0lQrHSszN5rZC0?=
 =?us-ascii?q?zro6YqUE6xuuRcfrrXPfmumeeWshQROTnspLwvpd1uzua9o46d0K6bzYDn4b?=
 =?us-ascii?q?3ncssKwNKiOyfdIFZLaXiQlWdh2X5hVqtEvhadRd02YgHeIAy2DzTfic2tt3?=
 =?us-ascii?q?7wM0/4QWfvQZgZGu2zfxq1/VS5jtvG/wrdcb5MnNiMM/I6exdMJU7siOLhDw?=
 =?us-ascii?q?B2C5I7un/T5CFqDHw4MQD2KIvP1bnffpYAssx2moWqM+YG7gnfgzI1nzrvD9?=
 =?us-ascii?q?HEz32o17Mdb0WKGfXv/Q4ADYrTbCwJ0F+uFWFxp6Ckhpq5RMDAsgDwLK3pOf?=
 =?us-ascii?q?mvhLsSU7coS2tctR+ahp2tCDM4vWagaX8y+phT1BPFEDjZTp/8JScugZKdoj?=
 =?us-ascii?q?407IaAVYX98noa+Hy3AA5ljQxxayw0VfPQ5xHAhChRZbwGAIagMCarxT605e?=
 =?us-ascii?q?GTYBIMv1esRUfdMHnIhWAlh6FotFMd1MGPK57wHfve2mPHXEHykj/kkiGr+7?=
 =?us-ascii?q?Z8VZwTAn5NpGRH7d8E/LL2nG9fIXAQKX4YwnwHH/kpAwBdrfi17AHtt3FSMP?=
 =?us-ascii?q?WzOI/Crnw/FxPZjWwlwAwPTFXaRLgqK3JPprjWBXlQTQDFHk9hqWrg4Fxwre?=
 =?us-ascii?q?YM3HMGiqsY4T36utjlBgDIAUrgLHrEePNAWZDxTgT3yB5MhIvwqWMzgZWxzS?=
 =?us-ascii?q?85CXAWiRqqj9P4eVYRNw/8ES788AMhITprxWrZXe4+hYTTaAmYPjAB1Su9nk?=
 =?us-ascii?q?LSGPQA7m0SNdAd9+In73OBwZyc451G5p6wFLaB4oiKvMHzIqytInEqGvMVkK?=
 =?us-ascii?q?ip2K/aK5txyHd4ATXvpJaYw08l46NqzQv0L3qewrMBAIIzFkrCGQ521ZDKl1?=
 =?us-ascii?q?N/R3dPVnK5298k=3D?=
X-IronPort-AV: E=Sophos;i="5.93,201,1654574400"; 
   d="scan'208";a="76954906"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 7/7] tools/ocaml/libs/eventchn: do not leak event channels and OCaml 5.0 compat
Date: Fri, 29 Jul 2022 18:53:30 +0100
Message-ID: <6e5fd9edfea379b69682fa538141298fc1bc3110.1659116941.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1659116941.git.edvin.torok@citrix.com>
References: <cover.1659116941.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Add a finalizer on the event channel value, so that it calls
`xenevtchn_close` when the value would be GCed.

In practice oxenstored seems to be the only user of this,
and it creates a single global event channel only,
but freeing this could still be useful when run with OCAMLRUNPARAM=c

The code was previously casting a C pointer to an OCaml value,
which should be avoided: OCaml 5.0 won't support it.
(all "naked" C pointers must be wrapped inside an OCaml value,
 either an Abstract tag, or Nativeint, see the manual
 https://ocaml.org/manual/intfc.html#ss:c-outside-head)

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/libs/eventchn/xeneventchn_stubs.c | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/libs/eventchn/xeneventchn_stubs.c b/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
index f889a7a2e4..c0d57e2954 100644
--- a/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
+++ b/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
@@ -33,7 +33,30 @@
 #include <caml/fail.h>
 #include <caml/signals.h>
 
-#define _H(__h) ((xenevtchn_handle *)(__h))
+/* We want to close the event channel when it is no longer in use,
+   which can only be done safely with a finalizer.
+   Event channels are typically long lived, so we don't need tighter control over resource deallocation.
+   Use a custom block
+*/
+
+/* Access the xenevtchn_t* part of the OCaml custom block */
+#define _H(__h) (*((xenevtchn_handle**)Data_custom_val(__h)))
+
+static void stub_evtchn_finalize(value v)
+{
+	/* docs say to not use any CAMLparam* macros here */
+	xenevtchn_close(_H(v));
+}
+
+static struct custom_operations xenevtchn_ops = {
+	"xenevtchn",
+	stub_evtchn_finalize,
+	custom_compare_default, /* raises Failure, cannot compare */
+	custom_hash_default, /* ignored */
+	custom_serialize_default, /* raises Failure, can't serialize */
+	custom_deserialize_default, /* raises Failure, can't deserialize */
+	custom_compare_ext_default /* raises Failure */
+};
 
 CAMLprim value stub_eventchn_init(void)
 {
@@ -48,7 +71,9 @@ CAMLprim value stub_eventchn_init(void)
 	if (xce == NULL)
 		caml_failwith("open failed");
 
-	result = (value)xce;
+	/* contains file descriptors, trigger full GC at least every 128 allocations */
+	result = caml_alloc_custom(&xenevtchn_ops, sizeof(xce), 1, 128);
+	_H(result) = xce;
 	CAMLreturn(result);
 }
 
-- 
2.34.1



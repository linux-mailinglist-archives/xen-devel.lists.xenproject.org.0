Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBVJJ3MR2Wl+lggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:04:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F233D8E41
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279248.1563764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBDOk-0003y5-9h; Fri, 10 Apr 2026 15:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279248.1563764; Fri, 10 Apr 2026 15:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBDOk-0003vw-65; Fri, 10 Apr 2026 15:03:54 +0000
Received: by outflank-mailman (input) for mailman id 1279248;
 Fri, 10 Apr 2026 15:03:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69d91157.v1-1b7cd7e0c2ad488cb44a75c9c4b1170f@bounce.vates.tech>)
 id 1wBDOj-0003vZ-FE
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 15:03:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBDOi-005QoJ-RW
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 17:03:52 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69d91157.v1-1b7cd7e0c2ad488cb44a75c9c4b1170f@bounce.vates.tech>)
 id 69d91139-2eae-0a2a0a5409dd-0a2a4505b1c6-40
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:03:52 +0200
Received: from [198.2.187.14] (helo=mail187-14.suw11.mandrillapp.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69d91157.v1-1b7cd7e0c2ad488cb44a75c9c4b1170f@bounce.vates.tech>)
 id 69d91157-3760-0a2a45050019-c602bb0e37d9-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:03:52 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-14.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fsg6v1yD1z8XS3x7
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 15:03:51 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1b7cd7e0c2ad488cb44a75c9c4b1170f; Fri, 10 Apr 2026 15:03:51 +0000
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
	s=mte1; t=1775833431; x=1776103431;
	bh=ZKqdPVMpXtT8gh10Bvf+Ia+b2oBjvpMt/gEGKWUOgWA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=RUzm0ypYZjsM3tjwMqQz4NY8RCCsHtMq4taK9jd5PbHnE4fDNACX3iodyNqT9E0GG
	 JC+KNLn/3gN0O2zq7Q/f/+dOlYK+OgJa0KvUMkZf+2EG2tQYHeEeo+TrHtAEV34tKn
	 1CBqFJhXfpTVAQN7So4S53WnSFXZRY3/EvKSO0l5Ev+RC3p78x0KkwiGRaNYOA2VnC
	 tBggTYyI47X9ia6mknJvnFF8ZpBN7DsLmI49maNZ2avy5GJN2hppyAOnmsoFq48mX7
	 t15nokIppoTzQDTA0SEA+w9wXENzF0zl18CAtettO1JAS6V6taWGa2ZXNDA3Q5NePg
	 QEqfgUXtzclUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1775833431; x=1776093931; i=thierry.escande@vates.tech;
	bh=ZKqdPVMpXtT8gh10Bvf+Ia+b2oBjvpMt/gEGKWUOgWA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=RjJqQVaLkMAOrIZEXjjR3KIvv/y7fZaSbBkwtlQX7gXji2yo2x6LtVxKP827PQz0t
	 qlsPnEs/Ih56CkDGdd/jITaHWr/Qp3bl6G3pZPL7W52NVypXVupJSE4+IDJ8xPNlrt
	 KJnFngeOVLU38/xH495ANIhQBrAqk68S409xwDQIs4z+xNzbcufYkWZIn3d7hSNSdg
	 DJIjir1GUbzCegIrCr7NLavlIP53Syw3eFpyPRIrfUIYKajyMGVereUnkCYOy8bxO/
	 8LkRdHDVlUt2mat5Q+pHGvIF/dyGPE2jGT7c64SIpoOLiemi1iryycHGMEZq0eWSPL
	 PkETzhOx3xOOg==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v3=201/3]=20xl:=20Add=20pci=20device=20hotplug=20option?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1775833430450
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "=?utf-8?Q?Daniel=20P=20.=20Berrang=C3=A9?=" <berrange@redhat.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <20260410150333.1533568-2-thierry.escande@vates.tech>
In-Reply-To: <20260410150333.1533568-1-thierry.escande@vates.tech>
References: <20260410150333.1533568-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1b7cd7e0c2ad488cb44a75c9c4b1170f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260410:md
Date: Fri, 10 Apr 2026 15:03:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1775833432-2252396F-A071C152/0/0
X-purgate-type: clean
X-purgate-size: 2930
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:berrange@redhat.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	NEURAL_HAM(-0.00)[-0.954];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E5F233D8E41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This option is used to passthrough PCI devices using the Qemu command
line (-device driver,...) instead of the QMP hot-plug mechanism.

This is needed for Q35 support since its PCI root bus doesn't support
hotplugging.

If not specified, the default behavior is to use hotplug via QMP.

Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
v2: no change
v3: no change
---
 tools/libs/light/libxl_types.idl | 1 +
 tools/libs/util/libxlu_pci.c     | 2 ++
 tools/xl/xl_parse.c              | 5 +++++
 3 files changed, 8 insertions(+)

diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index a7893460f0..aca0e93793 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -922,6 +922,7 @@ libxl_device_pci = Struct("device_pci", [
     ("seize", bool),
     ("rdm_policy", libxl_rdm_reserve_policy),
     ("name", string),
+    ("hotplug", bool),
     ])
 
 libxl_device_rdm = Struct("device_rdm", [
diff --git a/tools/libs/util/libxlu_pci.c b/tools/libs/util/libxlu_pci.c
index 294482c6d7..f6440c878b 100644
--- a/tools/libs/util/libxlu_pci.c
+++ b/tools/libs/util/libxlu_pci.c
@@ -192,6 +192,8 @@ int xlu_pci_parse_spec_string(XLU_Config *cfg, libxl_device_pci *pci,
             name_present = true;
             pci->name = strdup(val);
             if (!pci->name) ret = ERROR_NOMEM;
+        } else if (!strcmp(key, "hotplug")) {
+            pci->hotplug = atoi(val);
         } else {
             XLU__PCI_ERR(cfg, "Unknown PCI_SPEC_STRING option: %s", key);
             ret = ERROR_INVAL;
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 48c72dce9c..7ea2a76662 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1361,6 +1361,7 @@ void parse_config_data(const char *config_source,
     int pci_msitranslate = 0;
     int pci_permissive = 0;
     int pci_seize = 0;
+    int pci_hotplug = 1;
     int i, e;
     int num_llc_colors;
     int num_xs_quota;
@@ -1699,6 +1700,9 @@ void parse_config_data(const char *config_source,
     if (!xlu_cfg_get_long (config, "pci_seize", &l, 0))
         pci_seize = l;
 
+    if (!xlu_cfg_get_long (config, "pci_hotplug", &l, 0))
+        pci_hotplug = l;
+
     if (!xlu_cfg_get_string(config, "rdm", &buf, 0)) {
         libxl_rdm_reserve rdm;
         if (!xlu_rdm_parse(config, &rdm, buf)) {
@@ -1720,6 +1724,7 @@ void parse_config_data(const char *config_source,
             pci->power_mgmt = pci_power_mgmt;
             pci->permissive = pci_permissive;
             pci->seize = pci_seize;
+            pci->hotplug = pci_hotplug;
             /*
              * Like other pci option, the per-device policy always follows
              * the global policy by default.
-- 
2.53.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



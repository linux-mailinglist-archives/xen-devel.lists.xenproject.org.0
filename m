Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIt1H/iLqWl3/AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:58:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D39212E10
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:58:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246746.1545861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy9DK-0004m4-74; Thu, 05 Mar 2026 13:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246746.1545861; Thu, 05 Mar 2026 13:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy9DK-0004ks-1S; Thu, 05 Mar 2026 13:58:06 +0000
Received: by outflank-mailman (input) for mailman id 1246746;
 Thu, 05 Mar 2026 13:58:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y0Pc=BF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vy98P-0008Mq-P5
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 13:53:01 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f7a8dd3-189a-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 14:53:00 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5CC845BDE2;
 Thu,  5 Mar 2026 13:52:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3790B3EA68;
 Thu,  5 Mar 2026 13:52:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AX2ADLuKqWkdTwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 05 Mar 2026 13:52:59 +0000
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
X-Inumbo-ID: 9f7a8dd3-189a-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772718779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0vTnaLiNIbBDWIqxe6qxu0BI40b3mH2UzHvF/8/7sk=;
	b=klfusZ5eK/BCbJuwI8jkcOy1FBZfH3lLFFtXZ5cbMAIDCTV/fZ+HaE4DXwFtf6rfrk7mSW
	tY86rV0uUs+vbKeXv9rwhwHnlQn8kK6cIzwH+RjPXqK0Ar3Isc/qmA11M47kNVxMExrjeo
	cOfQPCSdK0HTgKIcZBzhYfrUi/Jnj4s=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772718779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0vTnaLiNIbBDWIqxe6qxu0BI40b3mH2UzHvF/8/7sk=;
	b=klfusZ5eK/BCbJuwI8jkcOy1FBZfH3lLFFtXZ5cbMAIDCTV/fZ+HaE4DXwFtf6rfrk7mSW
	tY86rV0uUs+vbKeXv9rwhwHnlQn8kK6cIzwH+RjPXqK0Ar3Isc/qmA11M47kNVxMExrjeo
	cOfQPCSdK0HTgKIcZBzhYfrUi/Jnj4s=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Nick Rosbrook <enr0n@ubuntu.com>,
	George Dunlap <gwd@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 09/11] tools/libxl: add support for xenstore quota in domain_config
Date: Thu,  5 Mar 2026 14:52:06 +0100
Message-ID: <20260305135208.2208663-10-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305135208.2208663-1-jgross@suse.com>
References: <20260305135208.2208663-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.79
X-Spam-Level: 
X-Rspamd-Queue-Id: 33D39212E10
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:enr0n@ubuntu.com,m:gwd@xenproject.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Add support for xenstore quota in the struct domain_config. Initially
it will be used only for migration of a domain.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/golang/xenlight/helpers.gen.go |  6 ++++++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/libs/light/libxl_dom.c         |  8 ++++++++
 tools/libs/light/libxl_domain.c      | 10 ++++++++++
 tools/libs/light/libxl_types.idl     |  1 +
 5 files changed, 26 insertions(+)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 6c9af904c5..416c2d3e07 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1286,6 +1286,9 @@ if err := x.TrapUnmappedAccesses.fromC(&xc.trap_unmapped_accesses);err != nil {
 return fmt.Errorf("converting field TrapUnmappedAccesses: %v", err)
 }
 x.XenstoreFeatureMask = uint32(xc.xenstore_feature_mask)
+if err := x.XenstoreQuota.fromC(&xc.xenstore_quota);err != nil {
+return fmt.Errorf("converting field XenstoreQuota: %v", err)
+}
 
  return nil}
 
@@ -1825,6 +1828,9 @@ if err := x.TrapUnmappedAccesses.toC(&xc.trap_unmapped_accesses); err != nil {
 return fmt.Errorf("converting field TrapUnmappedAccesses: %v", err)
 }
 xc.xenstore_feature_mask = C.uint32_t(x.XenstoreFeatureMask)
+if err := x.XenstoreQuota.toC(&xc.xenstore_quota); err != nil {
+return fmt.Errorf("converting field XenstoreQuota: %v", err)
+}
 
  return nil
  }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 5393277190..7e7292cf70 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -629,6 +629,7 @@ VmtraceBufKb int
 Vpmu Defbool
 TrapUnmappedAccesses Defbool
 XenstoreFeatureMask uint32
+XenstoreQuota XsQuotaSet
 }
 
 type DomainBuildInfoTypeUnion interface {
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 05ebc69534..1c0689d7ff 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -509,6 +509,14 @@ retry_transaction:
 
     xs_introduce_domain(ctx->xsh, domid, state->store_mfn, state->store_port);
 
+    if (info->xenstore_quota.num_quota) {
+        rc = libxl_xsquota_domain_set(ctx, domid, &info->xenstore_quota);
+        if (rc) {
+            LOGED(ERROR, domid, "Failed to set Xenstore quota");
+            goto out;
+        }
+    }
+
  out:
     free(vm_path);
     return rc;
diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 5be47f687f..86e43e7133 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -2533,6 +2533,16 @@ static void retrieve_domain_configuration_end(libxl__egc *egc,
         }
     }
 
+    /* Xenstore quota */
+    {
+        libxl_xs_quota_set_dispose(&d_config->b_info.xenstore_quota);
+        rc = libxl_xsquota_domain_get(CTX, domid, &d_config->b_info.xenstore_quota);
+        if (rc) {
+            LOGD(ERROR, domid, "Fail to get xenstore quota");
+            goto out;
+        }
+    }
+
     /* Devices: disk, nic, vtpm, pcidev etc. */
 
     /* The MERGE macro implements following logic:
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index c5ddc40f35..ee8f89e462 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -760,6 +760,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("vpmu", libxl_defbool),
     ("trap_unmapped_accesses", libxl_defbool),
     ("xenstore_feature_mask", uint32, {'init_val': '~0U'}),
+    ("xenstore_quota", libxl_xs_quota_set),
 
     ], dir=DIR_IN,
        copy_deprecated_fn="libxl__domain_build_info_copy_deprecated",
-- 
2.53.0



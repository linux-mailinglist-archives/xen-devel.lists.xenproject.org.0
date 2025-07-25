Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5057B11F4A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 15:20:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057810.1425555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufILM-0001sq-S7; Fri, 25 Jul 2025 13:20:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057810.1425555; Fri, 25 Jul 2025 13:20:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufILM-0001pI-Ny; Fri, 25 Jul 2025 13:20:12 +0000
Received: by outflank-mailman (input) for mailman id 1057810;
 Fri, 25 Jul 2025 13:20:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ufILL-0006ft-Bq
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 13:20:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17215e0b-695a-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 15:20:10 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5643E216E2;
 Fri, 25 Jul 2025 13:20:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 21B88134E8;
 Fri, 25 Jul 2025 13:20:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aLC7BoqEg2gJPQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 25 Jul 2025 13:20:10 +0000
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
X-Inumbo-ID: 17215e0b-695a-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753449610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iV66UlCLpM6BgnOhEb2Yl2KD4ZAo551/i+60LtyfZio=;
	b=tf0VvVyhu/2DeZp4Edckj3lXfvhmZA30TGTBek83ZsfgBAA0SPchi8wXt9sCh30cfv1KNq
	JOYTaeYAg/iJrPNIMAdiIKzb02nnnOw8JUebg8dEbpBRJA8MtuMhibU8lwdfW3UzFrUD/K
	b5prkLc5oVtdplxqGxDiK1M8DKrf4XU=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753449610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iV66UlCLpM6BgnOhEb2Yl2KD4ZAo551/i+60LtyfZio=;
	b=tf0VvVyhu/2DeZp4Edckj3lXfvhmZA30TGTBek83ZsfgBAA0SPchi8wXt9sCh30cfv1KNq
	JOYTaeYAg/iJrPNIMAdiIKzb02nnnOw8JUebg8dEbpBRJA8MtuMhibU8lwdfW3UzFrUD/K
	b5prkLc5oVtdplxqGxDiK1M8DKrf4XU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Nick Rosbrook <enr0n@ubuntu.com>,
	George Dunlap <gwd@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 7/7] tools: allow to limit xenstore features via guest config
Date: Fri, 25 Jul 2025 15:19:28 +0200
Message-ID: <20250725131928.19286-8-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725131928.19286-1-jgross@suse.com>
References: <20250725131928.19286-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Add a guest config parameter "xenstore_feature_mask" allowing to limit
the Xenstore features the guest can see and use. This can be needed in
order to allow migrating a guest to a host running a Xenstore version
providing less features than the source host.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
V2:
- fix typo (Jason Andryuk)
---
 docs/man/xl.cfg.5.pod.in             | 36 ++++++++++++++++++++++++++++
 tools/golang/xenlight/helpers.gen.go |  2 ++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/include/libxl.h                |  6 +++++
 tools/libs/light/libxl_dom.c         | 12 ++++++++++
 tools/libs/light/libxl_types.idl     |  1 +
 tools/xl/xl_parse.c                  |  3 +++
 7 files changed, 61 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 1d122982c6..4efe680960 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -714,6 +714,42 @@ If this option is not specified then it will default to B<false>.
 
 =back
 
+=head3 Xenstore related settings
+
+=over 4
+
+=item B<xenstore_feature_mask=NUMBER>
+
+Specify which Xenstore features are visible for the guest.
+
+This might be needed when a guest should be able to be migrated to a host
+running a Xenstore implementation with less features than the one the guest
+is created on.
+
+The visible features are specified via a binary or of the following
+values:
+
+=over 4
+
+=item B<0x00000001>
+
+Xenstore is capable to reconnect to a guest.
+
+=item B<0x00000002>
+
+Xenstore will present an error value in case it disconnects due to an error
+condition.
+
+=back
+
+The features supported by the running Xenstore instance can be retrieved
+via the B<xl info> command in dom0.
+
+The default value is B<0xffffffff>, meaning that all possible Xenstore
+features are visible by the guest.
+
+=back
+
 =head2 Devices
 
 The following options define the paravirtual, emulated and physical
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index c45df1005f..429aee3950 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1174,6 +1174,7 @@ return fmt.Errorf("converting field Vpmu: %v", err)
 if err := x.TrapUnmappedAccesses.fromC(&xc.trap_unmapped_accesses);err != nil {
 return fmt.Errorf("converting field TrapUnmappedAccesses: %v", err)
 }
+x.XenstoreFeatureMask = uint32(xc.xenstore_feature_mask)
 
  return nil}
 
@@ -1708,6 +1709,7 @@ return fmt.Errorf("converting field Vpmu: %v", err)
 if err := x.TrapUnmappedAccesses.toC(&xc.trap_unmapped_accesses); err != nil {
 return fmt.Errorf("converting field TrapUnmappedAccesses: %v", err)
 }
+xc.xenstore_feature_mask = C.uint32_t(x.XenstoreFeatureMask)
 
  return nil
  }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 61e322f20a..c9ba4d2844 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -607,6 +607,7 @@ Altp2M Altp2MMode
 VmtraceBufKb int
 Vpmu Defbool
 TrapUnmappedAccesses Defbool
+XenstoreFeatureMask uint32
 }
 
 type DomainBuildInfoTypeUnion interface {
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index a8704e0268..1d4510506c 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -654,6 +654,12 @@
  */
 #define LIBXL_HAVE_DT_OVERLAY_DOMAIN 1
 
+/*
+ * LIBXL_HAVE_XENSTORE_FEATURE_MASK indicates the presence of
+ * xenstore_feature_mask in struct libxl_domain_build_info.
+ */
+#define LIBXL_HAVE_XENSTORE_FEATURE_MASK 1
+
 /*
  * libxl memory management
  *
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index a61085ca3b..2a7923533f 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -494,6 +494,18 @@ retry_transaction:
     if (!xs_transaction_end(ctx->xsh, t, 0))
         if (errno == EAGAIN)
             goto retry_transaction;
+
+    if (info->xenstore_feature_mask != ~0U) {
+        unsigned int features;
+
+        if (xs_get_features_supported(ctx->xsh, &features) &&
+            !xs_set_features_domain(ctx->xsh, domid,
+                                    features & info->xenstore_feature_mask)) {
+            LOG(ERROR, "Failed to set Xenstore features");
+            return ERROR_FAIL;
+        }
+    }
+
     xs_introduce_domain(ctx->xsh, domid, state->store_mfn, state->store_port);
     free(vm_path);
     return 0;
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index a3a79d12b2..99ab2c3ebb 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -738,6 +738,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
 
     ("vpmu", libxl_defbool),
     ("trap_unmapped_accesses", libxl_defbool),
+    ("xenstore_feature_mask", uint32, {'init_val': '~0U'}),
 
     ], dir=DIR_IN,
        copy_deprecated_fn="libxl__domain_build_info_copy_deprecated",
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 7e11c62ba0..aaeace1840 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1409,6 +1409,9 @@ void parse_config_data(const char *config_source,
     if (!xlu_cfg_get_string (config, "pool", &buf, 0))
         xlu_cfg_replace_string(config, "pool", &c_info->pool_name, 0);
 
+    if (!xlu_cfg_get_long (config, "xenstore_feature_mask", &l, 0))
+        b_info->xenstore_feature_mask = l;
+
     libxl_domain_build_info_init_type(b_info, c_info->type);
 
     if (b_info->type == LIBXL_DOMAIN_TYPE_PVH) {
-- 
2.43.0



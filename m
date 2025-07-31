Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D655B16DD2
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 10:43:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065075.1430413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOsc-00075Z-Sw; Thu, 31 Jul 2025 08:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065075.1430413; Thu, 31 Jul 2025 08:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOsc-00071s-Ob; Thu, 31 Jul 2025 08:43:14 +0000
Received: by outflank-mailman (input) for mailman id 1065075;
 Thu, 31 Jul 2025 08:43:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3v3Z=2M=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uhOsb-0006gC-IT
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 08:43:13 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6252bb66-6dea-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 10:43:08 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5A48F2119C;
 Thu, 31 Jul 2025 08:43:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 17DE113AB4;
 Thu, 31 Jul 2025 08:43:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id vH8tBJwsi2jSDAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 31 Jul 2025 08:43:08 +0000
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
X-Inumbo-ID: 6252bb66-6dea-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753951388; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zxuwVWDlLAnmbyEtprz8FF0BaKxPp4KdchOH5r/IcTY=;
	b=sj7yfkFSCaBJrOF4UL5JYZhj4Dla0iBu285uV4/Y6SHsauZBp+zeWbwm3jG+1QndebtrUI
	dYDpqAA/IaT69gr3Bq3pjcy2hAs5u4z3cBpyr//bV7kPCAWP8Ikh4r3jWf0MiNP7xvfUjz
	xi162V1AE+9j+d+VVlGAD6wZtBNB1Kw=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753951388; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zxuwVWDlLAnmbyEtprz8FF0BaKxPp4KdchOH5r/IcTY=;
	b=sj7yfkFSCaBJrOF4UL5JYZhj4Dla0iBu285uV4/Y6SHsauZBp+zeWbwm3jG+1QndebtrUI
	dYDpqAA/IaT69gr3Bq3pjcy2hAs5u4z3cBpyr//bV7kPCAWP8Ikh4r3jWf0MiNP7xvfUjz
	xi162V1AE+9j+d+VVlGAD6wZtBNB1Kw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Nick Rosbrook <enr0n@ubuntu.com>,
	George Dunlap <gwd@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v3 2/2] tools: allow to limit xenstore features via guest config
Date: Thu, 31 Jul 2025 10:42:54 +0200
Message-ID: <20250731084254.25591-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731084254.25591-1-jgross@suse.com>
References: <20250731084254.25591-1-jgross@suse.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,amd.com:email,suse.com:mid,suse.com:email];
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
Acked-by: Nick Rosbrook <enr0n@ubuntu.com> # tools/golang
---
V2:
- fix typo (Jason Andryuk)
V3:
- use LOGED for error logging (Anthony Perard)
- don't leak vm_path in case of error (Anthony Perard)
---
 docs/man/xl.cfg.5.pod.in             | 36 ++++++++++++++++++++++++++++
 tools/golang/xenlight/helpers.gen.go |  2 ++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/include/libxl.h                |  6 +++++
 tools/libs/light/libxl_dom.c         | 17 ++++++++++++-
 tools/libs/light/libxl_types.idl     |  1 +
 tools/xl/xl_parse.c                  |  3 +++
 7 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 5362fb0e9a..f0c920b39d 100644
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
index b43aad7d00..667030cbd7 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1175,6 +1175,7 @@ return fmt.Errorf("converting field Vpmu: %v", err)
 if err := x.TrapUnmappedAccesses.fromC(&xc.trap_unmapped_accesses);err != nil {
 return fmt.Errorf("converting field TrapUnmappedAccesses: %v", err)
 }
+x.XenstoreFeatureMask = uint32(xc.xenstore_feature_mask)
 
  return nil}
 
@@ -1710,6 +1711,7 @@ return fmt.Errorf("converting field Vpmu: %v", err)
 if err := x.TrapUnmappedAccesses.toC(&xc.trap_unmapped_accesses); err != nil {
 return fmt.Errorf("converting field TrapUnmappedAccesses: %v", err)
 }
+xc.xenstore_feature_mask = C.uint32_t(x.XenstoreFeatureMask)
 
  return nil
  }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 4777f528b5..e26b3cdfc7 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -608,6 +608,7 @@ Altp2MCount uint32
 VmtraceBufKb int
 Vpmu Defbool
 TrapUnmappedAccesses Defbool
+XenstoreFeatureMask uint32
 }
 
 type DomainBuildInfoTypeUnion interface {
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index d6b6e5d2dd..185f74d8a8 100644
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
index a61085ca3b..05ebc69534 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -494,9 +494,24 @@ retry_transaction:
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
+            LOGED(ERROR, domid, "Failed to set Xenstore features");
+            rc = ERROR_FAIL;
+            goto out;
+        }
+    }
+
     xs_introduce_domain(ctx->xsh, domid, state->store_mfn, state->store_port);
+
+ out:
     free(vm_path);
-    return 0;
+    return rc;
 }
 
 static int set_vnuma_info(libxl__gc *gc, uint32_t domid,
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index fe251649f3..a6030a2dbd 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -739,6 +739,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
 
     ("vpmu", libxl_defbool),
     ("trap_unmapped_accesses", libxl_defbool),
+    ("xenstore_feature_mask", uint32, {'init_val': '~0U'}),
 
     ], dir=DIR_IN,
        copy_deprecated_fn="libxl__domain_build_info_copy_deprecated",
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 28cdbf07c2..90c9386f5b 100644
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



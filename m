Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N2QAMljvWlF9gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 16:12:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8542DC68F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 16:12:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1258221.1552377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3bW0-0001jE-KP; Fri, 20 Mar 2026 15:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1258221.1552377; Fri, 20 Mar 2026 15:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3bW0-0001gu-HY; Fri, 20 Mar 2026 15:11:56 +0000
Received: by outflank-mailman (input) for mailman id 1258221;
 Fri, 20 Mar 2026 15:11:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0BFG=BU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w3bMv-0001ko-3N
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 15:02:33 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1821fae-246d-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Mar 2026 16:02:31 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4F34F5BDF1;
 Fri, 20 Mar 2026 15:02:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 328F242866;
 Fri, 20 Mar 2026 15:02:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id e5RHC4NhvWkQXQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 20 Mar 2026 15:02:27 +0000
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
X-Inumbo-ID: d1821fae-246d-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774018947; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RvZyWf80UhIWQ1Ha92/GkHwBZUAkRxIiyYOr24YFL4c=;
	b=u2wXVdKkXq1jVy9V9f9iklAiWJ5Kt3UogaAKILZjUMZ8+6H6zjmiSsBBPYECJAkcOZpIQx
	96RgUK6eWPXG9IzikBjViC+o25mHnBc8u8N3nzfCqtvYVmT1krXOwZTwR+9pfuZVpcdowr
	ytNq900LHAh/UqcEAkP0twmudkMANe4=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=u2wXVdKk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774018947; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RvZyWf80UhIWQ1Ha92/GkHwBZUAkRxIiyYOr24YFL4c=;
	b=u2wXVdKkXq1jVy9V9f9iklAiWJ5Kt3UogaAKILZjUMZ8+6H6zjmiSsBBPYECJAkcOZpIQx
	96RgUK6eWPXG9IzikBjViC+o25mHnBc8u8N3nzfCqtvYVmT1krXOwZTwR+9pfuZVpcdowr
	ytNq900LHAh/UqcEAkP0twmudkMANe4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 12/12] tools/xl: add support for xenstore quota setting via domain config
Date: Fri, 20 Mar 2026 16:01:20 +0100
Message-ID: <20260320150120.874878-13-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320150120.874878-1-jgross@suse.com>
References: <20260320150120.874878-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 5F8542DC68F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a new "xenstore_quota" domain config parameter for setting the
Xenstore quota of a new domain via a list of <quota>=<val> items.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
V2:
- fix typo in commit message (Anthony Perard)
- use xcalloc() (Anthony Perard)
---
 docs/man/xl.cfg.5.pod.in | 13 +++++++++++++
 tools/xl/xl_parse.c      | 19 ++++++++++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 27c455210b..3aac0bc4fb 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -748,6 +748,19 @@ via the B<xl info -x> command in dom0.
 The default value is B<0xffffffff>, meaning that all possible Xenstore
 features are visible by the guest.
 
+=item B<xenstore_quota=[ QUOTA_SPEC, QUOTA_SPEC, ...]>
+
+Specifies Xenstore quota values of the domain, overriding the default
+values of Xenstore.
+
+Each B<QUOTA_SPEC> is a B<quota-name>=B<value> specification. The supported
+B<quota-name> identifiers can be obtained by the B<xl xenstore-quota-get -g>
+command. B<value> is a non-negative integer.
+
+As per-domain Xenstore quota are an optional Xenstore feature, the
+B<xenstore_quota> config parameter may not be supported by all Xenstore
+implementations.
+
 =back
 
 =head2 Devices
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 4b074fdb58..48c72dce9c 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1354,7 +1354,7 @@ void parse_config_data(const char *config_source,
     XLU_ConfigList *cpus, *vbds, *nics, *pcis, *cvfbs, *cpuids, *vtpms,
                    *usbctrls, *usbdevs, *p9devs, *vdispls, *pvcallsifs_devs;
     XLU_ConfigList *channels, *ioports, *irqs, *iomem, *viridian, *dtdevs,
-                   *mca_caps, *smbios, *llc_colors;
+                   *mca_caps, *smbios, *llc_colors, *xs_quota;
     int num_ioports, num_irqs, num_iomem, num_cpus, num_viridian, num_mca_caps;
     int num_smbios;
     int pci_power_mgmt = 0;
@@ -1363,6 +1363,7 @@ void parse_config_data(const char *config_source,
     int pci_seize = 0;
     int i, e;
     int num_llc_colors;
+    int num_xs_quota;
     char *kernel_basename;
 
     libxl_domain_create_info *c_info = &d_config->c_info;
@@ -1470,6 +1471,22 @@ void parse_config_data(const char *config_source,
     if (!xlu_cfg_get_long (config, "xenstore_feature_mask", &l, 0))
         b_info->xenstore_feature_mask = l;
 
+    if (!xlu_cfg_get_list(config, "xenstore_quota", &xs_quota, &num_xs_quota, 0)) {
+        b_info->xenstore_quota.num_quota = num_xs_quota;
+        b_info->xenstore_quota.quota = xcalloc(num_xs_quota, sizeof(* b_info->xenstore_quota.quota));
+
+        for (i = 0; i < num_xs_quota; i++) {
+           buf = xlu_cfg_get_listitem(xs_quota, i);
+           if (!buf) {
+                fprintf(stderr,
+                        "xl: Can't get element %d in Xenstore quota list\n", i);
+                exit(1);
+            }
+            if (parse_xsquota_item(buf, b_info->xenstore_quota.quota + i))
+                exit(1);
+        }
+    }
+
     libxl_domain_build_info_init_type(b_info, c_info->type);
 
     if (b_info->type == LIBXL_DOMAIN_TYPE_PVH) {
-- 
2.53.0



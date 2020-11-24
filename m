Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A9C2C30A6
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 20:18:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36880.68983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khdp9-0003RX-Dp; Tue, 24 Nov 2020 19:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36880.68983; Tue, 24 Nov 2020 19:17:59 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khdp9-0003Qw-9K; Tue, 24 Nov 2020 19:17:59 +0000
Received: by outflank-mailman (input) for mailman id 36880;
 Tue, 24 Nov 2020 19:17:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khdp7-0003OL-Kw
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:17:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khdp6-00047C-QM; Tue, 24 Nov 2020 19:17:56 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khdp6-0001af-Hj; Tue, 24 Nov 2020 19:17:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdp7-0003OL-Kw
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:17:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=tkkEPJDCdmPbCsiRQLMOIcAhVsNk4TLVoClBajQOxuI=; b=EYmZp8G3qHSpuuEhzJceRlDl0A
	D+d80s0ACzdoBX4PXRzJ0vVeCAWR1wDNwk2iVcJJvuYl5M+zPHZvkki8+Z7g7rNE1kRPpe6cIz2qt
	6F1r++tfBv4uwyVBGUdSOyYBEyvaIvJ1tdxK+AgIL1ojrtbkXmwnwbs2OMH8Sno/xQcc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdp6-00047C-QM; Tue, 24 Nov 2020 19:17:56 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com ([86.183.162.145] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdp6-0001af-Hj; Tue, 24 Nov 2020 19:17:56 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Eslam Elnikety <elnikety@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 3/3] xl: add 'disable_evtchn_fifo' boolean option into xl.cfg(5) ...
Date: Tue, 24 Nov 2020 19:17:51 +0000
Message-Id: <20201124191751.11472-4-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201124191751.11472-1-paul@xen.org>
References: <20201124191751.11472-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

...to set the value of the 'disable_evtchn_fifo' flag in
libxl_domain_build_info.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Signed-off-by: Eslam Elnikety <elnikety@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>

v4:
 - New in v4
---
 docs/man/xl.cfg.5.pod.in | 8 ++++++++
 tools/xl/xl_parse.c      | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 0532739c1fff..80d5e7aaf38f 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1338,6 +1338,14 @@ FIFO-based event channel ABI support up to 131,071 event channels.
 Other guests are limited to 4095 (64-bit x86 and ARM) or 1023 (32-bit
 x86).
 
+=item B<disable_evtchn_fifo=BOOLEAN>
+
+Indicates if support for FIFO event channel operations (EVTCHNOP_init_control,
+EVTCHNOP_expand_array and EVTCHNOP_set_priority) are disabled. This can be
+used to work around issues with guests hibernated on a version of Xen
+prior to 4.4 and resumed on a version of Xen from 4.4. onwards. The default
+value is false.
+
 =item B<vdispl=[ "VDISPL_SPEC_STRING", "VDISPL_SPEC_STRING", ...]>
 
 Specifies the virtual display devices to be provided to the guest.
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index cae8eb679c5a..f79f644c4c2e 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1569,6 +1569,9 @@ void parse_config_data(const char *config_source,
     if (!xlu_cfg_get_long(config, "max_event_channels", &l, 0))
         b_info->event_channels = l;
 
+    xlu_cfg_get_defbool(config, "disable_evtchn_fifo",
+                        &b_info->disable_evtchn_fifo, 0);
+
     xlu_cfg_replace_string (config, "kernel", &b_info->kernel, 0);
     xlu_cfg_replace_string (config, "ramdisk", &b_info->ramdisk, 0);
     xlu_cfg_replace_string (config, "device_tree", &b_info->device_tree, 0);
-- 
2.20.1



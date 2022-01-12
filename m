Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A5B48C89C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 17:42:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256746.440759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ggw-0006cq-2o; Wed, 12 Jan 2022 16:41:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256746.440759; Wed, 12 Jan 2022 16:41:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ggv-0006as-V6; Wed, 12 Jan 2022 16:41:41 +0000
Received: by outflank-mailman (input) for mailman id 256746;
 Wed, 12 Jan 2022 16:41:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytoJ=R4=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1n7ggu-0006Zx-9B
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 16:41:40 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82e896d7-73c6-11ec-bd6f-bfb69f65cdc7;
 Wed, 12 Jan 2022 17:41:38 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B16181F3A3;
 Wed, 12 Jan 2022 16:41:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6EF8D13BE6;
 Wed, 12 Jan 2022 16:41:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WQijGMEE32GwTAAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Wed, 12 Jan 2022 16:41:37 +0000
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
X-Inumbo-ID: 82e896d7-73c6-11ec-bd6f-bfb69f65cdc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642005697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2SkX3v3mYWj0hVWfhFsLKlW92IvOMYnJLJq6xEKXvBs=;
	b=g8R7gRhSAvTrJ7gXaVTbgAaWBQ7D7n+192qXGrp2qakBz+tV3XWT+O8oGm5HsKfb27a1Pv
	i7KM3t8baWau7KfLLUztrO5HCh77yonWKnu0kUzZS3wkngGBJ8/X8BKLUz5RfWOmooROL4
	5AOe7VDyE39RyyxyJem5mi156BV/jPk=
Subject: [PATCH 1/2] tools/libs/light: numa placement: don't try to free a
 NULL list of vcpus
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Cc: James Fehlig <jfehlig@suse.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Date: Wed, 12 Jan 2022 17:41:36 +0100
Message-ID: <164200569629.24755.2980883411590685040.stgit@work>
In-Reply-To: <164200566223.24755.262723784847161301.stgit@work>
References: <164200566223.24755.262723784847161301.stgit@work>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

If libxl_vcpu_list() returned NULL, we should not call
libxl_numainfo_list_free() as:
1) it'll fail trying to (double) free() *list
2) there should be nothing to free anyway

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
Tested-by: James Fehlig <jfehlig@suse.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
---
 tools/libs/light/libxl_numa.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_numa.c b/tools/libs/light/libxl_numa.c
index a8a75f89e9..3679028c79 100644
--- a/tools/libs/light/libxl_numa.c
+++ b/tools/libs/light/libxl_numa.c
@@ -253,9 +253,9 @@ static int nr_vcpus_on_nodes(libxl__gc *gc, libxl_cputopology *tinfo,
             }
         }
 
+        libxl_vcpuinfo_list_free(vinfo, nr_dom_vcpus);
  next:
         libxl_cpupoolinfo_dispose(&cpupool_info);
-        libxl_vcpuinfo_list_free(vinfo, nr_dom_vcpus);
     }
 
     libxl_bitmap_dispose(&dom_nodemap);




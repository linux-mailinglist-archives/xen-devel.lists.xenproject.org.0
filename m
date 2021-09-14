Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E23640ADD9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 14:36:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186543.335300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ7fX-0007di-3B; Tue, 14 Sep 2021 12:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186543.335300; Tue, 14 Sep 2021 12:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ7fW-0007Zh-Vt; Tue, 14 Sep 2021 12:36:10 +0000
Received: by outflank-mailman (input) for mailman id 186543;
 Tue, 14 Sep 2021 12:36:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8exS=OE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mQ7fV-00070M-Gg
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 12:36:09 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be5117b7-fc42-49a6-9ea0-c31c1553aa9d;
 Tue, 14 Sep 2021 12:36:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2DD48220E6;
 Tue, 14 Sep 2021 12:36:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DD6DF13F2C;
 Tue, 14 Sep 2021 12:36:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KE6gNDKXQGE7MAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Sep 2021 12:36:02 +0000
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
X-Inumbo-ID: be5117b7-fc42-49a6-9ea0-c31c1553aa9d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631622963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vq2/ecChHTKwpSB6rnjbRKzVPD40UedVXsB5/I4nS/M=;
	b=rU1nkO5IUXnR1p4uMZduS7O0st8GM0JMYHMkpri5KqLTaYTMa6gSxJsH4yW7+LfNRxNr1s
	+03OjL4fZErgmcWaUwL4M2/FRmzlKIy/JFUFm60Jdmb1vG1sPbF2GSwMv2PGbDM6h9yvLA
	M7ymz/Nl2KiiuBPS97+K842aHK/Lk70=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH RFC 1/4] xen: add a domain unique id to each domain
Date: Tue, 14 Sep 2021 14:35:57 +0200
Message-Id: <20210914123600.1626-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210914123600.1626-1-jgross@suse.com>
References: <20210914123600.1626-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xenstore is referencing domains by their domid, but reuse of a domid
can lead to the situation that Xenstore can't tell whether a domain
with that domid has been deleted and created again without Xenstore
noticing the domain is a new one now.

Add a global domain creation unique id which is updated when creating
a new domain, and store that value in struct domain of the new domain.
The global unique id is initialized with the system time and updates
are done via the xorshift algorithm which is used for pseudo random
number generation, too (see https://en.wikipedia.org/wiki/Xorshift).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/domain.c     | 16 ++++++++++++++++
 xen/include/xen/sched.h |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 6ee5d033b0..755349b93f 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -84,6 +84,9 @@ vcpu_info_t dummy_vcpu_info;
 
 bool __read_mostly vmtrace_available;
 
+/* Unique domain identifier, protected by domctl lock. */
+static uint64_t unique_id;
+
 static void __domain_finalise_shutdown(struct domain *d)
 {
     struct vcpu *v;
@@ -473,6 +476,18 @@ static void _domain_destroy(struct domain *d)
     free_domain_struct(d);
 }
 
+static uint64_t get_unique_id(void)
+{
+    uint64_t x = unique_id ? : NOW();
+
+    x ^= x << 13;
+    x ^= x >> 7;
+    x ^= x << 17;
+    unique_id = x;
+
+    return x;
+}
+
 static int sanitise_domain_config(struct xen_domctl_createdomain *config)
 {
     bool hvm = config->flags & XEN_DOMCTL_CDF_hvm;
@@ -552,6 +567,7 @@ struct domain *domain_create(domid_t domid,
 
     /* Sort out our idea of is_system_domain(). */
     d->domain_id = domid;
+    d->unique_id = get_unique_id();
 
     /* Debug sanity. */
     ASSERT(is_system_domain(d) ? config == NULL : config != NULL);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 28146ee404..b827c5af8d 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -362,6 +362,9 @@ struct domain
     domid_t          domain_id;
 
     unsigned int     max_vcpus;
+
+    uint64_t         unique_id;       /* Unique domain identifier */
+
     struct vcpu    **vcpu;
 
     shared_info_t   *shared_info;     /* shared data area */
-- 
2.26.2



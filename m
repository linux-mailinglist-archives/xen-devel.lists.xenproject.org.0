Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5864240ADD8
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 14:36:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186542.335288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ7fU-0007KC-Jp; Tue, 14 Sep 2021 12:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186542.335288; Tue, 14 Sep 2021 12:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ7fU-0007H1-FM; Tue, 14 Sep 2021 12:36:08 +0000
Received: by outflank-mailman (input) for mailman id 186542;
 Tue, 14 Sep 2021 12:36:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8exS=OE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mQ7fT-0007Eq-4s
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 12:36:07 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5388358e-1558-11ec-b421-12813bfff9fa;
 Tue, 14 Sep 2021 12:36:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3AC06220EA;
 Tue, 14 Sep 2021 12:36:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F3D8113F2C;
 Tue, 14 Sep 2021 12:36:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KAwKOjOXQGE7MAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Sep 2021 12:36:03 +0000
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
X-Inumbo-ID: 5388358e-1558-11ec-b421-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631622964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EH+dU3e+z7VJuNtk1nknzKQyPzqsv/7YUiwjiyb6J/Y=;
	b=TAlRcuSOmk3CTnhnWvKPvzACQ7Z/l+R/61XeosOOYScQ8OsPEoN/cJtEFpSfb2XQBsR1JQ
	Je4hMLDeXehqBLqwUo9bY4QCdnKRmkQ+VlSSeAL4HtSp1/tYGJF7hwGGkgcAEOWnFLOMor
	EI0btNofF2tB5b5ozK7zgzAIhlb/LsY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH RFC 4/4] tools/xenstore: use new stable interface instead of libxenctrl
Date: Tue, 14 Sep 2021 14:36:00 +0200
Message-Id: <20210914123600.1626-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210914123600.1626-1-jgross@suse.com>
References: <20210914123600.1626-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xenstore is using libxenctrl only for obtaining state information
about domains.

Use the new stable interface XEN_CONTROL_OP_get_state_changed_domain
instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/Makefile            |   3 +-
 tools/xenstore/xenstored_control.c |  14 +-
 tools/xenstore/xenstored_domain.c  | 219 ++++++++++++++++-------------
 3 files changed, 130 insertions(+), 106 deletions(-)

diff --git a/tools/xenstore/Makefile b/tools/xenstore/Makefile
index 292b478fa1..b78e29470b 100644
--- a/tools/xenstore/Makefile
+++ b/tools/xenstore/Makefile
@@ -11,6 +11,7 @@ CFLAGS += -include $(XEN_ROOT)/tools/config.h
 CFLAGS += -I./include
 CFLAGS += $(CFLAGS_libxenevtchn)
 CFLAGS += $(CFLAGS_libxenctrl)
+CFLAGS += $(CFLAGS_libxencall)
 CFLAGS += $(CFLAGS_libxenguest)
 CFLAGS += $(CFLAGS_libxentoolcore)
 CFLAGS += -DXEN_LIB_STORED="\"$(XEN_LIB_STORED)\""
@@ -70,7 +71,7 @@ endif
 $(XENSTORED_OBJS): CFLAGS += $(CFLAGS_libxengnttab)
 
 xenstored: $(XENSTORED_OBJS)
-	$(CC) $^ $(LDFLAGS) $(LDLIBS_libxenevtchn) $(LDLIBS_libxengnttab) $(LDLIBS_libxenctrl) $(LDLIBS_xenstored) $(SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
+	$(CC) $^ $(LDFLAGS) $(LDLIBS_libxenevtchn) $(LDLIBS_libxengnttab) $(LDLIBS_libxencall) $(LDLIBS_xenstored) $(SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
 
 xenstored.a: $(XENSTORED_OBJS)
 	$(AR) cr $@ $^
diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 7b4300ef77..d767aea0f9 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -594,6 +594,13 @@ void lu_read_state(void)
 	void *ctx = talloc_new(NULL); /* Work context for subfunctions. */
 	struct xs_state_preamble *pre;
 
+	/*
+	 * We may have missed the VIRQ_DOM_EXC notification and a domain may
+	 * have died while we were live-updating. So check all the domains are
+	 * still alive. This will pre-initialize all domain structures.
+	 */
+	check_domains();
+
 	syslog(LOG_INFO, "live-update: read state\n");
 	lu_get_dump_state(&state);
 	if (state.size == 0)
@@ -634,13 +641,6 @@ void lu_read_state(void)
 	lu_close_dump_state(&state);
 
 	talloc_free(ctx);
-
-	/*
-	 * We may have missed the VIRQ_DOM_EXC notification and a domain may
-	 * have died while we were live-updating. So check all the domains are
-	 * still alive.
-	 */
-	check_domains();
 }
 
 static const char *lu_activate_binary(const void *ctx)
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 47e9107c14..2801e4b24f 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -31,11 +31,12 @@
 #include "xenstored_transaction.h"
 #include "xenstored_watch.h"
 
+#include <xencall.h>
 #include <xenevtchn.h>
-#include <xenctrl.h>
+#include <xen/control.h>
 #include <xen/grant_table.h>
 
-static xc_interface **xc_handle;
+static xencall_handle **xc_handle;
 xengnttab_handle **xgt_handle;
 static evtchn_port_t virq_port;
 
@@ -50,6 +51,7 @@ struct domain
 
 	/* The id of this domain */
 	unsigned int domid;
+	uint64_t unique_id;
 
 	/* Event channel port */
 	evtchn_port_t port;
@@ -238,54 +240,114 @@ static int destroy_domain(void *_domain)
 	return 0;
 }
 
-static bool get_domain_info(unsigned int domid, xc_dominfo_t *dominfo)
+static bool get_domain_info(struct xen_control_changed_domain *dominfo)
 {
-	return xc_domain_getinfo(*xc_handle, domid, 1, dominfo) == 1 &&
-	       dominfo->domid == domid;
+	struct xen_control_changed_domain *buf;
+	int ret;
+
+	buf = xencall_alloc_buffer(*xc_handle, sizeof(*buf));
+	if (!buf)
+		return false;
+	ret = xencall2(*xc_handle, __HYPERVISOR_control_op,
+		       XEN_CONTROL_OP_get_state_changed_domain,
+		       (unsigned long)buf);
+	*dominfo = *buf;
+	xencall_free_buffer(*xc_handle, buf);
+
+	return ret == 0;
 }
 
-void check_domains(void)
+static struct domain *find_domain_struct(unsigned int domid)
+{
+	struct domain *i;
+
+	list_for_each_entry(i, &domains, list) {
+		if (i->domid == domid)
+			return i;
+	}
+	return NULL;
+}
+
+static struct domain *alloc_domain(unsigned int domid)
 {
-	xc_dominfo_t dominfo;
 	struct domain *domain;
+
+	domain = talloc_zero(talloc_autofree_context(), struct domain);
+	if (!domain) {
+		errno = ENOMEM;
+		return NULL;
+	}
+
+	domain->domid = domid;
+	domain->generation = generation;
+	domain->introduced = false;
+
+	talloc_set_destructor(domain, destroy_domain);
+
+	list_add(&domain->list, &domains);
+
+	return domain;
+}
+
+static void domain_drop(struct domain *domain)
+{
 	struct connection *conn;
+
+	/* domain is a talloc child of domain->conn. */
+	conn = domain->conn;
+	domain->conn = NULL;
+	talloc_unlink(talloc_autofree_context(), conn);
+}
+
+void check_domains(void)
+{
+	struct xen_control_changed_domain dominfo;
+	struct domain *domain;
 	int notify = 0;
-	bool dom_valid;
 
- again:
-	list_for_each_entry(domain, &domains, list) {
-		dom_valid = get_domain_info(domain->domid, &dominfo);
-		if (!domain->introduced) {
-			if (!dom_valid) {
+	while (get_domain_info(&dominfo)) {
+		domain = find_domain_struct(dominfo.domid);
+
+		if (!dominfo.state) {
+			if (domain && !domain->introduced)
 				talloc_free(domain);
-				goto again;
-			}
 			continue;
 		}
-		if (dom_valid) {
-			if ((dominfo.crashed || dominfo.shutdown)
-			    && !domain->shutdown) {
-				domain->shutdown = true;
-				notify = 1;
-			}
-			/*
-			 * On Restore, we may have been unable to remap the
-			 * interface and the port. As we don't know whether
-			 * this was because of a dying domain, we need to
-			 * check if the interface and port are still valid.
-			 */
-			if (!dominfo.dying && domain->port &&
-			    domain->interface)
+
+		if (domain && domain->unique_id &&
+		    domain->unique_id != dominfo.unique_id) {
+			if (domain->conn)
+				domain_drop(domain);
+			else
+				talloc_free(domain);
+			domain = NULL;
+		}
+
+		if (!domain) {
+			domain = alloc_domain(dominfo.domid);
+			if (!domain)
 				continue;
+			domain->unique_id = dominfo.unique_id;
 		}
-		if (domain->conn) {
-			/* domain is a talloc child of domain->conn. */
-			conn = domain->conn;
-			domain->conn = NULL;
-			talloc_unlink(talloc_autofree_context(), conn);
-			notify = 0; /* destroy_domain() fires the watch */
-			goto again;
+
+		if ((dominfo.state & XEN_CONTROL_CHANGEDDOM_STATE_SHUTDOWN) &&
+		    !domain->shutdown) {
+			domain->shutdown = true;
+			notify = 1;
 		}
+
+		/*
+		 * On Restore, we may have been unable to remap the
+		 * interface and the port. As we don't know whether
+		 * this was because of a dying domain, we need to
+		 * check if the interface and port are still valid.
+		 */
+		if (!(dominfo.state & XEN_CONTROL_CHANGEDDOM_STATE_DYING) &&
+		    domain->port && domain->interface)
+			continue;
+
+		if (domain->conn)
+			domain_drop(domain);
 	}
 
 	if (notify)
@@ -323,46 +385,6 @@ static char *talloc_domain_path(void *context, unsigned int domid)
 	return talloc_asprintf(context, "/local/domain/%u", domid);
 }
 
-static struct domain *find_domain_struct(unsigned int domid)
-{
-	struct domain *i;
-
-	list_for_each_entry(i, &domains, list) {
-		if (i->domid == domid)
-			return i;
-	}
-	return NULL;
-}
-
-static struct domain *alloc_domain(const void *context, unsigned int domid)
-{
-	struct domain *domain;
-
-	domain = talloc(context, struct domain);
-	if (!domain) {
-		errno = ENOMEM;
-		return NULL;
-	}
-
-	domain->domid = domid;
-	domain->generation = generation;
-	domain->introduced = false;
-
-	talloc_set_destructor(domain, destroy_domain);
-
-	list_add(&domain->list, &domains);
-
-	return domain;
-}
-
-static struct domain *find_or_alloc_domain(const void *ctx, unsigned int domid)
-{
-	struct domain *domain;
-
-	domain = find_domain_struct(domid);
-	return domain ? : alloc_domain(ctx, domid);
-}
-
 static int new_domain(struct domain *domain, int port, bool restore)
 {
 	int rc;
@@ -443,9 +465,13 @@ static struct domain *introduce_domain(const void *ctx,
 	struct xenstore_domain_interface *interface;
 	bool is_master_domain = (domid == xenbus_master_domid());
 
-	domain = find_or_alloc_domain(ctx, domid);
-	if (!domain)
+	check_domains();
+
+	domain = find_domain_struct(domid);
+	if (!domain) {
+		errno = ENOENT;
 		return NULL;
+	}
 
 	if (!domain->introduced) {
 		interface = is_master_domain ? xenbus_map()
@@ -650,7 +676,7 @@ int do_reset_watches(struct connection *conn, struct buffered_data *in)
 
 static int close_xc_handle(void *_handle)
 {
-	xc_interface_close(*(xc_interface**)_handle);
+	xencall_close(*(xencall_handle **)_handle);
 	return 0;
 }
 
@@ -741,11 +767,11 @@ void domain_init(int evtfd)
 {
 	int rc;
 
-	xc_handle = talloc(talloc_autofree_context(), xc_interface*);
+	xc_handle = talloc(talloc_autofree_context(), xencall_handle *);
 	if (!xc_handle)
 		barf_perror("Failed to allocate domain handle");
 
-	*xc_handle = xc_interface_open(0,0,0);
+	*xc_handle = xencall_open(NULL, 0);
 	if (!*xc_handle)
 		barf_perror("Failed to open connection to hypervisor");
 
@@ -821,7 +847,6 @@ void domain_entry_inc(struct connection *conn, struct node *node)
  * count (used for testing whether a node permission is older than a domain).
  *
  * Return values:
- * -1: error
  *  0: domain has higher generation count (it is younger than a node with the
  *     given count), or domain isn't existing any longer
  *  1: domain is older than the node
@@ -829,7 +854,6 @@ void domain_entry_inc(struct connection *conn, struct node *node)
 static int chk_domain_generation(unsigned int domid, uint64_t gen)
 {
 	struct domain *d;
-	xc_dominfo_t dominfo;
 
 	if (!xc_handle && domid == 0)
 		return 1;
@@ -838,11 +862,9 @@ static int chk_domain_generation(unsigned int domid, uint64_t gen)
 	if (d)
 		return (d->generation <= gen) ? 1 : 0;
 
-	if (!get_domain_info(domid, &dominfo))
-		return 0;
-
-	d = alloc_domain(NULL, domid);
-	return d ? 1 : -1;
+	check_domains();
+	d = find_domain_struct(domid);
+	return (d && d->generation <= gen) ? 1 : 0;
 }
 
 /*
@@ -855,8 +877,6 @@ int domain_adjust_node_perms(struct node *node)
 	int ret;
 
 	ret = chk_domain_generation(node->perms.p[0].id, node->generation);
-	if (ret < 0)
-		return errno;
 
 	/* If the owner doesn't exist any longer give it to priv domain. */
 	if (!ret)
@@ -867,8 +887,6 @@ int domain_adjust_node_perms(struct node *node)
 			continue;
 		ret = chk_domain_generation(node->perms.p[i].id,
 					    node->generation);
-		if (ret < 0)
-			return errno;
 		if (!ret)
 			node->perms.p[i].perms |= XS_PERM_IGNORE;
 	}
@@ -1300,16 +1318,21 @@ void read_state_connection(const void *ctx, const void *state)
 	} else {
 		domain = introduce_domain(ctx, sc->spec.ring.domid,
 					  sc->spec.ring.evtchn, true);
-		if (!domain)
+		if (!domain) {
+			/* Domain vanished during LM? */
+			if (errno = ENOENT)
+				return;
 			barf("domain allocation error");
+		}
 
 		if (sc->spec.ring.tdomid != DOMID_INVALID) {
-			tdomain = find_or_alloc_domain(ctx,
-						       sc->spec.ring.tdomid);
-			if (!tdomain)
+			tdomain = find_domain_struct(sc->spec.ring.tdomid);
+			if (!tdomain && errno != ENOENT)
 				barf("target domain allocation error");
-			talloc_reference(domain->conn, tdomain->conn);
-			domain->conn->target = tdomain->conn;
+			if (tdomain) {
+				talloc_reference(domain->conn, tdomain->conn);
+				domain->conn->target = tdomain->conn;
+			}
 		}
 		conn = domain->conn;
 	}
-- 
2.26.2



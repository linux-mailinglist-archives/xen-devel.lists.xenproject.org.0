Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 294ED2F7F42
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 16:17:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68278.122233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0QqL-0008Ve-Sh; Fri, 15 Jan 2021 15:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68278.122233; Fri, 15 Jan 2021 15:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0QqL-0008VF-PN; Fri, 15 Jan 2021 15:16:53 +0000
Received: by outflank-mailman (input) for mailman id 68278;
 Fri, 15 Jan 2021 15:16:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0QqJ-0008V2-RX
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 15:16:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37561ca7-f3e3-4e90-9227-e17659648cad;
 Fri, 15 Jan 2021 15:16:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8CF2AB7F;
 Fri, 15 Jan 2021 15:16:49 +0000 (UTC)
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
X-Inumbo-ID: 37561ca7-f3e3-4e90-9227-e17659648cad
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610723810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cGDf0nLE9ccD86KLyQflentxdwbR2U4DjzLOd/e33es=;
	b=Sm6BgcQrvNf3Ee7ayiJzN1o5f4PgwcqqHsr/E9muYa8tSMN92unLbtbV2wSzf3cg5Ma1T6
	PpDR0y6PMC8d9vHpx/xa8ihR7UDI8psM9uhw1cOV/YPmGP6+/oVzoRvMqyMaDqTjLWxhKZ
	IoZxdhI02jYdkNHHvmv6azl0Sk6rLMk=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] common: don't require use of DOMID_SELF
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Message-ID: <5ee17d3d-46a3-bba0-863b-6bd5947cf2e6@suse.com>
Date: Fri, 15 Jan 2021 16:16:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

It's not overly difficult for a domain to figure out its ID, so
requiring the use of DOMID_SELF in a very limited set of places isn't
really helpful towards keeping the ID opaque to the guest.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Comment on this version specific behavior in the respective public
    headers.

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -2776,15 +2776,19 @@ struct gnttab_copy_buf {
 static int gnttab_copy_lock_domain(domid_t domid, bool is_gref,
                                    struct gnttab_copy_buf *buf)
 {
-    /* Only DOMID_SELF may reference via frame. */
-    if ( domid != DOMID_SELF && !is_gref )
-        return GNTST_permission_denied;
-
     buf->domain = rcu_lock_domain_by_any_id(domid);
 
     if ( !buf->domain )
         return GNTST_bad_domain;
 
+    /* Only the local domain may reference via frame. */
+    if ( buf->domain != current->domain && !is_gref )
+    {
+        rcu_unlock_domain(buf->domain);
+        buf->domain = NULL;
+        return GNTST_permission_denied;
+    }
+
     buf->ptr.domid = domid;
 
     return GNTST_okay;
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2566,13 +2566,7 @@ __initcall(register_heap_trigger);
 
 struct domain *get_pg_owner(domid_t domid)
 {
-    struct domain *pg_owner = NULL, *curr = current->domain;
-
-    if ( unlikely(domid == curr->domain_id) )
-    {
-        gdprintk(XENLOG_WARNING, "Cannot specify itself as foreign domain\n");
-        goto out;
-    }
+    struct domain *pg_owner;
 
     switch ( domid )
     {
@@ -2590,7 +2584,6 @@ struct domain *get_pg_owner(domid_t domi
         break;
     }
 
- out:
     return pg_owner;
 }
 
--- a/xen/include/public/grant_table.h
+++ b/xen/include/public/grant_table.h
@@ -447,6 +447,12 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_
  * source_offset specifies an offset in the source frame, dest_offset
  * the offset in the target frame and  len specifies the number of
  * bytes to be copied.
+ *
+ * Note that operations not specifying GNTCOPY_*_gref will be restricted
+ * to the local domain for the respective operands (source and/or
+ * destination.  Note further that prior to Xen 4.15 only DOMID_SELF
+ * would be accepted to specify this, i.e. the actual ID of the local
+ * domain can only be used successfully on 4.15 and newer.
  */
 
 #define _GNTCOPY_source_gref      (0)
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -215,7 +215,10 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
  * @count is the length of the above array.
  * @pdone is an output parameter indicating number of completed operations
  * @foreigndom[15:0]: FD, the expected owner of data pages referenced in this
- *                    hypercall invocation. Can be DOMID_SELF.
+ *                    hypercall invocation. Can be DOMID_SELF or, for
+ *                    privileged callers, DOMID_IO or DOMID_XEN (see below).
+ *                    The calling domain can also be identified by its actual
+ *                    ID, but this will only work on Xen 4.15 and newer.
  * @foreigndom[31:16]: PFD, the expected owner of pagetable pages referenced
  *                     in this hypercall invocation. The value of this field
  *                     (x) encodes the PFD as follows:
@@ -364,7 +367,9 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
  * `                      unsigned int foreigndom)
  */
 /* HYPERVISOR_mmuext_op() accepts a list of mmuext_op structures.
- * A foreigndom (FD) can be specified (or DOMID_SELF for none).
+ * A foreigndom (FD) can be specified (or DOMID_SELF for none; the calling
+ * domain can also be identified by its actual ID, but this will only work
+ * on Xen 4.15 and newer).
  * Where the FD has some effect, it is described below.
  *
  * cmd: MMUEXT_(UN)PIN_*_TABLE
@@ -481,6 +486,11 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
  * ` @va: The virtual address whose mapping we want to change
  * ` @val: The new page table entry, must contain a machine address
  * ` @flags: Control TLB flushes
+ * ` @domid: The expected owner of data page referenced in this hypercall
+ * `         invocation. Can be DOMID_SELF or, for privileged callers, DOMID_IO
+ * `         or DOMID_XEN (see below). The calling domain can also be
+ * `         identified by its actual ID, but this will only work on Xen 4.15
+ * `         and newer.
  */
 /* These are passed as 'flags' to update_va_mapping. They can be ORed. */
 /* When specifying UVMF_MULTI, also OR in a pointer to a CPU bitmap.   */


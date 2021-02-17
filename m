Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB95831D7A7
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 11:46:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86201.161610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCKLM-0000BT-Dx; Wed, 17 Feb 2021 10:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86201.161610; Wed, 17 Feb 2021 10:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCKLM-0000B4-Aq; Wed, 17 Feb 2021 10:46:04 +0000
Received: by outflank-mailman (input) for mailman id 86201;
 Wed, 17 Feb 2021 10:46:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCKLK-0000Az-Gm
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 10:46:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 427a70d8-bde4-4401-b4b1-beb4744f5412;
 Wed, 17 Feb 2021 10:46:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C2AE5B1AB;
 Wed, 17 Feb 2021 10:46:00 +0000 (UTC)
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
X-Inumbo-ID: 427a70d8-bde4-4401-b4b1-beb4744f5412
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613558760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EkWeEv6ILJ0/X/gZ638Qi3CNdeAfWvOX5jOISvz4cYE=;
	b=MTK3OG8cAjod+VeIaR/YSVwwkk9abgMZFwLVj7zB9qAvvFVyFeFi5dKkwx3zPNWIgzrjvG
	Bb85kiMDcrhMKE/1h+h6IatAZUDUFJE2qANorzarHHrV0Nom6IdDdKCiA6hesNmePN2EvF
	WgV7Ux7SR21+djg1OQiqOm+Cac3V0dU=
Subject: [PATCH 1/3] gnttab: never permit mapping transitive grants
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <156559d5-853a-5bb9-942b-f623627e0907@suse.com>
Message-ID: <3620b977-4182-db2c-e2f9-71e1c6c4e721@suse.com>
Date: Wed, 17 Feb 2021 11:46:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <156559d5-853a-5bb9-942b-f623627e0907@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Transitive grants allow an intermediate domain I to grant a target
domain T access to a page which origin domain O did grant I access to.
As an implementation restriction, T is not allowed to map such a grant.
This restriction is currently tried to be enforced by marking active
entries resulting from transitive grants as is-sub-page; sub-page grants
for obvious reasons don't allow mapping. However, marking (and checking)
only active entries is insufficient, as a map attempt may also occur on
a grant not otherwise in use. When not presently in use (pin count zero)
the grant type itself needs checking. Otherwise T may be able to map an
unrelated page owned by I. This is because the "transitive" sub-
structure of the v2 union would end up being interpreted as "full_page"
sub-structure instead. The low 32 bits of the GFN used would match the
grant reference specified in I's transitive grant entry, while the upper
32 bits could be random (depending on how exactly I sets up its grant
table entries).

Note that if one mapping already exists and the granting domain _then_
changes the grant to GTF_transitive (which the domain is not supposed to
do), the changed type will only be honored after the pin count has gone
back to zero. This is no different from e.g. GTF_readonly or
GTF_sub_page becoming set when a grant is already in use.

While adjusting the implementation, also adjust commentary in the public
header to better reflect reality.

Fixes: 3672ce675c93 ("Transitive grant support")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -851,9 +851,10 @@ static int _set_status_v2(const grant_en
         mask |= GTF_sub_page;
 
     /* If not already pinned, check the grant domid and type. */
-    if ( !act->pin && ((((scombo.flags & mask) != GTF_permit_access) &&
-                        ((scombo.flags & mask) != GTF_transitive)) ||
-                       (scombo.domid != ldomid)) )
+    if ( !act->pin &&
+         ((((scombo.flags & mask) != GTF_permit_access) &&
+           (mapflag || ((scombo.flags & mask) != GTF_transitive))) ||
+          (scombo.domid != ldomid)) )
         PIN_FAIL(done, GNTST_general_error,
                  "Bad flags (%x) or dom (%d); expected d%d, flags %x\n",
                  scombo.flags, scombo.domid, ldomid, mask);
@@ -879,7 +880,7 @@ static int _set_status_v2(const grant_en
     if ( !act->pin )
     {
         if ( (((scombo.flags & mask) != GTF_permit_access) &&
-              ((scombo.flags & mask) != GTF_transitive)) ||
+              (mapflag || ((scombo.flags & mask) != GTF_transitive))) ||
              (scombo.domid != ldomid) ||
              (!readonly && (scombo.flags & GTF_readonly)) )
         {
--- a/xen/include/public/grant_table.h
+++ b/xen/include/public/grant_table.h
@@ -166,11 +166,13 @@ typedef struct grant_entry_v1 grant_entr
 #define GTF_type_mask       (3U<<0)
 
 /*
- * Subflags for GTF_permit_access.
+ * Subflags for GTF_permit_access and GTF_transitive.
  *  GTF_readonly: Restrict @domid to read-only mappings and accesses. [GST]
  *  GTF_reading: Grant entry is currently mapped for reading by @domid. [XEN]
  *  GTF_writing: Grant entry is currently mapped for writing by @domid. [XEN]
- *  GTF_PAT, GTF_PWT, GTF_PCD: (x86) cache attribute flags for the grant [GST]
+ * Further subflags for GTF_permit_access only.
+ *  GTF_PAT, GTF_PWT, GTF_PCD: (x86) cache attribute flags to be used for
+ *                             mappings of the grant [GST]
  *  GTF_sub_page: Grant access to only a subrange of the page.  @domid
  *                will only be allowed to copy from the grant, and not
  *                map it. [GST]



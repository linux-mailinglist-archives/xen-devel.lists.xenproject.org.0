Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C4931D685
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 09:23:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86161.161457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCI7V-00038C-AJ; Wed, 17 Feb 2021 08:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86161.161457; Wed, 17 Feb 2021 08:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCI7V-00037n-68; Wed, 17 Feb 2021 08:23:37 +0000
Received: by outflank-mailman (input) for mailman id 86161;
 Wed, 17 Feb 2021 08:23:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCI7T-00037d-Sc
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 08:23:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23ef8b20-fa74-49e5-bbfa-948cd9c0f6af;
 Wed, 17 Feb 2021 08:23:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 726B3B926;
 Wed, 17 Feb 2021 08:23:34 +0000 (UTC)
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
X-Inumbo-ID: 23ef8b20-fa74-49e5-bbfa-948cd9c0f6af
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613550214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e67EQSav/B2t339nJdJXrH2VD3Eb4kam/ZfJ4x2oFeo=;
	b=DzUrPXTx9dh4UaCf0KdD/Xf2NdXoreX1z0q9cXNSYlhaT8AE/rbrEMsLr9zxlchRMblcz0
	Azj2XdComQn+sFem/DcXTFLI6h7M483P9EVDXZzDY1RuknXQjld7wRltXiNtXfY90amog7
	GEAH2FEp3t2FNi3eeJGqEIRt2V4K9ao=
Subject: [PATCH v2 8/8] x86/PV: use get_unsafe() instead of copy_from_unsafe()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
Message-ID: <0a59ae2f-448e-610d-e8a2-a7c3f9f3918f@suse.com>
Date: Wed, 17 Feb 2021 09:23:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The former expands to a single (memory accessing) insn, which the latter
does not guarantee. Yet we'd prefer to read consistent PTEs rather than
risking a split read racing with an update done elsewhere.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/pv/mm.c
+++ b/xen/arch/x86/pv/mm.c
@@ -41,9 +41,7 @@ l1_pgentry_t *map_guest_l1e(unsigned lon
         return NULL;
 
     /* Find this l1e and its enclosing l1mfn in the linear map. */
-    if ( copy_from_unsafe(&l2e,
-                          &__linear_l2_table[l2_linear_offset(linear)],
-                          sizeof(l2_pgentry_t)) )
+    if ( get_unsafe(l2e, &__linear_l2_table[l2_linear_offset(linear)]) )
         return NULL;
 
     /* Check flags that it will be safe to read the l1e. */
--- a/xen/arch/x86/pv/mm.h
+++ b/xen/arch/x86/pv/mm.h
@@ -22,9 +22,7 @@ static inline l1_pgentry_t guest_get_eff
         toggle_guest_pt(curr);
 
     if ( unlikely(!__addr_ok(linear)) ||
-         copy_from_unsafe(&l1e,
-                          &__linear_l1_table[l1_linear_offset(linear)],
-                          sizeof(l1_pgentry_t)) )
+         get_unsafe(l1e, &__linear_l1_table[l1_linear_offset(linear)]) )
         l1e = l1e_empty();
 
     if ( user_mode )



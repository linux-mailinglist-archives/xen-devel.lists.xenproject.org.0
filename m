Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C92CE2F63C8
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:09:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67123.119545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04Fh-0006as-Qf; Thu, 14 Jan 2021 15:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67123.119545; Thu, 14 Jan 2021 15:09:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04Fh-0006aR-Lf; Thu, 14 Jan 2021 15:09:33 +0000
Received: by outflank-mailman (input) for mailman id 67123;
 Thu, 14 Jan 2021 15:09:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l04Ff-0006a8-Ie
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:09:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0219fe39-0d73-4fd9-adef-c501898c054c;
 Thu, 14 Jan 2021 15:09:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 08E40B934;
 Thu, 14 Jan 2021 15:09:30 +0000 (UTC)
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
X-Inumbo-ID: 0219fe39-0d73-4fd9-adef-c501898c054c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610636970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Am/RzvAanW2RWYxr36XH1wv7OHtzlAAuPycWFiiLLZA=;
	b=Cxz7+8/SxnwHxgRThhLDIl+WYiuV4ufvOEe8SlC5u/NJFj1Ez1ngw+2LRTQw1d/fR2925V
	24C5wMdcC+WtwmYevpdBlGjM9JDbtB2jaDvpxfHV6mApEnv6RFy1stywUd36DjP+LHMnTi
	NV4G8of1bgnujGtY5ZbaLXEqkHhyYIw=
Subject: [PATCH 13/17] x86/shadow: don't open-code SHF_* shorthands
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Message-ID: <6266b825-d43c-813c-a62a-a61c77d17404@suse.com>
Date: Thu, 14 Jan 2021 16:09:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Use SHF_L1_ANY, SHF_32, SHF_PAE, as well as SHF_64, and introduce
SHF_FL1_ANY.

Note that in shadow_audit_tables() this has the effect of no longer
(I assume mistakenly, or else I don't see why the respective callback
table entry isn't NULL) excluding SHF_L2H_64.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1827,14 +1827,7 @@ int sh_remove_write_access(struct domain
         NULL  /* unused  */
     };
 
-    static const unsigned int callback_mask =
-          SHF_L1_32
-        | SHF_FL1_32
-        | SHF_L1_PAE
-        | SHF_FL1_PAE
-        | SHF_L1_64
-        | SHF_FL1_64
-        ;
+    static const unsigned int callback_mask = SHF_L1_ANY | SHF_FL1_ANY;
     struct page_info *pg = mfn_to_page(gmfn);
 #if SHADOW_OPTIMIZATIONS & SHOPT_WRITABLE_HEURISTIC
     struct vcpu *curr = current;
@@ -2057,14 +2050,7 @@ int sh_remove_all_mappings(struct domain
         NULL  /* unused  */
     };
 
-    static const unsigned int callback_mask =
-          SHF_L1_32
-        | SHF_FL1_32
-        | SHF_L1_PAE
-        | SHF_FL1_PAE
-        | SHF_L1_64
-        | SHF_FL1_64
-        ;
+    static const unsigned int callback_mask = SHF_L1_ANY | SHF_FL1_ANY;
 
     perfc_incr(shadow_mappings);
     if ( sh_check_page_has_no_refs(page) )
@@ -3411,11 +3397,9 @@ void shadow_audit_tables(struct vcpu *v)
         /* Audit only the current mode's tables */
         switch ( v->arch.paging.mode->guest_levels )
         {
-        case 2: mask = (SHF_L1_32|SHF_FL1_32|SHF_L2_32); break;
-        case 3: mask = (SHF_L1_PAE|SHF_FL1_PAE|SHF_L2_PAE
-                        |SHF_L2H_PAE); break;
-        case 4: mask = (SHF_L1_64|SHF_FL1_64|SHF_L2_64
-                        |SHF_L3_64|SHF_L4_64); break;
+        case 2: mask = SHF_32; break;
+        case 3: mask = SHF_PAE; break;
+        case 4: mask = SHF_64; break;
         default: BUG();
         }
     }
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -269,6 +269,7 @@ static inline void sh_terminate_list(str
 #define SHF_64  (SHF_L1_64|SHF_FL1_64|SHF_L2_64|SHF_L2H_64|SHF_L3_64|SHF_L4_64)
 
 #define SHF_L1_ANY  (SHF_L1_32|SHF_L1_PAE|SHF_L1_64)
+#define SHF_FL1_ANY (SHF_FL1_32|SHF_FL1_PAE|SHF_FL1_64)
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
 /* Marks a guest L1 page table which is shadowed but not write-protected.



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 607782F63B5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:08:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67107.119509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04EF-00065I-PG; Thu, 14 Jan 2021 15:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67107.119509; Thu, 14 Jan 2021 15:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04EF-00064u-LY; Thu, 14 Jan 2021 15:08:03 +0000
Received: by outflank-mailman (input) for mailman id 67107;
 Thu, 14 Jan 2021 15:08:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l04EE-00064l-Qy
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:08:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 286f56e5-b6e6-402f-b895-bb2f1914f406;
 Thu, 14 Jan 2021 15:08:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 22D6AAC24;
 Thu, 14 Jan 2021 15:08:01 +0000 (UTC)
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
X-Inumbo-ID: 286f56e5-b6e6-402f-b895-bb2f1914f406
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610636881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c3HBqnzzQs9nMAH2OqYgmiUU95FbCCVzfJE2fKjlwYw=;
	b=mkY6rraNPw9IXAJ2QmsClE9z8xmoEhpcZW/UkLP8W7MPUygA5eRO4q9EhJnKfT4sqqRvAk
	tMlcwAa8zXEsFeqBS3HwAD84RCQKfA9xdMqnZhRpZ18t8sS1asJ4pOjT6LXAIlzxvYt0QV
	jTrC0TQEE+Ma1UI8aGQfNJX8TcEo/7Y=
Subject: [PATCH 10/17] x86/shadow: use get_unsafe() instead of
 copy_from_unsafe()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Message-ID: <95f4b531-caf7-0f6b-0320-72912eac5569@suse.com>
Date: Thu, 14 Jan 2021 16:08:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This is the slightly more direct way of getting at what we want, and
better in line with shadow_write_entries()'s use of put_unsafe().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2614,10 +2614,9 @@ static int sh_page_fault(struct vcpu *v,
         {
             shadow_l2e_t sl2e;
             mfn_t gl1mfn;
-            if ( (copy_from_unsafe(&sl2e,
-                                   (sh_linear_l2_table(v)
-                                    + shadow_l2_linear_offset(va)),
-                                   sizeof(sl2e)) != 0)
+            if ( (get_unsafe(sl2e,
+                             (sh_linear_l2_table(v) +
+                              shadow_l2_linear_offset(va))) != 0)
                  || !(shadow_l2e_get_flags(sl2e) & _PAGE_PRESENT)
                  || !mfn_valid(gl1mfn = backpointer(mfn_to_page(
                                   shadow_l2e_get_mfn(sl2e))))
@@ -2633,10 +2632,9 @@ static int sh_page_fault(struct vcpu *v,
 #endif /* SHOPT_OUT_OF_SYNC */
         /* The only reasons for reserved bits to be set in shadow entries
          * are the two "magic" shadow_l1e entries. */
-        if ( likely((copy_from_unsafe(&sl1e,
-                                      (sh_linear_l1_table(v)
-                                       + shadow_l1_linear_offset(va)),
-                                      sizeof(sl1e)) == 0)
+        if ( likely((get_unsafe(sl1e,
+                                (sh_linear_l1_table(v) +
+                                 shadow_l1_linear_offset(va))) == 0)
                     && sh_l1e_is_magic(sl1e)) )
         {
 
@@ -3311,9 +3309,9 @@ static bool sh_invlpg(struct vcpu *v, un
         /* This must still be a copy-from-unsafe because we don't have the
          * paging lock, and the higher-level shadows might disappear
          * under our feet. */
-        if ( copy_from_unsafe(&sl3e, (sh_linear_l3_table(v)
-                                      + shadow_l3_linear_offset(linear)),
-                              sizeof (sl3e)) != 0 )
+        if ( get_unsafe(sl3e,
+                        (sh_linear_l3_table(v) +
+                         shadow_l3_linear_offset(linear))) != 0 )
         {
             perfc_incr(shadow_invlpg_fault);
             return false;
@@ -3332,9 +3330,9 @@ static bool sh_invlpg(struct vcpu *v, un
 
     /* This must still be a copy-from-unsafe because we don't have the shadow
      * lock, and the higher-level shadows might disappear under our feet. */
-    if ( copy_from_unsafe(&sl2e,
-                          sh_linear_l2_table(v) + shadow_l2_linear_offset(linear),
-                          sizeof (sl2e)) != 0 )
+    if ( get_unsafe(sl2e,
+                    (sh_linear_l2_table(v) +
+                     shadow_l2_linear_offset(linear))) != 0 )
     {
         perfc_incr(shadow_invlpg_fault);
         return false;
@@ -3375,10 +3373,9 @@ static bool sh_invlpg(struct vcpu *v, un
              * have the paging lock last time we checked, and the
              * higher-level shadows might have disappeared under our
              * feet. */
-            if ( copy_from_unsafe(&sl2e,
-                                  sh_linear_l2_table(v)
-                                  + shadow_l2_linear_offset(linear),
-                                  sizeof (sl2e)) != 0 )
+            if ( get_unsafe(sl2e,
+                            (sh_linear_l2_table(v) +
+                             shadow_l2_linear_offset(linear))) != 0 )
             {
                 perfc_incr(shadow_invlpg_fault);
                 paging_unlock(d);



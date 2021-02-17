Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBAD31D684
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 09:23:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86157.161444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCI6y-00031E-0q; Wed, 17 Feb 2021 08:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86157.161444; Wed, 17 Feb 2021 08:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCI6x-00030o-TG; Wed, 17 Feb 2021 08:23:03 +0000
Received: by outflank-mailman (input) for mailman id 86157;
 Wed, 17 Feb 2021 08:23:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCI6w-00030g-DB
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 08:23:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f2ca825-4c10-4e89-ac6c-415e0ff5ded6;
 Wed, 17 Feb 2021 08:23:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 35FB9B926;
 Wed, 17 Feb 2021 08:23:00 +0000 (UTC)
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
X-Inumbo-ID: 4f2ca825-4c10-4e89-ac6c-415e0ff5ded6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613550180; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q8/6WRQIWFwJzkQJIPD65ozYOHWLMe51rYFHqRcSohA=;
	b=ZUi7cArqJrGBozceb78RVr3NSFRmzNXE1MiWZN/tiPbvDbJsMSawfDawf6oIOIoacT4LXd
	E3ZJcL5xvWEiBTO0Hr+lQ6s82NOe44lDL/2osqH3yIpDg3cwGDXaNgA+3aaJ9E45TrtThL
	iIVtIZn+iB0/v3leNVtwXRHE0+X0CiQ=
Subject: [PATCH v2 7/8] x86: move stac()/clac() from {get,put}_unsafe_asm()
 ...
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
Message-ID: <c817e9be-bcdf-3c38-2298-0a3a58773964@suse.com>
Date: Wed, 17 Feb 2021 09:22:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

... to {get,put}_unsafe_size(). There's no need to have the macros
expanded once per case label in the latter. This also makes the former
well-formed single statements again. No change in generated code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/asm-x86/uaccess.h
+++ b/xen/include/asm-x86/uaccess.h
@@ -154,7 +154,6 @@ struct __large_struct { unsigned long bu
  * aliasing issues.
  */
 #define put_unsafe_asm(x, addr, GUARD, err, itype, rtype, ltype, errret) \
-	stac();								\
 	__asm__ __volatile__(						\
 		GUARD(							\
 		"	guest_access_mask_ptr %[ptr], %[scr1], %[scr2]\n" \
@@ -169,11 +168,9 @@ struct __large_struct { unsigned long bu
 		: [ret] "+r" (err), [ptr] "=&r" (dummy_)		\
 		  GUARD(, [scr1] "=&r" (dummy_), [scr2] "=&r" (dummy_))	\
 		: [val] ltype (x), "m" (__m(addr)),			\
-		  "[ptr]" (addr), [errno] "i" (errret));		\
-	clac()
+		  "[ptr]" (addr), [errno] "i" (errret))
 
 #define get_unsafe_asm(x, addr, GUARD, err, rtype, ltype, errret)	\
-	stac();								\
 	__asm__ __volatile__(						\
 		GUARD(							\
 		"	guest_access_mask_ptr %[ptr], %[scr1], %[scr2]\n" \
@@ -190,12 +187,12 @@ struct __large_struct { unsigned long bu
 		  [ptr] "=&r" (dummy_)					\
 		  GUARD(, [scr1] "=&r" (dummy_), [scr2] "=&r" (dummy_))	\
 		: "m" (__m(addr)), "[ptr]" (addr),			\
-		  [errno] "i" (errret));				\
-	clac()
+		  [errno] "i" (errret))
 
 #define put_unsafe_size(x, ptr, size, grd, retval, errret)                 \
 do {                                                                       \
     retval = 0;                                                            \
+    stac();                                                                \
     switch ( size )                                                        \
     {                                                                      \
     long dummy_;                                                           \
@@ -213,6 +210,7 @@ do {
         break;                                                             \
     default: __put_user_bad();                                             \
     }                                                                      \
+    clac();                                                                \
 } while ( false )
 
 #define put_guest_size(x, ptr, size, retval, errret) \
@@ -221,6 +219,7 @@ do {
 #define get_unsafe_size(x, ptr, size, grd, retval, errret)                 \
 do {                                                                       \
     retval = 0;                                                            \
+    stac();                                                                \
     switch ( size )                                                        \
     {                                                                      \
     long dummy_;                                                           \
@@ -230,6 +229,7 @@ do {
     case 8: get_unsafe_asm(x, ptr, grd, retval,  "", "=r", errret); break; \
     default: __get_user_bad();                                             \
     }                                                                      \
+    clac();                                                                \
 } while ( false )
 
 #define get_guest_size(x, ptr, size, retval, errret)                       \


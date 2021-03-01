Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D67D23278B7
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 08:57:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91307.172555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdQe-0005C6-G8; Mon, 01 Mar 2021 07:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91307.172555; Mon, 01 Mar 2021 07:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdQe-0005Bh-D4; Mon, 01 Mar 2021 07:57:20 +0000
Received: by outflank-mailman (input) for mailman id 91307;
 Mon, 01 Mar 2021 07:57:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lGdQc-0005Bc-Bt
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 07:57:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5c1ae32-e259-421f-8712-e8c3d8f3f140;
 Mon, 01 Mar 2021 07:57:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C8DBFAAC5;
 Mon,  1 Mar 2021 07:57:15 +0000 (UTC)
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
X-Inumbo-ID: f5c1ae32-e259-421f-8712-e8c3d8f3f140
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614585435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Bm618ENHOLlPwZbs+NnfWMXdyQyfD9kLXr1Ug/4Lg1k=;
	b=JCakssBrBePqAAzizP9LOlOF43sKGgMfHEd0ChrLAksTVJPRuyKQ7SVk86rlQ9Uei15JCh
	iohchgdET0NjgqExnHkZPZiyYnRnyCYyZ7gMUkBTSJvtw50tsGlObo+sb2E54L8rS+Yn60
	5X88fiA7yNHfbQajWm/cwza9u3jyec8=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH][4.15] crypto: adjust rijndaelEncrypt() prototype for gcc11
Message-ID: <05fe3295-7993-2eb5-37bc-a6d04fde1fbc@suse.com>
Date: Mon, 1 Mar 2021 08:57:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The upcoming release complains, not entirely unreasonably:

In file included from rijndael.c:33:
.../xen/include/crypto/rijndael.h:55:53: note: previously declared as 'const unsigned char[]'
   55 | void    rijndaelEncrypt(const unsigned int [], int, const unsigned char [],
      |                                                     ^~~~~~~~~~~~~~~~~~~~~~
rijndael.c:865:8: error: argument 4 of type 'u8[16]' {aka 'unsigned char[16]'} with mismatched bound [-Werror=array-parameter=]
  865 |     u8 ct[16])
      |     ~~~^~~~~~
In file included from rijndael.c:33:
.../xen/include/crypto/rijndael.h:56:13: note: previously declared as 'unsigned char[]'
   56 |             unsigned char []);
      |             ^~~~~~~~~~~~~~~~

While it's not really clear to me why it would complain only for arg 4,
the adjustment to make is obvious and riskfree also for arg 3: Simply
declare the correct array dimension right away. This then allows
compilers to apply checking at call sites, which seems desirable anyway.

For the moment I'm leaving untouched the disagreement between u8/u32
used in the function definition and unsigned {char,int} used in the
declaration, as making this consistent would call for touching further
functions.

Reported-by: Charles Arnold <carnold@suse.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
There are quite a few more issues with gcc11, but from my brief initial
inspection I'm suspecting (hoping) it'll rather be the compiler which
will get further changed by the time their release gets finalized. Just
one example:

.../xen/include/xen/string.h:101:27: error: '__builtin_memcmp' specified bound 4 exceeds source size 0 [-Werror=stringop-overread]
  101 | #define memcmp(s1, s2, n) __builtin_memcmp(s1, s2, n)
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
mpparse.c:722:13: note: in expansion of macro 'memcmp'
  722 |         if (memcmp(mpf->mpf_signature, "_MP_", 4) == 0 &&
      |             ^~~~~~

Clearly neither the 1st nor the 2nd argument have a "source size" of 0.

--- a/xen/include/crypto/rijndael.h
+++ b/xen/include/crypto/rijndael.h
@@ -52,7 +52,7 @@
 
 int	rijndaelKeySetupEnc(unsigned int [], const unsigned char [], int);
 int	rijndaelKeySetupDec(unsigned int [], const unsigned char [], int);
-void	rijndaelEncrypt(const unsigned int [], int, const unsigned char [],
-	    unsigned char []);
+void	rijndaelEncrypt(const unsigned int [], int, const unsigned char [16],
+	    unsigned char [16]);
 
 #endif /* __RIJNDAEL_H */


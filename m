Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E8F28DA42
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 09:05:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6453.17234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSaq4-0000Iz-Du; Wed, 14 Oct 2020 07:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6453.17234; Wed, 14 Oct 2020 07:04:44 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSaq4-0000IY-9x; Wed, 14 Oct 2020 07:04:44 +0000
Received: by outflank-mailman (input) for mailman id 6453;
 Wed, 14 Oct 2020 07:04:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSaq2-0000IS-2l
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 07:04:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 143d503c-88ea-4aed-bf79-e8af03dbba46;
 Wed, 14 Oct 2020 07:04:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6C44AB169;
 Wed, 14 Oct 2020 07:04:39 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VoTD=DV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSaq2-0000IS-2l
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 07:04:42 +0000
X-Inumbo-ID: 143d503c-88ea-4aed-bf79-e8af03dbba46
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 143d503c-88ea-4aed-bf79-e8af03dbba46;
	Wed, 14 Oct 2020 07:04:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602659079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TZDZBNYVYrkv3gZtVC6CWqF2fciZ1h1jgulCFx4UWnY=;
	b=vEAg3gHJgHkZQlMrzgRfLjOfMhku/i+k3joQnjDyq/wx1qT+UON7OzYtqYQMTzKyY+7KMR
	tl0TRjP2JoCZCxeqrRajk1GqH3MavzMidDUGIFXwkRyF5JnNpyE5umZDyaCs03tgXA14BT
	R4mrucoGXxmOE+c0mG1vEV7Hwet5W9k=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6C44AB169;
	Wed, 14 Oct 2020 07:04:39 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] drop xen/hash.h
Message-ID: <c398362b-6a09-a67f-50a9-b43b73fbd265@suse.com>
Date: Wed, 14 Oct 2020 09:04:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

It has no users and hasn't been touched in 10 years.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xen/hash.h
+++ /dev/null
@@ -1,58 +0,0 @@
-#ifndef _XEN_HASH_H
-#define _XEN_HASH_H
-/* Fast hashing routine for a long.
-   (C) 2002 William Lee Irwin III, IBM */
-
-/*
- * Knuth recommends primes in approximately golden ratio to the maximum
- * integer representable by a machine word for multiplicative hashing.
- * Chuck Lever verified the effectiveness of this technique:
- * http://www.citi.umich.edu/techreports/reports/citi-tr-00-1.pdf
- *
- * These primes are chosen to be bit-sparse, that is operations on
- * them can use shifts and additions instead of multiplications for
- * machines where multiplications are slow.
- */
-#if BITS_PER_LONG == 32
-/* 2^31 + 2^29 - 2^25 + 2^22 - 2^19 - 2^16 + 1 */
-#define GOLDEN_RATIO_PRIME 0x9e370001UL
-#elif BITS_PER_LONG == 64
-/*  2^63 + 2^61 - 2^57 + 2^54 - 2^51 - 2^18 + 1 */
-#define GOLDEN_RATIO_PRIME 0x9e37fffffffc0001UL
-#else
-#error Define GOLDEN_RATIO_PRIME for your wordsize.
-#endif
-
-static inline unsigned long hash_long(unsigned long val, unsigned int bits)
-{
-    unsigned long hash = val;
-
-#if BITS_PER_LONG == 64
-    /*  Sigh, gcc can't optimise this alone like it does for 32 bits. */
-    unsigned long n = hash;
-    n <<= 18;
-    hash -= n;
-    n <<= 33;
-    hash -= n;
-    n <<= 3;
-    hash += n;
-    n <<= 3;
-    hash -= n;
-    n <<= 4;
-    hash += n;
-    n <<= 2;
-    hash += n;
-#else
-    /* On some cpus multiply is faster, on others gcc will do shifts */
-    hash *= GOLDEN_RATIO_PRIME;
-#endif
-
-    /* High bits are more random, so use them. */
-    return hash >> (BITS_PER_LONG - bits);
-}
- 
-static inline unsigned long hash_ptr(void *ptr, unsigned int bits)
-{
-    return hash_long((unsigned long)ptr, bits);
-}
-#endif /* _XEN_HASH_H */


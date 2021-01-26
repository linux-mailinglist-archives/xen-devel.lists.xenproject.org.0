Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 124A7303973
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 10:51:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74732.134340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4L06-00019r-Oq; Tue, 26 Jan 2021 09:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74732.134340; Tue, 26 Jan 2021 09:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4L06-00019R-LN; Tue, 26 Jan 2021 09:51:06 +0000
Received: by outflank-mailman (input) for mailman id 74732;
 Tue, 26 Jan 2021 09:51:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4L05-00019E-9l
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 09:51:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 847934c1-74f9-41b2-864e-a4791bbcc5b9;
 Tue, 26 Jan 2021 09:51:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7801CAE40;
 Tue, 26 Jan 2021 09:51:03 +0000 (UTC)
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
X-Inumbo-ID: 847934c1-74f9-41b2-864e-a4791bbcc5b9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611654663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kI7/dlB+nykep5k8tkQbgg5svw4MBZtWSOUhKGSPGrs=;
	b=ASg9I2mgrIPFqWXfQXI/ZjhdaPIh2gkoTMFNxQ4mOyeOMrIk1TW8w156fYxuN8HjjOYIdl
	wlTxzULVge0h+BMIbu8Bilu0mHGErOELdb/dgYR3ubR5Xs7Q7aMti0zzTtHIFAuhfqi9T+
	UDRXa8Uc+dZPryUGFDEWCkGlwkmf1g4=
Subject: [PATCH v3 08/15] bunzip: replace INIT
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Message-ID: <9069acc9-7e86-a0c7-5ec9-e12d674bb834@suse.com>
Date: Tue, 26 Jan 2021 10:51:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While tools/libs/guest/xg_private.h has its own (non-conflicting for our
purposes) __init, which hence needs to be #undef-ed, there's no other
need for this abstraction.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/common/decompress.h
+++ b/xen/common/decompress.h
@@ -23,6 +23,10 @@
 #define INIT
 #define INITDATA
 
+#undef __init /* tools/libs/guest/xg_private.h has its own one */
+#define __init
+#define __initdata
+
 #define large_malloc malloc
 #define large_free free
 
--- a/xen/common/bunzip2.c
+++ b/xen/common/bunzip2.c
@@ -104,7 +104,7 @@ struct bunzip_data {
 
 /* Return the next nnn bits of input.  All reads from the compressed input
    are done through this function.  All reads are big endian */
-static unsigned int INIT get_bits(struct bunzip_data *bd, char bits_wanted)
+static unsigned int __init get_bits(struct bunzip_data *bd, char bits_wanted)
 {
 	unsigned int bits = 0;
 
@@ -144,7 +144,7 @@ static unsigned int INIT get_bits(struct
 
 /* Unpacks the next block and sets up for the inverse burrows-wheeler step. */
 
-static int INIT get_next_block(struct bunzip_data *bd)
+static int __init get_next_block(struct bunzip_data *bd)
 {
 	struct group_data *hufGroup = NULL;
 	int *base = NULL;
@@ -509,7 +509,7 @@ got_huff_bits:
    are ignored, data is written to out_fd and return is RETVAL_OK or error.
 */
 
-static int INIT read_bunzip(struct bunzip_data *bd, unsigned char *outbuf, int len)
+static int __init read_bunzip(struct bunzip_data *bd, unsigned char *outbuf, int len)
 {
 	const unsigned int *dbuf;
 	int pos, xcurrent, previous, gotcount;
@@ -607,7 +607,7 @@ decode_next_byte:
 	goto decode_next_byte;
 }
 
-static int INIT nofill(void *buf, unsigned int len)
+static int __init nofill(void *buf, unsigned int len)
 {
 	return -1;
 }
@@ -615,8 +615,8 @@ static int INIT nofill(void *buf, unsign
 /* Allocate the structure, read file header.  If in_fd ==-1, inbuf must contain
    a complete bunzip file (len bytes long).  If in_fd!=-1, inbuf and len are
    ignored, and data is read from file handle into temporary buffer. */
-static int INIT start_bunzip(struct bunzip_data **bdp, void *inbuf, int len,
-			     int (*fill)(void*, unsigned int))
+static int __init start_bunzip(struct bunzip_data **bdp, void *inbuf, int len,
+			       int (*fill)(void*, unsigned int))
 {
 	struct bunzip_data *bd;
 	unsigned int i, j, c;
@@ -665,11 +665,11 @@ static int INIT start_bunzip(struct bunz
 
 /* Example usage: decompress src_fd to dst_fd.  (Stops at end of bzip2 data,
    not end of file.) */
-int INIT bunzip2(unsigned char *buf, unsigned int len,
-		 int(*fill)(void*, unsigned int),
-		 int(*flush)(void*, unsigned int),
-		 unsigned char *outbuf, unsigned int *pos,
-		 void(*error)(const char *x))
+int __init bunzip2(unsigned char *buf, unsigned int len,
+		   int(*fill)(void*, unsigned int),
+		   int(*flush)(void*, unsigned int),
+		   unsigned char *outbuf, unsigned int *pos,
+		   void(*error)(const char *x))
 {
 	struct bunzip_data *bd;
 	int i = -1;



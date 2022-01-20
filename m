Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 640E9494D96
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 13:02:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259041.446752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAW9M-0008Mj-Ko; Thu, 20 Jan 2022 12:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259041.446752; Thu, 20 Jan 2022 12:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAW9M-0008Fi-EC; Thu, 20 Jan 2022 12:02:44 +0000
Received: by outflank-mailman (input) for mailman id 259041;
 Thu, 20 Jan 2022 12:02:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fK7G=SE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nAW9K-0007aq-DS
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 12:02:42 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddb15cdf-79e8-11ec-bc18-3156f6d857e4;
 Thu, 20 Jan 2022 13:02:40 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DD3ED210FA;
 Thu, 20 Jan 2022 12:02:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B0C7A13B51;
 Thu, 20 Jan 2022 12:02:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sFvjKV9P6WF5UwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 20 Jan 2022 12:02:39 +0000
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
X-Inumbo-ID: ddb15cdf-79e8-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642680159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4wm40Alsny5wX/z5bwEa7HgretT0TQtgGgtRQ8V8VBY=;
	b=Zjw18zdEMPiJnP2Fud4sGP8xYZciGwKS4XM18OxVGyk+rEq9gZWW0Shs5X71YfIS6uzkNg
	sYrSTH1fftPapS3m/Gem0wcgbVI6XDUMA/cJ26wMpM+TcWkGQ/lf+FO90+6zp3HbW+pcrc
	Z0YYO2kTtpm1DoTI8dnKhbC66y85RNA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 3/3] tools/xenstore: drop DEFINE_HASHTABLE_* macros and usage intro
Date: Thu, 20 Jan 2022 13:02:36 +0100
Message-Id: <20220120120236.13826-4-jgross@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220120120236.13826-1-jgross@suse.com>
References: <20220120120236.13826-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DEFINE_HASHTABLE_* macros are used nowhere, so drop them. The usage
intro isn't needed either with those macros dropped.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/hashtable.h | 76 --------------------------------------
 1 file changed, 76 deletions(-)

diff --git a/tools/xenstore/hashtable.h b/tools/xenstore/hashtable.h
index b90781abd4..62fef6081a 100644
--- a/tools/xenstore/hashtable.h
+++ b/tools/xenstore/hashtable.h
@@ -5,62 +5,6 @@
 
 struct hashtable;
 
-/* Example of use:
- *
- *      struct hashtable  *h;
- *      struct some_key   *k;
- *      struct some_value *v;
- *
- *      static unsigned int         hash_from_key_fn( void *k );
- *      static int                  keys_equal_fn ( void *key1, void *key2 );
- *
- *      h = create_hashtable(16, hash_from_key_fn, keys_equal_fn);
- *      k = (struct some_key *)     malloc(sizeof(struct some_key));
- *      v = (struct some_value *)   malloc(sizeof(struct some_value));
- *
- *      (initialise k and v to suitable values)
- * 
- *      if (! hashtable_insert(h,k,v) )
- *      {     exit(-1);               }
- *
- *      if (NULL == (found = hashtable_search(h,k) ))
- *      {    printf("not found!");                  }
- *
- *      if (NULL == (found = hashtable_remove(h,k) ))
- *      {    printf("Not found\n");                 }
- *
- */
-
-/* Macros may be used to define type-safe(r) hashtable access functions, with
- * methods specialized to take known key and value types as parameters.
- * 
- * Example:
- *
- * Insert this at the start of your file:
- *
- * DEFINE_HASHTABLE_INSERT(insert_some, struct some_key, struct some_value);
- * DEFINE_HASHTABLE_SEARCH(search_some, struct some_key, struct some_value);
- * DEFINE_HASHTABLE_REMOVE(remove_some, struct some_key, struct some_value);
- *
- * This defines the functions 'insert_some', 'search_some' and 'remove_some'.
- * These operate just like hashtable_insert etc., with the same parameters,
- * but their function signatures have 'struct some_key *' rather than
- * 'void *', and hence can generate compile time errors if your program is
- * supplying incorrect data as a key (and similarly for value).
- *
- * Note that the hash and key equality functions passed to create_hashtable
- * still take 'void *' parameters instead of 'some key *'. This shouldn't be
- * a difficult issue as they're only defined and passed once, and the other
- * functions will ensure that only valid keys are supplied to them.
- *
- * The cost for this checking is increased code size and runtime overhead
- * - if performance is important, it may be worth switching back to the
- * unsafe methods once your program has been debugged with the safe methods.
- * This just requires switching to some simple alternative defines - eg:
- * #define insert_some hashtable_insert
- *
- */
-
 /*****************************************************************************
  * create_hashtable
    
@@ -98,12 +42,6 @@ create_hashtable(unsigned int minsize,
 int 
 hashtable_insert(struct hashtable *h, void *k, void *v);
 
-#define DEFINE_HASHTABLE_INSERT(fnname, keytype, valuetype) \
-int fnname (struct hashtable *h, keytype *k, valuetype *v) \
-{ \
-    return hashtable_insert(h,k,v); \
-}
-
 /*****************************************************************************
  * hashtable_search
    
@@ -116,12 +54,6 @@ int fnname (struct hashtable *h, keytype *k, valuetype *v) \
 void *
 hashtable_search(struct hashtable *h, void *k);
 
-#define DEFINE_HASHTABLE_SEARCH(fnname, keytype, valuetype) \
-valuetype * fnname (struct hashtable *h, keytype *k) \
-{ \
-    return (valuetype *) (hashtable_search(h,k)); \
-}
-
 /*****************************************************************************
  * hashtable_remove
    
@@ -134,13 +66,6 @@ valuetype * fnname (struct hashtable *h, keytype *k) \
 void * /* returns value */
 hashtable_remove(struct hashtable *h, void *k);
 
-#define DEFINE_HASHTABLE_REMOVE(fnname, keytype, valuetype) \
-valuetype * fnname (struct hashtable *h, keytype *k) \
-{ \
-    return (valuetype *) (hashtable_remove(h,k)); \
-}
-
-
 /*****************************************************************************
  * hashtable_count
    
@@ -151,7 +76,6 @@ valuetype * fnname (struct hashtable *h, keytype *k) \
 unsigned int
 hashtable_count(struct hashtable *h);
 
-
 /*****************************************************************************
  * hashtable_destroy
    
-- 
2.31.1



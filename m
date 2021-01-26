Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0D3303980
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 10:52:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74747.134375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4L1B-0001W0-Ky; Tue, 26 Jan 2021 09:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74747.134375; Tue, 26 Jan 2021 09:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4L1B-0001VW-HF; Tue, 26 Jan 2021 09:52:13 +0000
Received: by outflank-mailman (input) for mailman id 74747;
 Tue, 26 Jan 2021 09:52:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4L1A-0001VI-0m
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 09:52:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 872d0d08-5352-419d-a981-3309dab0055c;
 Tue, 26 Jan 2021 09:52:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6499BAE66;
 Tue, 26 Jan 2021 09:52:10 +0000 (UTC)
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
X-Inumbo-ID: 872d0d08-5352-419d-a981-3309dab0055c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611654730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JRFVVYygJfSJptNngeIO54NYglKiK3pqJ6XrFt4X+XY=;
	b=TAU3u81g4lgui3UUbF+gOSS7UPg/C6IA2M0vUbyFJGwR094M5AIU1kzTkoViLEttAKuF7Z
	HpagrCoXfX/DFvKXJNHBgpZ5ZThiOROj5RBwxqfj92erUcqGcoPIAgMol11iPeFkeLD6nx
	iTk2F9VFD7T2dSKwSsbOupcN5YDR6dY=
Subject: [PATCH v3 11/15] unlz4: replace INIT
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Message-ID: <febeee3c-80f4-4568-9d27-4f243b11cce3@suse.com>
Date: Tue, 26 Jan 2021 10:52:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There's no need for this abstraction.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/common/lz4/decompress.c
+++ b/xen/common/lz4/decompress.c
@@ -46,8 +46,8 @@ static const int8_t dec64table[] = {0, 0
 
 #if defined(__XEN__) || defined(__MINIOS__)
 
-static int INIT lz4_uncompress(const unsigned char *source, unsigned char *dest,
-			       int osize)
+static int __init lz4_uncompress(const unsigned char *source, unsigned char *dest,
+				 int osize)
 {
 	const BYTE *ip = (const BYTE *) source;
 	const BYTE *ref;
@@ -302,8 +302,8 @@ _output_error:
 
 #if defined(__XEN__) || defined(__MINIOS__)
 
-int INIT lz4_decompress(const unsigned char *src, size_t *src_len,
-		unsigned char *dest, size_t actual_dest_len)
+int __init lz4_decompress(const unsigned char *src, size_t *src_len,
+			  unsigned char *dest, size_t actual_dest_len)
 {
 	int ret = -1;
 	int input_len = 0;
--- a/xen/common/unlz4.c
+++ b/xen/common/unlz4.c
@@ -22,11 +22,11 @@
 #define LZ4_DEFAULT_UNCOMPRESSED_CHUNK_SIZE (8 << 20)
 #define ARCHIVE_MAGICNUMBER 0x184C2102
 
-int INIT unlz4(unsigned char *input, unsigned int in_len,
-	       int (*fill)(void *, unsigned int),
-	       int (*flush)(void *, unsigned int),
-	       unsigned char *output, unsigned int *posp,
-	       void (*error)(const char *x))
+int __init unlz4(unsigned char *input, unsigned int in_len,
+		 int (*fill)(void *, unsigned int),
+		 int (*flush)(void *, unsigned int),
+		 unsigned char *output, unsigned int *posp,
+		 void (*error)(const char *x))
 {
 	int ret = -1;
 	size_t chunksize = 0;



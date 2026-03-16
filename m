Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPQdIHuYuGmsgQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 00:55:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A98022A21C3
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 00:55:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255836.1550637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2HlO-0005xw-8Z; Mon, 16 Mar 2026 23:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255836.1550637; Mon, 16 Mar 2026 23:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2HlO-0005ut-5S; Mon, 16 Mar 2026 23:54:22 +0000
Received: by outflank-mailman (input) for mailman id 1255836;
 Mon, 16 Mar 2026 23:54:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=49j5=BQ=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1w2HlL-0005un-Sq
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2026 23:54:20 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71ba9a6a-2193-11f1-b164-2bf370ae4941;
 Tue, 17 Mar 2026 00:54:18 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48535a0ef86so42951995e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Mar 2026 16:54:18 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b3a09e453sm24080003f8f.0.2026.03.16.16.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 16:54:16 -0700 (PDT)
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
X-Inumbo-ID: 71ba9a6a-2193-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1773705257; x=1774310057; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VpDc41qTU05GQGpVEGDvS9cNjnVRzouYB5NsVGwgUmw=;
        b=gDKuFhvMEhK380Tb1DK11/8pl0Z8tiDw9KHgrTZYd04HZml1GFn4tbRt9G0Cz5Xcxh
         SlRWNJGc8OXrMEtP2GGSNG0Uv1FhLSU0AUJfLSURu/v6yEIzCkQslCDpBtrqUuwgHinE
         /DLhv0Kfd1/hoClFdEFtodeevjdPRbINqYsxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773705257; x=1774310057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VpDc41qTU05GQGpVEGDvS9cNjnVRzouYB5NsVGwgUmw=;
        b=nL/nwJH2BVbQeSDmbEt9JlSYqINKMOXtJMy1HBiSO1ZC0Yxm0Jy2w+nFtM8nun0JPN
         hK2+ND6dGhxX7QUSvX8T8OrGRRkdseEh3QR/R3fN/Sn6blQL1wPkxzCTDt/wzieIEn2o
         ILM4oE3W3VV0NfVEhrD843uEVTWTrLdAAkkI3v8rZydSq95O6/8JximzrRja1e1xV/Nf
         BVkCoWvBBSr6s/4feLuv52o7Ly7ukP6/W9K+240MPrIK1UhNZudZGba0pihPsPJjSTj5
         0jfYVqclIDmtwTSWfG8rhBOYU3M4Qiys0Ua15ToRxaiGVsnTPkZwGfMBj6LjswlpfohG
         ZK3w==
X-Gm-Message-State: AOJu0YwdH2H1pmvIgljNxM+wkWeKJ3OVeIaGoI/7N3UWxrhc7YrHHkga
	yczw7/hZ3RcLdmmBR17ceIbMLPXYtV+441/14QVYkeuLJO7US+xfqxUkrejwaGGQUFzD4uaI1xk
	8IU3i
X-Gm-Gg: ATEYQzxSfZbS4Yz3ytr2rt+0FDYbgiXTCpInYqmIS4YK50kI/azci2V8xQgkIWaoc+x
	hGecVSbIl2xM5DA5MxfFn0tXIMhIiLEi93gspIICic8HzxhZWfBTDJ/8jaFIx5+uLJBTGlpp5B3
	MAyxuA9IVHHZjszgfZHhBZz/XmE77sJgFeEBcUhrGXmOdc4Fbs4KcodYs53dWD9ACWhMOWIW5uS
	C9dErhC6YUzjrydTL2hU4bU17ynMcFga76I4HIgaMpUTpgFL9bFofdC+2jKg5lGC2Z47jgjWqfr
	xORoR0ZKHzsCJC4dRPo4Og6ZirAusrQIg6vO3sMKsfCWTg1FlkuMKIeIul8hjRR3TyVDI4Biqvk
	6lhRR2QS4oTDTJZ+P0RNFJ0i1lCF3z4P1uJcMCvGLu8yKmKcbBt1jNlzW6pUw+LAUEuqTXZ7m+I
	bXvqcapXeovsX1n4mQIKoVm7CGKSgGz+3HjB8kv/F6/qchryuf35wH3lL0IcXewJ66KfUSeW8=
X-Received: by 2002:a05:6000:2086:b0:439:b791:f920 with SMTP id ffacd0b85a97d-43a04d88460mr27429963f8f.17.1773705256758;
        Mon, 16 Mar 2026 16:54:16 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/coverage: Drop support for older GCOV
Date: Mon, 16 Mar 2026 23:54:14 +0000
Message-Id: <20260316235414.683426-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid,suse.com:email];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A98022A21C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With the GCC toolchain baseline now at 5.1, gcc_3_4.o (covering 3.4 through
4.6) will never get chosen.  Drop it.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/coverage/Makefile  |   2 +-
 xen/common/coverage/gcc_3_4.c | 367 ----------------------------------
 2 files changed, 1 insertion(+), 368 deletions(-)
 delete mode 100644 xen/common/coverage/gcc_3_4.c

diff --git a/xen/common/coverage/Makefile b/xen/common/coverage/Makefile
index d729afc9c7a0..26bc1b7c04cd 100644
--- a/xen/common/coverage/Makefile
+++ b/xen/common/coverage/Makefile
@@ -1,7 +1,7 @@
 obj-y += coverage.o
 ifneq ($(CONFIG_CC_IS_CLANG),y)
 obj-y += gcov_base.o gcov.o
-obj-y += $(call cc-ifversion,-lt,0407, gcc_3_4.o, gcc_4_7.o)
+obj-y += gcc_4_7.o
 else
 obj-y += llvm.o
 endif
diff --git a/xen/common/coverage/gcc_3_4.c b/xen/common/coverage/gcc_3_4.c
deleted file mode 100644
index 3631f4bc2535..000000000000
--- a/xen/common/coverage/gcc_3_4.c
+++ /dev/null
@@ -1,367 +0,0 @@
-/*
- *  This code provides functions to handle gcc's profiling data format
- *  introduced with gcc 3.4. Future versions of gcc may change the gcov
- *  format (as happened before), so all format-specific information needs
- *  to be kept modular and easily exchangeable.
- *
- *  This file is based on gcc-internal definitions. Functions and data
- *  structures are defined to be compatible with gcc counterparts.
- *  For a better understanding, refer to gcc source: gcc/gcov-io.h.
- *
- *    Copyright IBM Corp. 2009
- *    Author(s): Peter Oberparleiter <oberpar@linux.vnet.ibm.com>
- *
- *    Uses gcc-internal data definitions.
- *
- *  Imported from Linux and modified for Xen by
- *    Wei Liu <wei.liu2@citrix.com>
- */
-
-
-#include <xen/lib.h>
-
-#include "gcov.h"
-
-#if !(GCC_VERSION >= 30400 && GCC_VERSION < 40700)
-#error "Wrong version of GCC used to compile gcov"
-#endif
-
-#define GCOV_COUNTERS 5
-
-static struct gcov_info *gcov_info_head;
-
-/**
- * struct gcov_fn_info - profiling meta data per function
- * @ident: object file-unique function identifier
- * @checksum: function checksum
- * @n_ctrs: number of values per counter type belonging to this function
- *
- * This data is generated by gcc during compilation and doesn't change
- * at run-time.
- */
-struct gcov_fn_info
-{
-    unsigned int ident;
-    unsigned int checksum;
-    unsigned int n_ctrs[0];
-};
-
-/**
- * struct gcov_ctr_info - profiling data per counter type
- * @num: number of counter values for this type
- * @values: array of counter values for this type
- * @merge: merge function for counter values of this type (unused)
- *
- * This data is generated by gcc during compilation and doesn't change
- * at run-time with the exception of the values array.
- */
-struct gcov_ctr_info
-{
-    unsigned int num;
-    gcov_type *values;
-    void (*merge)(gcov_type *, unsigned int);
-};
-
-/**
- * struct gcov_info - profiling data per object file
- * @version: gcov version magic indicating the gcc version used for compilation
- * @next: list head for a singly-linked list
- * @stamp: time stamp
- * @filename: name of the associated gcov data file
- * @n_functions: number of instrumented functions
- * @functions: function data
- * @ctr_mask: mask specifying which counter types are active
- * @counts: counter data per counter type
- *
- * This data is generated by gcc during compilation and doesn't change
- * at run-time with the exception of the next pointer.
- */
-struct gcov_info
-{
-    unsigned int              version;
-    struct gcov_info          *next;
-    unsigned int              stamp;
-    const char                *filename;
-    unsigned int              n_functions;
-    const struct gcov_fn_info *functions;
-    unsigned int              ctr_mask;
-    struct gcov_ctr_info      counts[0];
-};
-
-/**
- * struct type_info - iterator helper array
- * @ctr_type: counter type
- * @offset: index of the first value of the current function for this type
- *
- * This array is needed to convert the in-memory data format into the in-file
- * data format:
- *
- * In-memory:
- *   for each counter type
- *     for each function
- *       values
- *
- * In-file:
- *   for each function
- *     for each counter type
- *       values
- *
- * See gcc source gcc/gcov-io.h for more information on data organization.
- */
-struct type_info {
-    int ctr_type;
-    unsigned int offset;
-};
-
-/**
- * struct gcov_iterator - specifies current file position in logical records
- * @info: associated profiling data
- * @record: record type
- * @function: function number
- * @type: counter type
- * @count: index into values array
- * @num_types: number of counter types
- * @type_info: helper array to get values-array offset for current function
- */
-struct gcov_iterator {
-    const struct gcov_info *info;
-
-    int record;
-    unsigned int function;
-    unsigned int type;
-    unsigned int count;
-
-    int num_types;
-    struct type_info type_info[GCOV_COUNTERS];
-};
-
-/* Mapping of logical record number to actual file content. */
-#define RECORD_FILE_MAGIC       0
-#define RECORD_GCOV_VERSION     1
-#define RECORD_TIME_STAMP       2
-#define RECORD_FUNCTION_TAG     3
-#define RECORD_FUNCTON_TAG_LEN  4
-#define RECORD_FUNCTION_IDENT   5
-#define RECORD_FUNCTION_CHECK   6
-#define RECORD_COUNT_TAG        7
-#define RECORD_COUNT_LEN        8
-#define RECORD_COUNT            9
-
-static int counter_active(const struct gcov_info *info, unsigned int type)
-{
-    return (1 << type) & info->ctr_mask;
-}
-
-static unsigned int num_counter_active(const struct gcov_info *info)
-{
-    unsigned int i;
-    unsigned int result = 0;
-
-    for ( i = 0; i < GCOV_COUNTERS; i++ )
-        if ( counter_active(info, i) )
-            result++;
-
-    return result;
-}
-
-void gcov_info_link(struct gcov_info *info)
-{
-    info->next = gcov_info_head;
-    gcov_info_head = info;
-}
-
-struct gcov_info *gcov_info_next(const struct gcov_info *info)
-{
-    if ( !info )
-        return gcov_info_head;
-
-    return info->next;
-}
-
-const char *gcov_info_filename(const struct gcov_info *info)
-{
-    return info->filename;
-}
-
-void gcov_info_reset(struct gcov_info *info)
-{
-    unsigned int active = num_counter_active(info);
-    unsigned int i;
-
-    for ( i = 0; i < active; i++ )
-        memset(info->counts[i].values, 0,
-               info->counts[i].num * sizeof(gcov_type));
-}
-
-static size_t get_fn_size(const struct gcov_info *info)
-{
-    size_t size;
-
-    size = sizeof(struct gcov_fn_info) + num_counter_active(info) *
-        sizeof(unsigned int);
-    if ( __alignof__(struct gcov_fn_info) > sizeof(unsigned int) )
-        size = ROUNDUP(size, __alignof__(struct gcov_fn_info));
-    return size;
-}
-
-static struct gcov_fn_info *get_fn_info(const struct gcov_info *info,
-                                        unsigned int fn)
-{
-    return (struct gcov_fn_info *)
-        ((char *) info->functions + fn * get_fn_size(info));
-}
-
-static struct gcov_fn_info *get_func(struct gcov_iterator *iter)
-{
-    return get_fn_info(iter->info, iter->function);
-}
-
-static struct type_info *get_type(struct gcov_iterator *iter)
-{
-    return &iter->type_info[iter->type];
-}
-
-/**
- * gcov_iter_next - advance file iterator to next logical record
- * @iter: file iterator
- *
- * Return zero if new position is valid, non-zero if iterator has reached end.
- */
-static int gcov_iter_next(struct gcov_iterator *iter)
-{
-    switch ( iter->record )
-    {
-    case RECORD_FILE_MAGIC:
-    case RECORD_GCOV_VERSION:
-    case RECORD_FUNCTION_TAG:
-    case RECORD_FUNCTON_TAG_LEN:
-    case RECORD_FUNCTION_IDENT:
-    case RECORD_COUNT_TAG:
-        /* Advance to next record */
-        iter->record++;
-        break;
-    case RECORD_COUNT:
-        /* Advance to next count */
-        iter->count++;
-        /* fall through */
-    case RECORD_COUNT_LEN:
-        if ( iter->count < get_func(iter)->n_ctrs[iter->type] )
-        {
-            iter->record = 9;
-            break;
-        }
-        /* Advance to next counter type */
-        get_type(iter)->offset += iter->count;
-        iter->count = 0;
-        iter->type++;
-        /* fall through */
-    case RECORD_FUNCTION_CHECK:
-        if ( iter->type < iter->num_types )
-        {
-            iter->record = 7;
-            break;
-        }
-        /* Advance to next function */
-        iter->type = 0;
-        iter->function++;
-        /* fall through */
-    case RECORD_TIME_STAMP:
-        if ( iter->function < iter->info->n_functions )
-            iter->record = 3;
-        else
-            iter->record = -1;
-        break;
-    }
-    /* Check for EOF. */
-    if ( iter->record == -1 )
-        return -EINVAL;
-    else
-        return 0;
-}
-
-/**
- * gcov_iter_write - write data to buffer
- * @iter: file iterator
- * @buf: buffer to write to, if it is NULL, nothing is written
- * @pos: position inside buffer to start writing
- *
- * Return number of bytes written into buffer.
- */
-static size_t gcov_iter_write(struct gcov_iterator *iter, char *buf,
-                              size_t pos)
-{
-    size_t ret = 0;
-
-    switch ( iter->record )
-    {
-    case RECORD_FILE_MAGIC:
-        ret = gcov_store_uint32(buf, pos, GCOV_DATA_MAGIC);
-        break;
-    case RECORD_GCOV_VERSION:
-        ret = gcov_store_uint32(buf, pos, iter->info->version);
-        break;
-    case RECORD_TIME_STAMP:
-        ret = gcov_store_uint32(buf, pos, iter->info->stamp);
-        break;
-    case RECORD_FUNCTION_TAG:
-        ret = gcov_store_uint32(buf, pos, GCOV_TAG_FUNCTION);
-        break;
-    case RECORD_FUNCTON_TAG_LEN:
-        ret = gcov_store_uint32(buf, pos, 2);
-        break;
-    case RECORD_FUNCTION_IDENT:
-        ret = gcov_store_uint32(buf, pos, get_func(iter)->ident);
-        break;
-    case RECORD_FUNCTION_CHECK:
-        ret = gcov_store_uint32(buf, pos, get_func(iter)->checksum);
-        break;
-    case RECORD_COUNT_TAG:
-        ret = gcov_store_uint32(buf, pos,
-                                GCOV_TAG_FOR_COUNTER(get_type(iter)->ctr_type));
-        break;
-    case RECORD_COUNT_LEN:
-        ret = gcov_store_uint32(buf, pos,
-                                get_func(iter)->n_ctrs[iter->type] * 2);
-        break;
-    case RECORD_COUNT:
-        ret = gcov_store_uint64(buf, pos, iter->info->counts[iter->type].
-                                values[iter->count + get_type(iter)->offset]);
-        break;
-    }
-
-    return ret;
-}
-
-/* If buffer is NULL, no data is written. */
-size_t gcov_info_to_gcda(char *buffer, const struct gcov_info *info)
-{
-    struct gcov_iterator iter = { .info = info };
-    unsigned int i;
-    size_t pos = 0;
-
-    for ( i = 0; i < GCOV_COUNTERS; i++ )
-    {
-        if ( counter_active(info, i) )
-        {
-            iter.type_info[iter.num_types].ctr_type = i;
-            iter.type_info[iter.num_types].offset = 0;
-            iter.num_types++;
-        }
-    }
-
-    do {
-        pos += gcov_iter_write(&iter, buffer, pos);
-    } while ( gcov_iter_next(&iter) == 0 );
-
-    return pos;
-}
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
-- 
2.39.5



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D86252FFEFB
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 10:23:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72607.130789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2sfI-0003Dn-1Y; Fri, 22 Jan 2021 09:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72607.130789; Fri, 22 Jan 2021 09:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2sfH-0003DF-Sd; Fri, 22 Jan 2021 09:23:35 +0000
Received: by outflank-mailman (input) for mailman id 72607;
 Fri, 22 Jan 2021 09:23:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2lNi=GZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l2sfF-0003B9-M0
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 09:23:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e680fc77-005e-4337-8a17-1a86363b8aee;
 Fri, 22 Jan 2021 09:23:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC2E5B805;
 Fri, 22 Jan 2021 09:23:26 +0000 (UTC)
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
X-Inumbo-ID: e680fc77-005e-4337-8a17-1a86363b8aee
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611307407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cHA8+5AFHCaE8iklopdheM25OXPOATyXJKShSmiBOes=;
	b=Fj64eKWvNoKQwppIOMBDM1OhT6k+weLFzE5hsS8SwVuArrSvZOd97QUl4VC3gxyKqykC5Z
	VUdocWiBSUP20BLCMlD5KBLhsyGXhTDSxFjnr9UWjPVrueFTUP90kYNH7CtEy5+tMGPDnu
	6eaLJdcQoWiLKKLU7N832jmTOTCCIwE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH RFC 4/4] tools/xenstore: drop use of tdb
Date: Fri, 22 Jan 2021 10:23:24 +0100
Message-Id: <20210122092324.7178-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122092324.7178-1-jgross@suse.com>
References: <20210122092324.7178-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today all Xenstore nodes are stored in a TDB data base. This makes it
rather complicated to walk nodes for different purposes, as all walked
nodes need to be fetched from TDB before, and references between nodes
are difficult to handle.

So drop using TDB and store the nodes directly in memory making them
easily accessible. Use a hash-based lookup mechanism for fast lookup
of nodes by their full path.

For now only replace TDB keeping the current access functions.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore                             |    2 -
 tools/xenstore/Makefile                |    9 +-
 tools/xenstore/tdb.c                   | 1748 ------------------------
 tools/xenstore/tdb.h                   |  134 --
 tools/xenstore/xenstored_core.c        |  146 +-
 tools/xenstore/xenstored_core.h        |   11 +-
 tools/xenstore/xenstored_transaction.c |   67 +-
 tools/xenstore/xenstored_transaction.h |    4 +-
 tools/xenstore/xs_tdb_dump.c           |   86 --
 9 files changed, 76 insertions(+), 2131 deletions(-)
 delete mode 100644 tools/xenstore/tdb.c
 delete mode 100644 tools/xenstore/tdb.h
 delete mode 100644 tools/xenstore/xs_tdb_dump.c

diff --git a/.gitignore b/.gitignore
index 9e0488e0cd..48dcf9d441 100644
--- a/.gitignore
+++ b/.gitignore
@@ -294,8 +294,6 @@ tools/xenstore/xenstore-control
 tools/xenstore/xenstore-ls
 tools/xenstore/xenstored
 tools/xenstore/xenstored_test
-tools/xenstore/xs_tdb_dump
-tools/xentop/xentop
 tools/xentrace/xentrace_setsize
 tools/xentrace/tbctl
 tools/xentrace/xenctx
diff --git a/tools/xenstore/Makefile b/tools/xenstore/Makefile
index ab89e22d3a..333248f1f3 100644
--- a/tools/xenstore/Makefile
+++ b/tools/xenstore/Makefile
@@ -24,7 +24,7 @@ CLIENTS += xenstore-write xenstore-ls xenstore-watch
 
 XENSTORED_OBJS = xenstored_core.o xenstored_watch.o xenstored_domain.o
 XENSTORED_OBJS += xenstored_transaction.o xenstored_control.o
-XENSTORED_OBJS += xs_lib.o talloc.o utils.o tdb.o hashtable.o
+XENSTORED_OBJS += xs_lib.o talloc.o utils.o hashtable.o
 
 XENSTORED_OBJS_$(CONFIG_Linux) = xenstored_posix.o
 XENSTORED_OBJS_$(CONFIG_SunOS) = xenstored_solaris.o xenstored_posix.o xenstored_probes.o
@@ -37,7 +37,7 @@ LDLIBS_xenstored += -lrt
 
 ALL_TARGETS = clients
 ifeq ($(XENSTORE_XENSTORED),y)
-ALL_TARGETS += xs_tdb_dump xenstored
+ALL_TARGETS += xenstored
 endif
 
 ifdef CONFIG_STUBDOM
@@ -84,14 +84,11 @@ xenstore: xenstore_client.o
 xenstore-control: xenstore_control.o
 	$(CC) $< $(LDFLAGS) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxentoolcore) $(SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
 
-xs_tdb_dump: xs_tdb_dump.o utils.o tdb.o talloc.o
-	$(CC) $^ $(LDFLAGS) -o $@ $(APPEND_LDFLAGS)
-
 .PHONY: clean
 clean:
 	rm -f *.a *.o xenstored_probes.h
 	rm -f xenstored xs_random xs_stress xs_crashme
-	rm -f xs_tdb_dump xenstore-control init-xenstore-domain
+	rm -f xenstore-control init-xenstore-domain
 	rm -f xenstore $(CLIENTS)
 	$(RM) $(DEPS_RM)
 
diff --git a/tools/xenstore/tdb.c b/tools/xenstore/tdb.c
deleted file mode 100644
index 29593b76c3..0000000000
--- a/tools/xenstore/tdb.c
+++ /dev/null
@@ -1,1748 +0,0 @@
- /* 
-   Unix SMB/CIFS implementation.
-
-   trivial database library
-
-   Copyright (C) Andrew Tridgell              1999-2004
-   Copyright (C) Paul `Rusty' Russell		   2000
-   Copyright (C) Jeremy Allison			   2000-2003
-   
-     ** NOTE! The following LGPL license applies to the tdb
-     ** library. This does NOT imply that all of Samba is released
-     ** under the LGPL
-   
-   This library is free software; you can redistribute it and/or
-   modify it under the terms of the GNU Lesser General Public
-   License as published by the Free Software Foundation; either
-   version 2 of the License, or (at your option) any later version.
-
-   This library is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   Lesser General Public License for more details.
-
-   You should have received a copy of the GNU Lesser General Public
-   License along with this library; If not, see <http://www.gnu.org/licenses/>.
-*/
-
-
-#ifndef _SAMBA_BUILD_
-#ifdef HAVE_CONFIG_H
-#include <config.h>
-#endif
-
-#include <stdlib.h>
-#include <stdio.h>
-#include <stdint.h>
-#include <fcntl.h>
-#include <unistd.h>
-#include <string.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <sys/mman.h>
-#include <sys/stat.h>
-#include "tdb.h"
-#include <stdarg.h>
-#include "talloc.h"
-#undef HAVE_MMAP
-#else
-#include "includes.h"
-#include "lib/tdb/include/tdb.h"
-#include "system/time.h"
-#include "system/shmem.h"
-#include "system/filesys.h"
-#endif
-
-#define TDB_MAGIC_FOOD "TDB file\n"
-#define TDB_VERSION (0x26011967 + 7)
-#define TDB_MAGIC (0x26011999U)
-#define TDB_FREE_MAGIC (~TDB_MAGIC)
-#define TDB_DEAD_MAGIC (0xFEE1DEAD)
-#define TDB_ALIGNMENT 4
-#define MIN_REC_SIZE (2*sizeof(struct list_struct) + TDB_ALIGNMENT)
-#define DEFAULT_HASH_SIZE 131
-#define TDB_PAGE_SIZE 0x2000
-#define FREELIST_TOP (sizeof(struct tdb_header))
-#define TDB_ALIGN(x,a) (((x) + (a)-1) & ~((a)-1))
-#define TDB_BYTEREV(x) (((((x)&0xff)<<24)|((x)&0xFF00)<<8)|(((x)>>8)&0xFF00)|((x)>>24))
-#define TDB_DEAD(r) ((r)->magic == TDB_DEAD_MAGIC)
-#define TDB_BAD_MAGIC(r) ((r)->magic != TDB_MAGIC && !TDB_DEAD(r))
-#define TDB_HASH_TOP(hash) (FREELIST_TOP + (BUCKET(hash)+1)*sizeof(tdb_off))
-#define TDB_DATA_START(hash_size) (TDB_HASH_TOP(hash_size-1))
-
-
-/* NB assumes there is a local variable called "tdb" that is the
- * current context, also takes doubly-parenthesized print-style
- * argument. */
-#define TDB_LOG(x) tdb->log_fn x
-
-/* lock offsets */
-#define GLOBAL_LOCK 0
-#define ACTIVE_LOCK 4
-
-#ifndef MAP_FILE
-#define MAP_FILE 0
-#endif
-
-#ifndef MAP_FAILED
-#define MAP_FAILED ((void *)-1)
-#endif
-
-#ifndef discard_const_p
-# if defined(__intptr_t_defined) || defined(HAVE_INTPTR_T)
-#  define discard_const(ptr) ((void *)((intptr_t)(ptr)))
-# else
-#  define discard_const(ptr) ((void *)(ptr))
-# endif
-# define discard_const_p(type, ptr) ((type *)discard_const(ptr))
-#endif
-
-/* free memory if the pointer is valid and zero the pointer */
-#ifndef SAFE_FREE
-#define SAFE_FREE(x) do { if ((x) != NULL) {talloc_free(discard_const_p(void *, (x))); (x)=NULL;} } while(0)
-#endif
-
-#define BUCKET(hash) ((hash) % tdb->header.hash_size)
-static TDB_DATA tdb_null;
-
-/* all contexts, to ensure no double-opens (fcntl locks don't nest!) */
-static TDB_CONTEXT *tdbs = NULL;
-
-static int tdb_munmap(TDB_CONTEXT *tdb)
-{
-	if (tdb->flags & TDB_INTERNAL)
-		return 0;
-
-#ifdef HAVE_MMAP
-	if (tdb->map_ptr) {
-		int ret = munmap(tdb->map_ptr, tdb->map_size);
-		if (ret != 0)
-			return ret;
-	}
-#endif
-	tdb->map_ptr = NULL;
-	return 0;
-}
-
-static void tdb_mmap(TDB_CONTEXT *tdb)
-{
-	if (tdb->flags & TDB_INTERNAL)
-		return;
-
-#ifdef HAVE_MMAP
-	if (!(tdb->flags & TDB_NOMMAP)) {
-		tdb->map_ptr = mmap(NULL, tdb->map_size, 
-				    PROT_READ|(tdb->read_only? 0:PROT_WRITE), 
-				    MAP_SHARED|MAP_FILE, tdb->fd, 0);
-
-		/*
-		 * NB. When mmap fails it returns MAP_FAILED *NOT* NULL !!!!
-		 */
-
-		if (tdb->map_ptr == MAP_FAILED) {
-			tdb->map_ptr = NULL;
-			TDB_LOG((tdb, 2, "tdb_mmap failed for size %d (%s)\n", 
-				 tdb->map_size, strerror(errno)));
-		}
-	} else {
-		tdb->map_ptr = NULL;
-	}
-#else
-	tdb->map_ptr = NULL;
-#endif
-}
-
-/* Endian conversion: we only ever deal with 4 byte quantities */
-static void *convert(void *buf, uint32_t size)
-{
-	uint32_t i, *p = buf;
-	for (i = 0; i < size / 4; i++)
-		p[i] = TDB_BYTEREV(p[i]);
-	return buf;
-}
-#define DOCONV() (tdb->flags & TDB_CONVERT)
-#define CONVERT(x) (DOCONV() ? convert(&x, sizeof(x)) : &x)
-
-/* the body of the database is made of one list_struct for the free space
-   plus a separate data list for each hash value */
-struct list_struct {
-	tdb_off next; /* offset of the next record in the list */
-	tdb_len rec_len; /* total byte length of record */
-	tdb_len key_len; /* byte length of key */
-	tdb_len data_len; /* byte length of data */
-	uint32_t full_hash; /* the full 32 bit hash of the key */
-	uint32_t magic;   /* try to catch errors */
-	/* the following union is implied:
-		union {
-			char record[rec_len];
-			struct {
-				char key[key_len];
-				char data[data_len];
-			}
-			uint32_t totalsize; (tailer)
-		}
-	*/
-};
-
-/* a byte range locking function - return 0 on success
-   this functions locks/unlocks 1 byte at the specified offset.
-
-   On error, errno is also set so that errors are passed back properly
-   through tdb_open(). */
-static int tdb_brlock(TDB_CONTEXT *tdb, tdb_off offset, 
-		      int rw_type, int lck_type, int probe)
-{
-	struct flock fl;
-	int ret;
-
-	if (tdb->flags & TDB_NOLOCK)
-		return 0;
-	if ((rw_type == F_WRLCK) && (tdb->read_only)) {
-		errno = EACCES;
-		return -1;
-	}
-
-	fl.l_type = rw_type;
-	fl.l_whence = SEEK_SET;
-	fl.l_start = offset;
-	fl.l_len = 1;
-	fl.l_pid = 0;
-
-	do {
-		ret = fcntl(tdb->fd,lck_type,&fl);
-	} while (ret == -1 && errno == EINTR);
-
-	if (ret == -1) {
-		if (!probe && lck_type != F_SETLK) {
-			/* Ensure error code is set for log fun to examine. */
-			tdb->ecode = TDB_ERR_LOCK;
-			TDB_LOG((tdb, 5,"tdb_brlock failed (fd=%d) at offset %d rw_type=%d lck_type=%d\n", 
-				 tdb->fd, offset, rw_type, lck_type));
-		}
-		/* Generic lock error. errno set by fcntl.
-		 * EAGAIN is an expected return from non-blocking
-		 * locks. */
-		if (errno != EAGAIN) {
-		TDB_LOG((tdb, 5, "tdb_brlock failed (fd=%d) at offset %d rw_type=%d lck_type=%d: %s\n", 
-				 tdb->fd, offset, rw_type, lck_type, 
-				 strerror(errno)));
-		}
-		return TDB_ERRCODE(TDB_ERR_LOCK, -1);
-	}
-	return 0;
-}
-
-/* lock a list in the database. list -1 is the alloc list */
-static int tdb_lock(TDB_CONTEXT *tdb, int list, int ltype)
-{
-	if (list < -1 || list >= (int)tdb->header.hash_size) {
-		TDB_LOG((tdb, 0,"tdb_lock: invalid list %d for ltype=%d\n", 
-			   list, ltype));
-		return -1;
-	}
-	if (tdb->flags & TDB_NOLOCK)
-		return 0;
-
-	/* Since fcntl locks don't nest, we do a lock for the first one,
-	   and simply bump the count for future ones */
-	if (tdb->locked[list+1].count == 0) {
-		if (tdb_brlock(tdb,FREELIST_TOP+4*list,ltype,F_SETLKW, 0)) {
-			TDB_LOG((tdb, 0,"tdb_lock failed on list %d ltype=%d (%s)\n", 
-					   list, ltype, strerror(errno)));
-			return -1;
-		}
-		tdb->locked[list+1].ltype = ltype;
-	}
-	tdb->locked[list+1].count++;
-	return 0;
-}
-
-/* unlock the database: returns void because it's too late for errors. */
-	/* changed to return int it may be interesting to know there
-	   has been an error  --simo */
-static int tdb_unlock(TDB_CONTEXT *tdb, int list,
-		      int ltype __attribute__((unused)))
-{
-	int ret = -1;
-
-	if (tdb->flags & TDB_NOLOCK)
-		return 0;
-
-	/* Sanity checks */
-	if (list < -1 || list >= (int)tdb->header.hash_size) {
-		TDB_LOG((tdb, 0, "tdb_unlock: list %d invalid (%d)\n", list, tdb->header.hash_size));
-		return ret;
-	}
-
-	if (tdb->locked[list+1].count==0) {
-		TDB_LOG((tdb, 0, "tdb_unlock: count is 0\n"));
-		return ret;
-	}
-
-	if (tdb->locked[list+1].count == 1) {
-		/* Down to last nested lock: unlock underneath */
-		ret = tdb_brlock(tdb, FREELIST_TOP+4*list, F_UNLCK, F_SETLKW, 0);
-	} else {
-		ret = 0;
-	}
-	tdb->locked[list+1].count--;
-
-	if (ret)
-		TDB_LOG((tdb, 0,"tdb_unlock: An error occurred unlocking!\n")); 
-	return ret;
-}
-
-/* This is based on the hash algorithm from gdbm */
-static uint32_t default_tdb_hash(TDB_DATA *key)
-{
-	uint32_t value;	/* Used to compute the hash value.  */
-	uint32_t   i;	/* Used to cycle through random values. */
-
-	/* Set the initial value from the key size. */
-	for (value = 0x238F13AF * key->dsize, i=0; i < key->dsize; i++)
-		value = (value + (key->dptr[i] << (i*5 % 24)));
-
-	return (1103515243 * value + 12345);  
-}
-
-/* check for an out of bounds access - if it is out of bounds then
-   see if the database has been expanded by someone else and expand
-   if necessary 
-   note that "len" is the minimum length needed for the db
-*/
-static int tdb_oob(TDB_CONTEXT *tdb, tdb_off len, int probe)
-{
-	struct stat st;
-	if (len <= tdb->map_size)
-		return 0;
-	if (tdb->flags & TDB_INTERNAL) {
-		if (!probe) {
-			/* Ensure ecode is set for log fn. */
-			tdb->ecode = TDB_ERR_IO;
-			TDB_LOG((tdb, 0,"tdb_oob len %d beyond internal malloc size %d\n",
-				 (int)len, (int)tdb->map_size));
-		}
-		return TDB_ERRCODE(TDB_ERR_IO, -1);
-	}
-
-	if (fstat(tdb->fd, &st) == -1)
-		return TDB_ERRCODE(TDB_ERR_IO, -1);
-
-	if (st.st_size < (off_t)len) {
-		if (!probe) {
-			/* Ensure ecode is set for log fn. */
-			tdb->ecode = TDB_ERR_IO;
-			TDB_LOG((tdb, 0,"tdb_oob len %d beyond eof at %d\n",
-				 (int)len, (int)st.st_size));
-		}
-		return TDB_ERRCODE(TDB_ERR_IO, -1);
-	}
-
-	/* Unmap, update size, remap */
-	if (tdb_munmap(tdb) == -1)
-		return TDB_ERRCODE(TDB_ERR_IO, -1);
-	tdb->map_size = st.st_size;
-	tdb_mmap(tdb);
-	return 0;
-}
-
-/* write a lump of data at a specified offset */
-static int tdb_write(TDB_CONTEXT *tdb, tdb_off off, void *buf, tdb_len len)
-{
-	if (tdb_oob(tdb, off + len, 0) != 0)
-		return -1;
-
-	if (tdb->map_ptr)
-		memcpy(off + (char *)tdb->map_ptr, buf, len);
-#ifdef HAVE_PWRITE
-	else if (pwrite(tdb->fd, buf, len, off) != (ssize_t)len) {
-#else
-	else if (lseek(tdb->fd, off, SEEK_SET) != (off_t)off
-		 || write(tdb->fd, buf, len) != (off_t)len) {
-#endif
-		/* Ensure ecode is set for log fn. */
-		tdb->ecode = TDB_ERR_IO;
-		TDB_LOG((tdb, 0,"tdb_write failed at %d len=%d (%s)\n",
-			   off, len, strerror(errno)));
-		return TDB_ERRCODE(TDB_ERR_IO, -1);
-	}
-	return 0;
-}
-
-/* read a lump of data at a specified offset, maybe convert */
-static int tdb_read(TDB_CONTEXT *tdb,tdb_off off,void *buf,tdb_len len,int cv)
-{
-	if (tdb_oob(tdb, off + len, 0) != 0)
-		return -1;
-
-	if (tdb->map_ptr)
-		memcpy(buf, off + (char *)tdb->map_ptr, len);
-#ifdef HAVE_PREAD
-	else if (pread(tdb->fd, buf, len, off) != (off_t)len) {
-#else
-	else if (lseek(tdb->fd, off, SEEK_SET) != (off_t)off
-		 || read(tdb->fd, buf, len) != (off_t)len) {
-#endif
-		/* Ensure ecode is set for log fn. */
-		tdb->ecode = TDB_ERR_IO;
-		TDB_LOG((tdb, 0,"tdb_read failed at %d len=%d (%s)\n",
-			   off, len, strerror(errno)));
-		return TDB_ERRCODE(TDB_ERR_IO, -1);
-	}
-	if (cv)
-		convert(buf, len);
-	return 0;
-}
-
-/* don't allocate memory: used in tdb_delete path. */
-static int tdb_key_eq(TDB_CONTEXT *tdb, tdb_off off, TDB_DATA key)
-{
-	char buf[64];
-	uint32_t len;
-
-	if (tdb_oob(tdb, off + key.dsize, 0) != 0)
-		return -1;
-
-	if (tdb->map_ptr)
-		return !memcmp(off + (char*)tdb->map_ptr, key.dptr, key.dsize);
-
-	while (key.dsize) {
-		len = key.dsize;
-		if (len > sizeof(buf))
-			len = sizeof(buf);
-		if (tdb_read(tdb, off, buf, len, 0) != 0)
-			return -1;
-		if (memcmp(buf, key.dptr, len) != 0)
-			return 0;
-		key.dptr += len;
-		key.dsize -= len;
-		off += len;
-	}
-	return 1;
-}
-
-/* read a lump of data, allocating the space for it */
-static char *tdb_alloc_read(TDB_CONTEXT *tdb, tdb_off offset, tdb_len len)
-{
-	char *buf;
-
-	if (!(buf = talloc_size(tdb, len))) {
-		/* Ensure ecode is set for log fn. */
-		tdb->ecode = TDB_ERR_OOM;
-		TDB_LOG((tdb, 0,"tdb_alloc_read malloc failed len=%d (%s)\n",
-			   len, strerror(errno)));
-		return TDB_ERRCODE(TDB_ERR_OOM, buf);
-	}
-	if (tdb_read(tdb, offset, buf, len, 0) == -1) {
-		SAFE_FREE(buf);
-		return NULL;
-	}
-	return buf;
-}
-
-/* read/write a tdb_off */
-static int ofs_read(TDB_CONTEXT *tdb, tdb_off offset, tdb_off *d)
-{
-	return tdb_read(tdb, offset, (char*)d, sizeof(*d), DOCONV());
-}
-static int ofs_write(TDB_CONTEXT *tdb, tdb_off offset, tdb_off *d)
-{
-	tdb_off off = *d;
-	return tdb_write(tdb, offset, CONVERT(off), sizeof(*d));
-}
-
-/* read/write a record */
-static int rec_read(TDB_CONTEXT *tdb, tdb_off offset, struct list_struct *rec)
-{
-	if (tdb_read(tdb, offset, rec, sizeof(*rec),DOCONV()) == -1)
-		return -1;
-	if (TDB_BAD_MAGIC(rec)) {
-		/* Ensure ecode is set for log fn. */
-		tdb->ecode = TDB_ERR_CORRUPT;
-		TDB_LOG((tdb, 0,"rec_read bad magic 0x%x at offset=%d\n", rec->magic, offset));
-		return TDB_ERRCODE(TDB_ERR_CORRUPT, -1);
-	}
-	return tdb_oob(tdb, rec->next+sizeof(*rec), 0);
-}
-static int rec_write(TDB_CONTEXT *tdb, tdb_off offset, struct list_struct *rec)
-{
-	struct list_struct r = *rec;
-	return tdb_write(tdb, offset, CONVERT(r), sizeof(r));
-}
-
-/* read a freelist record and check for simple errors */
-static int rec_free_read(TDB_CONTEXT *tdb, tdb_off off, struct list_struct *rec)
-{
-	if (tdb_read(tdb, off, rec, sizeof(*rec),DOCONV()) == -1)
-		return -1;
-
-	if (rec->magic == TDB_MAGIC) {
-		/* this happens when a app is showdown while deleting a record - we should
-		   not completely fail when this happens */
-		TDB_LOG((tdb, 0,"rec_free_read non-free magic 0x%x at offset=%d - fixing\n", 
-			 rec->magic, off));
-		rec->magic = TDB_FREE_MAGIC;
-		if (tdb_write(tdb, off, rec, sizeof(*rec)) == -1)
-			return -1;
-	}
-
-	if (rec->magic != TDB_FREE_MAGIC) {
-		/* Ensure ecode is set for log fn. */
-		tdb->ecode = TDB_ERR_CORRUPT;
-		TDB_LOG((tdb, 0,"rec_free_read bad magic 0x%x at offset=%d\n", 
-			   rec->magic, off));
-		return TDB_ERRCODE(TDB_ERR_CORRUPT, -1);
-	}
-	if (tdb_oob(tdb, rec->next+sizeof(*rec), 0) != 0)
-		return -1;
-	return 0;
-}
-
-/* update a record tailer (must hold allocation lock) */
-static int update_tailer(TDB_CONTEXT *tdb, tdb_off offset,
-			 const struct list_struct *rec)
-{
-	tdb_off totalsize;
-
-	/* Offset of tailer from record header */
-	totalsize = sizeof(*rec) + rec->rec_len;
-	return ofs_write(tdb, offset + totalsize - sizeof(tdb_off),
-			 &totalsize);
-}
-
-/* Remove an element from the freelist.  Must have alloc lock. */
-static int remove_from_freelist(TDB_CONTEXT *tdb, tdb_off off, tdb_off next)
-{
-	tdb_off last_ptr, i;
-
-	/* read in the freelist top */
-	last_ptr = FREELIST_TOP;
-	while (ofs_read(tdb, last_ptr, &i) != -1 && i != 0) {
-		if (i == off) {
-			/* We've found it! */
-			return ofs_write(tdb, last_ptr, &next);
-		}
-		/* Follow chain (next offset is at start of record) */
-		last_ptr = i;
-	}
-	TDB_LOG((tdb, 0,"remove_from_freelist: not on list at off=%d\n", off));
-	return TDB_ERRCODE(TDB_ERR_CORRUPT, -1);
-}
-
-/* Add an element into the freelist. Merge adjacent records if
-   neccessary. */
-static int tdb_free(TDB_CONTEXT *tdb, tdb_off offset, struct list_struct *rec)
-{
-	tdb_off right, left;
-
-	/* Allocation and tailer lock */
-	if (tdb_lock(tdb, -1, F_WRLCK) != 0)
-		return -1;
-
-	/* set an initial tailer, so if we fail we don't leave a bogus record */
-	if (update_tailer(tdb, offset, rec) != 0) {
-		TDB_LOG((tdb, 0, "tdb_free: upfate_tailer failed!\n"));
-		goto fail;
-	}
-
-	/* Look right first (I'm an Australian, dammit) */
-	right = offset + sizeof(*rec) + rec->rec_len;
-	if (right + sizeof(*rec) <= tdb->map_size) {
-		struct list_struct r;
-
-		if (tdb_read(tdb, right, &r, sizeof(r), DOCONV()) == -1) {
-			TDB_LOG((tdb, 0, "tdb_free: right read failed at %u\n", right));
-			goto left;
-		}
-
-		/* If it's free, expand to include it. */
-		if (r.magic == TDB_FREE_MAGIC) {
-			if (remove_from_freelist(tdb, right, r.next) == -1) {
-				TDB_LOG((tdb, 0, "tdb_free: right free failed at %u\n", right));
-				goto left;
-			}
-			rec->rec_len += sizeof(r) + r.rec_len;
-		}
-	}
-
-left:
-	/* Look left */
-	left = offset - sizeof(tdb_off);
-	if (left > TDB_DATA_START(tdb->header.hash_size)) {
-		struct list_struct l;
-		tdb_off leftsize;
-		
-		/* Read in tailer and jump back to header */
-		if (ofs_read(tdb, left, &leftsize) == -1) {
-			TDB_LOG((tdb, 0, "tdb_free: left offset read failed at %u\n", left));
-			goto update;
-		}
-		left = offset - leftsize;
-
-		/* Now read in record */
-		if (tdb_read(tdb, left, &l, sizeof(l), DOCONV()) == -1) {
-			TDB_LOG((tdb, 0, "tdb_free: left read failed at %u (%u)\n", left, leftsize));
-			goto update;
-		}
-
-		/* If it's free, expand to include it. */
-		if (l.magic == TDB_FREE_MAGIC) {
-			if (remove_from_freelist(tdb, left, l.next) == -1) {
-				TDB_LOG((tdb, 0, "tdb_free: left free failed at %u\n", left));
-				goto update;
-			} else {
-				offset = left;
-				rec->rec_len += leftsize;
-			}
-		}
-	}
-
-update:
-	if (update_tailer(tdb, offset, rec) == -1) {
-		TDB_LOG((tdb, 0, "tdb_free: update_tailer failed at %u\n", offset));
-		goto fail;
-	}
-
-	/* Now, prepend to free list */
-	rec->magic = TDB_FREE_MAGIC;
-
-	if (ofs_read(tdb, FREELIST_TOP, &rec->next) == -1 ||
-	    rec_write(tdb, offset, rec) == -1 ||
-	    ofs_write(tdb, FREELIST_TOP, &offset) == -1) {
-		TDB_LOG((tdb, 0, "tdb_free record write failed at offset=%d\n", offset));
-		goto fail;
-	}
-
-	/* And we're done. */
-	tdb_unlock(tdb, -1, F_WRLCK);
-	return 0;
-
- fail:
-	tdb_unlock(tdb, -1, F_WRLCK);
-	return -1;
-}
-
-
-/* expand a file.  we prefer to use ftruncate, as that is what posix
-  says to use for mmap expansion */
-static int expand_file(TDB_CONTEXT *tdb, tdb_off size, tdb_off addition)
-{
-	char buf[1024];
-#ifdef HAVE_FTRUNCATE_EXTEND
-	if (ftruncate(tdb->fd, size+addition) != 0) {
-		TDB_LOG((tdb, 0, "expand_file ftruncate to %d failed (%s)\n", 
-			   size+addition, strerror(errno)));
-		return -1;
-	}
-#else
-	char b = 0;
-
-#ifdef HAVE_PWRITE
-	if (pwrite(tdb->fd,  &b, 1, (size+addition) - 1) != 1) {
-#else
-	if (lseek(tdb->fd, (size+addition) - 1, SEEK_SET) != (off_t)(size+addition) - 1 || 
-	    write(tdb->fd, &b, 1) != 1) {
-#endif
-		TDB_LOG((tdb, 0, "expand_file to %d failed (%s)\n", 
-			   size+addition, strerror(errno)));
-		return -1;
-	}
-#endif
-
-	/* now fill the file with something. This ensures that the file isn't sparse, which would be
-	   very bad if we ran out of disk. This must be done with write, not via mmap */
-	memset(buf, 0x42, sizeof(buf));
-	while (addition) {
-		int n = addition>sizeof(buf)?sizeof(buf):addition;
-#ifdef HAVE_PWRITE
-		int ret = pwrite(tdb->fd, buf, n, size);
-#else
-		int ret;
-		if (lseek(tdb->fd, size, SEEK_SET) != (off_t)size)
-			return -1;
-		ret = write(tdb->fd, buf, n);
-#endif
-		if (ret != n) {
-			TDB_LOG((tdb, 0, "expand_file write of %d failed (%s)\n", 
-				   n, strerror(errno)));
-			return -1;
-		}
-		addition -= n;
-		size += n;
-	}
-	return 0;
-}
-
-
-/* expand the database at least size bytes by expanding the underlying
-   file and doing the mmap again if necessary */
-static int tdb_expand(TDB_CONTEXT *tdb, tdb_off size)
-{
-	struct list_struct rec;
-	tdb_off offset;
-
-	if (tdb_lock(tdb, -1, F_WRLCK) == -1) {
-		TDB_LOG((tdb, 0, "lock failed in tdb_expand\n"));
-		return -1;
-	}
-
-	/* must know about any previous expansions by another process */
-	tdb_oob(tdb, tdb->map_size + 1, 1);
-
-	/* always make room for at least 10 more records, and round
-           the database up to a multiple of TDB_PAGE_SIZE */
-	size = TDB_ALIGN(tdb->map_size + size*10, TDB_PAGE_SIZE) - tdb->map_size;
-
-	if (!(tdb->flags & TDB_INTERNAL))
-		tdb_munmap(tdb);
-
-	/*
-	 * We must ensure the file is unmapped before doing this
-	 * to ensure consistency with systems like OpenBSD where
-	 * writes and mmaps are not consistent.
-	 */
-
-	/* expand the file itself */
-	if (!(tdb->flags & TDB_INTERNAL)) {
-		if (expand_file(tdb, tdb->map_size, size) != 0)
-			goto fail;
-	}
-
-	tdb->map_size += size;
-
-	if (tdb->flags & TDB_INTERNAL) {
-		char *new_map_ptr = talloc_realloc_size(tdb, tdb->map_ptr,
-							tdb->map_size);
-		if (!new_map_ptr) {
-			tdb->map_size -= size;
-			goto fail;
-		}
-		tdb->map_ptr = new_map_ptr;
-	} else {
-		/*
-		 * We must ensure the file is remapped before adding the space
-		 * to ensure consistency with systems like OpenBSD where
-		 * writes and mmaps are not consistent.
-		 */
-
-		/* We're ok if the mmap fails as we'll fallback to read/write */
-		tdb_mmap(tdb);
-	}
-
-	/* form a new freelist record */
-	memset(&rec,'\0',sizeof(rec));
-	rec.rec_len = size - sizeof(rec);
-
-	/* link it into the free list */
-	offset = tdb->map_size - size;
-	if (tdb_free(tdb, offset, &rec) == -1)
-		goto fail;
-
-	tdb_unlock(tdb, -1, F_WRLCK);
-	return 0;
- fail:
-	tdb_unlock(tdb, -1, F_WRLCK);
-	return -1;
-}
-
-
-/* 
-   the core of tdb_allocate - called when we have decided which
-   free list entry to use
- */
-static tdb_off tdb_allocate_ofs(TDB_CONTEXT *tdb, tdb_len length, tdb_off rec_ptr,
-				struct list_struct *rec, tdb_off last_ptr)
-{
-	struct list_struct newrec;
-	tdb_off newrec_ptr;
-
-	memset(&newrec, '\0', sizeof(newrec));
-
-	/* found it - now possibly split it up  */
-	if (rec->rec_len > length + MIN_REC_SIZE) {
-		/* Length of left piece */
-		length = TDB_ALIGN(length, TDB_ALIGNMENT);
-		
-		/* Right piece to go on free list */
-		newrec.rec_len = rec->rec_len - (sizeof(*rec) + length);
-		newrec_ptr = rec_ptr + sizeof(*rec) + length;
-		
-		/* And left record is shortened */
-		rec->rec_len = length;
-	} else {
-		newrec_ptr = 0;
-	}
-	
-	/* Remove allocated record from the free list */
-	if (ofs_write(tdb, last_ptr, &rec->next) == -1) {
-		return 0;
-	}
-	
-	/* Update header: do this before we drop alloc
-	   lock, otherwise tdb_free() might try to
-	   merge with us, thinking we're free.
-	   (Thanks Jeremy Allison). */
-	rec->magic = TDB_MAGIC;
-	if (rec_write(tdb, rec_ptr, rec) == -1) {
-		return 0;
-	}
-	
-	/* Did we create new block? */
-	if (newrec_ptr) {
-		/* Update allocated record tailer (we
-		   shortened it). */
-		if (update_tailer(tdb, rec_ptr, rec) == -1) {
-			return 0;
-		}
-		
-		/* Free new record */
-		if (tdb_free(tdb, newrec_ptr, &newrec) == -1) {
-			return 0;
-		}
-	}
-	
-	/* all done - return the new record offset */
-	return rec_ptr;
-}
-
-/* allocate some space from the free list. The offset returned points
-   to a unconnected list_struct within the database with room for at
-   least length bytes of total data
-
-   0 is returned if the space could not be allocated
- */
-static tdb_off tdb_allocate(TDB_CONTEXT *tdb, tdb_len length,
-			    struct list_struct *rec)
-{
-	tdb_off rec_ptr, last_ptr, newrec_ptr;
-	struct {
-		tdb_off rec_ptr, last_ptr;
-		tdb_len rec_len;
-	} bestfit = { 0, 0, 0 };
-
-	if (tdb_lock(tdb, -1, F_WRLCK) == -1)
-		return 0;
-
-	/* Extra bytes required for tailer */
-	length += sizeof(tdb_off);
-
- again:
-	last_ptr = FREELIST_TOP;
-
-	/* read in the freelist top */
-	if (ofs_read(tdb, FREELIST_TOP, &rec_ptr) == -1)
-		goto fail;
-
-	bestfit.rec_ptr = 0;
-
-	/* 
-	   this is a best fit allocation strategy. Originally we used
-	   a first fit strategy, but it suffered from massive fragmentation
-	   issues when faced with a slowly increasing record size.
-	 */
-	while (rec_ptr) {
-		if (rec_free_read(tdb, rec_ptr, rec) == -1) {
-			goto fail;
-		}
-
-		if (rec->rec_len >= length) {
-			if (bestfit.rec_ptr == 0 ||
-			    rec->rec_len < bestfit.rec_len) {
-				bestfit.rec_len = rec->rec_len;
-				bestfit.rec_ptr = rec_ptr;
-				bestfit.last_ptr = last_ptr;
-				/* consider a fit to be good enough if we aren't wasting more than half the space */
-				if (bestfit.rec_len < 2*length) {
-					break;
-				}
-			}
-		}
-
-		/* move to the next record */
-		last_ptr = rec_ptr;
-		rec_ptr = rec->next;
-	}
-
-	if (bestfit.rec_ptr != 0) {
-		if (rec_free_read(tdb, bestfit.rec_ptr, rec) == -1) {
-			goto fail;
-		}
-
-		newrec_ptr = tdb_allocate_ofs(tdb, length, bestfit.rec_ptr, rec, bestfit.last_ptr);
-		tdb_unlock(tdb, -1, F_WRLCK);
-		return newrec_ptr;
-	}
-
-	/* we didn't find enough space. See if we can expand the
-	   database and if we can then try again */
-	if (tdb_expand(tdb, length + sizeof(*rec)) == 0)
-		goto again;
- fail:
-	tdb_unlock(tdb, -1, F_WRLCK);
-	return 0;
-}
-
-/* initialise a new database with a specified hash size */
-static int tdb_new_database(TDB_CONTEXT *tdb, int hash_size)
-{
-	struct tdb_header *newdb;
-	int size, ret = -1;
-
-	/* We make it up in memory, then write it out if not internal */
-	size = sizeof(struct tdb_header) + (hash_size+1)*sizeof(tdb_off);
-	if (!(newdb = talloc_zero_size(tdb, size)))
-		return TDB_ERRCODE(TDB_ERR_OOM, -1);
-
-	/* Fill in the header */
-	newdb->version = TDB_VERSION;
-	newdb->hash_size = hash_size;
-	if (tdb->flags & TDB_INTERNAL) {
-		tdb->map_size = size;
-		tdb->map_ptr = (char *)newdb;
-		memcpy(&tdb->header, newdb, sizeof(tdb->header));
-		/* Convert the `ondisk' version if asked. */
-		CONVERT(*newdb);
-		return 0;
-	}
-	if (lseek(tdb->fd, 0, SEEK_SET) == -1)
-		goto fail;
-
-	if (ftruncate(tdb->fd, 0) == -1)
-		goto fail;
-
-	/* This creates an endian-converted header, as if read from disk */
-	CONVERT(*newdb);
-	memcpy(&tdb->header, newdb, sizeof(tdb->header));
-	/* Don't endian-convert the magic food! */
-	memcpy(newdb->magic_food, TDB_MAGIC_FOOD, strlen(TDB_MAGIC_FOOD)+1);
-	if (write(tdb->fd, newdb, size) != size)
-		ret = -1;
-	else
-		ret = 0;
-
-  fail:
-	SAFE_FREE(newdb);
-	return ret;
-}
-
-/* Returns 0 on fail.  On success, return offset of record, and fills
-   in rec */
-static tdb_off tdb_find(TDB_CONTEXT *tdb, TDB_DATA key, uint32_t hash,
-			struct list_struct *r)
-{
-	tdb_off rec_ptr;
-	
-	/* read in the hash top */
-	if (ofs_read(tdb, TDB_HASH_TOP(hash), &rec_ptr) == -1)
-		return 0;
-
-	/* keep looking until we find the right record */
-	while (rec_ptr) {
-		if (rec_read(tdb, rec_ptr, r) == -1)
-			return 0;
-
-		if (!TDB_DEAD(r) && hash==r->full_hash && key.dsize==r->key_len) {
-			/* a very likely hit - read the key */
-			int cmp = tdb_key_eq(tdb, rec_ptr + sizeof(*r), key);
-			if (cmp < 0)
-				return 0;
-			else if (cmp > 0)
-				return rec_ptr;
-		}
-		rec_ptr = r->next;
-	}
-	return TDB_ERRCODE(TDB_ERR_NOEXIST, 0);
-}
-
-/* As tdb_find, but if you succeed, keep the lock */
-static tdb_off tdb_find_lock_hash(TDB_CONTEXT *tdb, TDB_DATA key, uint32_t hash, int locktype,
-			     struct list_struct *rec)
-{
-	uint32_t rec_ptr;
-
-	if (tdb_lock(tdb, BUCKET(hash), locktype) == -1)
-		return 0;
-	if (!(rec_ptr = tdb_find(tdb, key, hash, rec)))
-		tdb_unlock(tdb, BUCKET(hash), locktype);
-	return rec_ptr;
-}
-
-enum TDB_ERROR tdb_error(TDB_CONTEXT *tdb)
-{
-	return tdb->ecode;
-}
-
-static struct tdb_errname {
-	enum TDB_ERROR ecode; const char *estring;
-} emap[] = { {TDB_SUCCESS, "Success"},
-	     {TDB_ERR_CORRUPT, "Corrupt database"},
-	     {TDB_ERR_IO, "IO Error"},
-	     {TDB_ERR_LOCK, "Locking error"},
-	     {TDB_ERR_OOM, "Out of memory"},
-	     {TDB_ERR_EXISTS, "Record exists"},
-	     {TDB_ERR_NOLOCK, "Lock exists on other keys"},
-	     {TDB_ERR_NOEXIST, "Record does not exist"} };
-
-/* Error string for the last tdb error */
-const char *tdb_errorstr(TDB_CONTEXT *tdb)
-{
-	uint32_t i;
-	for (i = 0; i < sizeof(emap) / sizeof(struct tdb_errname); i++)
-		if (tdb->ecode == emap[i].ecode)
-			return emap[i].estring;
-	return "Invalid error code";
-}
-
-/* update an entry in place - this only works if the new data size
-   is <= the old data size and the key exists.
-   on failure return -1.
-*/
-
-static int tdb_update_hash(TDB_CONTEXT *tdb, TDB_DATA key, uint32_t hash, TDB_DATA dbuf)
-{
-	struct list_struct rec;
-	tdb_off rec_ptr;
-
-	/* find entry */
-	if (!(rec_ptr = tdb_find(tdb, key, hash, &rec)))
-		return -1;
-
-	/* must be long enough key, data and tailer */
-	if (rec.rec_len < key.dsize + dbuf.dsize + sizeof(tdb_off)) {
-		tdb->ecode = TDB_SUCCESS; /* Not really an error */
-		return -1;
-	}
-
-	if (tdb_write(tdb, rec_ptr + sizeof(rec) + rec.key_len,
-		      dbuf.dptr, dbuf.dsize) == -1)
-		return -1;
-
-	if (dbuf.dsize != rec.data_len) {
-		/* update size */
-		rec.data_len = dbuf.dsize;
-		return rec_write(tdb, rec_ptr, &rec);
-	}
- 
-	return 0;
-}
-
-/* find an entry in the database given a key */
-/* If an entry doesn't exist tdb_err will be set to
- * TDB_ERR_NOEXIST. If a key has no data attached
- * then the TDB_DATA will have zero length but
- * a non-zero pointer
- */
-
-TDB_DATA tdb_fetch(TDB_CONTEXT *tdb, TDB_DATA key)
-{
-	tdb_off rec_ptr;
-	struct list_struct rec;
-	TDB_DATA ret;
-	uint32_t hash;
-
-	/* find which hash bucket it is in */
-	hash = tdb->hash_fn(&key);
-	if (!(rec_ptr = tdb_find_lock_hash(tdb,key,hash,F_RDLCK,&rec)))
-		return tdb_null;
-
-	ret.dptr = tdb_alloc_read(tdb, rec_ptr + sizeof(rec) + rec.key_len,
-				  rec.data_len);
-	ret.dsize = rec.data_len;
-	tdb_unlock(tdb, BUCKET(rec.full_hash), F_RDLCK);
-	return ret;
-}
-
-/* check if an entry in the database exists 
-
-   note that 1 is returned if the key is found and 0 is returned if not found
-   this doesn't match the conventions in the rest of this module, but is
-   compatible with gdbm
-*/
-static int tdb_exists_hash(TDB_CONTEXT *tdb, TDB_DATA key, uint32_t hash)
-{
-	struct list_struct rec;
-	
-	if (tdb_find_lock_hash(tdb, key, hash, F_RDLCK, &rec) == 0)
-		return 0;
-	tdb_unlock(tdb, BUCKET(rec.full_hash), F_RDLCK);
-	return 1;
-}
-
-/* record lock stops delete underneath */
-static int lock_record(TDB_CONTEXT *tdb, tdb_off off)
-{
-	return off ? tdb_brlock(tdb, off, F_RDLCK, F_SETLKW, 0) : 0;
-}
-/*
-  Write locks override our own fcntl readlocks, so check it here.
-  Note this is meant to be F_SETLK, *not* F_SETLKW, as it's not
-  an error to fail to get the lock here.
-*/
- 
-static int write_lock_record(TDB_CONTEXT *tdb, tdb_off off)
-{
-	struct tdb_traverse_lock *i;
-	for (i = &tdb->travlocks; i; i = i->next)
-		if (i->off == off)
-			return -1;
-	return tdb_brlock(tdb, off, F_WRLCK, F_SETLK, 1);
-}
-
-/*
-  Note this is meant to be F_SETLK, *not* F_SETLKW, as it's not
-  an error to fail to get the lock here.
-*/
-
-static int write_unlock_record(TDB_CONTEXT *tdb, tdb_off off)
-{
-	return tdb_brlock(tdb, off, F_UNLCK, F_SETLK, 0);
-}
-/* fcntl locks don't stack: avoid unlocking someone else's */
-static int unlock_record(TDB_CONTEXT *tdb, tdb_off off)
-{
-	struct tdb_traverse_lock *i;
-	uint32_t count = 0;
-
-	if (off == 0)
-		return 0;
-	for (i = &tdb->travlocks; i; i = i->next)
-		if (i->off == off)
-			count++;
-	return (count == 1 ? tdb_brlock(tdb, off, F_UNLCK, F_SETLKW, 0) : 0);
-}
-
-/* actually delete an entry in the database given the offset */
-static int do_delete(TDB_CONTEXT *tdb, tdb_off rec_ptr, struct list_struct*rec)
-{
-	tdb_off last_ptr, i;
-	struct list_struct lastrec;
-
-	if (tdb->read_only) return -1;
-
-	if (write_lock_record(tdb, rec_ptr) == -1) {
-		/* Someone traversing here: mark it as dead */
-		rec->magic = TDB_DEAD_MAGIC;
-		return rec_write(tdb, rec_ptr, rec);
-	}
-	if (write_unlock_record(tdb, rec_ptr) != 0)
-		return -1;
-
-	/* find previous record in hash chain */
-	if (ofs_read(tdb, TDB_HASH_TOP(rec->full_hash), &i) == -1)
-		return -1;
-	for (last_ptr = 0; i != rec_ptr; last_ptr = i, i = lastrec.next)
-		if (rec_read(tdb, i, &lastrec) == -1)
-			return -1;
-
-	/* unlink it: next ptr is at start of record. */
-	if (last_ptr == 0)
-		last_ptr = TDB_HASH_TOP(rec->full_hash);
-	if (ofs_write(tdb, last_ptr, &rec->next) == -1)
-		return -1;
-
-	/* recover the space */
-	if (tdb_free(tdb, rec_ptr, rec) == -1)
-		return -1;
-	return 0;
-}
-
-/* Uses traverse lock: 0 = finish, -1 = error, other = record offset */
-static int tdb_next_lock(TDB_CONTEXT *tdb, struct tdb_traverse_lock *tlock,
-			 struct list_struct *rec)
-{
-	int want_next = (tlock->off != 0);
-
-	/* Lock each chain from the start one. */
-	for (; tlock->hash < tdb->header.hash_size; tlock->hash++) {
-
-		/* this is an optimisation for the common case where
-		   the hash chain is empty, which is particularly
-		   common for the use of tdb with ldb, where large
-		   hashes are used. In that case we spend most of our
-		   time in tdb_brlock(), locking empty hash chains.
-
-		   To avoid this, we do an unlocked pre-check to see
-		   if the hash chain is empty before starting to look
-		   inside it. If it is empty then we can avoid that
-		   hash chain. If it isn't empty then we can't believe
-		   the value we get back, as we read it without a
-		   lock, so instead we get the lock and re-fetch the
-		   value below.
-
-		   Notice that not doing this optimisation on the
-		   first hash chain is critical. We must guarantee
-		   that we have done at least one fcntl lock at the
-		   start of a search to guarantee that memory is
-		   coherent on SMP systems. If records are added by
-		   others during the search then thats OK, and we
-		   could possibly miss those with this trick, but we
-		   could miss them anyway without this trick, so the
-		   semantics don't change.
-
-		   With a non-indexed ldb search this trick gains us a
-		   factor of around 80 in speed on a linux 2.6.x
-		   system (testing using ldbtest).
-		 */
-		if (!tlock->off && tlock->hash != 0) {
-			uint32_t off;
-			if (tdb->map_ptr) {
-				for (;tlock->hash < tdb->header.hash_size;tlock->hash++) {
-					if (0 != *(uint32_t *)(TDB_HASH_TOP(tlock->hash) + (unsigned char *)tdb->map_ptr)) {
-						break;
-					}
-				}
-				if (tlock->hash == tdb->header.hash_size) {
-					continue;
-				}
-			} else {
-				if (ofs_read(tdb, TDB_HASH_TOP(tlock->hash), &off) == 0 &&
-				    off == 0) {
-					continue;
-				}
-			}
-		}
-
-		if (tdb_lock(tdb, tlock->hash, F_WRLCK) == -1)
-			return -1;
-
-		/* No previous record?  Start at top of chain. */
-		if (!tlock->off) {
-			if (ofs_read(tdb, TDB_HASH_TOP(tlock->hash),
-				     &tlock->off) == -1)
-				goto fail;
-		} else {
-			/* Otherwise unlock the previous record. */
-			if (unlock_record(tdb, tlock->off) != 0)
-				goto fail;
-		}
-
-		if (want_next) {
-			/* We have offset of old record: grab next */
-			if (rec_read(tdb, tlock->off, rec) == -1)
-				goto fail;
-			tlock->off = rec->next;
-		}
-
-		/* Iterate through chain */
-		while( tlock->off) {
-			tdb_off current;
-			if (rec_read(tdb, tlock->off, rec) == -1)
-				goto fail;
-
-			/* Detect infinite loops. From "Shlomi Yaakobovich" <Shlomi@exanet.com>. */
-			if (tlock->off == rec->next) {
-				TDB_LOG((tdb, 0, "tdb_next_lock: loop detected.\n"));
-				goto fail;
-			}
-
-			if (!TDB_DEAD(rec)) {
-				/* Woohoo: we found one! */
-				if (lock_record(tdb, tlock->off) != 0)
-					goto fail;
-				return tlock->off;
-			}
-
-			/* Try to clean dead ones from old traverses */
-			current = tlock->off;
-			tlock->off = rec->next;
-			if (!tdb->read_only && 
-			    do_delete(tdb, current, rec) != 0)
-				goto fail;
-		}
-		tdb_unlock(tdb, tlock->hash, F_WRLCK);
-		want_next = 0;
-	}
-	/* We finished iteration without finding anything */
-	return TDB_ERRCODE(TDB_SUCCESS, 0);
-
- fail:
-	tlock->off = 0;
-	if (tdb_unlock(tdb, tlock->hash, F_WRLCK) != 0)
-		TDB_LOG((tdb, 0, "tdb_next_lock: On error unlock failed!\n"));
-	return -1;
-}
-
-/* traverse the entire database - calling fn(tdb, key, data) on each element.
-   return -1 on error or the record count traversed
-   if fn is NULL then it is not called
-   a non-zero return value from fn() indicates that the traversal should stop
-  */
-int tdb_traverse(TDB_CONTEXT *tdb, tdb_traverse_func fn, void *private)
-{
-	TDB_DATA key, dbuf;
-	struct list_struct rec;
-	struct tdb_traverse_lock tl = { NULL, 0, 0 };
-	int ret, count = 0;
-
-	/* This was in the initializaton, above, but the IRIX compiler
-	 * did not like it.  crh
-	 */
-	tl.next = tdb->travlocks.next;
-
-	/* fcntl locks don't stack: beware traverse inside traverse */
-	tdb->travlocks.next = &tl;
-
-	/* tdb_next_lock places locks on the record returned, and its chain */
-	while ((ret = tdb_next_lock(tdb, &tl, &rec)) > 0) {
-		count++;
-		/* now read the full record */
-		key.dptr = tdb_alloc_read(tdb, tl.off + sizeof(rec), 
-					  rec.key_len + rec.data_len);
-		if (!key.dptr) {
-			ret = -1;
-			if (tdb_unlock(tdb, tl.hash, F_WRLCK) != 0)
-				goto out;
-			if (unlock_record(tdb, tl.off) != 0)
-				TDB_LOG((tdb, 0, "tdb_traverse: key.dptr == NULL and unlock_record failed!\n"));
-			goto out;
-		}
-		key.dsize = rec.key_len;
-		dbuf.dptr = key.dptr + rec.key_len;
-		dbuf.dsize = rec.data_len;
-
-		/* Drop chain lock, call out */
-		if (tdb_unlock(tdb, tl.hash, F_WRLCK) != 0) {
-			ret = -1;
-			goto out;
-		}
-		if (fn && fn(tdb, key, dbuf, private)) {
-			/* They want us to terminate traversal */
-			ret = count;
-			if (unlock_record(tdb, tl.off) != 0) {
-				TDB_LOG((tdb, 0, "tdb_traverse: unlock_record failed!\n"));
-				ret = -1;
-			}
-			tdb->travlocks.next = tl.next;
-			SAFE_FREE(key.dptr);
-			return count;
-		}
-		SAFE_FREE(key.dptr);
-	}
-out:
-	tdb->travlocks.next = tl.next;
-	if (ret < 0)
-		return -1;
-	else
-		return count;
-}
-
-/* find the first entry in the database and return its key */
-TDB_DATA tdb_firstkey(TDB_CONTEXT *tdb)
-{
-	TDB_DATA key;
-	struct list_struct rec;
-
-	/* release any old lock */
-	if (unlock_record(tdb, tdb->travlocks.off) != 0)
-		return tdb_null;
-	tdb->travlocks.off = tdb->travlocks.hash = 0;
-
-	if (tdb_next_lock(tdb, &tdb->travlocks, &rec) <= 0)
-		return tdb_null;
-	/* now read the key */
-	key.dsize = rec.key_len;
-	key.dptr =tdb_alloc_read(tdb,tdb->travlocks.off+sizeof(rec),key.dsize);
-	if (tdb_unlock(tdb, BUCKET(tdb->travlocks.hash), F_WRLCK) != 0)
-		TDB_LOG((tdb, 0, "tdb_firstkey: error occurred while tdb_unlocking!\n"));
-	return key;
-}
-
-/* find the next entry in the database, returning its key */
-TDB_DATA tdb_nextkey(TDB_CONTEXT *tdb, TDB_DATA oldkey)
-{
-	uint32_t oldhash;
-	TDB_DATA key = tdb_null;
-	struct list_struct rec;
-	char *k = NULL;
-
-	/* Is locked key the old key?  If so, traverse will be reliable. */
-	if (tdb->travlocks.off) {
-		if (tdb_lock(tdb,tdb->travlocks.hash,F_WRLCK))
-			return tdb_null;
-		if (rec_read(tdb, tdb->travlocks.off, &rec) == -1
-		    || !(k = tdb_alloc_read(tdb,tdb->travlocks.off+sizeof(rec),
-					    rec.key_len))
-		    || memcmp(k, oldkey.dptr, oldkey.dsize) != 0) {
-			/* No, it wasn't: unlock it and start from scratch */
-			if (unlock_record(tdb, tdb->travlocks.off) != 0)
-				return tdb_null;
-			if (tdb_unlock(tdb, tdb->travlocks.hash, F_WRLCK) != 0)
-				return tdb_null;
-			tdb->travlocks.off = 0;
-		}
-
-		SAFE_FREE(k);
-	}
-
-	if (!tdb->travlocks.off) {
-		/* No previous element: do normal find, and lock record */
-		tdb->travlocks.off = tdb_find_lock_hash(tdb, oldkey, tdb->hash_fn(&oldkey), F_WRLCK, &rec);
-		if (!tdb->travlocks.off)
-			return tdb_null;
-		tdb->travlocks.hash = BUCKET(rec.full_hash);
-		if (lock_record(tdb, tdb->travlocks.off) != 0) {
-			TDB_LOG((tdb, 0, "tdb_nextkey: lock_record failed (%s)!\n", strerror(errno)));
-			return tdb_null;
-		}
-	}
-	oldhash = tdb->travlocks.hash;
-
-	/* Grab next record: locks chain and returned record,
-	   unlocks old record */
-	if (tdb_next_lock(tdb, &tdb->travlocks, &rec) > 0) {
-		key.dsize = rec.key_len;
-		key.dptr = tdb_alloc_read(tdb, tdb->travlocks.off+sizeof(rec),
-					  key.dsize);
-		/* Unlock the chain of this new record */
-		if (tdb_unlock(tdb, tdb->travlocks.hash, F_WRLCK) != 0)
-			TDB_LOG((tdb, 0, "tdb_nextkey: WARNING tdb_unlock failed!\n"));
-	}
-	/* Unlock the chain of old record */
-	if (tdb_unlock(tdb, BUCKET(oldhash), F_WRLCK) != 0)
-		TDB_LOG((tdb, 0, "tdb_nextkey: WARNING tdb_unlock failed!\n"));
-	return key;
-}
-
-/* delete an entry in the database given a key */
-static int tdb_delete_hash(TDB_CONTEXT *tdb, TDB_DATA key, uint32_t hash)
-{
-	tdb_off rec_ptr;
-	struct list_struct rec;
-	int ret;
-
-	if (!(rec_ptr = tdb_find_lock_hash(tdb, key, hash, F_WRLCK, &rec)))
-		return -1;
-	ret = do_delete(tdb, rec_ptr, &rec);
-	if (tdb_unlock(tdb, BUCKET(rec.full_hash), F_WRLCK) != 0)
-		TDB_LOG((tdb, 0, "tdb_delete: WARNING tdb_unlock failed!\n"));
-	return ret;
-}
-
-int tdb_delete(TDB_CONTEXT *tdb, TDB_DATA key)
-{
-	uint32_t hash = tdb->hash_fn(&key);
-	return tdb_delete_hash(tdb, key, hash);
-}
-
-/* store an element in the database, replacing any existing element
-   with the same key 
-
-   return 0 on success, -1 on failure
-*/
-int tdb_store(TDB_CONTEXT *tdb, TDB_DATA key, TDB_DATA dbuf, int flag)
-{
-	struct list_struct rec;
-	uint32_t hash;
-	tdb_off rec_ptr;
-	char *p = NULL;
-	int ret = 0;
-
-	/* find which hash bucket it is in */
-	hash = tdb->hash_fn(&key);
-	if (tdb_lock(tdb, BUCKET(hash), F_WRLCK) == -1)
-		return -1;
-
-	/* check for it existing, on insert. */
-	if (flag == TDB_INSERT) {
-		if (tdb_exists_hash(tdb, key, hash)) {
-			tdb->ecode = TDB_ERR_EXISTS;
-			goto fail;
-		}
-	} else {
-		/* first try in-place update, on modify or replace. */
-		if (tdb_update_hash(tdb, key, hash, dbuf) == 0)
-			goto out;
-		if (tdb->ecode == TDB_ERR_NOEXIST &&
-		    flag == TDB_MODIFY) {
-			/* if the record doesn't exist and we are in TDB_MODIFY mode then
-			 we should fail the store */
-			goto fail;
-		}
-	}
-	/* reset the error code potentially set by the tdb_update() */
-	tdb->ecode = TDB_SUCCESS;
-
-	/* delete any existing record - if it doesn't exist we don't
-           care.  Doing this first reduces fragmentation, and avoids
-           coalescing with `allocated' block before it's updated. */
-	if (flag != TDB_INSERT)
-		tdb_delete_hash(tdb, key, hash);
-
-	/* Copy key+value *before* allocating free space in case malloc
-	   fails and we are left with a dead spot in the tdb. */
-
-	if (!(p = (char *)talloc_size(tdb, key.dsize + dbuf.dsize))) {
-		tdb->ecode = TDB_ERR_OOM;
-		goto fail;
-	}
-
-	memcpy(p, key.dptr, key.dsize);
-	if (dbuf.dsize)
-		memcpy(p+key.dsize, dbuf.dptr, dbuf.dsize);
-
-	/* we have to allocate some space */
-	if (!(rec_ptr = tdb_allocate(tdb, key.dsize + dbuf.dsize, &rec)))
-		goto fail;
-
-	/* Read hash top into next ptr */
-	if (ofs_read(tdb, TDB_HASH_TOP(hash), &rec.next) == -1)
-		goto fail;
-
-	rec.key_len = key.dsize;
-	rec.data_len = dbuf.dsize;
-	rec.full_hash = hash;
-	rec.magic = TDB_MAGIC;
-
-	/* write out and point the top of the hash chain at it */
-	if (rec_write(tdb, rec_ptr, &rec) == -1
-	    || tdb_write(tdb, rec_ptr+sizeof(rec), p, key.dsize+dbuf.dsize)==-1
-	    || ofs_write(tdb, TDB_HASH_TOP(hash), &rec_ptr) == -1) {
-		/* Need to tdb_unallocate() here */
-		goto fail;
-	}
- out:
-	SAFE_FREE(p); 
-	tdb_unlock(tdb, BUCKET(hash), F_WRLCK);
-	return ret;
-fail:
-	ret = -1;
-	goto out;
-}
-
-static int tdb_already_open(dev_t device,
-			    ino_t ino)
-{
-	TDB_CONTEXT *i;
-	
-	for (i = tdbs; i; i = i->next) {
-		if (i->device == device && i->inode == ino) {
-			return 1;
-		}
-	}
-
-	return 0;
-}
-
-/* a default logging function */
-static void null_log_fn(TDB_CONTEXT *tdb __attribute__((unused)),
-			int level __attribute__((unused)),
-			const char *fmt __attribute__((unused)), ...)
-{
-}
-
-
-TDB_CONTEXT *tdb_open_ex(const char *name, int hash_size, int tdb_flags,
-			 int open_flags, mode_t mode,
-			 tdb_log_func log_fn,
-			 tdb_hash_func hash_fn)
-{
-	TDB_CONTEXT *tdb;
-	struct stat st;
-	int rev = 0, locked = 0;
-	uint8_t *vp;
-	uint32_t vertest;
-
-	if (!(tdb = talloc_zero(name, TDB_CONTEXT))) {
-		/* Can't log this */
-		errno = ENOMEM;
-		goto fail;
-	}
-	tdb->fd = -1;
-	tdb->name = NULL;
-	tdb->map_ptr = NULL;
-	tdb->flags = tdb_flags;
-	tdb->open_flags = open_flags;
-	tdb->log_fn = log_fn?log_fn:null_log_fn;
-	tdb->hash_fn = hash_fn ? hash_fn : default_tdb_hash;
-
-	if ((open_flags & O_ACCMODE) == O_WRONLY) {
-		TDB_LOG((tdb, 0, "tdb_open_ex: can't open tdb %s write-only\n",
-			 name));
-		errno = EINVAL;
-		goto fail;
-	}
-	
-	if (hash_size == 0)
-		hash_size = DEFAULT_HASH_SIZE;
-	if ((open_flags & O_ACCMODE) == O_RDONLY) {
-		tdb->read_only = 1;
-		/* read only databases don't do locking or clear if first */
-		tdb->flags |= TDB_NOLOCK;
-		tdb->flags &= ~TDB_CLEAR_IF_FIRST;
-	}
-
-	/* internal databases don't mmap or lock, and start off cleared */
-	if (tdb->flags & TDB_INTERNAL) {
-		tdb->flags |= (TDB_NOLOCK | TDB_NOMMAP);
-		tdb->flags &= ~TDB_CLEAR_IF_FIRST;
-		if (tdb_new_database(tdb, hash_size) != 0) {
-			TDB_LOG((tdb, 0, "tdb_open_ex: tdb_new_database failed!"));
-			goto fail;
-		}
-		goto internal;
-	}
-
-	if ((tdb->fd = open(name, open_flags, mode)) == -1) {
-		TDB_LOG((tdb, 5, "tdb_open_ex: could not open file %s: %s\n",
-			 name, strerror(errno)));
-		goto fail;	/* errno set by open(2) */
-	}
-
-	/* ensure there is only one process initialising at once */
-	if (tdb_brlock(tdb, GLOBAL_LOCK, F_WRLCK, F_SETLKW, 0) == -1) {
-		TDB_LOG((tdb, 0, "tdb_open_ex: failed to get global lock on %s: %s\n",
-			 name, strerror(errno)));
-		goto fail;	/* errno set by tdb_brlock */
-	}
-
-	/* we need to zero database if we are the only one with it open */
-	if ((tdb_flags & TDB_CLEAR_IF_FIRST) &&
-		(locked = (tdb_brlock(tdb, ACTIVE_LOCK, F_WRLCK, F_SETLK, 0) == 0))) {
-		open_flags |= O_CREAT;
-		if (ftruncate(tdb->fd, 0) == -1) {
-			TDB_LOG((tdb, 0, "tdb_open_ex: "
-				 "failed to truncate %s: %s\n",
-				 name, strerror(errno)));
-			goto fail; /* errno set by ftruncate */
-		}
-	}
-
-	if (read(tdb->fd, &tdb->header, sizeof(tdb->header)) != sizeof(tdb->header)
-	    || strcmp(tdb->header.magic_food, TDB_MAGIC_FOOD) != 0
-	    || (tdb->header.version != TDB_VERSION
-		&& !(rev = (tdb->header.version==TDB_BYTEREV(TDB_VERSION))))) {
-		/* its not a valid database - possibly initialise it */
-		if (!(open_flags & O_CREAT) || tdb_new_database(tdb, hash_size) == -1) {
-			errno = EIO; /* ie bad format or something */
-			goto fail;
-		}
-		rev = (tdb->flags & TDB_CONVERT);
-	}
-	vp = (uint8_t *)&tdb->header.version;
-	vertest = (((uint32_t)vp[0]) << 24) | (((uint32_t)vp[1]) << 16) |
-		  (((uint32_t)vp[2]) << 8) | (uint32_t)vp[3];
-	tdb->flags |= (vertest==TDB_VERSION) ? TDB_BIGENDIAN : 0;
-	if (!rev)
-		tdb->flags &= ~TDB_CONVERT;
-	else {
-		tdb->flags |= TDB_CONVERT;
-		convert(&tdb->header, sizeof(tdb->header));
-	}
-	if (fstat(tdb->fd, &st) == -1)
-		goto fail;
-
-	/* Is it already in the open list?  If so, fail. */
-	if (tdb_already_open(st.st_dev, st.st_ino)) {
-		TDB_LOG((tdb, 2, "tdb_open_ex: "
-			 "%s (%d,%d) is already open in this process\n",
-			 name, (int)st.st_dev, (int)st.st_ino));
-		errno = EBUSY;
-		goto fail;
-	}
-
-	if (!(tdb->name = (char *)talloc_strdup(tdb, name))) {
-		errno = ENOMEM;
-		goto fail;
-	}
-
-	tdb->map_size = st.st_size;
-	tdb->device = st.st_dev;
-	tdb->inode = st.st_ino;
-	tdb->locked = talloc_zero_array(tdb, struct tdb_lock_type,
-					tdb->header.hash_size+1);
-	if (!tdb->locked) {
-		TDB_LOG((tdb, 2, "tdb_open_ex: "
-			 "failed to allocate lock structure for %s\n",
-			 name));
-		errno = ENOMEM;
-		goto fail;
-	}
-	tdb_mmap(tdb);
-	if (locked) {
-		if (tdb_brlock(tdb, ACTIVE_LOCK, F_UNLCK, F_SETLK, 0) == -1) {
-			TDB_LOG((tdb, 0, "tdb_open_ex: "
-				 "failed to take ACTIVE_LOCK on %s: %s\n",
-				 name, strerror(errno)));
-			goto fail;
-		}
-
-	}
-
-	/* We always need to do this if the CLEAR_IF_FIRST flag is set, even if
-	   we didn't get the initial exclusive lock as we need to let all other
-	   users know we're using it. */
-
-	if (tdb_flags & TDB_CLEAR_IF_FIRST) {
-	/* leave this lock in place to indicate it's in use */
-	if (tdb_brlock(tdb, ACTIVE_LOCK, F_RDLCK, F_SETLKW, 0) == -1)
-		goto fail;
-	}
-
-
- internal:
-	/* Internal (memory-only) databases skip all the code above to
-	 * do with disk files, and resume here by releasing their
-	 * global lock and hooking into the active list. */
-	if (tdb_brlock(tdb, GLOBAL_LOCK, F_UNLCK, F_SETLKW, 0) == -1)
-		goto fail;
-	tdb->next = tdbs;
-	tdbs = tdb;
-	return tdb;
-
- fail:
-	{ int save_errno = errno;
-
-	if (!tdb)
-		return NULL;
-	
-	if (tdb->map_ptr) {
-		if (tdb->flags & TDB_INTERNAL)
-			SAFE_FREE(tdb->map_ptr);
-		else
-			tdb_munmap(tdb);
-	}
-	SAFE_FREE(tdb->name);
-	if (tdb->fd != -1)
-		if (close(tdb->fd) != 0)
-			TDB_LOG((tdb, 5, "tdb_open_ex: failed to close tdb->fd on error!\n"));
-	SAFE_FREE(tdb->locked);
-	SAFE_FREE(tdb);
-	errno = save_errno;
-	return NULL;
-	}
-}
-
-/**
- * Close a database.
- *
- * @returns -1 for error; 0 for success.
- **/
-int tdb_close(TDB_CONTEXT *tdb)
-{
-	TDB_CONTEXT **i;
-	int ret = 0;
-
-	if (tdb->map_ptr) {
-		if (tdb->flags & TDB_INTERNAL)
-			SAFE_FREE(tdb->map_ptr);
-		else
-			tdb_munmap(tdb);
-	}
-	SAFE_FREE(tdb->name);
-	if (tdb->fd != -1)
-		ret = close(tdb->fd);
-	SAFE_FREE(tdb->locked);
-
-	/* Remove from contexts list */
-	for (i = &tdbs; *i; i = &(*i)->next) {
-		if (*i == tdb) {
-			*i = tdb->next;
-			break;
-		}
-	}
-
-	memset(tdb, 0, sizeof(*tdb));
-	SAFE_FREE(tdb);
-
-	return ret;
-}
diff --git a/tools/xenstore/tdb.h b/tools/xenstore/tdb.h
deleted file mode 100644
index 557cf727b8..0000000000
--- a/tools/xenstore/tdb.h
+++ /dev/null
@@ -1,134 +0,0 @@
-#ifndef __TDB_H__
-#define __TDB_H__
-
-/* 
-   Unix SMB/CIFS implementation.
-
-   trivial database library
-
-   Copyright (C) Andrew Tridgell 1999-2004
-   
-     ** NOTE! The following LGPL license applies to the tdb
-     ** library. This does NOT imply that all of Samba is released
-     ** under the LGPL
-   
-   This library is free software; you can redistribute it and/or
-   modify it under the terms of the GNU Lesser General Public
-   License as published by the Free Software Foundation; either
-   version 2 of the License, or (at your option) any later version.
-
-   This library is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   Lesser General Public License for more details.
-
-   You should have received a copy of the GNU Lesser General Public
-   License along with this library; If not, see <http://www.gnu.org/licenses/>.
-*/
-
-#ifdef  __cplusplus
-extern "C" {
-#endif
-
-
-/* flags to tdb_store() */
-#define TDB_REPLACE 1
-#define TDB_INSERT 2
-#define TDB_MODIFY 3
-
-/* flags for tdb_open() */
-#define TDB_DEFAULT 0 /* just a readability place holder */
-#define TDB_CLEAR_IF_FIRST 1
-#define TDB_INTERNAL 2 /* don't store on disk */
-#define TDB_NOLOCK   4 /* don't do any locking */
-#define TDB_NOMMAP   8 /* don't use mmap */
-#define TDB_CONVERT 16 /* convert endian (internal use) */
-#define TDB_BIGENDIAN 32 /* header is big-endian (internal use) */
-
-#define TDB_ERRCODE(code, ret) ((tdb->ecode = (code)), ret)
-
-/* error codes */
-enum TDB_ERROR {TDB_SUCCESS=0, TDB_ERR_CORRUPT, TDB_ERR_IO, TDB_ERR_LOCK, 
-		TDB_ERR_OOM, TDB_ERR_EXISTS, TDB_ERR_NOLOCK, TDB_ERR_LOCK_TIMEOUT,
-		TDB_ERR_NOEXIST};
-
-#ifndef uint32_t
-#define uint32_t unsigned
-#endif
-
-typedef struct TDB_DATA {
-	char *dptr;
-	size_t dsize;
-} TDB_DATA;
-
-typedef uint32_t tdb_len;
-typedef uint32_t tdb_off;
-
-/* this is stored at the front of every database */
-struct tdb_header {
-	char magic_food[32]; /* for /etc/magic */
-	uint32_t version; /* version of the code */
-	uint32_t hash_size; /* number of hash entries */
-	tdb_off rwlocks;
-	tdb_off reserved[31];
-};
-
-struct tdb_lock_type {
-	uint32_t count;
-	uint32_t ltype;
-};
-
-struct tdb_traverse_lock {
-	struct tdb_traverse_lock *next;
-	uint32_t off;
-	uint32_t hash;
-};
-
-#ifndef PRINTF_ATTRIBUTE
-#define PRINTF_ATTRIBUTE(a,b)
-#endif
-
-/* this is the context structure that is returned from a db open */
-typedef struct tdb_context {
-	char *name; /* the name of the database */
-	void *map_ptr; /* where it is currently mapped */
-	int fd; /* open file descriptor for the database */
-	tdb_len map_size; /* how much space has been mapped */
-	int read_only; /* opened read-only */
-	struct tdb_lock_type *locked; /* array of chain locks */
-	enum TDB_ERROR ecode; /* error code for last tdb error */
-	struct tdb_header header; /* a cached copy of the header */
-	uint32_t flags; /* the flags passed to tdb_open */
-	struct tdb_traverse_lock travlocks; /* current traversal locks */
-	struct tdb_context *next; /* all tdbs to avoid multiple opens */
-	dev_t device;	/* uniquely identifies this tdb */
-	ino_t inode;	/* uniquely identifies this tdb */
-	void (*log_fn)(struct tdb_context *tdb, int level, const char *, ...) PRINTF_ATTRIBUTE(3,4); /* logging function */
-	uint32_t (*hash_fn)(TDB_DATA *key);
-	int open_flags; /* flags used in the open - needed by reopen */
-} TDB_CONTEXT;
-
-typedef int (*tdb_traverse_func)(TDB_CONTEXT *, TDB_DATA, TDB_DATA, void *);
-typedef void (*tdb_log_func)(TDB_CONTEXT *, int , const char *, ...);
-typedef uint32_t (*tdb_hash_func)(TDB_DATA *key);
-
-TDB_CONTEXT *tdb_open_ex(const char *name, int hash_size, int tdb_flags,
-			 int open_flags, mode_t mode,
-			 tdb_log_func log_fn,
-			 tdb_hash_func hash_fn);
-
-enum TDB_ERROR tdb_error(TDB_CONTEXT *tdb);
-const char *tdb_errorstr(TDB_CONTEXT *tdb);
-TDB_DATA tdb_fetch(TDB_CONTEXT *tdb, TDB_DATA key);
-int tdb_delete(TDB_CONTEXT *tdb, TDB_DATA key);
-int tdb_store(TDB_CONTEXT *tdb, TDB_DATA key, TDB_DATA dbuf, int flag);
-int tdb_close(TDB_CONTEXT *tdb);
-TDB_DATA tdb_firstkey(TDB_CONTEXT *tdb);
-TDB_DATA tdb_nextkey(TDB_CONTEXT *tdb, TDB_DATA key);
-int tdb_traverse(TDB_CONTEXT *tdb, tdb_traverse_func fn, void *);
-
-#ifdef  __cplusplus
-}
-#endif
-
-#endif /* tdb.h */
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 0deaa1a45d..b84ffbd97e 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -52,7 +52,6 @@
 #include "xenstored_transaction.h"
 #include "xenstored_domain.h"
 #include "xenstored_control.h"
-#include "tdb.h"
 
 #ifndef NO_SOCKETS
 #if defined(HAVE_SYSTEMD)
@@ -83,7 +82,7 @@ static bool recovery = true;
 static int reopen_log_pipe[2];
 static int reopen_log_pipe0_pollfd_idx = -1;
 char *tracefile = NULL;
-TDB_CONTEXT *tdb_ctx = NULL;
+struct hashtable *nodes;
 
 static const char *sockmsg_string(enum xsd_sockmsg_type type);
 
@@ -405,16 +404,6 @@ static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
 	}
 }
 
-void set_tdb_key(const char *name, TDB_DATA *key)
-{
-	/*
-	 * Dropping const is fine here, as the key will never be modified
-	 * by TDB.
-	 */
-	key->dptr = (char *)name;
-	key->dsize = strlen(name);
-}
-
 /*
  * If it fails, returns NULL and sets errno.
  * Temporary memory allocations will be done with ctx.
@@ -422,7 +411,8 @@ void set_tdb_key(const char *name, TDB_DATA *key)
 struct node *read_node(struct connection *conn, const void *ctx,
 		       const char *name)
 {
-	TDB_DATA key, data;
+	void *data;
+	const char *key;
 	struct xs_tdb_record_hdr *hdr;
 	struct node *node;
 
@@ -441,26 +431,20 @@ struct node *read_node(struct connection *conn, const void *ctx,
 	if (transaction_prepend(conn, name, &key))
 		return NULL;
 
-	data = tdb_fetch(tdb_ctx, key);
+	data = hashtable_search(nodes, key);
 
-	if (data.dptr == NULL) {
-		if (tdb_error(tdb_ctx) == TDB_ERR_NOEXIST) {
-			node->generation = NO_GENERATION;
-			access_node(conn, node, NODE_ACCESS_READ, NULL);
-			errno = ENOENT;
-		} else {
-			log("TDB error on read: %s", tdb_errorstr(tdb_ctx));
-			errno = EIO;
-		}
+	if (data == NULL) {
+		node->generation = NO_GENERATION;
+		access_node(conn, node, NODE_ACCESS_READ, NULL);
+		errno = ENOENT;
 		talloc_free(node);
 		return NULL;
 	}
 
 	node->parent = NULL;
-	talloc_steal(node, data.dptr);
 
 	/* Datalen, childlen, number of permissions */
-	hdr = (void *)data.dptr;
+	hdr = data;
 	node->generation = hdr->generation;
 	node->perms.num = hdr->num_perms;
 	node->datalen = hdr->datalen;
@@ -483,28 +467,33 @@ struct node *read_node(struct connection *conn, const void *ctx,
 	return node;
 }
 
-int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
+int write_node_raw(struct connection *conn, const char *key, struct node *node,
 		   bool no_quota_check)
 {
-	TDB_DATA data;
+	void *data;
 	void *p;
 	struct xs_tdb_record_hdr *hdr;
+	size_t dsize;
 
 	if (domain_adjust_node_perms(node))
 		return errno;
 
-	data.dsize = sizeof(*hdr)
+	dsize = sizeof(*hdr)
 		+ node->perms.num * sizeof(node->perms.p[0])
 		+ node->datalen + node->childlen;
 
 	if (!no_quota_check && domain_is_unprivileged(conn) &&
-	    data.dsize >= quota_max_entry_size) {
+	    dsize >= quota_max_entry_size) {
 		errno = ENOSPC;
 		return errno;
 	}
 
-	data.dptr = talloc_size(node, data.dsize);
-	hdr = (void *)data.dptr;
+	data = talloc_size(nodes, dsize);
+	if (!data) {
+		errno = ENOMEM;
+		return errno;
+	}
+	hdr = data;
 	hdr->generation = node->generation;
 	hdr->num_perms = node->perms.num;
 	hdr->datalen = node->datalen;
@@ -517,9 +506,8 @@ int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
 	p += node->datalen;
 	memcpy(p, node->children, node->childlen);
 
-	/* TDB should set errno, but doesn't even set ecode AFAICT. */
-	if (tdb_store(tdb_ctx, *key, data, TDB_REPLACE) != 0) {
-		corrupt(conn, "Write of %s failed", key->dptr);
+	if (hashtable_replace(nodes, key, data)) {
+		talloc_free(data);
 		errno = EIO;
 		return errno;
 	}
@@ -529,12 +517,12 @@ int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
 static int write_node(struct connection *conn, struct node *node,
 		      bool no_quota_check)
 {
-	TDB_DATA key;
+	const char *key;
 
 	if (access_node(conn, node, NODE_ACCESS_WRITE, &key))
 		return errno;
 
-	return write_node_raw(conn, &key, node, no_quota_check);
+	return write_node_raw(conn, key, node, no_quota_check);
 }
 
 enum xs_perm_type perm_for_conn(struct connection *conn,
@@ -963,12 +951,12 @@ static int do_read(struct connection *conn, struct buffered_data *in)
 
 static void delete_node_single(struct connection *conn, struct node *node)
 {
-	TDB_DATA key;
+	const char *key;
 
 	if (access_node(conn, node, NODE_ACCESS_DELETE, &key))
 		return;
 
-	if (tdb_delete(tdb_ctx, key) != 0) {
+	if (hashtable_remove(nodes, key)) {
 		corrupt(conn, "Could not delete '%s'", node->name);
 		return;
 	}
@@ -1052,13 +1040,11 @@ nomem:
 static int destroy_node(void *_node)
 {
 	struct node *node = _node;
-	TDB_DATA key;
 
 	if (streq(node->name, "/"))
 		corrupt(NULL, "Destroying root node!");
 
-	set_tdb_key(node->name, &key);
-	tdb_delete(tdb_ctx, key);
+	hashtable_remove(nodes, node->name);
 
 	domain_entry_dec(talloc_parent(node), node);
 
@@ -1720,8 +1706,6 @@ struct interface_funcs socket_funcs = {
 	.can_read = socket_can_read,
 };
 
-static int tdb_flags;
-
 /* We create initial nodes manually. */
 static void manual_node(const char *name, const char *child)
 {
@@ -1744,43 +1728,11 @@ static void manual_node(const char *name, const char *child)
 	talloc_free(node);
 }
 
-static void tdb_logger(TDB_CONTEXT *tdb, int level, const char * fmt, ...)
-{
-	va_list ap;
-	char *s;
-
-	va_start(ap, fmt);
-	s = talloc_vasprintf(NULL, fmt, ap);
-	va_end(ap);
-
-	if (s) {
-		trace("TDB: %s\n", s);
-		syslog(LOG_ERR, "TDB: %s",  s);
-		if (verbose)
-			xprintf("TDB: %s", s);
-		talloc_free(s);
-	} else {
-		trace("talloc failure during logging\n");
-		syslog(LOG_ERR, "talloc failure during logging\n");
-	}
-}
-
 static void setup_structure(bool live_update)
 {
-	char *tdbname;
-
-	tdbname = talloc_strdup(talloc_autofree_context(), xs_daemon_tdb());
-	if (!tdbname)
-		barf_perror("Could not create tdbname");
-
-	if (!(tdb_flags & TDB_INTERNAL))
-		unlink(tdbname);
-
-	tdb_ctx = tdb_open_ex(tdbname, 7919, tdb_flags,
-			      O_RDWR | O_CREAT | O_EXCL | O_CLOEXEC,
-			      0640, &tdb_logger, NULL);
-	if (!tdb_ctx)
-		barf_perror("Could not create tdb file %s", tdbname);
+	nodes = create_hashtable("nodes");
+	if (!nodes)
+		barf_perror("Could not create hashtable");
 
 	if (live_update)
 		manual_node("/", NULL);
@@ -1923,12 +1875,12 @@ static int check_store_(const char *name, struct hashtable *reachable)
 /**
  * Helper to clean_store below.
  */
-static int clean_store_(TDB_CONTEXT *tdb, TDB_DATA key, TDB_DATA val,
+static int clean_store_(struct hashtable *db, const char *key, void *val,
 			void *private)
 {
 	struct hashtable *reachable = private;
 	char *slash;
-	char * name = talloc_strndup(NULL, key.dptr, key.dsize);
+	char *name = talloc_strdup(NULL, key);
 
 	if (!name) {
 		log("clean_store: ENOMEM");
@@ -1943,7 +1895,7 @@ static int clean_store_(TDB_CONTEXT *tdb, TDB_DATA key, TDB_DATA val,
 	if (!hashtable_search(reachable, name)) {
 		log("clean_store: '%s' is orphaned!", name);
 		if (recovery) {
-			tdb_delete(tdb, key);
+			hashtable_remove(db, key);
 		}
 	}
 
@@ -1959,7 +1911,7 @@ static int clean_store_(TDB_CONTEXT *tdb, TDB_DATA key, TDB_DATA val,
  */
 static void clean_store(struct hashtable *reachable)
 {
-	tdb_traverse(tdb_ctx, &clean_store_, reachable);
+	hashtable_traverse(nodes, &clean_store_, reachable);
 }
 
 
@@ -2062,7 +2014,6 @@ static void usage(void)
 "  -M, --path-max <chars>  limit the allowed Xenstore node path length,\n"
 "  -R, --no-recovery       to request that no recovery should be attempted when\n"
 "                          the store is corrupted (debug only),\n"
-"  -I, --internal-db       store database in memory, not on disk\n"
 "  -V, --verbose           to request verbose execution.\n");
 }
 
@@ -2083,7 +2034,6 @@ static struct option options[] = {
 	{ "perm-nb", 1, NULL, 'A' },
 	{ "path-max", 1, NULL, 'M' },
 	{ "no-recovery", 0, NULL, 'R' },
-	{ "internal-db", 0, NULL, 'I' },
 	{ "verbose", 0, NULL, 'V' },
 	{ "watch-nb", 1, NULL, 'W' },
 	{ "live-update", 0, NULL, 'U' },
@@ -2141,9 +2091,6 @@ int main(int argc, char *argv[])
 		case 'T':
 			tracefile = optarg;
 			break;
-		case 'I':
-			tdb_flags = TDB_INTERNAL|TDB_NOLOCK;
-			break;
 		case 'V':
 			verbose = true;
 			break;
@@ -2458,22 +2405,18 @@ static const char *dump_state_node_tree(FILE *fp, char *path)
 	unsigned int pathlen, childlen, p = 0;
 	struct xs_state_record_header head;
 	struct xs_state_node sn;
-	TDB_DATA key, data;
+	void *data;
 	const struct xs_tdb_record_hdr *hdr;
 	const char *child;
 	const char *ret;
 
 	pathlen = strlen(path) + 1;
 
-	set_tdb_key(path, &key);
-	data = tdb_fetch(tdb_ctx, key);
-	if (data.dptr == NULL)
+	data = hashtable_search(nodes, path);
+	if (data == NULL)
 		return "Error reading node";
 
-	/* Clean up in case of failure. */
-	talloc_steal(path, data.dptr);
-
-	hdr = (void *)data.dptr;
+	hdr = data;
 
 	head.type = XS_STATE_TYPE_NODE;
 	head.length = sizeof(sn);
@@ -2531,8 +2474,6 @@ static const char *dump_state_node_tree(FILE *fp, char *path)
 		child += childlen;
 	}
 
-	talloc_free(data.dptr);
-
 	return NULL;
 }
 
@@ -2637,14 +2578,13 @@ void read_state_node(const void *ctx, const void *state)
 {
 	const struct xs_state_node *sn = state;
 	struct node *node, *parent;
-	TDB_DATA key;
 	char *name, *parentname;
 	unsigned int i;
 	struct connection conn = { .id = priv_domid };
 
-	name = (char *)(sn->perms + sn->perm_n);
 	node = talloc(ctx, struct node);
-	if (!node)
+	name = talloc_strdup(node, (char *)(sn->perms + sn->perm_n));
+	if (!node || !name)
 		barf("allocation error restoring node");
 
 	node->name = name;
@@ -2694,12 +2634,10 @@ void read_state_node(const void *ctx, const void *state)
 	if (add_child(node, parent, name))
 		barf("allocation error restoring node");
 
-	set_tdb_key(parentname, &key);
-	if (write_node_raw(NULL, &key, parent, true))
+	if (write_node_raw(NULL, parentname, parent, true))
 		barf("write parent error restoring node");
 
-	set_tdb_key(name, &key);
-	if (write_node_raw(NULL, &key, node, true))
+	if (write_node_raw(NULL, name, node, true))
 		barf("write node error restoring node");
 	domain_entry_inc(&conn, node);
 
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 052db6a56a..d4f135de78 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -32,7 +32,6 @@
 #include "xenstore_lib.h"
 #include "xenstore_state.h"
 #include "list.h"
-#include "tdb.h"
 #include "hashtable.h"
 
 #ifndef O_CLOEXEC
@@ -193,11 +192,11 @@ char *canonicalize(struct connection *conn, const void *ctx, const char *node);
 enum xs_perm_type perm_for_conn(struct connection *conn,
 				const struct node_perms *perms);
 
-/* Write a node to the tdb data base. */
-int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
+/* Write a node to the data base. */
+int write_node_raw(struct connection *conn, const char *key, struct node *node,
 		   bool no_quota_check);
 
-/* Get a node from the tdb data base. */
+/* Get a node from the data base. */
 struct node *read_node(struct connection *conn, const void *ctx,
 		       const char *name);
 
@@ -232,7 +231,7 @@ extern char **orig_argv;
 extern char *tracefile;
 extern int tracefd;
 
-extern TDB_CONTEXT *tdb_ctx;
+extern struct hashtable *nodes;
 extern int dom0_domid;
 extern int dom0_event;
 extern int priv_domid;
@@ -272,8 +271,6 @@ extern xengnttab_handle **xgt_handle;
 
 int remember_string(struct hashtable *hash, const char *str);
 
-void set_tdb_key(const char *name, TDB_DATA *key);
-
 const char *dump_state_global(FILE *fp);
 const char *dump_state_buffered_data(FILE *fp, const struct connection *c,
 				     const struct connection *conn,
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index 8b8b38cea7..493216eeb5 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -40,7 +40,7 @@
  * Some notes regarding detection and handling of transaction conflicts:
  *
  * Basic source of reference is the 'generation' count. Each writing access
- * (either normal write or in a transaction) to the tdb data base will set
+ * (either normal write or in a transaction) to the node data base will set
  * the node specific generation count to the global generation count.
  * For being able to identify a transaction the transaction specific generation
  * count is initialized with the global generation count when starting the
@@ -191,22 +191,22 @@ static char *transaction_get_node_name(void *ctx, struct transaction *trans,
  * transaction.
  */
 int transaction_prepend(struct connection *conn, const char *name,
-			TDB_DATA *key)
+			const char **key)
 {
-	char *tdb_name;
+	char *db_name;
 
 	if (!conn || !conn->transaction ||
 	    !find_accessed_node(conn->transaction, name)) {
-		set_tdb_key(name, key);
+		*key = name;
 		return 0;
 	}
 
-	tdb_name = transaction_get_node_name(conn->transaction,
-					     conn->transaction, name);
-	if (!tdb_name)
+	db_name = transaction_get_node_name(conn->transaction,
+					    conn->transaction, name);
+	if (!db_name)
 		return errno;
 
-	set_tdb_key(tdb_name, key);
+	*key = db_name;
 
 	return 0;
 }
@@ -226,11 +226,10 @@ int transaction_prepend(struct connection *conn, const char *name,
  * to be accessed in the data base.
  */
 int access_node(struct connection *conn, struct node *node,
-		enum node_access_type type, TDB_DATA *key)
+		enum node_access_type type, const char **key)
 {
 	struct accessed_node *i = NULL;
 	struct transaction *trans;
-	TDB_DATA local_key;
 	const char *trans_name = NULL;
 	int ret;
 	bool introduce = false;
@@ -244,7 +243,7 @@ int access_node(struct connection *conn, struct node *node,
 	if (!conn || !conn->transaction) {
 		/* They're changing the global database. */
 		if (key)
-			set_tdb_key(node->name, key);
+			*key = node->name;
 		return 0;
 	}
 
@@ -286,8 +285,7 @@ int access_node(struct connection *conn, struct node *node,
 			i->generation = node->generation;
 			i->check_gen = true;
 			if (node->generation != NO_GENERATION) {
-				set_tdb_key(trans_name, &local_key);
-				ret = write_node_raw(conn, &local_key, node, true);
+				ret = write_node_raw(conn, trans_name, node, true);
 				if (ret)
 					goto err;
 				i->ta_node = true;
@@ -304,7 +302,7 @@ int access_node(struct connection *conn, struct node *node,
 		return -1;
 
 	if (key) {
-		set_tdb_key(trans_name, key);
+		*key = trans_name;
 		if (type == NODE_ACCESS_WRITE)
 			i->ta_node = true;
 		if (type == NODE_ACCESS_DELETE)
@@ -334,26 +332,19 @@ static int finalize_transaction(struct connection *conn,
 				struct transaction *trans)
 {
 	struct accessed_node *i;
-	TDB_DATA key, ta_key, data;
 	struct xs_tdb_record_hdr *hdr;
 	uint64_t gen;
 	char *trans_name;
+	void *data;
 	int ret;
 
 	list_for_each_entry(i, &trans->accessed, list) {
 		if (!i->check_gen)
 			continue;
 
-		set_tdb_key(i->node, &key);
-		data = tdb_fetch(tdb_ctx, key);
-		hdr = (void *)data.dptr;
-		if (!data.dptr) {
-			if (tdb_error(tdb_ctx) != TDB_ERR_NOEXIST)
-				return EIO;
-			gen = NO_GENERATION;
-		} else
-			gen = hdr->generation;
-		talloc_free(data.dptr);
+		data = hashtable_search(nodes, i->node);
+		hdr = data;
+		gen = data ? hdr->generation : NO_GENERATION;
 		if (i->generation != gen)
 			return EAGAIN;
 	}
@@ -364,19 +355,14 @@ static int finalize_transaction(struct connection *conn,
 			/* We are doomed: the transaction is only partial. */
 			goto err;
 
-		set_tdb_key(trans_name, &ta_key);
-
 		if (i->modified) {
-			set_tdb_key(i->node, &key);
 			if (i->ta_node) {
-				data = tdb_fetch(tdb_ctx, ta_key);
-				if (!data.dptr)
+				data = hashtable_search(nodes, trans_name);
+				if (!data)
 					goto err;
-				hdr = (void *)data.dptr;
+				hdr = data;
 				hdr->generation = ++generation;
-				ret = tdb_store(tdb_ctx, key, data,
-						TDB_REPLACE);
-				talloc_free(data.dptr);
+				ret = hashtable_replace(nodes, i->node, data);
 				if (ret)
 					goto err;
 				fire_watches(conn, trans, i->node, NULL, false,
@@ -384,13 +370,13 @@ static int finalize_transaction(struct connection *conn,
 			} else {
 				fire_watches(conn, trans, i->node, NULL, false,
 					     i->perms.p ? &i->perms : NULL);
-				if (tdb_delete(tdb_ctx, key))
+				if (hashtable_remove(nodes, i->node))
 					goto err;
 			}
 		}
 
-		if (i->ta_node && tdb_delete(tdb_ctx, ta_key))
-			goto err;
+		if (i->ta_node && hashtable_remove(nodes, trans_name))
+				goto err;
 		list_del(&i->list);
 		talloc_free(i);
 	}
@@ -407,7 +393,6 @@ static int destroy_transaction(void *_transaction)
 	struct transaction *trans = _transaction;
 	struct accessed_node *i;
 	char *trans_name;
-	TDB_DATA key;
 
 	wrl_ntransactions--;
 	trace_destroy(trans, "transaction");
@@ -415,10 +400,8 @@ static int destroy_transaction(void *_transaction)
 		if (i->ta_node) {
 			trans_name = transaction_get_node_name(i, trans,
 							       i->node);
-			if (trans_name) {
-				set_tdb_key(trans_name, &key);
-				tdb_delete(tdb_ctx, key);
-			}
+			if (trans_name)
+				hashtable_remove(nodes, trans_name);
 		}
 		list_del(&i->list);
 		talloc_free(i);
diff --git a/tools/xenstore/xenstored_transaction.h b/tools/xenstore/xenstored_transaction.h
index 43a162bea3..89a79ddaa8 100644
--- a/tools/xenstore/xenstored_transaction.h
+++ b/tools/xenstore/xenstored_transaction.h
@@ -40,11 +40,11 @@ void transaction_entry_dec(struct transaction *trans, unsigned int domid);
 
 /* This node was accessed. */
 int access_node(struct connection *conn, struct node *node,
-                enum node_access_type type, TDB_DATA *key);
+                enum node_access_type type, const char **key);
 
 /* Prepend the transaction to name if appropriate. */
 int transaction_prepend(struct connection *conn, const char *name,
-                        TDB_DATA *key);
+                        const char **key);
 
 void conn_delete_all_transactions(struct connection *conn);
 int check_transactions(struct hashtable *hash);
diff --git a/tools/xenstore/xs_tdb_dump.c b/tools/xenstore/xs_tdb_dump.c
deleted file mode 100644
index 207ed446d5..0000000000
--- a/tools/xenstore/xs_tdb_dump.c
+++ /dev/null
@@ -1,86 +0,0 @@
-/* Simple program to dump out all records of TDB */
-#include <stdint.h>
-#include <stdlib.h>
-#include <fcntl.h>
-#include <stdio.h>
-#include <stdarg.h>
-#include <string.h>
-#include <sys/types.h>
-#include "xenstore_lib.h"
-#include "tdb.h"
-#include "talloc.h"
-#include "utils.h"
-
-static uint32_t total_size(struct xs_tdb_record_hdr *hdr)
-{
-	return sizeof(*hdr) + hdr->num_perms * sizeof(struct xs_permissions) 
-		+ hdr->datalen + hdr->childlen;
-}
-
-static char perm_to_char(enum xs_perm_type perm)
-{
-	return perm == XS_PERM_READ ? 'r' :
-		perm == XS_PERM_WRITE ? 'w' :
-		perm == XS_PERM_NONE ? '-' :
-		perm == (XS_PERM_READ|XS_PERM_WRITE) ? 'b' :
-		'?';
-}
-
-static void tdb_logger(TDB_CONTEXT *tdb, int level, const char * fmt, ...)
-{
-	va_list ap;
-
-	va_start(ap, fmt);
-	vfprintf(stderr, fmt, ap);
-	va_end(ap);
-}
-
-int main(int argc, char *argv[])
-{
-	TDB_DATA key;
-	TDB_CONTEXT *tdb;
-
-	if (argc != 2)
-		barf("Usage: xs_tdb_dump <tdbfile>");
-
-	tdb = tdb_open_ex(talloc_strdup(NULL, argv[1]), 0, 0, O_RDONLY, 0,
-			  &tdb_logger, NULL);
-	if (!tdb)
-		barf_perror("Could not open %s", argv[1]);
-
-	key = tdb_firstkey(tdb);
-	while (key.dptr) {
-		TDB_DATA data;
-		struct xs_tdb_record_hdr *hdr;
-
-		data = tdb_fetch(tdb, key);
-		hdr = (void *)data.dptr;
-		if (data.dsize < sizeof(*hdr))
-			fprintf(stderr, "%.*s: BAD truncated\n",
-				(int)key.dsize, key.dptr);
-		else if (data.dsize != total_size(hdr))
-			fprintf(stderr, "%.*s: BAD length %i for %i/%i/%i (%i)\n",
-				(int)key.dsize, key.dptr, (int)data.dsize,
-				hdr->num_perms, hdr->datalen,
-				hdr->childlen, total_size(hdr));
-		else {
-			unsigned int i;
-			char *p;
-
-			printf("%.*s: ", (int)key.dsize, key.dptr);
-			for (i = 0; i < hdr->num_perms; i++)
-				printf("%s%c%i",
-				       i == 0 ? "" : ",",
-				       perm_to_char(hdr->perms[i].perms),
-				       hdr->perms[i].id);
-			p = (void *)&hdr->perms[hdr->num_perms];
-			printf(" %.*s\n", hdr->datalen, p);
-			p += hdr->datalen;
-			for (i = 0; i < hdr->childlen; i += strlen(p+i)+1)
-				printf("\t-> %s\n", p+i);
-		}
-		key = tdb_nextkey(tdb, key);
-	}
-	return 0;
-}
-
-- 
2.26.2



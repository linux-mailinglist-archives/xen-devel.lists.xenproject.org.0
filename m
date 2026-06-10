Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g/usOdOFKWpxYgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 17:42:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D22E66AEB4
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 17:42:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b="ux5y/hei";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1334503.1597509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXL3M-00043x-Dm; Wed, 10 Jun 2026 15:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334503.1597509; Wed, 10 Jun 2026 15:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXL3M-00042N-BG; Wed, 10 Jun 2026 15:41:16 +0000
Received: by outflank-mailman (input) for mailman id 1334503;
 Wed, 10 Jun 2026 15:41:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wXL3K-00042H-If
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 15:41:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXL3J-002yQ2-Ux
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 17:41:13 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a29858d-e002-0a2a0a5209dd-0a2a4508dca0-10
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 17:41:13 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a298599-63b5-0a2a45080019-d155dd2ac1dc-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 17:41:13 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-45ef82204c6so3879528f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 08:41:13 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dcde3sm74605802f8f.1.2026.06.10.08.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 08:41:12 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1781106073; x=1781710873; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qndYU0vQVsNeLM+JlpEy3a/0w2lL2uNqn7mfGncOCjw=;
        b=ux5y/heict7tvN/gH25PSDAuPgqnN7ZgUIX0RXPsbAkNvwepApr8J9XVG6Qc+egPJ8
         hQ7f2vS5OV+g5RircDRnhMppga6LWa7pjyOdefKpfDMniRvW8JVDKC711d9oSJ3RNttT
         fY8MRd7Xd6TPivSRSbMd6MqsbKGjAWJb3e8KY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781106073; x=1781710873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qndYU0vQVsNeLM+JlpEy3a/0w2lL2uNqn7mfGncOCjw=;
        b=Jqb5pkLfkY6xzryiep/UnnjlbNwx5MvDkWIEH0/POYmCWApzcX/2ZfqlvblTP33kRz
         DvCfy4wA37JB0bUPBeKwIrZVJ051nSwiWykNie6VbX158QWsBPO9W+mW5uoLLx1/D9Vn
         qnIhM8ulrynJ8RgviTRudyMvCy2fDEJzvXcT6Zd1JVXiHlOIZeaeDAREYrMiBmyryS0k
         4Vwx+MfpamHiKrjbYPz/0mWAsNdOteZzsc1fiVT+qS7DezrLr29djHr9pXPgyypLoAa8
         SDCruhq9tGI93GqrgYQG0t2FKBjZMjkgz9iThHTtLy/OSfYl9RvynWMDvfDk9rtxU2Za
         RIzg==
X-Gm-Message-State: AOJu0YwoMiwNrN9uAQgSX+AduWbwEWBfrBEZbpTIfsK/dkxTLAzdKba5
	Bt3qmuW6WloB5aoehOqk9dFjKe8Ir48/G0heuVxiFab0/7/K+s6w8L4dOMFKHoEgWoyijK9CStG
	lF8Xj
X-Gm-Gg: Acq92OE334xPUh3LmT4OsRYex7DJSt5Ao+VQDgfyTuiyUpeoseRFbzGqAvca4LEVPal
	4XalmVYmhOuQScDB1X8YpfwbIflXz9b/ndPGXhLBMX5j/7IrQdwgcXESws+Y9Hg9kim0Gri+olU
	qGUuSPnjMUsZlEj5lgt3kyqyhsPK0a5gs25Z1S0vGzmn0K+AiYYYUHk7pH5IDkTxK8FULrLlSx/
	KM76dWOJNl/NqNB1hzmJSCSEWDjxQxZZtFDt0o5F3IrBSDRNrVlnSw0tLtPegnqybmfOCgf463C
	g81xqXYSkmEFtnBl4s7w8mZ7oITFtQzNZBMV4bsD8gW+oejT6sTLbfs8wVgxTOcfLC5RKBkFoD3
	6sxJkhnnFn4xNGcE4SzlhQT9zPHmPGu3GaktzFFNecJMLnRLLDsejgZWJpCmfvAkUZef9d7oZ0S
	oFoz2PaAEvPQNio07+cKHiKM5ocNqIZNKOIudJtN95Uxnx11TT/VRXh1g8cg0ulCeSItwDtCOOG
	I63uhzFAp1iuYk=
X-Received: by 2002:adf:ff89:0:b0:45e:ef2e:25a8 with SMTP id ffacd0b85a97d-46030623f7emr30417911f8f.32.1781106072650;
        Wed, 10 Jun 2026 08:41:12 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH for-next] xen/kexec: Style fixes
Date: Wed, 10 Jun 2026 16:41:10 +0100
Message-Id: <20260610154110.2979888-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1781106073-BC567DB1-5811F338/0/0
X-purgate-type: clean
X-purgate-size: 12351
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,valinux.co.jp:email,xen.org:email];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D22E66AEB4

Adjust kexec and kimage to more closely adhere to Xen style.

Sort the includes, dropping duplicates (kexec.h) and unused (ctype.h and
kernel.h).

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Kevin Lampis <kevin.lampis@citrix.com>

Fix these before they get copied around in the EFI changes.
---
 xen/common/kexec.c  | 94 +++++++++++++++++++++++++--------------------
 xen/common/kimage.c | 23 ++++++-----
 2 files changed, 64 insertions(+), 53 deletions(-)

diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 65776a95fd70..9ff22e43991c 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -6,31 +6,33 @@
  * - Magnus Damm <magnus@valinux.co.jp>
  */
 
-#include <xen/init.h>
-#include <xen/lib.h>
 #include <xen/acpi.h>
-#include <xen/ctype.h>
+#include <xen/console.h>
+#include <xen/cpu.h>
+#include <xen/cpumask.h>
 #include <xen/elfcore.h>
 #include <xen/errno.h>
 #include <xen/guest_access.h>
-#include <xen/param.h>
-#include <xen/watchdog.h>
-#include <xen/sched.h>
-#include <xen/types.h>
 #include <xen/hypercall.h>
+#include <xen/init.h>
 #include <xen/kexec.h>
 #include <xen/keyhandler.h>
-#include <public/kexec.h>
-#include <xen/cpumask.h>
-#include <asm/atomic.h>
+#include <xen/kimage.h>
+#include <xen/lib.h>
+#include <xen/param.h>
+#include <xen/sched.h>
 #include <xen/spinlock.h>
+#include <xen/types.h>
 #include <xen/version.h>
-#include <xen/console.h>
-#include <xen/kexec.h>
-#include <xen/kimage.h>
-#include <public/elfnote.h>
+#include <xen/watchdog.h>
+
+#include <asm/atomic.h>
+
 #include <xsm/xsm.h>
-#include <xen/cpu.h>
+
+#include <public/elfnote.h>
+#include <public/kexec.h>
+
 #ifdef CONFIG_COMPAT
 #include <compat/kexec.h>
 #endif
@@ -162,6 +164,7 @@ static int __init cf_check parse_crashkernel(const char *str)
 
             ++idx;
         } while ( *str == ',' );
+
         if ( idx < ARRAY_SIZE(ranges) )
             ranges[idx].size = 0;
     }
@@ -317,7 +320,7 @@ void kexec_crash_save_cpu(void)
     ELF_Prstatus *prstatus;
     crash_xen_core_t *xencore;
 
-    BUG_ON ( ! crash_notes );
+    BUG_ON(!crash_notes);
 
     if ( cpumask_test_and_set_cpu(cpu, &crash_saved_cpus) )
         return;
@@ -418,6 +421,7 @@ static void cf_check do_crashdump_trigger(unsigned char key)
 static void setup_note(Elf_Note *n, const char *name, int type, int descsz)
 {
     int l = strlen(name) + 1;
+
     strlcpy(ELFNOTE_NAME(n), name, l);
     n->namesz = l;
     n->descsz = descsz;
@@ -427,7 +431,7 @@ static void setup_note(Elf_Note *n, const char *name, int type, int descsz)
 static size_t sizeof_note(const char *name, int descsz)
 {
     return (sizeof(Elf_Note) +
-            ELFNOTE_ALIGN(strlen(name)+1) +
+            ELFNOTE_ALIGN(strlen(name) + 1) +
             ELFNOTE_ALIGN(descsz));
 }
 
@@ -439,7 +443,7 @@ static size_t sizeof_cpu_notes(const unsigned long cpu)
         + sizeof_note("Xen", sizeof(crash_xen_core_t));
 
     /* CPU0 also presents the crash_xen_info note. */
-    if ( ! cpu )
+    if ( !cpu )
         bytes = bytes +
             sizeof_note("Xen", sizeof(crash_xen_info_t));
 
@@ -450,24 +454,27 @@ static size_t sizeof_cpu_notes(const unsigned long cpu)
  * crash heap if the user has requested that crash notes be allocated
  * in lower memory.  There is currently no case where the crash notes
  * should be free()'d. */
-static void * alloc_from_crash_heap(const size_t bytes)
+static void *alloc_from_crash_heap(const size_t bytes)
 {
-    void * ret;
+    void *ret;
+
     if ( crash_heap_current + bytes > crash_heap_end )
         return NULL;
-    ret = (void*)crash_heap_current;
+
+    ret = crash_heap_current;
     crash_heap_current += bytes;
+
     return ret;
 }
 
 /* Allocate a crash note buffer for a newly onlined cpu. */
 static int kexec_init_cpu_notes(const unsigned long cpu)
 {
-    Elf_Note * note = NULL;
+    Elf_Note *note = NULL;
     int ret = 0;
     int nr_bytes = 0;
 
-    BUG_ON( cpu >= nr_cpu_ids || ! crash_notes );
+    BUG_ON(cpu >= nr_cpu_ids || !crash_notes);
 
     /* If already allocated, nothing to do. */
     if ( crash_notes[cpu].start )
@@ -505,7 +512,7 @@ static int kexec_init_cpu_notes(const unsigned long cpu)
 
         /* If the allocation failed, and another CPU did not beat us, give
          * up with ENOMEM. */
-        if ( ! note )
+        if ( !note )
             ret = -ENOMEM;
         /* else all is good so lets set up the notes. */
         else
@@ -518,7 +525,7 @@ static int kexec_init_cpu_notes(const unsigned long cpu)
             setup_note(note, "Xen", XEN_ELFNOTE_CRASH_REGS,
                        sizeof(crash_xen_core_t));
 
-            if ( ! cpu )
+            if ( !cpu )
             {
                 /* Set up Xen Crash Info note. */
                 xen_crash_note = note = ELFNOTE_NEXT(note);
@@ -548,8 +555,6 @@ static int cf_check cpu_callback(
          * fail the CPU_UP_PREPARE */
         kexec_init_cpu_notes(cpu);
         break;
-    default:
-        break;
     }
     return NOTIFY_DONE;
 }
@@ -592,7 +597,7 @@ static int __init cf_check kexec_init(void)
             get_order_from_bytes(crash_heap_size),
             MEMF_bits(crashinfo_maxaddr_bits) );
 
-        if ( ! crash_heap_current )
+        if ( !crash_heap_current )
             return -ENOMEM;
 
         memset(crash_heap_current, 0, crash_heap_size);
@@ -604,7 +609,7 @@ static int __init cf_check kexec_init(void)
        Only the individual CPU crash notes themselves must be allocated
        in lower memory if requested. */
     crash_notes = xzalloc_array(crash_note_range_t, nr_cpu_ids);
-    if ( ! crash_notes )
+    if ( !crash_notes )
         return -ENOMEM;
 
     register_keyhandler('C', do_crashdump_trigger, "trigger a crashdump", 0);
@@ -620,7 +625,8 @@ presmp_initcall(kexec_init);
 
 static int kexec_get_reserve(xen_kexec_range_t *range)
 {
-    if ( kexec_crash_area.size > 0 && kexec_crash_area.start > 0) {
+    if ( kexec_crash_area.size > 0 && kexec_crash_area.start > 0 )
+    {
         range->start = kexec_crash_area.start;
         range->size = kexec_crash_area.size;
     }
@@ -636,7 +642,7 @@ static int kexec_get_cpu(xen_kexec_range_t *range)
     if ( nr < 0 || nr >= nr_cpu_ids )
         return -ERANGE;
 
-    if ( ! crash_notes )
+    if ( !crash_notes )
         return -EINVAL;
 
     /* Try once again to allocate room for the crash notes.  It is just possible
@@ -726,7 +732,7 @@ static int kexec_get_range_compat(XEN_GUEST_HANDLE_PARAM(void) uarg)
     {
         XLAT_kexec_range(&compat_range, &range);
         if ( unlikely(__copy_to_guest(uarg, &compat_range, 1)) )
-             ret = -EFAULT;
+            ret = -EFAULT;
     }
 
     return ret;
@@ -760,7 +766,7 @@ void vmcoreinfo_append_str(const char *fmt, ...)
     int r;
     size_t note_size = sizeof(Elf_Note) + ELFNOTE_ALIGN(strlen(VMCOREINFO_NOTE_NAME) + 1);
 
-    if (vmcoreinfo_size + note_size + sizeof(buf) > VMCOREINFO_BYTES)
+    if ( vmcoreinfo_size + note_size + sizeof(buf) > VMCOREINFO_BYTES )
         return;
 
     va_start(args, fmt);
@@ -776,7 +782,7 @@ static void crash_save_vmcoreinfo(void)
 {
     size_t data_size;
 
-    if (vmcoreinfo_size > 0)    /* already saved */
+    if ( vmcoreinfo_size > 0 )    /* already saved */
         return;
 
     data_size = VMCOREINFO_BYTES - (sizeof(Elf_Note) + ELFNOTE_ALIGN(strlen(VMCOREINFO_NOTE_NAME) + 1));
@@ -835,7 +841,7 @@ static int kexec_exec(XEN_GUEST_HANDLE_PARAM(void) uarg)
     if ( !test_bit(base + pos, &kexec_flags) )
         return -ENOENT;
 
-    switch (exec.type)
+    switch ( exec.type )
     {
     case KEXEC_TYPE_DEFAULT:
         image = kexec_image[base + pos];
@@ -917,8 +923,8 @@ static int kexec_segments_add_segment(unsigned int *nr_segments,
     unsigned int n = *nr_segments;
 
     /* Need a new segment? */
-    if ( n == 0
-         || segments[n-1].dest_maddr + segments[n-1].dest_size != maddr )
+    if ( n == 0 ||
+         segments[n-1].dest_maddr + segments[n-1].dest_size != maddr )
     {
         n++;
         if ( n > KEXEC_SEGMENT_MAX )
@@ -1139,7 +1145,7 @@ static int kexec_load(XEN_GUEST_HANDLE_PARAM(void) uarg)
     return 0;
 
 error:
-    if ( ! kimage )
+    if ( !kimage )
         xfree(segments);
     kimage_free(kimage);
     return ret;
@@ -1229,32 +1235,38 @@ static int do_kexec_op_internal(unsigned long op,
     switch ( op )
     {
     case KEXEC_CMD_kexec_get_range:
-        if (compat)
-                ret = kexec_get_range_compat(uarg);
+        if ( compat )
+            ret = kexec_get_range_compat(uarg);
         else
-                ret = kexec_get_range(uarg);
+            ret = kexec_get_range(uarg);
         break;
+
     case KEXEC_CMD_kexec_load_v1:
         if ( compat )
             ret = kexec_load_v1_compat(uarg);
         else
             ret = kexec_load_v1(uarg);
         break;
+
     case KEXEC_CMD_kexec_unload_v1:
         if ( compat )
             ret = kexec_unload_v1_compat(uarg);
         else
             ret = kexec_unload_v1(uarg);
         break;
+
     case KEXEC_CMD_kexec:
         ret = kexec_exec(uarg);
         break;
+
     case KEXEC_CMD_kexec_load:
         ret = kexec_load(uarg);
         break;
+
     case KEXEC_CMD_kexec_unload:
         ret = kexec_unload(uarg);
         break;
+
     case KEXEC_CMD_kexec_status:
         ret = kexec_status(uarg);
         break;
diff --git a/xen/common/kimage.c b/xen/common/kimage.c
index 6202491f7e76..a0e4e67df7ee 100644
--- a/xen/common/kimage.c
+++ b/xen/common/kimage.c
@@ -11,15 +11,13 @@
  * Version 2.  See the file COPYING for more details.
  */
 
-#include <xen/types.h>
-#include <xen/init.h>
-#include <xen/kernel.h>
 #include <xen/errno.h>
-#include <xen/spinlock.h>
 #include <xen/guest_access.h>
-#include <xen/mm.h>
+#include <xen/init.h>
 #include <xen/kexec.h>
 #include <xen/kimage.h>
+#include <xen/mm.h>
+#include <xen/spinlock.h>
 
 #include <asm/page.h>
 
@@ -166,7 +164,7 @@ static int do_kimage_alloc(struct kexec_image **rimage, paddr_t entry,
             goto out;
     }
 
-    /* 
+    /*
      * Page for the relocation code must still be accessible after the
      * processor has switched to 32-bit mode.
      */
@@ -221,8 +219,8 @@ static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
     unsigned long i;
 
     /* Verify we have a valid entry point */
-    if ( (entry < kexec_crash_area.start)
-         || (entry > kexec_crash_area.start + kexec_crash_area.size))
+    if ( entry < kexec_crash_area.start ||
+         entry > kexec_crash_area.start + kexec_crash_area.size )
         return -EADDRNOTAVAIL;
 
     /*
@@ -244,8 +242,8 @@ static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
         mstart = segments[i].dest_maddr;
         mend = mstart + segments[i].dest_size;
         /* Ensure we are within the crash kernel limits. */
-        if ( (mstart < kexec_crash_area.start )
-             || (mend > kexec_crash_area.start + kexec_crash_area.size))
+        if ( mstart < kexec_crash_area.start ||
+             mend   > kexec_crash_area.start + kexec_crash_area.size )
             return -EADDRNOTAVAIL;
     }
 
@@ -606,7 +604,7 @@ static struct page_info *kimage_alloc_page(struct kexec_image *image,
         }
     }
     page = NULL;
-    for (;;)
+    for ( ;; )
     {
         kimage_entry_t *old;
 
@@ -825,7 +823,8 @@ int kimage_load_segments(struct kexec_image *image)
     int s;
     int result;
 
-    for ( s = 0; s < image->nr_segments; s++ ) {
+    for ( s = 0; s < image->nr_segments; s++ )
+    {
         result = kimage_load_segment(image, &image->segments[s]);
         if ( result < 0 )
             return result;
-- 
2.39.5



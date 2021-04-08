Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9B835832F
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 14:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107270.205076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTfb-0005Bb-0q; Thu, 08 Apr 2021 12:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107270.205076; Thu, 08 Apr 2021 12:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTfa-0005BA-Tz; Thu, 08 Apr 2021 12:21:58 +0000
Received: by outflank-mailman (input) for mailman id 107270;
 Thu, 08 Apr 2021 12:21:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUTfa-0005B4-0O
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 12:21:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6aeaeecf-1243-49ad-a7dc-c662847675c7;
 Thu, 08 Apr 2021 12:21:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85B6CB11B;
 Thu,  8 Apr 2021 12:21:56 +0000 (UTC)
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
X-Inumbo-ID: 6aeaeecf-1243-49ad-a7dc-c662847675c7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617884516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LAS4slsq4qONsaHE0lyME1eabgS+LFpyRRMDvBlV5sc=;
	b=ZrFnoZpjK9Y19sBBy9uNVmzq4/dp0pOy9jaf3xnlZVefPiEcKfD2Qo9n+Gno76tar54dwW
	u1qS/04eB3ERc5WHo0iigppR1yQNUol2Eb85l6RKt32yLdonMupcF6BawOrle6hhSvMLZz
	mfGCVKdyxHYKdfTIZSRjwbs5X8uky3c=
Subject: [PATCH 09/11] kexec: avoid effectively open-coding
 xzalloc_flex_struct()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
Message-ID: <4ea9c4a3-74c0-1722-fa5d-3930be99ef4a@suse.com>
Date: Thu, 8 Apr 2021 14:21:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There is a difference in generated code: xzalloc_bytes() forces
SMP_CACHE_BYTES alignment. I think we not only don't need this here, but
actually don't want it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -463,7 +463,10 @@ static void * alloc_from_crash_heap(cons
 /* Allocate a crash note buffer for a newly onlined cpu. */
 static int kexec_init_cpu_notes(const unsigned long cpu)
 {
-    Elf_Note * note = NULL;
+    struct elf_notes {
+        Elf_Note first;
+        unsigned char more[];
+    } *notes = NULL;
     int ret = 0;
     int nr_bytes = 0;
 
@@ -477,7 +480,8 @@ static int kexec_init_cpu_notes(const un
 
     /* If we dont care about the position of allocation, malloc. */
     if ( low_crashinfo_mode == LOW_CRASHINFO_NONE )
-        note = xzalloc_bytes(nr_bytes);
+        notes = xzalloc_flex_struct(struct elf_notes, more,
+                                    nr_bytes - sizeof(notes->first));
 
     /* Protect the write into crash_notes[] with a spinlock, as this function
      * is on a hotplug path and a hypercall path. */
@@ -490,26 +494,28 @@ static int kexec_init_cpu_notes(const un
         spin_unlock(&crash_notes_lock);
         /* Always return ok, because whether we successfully allocated or not,
          * another CPU has successfully allocated. */
-        xfree(note);
+        xfree(notes);
     }
     else
     {
         /* If we care about memory possition, alloc from the crash heap,
          * also protected by the crash_notes_lock. */
         if ( low_crashinfo_mode > LOW_CRASHINFO_NONE )
-            note = alloc_from_crash_heap(nr_bytes);
+            notes = alloc_from_crash_heap(nr_bytes);
 
-        crash_notes[cpu].start = note;
+        crash_notes[cpu].start = &notes->first;
         crash_notes[cpu].size = nr_bytes;
         spin_unlock(&crash_notes_lock);
 
         /* If the allocation failed, and another CPU did not beat us, give
          * up with ENOMEM. */
-        if ( ! note )
+        if ( ! notes )
             ret = -ENOMEM;
         /* else all is good so lets set up the notes. */
         else
         {
+            Elf_Note *note = &notes->first;
+
             /* Set up CORE note. */
             setup_note(note, "CORE", NT_PRSTATUS, sizeof(ELF_Prstatus));
             note = ELFNOTE_NEXT(note);



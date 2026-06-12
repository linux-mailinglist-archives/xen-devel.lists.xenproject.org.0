Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rESeGULfK2oqGwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:28:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF9D678AF3
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:28:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=LEiEn9L5;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1336587.1598425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXz6u-0007PB-3n; Fri, 12 Jun 2026 10:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336587.1598425; Fri, 12 Jun 2026 10:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXz6u-0007MT-12; Fri, 12 Jun 2026 10:27:36 +0000
Received: by outflank-mailman (input) for mailman id 1336587;
 Fri, 12 Jun 2026 10:27:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wXz6t-0007LY-4G
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 10:27:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXz6s-005BVI-3O
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 12:27:34 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2bdf0f-e002-0a2a0a5209dd-0a2a4509a65e-18
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:27:33 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2bdf15-2497-0a2a45090019-d155802ff0cb-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:27:33 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-491609cdd8fso2029625e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 03:27:33 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26393asm4437355f8f.5.2026.06.12.03.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 03:27:32 -0700 (PDT)
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
        d=citrix.com; s=google; t=1781260053; x=1781864853; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CFbdcue/z3xdCwKAm7oVToWlHnJSjldtNGJ5sUlNn6Q=;
        b=LEiEn9L5VRG1Pq7ZqGDpn/L3RH4H5X7hfZCClqgM93zTY0GewV03e9C5UXFRlpIKlK
         E3nZl+vV5OPwy6T8Gnp92vDFo2YR5pXk7SI1TF/Op2losZ8He1zFVdcbzHY9DKWOS/UG
         OPctODnBI3XlmbxcwZ+qtTbZvJ0e9DNMJKu08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781260053; x=1781864853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFbdcue/z3xdCwKAm7oVToWlHnJSjldtNGJ5sUlNn6Q=;
        b=KJorWLt9vC+1uCjowsCGWyRx27MMiCilMTEO9Md1Jodk81qdWJxJDoKq/Xy4TDFXv1
         3KpqiVI20OoLwVOobl2OuBenekQ+OAzr+DHAk5oYPHvfzMM1+Yqnv6FdN8WlWZL4/0j4
         wsxIHf3oCQLOPt3wBhewZBM0+PrpBYDqwXyS0P0cGbZIkufzKzEqjiZsNoI8ZD4WKPoO
         w5EYmhdHlmfwX887F4v+ki48wYnejn3vo17eEhxPrKHsl0JlVYpDqO0AdO7g73pplCb5
         PtY14OFradtogUNC3tPYYoSgXG64i/Mp6mAP459tfXimY1i0msspT13kYIG7lAJMahXI
         bS9A==
X-Gm-Message-State: AOJu0YygUjFhd98PjwRo3p7iApSmUJ+5IxLqq+sLpSBJ6HcrI0HC88ck
	+mUcUhJVE8O6T2JsPHRL0H2xZvKLMGhvUP5ZkfOfGuXWW9M3iU1NHyOpQ7h9/5rRcn3nxeWg0SJ
	HJFHb
X-Gm-Gg: Acq92OFdD5Q9uN/Q0DSk++3Tc0EnM10T7CzHZsDV01RlEbR+ls2Uqnt1Qu2T38RCpkD
	hQrC+h/2qFuYyszaCbLo/C7ZKHodNn2C2SO6qSAwzVvpuxk+SSrXMbB2yn/k3CLdjQnJjA/a5Gr
	6iFOSZCwmSE9rME60kViwpi6K6own7yg2n+poWMN09r+ZLzV62ly/UjqYFpvJIsCsDn3m+mJHET
	CUK5jXLxqMHpf/wI2g8uyotpYaYSq1AFAjCr6f7URnU7BO7iDoKO1xnQNNieJAau8wtNiXE/vHq
	dlYdPT6hIhzWI5yvkJ2CzB+OakneimNj14s7b8i8+cNqyPVKR3Fyl1Z6Xx6JSfRlp2QA8YCmyYf
	RRc+lcnWYiWA0yyTigemuqW5j0YuVZPnsV5pOXndQ8rVjVLcomPvh2pOEM81II4Sr2+ymmeutZc
	W6Y6GW5P1iA/CBgKleCVaZZ6mpljZhPaDigiRF+vF3sgAU+E6/ehJDKTT7Aoujtzwq8pT/lVCSd
	GFa
X-Received: by 2002:a05:6000:40cc:b0:441:1e41:19c with SMTP id ffacd0b85a97d-4606dbad4a3mr3269892f8f.20.1781260052741;
        Fri, 12 Jun 2026 03:27:32 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH for-4.23] xen/kexec: Drop the obsolete v1 hypercall implementation
Date: Fri, 12 Jun 2026 11:27:27 +0100
Message-Id: <20260612102727.3121098-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1781260053-4377AA53-EDD3084B/10/73395122804
X-purgate-type: spam
X-purgate-size: 13493
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksii.kurochko@gmail.com,m:kevin.lampis@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email,vates.tech:email,xen.org:email,xenproject.org:url,changelog.md:url,amd.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCF9D678AF3

The v1 interface was declared obsolete in Xen 4.4 (2013) when kexec in Xen was
overhauled.

The only known user of the v1 interface was the classic-xen fork of Linux.
Linux PVOps does not interact with Xen kexec directly, delegating it entirely
to userspace (i.e. kexec-tools).  Xen support in kexec-tools was part of this
work, and uses the "new" interface.

As such, there's no way to test changes to the interface any more.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Kevin Lampis <kevin.lampis@citrix.com>

For 4.23, but I'd like to get this into my for-next branch nowish so other
work can be rebased over it.

This patch will need rebasing over release activities in CHANGELOG.md but
that's easy to do.

Bloat-o-meter reports:
  add/remove: 1/3 grow/shrink: 0/4 up/down: 152/-1431 (-1279)
  Function                                     old     new   delta
  kexec_swap_images                              -     152    +152
  symbols_sorted_offsets                     69592   69576     -16
  symbols_offsets                            53668   53652     -16
  symbols_names                             135309  135272     -37
  do_kexec_op_internal                        2038    1994     -44
  kexec_do_unload.isra                         170       -    -170
  kexec_load_slot                              510       -    -510
  kexec_do_load_v1                             638       -    -638
---
 CHANGELOG.md               |   8 ++
 xen/common/kexec.c         | 241 +------------------------------------
 xen/include/public/kexec.h |  45 +------
 xen/include/xlat.lst       |   1 -
 4 files changed, 13 insertions(+), 282 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5cf19372a361..5c1113ab61af 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -4,6 +4,14 @@ Notable changes to Xen will be documented in this file.
 
 The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
+## [4.23.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
+
+### Removed
+ - On x86:
+   - The kexec "v1" interface, which was declared obsolete in Xen 4.4 (2013).
+     The only know user was the classic-xen fork of Linux.  This does not
+     affect Xen kexec support in the kexec-tools package.
+
 ## [4.22.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
 ### Changed
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 65776a95fd70..fec67ed6936d 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -900,206 +900,6 @@ static int kexec_load_slot(struct kexec_image *kimage)
     return 0;
 }
 
-static uint16_t kexec_load_v1_arch(void)
-{
-#ifdef CONFIG_X86
-    return is_pv_32bit_domain(hardware_domain) ? EM_386 : EM_X86_64;
-#else
-    return EM_NONE;
-#endif
-}
-
-static int kexec_segments_add_segment(unsigned int *nr_segments,
-                                      xen_kexec_segment_t *segments,
-                                      mfn_t mfn)
-{
-    paddr_t maddr = mfn_to_maddr(mfn);
-    unsigned int n = *nr_segments;
-
-    /* Need a new segment? */
-    if ( n == 0
-         || segments[n-1].dest_maddr + segments[n-1].dest_size != maddr )
-    {
-        n++;
-        if ( n > KEXEC_SEGMENT_MAX )
-            return -EINVAL;
-        *nr_segments = n;
-
-        set_xen_guest_handle(segments[n-1].buf.h, NULL);
-        segments[n-1].buf_size = 0;
-        segments[n-1].dest_maddr = maddr;
-        segments[n-1].dest_size = 0;
-    }
-
-    return 0;
-}
-
-static int kexec_segments_from_ind_page(mfn_t mfn,
-                                        unsigned int *nr_segments,
-                                        xen_kexec_segment_t *segments,
-                                        bool compat)
-{
-    void *page;
-    kimage_entry_t *entry;
-    int ret = 0;
-
-    page = map_domain_page(mfn);
-
-    /*
-     * Walk the indirection page list, adding destination pages to the
-     * segments.
-     */
-    for ( entry = page; ; )
-    {
-        unsigned long ind;
-
-        ind = kimage_entry_ind(entry, compat);
-        mfn = kimage_entry_mfn(entry, compat);
-
-        switch ( ind )
-        {
-        case IND_DESTINATION:
-            ret = kexec_segments_add_segment(nr_segments, segments, mfn);
-            if ( ret < 0 )
-                goto done;
-            break;
-        case IND_INDIRECTION:
-            unmap_domain_page(page);
-            entry = page = map_domain_page(mfn);
-            continue;
-        case IND_DONE:
-            goto done;
-        case IND_SOURCE:
-            if ( *nr_segments == 0 )
-            {
-                ret = -EINVAL;
-                goto done;
-            }
-            segments[*nr_segments-1].dest_size += PAGE_SIZE;
-            break;
-        default:
-            ret = -EINVAL;
-            goto done;
-        }
-        entry = kimage_entry_next(entry, compat);
-    }
-done:
-    unmap_domain_page(page);
-    return ret;
-}
-
-static int kexec_do_load_v1(xen_kexec_load_v1_t *load, int compat)
-{
-    struct kexec_image *kimage = NULL;
-    xen_kexec_segment_t *segments;
-    uint16_t arch;
-    unsigned int nr_segments = 0;
-    mfn_t ind_mfn = maddr_to_mfn(load->image.indirection_page);
-    int ret;
-
-    arch = kexec_load_v1_arch();
-    if ( arch == EM_NONE )
-        return -ENOSYS;
-
-    segments = xmalloc_array(xen_kexec_segment_t, KEXEC_SEGMENT_MAX);
-    if ( segments == NULL )
-        return -ENOMEM;
-
-    /*
-     * Work out the image segments (destination only) from the
-     * indirection pages.
-     *
-     * This is needed so we don't allocate pages that will overlap
-     * with the destination when building the new set of indirection
-     * pages below.
-     */
-    ret = kexec_segments_from_ind_page(ind_mfn, &nr_segments, segments, compat);
-    if ( ret < 0 )
-        goto error;
-
-    ret = kimage_alloc(&kimage, load->type, arch, load->image.start_address,
-                       nr_segments, segments);
-    if ( ret < 0 )
-        goto error;
-
-    /*
-     * Build a new set of indirection pages in the native format.
-     *
-     * This walks the guest provided indirection pages a second time.
-     * The guest could have altered then, invalidating the segment
-     * information constructed above.  This will only result in the
-     * resulting image being potentially unrelocatable.
-     */
-    ret = kimage_build_ind(kimage, ind_mfn, compat);
-    if ( ret < 0 )
-        goto error;
-
-    if ( arch == EM_386 || arch == EM_X86_64 )
-    {
-        /*
-         * Ensure 0 - 1 MiB is mapped and accessible by the image.
-         *
-         * This allows access to VGA memory and the region purgatory copies
-         * in the crash case.
-         */
-        unsigned long addr;
-
-        for ( addr = 0; addr < MB(1); addr += PAGE_SIZE )
-        {
-            ret = machine_kexec_add_page(kimage, addr, addr);
-            if ( ret < 0 )
-                goto error;
-        }
-    }
-
-    ret = kexec_load_slot(kimage);
-    if ( ret < 0 )
-        goto error;
-
-    return 0;
-
-error:
-    if ( !kimage )
-        xfree(segments);
-    kimage_free(kimage);
-    return ret;
-}
-
-static int kexec_load_v1(XEN_GUEST_HANDLE_PARAM(void) uarg)
-{
-    xen_kexec_load_v1_t load;
-
-    if ( unlikely(copy_from_guest(&load, uarg, 1)) )
-        return -EFAULT;
-
-    return kexec_do_load_v1(&load, 0);
-}
-
-static int kexec_load_v1_compat(XEN_GUEST_HANDLE_PARAM(void) uarg)
-{
-#ifdef CONFIG_COMPAT
-    compat_kexec_load_v1_t compat_load;
-    xen_kexec_load_v1_t load;
-
-    if ( unlikely(copy_from_guest(&compat_load, uarg, 1)) )
-        return -EFAULT;
-
-    /* This is a bit dodgy, load.image is inside load,
-     * but XLAT_kexec_load (which is automatically generated)
-     * doesn't translate load.image (correctly)
-     * Just copy load->type, the only other member, manually instead.
-     *
-     * XLAT_kexec_load(&load, &compat_load);
-     */
-    load.type = compat_load.type;
-    XLAT_kexec_image(&load.image, &compat_load.image);
-
-    return kexec_do_load_v1(&load, 1);
-#else
-    return 0;
-#endif
-}
-
 static int kexec_load(XEN_GUEST_HANDLE_PARAM(void) uarg)
 {
     xen_kexec_load_t load;
@@ -1159,34 +959,6 @@ static int kexec_do_unload(xen_kexec_unload_t *unload)
     return 0;
 }
 
-static int kexec_unload_v1(XEN_GUEST_HANDLE_PARAM(void) uarg)
-{
-    xen_kexec_load_v1_t load;
-    xen_kexec_unload_t unload;
-
-    if ( copy_from_guest(&load, uarg, 1) )
-        return -EFAULT;
-
-    unload.type = load.type;
-    return kexec_do_unload(&unload);
-}
-
-static int kexec_unload_v1_compat(XEN_GUEST_HANDLE_PARAM(void) uarg)
-{
-#ifdef CONFIG_COMPAT
-    compat_kexec_load_v1_t compat_load;
-    xen_kexec_unload_t unload;
-
-    if ( copy_from_guest(&compat_load, uarg, 1) )
-        return -EFAULT;
-
-    unload.type = compat_load.type;
-    return kexec_do_unload(&unload);
-#else
-    return 0;
-#endif
-}
-
 static int kexec_unload(XEN_GUEST_HANDLE_PARAM(void) uarg)
 {
     xen_kexec_unload_t unload;
@@ -1234,18 +1006,7 @@ static int do_kexec_op_internal(unsigned long op,
         else
                 ret = kexec_get_range(uarg);
         break;
-    case KEXEC_CMD_kexec_load_v1:
-        if ( compat )
-            ret = kexec_load_v1_compat(uarg);
-        else
-            ret = kexec_load_v1(uarg);
-        break;
-    case KEXEC_CMD_kexec_unload_v1:
-        if ( compat )
-            ret = kexec_unload_v1_compat(uarg);
-        else
-            ret = kexec_unload_v1(uarg);
-        break;
+
     case KEXEC_CMD_kexec:
         ret = kexec_exec(uarg);
         break;
diff --git a/xen/include/public/kexec.h b/xen/include/public/kexec.h
index 40d79e936b86..abb2a49238f1 100644
--- a/xen/include/public/kexec.h
+++ b/xen/include/public/kexec.h
@@ -41,10 +41,6 @@
 
 #include "xen.h"
 
-#if defined(__i386__) || defined(__x86_64__)
-#define KEXEC_XEN_NO_PAGES 17
-#endif
-
 /*
  * Prototype for this hypercall is:
  *  int kexec_op(unsigned long cmd, void *args)
@@ -66,24 +62,6 @@
 #define KEXEC_TYPE_DEFAULT 0
 #define KEXEC_TYPE_CRASH   1
 
-
-/* The kexec implementation for Xen allows the user to load two
- * types of kernels, KEXEC_TYPE_DEFAULT and KEXEC_TYPE_CRASH.
- * All data needed for a kexec reboot is kept in one xen_kexec_image_t
- * per "instance". The data mainly consists of machine address lists to pages
- * together with destination addresses. The data in xen_kexec_image_t
- * is passed to the "code page" which is one page of code that performs
- * the final relocations before jumping to the new kernel.
- */
-
-typedef struct xen_kexec_image {
-#if defined(__i386__) || defined(__x86_64__)
-    unsigned long page_list[KEXEC_XEN_NO_PAGES];
-#endif
-    unsigned long indirection_page;
-    unsigned long start_address;
-} xen_kexec_image_t;
-
 /*
  * Perform kexec having previously loaded a kexec or kdump kernel
  * as appropriate.
@@ -109,16 +87,11 @@ typedef struct xen_kexec_exec {
 } xen_kexec_exec_t;
 
 /*
- * Load/Unload kernel image for kexec or kdump.
- * type  == KEXEC_TYPE_DEFAULT or KEXEC_TYPE_CRASH [in]
- * image == relocation information for kexec (ignored for unload) [in]
+ * Obsolete since Xen 4.4.  Removed in Xen 4.23
+ *
+#define KEXEC_CMD_kexec_load_v1         1
+#define KEXEC_CMD_kexec_unload_v1       2
  */
-#define KEXEC_CMD_kexec_load_v1         1 /* obsolete since 0x00040400 */
-#define KEXEC_CMD_kexec_unload_v1       2 /* obsolete since 0x00040400 */
-typedef struct xen_kexec_load_v1 {
-    int type;
-    xen_kexec_image_t image;
-} xen_kexec_load_v1_t;
 
 #define KEXEC_RANGE_MA_CRASH      0 /* machine address and size of crash area */
 #define KEXEC_RANGE_MA_XEN        1 /* machine address and size of Xen itself */
@@ -149,7 +122,6 @@ typedef struct xen_kexec_range {
     unsigned long start;
 } xen_kexec_range_t;
 
-#if __XEN_INTERFACE_VERSION__ >= 0x00040400
 /*
  * A contiguous chunk of a kexec image and it's destination machine
  * address.
@@ -224,15 +196,6 @@ typedef struct xen_kexec_status {
 } xen_kexec_status_t;
 DEFINE_XEN_GUEST_HANDLE(xen_kexec_status_t);
 
-#else /* __XEN_INTERFACE_VERSION__ < 0x00040400 */
-
-#define KEXEC_CMD_kexec_load KEXEC_CMD_kexec_load_v1
-#define KEXEC_CMD_kexec_unload KEXEC_CMD_kexec_unload_v1
-#define xen_kexec_load xen_kexec_load_v1
-#define xen_kexec_load_t xen_kexec_load_v1_t
-
-#endif
-
 #endif /* _XEN_PUBLIC_KEXEC_H */
 
 /*
diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
index 9d08dcc4bb11..33dc8e2b2a4a 100644
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -127,7 +127,6 @@
 ?	hypfs_dirlistentry		hypfs.h
 
 ?	kexec_exec			kexec.h
-!	kexec_image			kexec.h
 !	kexec_range			kexec.h
 
 !	add_to_physmap			memory.h
-- 
2.39.5



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CF6AA083A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 12:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971785.1360207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9hxa-0003Zc-Pf; Tue, 29 Apr 2025 10:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971785.1360207; Tue, 29 Apr 2025 10:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9hxa-0003VX-KJ; Tue, 29 Apr 2025 10:13:06 +0000
Received: by outflank-mailman (input) for mailman id 971785;
 Tue, 29 Apr 2025 10:13:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b72w=XP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u9hxY-0002lF-Fc
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 10:13:04 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89953c43-24e2-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 12:13:04 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so39259445e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 03:13:04 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-440a53108f2sm150572995e9.19.2025.04.29.03.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 03:13:02 -0700 (PDT)
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
X-Inumbo-ID: 89953c43-24e2-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745921583; x=1746526383; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CJ1GLjFyCNm9vFKPLq5u51w/wTBpAsdbN9G66Tv51c=;
        b=SQyP7R89jWcMAVcIkv/JqhTjjRpjrbgbhUYoBvOsdwdD3Wh6OiQaMu/Hm8eLpjtkWk
         N6rMt7bwv0Wkftn2YPZ/B3IClRYJZX6F78PAKwo8I4DHkWGxhC4GxRJfaOKGJIfkb3bQ
         qErjOZOGksI7wlijJjyBpuwrJzQJXR3JIi/TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745921583; x=1746526383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7CJ1GLjFyCNm9vFKPLq5u51w/wTBpAsdbN9G66Tv51c=;
        b=B7pukYyTtyCrjEKRab7UwYziQW/ynzCd8vrPP4UtTO0G0juqCXjUuieJSR7L+ywie2
         9oVEbpOiGJW+JCAsZ4F4mGuf3w4faE0f6zx36DZT22U1jtcTNNJ/HIuFJCxubQJTOaeG
         SnLq+ZeDX1ar3Q5xAxzs29DWUmU7tCazTwyXzsYreOz8KXnsYXERvt72jPjC+H2WcogP
         h28yiyvWlkJ2BeegOnJfzjda7xG+mVKDQTslLz6qgSNv4GK60vyTN7nYUxijQRZa3q98
         CaNJqnk1PkY18J7lJfkIiSM3hBRdtP9yJdv7EwTP6eBC9v6vcMqIy9XMhbvopxfU2/yI
         f/Og==
X-Gm-Message-State: AOJu0YwCq66bQFvgfRdHVRrFI+e2QeJXgSpSuc9ElBXNyTU9taE7qp4p
	Bg6iKVp5I76y3818kVeZhIs7oGmVge5wLFbxhcfyS0KSwu1kkf+aN4qxuyplD0+FesNH/sm8Z3V
	N
X-Gm-Gg: ASbGncsuTXC/Fa7srhN60k7Ezxk/0WNZzFMtXh98cpZ2zWK5nTKPO4Q8Ntcs+xQbWEv
	Njsmzn3FSI9WOO2tqGWXz5M8qQbXBzekn7VedDNBV5FSQGbyqXKvY4D4vxqD/kL6/8sBqM72PgU
	RQVYw7RNwAJpHv5HxOpVCuw4moPzeI02JKCUsCPWhV1ADfbB7/PtefXyVtZhbyqftiNly2rgrPK
	QpxMiZnmTEbMR2BhQQn4Eqf0BRLzA4CPRq/kT6gAVHEhOlGyESnfJPl+kh56NhyIcv208bRoOwC
	2W5WzNuF2vzfS52iDwe/JT6BndwOdj/7RDn+gNQKeNb9YQ==
X-Google-Smtp-Source: AGHT+IEOJ/wfcryri+UbOqfRiNzGC0pauT7wSOakZOHefUanQmRnJPgvW2y8PUSCV9XJ1ox1hpvLqg==
X-Received: by 2002:a05:600c:4ec8:b0:43d:36c:f24 with SMTP id 5b1f17b1804b1-441ac858518mr27540835e9.13.1745921582977;
        Tue, 29 Apr 2025 03:13:02 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v4 3/4] x86/hvm: only register the r/o subpage ops when needed
Date: Tue, 29 Apr 2025 12:12:51 +0200
Message-ID: <20250429101252.50071-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250429101252.50071-1-roger.pau@citrix.com>
References: <20250429101252.50071-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

MMIO operation handlers can be expensive to process, hence attempt to
register only those that will be needed by the domain.

Subpage r/o MMIO regions are added exclusively at boot, further limit their
addition to strictly before the initial domain gets created, so by the time
initial domain creation happens Xen knows whether subpage is required or
not.  This allows only registering the MMIO handler when there are
subpage regions to handle.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Could possibly be part of the previous patch, but strictly speaking is an
improvement, as even before the previous patch subpage r/o was always
called even when no subpage regions are registered.
---
 xen/arch/x86/hvm/hvm.c        |  3 ++-
 xen/arch/x86/include/asm/mm.h |  1 +
 xen/arch/x86/mm.c             | 16 ++++++++++++++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 6b998387e3d8..4cb2e13046d1 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -692,7 +692,8 @@ int hvm_domain_initialise(struct domain *d,
 
     register_portio_handler(d, XEN_HVM_DEBUGCONS_IOPORT, 1, hvm_print_line);
 
-    register_subpage_ro_handler(d);
+    if ( subpage_ro_active() )
+        register_subpage_ro_handler(d);
 
     if ( hvm_tsc_scaling_supported )
         d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index c2e9ef6e5023..aeb8ebcf2d56 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -561,6 +561,7 @@ struct subpage_ro_range {
     void __iomem *mapped;
     DECLARE_BITMAP(ro_elems, PAGE_SIZE / MMIO_RO_SUBPAGE_GRAN);
 };
+bool subpage_ro_active(void);
 struct subpage_ro_range *subpage_mmio_find_page(mfn_t mfn);
 void __iomem *subpage_mmio_map_page(struct subpage_ro_range *entry);
 void subpage_mmio_write_emulate(
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 7ead2db3cb72..6697984507bf 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4922,6 +4922,11 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     return rc;
 }
 
+bool subpage_ro_active(void)
+{
+    return !list_empty(&subpage_ro_ranges);
+}
+
 struct subpage_ro_range *subpage_mmio_find_page(mfn_t mfn)
 {
     struct subpage_ro_range *entry;
@@ -5011,6 +5016,17 @@ int __init subpage_mmio_ro_add(
          !IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN) )
         return -EINVAL;
 
+    /*
+     * Force all r/o subregions to be registered before initial domain
+     * creation, so that the emulation handlers can be added only when there
+     * are pages registered.
+     */
+    if ( system_state >= SYS_STATE_smp_boot )
+    {
+        ASSERT_UNREACHABLE();
+        return -EILSEQ;
+    }
+
     if ( !size )
         return 0;
 
-- 
2.48.1



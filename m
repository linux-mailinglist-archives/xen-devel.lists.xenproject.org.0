Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0309B874E13
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 12:49:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689798.1075106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCFB-0008Df-9L; Thu, 07 Mar 2024 11:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689798.1075106; Thu, 07 Mar 2024 11:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCFB-0008BV-5a; Thu, 07 Mar 2024 11:49:01 +0000
Received: by outflank-mailman (input) for mailman id 689798;
 Thu, 07 Mar 2024 11:49:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZPn=KN=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1riCFA-0008BP-7v
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 11:49:00 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af59e324-dc78-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 12:48:59 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4130ff11782so4275125e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 03:48:59 -0800 (PST)
Received: from meli.delivery (adsl-101.109.242.224.tellas.gr.
 [109.242.224.101]) by smtp.gmail.com with ESMTPSA id
 fa18-20020a05600c519200b004130c1dc29csm2432000wmb.22.2024.03.07.03.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 03:48:58 -0800 (PST)
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
X-Inumbo-ID: af59e324-dc78-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709812139; x=1710416939; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G/SbbEMUCs/VycRuaZQyQX/2EumGC/JTHxyB6vdSb1o=;
        b=yhOxkDFtz2bS9KDAlk96rVv42aoydj1uATX3GQtJBMfQAHRWZhA/4nbeF/8KAx/yZN
         nfEanmp0mC+tRt9dcjqhdCvza8Os687AMHPSzisDuEh0Eq9fUXQSAaNoFAJz8NJ0VvR6
         3qL5xKZ0xMnMLNzd9iqkTZ6QKK4r66rwo5galGh+7VIMEkVWQ3PvtXgH/OVV2SkLm3hG
         4AHXwgG50/T9nfu2YQKaqayXDVoIxGlxKKTJiNXk+qLSsidEXf7LVRWSpg3H7IkJIejj
         Ch/G1uV/K6bJnypDIgBEQiiDhaSEpaqD4HVaeArcK6BPjEF/0SfX45FSeomTCG2ILxwZ
         KhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709812139; x=1710416939;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G/SbbEMUCs/VycRuaZQyQX/2EumGC/JTHxyB6vdSb1o=;
        b=PhXhuX7tcoxd4hkDEVT2THkCemByP9+5cdCVpUZAbDftM2CUhfEe8ftSYG1IEDbTEK
         sNhc/0Tad8ET0KDR2n0hltZ4qdnrcF6cR8Stv35n3JnQkdUpB0xXA2k/oiKEu008QJ/F
         e3jXmYYOs/qPDVtVNH1cASXCUI/ngVVX3Ll6QJF5bs95mV+1Ioq+ZtjsdGgfCZ4NymoK
         GJiZdAy+nNb7AA4TQGZh73gHuKp2s7/Kx9esoqwcc6QQ4/Qvwn5bQCiMBxOaxgTuCjZg
         Ra35X4/kTVKQdMe9HoONH8tbjiSM277f5Q5rrg0BRyJKOyg/QXMdKV88ma1Ktv+Coplf
         9ujg==
X-Forwarded-Encrypted: i=1; AJvYcCVUWoVdSq147m8veFbiXe2SMH2t331AmQ8737cOOgaMgQjPGh2tGaPY90Q9hXP3EAfwOKO4lgxqD5opsL+sAX7xBZzzFnDWBXsdkOwk12w=
X-Gm-Message-State: AOJu0YyFrhUE3Pto41nZAf4T7ORc3RTnkGHecqTb5pquyp5eHdHiFOBN
	FbXH+5oKtL+1qfT1H/cblV55zj//GPmmUqoPXE8CP5juJNKyIpKz8E9IfDX2O/8=
X-Google-Smtp-Source: AGHT+IGkmoMw3a1DPayc7QnWHr4dDS3sIBh8SO1Tg4XHtfrHtXIYWWCQjxeTzAsb6sqGUSlj3ULtUw==
X-Received: by 2002:a05:600c:3c86:b0:412:8d98:78a with SMTP id bg6-20020a05600c3c8600b004128d98078amr14629463wmb.13.1709812138686;
        Thu, 07 Mar 2024 03:48:58 -0800 (PST)
Date: Thu, 07 Mar 2024 13:46:27 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-arm@nongnu.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH-for-9.0 2/9] hw/xen/hvm: Propagate page_mask to a pair of functions
User-Agent: meli 0.8.5-rc.3
References: <20231114163123.74888-1-philmd@linaro.org> <20231114163123.74888-3-philmd@linaro.org>
In-Reply-To: <20231114163123.74888-3-philmd@linaro.org>
Message-ID: <9z7hk.qddjfbvts5k7@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed

On Tue, 14 Nov 2023 18:31, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>We are going to replace TARGET_PAGE_MASK by a
>runtime variable. In order to reduce code duplication,
>propagate TARGET_PAGE_MASK to get_physmapping() and
>xen_phys_offset_to_gaddr().
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> hw/i386/xen/xen-hvm.c | 18 ++++++++++--------
> 1 file changed, 10 insertions(+), 8 deletions(-)
>
>diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
>index 8aa6a1ec3b..3b10425986 100644
>--- a/hw/i386/xen/xen-hvm.c
>+++ b/hw/i386/xen/xen-hvm.c
>@@ -174,11 +174,12 @@ static void xen_ram_init(PCMachineState *pcms,
>     }
> }
> 
>-static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size)
>+static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size,
>+                                   int page_mask)
> {
>     XenPhysmap *physmap = NULL;
> 
>-    start_addr &= TARGET_PAGE_MASK;
>+    start_addr &= page_mask;
> 
>     QLIST_FOREACH(physmap, &xen_physmap, list) {
>         if (range_covers_byte(physmap->start_addr, physmap->size, start_addr)) {
>@@ -188,9 +189,10 @@ static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size)
>     return NULL;
> }
> 
>-static hwaddr xen_phys_offset_to_gaddr(hwaddr phys_offset, ram_addr_t size)
>+static hwaddr xen_phys_offset_to_gaddr(hwaddr phys_offset, ram_addr_t size,
>+                                       int page_mask)
> {
>-    hwaddr addr = phys_offset & TARGET_PAGE_MASK;
>+    hwaddr addr = phys_offset & page_mask;
>     XenPhysmap *physmap = NULL;
> 
>     QLIST_FOREACH(physmap, &xen_physmap, list) {
>@@ -252,7 +254,7 @@ static int xen_add_to_physmap(XenIOState *state,
>     hwaddr phys_offset = memory_region_get_ram_addr(mr);
>     const char *mr_name;
> 
>-    if (get_physmapping(start_addr, size)) {
>+    if (get_physmapping(start_addr, size, TARGET_PAGE_MASK)) {
>         return 0;
>     }
>     if (size <= 0) {
>@@ -325,7 +327,7 @@ static int xen_remove_from_physmap(XenIOState *state,
>     XenPhysmap *physmap = NULL;
>     hwaddr phys_offset = 0;
> 
>-    physmap = get_physmapping(start_addr, size);
>+    physmap = get_physmapping(start_addr, size, TARGET_PAGE_MASK);
>     if (physmap == NULL) {
>         return -1;
>     }
>@@ -373,7 +375,7 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
>     int rc, i, j;
>     const XenPhysmap *physmap = NULL;
> 
>-    physmap = get_physmapping(start_addr, size);
>+    physmap = get_physmapping(start_addr, size, TARGET_PAGE_MASK);
>     if (physmap == NULL) {
>         /* not handled */
>         return;
>@@ -633,7 +635,7 @@ void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
>         int rc;
>         ram_addr_t start_pfn, nb_pages;
> 
>-        start = xen_phys_offset_to_gaddr(start, length);
>+        start = xen_phys_offset_to_gaddr(start, length, TARGET_PAGE_MASK);
> 
>         if (length == 0) {
>             length = TARGET_PAGE_SIZE;
>-- 
>2.41.0
>
>


Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>


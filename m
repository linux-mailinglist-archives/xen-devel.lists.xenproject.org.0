Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BC0AABD54
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 10:35:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976749.1363908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDlK-0004UL-Vg; Tue, 06 May 2025 08:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976749.1363908; Tue, 06 May 2025 08:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDlK-0004PL-Rf; Tue, 06 May 2025 08:34:50 +0000
Received: by outflank-mailman (input) for mailman id 976749;
 Tue, 06 May 2025 08:34:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vx1h=XW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCDlJ-00048v-Jn
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 08:34:49 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f859a0a5-2a54-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 10:34:48 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso33352265e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 01:34:48 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-441b2ad781csm205613275e9.8.2025.05.06.01.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 01:34:47 -0700 (PDT)
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
X-Inumbo-ID: f859a0a5-2a54-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746520487; x=1747125287; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19/KyvkkozHoKYd6THg8hoTBnLfqHO1KkIE+C5r6Ttw=;
        b=DnEpj6Ggz/7xcVhoCfkCW6eRtzC8+kCfh/4vLG/Z1Tz9VUIw0gB2xMaKEa0Hn9Ztyc
         tvMrtz0PSUC+++8ohnfblXlo+ts2qv4RUQDNQl4i9KhvCUBtgVN+2vNo7YKZ4AXceCGq
         fmWircFhNXUT/wFIuMuu5QFmAK2l3zT/DX1sY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746520487; x=1747125287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19/KyvkkozHoKYd6THg8hoTBnLfqHO1KkIE+C5r6Ttw=;
        b=mvuNUhrh613unIxfaaZ2feAHxvDtQzELwyREHVZmyJIoKJbS2sun4IA74dZVJzvP6A
         EMlpb79jVqhT3jY9gsrs8ok2lrX8uArueqA53btGupyLO77ce02Ke7P69j+2yWEkNTqz
         jVUxFm+sz5ft1y9KWZXEtKn1UD9D/iZCxFjLgOjvnSFihBiZu6d6617J7nb/hqEVNydf
         BPHgmeNza92Ihhoz9tJyx5+f49xxQckfoKG3WM/qFXJ11RdtT6gF8YHC+0IVj7uCCie8
         H9xLNmFEDg/UmQeKWnZzWYyhue+xQjkBpv0E8VrTEtIkM7rfIkWbB0WrWuyUBGgfbgJC
         YAMQ==
X-Gm-Message-State: AOJu0YzS7NVPDyHLu5L8xohxoVUFfubMCXT7Q9BYBtTTGhqLDYiCbwcB
	I6bB3intj3EMUXV1K2WePShvLvb6d4jxGFuxRE1syfcX0JES7plcaRfqETf/4vHr98Iqp0n2Y9L
	+
X-Gm-Gg: ASbGnct5SpwrEEMwItHDuJIY1sbZ87BES2vCAYrYClfew83n03ItNVxXXriDcdgUuwK
	LuHL0NexbXtI4TNRkF0TWoSKUXOvF1curWoQBgfZooKvuPCI4UbKcSv+366O0JXiYF2DiBwvzIN
	BaTYqHzFDiziWTwZpJaRvvWFN2Aav4xjareAovimpsEJk6I6u21Gt3TR8DyrMGCsSe66MEE8Dnk
	OArjZCw8/xtKoxtt3aR8KxUbM6FHHDo1kH4iorzE7VXEVpx3nvzy2Kwb/4XXfAhTKAlP1fE9fJ5
	NUbFg1oO+S3eH+JPVzf7YZ8yvRp/cbky9kfGYhU9Y7JXCA==
X-Google-Smtp-Source: AGHT+IGeiYHYC7We2Fl1uR/572QDRTgfKbWh2I7K7bHpEmD3xsWylfGZiO1SHAizD8Ez5pgi7kFCDA==
X-Received: by 2002:a05:600c:c17:b0:43c:eeee:b706 with SMTP id 5b1f17b1804b1-441d0531273mr17628335e9.24.1746520487359;
        Tue, 06 May 2025 01:34:47 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/9] xen/gnttab: limit cache flush operation to guests allowed cache control
Date: Tue,  6 May 2025 10:31:42 +0200
Message-ID: <20250506083148.34963-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506083148.34963-1-roger.pau@citrix.com>
References: <20250506083148.34963-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Whether a domain is allowed to issue cache-control operations is reported
by the cache_flush_permitted() check.  Introduce such check to limit the
availability of GNTTABOP_cache_flush to only guests that are granted cache
control.

Fixes: 18e8d22fe750 ("introduce GNTTABOP_cache_flush")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/grant_table.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index e75ff98aff1c..d874ac5f1241 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3780,6 +3780,11 @@ long do_grant_table_op(
 
         if ( unlikely(!guest_handle_okay(cflush, count)) )
             goto out;
+
+        rc = -EPERM;
+        if ( !cache_flush_permitted(current->domain) )
+            goto out;
+
         rc = gnttab_cache_flush(cflush, &opaque_in, count);
         if ( rc >= 0 )
         {
-- 
2.48.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C50D7196BA4
	for <lists+xen-devel@lfdr.de>; Sun, 29 Mar 2020 09:26:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jISHS-0006oh-QC; Sun, 29 Mar 2020 07:22:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NY0J=5O=gmail.com=singhalsimran0@srs-us1.protection.inumbo.net>)
 id 1jISHQ-0006oc-V9
 for xen-devel@lists.xenproject.org; Sun, 29 Mar 2020 07:22:49 +0000
X-Inumbo-ID: 175e6a20-718e-11ea-92cf-bc764e2007e4
Received: from mail-pg1-x544.google.com (unknown [2607:f8b0:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 175e6a20-718e-11ea-92cf-bc764e2007e4;
 Sun, 29 Mar 2020 07:22:48 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id k191so7020284pgc.13
 for <xen-devel@lists.xenproject.org>; Sun, 29 Mar 2020 00:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=ms/KeYb74m6R2Hy3cll1q1Agsy2MUdqPDpymPCb5nrc=;
 b=JzyxFe16O+7z27aoDOMqSseoNgOVE6u8+cVHVvt2ztIOeA7jSqnuyPSozms45GsBiK
 7opS+6SRaPEF1B4y+uiJjl8aTp3kze7s5dNGN9O680uAc1evKKc68jjZ12kdAiwkbQr8
 nMd78MgWPZsEfOINUkYNaG4HLXtfQmhpXBnxlydQZbsA47GEuEYU2R2puEJGhkflkx/u
 044pXri+nHKBDgOLyaEvWkPu6j53+pfoDh7FzSjga3gwfscXYi8uXawEBhUZQx0LipeQ
 mVpvr0juDuyXSgvxJRYUFzWEo3BvUEl+GhSfSJghGa4304ihQWcfCxPhf+R8hQPpgO0w
 WvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=ms/KeYb74m6R2Hy3cll1q1Agsy2MUdqPDpymPCb5nrc=;
 b=bc/yDZqVCuf1F0T/5IoW0yjXtL592EkT+4fiwJR8yGY7YhgcdLxtF0/AQu43Z8pEqi
 2gAzdirTVMYkF332vJZbva1dvZayIlrkP9EYgssn9LASkVfN8MDXUl+7qOLG9Vw42wcc
 UQU81k63J24L28HRvyFI/C5TkbxYIF7F3HM7RVhAhxBsZHiiVK97W7pNXhRCtGjK9xtu
 28+WIgZ4Hy9Tu5UY+AWHSAOnDmcmy5u1ciN1KCH6Do7H9TMgBhe2Yrzv6ewZXflSlYPP
 g25RBhs/zGmje3WGQf1uAxDNRhNH1Co7G1f+t+LHKxUxpgC5OEhjhVjH1PgRjvENBJFO
 NTnA==
X-Gm-Message-State: ANhLgQ1Dsj2h59Lo3Sne3AY8EUYYZ3Ji3F5YujKfNsPrtGqokLCVFQpG
 hPVmLJZ6n6LyYLW/agN71MU=
X-Google-Smtp-Source: ADFU+vv83F0m8RMeGJGKdLyFArrq/tX8yt4T1OfXjoTGagWDgy8ot1r/LoXGdCNPlWAcdcX2JBs3dw==
X-Received: by 2002:a63:9210:: with SMTP id o16mr7760700pgd.442.1585466567401; 
 Sun, 29 Mar 2020 00:22:47 -0700 (PDT)
Received: from simran-Inspiron-5558 ([2409:4052:2ea9:879:e86a:3263:71b5:b71b])
 by smtp.gmail.com with ESMTPSA id
 p1sm5447332pjr.40.2020.03.29.00.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 00:22:46 -0700 (PDT)
Date: Sun, 29 Mar 2020 12:52:42 +0530
From: Simran Singhal <singhalsimran0@gmail.com>
To: xen-devel@lists.xenproject.org
Message-ID: <20200329072242.GA1394@simran-Inspiron-5558>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: [Xen-devel] [PATCH] xen/x86: Use min macro instead of ternary
 operator
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Replace ternary operator with macro min as it is shorter and
thus increases code readability. Macro min return the minimum of the
two compared values.

Signed-off-by: Simran Singhal <singhalsimran0@gmail.com>
---
 xen/arch/x86/bzimage.c    | 2 +-
 xen/arch/x86/mm.c         | 2 +-
 xen/arch/x86/mm/p2m-ept.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
index ac4fd428be..f396aa3445 100644
--- a/xen/arch/x86/bzimage.c
+++ b/xen/arch/x86/bzimage.c
@@ -136,7 +136,7 @@ int __init bzimage_parse(void *image_base, void **image_start,
         *image_len = output_len;
     }
 
-    return err > 0 ? 0 : err;
+    return min(0, err);
 }
 
 /*
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 2fac67ad57..c7617f80e8 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1988,7 +1988,7 @@ static int demote_l3_table(struct page_info *page)
         page->partial_flags = partial_flags;
         rc = -ERESTART;
     }
-    return rc > 0 ? 0 : rc;
+    return min(0, rc);
 }
 
 static int demote_l4_table(struct page_info *page)
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index eb0f0edfef..38faa4df52 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1069,7 +1069,7 @@ static int ept_change_entry_type_range(struct p2m_domain *p2m,
     if ( sync )
         ept_sync_domain(p2m);
 
-    return rc < 0 ? rc : 0;
+    return min(rc, 0);
 }
 
 static void ept_memory_type_changed(struct p2m_domain *p2m)
-- 
2.17.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FC3194523
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 18:11:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHVzr-00089Z-O7; Thu, 26 Mar 2020 17:08:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6lDd=5L=gmail.com=raistlin.df@srs-us1.protection.inumbo.net>)
 id 1jHVzq-00089U-IZ
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 17:08:46 +0000
X-Inumbo-ID: 739b02b4-6f84-11ea-8823-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 739b02b4-6f84-11ea-8823-12813bfff9fa;
 Thu, 26 Mar 2020 17:08:45 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id d198so7351036wmd.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2020 10:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:user-agent
 :mime-version:content-transfer-encoding;
 bh=YSzrE5LOIs7CTi7Z/uVxNAEXZwpAPQozP9FOL27fHy0=;
 b=ml/eaDyZYaFVKynx1Pa2jh3zukIwdtneIwkQ/w3hGeIRIBJv8AFzTiV3okKpbyJAOx
 7yh+1nQw5U8R0KNyvjvL5/5BTrKlOTXBNQrU4baFND7PNGsMOV/dMkavwMWmdwEq89Bl
 iwW3gtkNN0GXv/cVwLbkCYHeUzwI+jwh+HgYnYeOqIZKTZZtl0RYbQfTrEiWyRaeu+b7
 VeYPXBNAfG3D7FTnXLJn5oLUkbYl0iH5a4/uY7VQ3dz5mLS3yfafBwSNuDgy3HFCBnbf
 4hyuH8daPWSlAT5auxMVaLUU13uCRySwzts8VMCXKIzeOLYSZ8FZqZPlqRWCfbdrPAFH
 lDlw==
X-Gm-Message-State: ANhLgQ36qqsOVqAiuXn3v+WtjjwjYB0KSL35R242ihKZi5ne1gfH6PjN
 DbFyeH5DaoLlHbZ5SEgVmgc=
X-Google-Smtp-Source: ADFU+vv9pvJo6+deAZEFwxoLwBEvRXl+WGGo0Kh1GSaI+gDjT8czUaz4bl8cM00y3m65nNb0GVMDBw==
X-Received: by 2002:a1c:b4d4:: with SMTP id d203mr919075wmf.85.1585242524925; 
 Thu, 26 Mar 2020 10:08:44 -0700 (PDT)
Received: from [192.168.0.35] (87.78.186.89.cust.ip.kpnqwest.it.
 [89.186.78.87])
 by smtp.gmail.com with ESMTPSA id i1sm4334730wrq.89.2020.03.26.10.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 10:08:44 -0700 (PDT)
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 26 Mar 2020 18:08:43 +0100
Message-ID: <158524252335.30595.3422322089286433323.stgit@Palanthas>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH] xen: credit2: document that min_rqd is valid
 and ok to use
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
Cc: =?utf-8?q?J=C3=BCrgen?= =?utf-8?b?R3Jvw58=?= <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Code is a bit involved, and it is not easy to tell that min_rqd, inside
csched2_res_pick() is actually pointing to a runqueue, when it is
dereferenced.

Add a comment and an ASSERT() for that.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: Jürgen Groß <jgross@suse.com>
---
 xen/common/sched/credit2.c |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index c7241944a8..9da51e624b 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -2387,6 +2387,13 @@ csched2_res_pick(const struct scheduler *ops, const struct sched_unit *unit)
         goto out_up;
     }
 
+    /*
+     * If we're here, min_rqd must be valid. In fact, either we picked a
+     * runqueue in the "list_for_each" (as min_avgload is initialized to
+     * MAX_LOAD) or we just did that (in the "else" branch) above.
+     */
+    ASSERT(min_rqd);
+
     new_cpu = cpumask_cycle(min_rqd->pick_bias, cpumask_scratch_cpu(cpu));
     min_rqd->pick_bias = new_cpu;
     BUG_ON(new_cpu >= nr_cpu_ids);



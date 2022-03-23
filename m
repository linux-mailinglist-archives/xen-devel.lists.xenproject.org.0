Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A34384E579D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 18:36:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294031.499772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4tq-000547-Bh; Wed, 23 Mar 2022 17:35:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294031.499772; Wed, 23 Mar 2022 17:35:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4tq-00051j-7V; Wed, 23 Mar 2022 17:35:58 +0000
Received: by outflank-mailman (input) for mailman id 294031;
 Wed, 23 Mar 2022 17:35:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s5zF=UC=gmail.com=philippe.mathieu.daude@srs-se1.protection.inumbo.net>)
 id 1nX4df-0004Zy-AL
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 17:19:15 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c6eb699-aacd-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 18:19:14 +0100 (CET)
Received: by mail-pl1-x634.google.com with SMTP id x2so2149951plm.7
 for <xen-devel@lists.xenproject.org>; Wed, 23 Mar 2022 10:19:14 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 5-20020a17090a1a4500b001c54dc9061esm266865pjl.51.2022.03.23.10.19.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:19:12 -0700 (PDT)
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
X-Inumbo-ID: 5c6eb699-aacd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ARhouW8OXYXIRPQjyAafjquDP6FUc0ZjucITbhHVg5E=;
        b=qrmYjLiXax41wynkldUk46+CTEMhEwNtecSEajm0opdutnFDwZFnb5R/0qKYGW240d
         Xfip76+lUKk9ny0xZ6YhE00J4TKeGUMnJ8SoGN13GNg0qwOnowPKMtRWHdotb/gtDf5D
         MtRHQsTElQmEIKX9ZZdHDbTe5WtCrvk7tdOYhyQM3qFOeBHzl9lmse0tjqCeQBy7UGAO
         ybhOz4GI6Y3MO4ukQmThEULFFMRC2oMeKASkkcCP/dzLf46Qozna5NyY8TjPqJE1DQEs
         GnXGhPd1I7iqkj+/YcGjrCQJ3XokcBCDvDTZ5EW8eBPnuLOf/HAk1jK7Hlg+t8pJiPz7
         v+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ARhouW8OXYXIRPQjyAafjquDP6FUc0ZjucITbhHVg5E=;
        b=lMnf/fuGLay5TZ7Z5DIGDug+/cODlT1IjdyDM59/QXU+QMTqdnIIxy07ralCIyOr5c
         IuDH3RibmXuhH2l4s7XoRzR3Ac5fAvmkQthoB043MT0rQ28F/6Nq4xfiTxIsSuY6ILbG
         1d4LE/rmsI3NYKZgd695trQfQOFSBmzoPovEAwKz0AUz4fPNkoU2JQKGq34xUlDh+nZB
         f24u2ikLKhTWUM623h26ZfFrQGXX4mdjhMlkmPtvmu0e2oevHG65C8KW7qBp0XHo9+SZ
         j6R/fec/yQP+MmWXdsU8HsOPYOZQ83otJJJkSqR66+oe9cn9kGuSfAj/m1mj0L3PtrEE
         iQtQ==
X-Gm-Message-State: AOAM5317H5StRMbcyzH6XpSPNoev3jMad4DdnMfxQoCBIZXiVKGjZvbq
	oCwrGA1LBaCC9/qucDvcwRg=
X-Google-Smtp-Source: ABdhPJzLdZtFm+tMEOoscqkjQAgJQZm9yuu7A4C9NQT5lLkj2BUY8yeJrCTrFbO4ucEGmuTjUPWoUA==
X-Received: by 2002:a17:902:bf07:b0:14f:a3a7:97a0 with SMTP id bi7-20020a170902bf0700b0014fa3a797a0mr1005569plb.105.1648055953255;
        Wed, 23 Mar 2022 10:19:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Wenchao Wang <wenchao.wang@intel.com>,
	Laurent Vivier <lvivier@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Cameron Esfahani <dirty@apple.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	haxm-team@intel.com,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Colin Xu <colin.xu@intel.com>
Subject: [PATCH v4 06/13] accel/tcg: Reorganize tcg_accel_ops_init()
Date: Wed, 23 Mar 2022 18:17:44 +0100
Message-Id: <20220323171751.78612-7-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reorg TCG AccelOpsClass initialization to emphasis icount
mode share more code with single-threaded TCG.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/tcg-accel-ops.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index ea7dcad674..d2181ea1e5 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -98,16 +98,17 @@ static void tcg_accel_ops_init(AccelOpsClass *ops)
         ops->create_vcpu_thread = mttcg_start_vcpu_thread;
         ops->kick_vcpu_thread = mttcg_kick_vcpu_thread;
         ops->handle_interrupt = tcg_handle_interrupt;
-    } else if (icount_enabled()) {
-        ops->create_vcpu_thread = rr_start_vcpu_thread;
-        ops->kick_vcpu_thread = rr_kick_vcpu_thread;
-        ops->handle_interrupt = icount_handle_interrupt;
-        ops->get_virtual_clock = icount_get;
-        ops->get_elapsed_ticks = icount_get;
     } else {
         ops->create_vcpu_thread = rr_start_vcpu_thread;
         ops->kick_vcpu_thread = rr_kick_vcpu_thread;
-        ops->handle_interrupt = tcg_handle_interrupt;
+
+        if (icount_enabled()) {
+            ops->handle_interrupt = icount_handle_interrupt;
+            ops->get_virtual_clock = icount_get;
+            ops->get_elapsed_ticks = icount_get;
+        } else {
+            ops->handle_interrupt = tcg_handle_interrupt;
+        }
     }
 }
 
-- 
2.35.1



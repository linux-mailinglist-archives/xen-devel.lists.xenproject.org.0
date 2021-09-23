Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39850415EE6
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:55:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194104.345791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOFk-0006Cl-5D; Thu, 23 Sep 2021 12:55:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194104.345791; Thu, 23 Sep 2021 12:55:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOFk-00069K-1K; Thu, 23 Sep 2021 12:55:04 +0000
Received: by outflank-mailman (input) for mailman id 194104;
 Thu, 23 Sep 2021 12:55:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD/Q=ON=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mTOFj-0004it-36
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:55:03 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9edd8dd-1b80-4a1e-8fa5-90642b8eaa89;
 Thu, 23 Sep 2021 12:54:46 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id z24so26706855lfu.13
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 05:54:46 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id l7sm453584lfk.52.2021.09.23.05.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:54:44 -0700 (PDT)
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
X-Inumbo-ID: f9edd8dd-1b80-4a1e-8fa5-90642b8eaa89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yvjDacI417BPdKlJvGk7p+c4OF7HOtW+eGbmd4BLwuQ=;
        b=KOEKA0CpK+2fx5D8i0IiC0UcNJ/awgi6r6h3MF+wm7BRKSywc3+9cvPq9lK1ldbvVY
         EYGyrKDvqHOiz5P9ip+8adsBWwjA6oy3VhcUlYED1KOIxEdKFrLXjdoUQ9JuAXR/7PtJ
         WtISAU9iKzh3nSH9rougHWArA+9Z4dW07ff4PaOFjrDe+7a28spqEEv3ON2hZzYwfd/Q
         C3sNpeq3Z6Ab8EqyG06A3nfyN3BhBQ99XH9KjDKXzNrOKXZqIl26S3cpv5KVF6Ptca9E
         Jl50A4MC/9vspNZNPNnO4q6j9tKZWtCX2zgfkc3TeyAEB3vapwjc1PQd6r9KjzbeIHpC
         sOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yvjDacI417BPdKlJvGk7p+c4OF7HOtW+eGbmd4BLwuQ=;
        b=2s2X6EtyT57HVCmhiEsr0lTzfyz+rTrmBmPzzM/Rw56ucbeEYJ0rRZe2bQN1q8qlTl
         DJ5rq+k2lXhF1F3SrimBIFFL+bZw49hGMfmUikGu43yfJULJyNt7uQrP3juKXEVoiimw
         eomvl95cf+RcN7cwfUwf4lqFumRdEJB1NwR910Cce9UAzwezoxt0NXdHWNf2MsP4FPpn
         MunFb+3G7WtjcpkKNpQkbprm4BDttiNePfpXAm5Q7nyP3Wpda9bcFKc9/KULjMzoQ618
         tz5WuRPNtlEh13ZwRRszl/PqR8WSjdkxCPd4oSXgAgyfH0gO+GKk7TnzLcI20Er02mYP
         NDTw==
X-Gm-Message-State: AOAM531GsWQjAcfh1sRrOYX//hTul6ajy/anrVRb2uiFP/cnG4wYi8zj
	ZQJ6pKRE/GabCj/CwRO4JwcxscvdVRJbVg==
X-Google-Smtp-Source: ABdhPJyT22i21H5QrosLmLTvjvbY/GOQr+1/ScI3gtJHYC4bLwkBlXfvXTV5VzcTJKuzm1EhUp3eEw==
X-Received: by 2002:a19:c1c3:: with SMTP id r186mr4106670lff.400.1632401684938;
        Thu, 23 Sep 2021 05:54:44 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v2 04/11] xen/device-tree: Make dt_find_node_by_phandle global
Date: Thu, 23 Sep 2021 15:54:31 +0300
Message-Id: <20210923125438.234162-5-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923125438.234162-1-andr2000@gmail.com>
References: <20210923125438.234162-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Make dt_find_node_by_phandle globally visible, so it can be re-used by
other frameworks.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/common/device_tree.c      | 2 +-
 xen/include/xen/device_tree.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index ea93da1725f6..4aae281e89bf 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -1047,7 +1047,7 @@ int dt_for_each_range(const struct dt_device_node *dev,
  *
  * Returns a node pointer.
  */
-static struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle)
+struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle)
 {
     struct dt_device_node *np;
 
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 9069040ef7f7..3334048d3bb5 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -850,6 +850,8 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
  */
 int dt_get_pci_domain_nr(struct dt_device_node *node);
 
+struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
+
 #ifdef CONFIG_DEVICE_TREE_DEBUG
 #define dt_dprintk(fmt, args...)  \
     printk(XENLOG_DEBUG fmt, ## args)
-- 
2.25.1



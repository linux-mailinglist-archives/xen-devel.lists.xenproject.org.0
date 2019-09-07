Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7B6AC989
	for <lists+xen-devel@lfdr.de>; Sat,  7 Sep 2019 23:44:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6iSc-0007TV-5l; Sat, 07 Sep 2019 21:41:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PlyV=XC=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1i6iSa-0007TN-Sq
 for xen-devel@lists.xenproject.org; Sat, 07 Sep 2019 21:41:32 +0000
X-Inumbo-ID: 41d06b80-d1b8-11e9-978d-bc764e2007e4
Received: from mail-pg1-x543.google.com (unknown [2607:f8b0:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41d06b80-d1b8-11e9-978d-bc764e2007e4;
 Sat, 07 Sep 2019 21:41:32 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id x15so5487382pgg.8
 for <xen-devel@lists.xenproject.org>; Sat, 07 Sep 2019 14:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=rar7+a8LD0KANAp/lVeGtNr0VZS4OVkIBwxcWjVF7fo=;
 b=kwSx+U26sg/1ZFJEwjbGN++gHnIHb25rHZQsX7kQge9MWN2Wn/8QiDbNh5Yx/3ecs0
 1zEkIP8zO8k8w4wnReHUF009lMiHIidZHKDpcJx6DabjzX3j+xIFQpAF6Am1pHQScsyx
 A2iliUkyQT0+XOOHJdQ2Uf7WvinVvPa0XTTlUL5NwE0EoE/Jd8nqZndeJn1xBgJf8JLy
 GesKao2qJon0PnciwA1FJofqTgS8vpb+86V6Mn/Z0cGUv1AGRaKYz5CmQ9OEkLlr+e/Y
 1jaz9g9YSTdBJ83S6AWzyyrD7cza1zehSuSFX1wB42VOeTMc9t9QlzckCkzKCaKVKELm
 3I6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=rar7+a8LD0KANAp/lVeGtNr0VZS4OVkIBwxcWjVF7fo=;
 b=RB+gUvfRz0a1phLuBXlbCCyMQB8Mdk5E4WFbDI1K9OBNNxCcTxzDN6fhry2NcvcoZo
 6zLtimJfEKCHmgTNLQ2rThezrSqnVu/hqq7xgkEWu9LVCtzd95J+lgnSDdP05rKt1mqQ
 FJjMuecPRAAWWHueMkxiORgtVufQvXgXOtWEDEHGGVK+HneifRysquusK28fxDWB1Bam
 SxrBUIePSWF3Zba2ysUN6beq6Sq4LfelR45ScU4C1MiJAcu6wUZsm5ppyNUwdmqiSvV2
 uGyadO1Ewk1mgQEeTIPKhSs6Cy+Z2R9TcEW72knoTbejaZLSqjYk7g6OsfmwBOg9viFx
 r5fA==
X-Gm-Message-State: APjAAAUWuab9GCeTl5bwwjX2VF6tCwcZefds8+t468BZIKryt95qFX3H
 sncXxgmAofNb4OxO1Mih8Es=
X-Google-Smtp-Source: APXvYqwoZAkoLr5to9U2rXC0sBG3iafTZgw6qEDbSJDElFdfik0viB+6vT7qjTj7VVZh0WLTfkqGzA==
X-Received: by 2002:a62:1658:: with SMTP id 85mr19104372pfw.195.1567892491692; 
 Sat, 07 Sep 2019 14:41:31 -0700 (PDT)
Received: from localhost.localdomain ([112.79.80.177])
 by smtp.gmail.com with ESMTPSA id h11sm9078516pgv.5.2019.09.07.14.41.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 07 Sep 2019 14:41:30 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 sashal@kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, akpm@linux-foundation.org, david@redhat.com,
 osalvador@suse.com, mhocko@suse.com, pasha.tatashin@soleen.com,
 dan.j.williams@intel.com, richard.weiyang@gmail.com, cai@lca.pw
Date: Sun,  8 Sep 2019 03:17:03 +0530
Message-Id: <854db2cf8145d9635249c95584d9a91fd774a229.1567889743.git.jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1567889743.git.jrdr.linux@gmail.com>
References: <cover.1567889743.git.jrdr.linux@gmail.com>
In-Reply-To: <cover.1567889743.git.jrdr.linux@gmail.com>
References: <cover.1567889743.git.jrdr.linux@gmail.com>
Subject: [Xen-devel] [PATCH 2/3] xen/ballon: Avoid calling dummy function
 __online_page_set_limits()
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
Cc: Souptick Joarder <jrdr.linux@gmail.com>, xen-devel@lists.xenproject.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

X19vbmxpbmVfcGFnZV9zZXRfbGltaXRzKCkgaXMgYSBkdW1teSBmdW5jdGlvbiBhbmQgYW4gZXh0
cmEgY2FsbAp0byB0aGlzIGZ1bmN0aW9uIGNhbiBiZSBhdm9pZGVkLgoKU2lnbmVkLW9mZi1ieTog
U291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy94ZW4v
YmFsbG9vbi5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMveGVuL2JhbGxvb24uYyBiL2RyaXZlcnMveGVuL2JhbGxvb24uYwppbmRleCA0
ZTExZGU2Li4wNWIxZjdlIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9iYWxsb29uLmMKKysrIGIv
ZHJpdmVycy94ZW4vYmFsbG9vbi5jCkBAIC0zNzYsNyArMzc2LDYgQEAgc3RhdGljIHZvaWQgeGVu
X29ubGluZV9wYWdlKHN0cnVjdCBwYWdlICpwYWdlLCB1bnNpZ25lZCBpbnQgb3JkZXIpCiAJbXV0
ZXhfbG9jaygmYmFsbG9vbl9tdXRleCk7CiAJZm9yIChpID0gMDsgaSA8IHNpemU7IGkrKykgewog
CQlwID0gcGZuX3RvX3BhZ2Uoc3RhcnRfcGZuICsgaSk7Ci0JCV9fb25saW5lX3BhZ2Vfc2V0X2xp
bWl0cyhwKTsKIAkJX19TZXRQYWdlT2ZmbGluZShwKTsKIAkJX19iYWxsb29uX2FwcGVuZChwKTsK
IAl9Ci0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=

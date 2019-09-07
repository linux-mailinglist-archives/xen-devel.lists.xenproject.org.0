Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1DDAC988
	for <lists+xen-devel@lfdr.de>; Sat,  7 Sep 2019 23:44:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6iSO-0007Sx-J5; Sat, 07 Sep 2019 21:41:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PlyV=XC=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1i6iSN-0007Ss-Lj
 for xen-devel@lists.xenproject.org; Sat, 07 Sep 2019 21:41:19 +0000
X-Inumbo-ID: 39600794-d1b8-11e9-a337-bc764e2007e4
Received: from mail-pl1-x641.google.com (unknown [2607:f8b0:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39600794-d1b8-11e9-a337-bc764e2007e4;
 Sat, 07 Sep 2019 21:41:18 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id t1so4781546plq.13
 for <xen-devel@lists.xenproject.org>; Sat, 07 Sep 2019 14:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=wEzd7dh/YfO3zGLSxxCdwFOAGiIma8fe0owdbCkXYmQ=;
 b=EF6LYsvWkXNSwOEXeE/6qHUB7pHfQ83htTle+NmPGwqybQ6Pt0jKRg4Wa27sovW/ni
 NmrFujKRHtQXBDBdP9pkAfvI/6w4T+Y436JlzgoPW7FqV4ThEqdq7dako9+HV19cPW4n
 /uZifgpZfEjT1YGD9+BmbMXz3a54nSaZZ/2PoVfnygssJ6+GC5SuurZ99ysJED63QoPf
 act/g/bReiNpFjOvKy+IJTpJWLw4EZQb53OaOxz4GoJb+2ZCDr1qolmeiWXw2XPvBuxu
 XKQ/cNXPoDcQN5fBaoqD+XzWJqozOZfyfMy9465SkLtiM2n+LCifhb0iKgepQvpSwQcs
 px7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wEzd7dh/YfO3zGLSxxCdwFOAGiIma8fe0owdbCkXYmQ=;
 b=V0R3qgWipd1bd9V8NSwXafSPrIaCTEwj1O/RKAf4bbRUd3N3LoF4e4Rn2H82NkyD+F
 hkPqDqIxpuc1MZ74yszmZ58VJYgFT4cY7LtufJ4Xpl4xTcMI8Y4Xy6uOvs+IG3s0x5Af
 vy0gjsah6FbDiHHyJw5/AurXMMcteNUR+1EbL3BIpMTxcJ+EZxDd6mYnE9f0izKOZ9l0
 0Z13/5TkHRq4ZzAccsMm1PK1UBHkSGOup1RF4CmiVAEMdACY8bQHNVFoJyhXj6eW1wew
 NWtPETqu1m472BdNJi6x1AjAiyz94KB1k+0YBO1u6Rq7SVvduod8tHTI2NiMHtt6VIBW
 Encg==
X-Gm-Message-State: APjAAAWH1KgrUHK0i7o1ma5XlerrCGm8Mu6TKGppQCHCGEZFtkt952fR
 NNatoDr1iXE6wXuUo3SPDCw=
X-Google-Smtp-Source: APXvYqz+VvW5vydphQSj0ObTAVGfP2jazOrVP9sq7QamakSG2pDZ3tjxjHqAy590l89owgeU1hfKhg==
X-Received: by 2002:a17:902:8686:: with SMTP id
 g6mr16403651plo.175.1567892477461; 
 Sat, 07 Sep 2019 14:41:17 -0700 (PDT)
Received: from localhost.localdomain ([112.79.80.177])
 by smtp.gmail.com with ESMTPSA id h11sm9078516pgv.5.2019.09.07.14.41.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 07 Sep 2019 14:41:15 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 sashal@kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, akpm@linux-foundation.org, david@redhat.com,
 osalvador@suse.com, mhocko@suse.com, pasha.tatashin@soleen.com,
 dan.j.williams@intel.com, richard.weiyang@gmail.com, cai@lca.pw
Date: Sun,  8 Sep 2019 03:17:01 +0530
Message-Id: <cover.1567889743.git.jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [Xen-devel] [PATCH 0/3] Remove __online_page_set_limits()
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
cmEgY2FsbAp0byB0aGlzIGNhbiBiZSBhdm9pZGVkLgoKQXMgYm90aCBvZiB0aGUgY2FsbGVycyBh
cmUgbm93IHJlbW92ZWQsIF9fb25saW5lX3BhZ2Vfc2V0X2xpbWl0cygpCmNhbiBiZSByZW1vdmVk
IHBlcm1hbmVudGx5LgoKU291cHRpY2sgSm9hcmRlciAoMyk6CiAgaHZfYmFsbG9uOiBBdm9pZCBj
YWxsaW5nIGR1bW15IGZ1bmN0aW9uIF9fb25saW5lX3BhZ2Vfc2V0X2xpbWl0cygpCiAgeGVuL2Jh
bGxvbjogQXZvaWQgY2FsbGluZyBkdW1teSBmdW5jdGlvbiBfX29ubGluZV9wYWdlX3NldF9saW1p
dHMoKQogIG1tL21lbW9yeV9ob3RwbHVnLmM6IFJlbW92ZSBfX29ubGluZV9wYWdlX3NldF9saW1p
dHMoKQoKIGRyaXZlcnMvaHYvaHZfYmFsbG9vbi5jICAgICAgICB8IDEgLQogZHJpdmVycy94ZW4v
YmFsbG9vbi5jICAgICAgICAgIHwgMSAtCiBpbmNsdWRlL2xpbnV4L21lbW9yeV9ob3RwbHVnLmgg
fCAxIC0KIG1tL21lbW9yeV9ob3RwbHVnLmMgICAgICAgICAgICB8IDUgLS0tLS0KIDQgZmlsZXMg
Y2hhbmdlZCwgOCBkZWxldGlvbnMoLSkKCi0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

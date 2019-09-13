Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B464BB238D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 17:38:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8ncO-00024E-Ui; Fri, 13 Sep 2019 15:36:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QaHn=XI=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i8ncN-00023s-JM
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 15:36:15 +0000
X-Inumbo-ID: 30870702-d63c-11e9-b76c-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30870702-d63c-11e9-b76c-bc764e2007e4;
 Fri, 13 Sep 2019 15:36:01 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id d10so22473668lfi.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2019 08:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ydkS56Di6tdPo9I10eE/VDkZg8hfHBo7v/faZNVvqiU=;
 b=mYNChmyuKKBf/z3D8xptFiAuRXqW4VkUAaVmcQfO8kA35Erd1ERl4KZNXMCquavRsk
 XzefCPSlw7NGeEZsiKnU8LEPUsNm9YhBzmA/1qivcNjfOWH2e8IFw7LkyXeOauIVMUsk
 NbAHLhiYe3sDr08PZzwwxeUWM5I4QDV+yNEu61oCjauG/8YY1I7mCdwmRwAlmURKGtgZ
 qASOOXvGnKBD/NpV9mVsxBxadWywcM0b5s4IIZc3hVhpRUjBkSXxyTU1pA9VIo6P/ksf
 B4RxzhXUlxAkTyvw7LwyS/dzRI98mLqSfXPuKoIZRKa1YLAXdRLqtqeBdcXiDmm+befv
 YF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ydkS56Di6tdPo9I10eE/VDkZg8hfHBo7v/faZNVvqiU=;
 b=UVipSO7Ru00UKLVYi41QbBfbFPKleitv2EDiUlm20esS21h4tmo856PMv5l7bxTMOM
 MAbOxPm4TqiLa/NJegijXteEPQhpwQDA7bS2aKUx8RbQA6s6MAVgta2CpPUfntf1xM0E
 DzcJvYOlBITrbQXKkRJWk0TZEVkgy826QKF2QThcRHbHWLZJdDD3K0VXtXBaYyZt9jVY
 1RS+pFQtOT78yd05PDRSThKE/8gDOEaiIaKkh/wWUVJl4oVy8KrlCR8iveFy0sv0OxRU
 znZy4XelDspJF9tgL7QFpKOK+MGhXNsVSgvvR5VmFFJ+vgcdbsXLnyV8UNKLHyw8ZDE6
 8+mA==
X-Gm-Message-State: APjAAAW6WK24owYHUkc7peHusGikNs0t46XabPNxSROSnuWRt04PPsrk
 ivAoXLx/i83O2nQLVc30Ji3i0OzxVj8=
X-Google-Smtp-Source: APXvYqyZA3riqxpkxRGHAQtPIcr8cwmyvxOdRGxynxYS7fb3XtocCVE1Dp1Eg9bM3g1cAlbBGoeTFw==
X-Received: by 2002:ac2:50cb:: with SMTP id h11mr9203457lfm.170.1568388960704; 
 Fri, 13 Sep 2019 08:36:00 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id c16sm6969765lfj.8.2019.09.13.08.35.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 13 Sep 2019 08:36:00 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 13 Sep 2019 18:35:12 +0300
Message-Id: <1568388917-7287-4-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
Subject: [Xen-devel] [PATCH V4 3/8] iommu/arm: Order the headers
 alphabetically in iommu.c
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKQ2xlYW4gdXAgdGhlIGNvZGUgYSBiaXQgYnkgcHV0dGluZyB0aGUgaGVhZGVycyBpbiBhbHBo
YWJldGljYWwgb3JkZXIuCgpTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xl
a3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Ci0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
YXJtL2lvbW11LmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9p
b21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11LmMKaW5kZXggNTU1YWNm
Yy4uNWEzZDFkNSAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11
LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11LmMKQEAgLTE1LDkgKzE1
LDEwIEBACiAgKiBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgog
ICovCiAKLSNpbmNsdWRlIDx4ZW4vbGliLmg+Ci0jaW5jbHVkZSA8eGVuL2lvbW11Lmg+CiAjaW5j
bHVkZSA8eGVuL2RldmljZV90cmVlLmg+CisjaW5jbHVkZSA8eGVuL2lvbW11Lmg+CisjaW5jbHVk
ZSA8eGVuL2xpYi5oPgorCiAjaW5jbHVkZSA8YXNtL2RldmljZS5oPgogCiAvKgotLSAKMi43LjQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

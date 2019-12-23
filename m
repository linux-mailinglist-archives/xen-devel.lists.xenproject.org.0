Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA121294CE
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 12:08:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijLUv-0002OI-G1; Mon, 23 Dec 2019 11:03:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z6Dt=2N=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ijLUt-0002OD-OI
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 11:03:35 +0000
X-Inumbo-ID: dcf4322c-2573-11ea-88e7-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dcf4322c-2573-11ea-88e7-bc764e2007e4;
 Mon, 23 Dec 2019 11:03:35 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 20so15658617wmj.4
 for <xen-devel@lists.xenproject.org>; Mon, 23 Dec 2019 03:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MzJWgGv5V2J+E2T0MUN5U5O95y4LBhvZcsi4XyeSV0o=;
 b=kel4jbE/dfG06iYF9/UmgqBZY6UJKI1/k0Nz387XUTNNOQucW/Cngs0ZRI+55wli+F
 CcPU6jnSD9MYfzfltXSOLuVPDgIeF3DoQOZD/JXvqZioX/t9qrCs4pecWmUnjJf+6YwV
 WEXiM385VXG4//lkMLS8jOlGh5XxhX0xc6rkvwZwuA7VcETiQdWFSf5ZXLJ+5P5ZTug9
 CDKdzS1HrSURx2fDmCk5QLn6um2aE+a2mTVr8eqxO3zgKnO1CFAZnvFzkG6r3nOghS27
 KlWHEao4zCUlVEWOpIS83ZZpl7b132pYAo5BaFK2j7cfmlogqvG/9Xe66z38uVgMhWaL
 ZWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=MzJWgGv5V2J+E2T0MUN5U5O95y4LBhvZcsi4XyeSV0o=;
 b=A8vYPwFklKkojI9ATg6+KHzz7yDqOZjqo1zoeRPQpv3bhrAnBBiADkbzF6iBQ63+xJ
 Otcmoa3CEiiaSTMd9akzhCgnK11m6znbaLGdjRw2yx/x3OmdXApDZZjnC+lG5nWUtPfp
 iYIH7Nwl9QmGB2F4Nfgy+pboQwyRfBPUz7TAIsAd938ZTtqgN7PS74Viz5PwkJpZFhMs
 8N6ibEl45MmBBaALTz2Yx6ozN5R2+S6v4O6tRzWpnfQPmXFmhbfGXx9eU7zQyG2xp+pz
 FvC2nkYG47HAUE9zGZRBRhElj9S/Pdgvzvj4OPolN8IcyUNAUieifVXzSI9PeWexPWAD
 S7Cg==
X-Gm-Message-State: APjAAAV401EgVx+uNYPVfrhu/mlyYhXyJtq5M83KPuZNpRCerQ0GXfpc
 UAYD9ykzd10k8LxAlPjqp+hzCzRR
X-Google-Smtp-Source: APXvYqxc59jK5Vu+lqfXJAO1e97R5Bx/mBBwi1iEVZWBPkjMoneGWlgwshYDdEwKE64AtPE78CyjsQ==
X-Received: by 2002:a1c:4008:: with SMTP id n8mr28908790wma.121.1577099014203; 
 Mon, 23 Dec 2019 03:03:34 -0800 (PST)
Received: from debian.mshome.net (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id q11sm20231787wrp.24.2019.12.23.03.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 03:03:33 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 23 Dec 2019 11:03:30 +0000
Message-Id: <20191223110330.26883-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] x86/hyperv: change hv_tlb_flush_ex to fix
 clang build
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2xhbmcgY29tcGxhaW5zOgoKSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHN5bmljLmM6MTU6Ci9idWls
ZHMveGVuLXByb2plY3QveGVuL3hlbi9pbmNsdWRlL2FzbS9ndWVzdC9oeXBlcnYtdGxmcy5oOjkw
MDoxODogZXJyb3I6IGZpZWxkICdodl92cF9zZXQnIHdpdGggdmFyaWFibGUgc2l6ZWQgdHlwZSAn
c3RydWN0IGh2X3Zwc2V0JyBub3QgYXQgdGhlIGVuZCBvZiBhIHN0cnVjdCBvciBjbGFzcyBpcyBh
IEdOVSBleHRlbnNpb24gWy1XZXJyb3IsLVdnbnUtdmFyaWFibGUtc2l6ZWQtdHlwZS1ub3QtYXQt
ZW5kXQogICAgICAgIHN0cnVjdCBodl92cHNldCBodl92cF9zZXQ7CiAgICAgICAgICAgICAgICAg
ICAgICAgIF4KMSBlcnJvciBnZW5lcmF0ZWQuCi9idWlsZHMveGVuLXByb2plY3QveGVuL3hlbi9S
dWxlcy5tazoxOTg6IHJlY2lwZSBmb3IgdGFyZ2V0ICdzeW5pYy5vJyBmYWlsZWQKbWFrZVs2XTog
KioqIFtzeW5pYy5vXSBFcnJvciAxCgpDb21tZW50IG91dCB0aGUgbGFzdCB2YXJpYWJsZSBzaXpl
IGFycmF5IGZyb20gaHZfdGxiX2ZsdXNoX2V4IHRvIGZpeApjbGFuZyBidWlsZHMuCgpTaWduZWQt
b2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgpDYzogUGF1bCBEdXJyYW50IDxw
YXVsQHhlbi5vcmc+Ci0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYtdGxmcy5o
IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaCBi
L3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaAppbmRleCBmZTlmYjIzMmQw
Li41YjQzZjk5ZGU4IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVy
di10bGZzLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYtdGxmcy5oCkBA
IC05MDgsMTIgKzkwOCwxMiBAQCBzdHJ1Y3QgaHZfdGxiX2ZsdXNoIHsKIAl1NjQgZ3ZhX2xpc3Rb
XTsKIH0gX19wYWNrZWQ7CiAKLS8qIEh2Rmx1c2hWaXJ0dWFsQWRkcmVzc1NwYWNlRXgsIEh2Rmx1
c2hWaXJ0dWFsQWRkcmVzc0xpc3RFeCBoeXBlcmNhbGxzICovCisvKiBIdkZsdXNoVmlydHVhbEFk
ZHJlc3NTcGFjZUV4IGh5cGVyY2FsbCAqLwogc3RydWN0IGh2X3RsYl9mbHVzaF9leCB7CiAJdTY0
IGFkZHJlc3Nfc3BhY2U7CiAJdTY0IGZsYWdzOwogCXN0cnVjdCBodl92cHNldCBodl92cF9zZXQ7
Ci0JdTY0IGd2YV9saXN0W107CisJLyogdTY0IGd2YV9saXN0W107ICovCiB9IF9fcGFja2VkOwog
CiBzdHJ1Y3QgaHZfcGFydGl0aW9uX2Fzc2lzdF9wZyB7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

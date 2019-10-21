Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC09BDF241
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 17:59:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMa3h-00088Y-Mj; Mon, 21 Oct 2019 15:57:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/dQQ=YO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iMa3f-00088L-RY
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 15:57:23 +0000
X-Inumbo-ID: 7806aacc-f41b-11e9-beca-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7806aacc-f41b-11e9-beca-bc764e2007e4;
 Mon, 21 Oct 2019 15:57:23 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id i16so13935394wmd.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 08:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5dFi2sc6pkRJiFAdc0gvsBLh0tTb5eWnrhywydp8l68=;
 b=TmjhXTJgquu8WC4Cdw+hAI7eXTAieje7loUzjlBCO/lATCasuhwn5g2T3ZbEfQ+Hr2
 JwjG+ZEBeoy6IELNTQTbT7qn5n4/8rWi9SHLyr8JZMFnbBbGb3QTKYgs5KYUmdw/AtFy
 9JULg46iyT0My3Bfagg9DYfajgq/cTvevbZdFOqZEGNNdTBhqbT4OQ5NBA9z3qLGo4cZ
 gOgZ4hovEROPHKXKOhqG3OwUhzZmlKLnPUdgsKepHnzz/e972nsnv8jBWSeKdDjZJ4ug
 HxM1Oi0VxL4alwwBmLk0J8UEahAU4cWlP0zhcVexN887dgTa0hj+xMPyIS+4d/RuZ9lp
 onJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=5dFi2sc6pkRJiFAdc0gvsBLh0tTb5eWnrhywydp8l68=;
 b=r0DlIdW+CV/wEUyl/MXXwUqt2bg4sY8mg8W9SHYNxMhcl81wW+qpMbNbGY94/izYBH
 PBkbH+MmQ6JOSAZfh8x8uFdju9s8cZ4P+G1dsS0VpozNdKdi4zeG6Z+C88R+tv9c6J6G
 u8Soet8bDdwWsDgW9eE8tSf9+VjAfsAZr7usiMPZb40tm7wnIlGrLpDwM6m3Zs3Wu+hu
 rBwWrsgIFrtBmGhvvXj8NFwPpjOsVLiYO6tSW2Wue+pxHQnZblPSSasczgQinWOJrCiA
 ZRqmaNas1Be4qO/RpDR4ez69H5CSI7yPat8yOaBYC+7fdHtVPGnbIuKNAEcKPnCq0Rtw
 1T5w==
X-Gm-Message-State: APjAAAXuZ7brplxgE74dKWt73aDQPsOV1vS5GNHfIOxPL0yhMm3MTCeA
 wkx4AkKeYnQQYN8uz8IdB5I3gr3lE20=
X-Google-Smtp-Source: APXvYqwz3ne2ZhTabQE+x+QrrgV6DWDhgks072RrjdEA/rTeMh6kviUZQFgjIPRa71XcRQljrASJKg==
X-Received: by 2002:a05:600c:22d7:: with SMTP id
 23mr19441474wmg.31.1571673442171; 
 Mon, 21 Oct 2019 08:57:22 -0700 (PDT)
Received: from debian.mshome.net (54.163.200.146.dyn.plus.net.
 [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id x12sm5667410wru.93.2019.10.21.08.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 08:57:21 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 21 Oct 2019 16:57:09 +0100
Message-Id: <20191021155718.28653-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next v3 0/9] Port Xen to Hyper-V
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsCgpUaGlzIGlzIHZlcnNpb24gMyBvZiB0aGUgcGF0Y2ggc2VyaWVzLgoKVGhpcyBpcyB0
aGUgdmVyeSBmaXJzdCBzdGFnZSBmb3IgcG9ydGluZyBYZW4gdG8gcnVuIG9uIEh5cGVyLVYgd2l0
aCBhbGwgdGhlCmdvb2RpZXMgSHlwZXItViBoYXMgdG8gb2ZmZXIuICBXaXRoIHRoaXMgc2VyaWVz
LCBYZW4gY2FuIHN1Y2Nlc3NmdWxseSBkZXRlY3QKSHlwZXItViBhbmQgcHJpbnRzIG91dCBhIG1l
c3NhZ2UuICBJIHdvdWxkIGxpa2UgdG8gZmlyc3QgZ2V0IHRoZSBjb2RlIHN0cnVjdHVyZQphbmQg
a2NvbmZpZyBvcHRpb25zIGFncmVlZCB1cG9uLgoKVGhlcmUgYXJlIHR3byBtYWpvciBhcmVhcyB0
byBiZSB3b3JrZWQgb246CiAgKiBNYWtlIERvbTAgYWJsZSB0byB1c2UgSHlwZXItVidzIHN5bnRo
ZXRpYyBkZXZpY2VzLgogICogTWFrZSBYZW4gdXNlIG9mIHRoZSBzeW50aGV0aWMgdGltZXIsIHJl
ZmVyZW5jZSBUU0MgYW5kIGVubGlnaHRlbm1lbnQgVk1DUwogICAgYW5kIG90aGVyIGludGVyZmFj
ZXMuCgpUaGV5IGFyZW4ndCB0cml2aWFsLCBhbmQgdGltZSBjYW4gYmUgc2NhcmNlIG9uIG15IHNp
ZGUsIHNvIEkgaW50ZW5kIHRvIHBvc3QKcGF0Y2hlcyBwaWVjZW1lYWwgd2hlbiB0aGV5IGFyZSBy
ZWFkeS4KClF1ZXN0aW9ucyBhbmQgY29tbWVudHMgYXJlIHdlbGNvbWUuCgpUaGFua3MsCldlaS4K
Ci0tLQpDaGFuZ2VzIGluIHYzOiBTZWUgaW52aWRpZHVhbCBwYXRjaGVzCgpDaGFuZ2VzIGluIHYy
OgoxLiBJbnRyb2R1Y2UgYW5kIHVzZSBhIGh5cGVydmlzb3IgZnJhbWV3b3JrCjIuIEtlZXAgbWVt
bWFwIGluZnJhIHVuZGVyIFhlbiBmb3Igbm93CgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6
IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNjOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KCldlaSBMaXUgKDkpOgogIHg4NjogaW50cm9kdWNlIENPTkZJR19HVUVTVCBhbmQg
bW92ZSBjb2RlCiAgeDg2OiBpbmNsdWRlIGFzbV9kZWZucy5oIGRpcmVjdGx5IGluIGh5cGVyY2Fs
bC5oCiAgeDg2OiBkcm9wIGh5cGVydmlzb3JfY3B1aWRfYmFzZQogIHg4NjogaW5jbHVkZSB4ZW4v
bGliLmggaW4gZ3Vlc3QvaHlwZXJjYWxsLmgKICB4ODY6IGludHJvZHVjZSBoeXBlcnZpc29yIGZy
YW1ld29yawogIHg4NjogcmVuYW1lIGh5cGVydmlzb3Jfe2FsbG9jLGZyZWV9X3VudXNlZF9wYWdl
CiAgeDg2OiBzd2l0Y2ggeGVuIGltcGxlbWVudGF0aW9uIHRvIHVzZSBoeXBlcnZpc29yIGZyYW1l
d29yawogIHg4NjogYmUgbW9yZSB2ZXJib3NlIHdoZW4gcnVubmluZyBvbiBhIGh5cGVydmlzb3IK
ICB4ODY6IGludHJvZHVjZSBDT05GSUdfSFlQRVJWIGFuZCBkZXRlY3Rpb24gY29kZQoKIHhlbi9h
cmNoL3g4Ni9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEzICsrKwogeGVuL2Fy
Y2gveDg2L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNo
L3g4Ni9ndWVzdC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICB8ICA2ICstCiB4ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2L01ha2VmaWxlICAgICAgICAgICAgfCAgMSArCiB4ZW4vYXJjaC94ODYv
Z3Vlc3QvaHlwZXJ2L2h5cGVydi5jICAgICAgICAgICAgfCA1NCArKysrKysrKysrKwogeGVuL2Fy
Y2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYyAgICAgICAgICAgICAgIHwgODkgKysrKysrKysrKysr
KysrKysrKwogeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi9NYWtlZmlsZSAgICAgICAgICAgICAgIHwg
IDQgKwogeGVuL2FyY2gveDg2L2d1ZXN0L3sgPT4geGVufS9oeXBlcmNhbGxfcGFnZS5TIHwgIDAK
IHhlbi9hcmNoL3g4Ni9ndWVzdC97ID0+IHhlbn0vcHZoLWJvb3QuYyAgICAgICB8ICAyICstCiB4
ZW4vYXJjaC94ODYvZ3Vlc3QveyA9PiB4ZW59L3hlbi5jICAgICAgICAgICAgfCAzOSArKysrLS0t
LQogeGVuL2FyY2gveDg2L3B2L3NoaW0uYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKy0K
IHhlbi9hcmNoL3g4Ni9zZXR1cC5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICstCiB4
ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0LmggICAgICAgICAgICAgICAgICAgfCAgMiArCiB4ZW4v
aW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVyY2FsbC5oICAgICAgICAgfCAgNCArCiB4ZW4vaW5j
bHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oICAgICAgICAgICAgfCA0NSArKysrKysrKysrCiB4
ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaCAgICAgICAgfCA2NCArKysrKysr
KysrKysrCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oICAgICAgICAgICAgICAgfCAy
NCArKy0tLQogMTcgZmlsZXMgY2hhbmdlZCwgMzE0IGluc2VydGlvbnMoKyksIDQ3IGRlbGV0aW9u
cygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZp
bGUKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5j
CiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYwogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4vTWFrZWZpbGUKIHJlbmFtZSB4
ZW4vYXJjaC94ODYvZ3Vlc3QveyA9PiB4ZW59L2h5cGVyY2FsbF9wYWdlLlMgKDEwMCUpCiByZW5h
bWUgeGVuL2FyY2gveDg2L2d1ZXN0L3sgPT4geGVufS9wdmgtYm9vdC5jICg5OSUpCiByZW5hbWUg
eGVuL2FyY2gveDg2L2d1ZXN0L3sgPT4geGVufS94ZW4uYyAoOTMlKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmgKIGNyZWF0ZSBtb2RlIDEwMDY0
NCB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaAoKLS0gCjIuMjAuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

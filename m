Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA9E14D1D7
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 21:23:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwtpm-0006dR-Hi; Wed, 29 Jan 2020 20:21:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bu37=3S=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iwtpk-0006cr-WB
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 20:21:09 +0000
X-Inumbo-ID: d3bb65da-42d4-11ea-b211-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3bb65da-42d4-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 20:20:44 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z7so979970wrl.13
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 12:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ITFZiTyiTf8vIPKBbhv8PPdQmh+pCqfsfzWwanxg5Zc=;
 b=gvI2Of03ObHu/iEQibeI0lBSv6UU9zrXLeW71/w+iXSh//RCMfYN0c9QHkD3g3qM09
 GzDbe11VNWTNav219i5NI+FsXnS225uIgk91Oyg5BA+Cvm64hK6fwte+EZKdIDJbRQtG
 3lkrThmf0ISCfo+YhvDuHNI13nr6Ae0OU0UbHy6VMnT6LzmVfL4xLt8NuJcr0Je2LhkC
 R6t/Y49lIM3rMgM+bLVJusxjz0+iDdTSZMX/+rYyNFDzm3D2lxravWz1cchDga7l+vuV
 fnbWmjAIHU1VR9ASHtVrH3A4kdNfD+sZWHnctTWpwEBkYuomXRgrn/pAJ1p9Ud0Z+vxt
 oNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ITFZiTyiTf8vIPKBbhv8PPdQmh+pCqfsfzWwanxg5Zc=;
 b=hLIPJYe5OEXUeQgEGCCnB+KlodbiRpt4V33LXTkoyhgHqSUUEyYGqAQn1530Zt9Gqs
 zuXBZIVWCzYx/vpICfGET8Kbn8hYNL8XwydVfEVgqVuhi9xXKeUnt29+y71DB8oucI+3
 4FS6PmEk2lEtO9aHb4h1j+7XZgVIyKvXEbTM+8HuYVcBTQBeG6RecHsAxB1aCXo3uP89
 M3zbZBJqJAIalP1Ino2STUX+imNXjsDutRbBlI20Z8BzMMGZtD+KHJbgcr6efy+WXC5B
 ew/+9uiFujqQxK1nQ4W+AuMI49oirkvUXf9SJrLRVW/O7RWdeMxTeOBo2yAnwwKtOQF5
 uMfg==
X-Gm-Message-State: APjAAAUeLR5fEzwQjkPwbwtZ34zBMsbO0sku2p5/PLwxWvClSrIugZu0
 kaJbcvgMiXDqZH/hfSidGnsroAvLlT8=
X-Google-Smtp-Source: APXvYqwU7K3c6tO3fT6jxXBkrE8TA2G8+vyjQ942jcAaTi+RClCSCHwZuD6A6JnLtf0tnHqannAHmA==
X-Received: by 2002:adf:f3d0:: with SMTP id g16mr663979wrp.2.1580329243528;
 Wed, 29 Jan 2020 12:20:43 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 a22sm3564115wmd.20.2020.01.29.12.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 12:20:43 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 20:20:28 +0000
Message-Id: <20200129202034.15052-7-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129202034.15052-1-liuwe@microsoft.com>
References: <20200129202034.15052-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 06/12] x86/hypervisor: provide
 hypervisor_reserve_top_pages
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBmdW5jdGlvbiB3aWxsIHJldHVybiB0aGUgbnVtYmVyIG9mIHBhZ2VzIHRoYXQgbmVlZCB0
byBiZSByZXNlcnZlZAppbiB0aGUgbWFjaGluZSBhZGRyZXNzIHNwYWNlLgoKRTgyMCBjb2RlIHdp
bGwgdXNlIHRoYXQgbnVtYmVyIHRvIGFkanVzdCB0aGUgbWF4aW11bSBQRk4gYXZhaWxhYmxlIHRv
Clhlbi4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Ci0tLQog
eGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYyAgICAgICAgfCA4ICsrKysrKysrCiB4ZW4v
aW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaCB8IDQgKysrKwogMiBmaWxlcyBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5
cGVydmlzb3IuYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMKaW5kZXggZTcyYzky
ZmZkZi4uOGI5Y2YxY2U0YyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlz
b3IuYworKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCkBAIC02Niw2ICs2Niwx
NCBAQCB2b2lkIGh5cGVydmlzb3JfcmVzdW1lKHZvaWQpCiAgICAgICAgIG9wcy0+cmVzdW1lKCk7
CiB9CiAKK3Vuc2lnbmVkIGludCBoeXBlcnZpc29yX3Jlc2VydmVfdG9wX3BhZ2VzKHZvaWQpCit7
CisgICAgaWYgKCBvcHMgJiYgb3BzLT5yZXNlcnZlX3RvcF9wYWdlcyApCisgICAgICAgIHJldHVy
biBvcHMtPnJlc2VydmVfdG9wX3BhZ2VzKCk7CisKKyAgICByZXR1cm4gMDsKK30KKwogLyoKICAq
IExvY2FsIHZhcmlhYmxlczoKICAqIG1vZGU6IEMKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2Fz
bS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBl
cnZpc29yLmgKaW5kZXggYjUwMzg1NGM1Yi4uMzdlYjlkNTMxZSAxMDA2NDQKLS0tIGEveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnZpc29yLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4
Ni9ndWVzdC9oeXBlcnZpc29yLmgKQEAgLTI4LDYgKzI4LDggQEAgc3RydWN0IGh5cGVydmlzb3Jf
b3BzIHsKICAgICBpbnQgKCphcF9zZXR1cCkodm9pZCk7CiAgICAgLyogUmVzdW1lIGZyb20gc3Vz
cGVuc2lvbiAqLwogICAgIHZvaWQgKCpyZXN1bWUpKHZvaWQpOworICAgIC8qIEhvdyBtYW55IHRv
cCBwYWdlcyB0byBiZSByZXNlcnZlZCBpbiBtYWNoaW5lIGFkZHJlc3Mgc3BhY2U/ICovCisgICAg
dW5zaWduZWQgaW50ICgqcmVzZXJ2ZV90b3BfcGFnZXMpKHZvaWQpOwogfTsKIAogI2lmZGVmIENP
TkZJR19HVUVTVApAQCAtMzYsNiArMzgsNyBAQCBjb25zdCBjaGFyICpoeXBlcnZpc29yX3Byb2Jl
KHZvaWQpOwogdm9pZCBoeXBlcnZpc29yX3NldHVwKHZvaWQpOwogaW50IGh5cGVydmlzb3JfYXBf
c2V0dXAodm9pZCk7CiB2b2lkIGh5cGVydmlzb3JfcmVzdW1lKHZvaWQpOwordW5zaWduZWQgaW50
IGh5cGVydmlzb3JfcmVzZXJ2ZV90b3BfcGFnZXModm9pZCk7CiAKICNlbHNlCiAKQEAgLTQ2LDYg
KzQ5LDcgQEAgc3RhdGljIGlubGluZSBjb25zdCBjaGFyICpoeXBlcnZpc29yX3Byb2JlKHZvaWQp
IHsgcmV0dXJuIE5VTEw7IH0KIHN0YXRpYyBpbmxpbmUgdm9pZCBoeXBlcnZpc29yX3NldHVwKHZv
aWQpIHsgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7IH0KIHN0YXRpYyBpbmxpbmUgaW50IGh5cGVydmlz
b3JfYXBfc2V0dXAodm9pZCkgeyBBU1NFUlRfVU5SRUFDSEFCTEUoKTsgcmV0dXJuIDA7IH0KIHN0
YXRpYyBpbmxpbmUgdm9pZCBoeXBlcnZpc29yX3Jlc3VtZSh2b2lkKSB7IEFTU0VSVF9VTlJFQUNI
QUJMRSgpOyB9CitzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBoeXBlcnZpc29yX3Jlc2VydmVf
dG9wX3BhZ2VzKHZvaWQpIHsgcmV0dXJuIDA7IH0KIAogI2VuZGlmICAvKiBDT05GSUdfR1VFU1Qg
Ki8KIAotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==

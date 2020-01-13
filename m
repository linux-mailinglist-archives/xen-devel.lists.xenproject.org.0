Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE140139BB3
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 22:35:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir7LK-0006ZH-KZ; Mon, 13 Jan 2020 21:33:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Ofl=3C=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ir7LJ-0006ZC-8F
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 21:33:49 +0000
X-Inumbo-ID: 61f90389-364c-11ea-82e6-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61f90389-364c-11ea-82e6-12813bfff9fa;
 Mon, 13 Jan 2020 21:33:48 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 20so11394538wmj.4
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2020 13:33:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ssk9nUjYLi/HI54y9EsHj7XeX4GByNczK0zfHrRrpc0=;
 b=lVyIT3UGPxdNrGeYuVsAMmM/4jvIV/Rx+b7jnLv0tHBh1ViQY7jbfFY0MZh5bHS9YH
 aNSAiPZULy6zNfsNFXy8/YH77HPUXsqM7vwa0NWYK+BSz3Sr2O92c+ccU4ltoZpCPacK
 zETiA3AsUVGJKMLUWvv54TH7+AnOButu7g0pPqHXKOmAVBdWSHVVt8PIohwFAQkM2Dmm
 kUe+2B2HqQ9qqDKy0EoGXZCusQF3VyV1vJIddM90Yh6IcdPKe4XgHUxCJNNijJ6zBgaI
 HNN6ujcJfJSPjEmr4tV2pFbdl7G5f/rUwCZZC17DUH2Jq4nkUG5/R1hLyUY+/0mjuKGW
 d6xA==
X-Gm-Message-State: APjAAAUMuCXu3L1rvcRiT6Sau4qvomET3Uk2DSlISkFoewHZbmflZ42+
 N9wW2BN2WLZPx7fDCPrZHjZT8mVN/vrLyQ==
X-Google-Smtp-Source: APXvYqy2Ai4R+on4JU71bSlTHmq27xavJON+sYv9mL5Vgj9bqhJ9heLwFXKY/bEuJ0kC5AmJi4yGUw==
X-Received: by 2002:a7b:cb97:: with SMTP id m23mr22152137wmi.37.1578951227711; 
 Mon, 13 Jan 2020 13:33:47 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id i10sm16938652wru.16.2020.01.13.13.33.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jan 2020 13:33:47 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 13 Jan 2020 21:33:40 +0000
Message-Id: <20200113213342.8206-3-julien@xen.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200113213342.8206-1-julien@xen.org>
References: <20200113213342.8206-1-julien@xen.org>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/4] xen/char: ehci: Directly include
 xen/timer.h rather rely on dependency
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KClRoZSBlaGNpIGNoYXIgZHJp
dmVyIGlzIHVzaW5nIHRpbWVycyBidXQgcmVseWluZyBvbiB0aGUgaGVhZGVyCnhlbi90aW1lci5o
IHRvIGJlIGluY2x1ZGVkIHZpYSBhc20teDg2L2h2bS9pcnEuaCB3aGljaCBpcyBub3QgZXZlbgpk
aXJlY3RseSBpbmNsdWRlZCEKCkZ1dHVyZSByZXdvcmsgd2lsbCByZWR1Y2UgdGhlIG51bWJlciBv
ZiBwbGFjZXMgd2hlcmUgYXNtLXg4Ni9odm0vaXJxLmgKd2lsbCBiZSBpbmNsdWRlZC4gSW5jbHVk
ZSB4ZW4vdGltZXIuaCBkaXJlY3RseSB0byBhdm9pZCBhbnkgYnJlYWthZ2UuCgpTaWduZWQtb2Zm
LWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgotLS0KIHhlbi9kcml2ZXJzL2No
YXIvZWhjaS1kYmdwLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlm
ZiAtLWdpdCBhL3hlbi9kcml2ZXJzL2NoYXIvZWhjaS1kYmdwLmMgYi94ZW4vZHJpdmVycy9jaGFy
L2VoY2ktZGJncC5jCmluZGV4IGI2ZTE1NWQxN2IuLjgxMjRlMGFhZDggMTAwNjQ0Ci0tLSBhL3hl
bi9kcml2ZXJzL2NoYXIvZWhjaS1kYmdwLmMKKysrIGIveGVuL2RyaXZlcnMvY2hhci9laGNpLWRi
Z3AuYwpAQCAtMTAsNiArMTAsNyBAQAogI2luY2x1ZGUgPHhlbi9lcnJuby5oPgogI2luY2x1ZGUg
PHhlbi9wY2kuaD4KICNpbmNsdWRlIDx4ZW4vc2VyaWFsLmg+CisjaW5jbHVkZSA8eGVuL3RpbWVy
Lmg+CiAjaW5jbHVkZSA8YXNtL2J5dGVvcmRlci5oPgogI2luY2x1ZGUgPGFzbS9pby5oPgogI2lu
Y2x1ZGUgPGFzbS9maXhtYXAuaD4KLS0gCjIuMjQuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEE6144B1D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 06:17:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu8L5-00055r-UL; Wed, 22 Jan 2020 05:14:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gwqu=3L=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1iu5Jf-00064p-52
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 02:00:23 +0000
X-Inumbo-ID: f2ef6142-3cba-11ea-9fd7-bc764e2007e4
Received: from mail-yb1-xb41.google.com (unknown [2607:f8b0:4864:20::b41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2ef6142-3cba-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 02:00:22 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id k15so2386678ybd.10
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 18:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pUbXA2fz5IUq4mwJyZXN2JtaEfV2Uw8PW0yKGevrbNs=;
 b=Bpq5biGUZbsqxq5vaEAmriO4GGfrlGNV/R1joqKXHCRI/xHsKiVsnY7eynD0lPt8t1
 bHI6wbN+P25e0evCQkCTko62g1SlFIs5yVQWY0Le8my+R3avgo7Vm8B+Hq4Usat+gpR1
 e3JhZqLnScxisIYv4Qg0AzyQaETdB7SsWStUMoe7x947yf5xcGoqiLhFJqluGWeEmODB
 /oYdFPeOQgRkeCFn3XzzbgklEdh4z3SeeBYLOKSwPoLK1Z/4Gx7hsTuFddJKsha5t1LB
 y2MvXNnzs+s6vpLaS4LnWi6mwFhNI9Btsq5RqkHZ+hcc7ydWSkDA4xWB3+6B0KwrZDM9
 oeKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pUbXA2fz5IUq4mwJyZXN2JtaEfV2Uw8PW0yKGevrbNs=;
 b=R0cYKbtOs7fByLHrPxRKvaIXt3GxkiSaWXpSZ9nMQDzqWJn4qXygJGhLvmlAErAXYV
 bTvM0JNlhuSO1D/bxL6Dbd3LZ1fHqxjX82eQWFdpvrVqb+sfg4ldSl9kOsrXkiBsnn6s
 Jxc5URj8goF1fmeObn62G3UP7iZ9BCm7geXd2oxh26uSn8t0lIyV3lcbun7t76mJsKx8
 YFSLfWXJPeWtzm+jZuUxUH8eKC75S5/W9t3+MRJXFz+n061wEGU5WNGE4Hw1c6riFlBe
 4LuECrQwyolEvH/dcyLz1kSHY5A3FWMXlZqprgN1nLy4DKcJj14AR0Pd/N1j5DeDaRXF
 6Xwg==
X-Gm-Message-State: APjAAAWXUDmicitI42kGaCOIKi+evK6d3LHT56/jkJKQRoi0iJgC8Kja
 K/u+cqlV0bwcNpwJQV+To0pvJCTXWrwzqw==
X-Google-Smtp-Source: APXvYqwPNwC7LN4zhthFvyuDJmvSabkNZgqWlF+/KxhKjyLmkfAfLC6agvBUjuD0jrqeLPKawRayTA==
X-Received: by 2002:a25:a282:: with SMTP id c2mr5589743ybi.116.1579658422025; 
 Tue, 21 Jan 2020 18:00:22 -0800 (PST)
Received: from bobbye-pc.knology.net ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id q185sm17504248ywh.61.2020.01.21.18.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 18:00:21 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 19:58:41 -0600
Message-Id: <2dbc40f33de7a108297161516f0b9e18986a348d.1579615303.git.bobbyeshleman@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579615303.git.bobbyeshleman@gmail.com>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Jan 2020 05:14:01 +0000
Subject: [Xen-devel] [RFC XEN PATCH 02/23] HACK: Makefile: Don't build Xen
 tools
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
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgoKU2lnbmVk
LW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgotLS0K
IE1ha2VmaWxlIHwgMTMgKy0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCmlu
ZGV4IDUxMmQ2YjczYzguLjc5MzZmM2EzNjggMTAwNjQ0Ci0tLSBhL01ha2VmaWxlCisrKyBiL01h
a2VmaWxlCkBAIC03LDcgKzcsNyBAQAogYWxsOiBkaXN0CiAKIC1pbmNsdWRlIGNvbmZpZy9Ub3Bs
ZXZlbC5tawotU1VCU1lTVEVNUz89eGVuIHRvb2xzIHN0dWJkb20gZG9jcworU1VCU1lTVEVNUz14
ZW4gc3R1YmRvbSBkb2NzCiBUQVJHU19ESVNUPSQocGF0c3Vic3QgJSwgZGlzdC0lLCAkKFNVQlNZ
U1RFTVMpKQogVEFSR1NfSU5TVEFMTD0kKHBhdHN1YnN0ICUsIGluc3RhbGwtJSwgJChTVUJTWVNU
RU1TKSkKIFRBUkdTX1VOSU5TVEFMTD0kKHBhdHN1YnN0ICUsIHVuaW5zdGFsbC0lLCAkKFNVQlNZ
U1RFTVMpKQpAQCAtMjAsMTIgKzIwLDYgQEAgaW5jbHVkZSBDb25maWcubWsKIAogLlBIT05ZOiBt
aW5pLW9zLWRpcgogbWluaS1vcy1kaXI6Ci0JaWYgWyAhIC1kICQoWEVOX1JPT1QpL2V4dHJhcy9t
aW5pLW9zIF07IHRoZW4gXAotCQlHSVQ9JChHSVQpICQoWEVOX1JPT1QpL3NjcmlwdHMvZ2l0LWNo
ZWNrb3V0LnNoIFwKLQkJCSQoTUlOSU9TX1VQU1RSRUFNX1VSTCkgXAotCQkJJChNSU5JT1NfVVBT
VFJFQU1fUkVWSVNJT04pIFwKLQkJCSQoWEVOX1JPT1QpL2V4dHJhcy9taW5pLW9zIDsgXAotCWZp
CiAKIC5QSE9OWTogbWluaS1vcy1kaXItZm9yY2UtdXBkYXRlCiBtaW5pLW9zLWRpci1mb3JjZS11
cGRhdGU6IG1pbmktb3MtZGlyCkBAIC0xMzEsMTQgKzEyNSw5IEBAIGluc3RhbGwteGVuOgogCiAu
UEhPTlk6IGluc3RhbGwtdG9vbHMKIGluc3RhbGwtdG9vbHM6IGluc3RhbGwtdG9vbHMtcHVibGlj
LWhlYWRlcnMKLQkkKE1BS0UpIC1DIHRvb2xzIGluc3RhbGwKIAogLlBIT05ZOiBpbnN0YWxsLXN0
dWJkb20KIGluc3RhbGwtc3R1YmRvbTogbWluaS1vcy1kaXIgaW5zdGFsbC10b29scwotCSQoTUFL
RSkgLUMgc3R1YmRvbSBpbnN0YWxsCi1pZmVxICh4ODZfNjQsJChYRU5fVEFSR0VUX0FSQ0gpKQot
CVhFTl9UQVJHRVRfQVJDSD14ODZfMzIgJChNQUtFKSAtQyBzdHViZG9tIGluc3RhbGwtZ3J1Ygot
ZW5kaWYKIAogLlBIT05ZOiB0b29scy9maXJtd2FyZS9zZWFiaW9zLWRpci1mb3JjZS11cGRhdGUK
IHRvb2xzL2Zpcm13YXJlL3NlYWJpb3MtZGlyLWZvcmNlLXVwZGF0ZToKLS0gCjIuMjUuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

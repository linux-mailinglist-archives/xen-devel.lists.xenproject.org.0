Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD5F150E42
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 18:00:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyf3A-0003cH-Sz; Mon, 03 Feb 2020 16:58:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HIUd=3X=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iyf39-0003cB-Nk
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 16:58:15 +0000
X-Inumbo-ID: 5e36606e-46a6-11ea-b211-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e36606e-46a6-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 16:58:15 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id a6so19140224wrx.12
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2020 08:58:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3fm/cut/IlgoCdgjxasn9rl1QQLaFFRxl5RJxUhmQH0=;
 b=KdMztw+YwwmBi8V9mjV3nnawXfskvcv1py/4WpxzqOIytRcH9t4iIvTyYa2r92tuv3
 W6QDruVLAgXGxJx+r2R/tVn69H/ZS4uHTSp2Eg5gXtOTmQhl0KVvL16aMLaE9vSZ3sU/
 dsFl8hTGzyYAP2XHLOVul6L2KMXZM9o6zryXKfsbacpWPCo98JN8SSvYh81fqBp0Oz7s
 hYdZF+3kNH+3MtPBFz1zzTw3lR4omhwPEg38mE6pr+2YA2dl+4JajRwZytYJyk0ZgpNa
 IT86nrOW4itzuQKQEs5xD/nBVkAuQSzFy2WL2He8Ocaq46/emFKkjMsKdDzsTBo9Dki6
 zPfw==
X-Gm-Message-State: APjAAAWEiNPPALJQoVZ9g00FANpQXAXuQqmkPpspBAFt2PslfqEdFsET
 AQm3a3b4LypIRm17GoGPIpb8XCOoH3U=
X-Google-Smtp-Source: APXvYqy6r+KH7Bpl9oQJinaHi5EpUQO9rTJro6LVSMOwS9DlKyRQfQ6J+2AWfT8O+DJh7BfA7JoRKA==
X-Received: by 2002:a05:6000:8c:: with SMTP id
 m12mr17009478wrx.142.1580749094235; 
 Mon, 03 Feb 2020 08:58:14 -0800 (PST)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id o2sm23563758wmh.46.2020.02.03.08.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 08:58:13 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon,  3 Feb 2020 16:58:12 +0000
Message-Id: <20200203165812.21089-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] xen/x86: p2m: Don't initialize slot 0 of the P2M
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KCkl0IGlzIG5vdCBlbnRpcmVs
eSBjbGVhciB3aHkgdGhlIHNsb3QgMCBvZiBlYWNoIHAybSBzaG91bGQgYmUgcG9wdWxhdGVkCndp
dGggZW1wdHkgcGFnZS10YWJsZXMuIFRoZSBjb21taXQgaW50cm9kdWNpbmcgaXQgNzU5YWY4ZTM4
MDAgIltIVk1dCkZpeCA2NC1iaXQgSFZNIGRvbWFpbiBjcmVhdGlvbi4iIGRvZXMgbm90IGNvbnRh
aW4gbWVhbmluZ2Z1bApleHBsYW5hdGlvbiBleGNlcHQgdGhhdCBpdCB3YXMgbmVjZXNzYXJ5IGZv
ciBzaGFkb3cuCgpBcyB3ZSBkb24ndCBzZWVtIHRvIGhhdmUgYSBnb29kIGV4cGxhbmF0aW9uIHdo
eSB0aGlzIGlzIHRoZXJlLCBkcm9wIHRoZQpjb2RlIGNvbXBsZXRlbHkuCgpUaGlzIHdhcyB0ZXN0
ZWQgYnkgc3VjY2Vzc2Z1bGx5IGJvb3RpbmcgYSBIVk0gd2l0aCBzaGFkb3cgZW5hYmxlZC4KClNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+CgotLS0KCkkgZG9u
J3Qga25vdyBmb3Igc3VyZSBpZiB0aGlzIGlzIGdvaW5nIHRvIGJyZWFrIGEgc2V0dXAuIEkgaGF2
ZSB0cmllZApIVk0gZ3Vlc3Qgd2l0aCBoYXA9ezAsIDF9IHdpdGhvdXQgYW55IHRyb3VibGUuIEkg
YW0gaGFwcHkgdG8gdHJ5IG1vcmUKc2V0dXAgaWYgeW91IGhhdmUgYW55IGluIG1pbmQuCgpJZiB0
aGlzIGJyZWFrIGEgc2V0dXAsIHRoZW4gcGxlYXNlIGRlc2NyaWJlIHRoZSBzZXR1cCBhbmQgSSB3
aWxsIHNlbmQgYQpkb2N1bWVudGF0aW9uIHBhdGNoIGluc3RlYWQuCi0tLQogeGVuL2FyY2gveDg2
L21tL3AybS5jIHwgMTQgKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3AybS5j
IGIveGVuL2FyY2gveDg2L21tL3AybS5jCmluZGV4IDQ5Y2MxMzgzNjIuLjk2MWJlZDA2MzUgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYworKysgYi94ZW4vYXJjaC94ODYvbW0vcDJt
LmMKQEAgLTY4OCw3ICs2ODgsNiBAQCBpbnQgcDJtX2FsbG9jX3RhYmxlKHN0cnVjdCBwMm1fZG9t
YWluICpwMm0pCiB7CiAgICAgbWZuX3QgdG9wX21mbjsKICAgICBzdHJ1Y3QgZG9tYWluICpkID0g
cDJtLT5kb21haW47Ci0gICAgaW50IHJjID0gMDsKIAogICAgIHAybV9sb2NrKHAybSk7CiAKQEAg
LTcyMSwxOSArNzIwLDggQEAgaW50IHAybV9hbGxvY190YWJsZShzdHJ1Y3QgcDJtX2RvbWFpbiAq
cDJtKQogICAgIGlmICggaGFwX2VuYWJsZWQoZCkgKQogICAgICAgICBpb21tdV9zaGFyZV9wMm1f
dGFibGUoZCk7CiAKLSAgICBQMk1fUFJJTlRLKCJwb3B1bGF0aW5nIHAybSB0YWJsZVxuIik7Ci0K
LSAgICAvKiBJbml0aWFsaXNlIHBoeXNtYXAgdGFibGVzIGZvciBzbG90IHplcm8uIE90aGVyIGNv
ZGUgYXNzdW1lcyB0aGlzLiAqLwotICAgIHAybS0+ZGVmZXJfbmVzdGVkX2ZsdXNoID0gMTsKLSAg
ICByYyA9IHAybV9zZXRfZW50cnkocDJtLCBfZ2ZuKDApLCBJTlZBTElEX01GTiwgUEFHRV9PUkRF
Ul80SywKLSAgICAgICAgICAgICAgICAgICAgICAgcDJtX2ludmFsaWQsIHAybS0+ZGVmYXVsdF9h
Y2Nlc3MpOwotICAgIHAybS0+ZGVmZXJfbmVzdGVkX2ZsdXNoID0gMDsKICAgICBwMm1fdW5sb2Nr
KHAybSk7Ci0gICAgaWYgKCAhcmMgKQotICAgICAgICBQMk1fUFJJTlRLKCJwMm0gdGFibGUgaW5p
dGlhbGlzZWQgZm9yIHNsb3QgemVyb1xuIik7Ci0gICAgZWxzZQotICAgICAgICBQMk1fUFJJTlRL
KCJmYWlsZWQgdG8gaW5pdGlhbGlzZSBwMm0gdGFibGUgZm9yIHNsb3QgemVybyAoJWQpXG4iLCBy
Yyk7Ci0gICAgcmV0dXJuIHJjOworICAgIHJldHVybiAwOwogfQogCiAvKgotLSAKMi4xNy4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

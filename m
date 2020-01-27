Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B70B614A101
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 10:42:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw0qh-00089f-VN; Mon, 27 Jan 2020 09:38:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X640=3Q=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iw0qf-00089a-U6
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 09:38:25 +0000
X-Inumbo-ID: becae878-40e8-11ea-9fd7-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id becae878-40e8-11ea-9fd7-bc764e2007e4;
 Mon, 27 Jan 2020 09:38:17 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a9so1303321wmj.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2020 01:38:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7yDYDUuBnKkaTfZ4nQFYkDd4vx/FuI+FIuhi5mEE3iM=;
 b=NPF9Z5hRmm6gWMuAAb4yzb0Tm6/fwsl1fR7WhljM/toLg0GWpTzRwIhwUgRgAYm9D+
 0hiIOzD6/cnpIT1YuRn4X8CsfGvpqgq5LqrjL0DPGrVsSkaVbrB9nZqN3z0wIiCJUXWk
 DYgiS2VLDx/aRcGzYt4GMaNBlJ9NmVrIGz9qWSUCJOdVJsX9RbUQu3kR44zRkn459bO3
 LzvDMPc6HMWQrOe+pEOmAfQo+DhkA9jb3Ssi9/G3vY94NexdXt/pOaPwG6cvHyJbAC6c
 g9kMsFCfk6YfgsZKjAX2KK2MchExqicbRk9hr3GmA3UC08dprAGa0IVoJrcQYCHX28vm
 c9aw==
X-Gm-Message-State: APjAAAWJWg8CpXlcjQfqTwkhnBNg2F2RGA2ml9iLT0rMdwlMZ6SlaLJd
 OOJHIkLCE2/XMzwuiaKrioyt7OGrhFs=
X-Google-Smtp-Source: APXvYqwDx+bf4y/0kiWFSH257Q8SRe0amczRu1cYZfqZ/PvhnO84CkFSfPfTVXqyBDcIylDZ8KuhTQ==
X-Received: by 2002:a05:600c:d5:: with SMTP id
 u21mr12768315wmm.98.1580117896058; 
 Mon, 27 Jan 2020 01:38:16 -0800 (PST)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id a1sm19787707wrr.80.2020.01.27.01.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 01:38:15 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 27 Jan 2020 09:38:08 +0000
Message-Id: <20200127093808.31373-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] xen/x86: domain: Remove specific case when
 allocating struct domain
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KCkNvbW1pdCA4OTE2ZmNmNDU3
NyAieDg2L2RvbWFpbjogY29tcGlsZSB3aXRoIGxvY2tfcHJvZmlsZT15IGVuYWJsZWQiCmFsbG93
ZWQgdGhlIHN0cnVjdCBkb21haW4gdG8gdXNlIG1vcmUgdGhhbiBhIFBBR0VfU0laRSAoaS5lIDQw
OTYpLgpIb3dldmVyLCB0aGUgZnVuY3Rpb24gZnJlZV9kb21oZWFwX3N0cnVjdCgpIHdpbGwgb25s
eSBmcmVlIHRoZSBmaXJzdApwYWdlLgoKV2UgY291bGQgbW9kaWZ5IHRoZSBmcmVlIHBhcnQgdG8g
ZnJlZSB0aGUgY29ycmVjdCBudW1iZXIgb2YgcGFnZXMsIGJ1dAp0aGUgc3RydWN0dXJlIGhhcyBi
ZWVuIGZpdHRpbmcgaW4gYSBwYWdlIChldmVuIHdpdGggbG9jayBwcm9maWxlCmVuYWJsZWQpIHNp
bmNlIGNvbW1pdCA0Mjg2MDdhNDEwICJ4ODY6IHNocmluayAnc3RydWN0IGRvbWFpbicsIHdhcwph
bHJlYWR5IFBBR0VfU0laRSIgKHBhcnQgb2YgWGVuIDQuNykuCgpUaGVyZWZvcmUsIHRoZSBzcGVj
aWZpYyBjYXNlIGZvciBsb2NrIHByb2ZpbGUgaXMgbm93IHJlbW92ZWQuCgpUaGlzIGlzIG5vdCBh
IHNlY3VyaXR5IGlzc3VlIGJlY2F1c2Ugc3RydWN0IGRvbWFpbiBjYW4gb25seSBiZSBiaWdnZXIK
dGhhbiBhIHBhZ2Ugc2l6ZSBmb3IgbG9jayBwcm9maWxpbmcuIFRoZSBmZWF0dXJlIGNhbiBvbmx5
IGJlIHNlbGVjdGVkCmluIERFQlVHIGFuZCBFWFBFUlQgbW9kZS4KCkZpeGVzOiA4OTE2ZmNmNDU3
NyAoIng4Ni9kb21haW46IGNvbXBpbGUgd2l0aCBsb2NrX3Byb2ZpbGU9eSBlbmFibGVkIikKUmVw
b3J0ZWQtYnk6IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+ClNpZ25lZC1vZmYt
Ynk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+CgotLS0KClRoaXMgcmVwbGFjZSB0
aGUgb3JpZ2luYWwgYXBwcm9hY2g6CgpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hp
dmVzL2h0bWwveGVuLWRldmVsLzIwMjAtMDEvbXNnMDE1NDYuaHRtbAotLS0KIHhlbi9hcmNoL3g4
Ni9kb21haW4uYyB8IDEzICsrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9kb21haW4u
YyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwppbmRleCAyOGZlZmExZjgxLi5mNTNhZTVmZjg2IDEw
MDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZG9tYWluLmMKKysrIGIveGVuL2FyY2gveDg2L2RvbWFp
bi5jCkBAIC0zMTMsNyArMzEzLDYgQEAgc3RhdGljIHVuc2lnbmVkIGludCBfX2luaXQgbm9pbmxp
bmUgX2RvbWFpbl9zdHJ1Y3RfYml0cyh2b2lkKQogc3RydWN0IGRvbWFpbiAqYWxsb2NfZG9tYWlu
X3N0cnVjdCh2b2lkKQogewogICAgIHN0cnVjdCBkb21haW4gKmQ7Ci0gICAgdW5zaWduZWQgaW50
IG9yZGVyID0gZ2V0X29yZGVyX2Zyb21fYnl0ZXMoc2l6ZW9mKCpkKSk7CiAjaWZkZWYgQ09ORklH
X0JJR01FTQogICAgIGNvbnN0IHVuc2lnbmVkIGludCBiaXRzID0gMDsKICNlbHNlCkBAIC0zMjcs
MTggKzMyNiwxMCBAQCBzdHJ1Y3QgZG9tYWluICphbGxvY19kb21haW5fc3RydWN0KHZvaWQpCiAg
ICAgICAgICBiaXRzID0gX2RvbWFpbl9zdHJ1Y3RfYml0cygpOwogI2VuZGlmCiAKLQotI2lmbmRl
ZiBDT05GSUdfREVCVUdfTE9DS19QUk9GSUxFCiAgICAgQlVJTERfQlVHX09OKHNpemVvZigqZCkg
PiBQQUdFX1NJWkUpOwotI2VuZGlmCi0gICAgZCA9IGFsbG9jX3hlbmhlYXBfcGFnZXMob3JkZXIs
IE1FTUZfYml0cyhiaXRzKSk7CisgICAgZCA9IGFsbG9jX3hlbmhlYXBfcGFnZXMoMCwgTUVNRl9i
aXRzKGJpdHMpKTsKICAgICBpZiAoIGQgIT0gTlVMTCApCi0gICAgewotICAgICAgICB1bnNpZ25l
ZCBpbnQgc3o7Ci0KLSAgICAgICAgZm9yICggc3ogPSAwOyBzeiA8IChQQUdFX1NJWkUgPDwgb3Jk
ZXIpOyBzeiArPSBQQUdFX1NJWkUgKQotICAgICAgICAgICAgY2xlYXJfcGFnZSgodm9pZCAqKWQg
KyBzeik7Ci0gICAgfQorICAgICAgICBjbGVhcl9wYWdlKGQpOwogICAgIHJldHVybiBkOwogfQog
Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

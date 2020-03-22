Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEB418EA2F
	for <lists+xen-devel@lfdr.de>; Sun, 22 Mar 2020 17:17:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jG3FA-0004Vp-2X; Sun, 22 Mar 2020 16:14:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0EiK=5H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jG3F8-0004VU-Ev
 for xen-devel@lists.xenproject.org; Sun, 22 Mar 2020 16:14:30 +0000
X-Inumbo-ID: 32c8a036-6c58-11ea-bec1-bc764e2007e4
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32c8a036-6c58-11ea-bec1-bc764e2007e4;
 Sun, 22 Mar 2020 16:14:25 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id v6so13483074edw.8
 for <xen-devel@lists.xenproject.org>; Sun, 22 Mar 2020 09:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cet1saYnXR3xpuceaO1waHWT2/fXAf5BKcn7eA9qmok=;
 b=WY6ih+wcyK8i5ZEXGEP0xL9BxQELgzOPy5Q/pHgC63Bh9cTNUBVXm1X2HcLAh7j7Nx
 MIdVFgI+C/6xjq7dRhvDFGaskJKDIEbmMapirL7Ygcr0MVOMSLPojFqeGx0plWdGTbJX
 B8eAujld7OipW0BIyr8Y7XwGKcHQ2r4o5YyigDCn3IjOlQIT+/gTD3ZkgfSNjJw79Ia8
 Zo7g2vq8k95wxZnncru7cNDYKK52duhBzrNtuiY6DvxPQ1qAjmyeUrT1F/y/zhqNsttH
 jtbVYprxKCbX4ZvKa7LIZfpfgFRtE/7MlnPjKUze6KRwqU3eFoh/1c7WNL3AtnGYoPsC
 cohA==
X-Gm-Message-State: ANhLgQ3xlqkKxoSZI5FA6P+V++SwjmJ5eHRruFip024pa2nnnRZd3Axz
 0WbtBToakqlyZ6IjaRuX4Olk/exAUEXlbQ==
X-Google-Smtp-Source: ADFU+vsk6Azdlr3rrvuls90J5/2jHFaGwH3lfZkR+aiUc+YzczbWZMS7DvH+AugordRalegvssB9aw==
X-Received: by 2002:a17:906:7d87:: with SMTP id
 v7mr16943567ejo.301.1584893664660; 
 Sun, 22 Mar 2020 09:14:24 -0700 (PDT)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id v13sm106693edj.62.2020.03.22.09.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 09:14:24 -0700 (PDT)
From: julien@xen.org
To: xen-devel@lists.xenproject.org
Date: Sun, 22 Mar 2020 16:14:02 +0000
Message-Id: <20200322161418.31606-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200322161418.31606-1-julien@xen.org>
References: <20200322161418.31606-1-julien@xen.org>
Subject: [Xen-devel] [PATCH 01/17] xen/x86: Introduce helpers to
 generate/convert the CR3 from/to a MFN/GFN
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
Cc: julien@xen.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KCkludHJvZHVjZSBoYW5keSBo
ZWxwZXJzIHRvIGdlbmVyYXRlL2NvbnZlcnQgdGhlIENSMyBmcm9tL3RvIGEgTUZOL0dGTi4KCk5v
dGUgdGhhdCB3ZSBhcmUgdXNpbmcgY3IzX3BhKCkgcmF0aGVyIHRoYW4geGVuX2NyM190b19wZm4o
KSBiZWNhdXNlIHRoZQpsYXR0ZXIgZG9lcyBub3QgaWdub3JlIHRoZSB0b3AgMTItYml0cy4KClRh
a2UgdGhlIG9wcG9ydHVuaXR5IHRvIHVzZSB0aGUgbmV3IGhlbHBlcnMgd2hlbiBwb3NzaWJsZS4K
ClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Ci0tLQogeGVu
L2FyY2gveDg2L2RvbWFpbi5jICAgIHwgIDQgKystLQogeGVuL2FyY2gveDg2L21tLmMgICAgICAg
IHwgIDIgKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvbW0uaCB8IDIwICsrKysrKysrKysrKysrKysr
KysrCiAzIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWFpbi5jIGIveGVuL2FyY2gveDg2L2RvbWFpbi5j
CmluZGV4IGNhZjJlY2FkN2UuLjE1NzUwY2UyMTAgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9k
b21haW4uYworKysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKQEAgLTEwOTYsNyArMTA5Niw3IEBA
IGludCBhcmNoX3NldF9pbmZvX2d1ZXN0KAogICAgIHNldF9iaXQoX1ZQRl9pbl9yZXNldCwgJnYt
PnBhdXNlX2ZsYWdzKTsKIAogICAgIGlmICggIWNvbXBhdCApCi0gICAgICAgIGNyM19tZm4gPSBf
bWZuKHhlbl9jcjNfdG9fcGZuKGMubmF0LT5jdHJscmVnWzNdKSk7CisgICAgICAgIGNyM19tZm4g
PSBjcjNfdG9fbWZuKGMubmF0LT5jdHJscmVnWzNdKTsKICAgICBlbHNlCiAgICAgICAgIGNyM19t
Zm4gPSBfbWZuKGNvbXBhdF9jcjNfdG9fcGZuKGMuY21wLT5jdHJscmVnWzNdKSk7CiAgICAgY3Iz
X3BhZ2UgPSBnZXRfcGFnZV9mcm9tX21mbihjcjNfbWZuLCBkKTsKQEAgLTExNDIsNyArMTE0Miw3
IEBAIGludCBhcmNoX3NldF9pbmZvX2d1ZXN0KAogICAgICAgICB2LT5hcmNoLmd1ZXN0X3RhYmxl
ID0gcGFnZXRhYmxlX2Zyb21fcGFnZShjcjNfcGFnZSk7CiAgICAgICAgIGlmICggYy5uYXQtPmN0
cmxyZWdbMV0gKQogICAgICAgICB7Ci0gICAgICAgICAgICBjcjNfbWZuID0gX21mbih4ZW5fY3Iz
X3RvX3BmbihjLm5hdC0+Y3RybHJlZ1sxXSkpOworICAgICAgICAgICAgY3IzX21mbiA9IGNyM190
b19tZm4oYy5uYXQtPmN0cmxyZWdbMV0pOwogICAgICAgICAgICAgY3IzX3BhZ2UgPSBnZXRfcGFn
ZV9mcm9tX21mbihjcjNfbWZuLCBkKTsKIAogICAgICAgICAgICAgaWYgKCAhY3IzX3BhZ2UgKQpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tLmMgYi94ZW4vYXJjaC94ODYvbW0uYwppbmRleCA2
MjUwN2NhNjUxLi4wNjlhNjFkZWI4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0uYworKysg
Yi94ZW4vYXJjaC94ODYvbW0uYwpAQCAtNTA5LDcgKzUwOSw3IEBAIHZvaWQgbWFrZV9jcjMoc3Ry
dWN0IHZjcHUgKnYsIG1mbl90IG1mbikKIHsKICAgICBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9t
YWluOwogCi0gICAgdi0+YXJjaC5jcjMgPSBtZm5feChtZm4pIDw8IFBBR0VfU0hJRlQ7CisgICAg
di0+YXJjaC5jcjMgPSBtZm5fdG9fY3IzKG1mbik7CiAgICAgaWYgKCBpc19wdl9kb21haW4oZCkg
JiYgZC0+YXJjaC5wdi5wY2lkICkKICAgICAgICAgdi0+YXJjaC5jcjMgfD0gZ2V0X3BjaWRfYml0
cyh2LCBmYWxzZSk7CiB9CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L21tLmggYi94
ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKaW5kZXggYTA2YjJmYjgxZi4uOTc2NDM2MmEzOCAxMDA2
NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14
ODYvbW0uaApAQCAtNTI0LDYgKzUyNCwyNiBAQCBleHRlcm4gc3RydWN0IHJhbmdlc2V0ICptbWlv
X3JvX3JhbmdlczsKICNkZWZpbmUgY29tcGF0X3Bmbl90b19jcjMocGZuKSAoKCh1bnNpZ25lZCko
cGZuKSA8PCAxMikgfCAoKHVuc2lnbmVkKShwZm4pID4+IDIwKSkKICNkZWZpbmUgY29tcGF0X2Ny
M190b19wZm4oY3IzKSAoKCh1bnNpZ25lZCkoY3IzKSA+PiAxMikgfCAoKHVuc2lnbmVkKShjcjMp
IDw8IDIwKSkKIAorc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIG1mbl90b19jcjMobWZuX3Qg
bWZuKQoreworICAgIHJldHVybiB4ZW5fcGZuX3RvX2NyMyhtZm5feChtZm4pKTsKK30KKworc3Rh
dGljIGlubGluZSBtZm5fdCBjcjNfdG9fbWZuKHVuc2lnbmVkIGxvbmcgY3IzKQoreworICAgIHJl
dHVybiBtYWRkcl90b19tZm4oY3IzX3BhKGNyMykpOworfQorCitzdGF0aWMgaW5saW5lIHVuc2ln
bmVkIGxvbmcgZ2ZuX3RvX2NyMyhnZm5fdCBnZm4pCit7CisgICAgcmV0dXJuIHhlbl9wZm5fdG9f
Y3IzKGdmbl94KGdmbikpOworfQorCitzdGF0aWMgaW5saW5lIGdmbl90IGNyM190b19nZm4odW5z
aWduZWQgbG9uZyBjcjMpCit7CisgICAgcmV0dXJuIGdhZGRyX3RvX2dmbihjcjNfcGEoY3IzKSk7
Cit9CisKICNpZmRlZiBNRU1PUllfR1VBUkQKIHZvaWQgbWVtZ3VhcmRfZ3VhcmRfcmFuZ2Uodm9p
ZCAqcCwgdW5zaWduZWQgbG9uZyBsKTsKIHZvaWQgbWVtZ3VhcmRfdW5ndWFyZF9yYW5nZSh2b2lk
ICpwLCB1bnNpZ25lZCBsb25nIGwpOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

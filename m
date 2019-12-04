Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5188112761
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 10:30:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icQwR-0001qn-5J; Wed, 04 Dec 2019 09:27:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fd9d=Z2=dingwall.me.uk=james@srs-us1.protection.inumbo.net>)
 id 1icQwQ-0001qd-4f
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 09:27:26 +0000
X-Inumbo-ID: 47705d2b-1678-11ea-81fe-12813bfff9fa
Received: from know-smtprelay-omc-1.server.virginmedia.net (unknown
 [80.0.253.65]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47705d2b-1678-11ea-81fe-12813bfff9fa;
 Wed, 04 Dec 2019 09:27:24 +0000 (UTC)
Received: from mail0.xen.dingwall.me.uk ([82.47.84.47]) by cmsmtp with ESMTPA
 id cQwNiY5hqxs8ecQwNioh3X; Wed, 04 Dec 2019 09:27:23 +0000
X-Originating-IP: [82.47.84.47]
X-Authenticated-User: james.dingwall@blueyonder.co.uk
X-Spam: 0
X-Authority: v=2.3 cv=L98zvdb8 c=1 sm=1 tr=0 a=0bfgdX8EJi0Cr9X0x0jFDA==:117
 a=0bfgdX8EJi0Cr9X0x0jFDA==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19
 a=xqWC_Br6kY4A:10 a=pxVhFHJ0LMsA:10 a=5IRWAbXhAAAA:8 a=Sk5AkFDSzmZvWLMj57EA:9
 a=G6QAcT8NE79V4_GB:21 a=pniMzHNUB-FszkVU:21 a=xo7gz2vLY8DhO4BdlxfM:22
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id E9B07159423;
 Wed,  4 Dec 2019 09:27:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Received: from mail0.xen.dingwall.me.uk ([IPv6:::1])
 by localhost (mail0.xen.dingwall.me.uk [IPv6:::1]) (amavisd-new, port 10024)
 with ESMTP id K8vWBOZ4fSQp; Wed,  4 Dec 2019 09:27:41 +0000 (UTC)
Received: from behemoth.dingwall.me.uk (behemoth.dingwall.me.uk
 [IPv6:2001:470:695c:302::c0a8:105])
 by dingwall.me.uk (Postfix) with ESMTP id 8ADB9159415;
 Wed,  4 Dec 2019 09:27:41 +0000 (UTC)
Received: by behemoth.dingwall.me.uk (Postfix, from userid 1000)
 id 8EC0B140E19; Wed,  4 Dec 2019 09:27:41 +0000 (UTC)
From: james-xen@dingwall.me.uk
To: xen-devel@lists.xenproject.org
Date: Wed,  4 Dec 2019 09:27:37 +0000
Message-Id: <20191204092739.18177-3-james-xen@dingwall.me.uk>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191204092739.18177-1-james-xen@dingwall.me.uk>
References: <20191204092739.18177-1-james-xen@dingwall.me.uk>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKZJoxklV5Q0Crbpl0ZLACJxmaLTqKK6ekPEx8uMnDO5p1kjjD1esGp12wJKNL49IdkWu7Gf7CztIe8p8YMUwMzuIKFOUprkyINvei5hZ1YXg7gtsnRl
 5FtC7oEvAQNu+j0pAzSVopzAkwDJG+E603ho9qrM1KK7A9g13YbqQg1D7xjI5wm2evASO8HKBoYuUgcFh65K0Omec8bRgQzAsYtHn8CwyxL+ByavkDOFYH+c
 cKHD2q24E0ilvqeb+l33P6e5wJVQ+iaquWicJ7YTp5E=
Subject: [Xen-devel] [PATCH 2/4] xenstored logging: add control to
 dynamically toggle tracesyslog flag
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
Cc: wei.liu2@citrix.com, ian.jackson@eu.citrix.com,
 James Dingwall <james@dingwall.me.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSmFtZXMgRGluZ3dhbGwgPGphbWVzQGRpbmd3YWxsLm1lLnVrPgoKQWRkIGEgbmV3IHhl
bnN0b3JlIGNvbnRyb2wgY29tbWFuZCB3aGljaCBhbGxvd3MgdGhlIHRyYWNlc3lzbG9nIGJvb2xl
YW4gdG8gYmUKY2hhbmdlZCBhdCBydW4gdGltZS4KLS0tCiB0b29scy94ZW5zdG9yZS94ZW5zdG9y
ZWRfY29udHJvbC5jIHwgMTggKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTgg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb250
cm9sLmMgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29udHJvbC5jCmluZGV4IGU0YjhhYTk1
YWIuLjEyMGRjM2FhOTggMTAwNjQ0Ci0tLSBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb250
cm9sLmMKKysrIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvbnRyb2wuYwpAQCAtNzYsNiAr
NzYsMjMgQEAgc3RhdGljIGludCBkb19jb250cm9sX2xvZ2ZpbGUodm9pZCAqY3R4LCBzdHJ1Y3Qg
Y29ubmVjdGlvbiAqY29ubiwKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCBkb19jb250cm9s
X2xvZ3N5c2xvZyh2b2lkICpjdHgsIHN0cnVjdCBjb25uZWN0aW9uICpjb25uLAorCQkJICBjaGFy
ICoqdmVjLCBpbnQgbnVtKQoreworCWlmIChudW0gIT0gMSkKKwkJcmV0dXJuIEVJTlZBTDsKKwor
CWlmICghc3RyY21wKHZlY1swXSwgIm9uIikpCisJCXRyYWNlc3lzbG9nID0gdHJ1ZTsKKwllbHNl
IGlmICghc3RyY21wKHZlY1swXSwgIm9mZiIpKQorCQl0cmFjZXN5c2xvZyA9IGZhbHNlOworCWVs
c2UKKwkJcmV0dXJuIEVJTlZBTDsKKworCXNlbmRfYWNrKGNvbm4sIFhTX0NPTlRST0wpOworCXJl
dHVybiAwOworfQorCiBzdGF0aWMgaW50IGRvX2NvbnRyb2xfbWVtcmVwb3J0KHZvaWQgKmN0eCwg
c3RydWN0IGNvbm5lY3Rpb24gKmNvbm4sCiAJCQkJY2hhciAqKnZlYywgaW50IG51bSkKIHsKQEAg
LTEzMyw2ICsxNTAsNyBAQCBzdGF0aWMgc3RydWN0IGNtZF9zIGNtZHNbXSA9IHsKIAl7ICJjaGVj
ayIsIGRvX2NvbnRyb2xfY2hlY2ssICIiIH0sCiAJeyAibG9nIiwgZG9fY29udHJvbF9sb2csICJv
bnxvZmYiIH0sCiAJeyAibG9nZmlsZSIsIGRvX2NvbnRyb2xfbG9nZmlsZSwgIjxmaWxlPiIgfSwK
Kwl7ICJzeXNsb2ciLCBkb19jb250cm9sX2xvZ3N5c2xvZywgIm9ufG9mZiIgfSwKIAl7ICJtZW1y
ZXBvcnQiLCBkb19jb250cm9sX21lbXJlcG9ydCwgIls8ZmlsZT5dIiB9LAogCXsgInByaW50Iiwg
ZG9fY29udHJvbF9wcmludCwgIjxzdHJpbmc+IiB9LAogCXsgImhlbHAiLCBkb19jb250cm9sX2hl
bHAsICIiIH0sCi0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs

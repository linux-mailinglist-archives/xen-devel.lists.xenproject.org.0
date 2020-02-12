Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E7915A256
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 08:45:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1mf1-00012j-Eh; Wed, 12 Feb 2020 07:42:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TtlS=4A=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j1mf0-00012R-AZ
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 07:42:14 +0000
X-Inumbo-ID: 25b4a220-4d6b-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25b4a220-4d6b-11ea-ade5-bc764e2007e4;
 Wed, 12 Feb 2020 07:41:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 76501AF96;
 Wed, 12 Feb 2020 07:41:57 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 12 Feb 2020 08:41:54 +0100
Message-Id: <20200212074154.23755-4-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200212074154.23755-1-jgross@suse.com>
References: <20200212074154.23755-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 3/3] xenstore: remove not applicable control
 commands in stubdom
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBydW4gaW4gYSBzdHViZG9tIGVudmlyb25tZW50IFhlbnN0b3JlIGNhbid0IHNlbGVjdCBh
IGxvZ2ZpbGUgb3IKZW1pdCBtZW1vcnkgc3RhdGlzdGljcyB0byBhIHNwZWNpZmljIGZpbGUuCgpT
byByZW1vdmUgb3IgbW9kaWZ5IHRob3NlIGNvbnRyb2wgY29tbWFuZHMgYWNjb3JkaW5nbHkuCgpT
aWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkFja2VkLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KIHRvb2xzL3hlbnN0
b3JlL3hlbnN0b3JlZF9jb250cm9sLmMgfCAxOCArKysrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmUveGVu
c3RvcmVkX2NvbnRyb2wuYyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb250cm9sLmMKaW5k
ZXggZTRiOGFhOTVhYi4uOGQ0OGFiNDgyMCAxMDA2NDQKLS0tIGEvdG9vbHMveGVuc3RvcmUveGVu
c3RvcmVkX2NvbnRyb2wuYworKysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29udHJvbC5j
CkBAIC02MSw2ICs2MSwxOSBAQCBzdGF0aWMgaW50IGRvX2NvbnRyb2xfbG9nKHZvaWQgKmN0eCwg
c3RydWN0IGNvbm5lY3Rpb24gKmNvbm4sCiAJcmV0dXJuIDA7CiB9CiAKKyNpZmRlZiBfX01JTklP
U19fCitzdGF0aWMgaW50IGRvX2NvbnRyb2xfbWVtcmVwb3J0KHZvaWQgKmN0eCwgc3RydWN0IGNv
bm5lY3Rpb24gKmNvbm4sCisJCQkJY2hhciAqKnZlYywgaW50IG51bSkKK3sKKwlpZiAobnVtKQor
CQlyZXR1cm4gRUlOVkFMOworCisJdGFsbG9jX3JlcG9ydF9mdWxsKE5VTEwsIHN0ZG91dCk7CisK
KwlzZW5kX2Fjayhjb25uLCBYU19DT05UUk9MKTsKKwlyZXR1cm4gMDsKK30KKyNlbHNlCiBzdGF0
aWMgaW50IGRvX2NvbnRyb2xfbG9nZmlsZSh2b2lkICpjdHgsIHN0cnVjdCBjb25uZWN0aW9uICpj
b25uLAogCQkJICAgICAgY2hhciAqKnZlYywgaW50IG51bSkKIHsKQEAgLTExNCw2ICsxMjcsNyBA
QCBzdGF0aWMgaW50IGRvX2NvbnRyb2xfbWVtcmVwb3J0KHZvaWQgKmN0eCwgc3RydWN0IGNvbm5l
Y3Rpb24gKmNvbm4sCiAJc2VuZF9hY2soY29ubiwgWFNfQ09OVFJPTCk7CiAJcmV0dXJuIDA7CiB9
CisjZW5kaWYKIAogc3RhdGljIGludCBkb19jb250cm9sX3ByaW50KHZvaWQgKmN0eCwgc3RydWN0
IGNvbm5lY3Rpb24gKmNvbm4sCiAJCQkgICAgY2hhciAqKnZlYywgaW50IG51bSkKQEAgLTEzMiw4
ICsxNDYsMTIgQEAgc3RhdGljIGludCBkb19jb250cm9sX2hlbHAodm9pZCAqLCBzdHJ1Y3QgY29u
bmVjdGlvbiAqLCBjaGFyICoqLCBpbnQpOwogc3RhdGljIHN0cnVjdCBjbWRfcyBjbWRzW10gPSB7
CiAJeyAiY2hlY2siLCBkb19jb250cm9sX2NoZWNrLCAiIiB9LAogCXsgImxvZyIsIGRvX2NvbnRy
b2xfbG9nLCAib258b2ZmIiB9LAorI2lmZGVmIF9fTUlOSU9TX18KKwl7ICJtZW1yZXBvcnQiLCBk
b19jb250cm9sX21lbXJlcG9ydCwgIiIgfSwKKyNlbHNlCiAJeyAibG9nZmlsZSIsIGRvX2NvbnRy
b2xfbG9nZmlsZSwgIjxmaWxlPiIgfSwKIAl7ICJtZW1yZXBvcnQiLCBkb19jb250cm9sX21lbXJl
cG9ydCwgIls8ZmlsZT5dIiB9LAorI2VuZGlmCiAJeyAicHJpbnQiLCBkb19jb250cm9sX3ByaW50
LCAiPHN0cmluZz4iIH0sCiAJeyAiaGVscCIsIGRvX2NvbnRyb2xfaGVscCwgIiIgfSwKIH07Ci0t
IAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

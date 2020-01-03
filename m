Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2F712F8AB
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 14:09:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inMf9-00046N-0L; Fri, 03 Jan 2020 13:06:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Lau=2Y=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1inMf7-00045y-8M
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 13:06:45 +0000
X-Inumbo-ID: defe041c-2e29-11ea-a914-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id defe041c-2e29-11ea-a914-bc764e2007e4;
 Fri, 03 Jan 2020 13:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578056796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=+brguB1nMVjS8uTomgW5MTQducEv5eNRXPfnzSMU2XE=;
 b=HiIWVy5ZSGyJOJ27E7YhtNsr9Hc/53Zo002lmFxQPrf1gCO/o5YcltVH
 joRqXm0kVrxzjaPYXphp9xGfckGNOgZtALgedU39s4cDtVFzSIemEo+TH
 t8GQ2yRdcpsTS1mdCP3Rfxm8dI1cyGd8o8jixFGlMI3wvuVtj2z181zwe 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ks7qC2eM8OTWEDOGYXsFbRVKgCVf7V7FlLwJVXwdZV4MZGx1KyThFlarxv26HoyKMFZgvXT6UL
 WIknRSO+AsJVtAjbtJzOdYXg5SiuzJKevzK3ePuG6SL6cszKZhcsSOZcRgXPJTh/3j7dnOzR7Y
 zh7i1307iVmjfAJTm+pgqCM0C1lo68kRgYE5FIJEffFbCycqIiq2WE77jMAl9nkpYbd+Qx+o6W
 +wTf80Eibn1bQNEcoNeFXq/IbPaTq3pD2bjNUhRQZtvakLVfgV3AqEmCycu0ZM6sbB828Xe9SL
 jPA=
X-SBRS: 2.7
X-MesageID: 10571944
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,390,1571716800"; d="scan'208";a="10571944"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 3 Jan 2020 13:06:12 +0000
Message-ID: <20200103130616.13724-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200103130616.13724-1-andrew.cooper3@citrix.com>
References: <20200103130616.13724-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 16/20] tools/libxl: Simplify callback handling
 in libxl-save-helper
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHtzYXZlLHJlc3RvcmV9X2NhbGxiYWNrIGhlbHBlcnMgY2FuIGhhdmUgdGhlaXIgc2NvcGUg
cmVkdWNlZCB2YXN0bHksIGFuZApoZWxwZXJfc2V0Y2FsbGJhY2tzX3tzYXZlLHJlc3RvcmV9KCkg
ZG9lc24ndCBuZWVkIHRvIHVzZSBhIHRlcm5hcnkgb3BlcmF0b3IgdG8Kd3JpdGUgMCAobWVhbmlu
ZyBOVUxMKSBpbnRvIGFuIGFscmVhZHkgemVyb2VkIHN0cnVjdHVyZS4KCk5vIGZ1bmN0aW9uYWwg
Y2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KLS0tCkNDOiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT4KQ0M6
IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9zYXZlX2hlbHBlci5jICAgIHwgMTUg
KysrKysrLS0tLS0tLS0tCiB0b29scy9saWJ4bC9saWJ4bF9zYXZlX21zZ3NfZ2VuLnBsIHwgIDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9zYXZlX2hlbHBlci5jIGIvdG9vbHMvbGlieGwv
bGlieGxfc2F2ZV9oZWxwZXIuYwppbmRleCAzOThkZjAwZGQ2Li5hOTFmMzZkYjczIDEwMDY0NAot
LS0gYS90b29scy9saWJ4bC9saWJ4bF9zYXZlX2hlbHBlci5jCisrKyBiL3Rvb2xzL2xpYnhsL2xp
YnhsX3NhdmVfaGVscGVyLmMKQEAgLTIxNyw4ICsyMTcsNiBAQCBpbnQgaGVscGVyX2dldHJlcGx5
KHZvaWQgKnVzZXIpCiAKIC8qLS0tLS0gb3RoZXIgY2FsbGJhY2tzIC0tLS0tKi8KIAotc3RhdGlj
IHN0cnVjdCBzYXZlX2NhbGxiYWNrcyBoZWxwZXJfc2F2ZV9jYWxsYmFja3M7Ci0KIHN0YXRpYyB2
b2lkIHN0YXJ0dXAoY29uc3QgY2hhciAqb3ApIHsKICAgICB4dGxfbG9nKCZsb2dnZXIsWFRMX0RF
QlVHLDAscHJvZ3JhbSwic3RhcnRpbmcgJXMiLG9wKTsKIApAQCAtMjM0LDggKzIzMiw2IEBAIHN0
YXRpYyB2b2lkIGNvbXBsZXRlKGludCByZXR2YWwpIHsKICAgICBleGl0KDApOwogfQogCi1zdGF0
aWMgc3RydWN0IHJlc3RvcmVfY2FsbGJhY2tzIGhlbHBlcl9yZXN0b3JlX2NhbGxiYWNrczsKLQog
aW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogewogICAgIGludCByOwpAQCAtMjQ3LDYg
KzI0Myw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKICAgICBhc3NlcnQobW9k
ZSk7CiAKICAgICBpZiAoIXN0cmNtcChtb2RlLCItLXNhdmUtZG9tYWluIikpIHsKKyAgICAgICAg
c3RhdGljIHN0cnVjdCBzYXZlX2NhbGxiYWNrcyBjYjsKIAogICAgICAgICBpb19mZCA9ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBhdG9pKE5FWFRBUkcpOwogICAgICAgICByZWN2X2ZkID0g
ICAgICAgICAgICAgICAgICAgICAgICAgICBhdG9pKE5FWFRBUkcpOwpAQCAtMjU3LDE2ICsyNTQs
MTcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogICAgICAgICB4Y19zdHJlYW1f
dHlwZV90IHN0cmVhbV90eXBlID0gICAgICBzdHJ0b3VsKE5FWFRBUkcsMCwxMCk7CiAgICAgICAg
IGFzc2VydCghKisrYXJndik7CiAKLSAgICAgICAgaGVscGVyX3NldGNhbGxiYWNrc19zYXZlKCZo
ZWxwZXJfc2F2ZV9jYWxsYmFja3MsIGNiZmxhZ3MpOworICAgICAgICBoZWxwZXJfc2V0Y2FsbGJh
Y2tzX3NhdmUoJmNiLCBjYmZsYWdzKTsKIAogICAgICAgICBzdGFydHVwKCJzYXZlIik7CiAgICAg
ICAgIHNldHVwX3NpZ25hbHMoc2F2ZV9zaWduYWxfaGFuZGxlcik7CiAKLSAgICAgICAgciA9IHhj
X2RvbWFpbl9zYXZlKHhjaCwgaW9fZmQsIGRvbSwgZmxhZ3MsICZoZWxwZXJfc2F2ZV9jYWxsYmFj
a3MsCisgICAgICAgIHIgPSB4Y19kb21haW5fc2F2ZSh4Y2gsIGlvX2ZkLCBkb20sIGZsYWdzLCAm
Y2IsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBodm0sIHN0cmVhbV90eXBlLCByZWN2X2Zk
KTsKICAgICAgICAgY29tcGxldGUocik7CiAKICAgICB9IGVsc2UgaWYgKCFzdHJjbXAobW9kZSwi
LS1yZXN0b3JlLWRvbWFpbiIpKSB7CisgICAgICAgIHN0YXRpYyBzdHJ1Y3QgcmVzdG9yZV9jYWxs
YmFja3MgY2I7CiAKICAgICAgICAgaW9fZmQgPSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
YXRvaShORVhUQVJHKTsKICAgICAgICAgc2VuZF9iYWNrX2ZkID0gICAgICAgICAgICAgICAgICAg
ICAgYXRvaShORVhUQVJHKTsKQEAgLTI4MSw3ICsyNzksNyBAQCBpbnQgbWFpbihpbnQgYXJnYywg
Y2hhciAqKmFyZ3YpCiAgICAgICAgIHhjX3N0cmVhbV90eXBlX3Qgc3RyZWFtX3R5cGUgPSAgICAg
IHN0cnRvdWwoTkVYVEFSRywwLDEwKTsKICAgICAgICAgYXNzZXJ0KCEqKythcmd2KTsKIAotICAg
ICAgICBoZWxwZXJfc2V0Y2FsbGJhY2tzX3Jlc3RvcmUoJmhlbHBlcl9yZXN0b3JlX2NhbGxiYWNr
cywgY2JmbGFncyk7CisgICAgICAgIGhlbHBlcl9zZXRjYWxsYmFja3NfcmVzdG9yZSgmY2IsIGNi
ZmxhZ3MpOwogCiAgICAgICAgIHVuc2lnbmVkIGxvbmcgc3RvcmVfbWZuID0gMDsKICAgICAgICAg
dW5zaWduZWQgbG9uZyBjb25zb2xlX21mbiA9IDA7CkBAIC0yOTIsOCArMjkwLDcgQEAgaW50IG1h
aW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogICAgICAgICByID0geGNfZG9tYWluX3Jlc3RvcmUo
eGNoLCBpb19mZCwgZG9tLCBzdG9yZV9ldnRjaG4sICZzdG9yZV9tZm4sCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdG9yZV9kb21pZCwgY29uc29sZV9ldnRjaG4sICZjb25zb2xlX21m
biwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnNvbGVfZG9taWQsIGh2bSwgcGFl
LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RyZWFtX3R5cGUsCi0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAmaGVscGVyX3Jlc3RvcmVfY2FsbGJhY2tzLCBzZW5kX2JhY2tf
ZmQpOworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RyZWFtX3R5cGUsICZjYiwgc2Vu
ZF9iYWNrX2ZkKTsKICAgICAgICAgaGVscGVyX3N0dWJfcmVzdG9yZV9yZXN1bHRzKHN0b3JlX21m
bixjb25zb2xlX21mbiwwKTsKICAgICAgICAgY29tcGxldGUocik7CiAKZGlmZiAtLWdpdCBhL3Rv
b2xzL2xpYnhsL2xpYnhsX3NhdmVfbXNnc19nZW4ucGwgYi90b29scy9saWJ4bC9saWJ4bF9zYXZl
X21zZ3NfZ2VuLnBsCmluZGV4IDZmMWQ3OWY4MjEuLjgzMWExNWUwYmIgMTAwNzU1Ci0tLSBhL3Rv
b2xzL2xpYnhsL2xpYnhsX3NhdmVfbXNnc19nZW4ucGwKKysrIGIvdG9vbHMvbGlieGwvbGlieGxf
c2F2ZV9tc2dzX2dlbi5wbApAQCAtMzMzLDcgKzMzMyw3IEBAIEVORF9BTFdBWVMKICAgICAgICAg
bXkgJGNfdiA9ICIoMXU8PCRtc2dudW0pIjsKICAgICAgICAgbXkgJGNfY2IgPSAiY2JzLT4kbmFt
ZSI7CiAgICAgICAgICRmX21vcmVfc3ItPigiICAgIGlmICgkY19jYikgY2JmbGFncyB8PSAkY192
O1xuIiwgJGVudW1jYWxsYmFja3MpOwotICAgICAgICAkZl9tb3JlX3NyLT4oIiAgICAkY19jYiA9
IChjYmZsYWdzICYgJGNfdikgPyAke2VuY29kZX1fJHtuYW1lfSA6IDA7XG4iLAorICAgICAgICAk
Zl9tb3JlX3NyLT4oIiAgICBpZiAoY2JmbGFncyAmICRjX3YpICRjX2NiID0gJHtlbmNvZGV9XyR7
bmFtZX07XG4iLAogICAgICAgICAgICAgICAgICAgICAgJHNldGNhbGxiYWNrcyk7CiAgICAgfQog
ICAgICRmX21vcmVfc3ItPigiICAgICAgICByZXR1cm4gMTtcbiAgICB9XG5cbiIpOwotLSAKMi4x
MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 563AA14A648
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 15:37:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw5Te-0001Wn-NB; Mon, 27 Jan 2020 14:34:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x5IB=3Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iw5Tc-0001VS-R0
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 14:34:56 +0000
X-Inumbo-ID: 2cd8720a-4112-11ea-855c-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2cd8720a-4112-11ea-855c-12813bfff9fa;
 Mon, 27 Jan 2020 14:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580135692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=huVJ+0aCOpAGQCtN/yPRBaOtQQ4sNAcOCS16fjqXD/M=;
 b=GBA86jGTLj4pyvu/pXsIR2ZOnT4gKvbirbr5Li0JytDMcTutgmIPq/B7
 oJw0z9sdsEvFJdwDdDgivdQqVSzWK8eVVuSMhDaoBvR9gXGDmF2omnZYG
 FMcaf+tnVNXVCqlGPZrfhsYqVL5vBuPouWKaUyx2bf5HDArQ3XxL0Q9Ff Y=;
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
IronPort-SDR: oXiO09je6FvLpuTsU5ZM6xrk3eR10jdlgTw5Ha2agaokRcNMgWJBoCGBRxoxifDSMUBTGVJql+
 AeLNMb12PjjmLL4TrgeVESbk9XUa3QoIOgr9WjsxME+nOolO4B81687fuFuWzJxcgEWB/pwCXv
 fYCN3sSKucvMcwW0vwZ04gwIpcWf0pWI3U4M64ue2RlDa0RZZJUgJgVLc7byYmtMrQVo0df5oX
 m1oA6PT8kRolAIBXQ7hwxbM9Ex5rytN9W18ysuvxds95RMO9iipHhPcEWMduOcrPRACk3PLtga
 RLs=
X-SBRS: 2.7
X-MesageID: 11664974
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11664974"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 27 Jan 2020 14:34:32 +0000
Message-ID: <20200127143444.25538-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200127143444.25538-1-andrew.cooper3@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 05/17] python/migration: Update validation
 logic to understand a v3 stream
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
LS0tCkNDOiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT4KQ0M6IFdlaSBMaXUg
PHdsQHhlbi5vcmc+CkNDOiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGlu
dmlzaWJsZXRoaW5nc2xhYi5jb20+Ci0tLQogdG9vbHMvcHl0aG9uL3hlbi9taWdyYXRpb24vbGli
eGMucHkgfCAyNiArKysrKysrKysrKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIy
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvcHl0aG9u
L3hlbi9taWdyYXRpb24vbGlieGMucHkgYi90b29scy9weXRob24veGVuL21pZ3JhdGlvbi9saWJ4
Yy5weQppbmRleCBkMGM0ZjM1MjdkLi41ZmI1MWI1NmFjIDEwMDY0NAotLS0gYS90b29scy9weXRo
b24veGVuL21pZ3JhdGlvbi9saWJ4Yy5weQorKysgYi90b29scy9weXRob24veGVuL21pZ3JhdGlv
bi9saWJ4Yy5weQpAQCAtMTE5LDYgKzExOSw3IEBAIGNsYXNzIFZlcmlmeUxpYnhjKFZlcmlmeUJh
c2UpOgogICAgIGRlZiBfX2luaXRfXyhzZWxmLCBpbmZvLCByZWFkKToKICAgICAgICAgVmVyaWZ5
QmFzZS5fX2luaXRfXyhzZWxmLCBpbmZvLCByZWFkKQogCisgICAgICAgIHNlbGYudmVyc2lvbiA9
IDAKICAgICAgICAgc2VsZi5zcXVhc2hlZF9wYWdlZGF0YV9yZWNvcmRzID0gMAogCiAKQEAgLTE0
NSw5ICsxNDYsMTIgQEAgZGVmIHZlcmlmeV9paGRyKHNlbGYpOgogICAgICAgICAgICAgcmFpc2Ug
U3RyZWFtRXJyb3IoIkJhZCBpbWFnZSBpZDogRXhwZWN0ZWQgMHgleCwgZ290IDB4JXgiICUKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIChJSERSX0lERU5ULCBpZGVudCkpCiAKLSAgICAg
ICAgaWYgdmVyc2lvbiAhPSAyOgotICAgICAgICAgICAgcmFpc2UgU3RyZWFtRXJyb3IoIlVua25v
d24gaW1hZ2UgdmVyc2lvbjogRXhwZWN0ZWQgMiwgZ290ICVkIiAlCi0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAodmVyc2lvbiwgKSkKKyAgICAgICAgaWYgbm90ICgyIDw9IHZlcnNpb24g
PD0gMyk6CisgICAgICAgICAgICByYWlzZSBTdHJlYW1FcnJvcigKKyAgICAgICAgICAgICAgICAi
VW5rbm93biBpbWFnZSB2ZXJzaW9uOiBFeHBlY3RlZCAyIDw9IHZlciA8PSAzLCBnb3QgJWQiICUK
KyAgICAgICAgICAgICAgICAodmVyc2lvbiwgKSkKKworICAgICAgICBzZWxmLnZlcnNpb24gPSB2
ZXJzaW9uCiAKICAgICAgICAgaWYgb3B0aW9ucyAmIElIRFJfT1BUX1JFU1pfTUFTSzoKICAgICAg
ICAgICAgIHJhaXNlIFN0cmVhbUVycm9yKCJSZXNlcnZlZCBiaXRzIHNldCBpbiBpbWFnZSBvcHRp
b25zIGZpZWxkOiAweCV4IiAlCkBAIC0xNjQsNyArMTY4LDggQEAgZGVmIHZlcmlmeV9paGRyKHNl
bGYpOgogICAgICAgICAgICAgICAgICJTdHJlYW0gaXMgbm90IG5hdGl2ZSBlbmRpYW5lc3MgLSB1
bmFibGUgdG8gdmFsaWRhdGUiKQogCiAgICAgICAgIGVuZGlhbiA9IFsibGl0dGxlIiwgImJpZyJd
W29wdGlvbnMgJiBJSERSX09QVF9MRV0KLSAgICAgICAgc2VsZi5pbmZvKCJMaWJ4YyBJbWFnZSBI
ZWFkZXI6ICVzIGVuZGlhbiIgJSAoZW5kaWFuLCApKQorICAgICAgICBzZWxmLmluZm8oIkxpYnhj
IEltYWdlIEhlYWRlcjogVmVyc2lvbiAlZCwgJXMgZW5kaWFuIiAlCisgICAgICAgICAgICAgICAg
ICAodmVyc2lvbiwgZW5kaWFuKSkKIAogCiAgICAgZGVmIHZlcmlmeV9kaGRyKHNlbGYpOgpAQCAt
NDI0LDYgKzQyOSwxNiBAQCBkZWYgdmVyaWZ5X3JlY29yZF9jaGVja3BvaW50X2RpcnR5X3Bmbl9s
aXN0KHNlbGYsIGNvbnRlbnQpOgogICAgICAgICByYWlzZSBSZWNvcmRFcnJvcigiRm91bmQgY2hl
Y2twb2ludCBkaXJ0eSBwZm4gbGlzdCByZWNvcmQgaW4gc3RyZWFtIikKIAogCisgICAgZGVmIHZl
cmlmeV9yZWNvcmRfc3RhdGljX2RhdGFfZW5kKHNlbGYsIGNvbnRlbnQpOgorICAgICAgICAiIiIg
c3RhdGljIGRhdGEgZW5kIHJlY29yZCAiIiIKKworICAgICAgICBpZiBsZW4oY29udGVudCkgIT0g
MDoKKyAgICAgICAgICAgIHJhaXNlIFJlY29yZEVycm9yKCJFbmQgcmVjb3JkIHdpdGggbm9uLXpl
cm8gbGVuZ3RoIikKKworICAgICAgICBpZiBzZWxmLnZlcnNpb24gPCAzOgorICAgICAgICAgICAg
cmFpc2UgUmVjb3JkRXJyb3IoIlN0YXRpYyBkYXRhIGVuZCByZWNvcmQgZm91bmQgaW4gdjIgc3Ry
ZWFtIikKKworCiByZWNvcmRfdmVyaWZpZXJzID0gewogICAgIFJFQ19UWVBFX2VuZDoKICAgICAg
ICAgVmVyaWZ5TGlieGMudmVyaWZ5X3JlY29yZF9lbmQsCkBAIC00NjUsNCArNDgwLDcgQEAgZGVm
IHZlcmlmeV9yZWNvcmRfY2hlY2twb2ludF9kaXJ0eV9wZm5fbGlzdChzZWxmLCBjb250ZW50KToK
ICAgICAgICAgVmVyaWZ5TGlieGMudmVyaWZ5X3JlY29yZF9jaGVja3BvaW50LAogICAgIFJFQ19U
WVBFX2NoZWNrcG9pbnRfZGlydHlfcGZuX2xpc3Q6CiAgICAgICAgIFZlcmlmeUxpYnhjLnZlcmlm
eV9yZWNvcmRfY2hlY2twb2ludF9kaXJ0eV9wZm5fbGlzdCwKKworICAgIFJFQ19UWVBFX3N0YXRp
Y19kYXRhX2VuZDoKKyAgICAgICAgVmVyaWZ5TGlieGMudmVyaWZ5X3JlY29yZF9zdGF0aWNfZGF0
YV9lbmQsCiAgICAgfQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCD2D012F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 21:29:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHv8Z-0007Qn-So; Tue, 08 Oct 2019 19:27:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5hjQ=YB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iHv8Y-0007Qi-FL
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 19:27:10 +0000
X-Inumbo-ID: 9eda8a52-ea01-11e9-80e3-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9eda8a52-ea01-11e9-80e3-bc764e2007e4;
 Tue, 08 Oct 2019 19:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570562829;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YJ7alNQH9xjy2am7wha/oujGKUJZVT12bZKHxonze6E=;
 b=Q148qb17skybYezCshshB7+TbBLr/ScjKfewqaMWlzst4pkCCN+9xAGZ
 4MHfSKAk4ov0zwZDKQM4fdThZx0KAzSA1707Rz+P3M0lf1zpn9p39jMj9
 SKz1Wes/XhIZ+9GBxZlb/69eMAFYdp/hrkbPnOtB/5INYkmSZyTQ5lx3k g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: b1Gy0uYdXByGmGQAnrWs0R+mGEkkI8MF6pfIhhzEjGiDoiXZEBasKtemBIO13bj+NUuFm9rlyD
 np/94HJMQDsbJVy7MtGUi4aGXDe0/0tnwC0UuBdx9nWRPhWmiqYIAznBinE/svr+uG7U8c53NN
 TLZzQ/Haosv6SImyXmY8WjrbqlIVJ6MHeYuOyH+iOJGxDoIZ0M/wr4Ic8wx4pWZ8EjziI3PDl9
 pC8gWsS7oT2o93PU69tq7CvfDlWm7j1qoZ3t+BG9SPgNpu+jbeyGQlsgYq53tpl0fHT7D4X1Xz
 RNk=
X-SBRS: 2.7
X-MesageID: 6932438
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,272,1566878400"; 
   d="scan'208";a="6932438"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 8 Oct 2019 20:27:05 +0100
Message-ID: <20191008192705.7627-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13] x86/microcode: Drop trailing
 whitespace in printk()
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBoYXMgYWN0dWFsbHkgYmVlbiBwcmVzZW50IHNpbmNlIGMvcyBiZDdjMDljMCBpbiAyMDA4
LCBhbmQgc3Vydml2ZWQKdGhyb3VnaCBhbGwgb2YgdGhlIHJlY2VudCBtaWNyb2NvZGUgcmVmYWN0
b3JpbmcuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBM
aXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KQ0M6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+CkNDOiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+CgpUaGlzIGlzIGEgY29zbWV0aWMgbmljZS10by1oYXZlIHdoaWNoIGhh
cyBubyByaXNrIGZvciA0LjEzLgotLS0KIHhlbi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50ZWwuYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50ZWwuYyBiL3hlbi9hcmNoL3g4Ni9t
aWNyb2NvZGVfaW50ZWwuYwppbmRleCA5ZWRlZGNjNzNhLi45ZjY2MDU3YWFkIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2ludGVsLmMKKysrIGIveGVuL2FyY2gveDg2L21pY3Jv
Y29kZV9pbnRlbC5jCkBAIC0zMTksNyArMzE5LDcgQEAgc3RhdGljIGludCBhcHBseV9taWNyb2Nv
ZGUoY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqcGF0Y2gpCiAgICAgICAgIHJldHVybiAt
RUlPOwogICAgIH0KICAgICBwcmludGsoS0VSTl9JTkZPICJtaWNyb2NvZGU6IENQVSVkIHVwZGF0
ZWQgZnJvbSByZXZpc2lvbiAiCi0gICAgICAgICAgICIlI3ggdG8gJSN4LCBkYXRlID0gJTA0eC0l
MDJ4LSUwMnggXG4iLAorICAgICAgICAgICAiJSN4IHRvICUjeCwgZGF0ZSA9ICUwNHgtJTAyeC0l
MDJ4XG4iLAogICAgICAgICAgICBjcHVfbnVtLCBzaWctPnJldiwgdmFsWzFdLCBtY19pbnRlbC0+
aGRyLnllYXIsCiAgICAgICAgICAgIG1jX2ludGVsLT5oZHIubW9udGgsIG1jX2ludGVsLT5oZHIu
ZGF5KTsKICAgICBzaWctPnJldiA9IHZhbFsxXTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

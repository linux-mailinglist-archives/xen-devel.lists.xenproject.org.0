Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D002B8044
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 19:43:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB0Ql-0004gD-QV; Thu, 19 Sep 2019 17:41:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iB0Qj-0004e6-Jr
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 17:41:21 +0000
X-Inumbo-ID: b04a897e-db04-11e9-966e-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b04a897e-db04-11e9-966e-12813bfff9fa;
 Thu, 19 Sep 2019 17:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568914879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=42g1nRsubz8/EWiCmW1IVEW9Gu3YO6Yy4ytl2VdE9Jw=;
 b=PpxjO1ugFcnIAfUW7kx0JEmZMyqcEK1o6p9VZYErcEim9lC1AYL41JXt
 vnii090ttD0yETw+7D9j4m9nzZXxS2/pnUXOEyxk5wF8EEblL+BL8SYEB
 p1cN/cifrAOOzuMWMC4EM/hYlawFKmDbPVSp/H7W0pzUPjovEH107tLlm A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kgm5NJrYKv9LNZjCc54brSfTpiEyTIjPIsRy7l4mhpOAOKVWjZaSDbBqpC7k4+tLkOsrhSoqfb
 wluhKQcY/1lfXZgoPOIIog3F3WAjJSzMCfMFZZFHL0tKIgEzaYdAyhWgyO1w1/6xEROmf23lde
 YUBt5rk+oUCY3Jtj/3GhOt8jVcaJPR7WxYTUbfzbSumvqeZ+/Cu6rqsKgu0M8u5gTpxBDgN1pp
 Al0yOhXAqEW5uO0C1oRzuRQc4x0y0jNfbaAHVYdZ4QIsf05IBvLBKusOM6WaVEo38rl19VBxic
 MAE=
X-SBRS: 2.7
X-MesageID: 6125295
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="6125295"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 18:16:55 +0100
Message-ID: <20190919171656.899649-36-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919171656.899649-1-anthony.perard@citrix.com>
References: <20190919171656.899649-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 35/35] libxl_pci: Extract common part of
 *qemu_trad_watch_state_cb
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnVuY3Rpb25zIHBjaV9hZGRfcWVtdV90cmFkX3dhdGNoX3N0YXRlX2NiIGFuZApwY2lfcmVtb3Zl
X3FlbXVfdHJhZF93YXRjaF9zdGF0ZV9jYiBhcmUgc2ltaWxhciBzbyB0aGUgY29tbW9uIHBhcnQg
aXMKZXh0cmFjdGVkIGluIGEgZGlmZmVyZW50IGZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTogQW50
aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQoKTm90ZXM6CiAgICB2
MjoKICAgIC0gbmV3IHBhdGNoIHdoaWNoIGF0dGVtcHQgdG8gY29tYmluZSB0aGUgImJhc2ljYWxs
eS1pZGVudGljYWwiIGZ1bmN0aW9ucwogICAgICBwY2lfe2FkZCxyZW1vdmV9X3FlbXVfdHJhZF93
YXRjaF9zdGF0ZV9jYgoKIHRvb2xzL2xpYnhsL2xpYnhsX3BjaS5jIHwgNTEgKysrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRp
b25zKCspLCAyMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9w
Y2kuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5jCmluZGV4IDJjNGUyZTVjZmY1ZS4uNDcyNTgx
NzdiYzcxIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9wY2kuYworKysgYi90b29scy9s
aWJ4bC9saWJ4bF9wY2kuYwpAQCAtOTg0LDYgKzk4NCwyNyBAQCBzdGF0aWMgaW50IHFlbXVfcGNp
X2FkZF94ZW5zdG9yZShsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwKICAgICByZXR1cm4g
cmM7CiB9CiAKK3N0YXRpYyBpbnQgY2hlY2tfcWVtdV9ydW5uaW5nKGxpYnhsX19nYyAqZ2MsCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kb21pZCBkb21pZCwKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX194c3dhaXRfc3RhdGUgKnhzd2EsCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpbnQgcmMsCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBjaGFyICpzdGF0ZSkKK3sKKyAgICBpZiAocmMpIHsKKyAgICAgICAgaWYgKHJj
ID09IEVSUk9SX1RJTUVET1VUKSB7CisgICAgICAgICAgICBMT0dEKEVSUk9SLCBkb21pZCwgIiVz
IG5vdCByZWFkeSIsIHhzd2EtPndoYXQpOworICAgICAgICB9CisgICAgICAgIGdvdG8gb3V0Owor
ICAgIH0KKworICAgIGlmICghc3RhdGUgfHwgc3RyY21wKHN0YXRlLCAicnVubmluZyIpKQorICAg
ICAgICByZXR1cm4gRVJST1JfTk9UX1JFQURZOworCitvdXQ6CisgICAgbGlieGxfX3hzd2FpdF9z
dG9wKGdjLCB4c3dhKTsKKyAgICByZXR1cm4gcmM7Cit9CisKIHR5cGVkZWYgc3RydWN0IHBjaV9h
ZGRfc3RhdGUgewogICAgIC8qIGZpbGxlZCBieSB1c2VyIG9mIGRvX3BjaV9hZGQgKi8KICAgICBs
aWJ4bF9fYW9fZGV2aWNlICphb2RldjsKQEAgLTEwNzEsMjEgKzEwOTIsMTQgQEAgc3RhdGljIHZv
aWQgcGNpX2FkZF9xZW11X3RyYWRfd2F0Y2hfc3RhdGVfY2IobGlieGxfX2VnYyAqZWdjLAogICAg
IGxpYnhsX2RvbWlkIGRvbWlkID0gcGFzLT5kb21pZDsKICAgICBsaWJ4bF9kZXZpY2VfcGNpICpw
Y2lkZXYgPSBwYXMtPnBjaWRldjsKIAotICAgIGlmIChyYykgewotICAgICAgICBpZiAocmMgPT0g
RVJST1JfVElNRURPVVQpIHsKLSAgICAgICAgICAgIExPR0QoRVJST1IsIGRvbWlkLCAiJXMgbm90
IHJlYWR5IiwgeHN3YS0+d2hhdCk7Ci0gICAgICAgIH0KLSAgICAgICAgZ290byBvdXQ7Ci0gICAg
fQotCi0gICAgaWYgKCFzdGF0ZSkKLSAgICAgICAgcmV0dXJuOwotICAgIGlmIChzdHJjbXAoc3Rh
dGUsICJydW5uaW5nIikpCisgICAgcmMgPSBjaGVja19xZW11X3J1bm5pbmcoZ2MsIGRvbWlkLCB4
c3dhLCByYywgc3RhdGUpOworICAgIGlmIChyYyA9PSBFUlJPUl9OT1RfUkVBRFkpCiAgICAgICAg
IHJldHVybjsKKyAgICBpZiAocmMpCisgICAgICAgIGdvdG8gb3V0OwogCiAgICAgcmMgPSBxZW11
X3BjaV9hZGRfeGVuc3RvcmUoZ2MsIGRvbWlkLCBwY2lkZXYpOwogb3V0OgotICAgIGxpYnhsX194
c3dhaXRfc3RvcChnYywgeHN3YSk7CiAgICAgcGNpX2FkZF9kbV9kb25lKGVnYywgcGFzLCByYyk7
IC8qIG11c3QgYmUgbGFzdCAqLwogfQogCkBAIC0xODkzLDIyICsxOTA3LDE1IEBAIHN0YXRpYyB2
b2lkIHBjaV9yZW1vdmVfcWVtdV90cmFkX3dhdGNoX3N0YXRlX2NiKGxpYnhsX19lZ2MgKmVnYywK
ICAgICBsaWJ4bF9kb21pZCBkb21pZCA9IHBycy0+ZG9taWQ7CiAgICAgbGlieGxfZGV2aWNlX3Bj
aSAqY29uc3QgcGNpZGV2ID0gcHJzLT5wY2lkZXY7CiAKLSAgICBpZiAocmMpIHsKLSAgICAgICAg
aWYgKHJjID09IEVSUk9SX1RJTUVET1VUKSB7Ci0gICAgICAgICAgICBMT0dEKEVSUk9SLCBkb21p
ZCwgIiVzIG5vdCByZWFkeSIsIHhzd2EtPndoYXQpOwotICAgICAgICB9Ci0gICAgICAgIGdvdG8g
b3V0OwotICAgIH0KLQotICAgIGlmICghc3RhdGUpCi0gICAgICAgIHJldHVybjsKLSAgICBpZiAo
c3RyY21wKHN0YXRlLCAicnVubmluZyIpKQorICAgIHJjID0gY2hlY2tfcWVtdV9ydW5uaW5nKGdj
LCBkb21pZCwgeHN3YSwgcmMsIHN0YXRlKTsKKyAgICBpZiAocmMgPT0gRVJST1JfTk9UX1JFQURZ
KQogICAgICAgICByZXR1cm47CisgICAgaWYgKHJjKQorICAgICAgICBnb3RvIG91dDsKIAogICAg
IHJjID0gcWVtdV9wY2lfcmVtb3ZlX3hlbnN0b3JlKGdjLCBkb21pZCwgcGNpZGV2LCBwcnMtPmZv
cmNlKTsKIAogb3V0OgotICAgIGxpYnhsX194c3dhaXRfc3RvcChnYywgeHN3YSk7CiAgICAgcGNp
X3JlbW92ZV9kZXRhdGNoZWQoZWdjLCBwcnMsIHJjKTsKIH0KIAotLSAKQW50aG9ueSBQRVJBUkQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

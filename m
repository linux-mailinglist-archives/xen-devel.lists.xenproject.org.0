Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8FE1316F3
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 18:41:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioWJa-0007UQ-3f; Mon, 06 Jan 2020 17:37:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nws7=23=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ioWJY-0007UL-Tn
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 17:37:16 +0000
X-Inumbo-ID: 28da4392-30ab-11ea-88e7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28da4392-30ab-11ea-88e7-bc764e2007e4;
 Mon, 06 Jan 2020 17:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578332228;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=+I3LKUW/7R/pIq00V+ne+xhkFOqgWlxS6A9JuuSfvNE=;
 b=gfbEH7NfSooXY9iv8qURaeWh0ISU/lPWinrl1GAwfWA7AlWvudlBA//O
 Si+RLbiXp/lgMv57o66WdpYs+cnAJ7MOgE0abM4Ispeby7/+Xai1Ezi6D
 S8JU3AhznymfMn6QsnfyqChzl94dFN3htTB5n4HjV/0rrWaNvRtYwujml M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SL4Dy1VqKYK075GrjiZyoSGNGZETGfyyS8cLv1eG9LCknzsyNrbC37XkiNAgzvTiGgMmrmfcRp
 WTxk4ldOxJegGlsLgQYPN0a42nPiWLlv9H3l1k8IlCcCdYbf0JdW16wQ+JZAU9nd/DKMiPETXG
 OHMgKLBJ32ZuU9QvklqUGV+nxX2vdP/01VEkyBMXnyns3P4edrmr2FyCbmUZEsR5wVr/b/x4/s
 wNSBES5dq36RscHYap4LI8n6Hgwekf4tg1yUTdTTZE2uK4iTf/wkyvtmBAdnZxnCpJ0KrxUBp+
 7jg=
X-SBRS: 2.7
X-MesageID: 10496308
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,403,1571716800"; d="scan'208";a="10496308"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 6 Jan 2020 17:37:04 +0000
Message-ID: <20200106173704.26433-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/cpupool: Fold error paths in
 cpupool_create()
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGNvbXBpbGVyIGNhbid0IGZvbGQgYmVjYXVzZSBvZiB0aGUgd3JpdGUgdG8gKnBlcnIgaW4g
dGhlIGZpcnN0IGh1bmsuCgpObyBmdW5jdGlvbmFsIGNoYW5nZSwgYnV0IHNsaWdodGx5IGJldHRl
ciBjb21waWxlZCBjb2RlLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
CkNDOiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgotLS0KIHhlbi9jb21tb24v
Y3B1cG9vbC5jIHwgMTUgKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vY3B1cG9vbC5j
IGIveGVuL2NvbW1vbi9jcHVwb29sLmMKaW5kZXggNGQzYWRiZGQ4ZC4uZDY2YjU0MWE5NCAxMDA2
NDQKLS0tIGEveGVuL2NvbW1vbi9jcHVwb29sLmMKKysrIGIveGVuL2NvbW1vbi9jcHVwb29sLmMK
QEAgLTIzNiwxMCArMjM2LDggQEAgc3RhdGljIHN0cnVjdCBjcHVwb29sICpjcHVwb29sX2NyZWF0
ZSgKICAgICB7CiAgICAgICAgIGlmICggKCpxKS0+Y3B1cG9vbF9pZCA9PSBwb29saWQgKQogICAg
ICAgICB7Ci0gICAgICAgICAgICBzcGluX3VubG9jaygmY3B1cG9vbF9sb2NrKTsKLSAgICAgICAg
ICAgIGZyZWVfY3B1cG9vbF9zdHJ1Y3QoYyk7CiAgICAgICAgICAgICAqcGVyciA9IC1FRVhJU1Q7
Ci0gICAgICAgICAgICByZXR1cm4gTlVMTDsKKyAgICAgICAgICAgIGdvdG8gZXJyOwogICAgICAg
ICB9CiAgICAgICAgIGMtPm5leHQgPSAqcTsKICAgICB9CkBAIC0yNTMsMTEgKzI1MSw3IEBAIHN0
YXRpYyBzdHJ1Y3QgY3B1cG9vbCAqY3B1cG9vbF9jcmVhdGUoCiAgICAgewogICAgICAgICBjLT5z
Y2hlZCA9IHNjaGVkdWxlcl9hbGxvYyhzY2hlZF9pZCwgcGVycik7CiAgICAgICAgIGlmICggYy0+
c2NoZWQgPT0gTlVMTCApCi0gICAgICAgIHsKLSAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZjcHVw
b29sX2xvY2spOwotICAgICAgICAgICAgZnJlZV9jcHVwb29sX3N0cnVjdChjKTsKLSAgICAgICAg
ICAgIHJldHVybiBOVUxMOwotICAgICAgICB9CisgICAgICAgICAgICBnb3RvIGVycjsKICAgICB9
CiAgICAgYy0+Z3JhbiA9IG9wdF9zY2hlZF9ncmFudWxhcml0eTsKIApAQCAtMjcwLDYgKzI2NCwx
MSBAQCBzdGF0aWMgc3RydWN0IGNwdXBvb2wgKmNwdXBvb2xfY3JlYXRlKAogCiAgICAgKnBlcnIg
PSAwOwogICAgIHJldHVybiBjOworCisgZXJyOgorICAgIHNwaW5fdW5sb2NrKCZjcHVwb29sX2xv
Y2spOworICAgIGZyZWVfY3B1cG9vbF9zdHJ1Y3QoYyk7CisgICAgcmV0dXJuIE5VTEw7CiB9CiAv
KgogICogZGVzdHJveXMgdGhlIGdpdmVuIGNwdXBvb2wKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

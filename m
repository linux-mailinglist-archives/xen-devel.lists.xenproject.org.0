Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C86AA7FC
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 18:09:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5uFN-0003wu-2F; Thu, 05 Sep 2019 16:04:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lv1E=XA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i5uFL-0003wp-W5
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 16:04:32 +0000
X-Inumbo-ID: d7d7b62e-cff6-11e9-abd4-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7d7b62e-cff6-11e9-abd4-12813bfff9fa;
 Thu, 05 Sep 2019 16:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567699470;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WltwFT22+xXaN0wbWq6MqUS8hNMMvE6LsSITdqH2cBU=;
 b=IyNWSzuRNHaF11sjvFiNtqH/abNT8j+xMxc4fke1iSzadR6gpqOvA7mg
 B7WXYdBwWsQ6Oi5YRlNzl3WqfKXrwSLIuPxhht6HQQ9ELUMMoemu21qx3
 cdu1sJxKEbAy4rCCuaGFaddskaicMtNYIbQQ0/aIS6TwSzrIGwt2MUhFL c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jU263I5OMh4HHq3tjpAUSHvJRy31I4uVwFbBH92E9DUGimdqDxBOCy/gzuV+h5KSWQZ22mJjJk
 0GxhSWUQcaasuD3SPCwjdW4XXRzXdrpVeF3rUZyjMmJ4wu3cNB79FhpWTWuoqC19cL6ODlMliV
 J/am3a4IQXQgN7KnOF3Uq144kCwXH4R/J8xsi1JBrtdU7OyC8U1OdCq73kIA6ry9CcfQ909ThD
 X/uArAyFOgiQtWjHoVf5rmzooIaagU5GGb5jKXslfzueOaq4kP5j5nS7NQTsDa5+vL2MaeQzJY
 gno=
X-SBRS: 2.7
X-MesageID: 5465982
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,470,1559534400"; 
   d="scan'208";a="5465982"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 5 Sep 2019 18:04:24 +0200
Message-ID: <20190905160424.6686-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] xstate: make use_xsave non-init
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TExWTSBjb2RlIGdlbmVyYXRpb24gY2FuIGF0dGVtcHQgdG8gbG9hZCBmcm9tIGEgdmFyaWFibGUg
aW4gdGhlIG5leHQKY29uZGl0aW9uIG9mIGFuIGV4cHJlc3Npb24gdW5kZXIgY2VydGFpbiBjaXJj
dW1zdGFuY2VzLCB0aHVzCmF0dGVtcHRpbmcgdG8gbG9hZCB1c2VfeHNhdmUgcmVnYXJkbGVzcyBv
ZiB0aGUgdmFsdWUgb2YgdGhlIGJzcAp2YXJpYWJsZSwgd2hpY2ggbGVhZHMgdG8gYSBwYWdlIGZh
dWx0IHdoZW4gdGhlIGluaXQgc2VjdGlvbiBoYXMKYWxyZWFkeSBiZWVuIHVubWFwcGVkLgoKRml4
IHRoaXMgYnkgbWFraW5nIHVzZV94c2F2ZSBub24taW5pdCwgdGh1cyBwcmV2ZW50aW5nIHRoZSBw
YWdlIGZhdWx0LgpUaGUgTExWTSBidWcgd2l0aCB0aGUgZGlzY3Vzc2lvbiBhYm91dCB0aGlzIGlz
c3VlIGNhbiBiZSBmb3VuZCBhdDoKCmh0dHBzOi8vYnVncy5sbHZtLm9yZy9zaG93X2J1Zy5jZ2k/
aWQ9Mzk3MDcKClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni94c3RhdGUuYyB8IDYgKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L3hzdGF0ZS5jIGIveGVuL2FyY2gveDg2L3hzdGF0ZS5jCmluZGV4IDMyOTNlZjgzNGYu
LjFkZGRkYTI4MTggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni94c3RhdGUuYworKysgYi94ZW4v
YXJjaC94ODYveHN0YXRlLmMKQEAgLTU3Nyw3ICs1NzcsMTEgQEAgdW5zaWduZWQgaW50IHhzdGF0
ZV9jdHh0X3NpemUodTY0IHhjcjApCiAvKiBDb2xsZWN0IHRoZSBpbmZvcm1hdGlvbiBvZiBwcm9j
ZXNzb3IncyBleHRlbmRlZCBzdGF0ZSAqLwogdm9pZCB4c3RhdGVfaW5pdChzdHJ1Y3QgY3B1aW5m
b194ODYgKmMpCiB7Ci0gICAgc3RhdGljIGJvb2wgX19pbml0ZGF0YSB1c2VfeHNhdmUgPSB0cnVl
OworICAgIC8qCisgICAgICogTkI6IHVzZV94c2F2ZSBjYW5ub3QgbGl2ZSBpbiBpbml0ZGF0YSBi
ZWNhdXNlIGxsdm0gbWlnaHQgb3B0aW1pemUKKyAgICAgKiByZWFkaW5nIGl0LCBzZWU6IGh0dHBz
Oi8vYnVncy5sbHZtLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9Mzk3MDcKKyAgICAgKi8KKyAgICBzdGF0
aWMgYm9vbCB1c2VfeHNhdmUgPSB0cnVlOwogICAgIGJvb2xlYW5fcGFyYW0oInhzYXZlIiwgdXNl
X3hzYXZlKTsKIAogICAgIGJvb2wgYnNwID0gYyA9PSAmYm9vdF9jcHVfZGF0YTsKLS0gCjIuMjIu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

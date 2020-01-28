Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 094F514BA98
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 15:40:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwRzP-0003q9-Vc; Tue, 28 Jan 2020 14:37:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z4m8=3R=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iwRzO-0003q4-4q
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 14:37:14 +0000
X-Inumbo-ID: ab6cb43f-41db-11ea-86f1-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab6cb43f-41db-11ea-86f1-12813bfff9fa;
 Tue, 28 Jan 2020 14:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580222233;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=bmHOQwZwd/AeJ/ESK/HOFZrHzXYiLXYX7Zvg3mcXVcE=;
 b=AGEONsCfloV6MsdLtj8YtpfFJQx51S8yH6FfSgp6mHfFW0JJcLPs/85e
 p8uOfmIbJT+SFdL0/cI6H4A0qY0CtLK+mF02HSmQSOyjZ2YG9wE4OJFo9
 f81neupK9SnflLXjHAU9oZGV//euC1uitnGcm6xVyplC+IFS3/67VOQB6 c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DPK1JpnJNIBqj/iPX/l/dRGanv2EWmJxOXyiTaq/Vfv6hGF9hEuNGLgbUDtbVpvDa3xku6cloB
 lpqva05oXpG1ogN67yNCOihnqJgL3CXHfIlNKQq9hMIH4TXoF15ypqz1rteysEkZE4eeXxSxJt
 y/xxMdDtUIzxuFe94D/MAtB215i3/HvRNRIZjfRXUp5zeCW45mqZZaWwjBQH2kDTtqxJkvvQ7s
 lP0q7815XSafQHdOYQa4s7m5kFTqaVMaRJrwXiWv7vlfeUZ/kJd/D0emI4tclVdRBJLhQvT2mV
 U3g=
X-SBRS: 2.7
X-MesageID: 11548060
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,374,1574139600"; d="scan'208";a="11548060"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 28 Jan 2020 14:37:08 +0000
Message-ID: <1580222228-21828-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] x86/suspend: disable watchdog before calling
 console_start_sync()
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
Cc: andrew.cooper3@citrix.com, Igor Druzhinin <igor.druzhinin@citrix.com>,
 wl@xen.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uIGFuZCBlbmFibGUgaXQgYWZ0ZXIgZXhpdGluZyBTLXN0YXRlLiBPdGhlcndpc2UgYWNjdW11
bGF0ZWQKb3V0cHV0IGluIHNlcmlhbCBidWZmZXIgbWlnaHQgZWFzaWx5IHRyaWdnZXIgdGhlIHdh
dGNoZG9nIGlmIGl0J3MKc3RpbGwgZW5hYmxlZCBhZnRlciBlbnRlcmluZyBzeW5jIHRyYW5zbWlz
c2lvbiBtb2RlLgoKVGhlIGlzc3VlIG9ic2VydmVkIG9uIG1hY2hpbmVzIHdoaWNoLCB1bmZvcnR1
bmF0ZWx5LCBnZW5lcmF0ZSBub24tMApvdXRwdXQgaW4gQ1BVIG9mZmxpbmUgY2FsbGJhY2tzLgoK
U2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+
Ci0tLQogeGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMg
Yi94ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5jCmluZGV4IDgwNzgzNTIuLmZlYjBmNmMgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMKKysrIGIveGVuL2FyY2gveDg2L2FjcGkv
cG93ZXIuYwpAQCAtMjMsNiArMjMsNyBAQAogI2luY2x1ZGUgPHhlbi9kb21haW4uaD4KICNpbmNs
dWRlIDx4ZW4vY29uc29sZS5oPgogI2luY2x1ZGUgPHhlbi9pb21tdS5oPgorI2luY2x1ZGUgPHhl
bi93YXRjaGRvZy5oPgogI2luY2x1ZGUgPHhlbi9jcHUuaD4KICNpbmNsdWRlIDxwdWJsaWMvcGxh
dGZvcm0uaD4KICNpbmNsdWRlIDxhc20vdGJvb3QuaD4KQEAgLTIyMyw2ICsyMjQsNyBAQCBzdGF0
aWMgaW50IGVudGVyX3N0YXRlKHUzMiBzdGF0ZSkKIAogICAgIGFjcGlfc2xlZXBfcHJlcGFyZShz
dGF0ZSk7CiAKKyAgICB3YXRjaGRvZ19kaXNhYmxlKCk7CiAgICAgY29uc29sZV9zdGFydF9zeW5j
KCk7CiAgICAgcHJpbnRrKCJFbnRlcmluZyBBQ1BJIFMlZCBzdGF0ZS5cbiIsIHN0YXRlKTsKIApA
QCAtMjM1LDYgKzIzNyw3IEBAIHN0YXRpYyBpbnQgZW50ZXJfc3RhdGUodTMyIHN0YXRlKQogICAg
ICAgICBzeXN0ZW1fc3RhdGUgPSBTWVNfU1RBVEVfcmVzdW1lOwogICAgICAgICBkZXZpY2VfcG93
ZXJfdXAoZXJyb3IpOwogICAgICAgICBjb25zb2xlX2VuZF9zeW5jKCk7CisgICAgICAgIHdhdGNo
ZG9nX2VuYWJsZSgpOwogICAgICAgICBlcnJvciA9IC1FSU87CiAgICAgICAgIGdvdG8gZG9uZTsK
ICAgICB9CkBAIC0yODEsNiArMjg0LDcgQEAgc3RhdGljIGludCBlbnRlcl9zdGF0ZSh1MzIgc3Rh
dGUpCiAgICAgICAgIHRib290X3MzX2Vycm9yKGVycm9yKTsKIAogICAgIGNvbnNvbGVfZW5kX3N5
bmMoKTsKKyAgICB3YXRjaGRvZ19lbmFibGUoKTsKIAogICAgIG1pY3JvY29kZV91cGRhdGVfb25l
KHRydWUpOwogCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=

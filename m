Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7E1AA67B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 16:51:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5t47-00055X-L2; Thu, 05 Sep 2019 14:48:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lv1E=XA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i5t45-00055L-R0
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 14:48:49 +0000
X-Inumbo-ID: 44ec2cdc-cfec-11e9-978d-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44ec2cdc-cfec-11e9-978d-bc764e2007e4;
 Thu, 05 Sep 2019 14:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567694930;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZAQhjPuVhsEobiYr3OBA4q8k62PUZ64H0k0OKGJYbgE=;
 b=GmEQqIYeODIFSFQJS6YOkakQDCY4vrFq8p3Nk4YXVZJNjgupEXOUKWbs
 Yq7/T/vLheyZf7YRO+HnUckIweE7CvTU53/Cp96iH0yQUM5lrrQn3hh3+
 2mXU0Hk6oP8PddtFcADDRc2oBYJQ9MXYBvuMomjN+xEtOidbPI+qlLcpn w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ho+Fb/7/2WEgZfLqvaUt6lrQfHuiJC08pYl2K2OfyT8oKXz5BhmC6tAbsi0A3WePSao3w1YHT8
 LPyDSNpKXrsbS/GCQ6Hj8o3EIWOP3TuoPn7p4e7bOty8j8IcTUsxZEtioYz/b5i95dipCMRdxc
 kJJqJ7IGmP4/d4Ndj7+OCP2jtNNgYCx4zgbLzTJEqqEgXjSmjYGpH3gR98VggbRP5BUaTOGfja
 NeJuJHKfsmUoqgVf8ddD0CTpo4SEiYImdMEauvpMW4biuKn+2ZzratgsEwwUa0fpvb3JGZFgq2
 QPE=
X-SBRS: 2.7
X-MesageID: 5189657
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,470,1559534400"; 
   d="scan'208";a="5189657"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 5 Sep 2019 16:48:31 +0200
Message-ID: <20190905144835.6035-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/4] build: honor toolchain related
 environment vars
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Doug Goldstein <cardoe@cardoe.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpDdXJyZW50IFhlbiBidWlsZCBzeXN0ZW0gd2lsbCBpZ25vcmUgYW55IHRvb2xjaGFp
biByZWxhdGVkIHZhcmlhYmxlcyBvbgp0aGUgZW52aXJvbm1lbnQgd2hlbiBidWlsZGluZyAoaWU6
IENDLCBMRCwgQ1hYLi4uKSwgYW5kIHRoZSBvbmx5IHdheSB0bwpzZXQgdGhvc2UgaXMgdG8gYXNz
aWduIHRoZW0gZGlyZWN0bHkgb24gdGhlIG1ha2UgY29tbWFuZCBsaW5lIChpZTogbWFrZQpDQz1m
b28gQ1hYPWJhciAuLi4pLgoKVGhlIGZvbGxvd2luZyBzZXJpZXMgYXR0ZW1wdHMgdG8gZml4IHRo
aXMsIGJ5IHJlbW92aW5nIHRoZSBoYXJkY29kaW5nIG9mCnRoZSB0b29sY2hhaW4gdmFyaWFibGVz
IHByZXZpb3VzbHkgZG9uZSBpbiBTdGRHTlUubWsuCgpOb3RlIHRoYXQgdGhpcyBoYXMgdGhlIHNp
ZGUgZWZmZWN0IHRoYXQgdGhlIGJ1aWxkIHN5c3RlbSB3aWxsIG5vIGxvbmdlcgpwcmVwZW5kIENS
T1NTX0NPTVBJTEUgdG8gdGhlIHRvb2xjaGFpbiB2YXJpYWJsZXMgaWYgdGhvc2UgYXJlIGFscmVh
ZHkKc2V0LiBTbyBpZiB5b3UgYXJlIGJ1aWxkaW5nIFhlbiBhbmQgc2V0dGluZyBDUk9TU19DT01Q
SUxFIG1ha2Ugc3VyZQp0b29sY2hhaW4gdmFyaWFibGVzIGFyZSB1bnNldCwgb3IgaWYgc2V0IHRo
ZXkgc2hvdWxkIGNvbnRhaW4KQ1JPU1NfQ09NUElMRS4gVGhlIFRyYXZpcyBDSSBzY3JpcHQgaXMg
dXBkYXRlZCBpbiBwYXRjaCAzLzQgaW4gb3JkZXIgdG8KY29tcGx5IHdpdGggdGhlIGFib3ZlLgoK
VGhpcyBpcyB2MiBiZWNhdXNlIHYxIHdhcyBtaXNzaW5nIHRoZSBmaXJzdCBwYXRjaCwgcmVuZGVy
aW5nIHRoZSB3aG9sZQpzZXJpZXMgdXNlbGVzcy4gQXBhcnQgZnJvbSB0aGF0IHRoZXJlIGFyZSBu
byBjaGFuZ2VzIGZyb20gdjEuCgpUaGUgc2VyaWVzIGNhbiBiZSBmb3VuZCBhdDoKCmdpdDovL3hl
bmJpdHMueGVuLm9yZy9wZW9wbGUvcm95Z2VyL3hlbi5naXQgZW52X3Rvb2xzCgpSZXN1bHRzIGZy
b20gVHJhdmlzIGFuZCBnaXRsYWIgQ0kgbG9vcHMgYXJlIGF0OgoKaHR0cHM6Ly90cmF2aXMtY2ku
b3JnL3JveWdlci94ZW4vYnVpbGRzLzU4MTEzOTM4OApodHRwczovL2dpdGxhYi5jb20veGVuLXBy
b2plY3QvcGVvcGxlL3JveWdlci94ZW4vcGlwZWxpbmVzLzgwNDQwNjQ4CgpUaGFua3MsIFJvZ2Vy
LgoKUm9nZXIgUGF1IE1vbm5lICg0KToKICBidWlsZDogc2V0IEhPU1R7Q0MvQ1hYfSwgY2xhbmcg
YW5kIGdjYyBpbiBTdGRHTlUubWsKICBrY29uZmlnOiBpbmNsdWRlIGRlZmF1bHQgdG9vbGNoYWlu
IHZhbHVlcwogIGJ1aWxkOiBhbGxvdyBwaWNraW5nIHRoZSBlbnYgdmFsdWVzIGZvciBjb21waWxl
ciB2YXJpYWJsZXMKICBidWlsZDogYWxsb3cgcGlja2luZyB0aGUgZW52IHZhbHVlcyBmb3IgdG9v
bGNoYWluIHV0aWxpdGllcwoKIENvbmZpZy5tayAgICAgICAgICAgICAgICAgICAgICAgICAgfCAx
OCAtLS0tLS0tLS0tCiBjb25maWcvU3RkR05VLm1rICAgICAgICAgICAgICAgICAgIHwgNTMgKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tCiBzY3JpcHRzL3RyYXZpcy1idWlsZCAgICAgICAg
ICAgICAgIHwgIDggKysrKysKIHhlbi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgfCAg
NiArKy0tCiB4ZW4vdG9vbHMva2NvbmZpZy9NYWtlZmlsZS5rY29uZmlnIHwgIDcgKystLQogNSBm
aWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCA0MiBkZWxldGlvbnMoLSkKCi0tIAoyLjIy
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

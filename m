Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3932181F4A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 18:24:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC52D-0002zx-Sw; Wed, 11 Mar 2020 17:20:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V419=44=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jC52D-0002zk-8g
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 17:20:45 +0000
X-Inumbo-ID: a0525679-63bc-11ea-b027-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0525679-63bc-11ea-b027-12813bfff9fa;
 Wed, 11 Mar 2020 17:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583947238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yPIugyZ+fj++irY3fYM/ZRIAMkQlMlmC6H1RGvWA3ug=;
 b=RCTWZa3zK1GOw76aD/e8ajKSjuY0LAFvecWuhCHF4lZCLM6gzanjdMMr
 3fhArwQ23hB4mFNH7a6xDADeYTOdHNnryYMGc2VfXRYvmzUYz+Lz0p2cL
 TKp1R7DaTlGxWbGLKNabGy/pxpHTUFfX9YPqGVD65srigdXVpAL4GfN1x g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vfiJrD0qOCmRGkD1z8UEWEGGuFS6hWB+B1rcVAotTqbU0eNOhySB8yQbhV2Kc6gqyy8eN7l69r
 H/upVuWKhqDbeHsKzWx2vZclhsAQcsZSoJOSQ6HDJdwnck8P4wQUbkANJ84heSgtI3tkJOFlPf
 bEVWWE7DAJtvHePk2SdEx8yV5zR+ufPwfSe9qAyBbUbIARBLQ31oBmAVH5uokHk041T2waMcwk
 AOp8eSh8zo5GSY9pO2x8tZhNQxKfLlOU4m4PEBm8nAz8zPtpvjqul0MGC94xOrxqsxAGKm7bZc
 bfs=
X-SBRS: 2.7
X-MesageID: 14128994
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,541,1574139600"; d="scan'208";a="14128994"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 11 Mar 2020 18:20:09 +0100
Message-ID: <20200311172010.7777-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200311172010.7777-1-roger.pau@citrix.com>
References: <20200311172010.7777-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH OSSTEST v5 5/5] make-flight: add dom0 PVH test
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
Cc: ian.jackson@eu.citrix.com, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGEgZG9tMCBQVkggdGVzdCwgdGhlIHRlc3QgdG8gYmUgcnVuIGlzIGxhdW5jaGluZyBhIFBW
IGd1ZXN0Cih0ZXN0LWRlYmlhbikuIE5vdGUgdGhlIFBWSCBkb20wIHRlc3RzIGFyZSBvbmx5IGVu
YWJsZWQgZm9yIFhlbiA+PQo0LjEzLgoKVGhlIHJ1bnZhciBkaWZmZXJlbmNlIGlzOgoKK3Rlc3Qt
YW1kNjQtYW1kNjQtZG9tMHB2aC14bC1hbWQgICBhbGxfaG9zdF9kaV92ZXJzaW9uIDIwMjAtMDIt
MTAKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1pbnRlbCBhbGxfaG9zdF9kaV92ZXJzaW9u
IDIwMjAtMDItMTAKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1hbWQgICBhbGxfaG9zdF9z
dWl0ZSAgICAgIHN0cmV0Y2gKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1pbnRlbCBhbGxf
aG9zdF9zdWl0ZSAgICAgIHN0cmV0Y2gKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1hbWQg
ICBhbGxfaG9zdGZsYWdzICAgICAgIGFyY2gtYW1kNjQsYXJjaC14ZW4tYW1kNjQsc3VpdGUtc3Ry
ZXRjaCxwdXJwb3NlLXRlc3QsaHZtLWFtZCxpb21tdQordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZo
LXhsLWludGVsIGFsbF9ob3N0ZmxhZ3MgICAgICAgYXJjaC1hbWQ2NCxhcmNoLXhlbi1hbWQ2NCxz
dWl0ZS1zdHJldGNoLHB1cnBvc2UtdGVzdCxodm0taW50ZWwsaW9tbXUKK3Rlc3QtYW1kNjQtYW1k
NjQtZG9tMHB2aC14bC1hbWQgICBhcmNoICAgICAgICAgICAgICAgIGFtZDY0Cit0ZXN0LWFtZDY0
LWFtZDY0LWRvbTBwdmgteGwtaW50ZWwgYXJjaCAgICAgICAgICAgICAgICBhbWQ2NAordGVzdC1h
bWQ2NC1hbWQ2NC1kb20wcHZoLXhsLWFtZCAgIGJ1aWxkam9iICAgICAgICAgICAgYnVpbGQtYW1k
NjQKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1pbnRlbCBidWlsZGpvYiAgICAgICAgICAg
IGJ1aWxkLWFtZDY0Cit0ZXN0LWFtZDY0LWFtZDY0LWRvbTBwdmgteGwtYW1kICAgZGViaWFuX2Fy
Y2ggICAgICAgICBhbWQ2NAordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhsLWludGVsIGRlYmlh
bl9hcmNoICAgICAgICAgYW1kNjQKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1hbWQgICBk
ZWJpYW5fa2VybmtpbmQgICAgIHB2b3BzCit0ZXN0LWFtZDY0LWFtZDY0LWRvbTBwdmgteGwtaW50
ZWwgZGViaWFuX2tlcm5raW5kICAgICBwdm9wcwordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhs
LWFtZCAgIGRlYmlhbl9zdWl0ZSAgICAgICAgc3RyZXRjaAordGVzdC1hbWQ2NC1hbWQ2NC1kb20w
cHZoLXhsLWludGVsIGRlYmlhbl9zdWl0ZSAgICAgICAgc3RyZXRjaAordGVzdC1hbWQ2NC1hbWQ2
NC1kb20wcHZoLXhsLWFtZCAgIGtlcm5idWlsZGpvYiAgICAgICAgYnVpbGQtYW1kNjQtcHZvcHMK
K3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1pbnRlbCBrZXJuYnVpbGRqb2IgICAgICAgIGJ1
aWxkLWFtZDY0LXB2b3BzCit0ZXN0LWFtZDY0LWFtZDY0LWRvbTBwdmgteGwtYW1kICAga2Vybmtp
bmQgICAgICAgICAgICBwdm9wcwordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhsLWludGVsIGtl
cm5raW5kICAgICAgICAgICAgcHZvcHMKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1hbWQg
ICB0b29sc3RhY2sgICAgICAgICAgIHhsCit0ZXN0LWFtZDY0LWFtZDY0LWRvbTBwdmgteGwtaW50
ZWwgdG9vbHN0YWNrICAgICAgICAgICB4bAordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhsLWFt
ZCAgIHhlbl9ib290X2FwcGVuZCAgICAgZG9tMD1wdmgsdmVyYm9zZQordGVzdC1hbWQ2NC1hbWQ2
NC1kb20wcHZoLXhsLWludGVsIHhlbl9ib290X2FwcGVuZCAgICAgZG9tMD1wdmgsdmVyYm9zZQoK
U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+ClJl
dmlld2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCkNo
YW5nZXMgc2luY2UgdjE6CiAtIFJlcXVlc3QgaG9zdHMgd2l0aCBpb21tdSBmbGFnLgotLS0KIG1h
a2UtZmxpZ2h0IHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
MjQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL21ha2UtZmxpZ2h0IGIvbWFrZS1mbGlnaHQK
aW5kZXggYjA4NDMxZGMuLjQ4ZjE2NGNjIDEwMDc1NQotLS0gYS9tYWtlLWZsaWdodAorKysgYi9t
YWtlLWZsaWdodApAQCAtNzUzLDYgKzc1MywxNiBAQCB0ZXN0X21hdHJpeF9kb19vbmUgKCkgewog
ICAqKSAgICAgICAgICAgICAgICB0ZXN0X3NoaW09eSA7OwogICBlc2FjCiAKKyAgIyBQVkggZG9t
MCB0ZXN0cyBmb3IgdmVyc2lvbnMgPj0gNC4xMyBvbmx5CisgIGNhc2UgIiR4ZW5icmFuY2giIGlu
CisgIHhlbi0zLiotdGVzdGluZykgIHRlc3RfZG9tMHB2aD1uIDs7CisgIHhlbi00Lj8tdGVzdGlu
ZykgIHRlc3RfZG9tMHB2aD1uIDs7CisgIHhlbi00LjEwLXRlc3RpbmcpIHRlc3RfZG9tMHB2aD1u
IDs7CisgIHhlbi00LjExLXRlc3RpbmcpIHRlc3RfZG9tMHB2aD1uIDs7CisgIHhlbi00LjEyLXRl
c3RpbmcpIHRlc3RfZG9tMHB2aD1uIDs7CisgICopICAgICAgICAgICAgICAgIHRlc3RfZG9tMHB2
aD15IDs7CisgIGVzYWMKKwogICAjIHhlbmQgUFYgZ3Vlc3QgdGVzdCBvbiB4ODYgb25seQogICBp
ZiBbIHgkdGVzdF94ZW5kID0geHkgLWEgXCggJGRvbTBhcmNoID0gImkzODYiIC1vICRkb20wYXJj
aCA9ICJhbWQ2NCIgXCkgXTsgdGhlbgogICAgIGpvYl9jcmVhdGVfdGVzdCB0ZXN0LSR4ZW5hcmNo
JGtlcm4tJGRvbTBhcmNoLXB2IHRlc3QtZGViaWFuIHhlbmQgXApAQCAtODYxLDYgKzg3MSwyMCBA
QCB0ZXN0X21hdHJpeF9kb19vbmUgKCkgewogCiAgIGZpCiAKKyAgaWYgWyB4JHRlc3RfZG9tMHB2
aCA9IHh5IC1hICR4ZW5hcmNoID0gYW1kNjQgLWEgJGRvbTBhcmNoID0gYW1kNjQgXTsgdGhlbgor
CisgICAgZm9yIGNwdXZlbmRvciBpbiBhbWQgaW50ZWw7IGRvCisKKyAgICAgIGpvYl9jcmVhdGVf
dGVzdCB0ZXN0LSR4ZW5hcmNoJGtlcm4tJGRvbTBhcmNoLWRvbTBwdmgteGwtJGNwdXZlbmRvciBc
CisgICAgICAgICAgICAgICAgdGVzdC1kZWJpYW4geGwgJHhlbmFyY2ggJGRvbTBhcmNoICRkZWJp
YW5fcnVudmFycyBcCisgICAgICAgICAgICAgICAgYWxsX2hvc3RmbGFncz0kbW9zdF9ob3N0Zmxh
Z3MsaHZtLSRjcHV2ZW5kb3IsaW9tbXUgXAorICAgICAgICAgICAgICAgIHhlbl9ib290X2FwcGVu
ZD0nZG9tMD1wdmgsdmVyYm9zZScKKworICAgIGRvbmUKKworICBmaQorCisKICAgaWYgWyB4JHRl
c3Rfc2hpbSA9IHh5IC1hICR4ZW5hcmNoID0gYW1kNjQgXTsgdGhlbgogCiAgICAgam9iX2NyZWF0
ZV90ZXN0IHRlc3QtJHhlbmFyY2gka2Vybi0kZG9tMGFyY2gteGwtcHZzaGltIFwKLS0gCjIuMjUu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

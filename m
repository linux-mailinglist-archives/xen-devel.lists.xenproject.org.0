Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B7AEA305
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 19:09:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPsNB-0003SB-Rs; Wed, 30 Oct 2019 18:07:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jdra=YX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iPsN9-0003S1-UI
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 18:07:07 +0000
X-Inumbo-ID: 1543ecfc-fb40-11e9-beca-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1543ecfc-fb40-11e9-beca-bc764e2007e4;
 Wed, 30 Oct 2019 18:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572458826;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N07H2kf7HSsjLSG1K+6RK9CpIu5/XYoeTgQRDCHj4As=;
 b=J6HKRJAnFok7F1AmC+REJsB9MF3HI9zDKCond5LGdyCklOfNk0IFua5x
 zIGHzhPEBmu8zMf9lqChj7/iw+NtNf4GF/Ty/e0AnBgpg9GofSPzP4SDk
 f0vKTQvvioZ43ka371riqGnN+8UYbQ6nT4rL7U9HED1dzoNjXVc0D4/OO 8=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BKFVP8IklADFpELRwXIjyobjsXFG6sX66kC4Gxt1irSpUQ2OUEdCX5Xe+lBdku8RCdNiiF314N
 PafnUS1rjKkzPJRiplqnkiN55alfCFu7a7ITGoPO1m6hyFGScFsIq3H3uWflU75MmDX2TPXKIK
 hbEjqofoQGG3+rVj/FDxf++AKDzsiQP/gZhaRO/pjw/iqgyFQOzSlPREbJ9L5NrY6BUZ7yOv8O
 qsVRe+u5KsOMabDSg4nr026npX7D220J5Y0l2fFcqrwW5H7drE8pAnbD6951gL2LrHfdHXd1EQ
 O/M=
X-SBRS: 2.7
X-MesageID: 8109820
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,248,1569297600"; 
   d="scan'208";a="8109820"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 30 Oct 2019 18:06:58 +0000
Message-ID: <20191030180704.261320-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v2 0/6] Fix: libxl workaround,
 multiple connection to single QMP socket
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
 =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2ggc2VyaWVzIGF2YWlsYWJsZSBpbiB0aGlzIGdpdCBicmFuY2g6Cmh0dHBzOi8veGVuYml0
cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9hcGVyYXJkL3hlbi11bnN0YWJsZS5naXQgYnIuZml4
LWV2X3FtcC1tdWx0aS1jb25uZWN0LXYyCgpIaSwKClFFTVUncyBRTVAgc29ja2V0IGRvZXNuJ3Qg
YWxsb3cgbXVsdGlwbGUgY29uY3VycmVudCBjb25uZWN0aW9uLiBBbHNvLCBpdApsaXN0ZW4oKSBv
biB0aGUgc29ja2V0IHdpdGggYSBgYmFja2xvZycgb2Ygb25seSAxLiBPbiBMaW51eCBhdCBsZWFz
dCwgb25jZSB0aGF0CmJhY2tsb2cgaXMgZmlsbGVkIGNvbm5lY3QoKSB3aWxsIHJldHVybiBFQUdB
SU4gaWYgdGhlIHNvY2tldCBmZCBpcwpub24tYmxvY2tpbmcuIGxpYnhsIG1heSBhdHRlbXB0IG1h
bnkgY29uY3VycmVudCBjb25uZWN0KCkgYXR0ZW1wdCBpZiBmb3IKZXhhbXBsZSBhIGd1ZXN0IGlz
IHN0YXJ0ZWQgd2l0aCBzZXZlcmFsIFBDSSBwYXNzdGhyb3VnaCBkZXZpY2VzLCBhbmQgYQpjb25u
ZWN0KCkgZmFpbHVyZSBsZWFkIHRvIGEgZmFpbHVyZSB0byBzdGFydCB0aGUgZ3Vlc3QuCgpTaW5j
ZSB3ZSBjYW4ndCBjaGFuZ2UgdGhlIGxpc3RlbigpJ3MgYGJhY2tsb2cnIHRoYXQgUUVNVSB1c2Us
IHdlIG5lZWQgb3RoZXIKd2F5cyB0byB3b3JrYXJvdW5kIHRoZSBpc3N1ZS4gVGhpcyBwYXRjaCBz
ZXJpZXMgaW50cm9kdWNlIGEgbG9jayB0byBhY3F1aXJlCmJlZm9yZSBhdHRlbXB0aW5nIHRvIGNv
bm5lY3QoKSB0byB0aGUgUU1QIHNvY2tldC4gU2luY2UgdGhlIGxvY2sgbWlnaHQgYmUgaGVsZApm
b3IgdG8gbG9uZywgdGhlIHNlcmllcyBhbHNvIGludHJvZHVjZSBhIHdheSB0byBjYW5jZWwgdGhl
IGFjcXVpc2l0aW9uIG9mIHRoZQpsb2NrLCB0aGlzIG1lYW5zIGtpbGxpbmcgdGhlIHByb2Nlc3Mg
dGhhdCB0cmllcyB0byBnZXQgdGhlIGxvY2suCgpTZWUgdGhyZWFkWzFdIGZvciBkaXNjdXNzZWQg
YWx0ZXJuYXRpdmUuClsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0
bWwveGVuLWRldmVsLzIwMTktMTAvbXNnMDE4MTUuaHRtbAoKQ2hlZXJzLAoKQW50aG9ueSBQRVJB
UkQgKDYpOgogIGxpYnhsOiBJbnRyb2R1Y2UgbGlieGxfX2V2X2NoaWxkX2tpbGxfZGVyZWdpc3Rl
cgogIGxpYnhsOiBNb3ZlIGxpYnhsX19ldl9kZXZsb2NrIGRlY2xhcmF0aW9uCiAgbGlieGw6IFJl
bmFtZSBldl9kZXZsb2NrIHRvIGV2X3Nsb3dsb2NrCiAgbGlieGw6IEludHJvZHVjZSBsaWJ4bF9f
ZXZfc2xvd2xvY2tfZGlzcG9zZQogIGxpYnhsOiBsaWJ4bF9fZXZfcW1wX3NlbmQgbm93IHRha2Vz
IGFuIGVnYwogIGxpYnhsX3FtcDogSGF2ZSBhIGxvY2sgZm9yIFFNUCBzb2NrZXQgYWNjZXNzCgog
dG9vbHMvbGlieGwvbGlieGxfZGlzay5jICAgICAgICB8ICAxNiArKy0tCiB0b29scy9saWJ4bC9s
aWJ4bF9kbS5jICAgICAgICAgIHwgICA4ICstCiB0b29scy9saWJ4bC9saWJ4bF9kb21fc2F2ZS5j
ICAgIHwgICAyICstCiB0b29scy9saWJ4bC9saWJ4bF9kb21fc3VzcGVuZC5jIHwgICAyICstCiB0
b29scy9saWJ4bC9saWJ4bF9kb21haW4uYyAgICAgIHwgIDE4ICsrLS0tCiB0b29scy9saWJ4bC9s
aWJ4bF9ldmVudC5jICAgICAgIHwgICA2ICstCiB0b29scy9saWJ4bC9saWJ4bF9mb3JrLmMgICAg
ICAgIHwgIDQ4ICsrKysrKysrKysrKwogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuYyAgICB8
ICA0MSArKysrKysrLS0tCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oICAgIHwgMTMwICsr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiB0b29scy9saWJ4bC9saWJ4bF9wY2kuYyAg
ICAgICAgIHwgICA4ICstCiB0b29scy9saWJ4bC9saWJ4bF9xbXAuYyAgICAgICAgIHwgMTE5ICsr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tCiB0b29scy9saWJ4bC9saWJ4bF91c2IuYyAgICAg
ICAgIHwgIDI4ICsrKystLS0KIDEyIGZpbGVzIGNoYW5nZWQsIDMwMSBpbnNlcnRpb25zKCspLCAx
MjUgZGVsZXRpb25zKC0pCgotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs

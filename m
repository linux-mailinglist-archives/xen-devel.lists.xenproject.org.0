Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3087E51FA
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 19:07:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO31c-0000IG-Iv; Fri, 25 Oct 2019 17:05:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eA7w=YS=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iO31a-0000H4-BP
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 17:05:18 +0000
X-Inumbo-ID: 9bd2a9b6-f749-11e9-94ca-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9bd2a9b6-f749-11e9-94ca-12813bfff9fa;
 Fri, 25 Oct 2019 17:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572023113;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4prpr1vdO3/rdacU8WvgCbL7QJ8W2tBd9fxhR0L2XDY=;
 b=a3COAQpEcula7SSbi4CMwmpnYsNiSkj+3rDakJazi69ysCgEWQiccDuZ
 cjiJb7oMgeDM5GJscQ1bdbzQLPz+jBo0FF6l48+V3pG3Kwi8udKmjQfXD
 6N12R39ZMwXcJIURF+E6DauJDiAc2UUaPaJJI4kjn2IYmPFG0uI7393ri E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AwGxBRauepDPLSO6KYPRrw7s1f5YDHqs/tYAktT9+uQstI/dgJLL7WU0+3gyc2zPxoDkHk+vzT
 zjDXG0zPHXSAONS2k79JINOfFVRtKFT8RYNjAyllDken9UnEPxKYHwnagZ/VZ2m6jqHdG3A0/q
 1MEBhVIycFuuenJ1OoDVLulnwHdspZyii2VmNfruEFqU3KA+vaoCR8ZtPPnyKCg3lpw3PJnund
 qyWN1v9ntKazuA0mNgqWScmOYb5uepm08//jhSvR7P/1hf01Llw+BIQlnY2FTKxn1HZqpWcWV5
 mPI=
X-SBRS: 2.7
X-MesageID: 7801966
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,229,1569297600"; 
   d="scan'208";a="7801966"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 25 Oct 2019 18:05:01 +0100
Message-ID: <20191025170505.2834957-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [RFC XEN PATCH for-4.13 0/4] Fix: libxl workaround,
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2ggc2VyaWVzIGF2YWlsYWJsZSBpbiB0aGlzIGdpdCBicmFuY2g6Cmh0dHBzOi8veGVuYml0
cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9hcGVyYXJkL3hlbi11bnN0YWJsZS5naXQgYnIuZml4
LWV2X3FtcC1tdWx0aS1jb25uZWN0LXYxCgpIaSwKClFFTVUncyBRTVAgc29ja2V0IGRvZXNuJ3Qg
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
dGhhdCB0cmllcyB0byBnZXQgdGhlIGxvY2suCgpBbHRlcm5hdGl2ZWx5IHRvIHRoaXMgY3Jhemlu
ZXNzLCBpdCBtaWdodCBiZSBwb3NzaWJsZSB0byBpbmNyZWFzZSB0aGUgYGJhY2tsb2cnCnZhbHVl
IGJ5IGhhdmluZyBsaWJ4bCBvcGVuaW5nIHRoZSBRTVAgc29ja2V0IG9uIGJlaGFsZiBvZiBRRU1V
LiBCdXQgdGhpcyBpcwpvbmx5IHBvc3NpYmxlIHdpdGggYSByZWNlbnQgdmVyc2lvbiBvZiBRRU1V
ICgyLjEyIG9yIG5ld2VyLCByZWxlYXNlZCBpbiBBcHIKMjAxOCwgb3IgcWVtdS14ZW4tNC4xMiBv
ciBuZXdlcikuIEl0IHdvdWxkIGludm9sdmUgdG8gZGlzY292ZXIgUUVNVSdzCmNhcGFiaWxpdHkg
YmVmb3JlIHdlIHN0YXJ0IHRoZSBETSwgd2hpY2ggbGlieGwgaXNuJ3QgY2FwYWJsZSB5ZXQuCgpD
aGVlcnMsCgpBbnRob255IFBFUkFSRCAoNCk6CiAgbGlieGw6IEludHJvZHVjZSBsaWJ4bF9fZXZf
Y2hpbGRfa2lsbAogIGxpYnhsOiBJbnRyb2R1Y2UgbGlieGxfX2V2X3FtcGxvY2sKICBsaWJ4bDog
bGlieGxfX2V2X3FtcF9zZW5kIG5vdyB0YWtlcyBhbiBlZ2MKICBsaWJ4bF9xbXA6IEhhdmUgYSBs
b2NrIGZvciBRTVAgc29ja2V0IGFjY2VzcwoKIHRvb2xzL2xpYnhsL2xpYnhsX2Rpc2suYyAgICAg
ICAgfCAgNiArLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2RtLmMgICAgICAgICAgfCAgOCArKy0tCiB0
b29scy9saWJ4bC9saWJ4bF9kb21fc2F2ZS5jICAgIHwgIDIgKy0KIHRvb2xzL2xpYnhsL2xpYnhs
X2RvbV9zdXNwZW5kLmMgfCAgMiArLQogdG9vbHMvbGlieGwvbGlieGxfZG9tYWluLmMgICAgICB8
ICA4ICsrLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMgICAgICAgfCAgMyArLQogdG9vbHMv
bGlieGwvbGlieGxfZm9yay5jICAgICAgICB8IDU1ICsrKysrKysrKysrKysrKysrKysrKysrKwog
dG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuYyAgICB8IDMxICsrKysrKysrKysrKystCiB0b29s
cy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oICAgIHwgNTMgKysrKysrKysrKysrKysrKystLS0tLS0K
IHRvb2xzL2xpYnhsL2xpYnhsX3BjaS5jICAgICAgICAgfCAgOCArKy0tCiB0b29scy9saWJ4bC9s
aWJ4bF9xbXAuYyAgICAgICAgIHwgNzUgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
CiB0b29scy9saWJ4bC9saWJ4bF91c2IuYyAgICAgICAgIHwgMjggKysrKysrLS0tLS0tCiAxMiBm
aWxlcyBjaGFuZ2VkLCAyMTkgaW5zZXJ0aW9ucygrKSwgNjAgZGVsZXRpb25zKC0pCgotLSAKQW50
aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97460AA680
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 16:51:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5t4B-00056G-Ti; Thu, 05 Sep 2019 14:48:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lv1E=XA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i5t4A-00055q-Ph
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 14:48:54 +0000
X-Inumbo-ID: 46a9e73a-cfec-11e9-b299-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46a9e73a-cfec-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 14:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567694932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v97zm+PgL2p3MiYOlVm0a2o9hBiW2fkOIq3QOpKhCts=;
 b=N8BRMZRcDJh5at2X4hqPbUARUokCHbbE0Yq8gyPfV0ELX1AZK7apyOQd
 9i4z96IjYAKS2y9R1NT9iTBfEVmcwJFoFKf4DkAdET3xBsYg8UXhmFr56
 GZV7PM8zsCgqvOPh1rzR8yGjpDGqMKUZoPJ/wVHqPtXOa20zuS329klyH 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 30bq7GMCNDNIuK9PpvYQK2zsRASus08LzHUqOO61xhyFFHfLQWV94qkOPUk/wf+slYn6lmYa6s
 UOMk0TtZYwnFIGl7AUBQeFwdRCvmeEyiELNrJPgnGTb6e7UhbqXDwIvhrX20Uj/kVkdrhcJwt0
 uyfdaZ8q+xw5g+ZxkQfDnWMM9qAa4/P5NRoiITpBieNxb9q7xKm8qheSZo1Rjt6JyJe7zEJuN/
 zyVFz3XkkBAUbTprFU5sMCVLdPoejHQiF8GzeIdcO6W53xA/EFVSQ6cpWSL+7ct7yTcM56acOo
 wIo=
X-SBRS: 2.7
X-MesageID: 5187815
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,470,1559534400"; 
   d="scan'208";a="5187815"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 5 Sep 2019 16:48:32 +0200
Message-ID: <20190905144835.6035-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190905144835.6035-1-roger.pau@citrix.com>
References: <20190905144835.6035-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/4] build: set HOST{CC/CXX},
 clang and gcc in StdGNU.mk
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
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBhIHByZXBhcmF0b3J5IGNoYW5nZSBmb3Igc2ltcGxpZnlpbmcgdGhlIHNldHRpbmcg
b2YKSE9TVHtDQy9DWFh9IGFuZCBhbGxvd2luZyB0aGUgWGVuIGJ1aWxkIHN5c3RlbSB0byBwaWNr
IHRoZSB0b29sY2hhaW4KdmFyaWFibGVzIGZyb20gdGhlIGVudmlyb25tZW50LgoKTm8gZnVuY3Rp
b25hbCBjaGFuZ2UgaW50ZW5kZWQuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgpDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXgu
Y29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUu
Y29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzog
VGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLS0KIENv
bmZpZy5tayAgICAgICAgfCAxOCAtLS0tLS0tLS0tLS0tLS0tLS0KIGNvbmZpZy9TdGRHTlUubWsg
fCAxNiArKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyks
IDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0NvbmZpZy5tayBiL0NvbmZpZy5tawppbmRl
eCAwZmE0NTkxMzc5Li41N2E2YzkzNGIzIDEwMDY0NAotLS0gYS9Db25maWcubWsKKysrIGIvQ29u
ZmlnLm1rCkBAIC0zOSwyNCArMzksNiBAQCBERVNURElSICAgICA/PSAvCiAjIEFsbG93IHBob255
IGF0dHJpYnV0ZSB0byBiZSBsaXN0ZWQgYXMgZGVwZW5kZW5jeSByYXRoZXIgdGhhbiBmYWtlIHRh
cmdldAogLlBIT05ZOiAucGhvbnkKIAotIyBJZiB3ZSBhcmUgbm90IGNyb3NzLWNvbXBpbGluZywg
ZGVmYXVsdCBIT1NUQ3tDL1hYfSB0byBDe0MvWFh9Ci1pZmVxICgkKFhFTl9UQVJHRVRfQVJDSCks
ICQoWEVOX0NPTVBJTEVfQVJDSCkpCi1IT1NUQ0MgPz0gJChDQykKLUhPU1RDWFggPz0gJChDWFgp
Ci1lbmRpZgotCi0jIFVzZSBDbGFuZy9MTFZNIGluc3RlYWQgb2YgR0NDPwotY2xhbmcgPz0gbgot
aWZlcSAoJChjbGFuZyksbikKLWdjYyA6PSB5Ci1IT1NUQ0MgPz0gZ2NjCi1IT1NUQ1hYID89IGcr
KwotZWxzZQotZ2NjIDo9IG4KLUhPU1RDQyA/PSBjbGFuZwotSE9TVENYWCA/PSBjbGFuZysrCi1l
bmRpZgotCiBERVBTX0lOQ0xVREUgPSAkKGFkZHN1ZmZpeCAuZDIsICQoYmFzZW5hbWUgJCh3aWxk
Y2FyZCAkKERFUFMpKSkpCiBERVBTX1JNID0gJChERVBTKSAkKERFUFNfSU5DTFVERSkKIApkaWZm
IC0tZ2l0IGEvY29uZmlnL1N0ZEdOVS5tayBiL2NvbmZpZy9TdGRHTlUubWsKaW5kZXggMDM5Mjc0
ZWE2MS4uN2E2MTU5MDIxYiAxMDA2NDQKLS0tIGEvY29uZmlnL1N0ZEdOVS5taworKysgYi9jb25m
aWcvU3RkR05VLm1rCkBAIC0xLDE0ICsxLDMwIEBACisjIFVzZSBDbGFuZy9MTFZNIGluc3RlYWQg
b2YgR0NDPworY2xhbmcgICAgID89IG4KKworIyBJZiB3ZSBhcmUgbm90IGNyb3NzLWNvbXBpbGlu
ZywgZGVmYXVsdCBIT1NUQ3tDL1hYfSB0byBDe0MvWFh9CitpZmVxICgkKFhFTl9UQVJHRVRfQVJD
SCksICQoWEVOX0NPTVBJTEVfQVJDSCkpCitIT1NUQ0MgICAgPz0gJChDQykKK0hPU1RDWFggICA/
PSAkKENYWCkKK2VuZGlmCisKIEFTICAgICAgICAgPSAkKENST1NTX0NPTVBJTEUpYXMKIExEICAg
ICAgICAgPSAkKENST1NTX0NPTVBJTEUpbGQKIGlmZXEgKCQoY2xhbmcpLHkpCitnY2MgICAgICAg
Oj0gbgogQ0MgICAgICAgICA9ICQoQ1JPU1NfQ09NUElMRSljbGFuZwogQ1hYICAgICAgICA9ICQo
Q1JPU1NfQ09NUElMRSljbGFuZysrCiBMRF9MVE8gICAgID0gJChDUk9TU19DT01QSUxFKWxsdm0t
bGQKK0hPU1RDQyAgICA/PSBjbGFuZworSE9TVENYWCAgID89IGNsYW5nKysKIGVsc2UKK2djYyAg
ICAgICA6PSB5CiBDQyAgICAgICAgID0gJChDUk9TU19DT01QSUxFKWdjYwogQ1hYICAgICAgICA9
ICQoQ1JPU1NfQ09NUElMRSlnKysKIExEX0xUTyAgICAgPSAkKENST1NTX0NPTVBJTEUpbGQKK0hP
U1RDQyAgICA/PSBnY2MKK0hPU1RDWFggICA/PSBnKysKIGVuZGlmCisKIENQUCAgICAgICAgPSAk
KENDKSAtRQogQVIgICAgICAgICA9ICQoQ1JPU1NfQ09NUElMRSlhcgogUkFOTElCICAgICA9ICQo
Q1JPU1NfQ09NUElMRSlyYW5saWIKLS0gCjIuMjIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=

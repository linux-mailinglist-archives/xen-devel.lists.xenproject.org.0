Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE3CEA308
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 19:09:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPsNQ-0003Y1-BU; Wed, 30 Oct 2019 18:07:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jdra=YX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iPsNP-0003Xp-Hu
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 18:07:23 +0000
X-Inumbo-ID: 16110d55-fb40-11e9-9534-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16110d55-fb40-11e9-9534-12813bfff9fa;
 Wed, 30 Oct 2019 18:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572458829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rHTbEyyFGXRs3V4C/ACE/M6SEw7Tzko1DxlSGPJG0cU=;
 b=bzJMbg/AdPUA+tUk+D4umiquRXxOhBgJQpZADX5QH0UefDrTvlrkktMp
 GmjwRIqkgINWrafw2EMYiNnOQGRJ5DgUVmB5AcGZY6ATnNyf2beVb8OJS
 Ew8WZ3ymBloa4DbyUpBTblZh0KKf8OsDB2R3fNGkhAPUPJA0/A8u2KgmI 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GLP/2e+9Br9+UyLDrBqcFWnkH7bAzVCiUgPdzGYWwkVlZzyxekkiSJGDH77M5iM7h95J550iNY
 Ps+1PxJQ7s8pb/7yEqz3H1rocpY86Si7EAESRFgjUwXbqU6eosK1B364jTWpGdWXg7XkhtEqK/
 jPAKrJgP+9q9CYKK2L6GfHjFCgcaLhjq9jbipjLX0LD5IViMiRv2EMx26FIbJxnBthaYx47p4n
 JuC6d7MU8KwkyYn3VQfSOAre1FH0FRYmRBxIJ3eqN0kxyt5bgPp6xMLgRfF4Q5K76ypPtKMZWh
 rR0=
X-SBRS: 2.7
X-MesageID: 7739501
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,248,1569297600"; 
   d="scan'208";a="7739501"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 30 Oct 2019 18:07:00 +0000
Message-ID: <20191030180704.261320-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030180704.261320-1-anthony.perard@citrix.com>
References: <20191030180704.261320-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v2 2/6] libxl: Move
 libxl__ev_devlock declaration
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

V2UgYXJlIGdvaW5nIHRvIHdhbnQgdG8gaW5jbHVkZSBsaWJ4bF9fZXZfZGV2bG9jayBpbnRvIGxp
YnhsX19ldl9xbXAuCgpObyBmdW5jdGlvbmFsIGNoYW5nZXMuCgpTaWduZWQtb2ZmLWJ5OiBBbnRo
b255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCgpOb3RlczoKICAgIE5l
dyBwYXRjaCBpbiB2MjoKICAgICAgICBNb3ZlIG9mIHRoZSBzdHJ1Y3Qgd2FzIGRvbmUgaW4gImxp
YnhsX3FtcDogSGF2ZSBhIGxvY2sgZm9yIFFNUAogICAgICAgIHNvY2tldCBhY2Nlc3MiIGJlZm9y
ZS4KCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgOTYgKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgNDgg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCBi
L3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKaW5kZXggNGU0MzNlMTEwNjY0Li42OWQ1NzJj
MTg2NmEgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKKysrIGIvdG9v
bHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaApAQCAtMzYzLDYgKzM2Myw1NCBAQCBzdHJ1Y3QgbGli
eGxfX2V2X2NoaWxkIHsKICAgICBMSUJYTF9MSVNUX0VOVFJZKHN0cnVjdCBsaWJ4bF9fZXZfY2hp
bGQpIGVudHJ5OwogfTsKIAorLyoKKyAqIExvY2sgZm9yIGRldmljZSBob3RwbHVnLCBxbXBfbG9j
ay4KKyAqCisgKiBsaWJ4bF9fZXZfZGV2bG9jayBpbXBsZW1lbnQgYSBsb2NrIHRoYXQgaXMgb3V0
c2lkZSBvZiBDVFhfTE9DSyBpbiB0aGUKKyAqIGxvY2sgaGllcmFyY2h5LiBJdCBjYW4gYmUgdXNl
ZCB3aGVuIG9uZSB3YW50IHRvIG1ha2UgUU1QIGNhbGxzIHRvIFFFTVUsCisgKiB3aGljaCBtYXkg
dGFrZSBhIHNpZ25pZmljYW50IGFtb3VudCB0aW1lLgorICogSXQgaXMgdG8gYmUgYWNxdWlyZWQg
YnkgYW4gYW8gZXZlbnQgY2FsbGJhY2suCisgKgorICogSXQgaXMgdG8gYmUgYWNxdWlyZWQgd2hl
biBhZGRpbmcvcmVtb3ZpbmcgZGV2aWNlcyBvciBtYWtpbmcgY2hhbmdlcworICogdG8gdGhlbSB3
aGVuIHRoaXMgaXMgYSBzbG93IG9wZXJhdGlvbiBhbmQganNvbl9sb2NrIGlzbid0IGFwcHJvcHJp
YXRlLgorICoKKyAqIFBvc3NpYmxlIHN0YXRlcyBvZiBsaWJ4bF9fZXZfZGV2bG9jazoKKyAqICAg
VW5kZWZpbmVkCisgKiAgICBNaWdodCBjb250YWluIGFueXRoaW5nLgorICogIElkbGUKKyAqICAg
IFN0cnVjdCBjb250ZW50cyBhcmUgZGVmaW5lZCBlbm91Z2ggdG8gcGFzcyB0byBhbnkKKyAqICAg
IGxpYnhsX19ldl9kZXZsb2NrXyogZnVuY3Rpb24uCisgKiAgICBUaGUgc3RydWN0IGRvZXMgbm90
IGNvbnRhaW4gcmVmZXJlbmNlcyB0byBhbnkgYWxsb2NhdGVkIHByaXZhdGUKKyAqICAgIHJlc291
cmNlcyBzbyBjYW4gYmUgdGhyb3duIGF3YXkuCisgKiAgQWN0aXZlCisgKiAgICBXYWl0aW5nIHRv
IGdldCBhIGxvY2suCisgKiAgICBOZWVkcyB0byB3YWl0IHVudGlsIHRoZSBjYWxsYmFjayBpcyBj
YWxsZWQuCisgKiAgTG9ja0FjcXVpcmVkCisgKiAgICBsaWJ4bF9fZXZfZGV2bG9ja191bmxvY2sg
d2lsbCBuZWVkIHRvIGJlIGNhbGxlZCB0byByZWxlYXNlIHRoZSBsb2NrCisgKiAgICBhbmQgdGhl
IHJlc291cmNlcyBvZiBsaWJ4bF9fZXZfZGV2bG9jay4KKyAqCisgKiAgbGlieGxfX2V2X2Rldmxv
Y2tfaW5pdDogVW5kZWZpbmVkL0lkbGUgLT4gSWRsZQorICogIGxpYnhsX19ldl9kZXZsb2NrX2xv
Y2s6IElkbGUgLT4gQWN0aXZlCisgKiAgICBNYXkgY2FsbCBjYWxsYmFjayBzeW5jaHJvbm91c2x5
LgorICogIGxpYnhsX19ldl9kZXZsb2NrX3VubG9jazogTG9ja0FjcXVpcmVkL0lkbGUgLT4gSWRs
ZQorICogIGNhbGxiYWNrOiAgICAgV2hlbiBjYWxsZWQ6IEFjdGl2ZSAtPiBMb2NrQWNxdWlyZWQg
KG9uIGVycm9yOiBJZGxlKQorICogICAgVGhlIGNhbGxiYWNrIGlzIG9ubHkgY2FsbGVkIG9uY2Uu
CisgKi8KK3N0cnVjdCBsaWJ4bF9fZXZfZGV2bG9jayB7CisgICAgLyogZmlsbGVkIGJ5IHVzZXIg
Ki8KKyAgICBsaWJ4bF9fYW8gKmFvOworICAgIGxpYnhsX2RvbWlkIGRvbWlkOworICAgIHZvaWQg
KCpjYWxsYmFjaykobGlieGxfX2VnYyAqLCBsaWJ4bF9fZXZfZGV2bG9jayAqLCBpbnQgcmMpOwor
ICAgIC8qIHByaXZhdGUgdG8gbGlieGxfX2V2X2RldmxvY2sqICovCisgICAgbGlieGxfX2V2X2No
aWxkIGNoaWxkOworICAgIGNoYXIgKnBhdGg7IC8qIHBhdGggb2YgdGhlIGxvY2sgZmlsZSBpdHNl
bGYgKi8KKyAgICBpbnQgZmQ7CisgICAgYm9vbCBoZWxkOworfTsKK19oaWRkZW4gdm9pZCBsaWJ4
bF9fZXZfZGV2bG9ja19pbml0KGxpYnhsX19ldl9kZXZsb2NrICopOworX2hpZGRlbiB2b2lkIGxp
YnhsX19ldl9kZXZsb2NrX2xvY2sobGlieGxfX2VnYyAqLCBsaWJ4bF9fZXZfZGV2bG9jayAqKTsK
K19oaWRkZW4gdm9pZCBsaWJ4bF9fZXZfZGV2bG9ja191bmxvY2sobGlieGxfX2djICosIGxpYnhs
X19ldl9kZXZsb2NrICopOworCiAvKgogICogUU1QIGFzeW5jaHJvbm91cyBjYWxscwogICoKQEAg
LTQ2ODksNTQgKzQ3MzcsNiBAQCBzdGF0aWMgaW5saW5lIGNvbnN0IGNoYXIgKmxpYnhsX19xZW11
X3FtcF9wYXRoKGxpYnhsX19nYyAqZ2MsIGludCBkb21pZCkKICAgICByZXR1cm4gR0NTUFJJTlRG
KCIlcy9xbXAtbGlieGwtJWQiLCBsaWJ4bF9fcnVuX2Rpcl9wYXRoKCksIGRvbWlkKTsKIH0KIAot
LyoKLSAqIExvY2sgZm9yIGRldmljZSBob3RwbHVnLCBxbXBfbG9jay4KLSAqCi0gKiBsaWJ4bF9f
ZXZfZGV2bG9jayBpbXBsZW1lbnQgYSBsb2NrIHRoYXQgaXMgb3V0c2lkZSBvZiBDVFhfTE9DSyBp
biB0aGUKLSAqIGxvY2sgaGllcmFyY2h5LiBJdCBjYW4gYmUgdXNlZCB3aGVuIG9uZSB3YW50IHRv
IG1ha2UgUU1QIGNhbGxzIHRvIFFFTVUsCi0gKiB3aGljaCBtYXkgdGFrZSBhIHNpZ25pZmljYW50
IGFtb3VudCB0aW1lLgotICogSXQgaXMgdG8gYmUgYWNxdWlyZWQgYnkgYW4gYW8gZXZlbnQgY2Fs
bGJhY2suCi0gKgotICogSXQgaXMgdG8gYmUgYWNxdWlyZWQgd2hlbiBhZGRpbmcvcmVtb3Zpbmcg
ZGV2aWNlcyBvciBtYWtpbmcgY2hhbmdlcwotICogdG8gdGhlbSB3aGVuIHRoaXMgaXMgYSBzbG93
IG9wZXJhdGlvbiBhbmQganNvbl9sb2NrIGlzbid0IGFwcHJvcHJpYXRlLgotICoKLSAqIFBvc3Np
YmxlIHN0YXRlcyBvZiBsaWJ4bF9fZXZfZGV2bG9jazoKLSAqICAgVW5kZWZpbmVkCi0gKiAgICBN
aWdodCBjb250YWluIGFueXRoaW5nLgotICogIElkbGUKLSAqICAgIFN0cnVjdCBjb250ZW50cyBh
cmUgZGVmaW5lZCBlbm91Z2ggdG8gcGFzcyB0byBhbnkKLSAqICAgIGxpYnhsX19ldl9kZXZsb2Nr
XyogZnVuY3Rpb24uCi0gKiAgICBUaGUgc3RydWN0IGRvZXMgbm90IGNvbnRhaW4gcmVmZXJlbmNl
cyB0byBhbnkgYWxsb2NhdGVkIHByaXZhdGUKLSAqICAgIHJlc291cmNlcyBzbyBjYW4gYmUgdGhy
b3duIGF3YXkuCi0gKiAgQWN0aXZlCi0gKiAgICBXYWl0aW5nIHRvIGdldCBhIGxvY2suCi0gKiAg
ICBOZWVkcyB0byB3YWl0IHVudGlsIHRoZSBjYWxsYmFjayBpcyBjYWxsZWQuCi0gKiAgTG9ja0Fj
cXVpcmVkCi0gKiAgICBsaWJ4bF9fZXZfZGV2bG9ja191bmxvY2sgd2lsbCBuZWVkIHRvIGJlIGNh
bGxlZCB0byByZWxlYXNlIHRoZSBsb2NrCi0gKiAgICBhbmQgdGhlIHJlc291cmNlcyBvZiBsaWJ4
bF9fZXZfZGV2bG9jay4KLSAqCi0gKiAgbGlieGxfX2V2X2RldmxvY2tfaW5pdDogVW5kZWZpbmVk
L0lkbGUgLT4gSWRsZQotICogIGxpYnhsX19ldl9kZXZsb2NrX2xvY2s6IElkbGUgLT4gQWN0aXZl
Ci0gKiAgICBNYXkgY2FsbCBjYWxsYmFjayBzeW5jaHJvbm91c2x5LgotICogIGxpYnhsX19ldl9k
ZXZsb2NrX3VubG9jazogTG9ja0FjcXVpcmVkL0lkbGUgLT4gSWRsZQotICogIGNhbGxiYWNrOiAg
ICAgV2hlbiBjYWxsZWQ6IEFjdGl2ZSAtPiBMb2NrQWNxdWlyZWQgKG9uIGVycm9yOiBJZGxlKQot
ICogICAgVGhlIGNhbGxiYWNrIGlzIG9ubHkgY2FsbGVkIG9uY2UuCi0gKi8KLXN0cnVjdCBsaWJ4
bF9fZXZfZGV2bG9jayB7Ci0gICAgLyogZmlsbGVkIGJ5IHVzZXIgKi8KLSAgICBsaWJ4bF9fYW8g
KmFvOwotICAgIGxpYnhsX2RvbWlkIGRvbWlkOwotICAgIHZvaWQgKCpjYWxsYmFjaykobGlieGxf
X2VnYyAqLCBsaWJ4bF9fZXZfZGV2bG9jayAqLCBpbnQgcmMpOwotICAgIC8qIHByaXZhdGUgdG8g
bGlieGxfX2V2X2RldmxvY2sqICovCi0gICAgbGlieGxfX2V2X2NoaWxkIGNoaWxkOwotICAgIGNo
YXIgKnBhdGg7IC8qIHBhdGggb2YgdGhlIGxvY2sgZmlsZSBpdHNlbGYgKi8KLSAgICBpbnQgZmQ7
Ci0gICAgYm9vbCBoZWxkOwotfTsKLV9oaWRkZW4gdm9pZCBsaWJ4bF9fZXZfZGV2bG9ja19pbml0
KGxpYnhsX19ldl9kZXZsb2NrICopOwotX2hpZGRlbiB2b2lkIGxpYnhsX19ldl9kZXZsb2NrX2xv
Y2sobGlieGxfX2VnYyAqLCBsaWJ4bF9fZXZfZGV2bG9jayAqKTsKLV9oaWRkZW4gdm9pZCBsaWJ4
bF9fZXZfZGV2bG9ja191bmxvY2sobGlieGxfX2djICosIGxpYnhsX19ldl9kZXZsb2NrICopOwot
CiAvKiBTZW5kIGNvbnRyb2wgY29tbWFuZHMgb3ZlciB4ZW5zdG9yZSBhbmQgd2FpdCBmb3IgYW4g
QWNrLiAqLwogX2hpZGRlbiBpbnQgbGlieGxfX2RvbWFpbl9wdmNvbnRyb2wobGlieGxfX2VnYyAq
ZWdjLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfX3hzd2FpdF9z
dGF0ZSAqcHZjb250cm9sLAotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs

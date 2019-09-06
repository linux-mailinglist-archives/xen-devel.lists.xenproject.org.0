Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 830D7ABAEB
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 16:33:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6FG0-0001Vw-Vp; Fri, 06 Sep 2019 14:30:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CtaX=XB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i6FFy-0001Vr-Qb
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 14:30:34 +0000
X-Inumbo-ID: e2a140fe-d0b2-11e9-b299-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2a140fe-d0b2-11e9-b299-bc764e2007e4;
 Fri, 06 Sep 2019 14:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567780233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+qidJH2vUzDHkpETUJA22f+ofe7g152Kmnnxa46yTWA=;
 b=bK+Z9+c7qw56Tp2IiMm6DdJQvf3SFWMTNeenhWsJlGfhli5A4SmQuuqe
 PkqlYxkM707its7V0QcqARFS7UfW1Xs1q8KAJ53YV+H/jeiE8LwkEUjhN
 osA829USnAD21za8GgUWZ4I0nrzohLaMQzzl4E0zO4DPK+CqdwLUdpeLN g=;
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
IronPort-SDR: jlYk5crpYgMU3bmMogyIAMGijpdEcMQePxWk6yadcMFs2NuO8VrT3yLhkNcha3JoOC1eRrsxTh
 kIJhEfNF3bIFT0Zy6OYJ01ZCn23wPqenAuY2ed4hCckJ7WsSFkG3kNzxLR5ve2vcWi3iQva64f
 RtQF89dg833suoqwIp807qNJ5ver6lQyO0fF7p107HFtCfWnmMAnjOIKfzT4NDYL5JcKqD2GA6
 HfuYXINOwac064tyhFwIF3AFeBxffuwGKooZrrCch/Zs56hH9dsRzzobhHPD/SBkKftKMaE3/7
 D2g=
X-SBRS: 2.7
X-MesageID: 5516274
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,473,1559534400"; 
   d="scan'208";a="5516274"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 6 Sep 2019 16:30:20 +0200
Message-ID: <20190906143021.28261-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190906143021.28261-1-roger.pau@citrix.com>
References: <20190906143021.28261-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 1/2] sysctl: report existing physcaps on ARM
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
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudCBwaHlzY2FwcyBpbiBYRU5fU1lTQ1RMX3BoeXNpbmZvIGFyZSBvbmx5IHVzZWQgYnkg
eDg2LCBhbGJlaXQKdGhlIGNhcGFiaWxpdGllcyB0aGVtc2VsdmVzIGFyZSBub3QgeDg2IHNwZWNp
ZmljLgoKVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIGFsc28gcmVwb3J0aW5nIHRoZSBjdXJy
ZW50IGNhcGFiaWxpdGllcyBvbgpBUk0gaGFyZHdhcmUuIE5vdGUgdGhhdCBvbiBBUk0gUEhZU0NB
UF9odm0gaXMgYWx3YXlzIHJlcG9ydGVkLCBhbmQKc2V0dGluZyBQSFlTQ0FQX2RpcmVjdGlvIGhh
cyBiZWVuIG1vdmVkIHRvIGNvbW1vbiBjb2RlIHNpbmNlIHRoZSBzYW1lCmxvZ2ljIHRvIHNldCBp
dCBpcyB1c2VkIGJ5IHg4NiBhbmQgQVJNLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwu
ZHVycmFudEBjaXRyaXguY29tPgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgotLS0KQ2hhbmdlcyBzaW5jZSB2MToKIC0gTmV3IGluIHRoaXMgdmVyc2lvbi4KLS0tCiB4
ZW4vYXJjaC9hcm0vc3lzY3RsLmMgICAgICAgfCA1ICsrKystCiB4ZW4vYXJjaC94ODYvc3lzY3Rs
LmMgICAgICAgfCAyIC0tCiB4ZW4vY29tbW9uL3N5c2N0bC5jICAgICAgICAgfCAyICsrCiB4ZW4v
aW5jbHVkZS9wdWJsaWMvc3lzY3RsLmggfCA2ICsrKy0tLQogNCBmaWxlcyBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3N5
c2N0bC5jIGIveGVuL2FyY2gvYXJtL3N5c2N0bC5jCmluZGV4IGZiZmRiNDRlZmYuLjkyYWM5OWM5
MjggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9zeXNjdGwuYworKysgYi94ZW4vYXJjaC9hcm0v
c3lzY3RsLmMKQEAgLTEyLDcgKzEyLDEwIEBACiAjaW5jbHVkZSA8eGVuL2h5cGVyY2FsbC5oPgog
I2luY2x1ZGUgPHB1YmxpYy9zeXNjdGwuaD4KIAotdm9pZCBhcmNoX2RvX3BoeXNpbmZvKHN0cnVj
dCB4ZW5fc3lzY3RsX3BoeXNpbmZvICpwaSkgeyB9Cit2b2lkIGFyY2hfZG9fcGh5c2luZm8oc3Ry
dWN0IHhlbl9zeXNjdGxfcGh5c2luZm8gKnBpKQoreworICAgIHBpLT5jYXBhYmlsaXRpZXMgfD0g
WEVOX1NZU0NUTF9QSFlTQ0FQX2h2bTsKK30KIAogbG9uZyBhcmNoX2RvX3N5c2N0bChzdHJ1Y3Qg
eGVuX3N5c2N0bCAqc3lzY3RsLAogICAgICAgICAgICAgICAgICAgICBYRU5fR1VFU1RfSEFORExF
X1BBUkFNKHhlbl9zeXNjdGxfdCkgdV9zeXNjdGwpCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
c3lzY3RsLmMgYi94ZW4vYXJjaC94ODYvc3lzY3RsLmMKaW5kZXggYzUwZDkxMGExYy4uN2VjNjE3
NGU2YiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3N5c2N0bC5jCisrKyBiL3hlbi9hcmNoL3g4
Ni9zeXNjdGwuYwpAQCAtMTYzLDggKzE2Myw2IEBAIHZvaWQgYXJjaF9kb19waHlzaW5mbyhzdHJ1
Y3QgeGVuX3N5c2N0bF9waHlzaW5mbyAqcGkpCiAgICAgICAgIHBpLT5jYXBhYmlsaXRpZXMgfD0g
WEVOX1NZU0NUTF9QSFlTQ0FQX2h2bTsKICAgICBpZiAoIElTX0VOQUJMRUQoQ09ORklHX1BWKSAp
CiAgICAgICAgIHBpLT5jYXBhYmlsaXRpZXMgfD0gWEVOX1NZU0NUTF9QSFlTQ0FQX3B2OwotICAg
IGlmICggaW9tbXVfZW5hYmxlZCApCi0gICAgICAgIHBpLT5jYXBhYmlsaXRpZXMgfD0gWEVOX1NZ
U0NUTF9QSFlTQ0FQX2RpcmVjdGlvOwogfQogCiBsb25nIGFyY2hfZG9fc3lzY3RsKApkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9zeXNjdGwuYyBiL3hlbi9jb21tb24vc3lzY3RsLmMKaW5kZXggZmNm
MmQyZmQ3Yy4uOTJiNGVhMGQyMSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zeXNjdGwuYworKysg
Yi94ZW4vY29tbW9uL3N5c2N0bC5jCkBAIC0yNjcsNiArMjY3LDggQEAgbG9uZyBkb19zeXNjdGwo
WEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fc3lzY3RsX3QpIHVfc3lzY3RsKQogICAgICAgICBw
aS0+Y3B1X2toeiA9IGNwdV9raHo7CiAgICAgICAgIHBpLT5tYXhfbWZuID0gZ2V0X3VwcGVyX21m
bl9ib3VuZCgpOwogICAgICAgICBhcmNoX2RvX3BoeXNpbmZvKHBpKTsKKyAgICAgICAgaWYgKCBp
b21tdV9lbmFibGVkICkKKyAgICAgICAgICAgIHBpLT5jYXBhYmlsaXRpZXMgfD0gWEVOX1NZU0NU
TF9QSFlTQ0FQX2RpcmVjdGlvOwogCiAgICAgICAgIGlmICggY29weV90b19ndWVzdCh1X3N5c2N0
bCwgb3AsIDEpICkKICAgICAgICAgICAgIHJldCA9IC1FRkFVTFQ7CmRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9wdWJsaWMvc3lzY3RsLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgKaW5k
ZXggOTFjNDhkY2FlMC4uMzZiM2Y4YzQyOSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvcHVibGlj
L3N5c2N0bC5oCisrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaApAQCAtODEsMTMgKzgx
LDEzIEBAIHN0cnVjdCB4ZW5fc3lzY3RsX3RidWZfb3AgewogICogR2V0IHBoeXNpY2FsIGluZm9y
bWF0aW9uIGFib3V0IHRoZSBob3N0IG1hY2hpbmUKICAqLwogLyogWEVOX1NZU0NUTF9waHlzaW5m
byAqLwotIC8qICh4ODYpIFRoZSBwbGF0Zm9ybSBzdXBwb3J0cyBIVk0gZ3Vlc3RzLiAqLworIC8q
IFRoZSBwbGF0Zm9ybSBzdXBwb3J0cyBIVk0gZ3Vlc3RzLiAqLwogI2RlZmluZSBfWEVOX1NZU0NU
TF9QSFlTQ0FQX2h2bSAgICAgICAgICAwCiAjZGVmaW5lIFhFTl9TWVNDVExfUEhZU0NBUF9odm0g
ICAgICAgICAgICgxdTw8X1hFTl9TWVNDVExfUEhZU0NBUF9odm0pCi0gLyogKHg4NikgVGhlIHBs
YXRmb3JtIHN1cHBvcnRzIFBWIGd1ZXN0cy4gKi8KKyAvKiBUaGUgcGxhdGZvcm0gc3VwcG9ydHMg
UFYgZ3Vlc3RzLiAqLwogI2RlZmluZSBfWEVOX1NZU0NUTF9QSFlTQ0FQX3B2ICAgICAgICAgICAx
CiAjZGVmaW5lIFhFTl9TWVNDVExfUEhZU0NBUF9wdiAgICAgICAgICAgICgxdTw8X1hFTl9TWVND
VExfUEhZU0NBUF9wdikKLSAvKiAoeDg2KSBUaGUgcGxhdGZvcm0gc3VwcG9ydHMgZGlyZWN0IGFj
Y2VzcyB0byBJL08gZGV2aWNlcyB3aXRoIElPTU1VLiAqLworIC8qIFRoZSBwbGF0Zm9ybSBzdXBw
b3J0cyBkaXJlY3QgYWNjZXNzIHRvIEkvTyBkZXZpY2VzIHdpdGggSU9NTVUuICovCiAjZGVmaW5l
IF9YRU5fU1lTQ1RMX1BIWVNDQVBfZGlyZWN0aW8gICAgIDIKICNkZWZpbmUgWEVOX1NZU0NUTF9Q
SFlTQ0FQX2RpcmVjdGlvICAoMXU8PF9YRU5fU1lTQ1RMX1BIWVNDQVBfZGlyZWN0aW8pCiBzdHJ1
Y3QgeGVuX3N5c2N0bF9waHlzaW5mbyB7Ci0tIAoyLjIyLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs

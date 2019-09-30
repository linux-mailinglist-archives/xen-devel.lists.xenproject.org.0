Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D189C221A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 15:35:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEvng-0005PL-6G; Mon, 30 Sep 2019 13:33:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=znM2=XZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iEvne-0005P8-DS
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 13:33:14 +0000
X-Inumbo-ID: d983b632-e386-11e9-96d2-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id d983b632-e386-11e9-96d2-12813bfff9fa;
 Mon, 30 Sep 2019 13:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569850393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wJuOA8I65W5rXxtgxu2eoW29fdQ5R2Fu93hXN1/y6WU=;
 b=TImEeOvjh7MkGMkwLyD1TWF6SxwMSQsuSf+/R4D4CR2mqiDx4PJE4rTL
 a7Ph34sJxOuQytNLChVs4psQuW2Z9NmQQKKxQo3gOnTsc5rbFFb4mvmnu
 9N/Musn/tKcZQvefQVPs+AVmjxP/d529muSEZoZyhmu44yrWPqEraKmvj Q=;
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
IronPort-SDR: Fsy52a2/oE2xnXQHnuFLJNIttLkYZKG8uqKAYkwSCREazbQBAR4SDGQAa+usyqZLZmT6DGe5eQ
 e674HAbTuTbMUZohQ0e/s3KvmiOlwotvKw+7GEhwZlKN0hhX967QLG+cDIEdcIDq3xxbrt/zD2
 4JlU37Q4bzutwTKCrrFPLRswv//er/I92J7SftyIg3z1IXyodrYNo0ugOyhhFuTLrU+IukSV0u
 ffHWW8v9r2Khsr3UYhra23Rk5DD/C7jJbGUO5cR557+jOvDIZdAeSzHnKtpAWygtVToIr1KLT4
 aAQ=
X-SBRS: 2.7
X-MesageID: 6602530
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,567,1559534400"; 
   d="scan'208";a="6602530"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 15:32:31 +0200
Message-ID: <20190930133238.49868-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930133238.49868-1-roger.pau@citrix.com>
References: <20190930133238.49868-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 03/10] ioreq: add fields to allow internal
 ioreq servers
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW50ZXJuYWwgaW9yZXEgc2VydmVycyBhcmUgcGxhaW4gZnVuY3Rpb24gaGFuZGxlcnMgaW1wbGVt
ZW50ZWQgaW5zaWRlCm9mIHRoZSBoeXBlcnZpc29yLiBOb3RlIHRoYXQgbW9zdCBmaWVsZHMgdXNl
ZCBieSBjdXJyZW50IChleHRlcm5hbCkKaW9yZXEgc2VydmVycyBhcmUgbm90IG5lZWRlZCBmb3Ig
aW50ZXJuYWwgb25lcywgYW5kIGhlbmNlIGhhdmUgYmVlbgpwbGFjZWQgaW5zaWRlIG9mIGEgc3Ry
dWN0IGFuZCBwYWNrZWQgaW4gYW4gdW5pb24gdG9nZXRoZXIgd2l0aCB0aGUKb25seSBpbnRlcm5h
bCBzcGVjaWZpYyBmaWVsZCwgYSBmdW5jdGlvbiBwb2ludGVyIHRvIGEgaGFuZGxlci4KClRoaXMg
aXMgcmVxdWlyZWQgaW4gb3JkZXIgdG8gaGF2ZSBQQ0kgY29uZmlnIGFjY2Vzc2VzIGZvcndhcmRl
ZCB0bwpleHRlcm5hbCBpb3JlcSBzZXJ2ZXJzIG9yIHRvIGludGVybmFsIG9uZXMgKGllOiBRRU1V
IGVtdWxhdGVkIGRldmljZXMKdnMgdlBDSSBwYXNzdGhyb3VnaCksIGFuZCBpcyB0aGUgZmlyc3Qg
c3RlcCBpbiBvcmRlciB0byBhbGxvdwp1bnByaXZpbGVnZWQgZG9tYWlucyB0byB1c2UgdlBDSS4K
ClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpS
ZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KLS0tCkNo
YW5nZXMgc2luY2UgdjI6CiAtIERyb3AgdGhlIHZjcHUgcGFyYW1ldGVyIGZyb20gdGhlIGhhbmRs
ZXIuCgpDaGFuZ2VzIHNpbmNlIHYxOgogLSBEbyBub3QgYWRkIGFuIGludGVybmFsIGZpZWxkIHRv
IHRoZSBpb3JlcSBzZXJ2ZXIgc3RydWN0LCB3aGV0aGVyIGEKICAgc2VydmVyIGlzIGludGVybmFs
IG9yIGV4dGVybmFsIGNhbiBhbHJlYWR5IGJlIGluZmVycmVkIGZyb20gdGhlIGlkLgogLSBBZGQg
YW4gZXh0cmEgcGFyYW1ldGVyIHRvIHRoZSBpbnRlcm5hbCBoYW5kbGVyIGluIG9yZGVyIHRvIHBh
c3MKICAgdXNlci1wcm92aWRlZCBvcGFxdWUgZGF0YSB0byB0aGUgaGFuZGxlci4KLS0tCiB4ZW4v
aW5jbHVkZS9hc20teDg2L2h2bS9kb21haW4uaCB8IDMwICsrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2RvbWFpbi5oIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9odm0vZG9tYWluLmgKaW5kZXggYmNjNTYyMTc5Ny4uNTZhMzJlM2UzNSAx
MDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vZG9tYWluLmgKKysrIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9odm0vZG9tYWluLmgKQEAgLTUyLDIxICs1MiwyOSBAQCBzdHJ1Y3QgaHZt
X2lvcmVxX3ZjcHUgewogI2RlZmluZSBNQVhfTlJfSU9fUkFOR0VTICAyNTYKIAogc3RydWN0IGh2
bV9pb3JlcV9zZXJ2ZXIgewotICAgIHN0cnVjdCBkb21haW4gICAgICAgICAgKnRhcmdldCwgKmVt
dWxhdG9yOwotCisgICAgc3RydWN0IGRvbWFpbiAgICAgICAgICAqdGFyZ2V0OwogICAgIC8qIExv
Y2sgdG8gc2VyaWFsaXplIHRvb2xzdGFjayBtb2RpZmljYXRpb25zICovCiAgICAgc3BpbmxvY2tf
dCAgICAgICAgICAgICBsb2NrOwotCi0gICAgc3RydWN0IGh2bV9pb3JlcV9wYWdlICBpb3JlcTsK
LSAgICBzdHJ1Y3QgbGlzdF9oZWFkICAgICAgIGlvcmVxX3ZjcHVfbGlzdDsKLSAgICBzdHJ1Y3Qg
aHZtX2lvcmVxX3BhZ2UgIGJ1ZmlvcmVxOwotCi0gICAgLyogTG9jayB0byBzZXJpYWxpemUgYWNj
ZXNzIHRvIGJ1ZmZlcmVkIGlvcmVxIHJpbmcgKi8KLSAgICBzcGlubG9ja190ICAgICAgICAgICAg
IGJ1ZmlvcmVxX2xvY2s7Ci0gICAgZXZ0Y2huX3BvcnRfdCAgICAgICAgICBidWZpb3JlcV9ldnRj
aG47CiAgICAgc3RydWN0IHJhbmdlc2V0ICAgICAgICAqcmFuZ2VbTlJfSU9fUkFOR0VfVFlQRVNd
OwogICAgIGJvb2wgICAgICAgICAgICAgICAgICAgZW5hYmxlZDsKLSAgICB1aW50OF90ICAgICAg
ICAgICAgICAgIGJ1ZmlvcmVxX2hhbmRsaW5nOworCisgICAgdW5pb24geworICAgICAgICBzdHJ1
Y3QgeworICAgICAgICAgICAgc3RydWN0IGRvbWFpbiAgICAgICAgICAqZW11bGF0b3I7CisgICAg
ICAgICAgICBzdHJ1Y3QgaHZtX2lvcmVxX3BhZ2UgIGlvcmVxOworICAgICAgICAgICAgc3RydWN0
IGxpc3RfaGVhZCAgICAgICBpb3JlcV92Y3B1X2xpc3Q7CisgICAgICAgICAgICBzdHJ1Y3QgaHZt
X2lvcmVxX3BhZ2UgIGJ1ZmlvcmVxOworCisgICAgICAgICAgICAvKiBMb2NrIHRvIHNlcmlhbGl6
ZSBhY2Nlc3MgdG8gYnVmZmVyZWQgaW9yZXEgcmluZyAqLworICAgICAgICAgICAgc3BpbmxvY2tf
dCAgICAgICAgICAgICBidWZpb3JlcV9sb2NrOworICAgICAgICAgICAgZXZ0Y2huX3BvcnRfdCAg
ICAgICAgICBidWZpb3JlcV9ldnRjaG47CisgICAgICAgICAgICB1aW50OF90ICAgICAgICAgICAg
ICAgIGJ1ZmlvcmVxX2hhbmRsaW5nOworICAgICAgICB9OworICAgICAgICBzdHJ1Y3QgeworICAg
ICAgICAgICAgdm9pZCAgICAgICAgICAgICAgICAgICAqZGF0YTsKKyAgICAgICAgICAgIGludCAo
KmhhbmRsZXIpKGlvcmVxX3QgKiwgdm9pZCAqKTsKKyAgICAgICAgfTsKKyAgICB9OwogfTsKIAog
LyoKLS0gCjIuMjMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=

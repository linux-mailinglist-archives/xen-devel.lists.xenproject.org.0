Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59103906BC
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 19:23:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyftf-0005Pa-No; Fri, 16 Aug 2019 17:20:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Hd7z=WM=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hyfte-0005OH-1G
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 17:20:14 +0000
X-Inumbo-ID: 19ab8e71-c04a-11e9-8bb8-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19ab8e71-c04a-11e9-8bb8-12813bfff9fa;
 Fri, 16 Aug 2019 17:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565976012;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/qGry5ljh7eYHswivsgWCDLdVaAh33EeFJjE40wb8c0=;
 b=OcA3hMTr38phFkMZ1dGYvNs38re67hpY22s+Ilghrke/1VMAf62Z+qLY
 DmzDL3flfvwWd7vzmRzdadASid5y9sPuERZlNglurxMEsKdca8CyoZwAW
 vXe+vpadrMTlcoM6fCVY3aSnubhm1kaP+vp94AYX4n5xMeaiIEenlZHmC 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: R3iPtm9VlIFwwMBzChZhniwvyXxaNIt/8VeX6FfCy1uLNGoUVMIYiMaFdiAdneObIZO2AQVeMm
 6/JU6k9cdgsSykIdXfilaiSxJE9AkPT1l4MSE8uB7dU97AobNVDRpHOJnUDV4fr6xFCqilGiHl
 6yAY2I8l1XWxj+DsKRfx7osMZSEwGKT8l3WTIFHAmdMw+yrBiC7gM/QJJnTqWwzVMN60e6VzC5
 +Me3dO7ju2HoB328UVuBB1LDQrda/fl5g71nCxumRWfpdIJGhGCgkcHXruWrAkBR6WccQBJkkA
 TIc=
X-SBRS: 2.7
X-MesageID: 4407376
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,394,1559534400"; 
   d="scan'208";a="4407376"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 16 Aug 2019 18:19:51 +0100
Message-ID: <20190816172001.3905-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 00/10] use stashed domain create flags...
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uYW5kIGFkZCBwZXItZG9tYWluIElPTU1VIGNvbnRyb2wKClRoaXMgaXMgYSBjb21iaW5hdGlv
biBvZiBteSBwcmV2aW91c2x5IHNlcGFyYXRlIHNlcmllcyBbMV0gYW5kIFsyXS4KClsxXSBodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDcv
bXNnMDIyNTMuaHRtbApbMl0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9o
dG1sL3hlbi1kZXZlbC8yMDE5LTA3L21zZzAyMjY3Lmh0bWwKClBhdWwgRHVycmFudCAoMTApOgog
IG1ha2UgcGFzc3Rocm91Z2gvcGNpLmM6ZGVhc3NpZ25fZGV2aWNlKCkgc3RhdGljCiAgeDg2L2h2
bS9kb21haW46IHJlbW92ZSB0aGUgJ2hhcF9lbmFibGVkJyBmbGFnCiAgeDg2L2RvbWFpbjogcmVt
b3ZlIHRoZSAnb29zX29mZicgZmxhZwogIGRvbWFpbjogcmVtb3ZlIHRoZSAnaXNfeGVuc3RvcmUn
IGZsYWcKICB4ODYvZG9tYWluOiByZW1vdmUgdGhlICdzM19pbnRlZ3JpdHknIGZsYWcKICBkb21h
aW46IGludHJvZHVjZSBYRU5fRE9NQ1RMX0NERl9pb21tdSBmbGFnCiAgdXNlIGlzX2lvbW11X2Vu
YWJsZWQoKSB3aGVyZSBhcHByb3ByaWF0ZS4uLgogIHJlbW92ZSBsYXRlIChvbi1kZW1hbmQpIGNv
bnN0cnVjdGlvbiBvZiBJT01NVSBwYWdlIHRhYmxlcwogIGlvbW11OiB0aWR5IHVwIGlvbW11X3Vz
ZV9oYXBfcHQoKSBhbmQgbmVlZF9pb21tdV9wdF9zeW5jKCkgbWFjcm9zCiAgaW50cm9kdWNlIGEg
J3Bhc3N0aHJvdWdoJyBjb25maWd1cmF0aW9uIG9wdGlvbiB0byB4bC5jZmcuLi4KCiBkb2NzL21h
bi94bC5jZmcuNS5wb2QuaW4gICAgICAgICAgICAgICAgICB8ICA1MiArKysrKysrCiB0b29scy9s
aWJ4bC9saWJ4bC5oICAgICAgICAgICAgICAgICAgICAgICB8ICAgNSArCiB0b29scy9saWJ4bC9s
aWJ4bF9jcmVhdGUuYyAgICAgICAgICAgICAgICB8ICAgOSArKwogdG9vbHMvbGlieGwvbGlieGxf
dHlwZXMuaWRsICAgICAgICAgICAgICAgfCAgIDcgKwogdG9vbHMveGwveGxfcGFyc2UuYyAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMzggKysrKysKIHhlbi9hcmNoL2FybS9kb21haW4uYyAgICAg
ICAgICAgICAgICAgICAgIHwgIDEwICstCiB4ZW4vYXJjaC9hcm0vcDJtLmMgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgNCArLQogeGVuL2FyY2gvYXJtL3NldHVwLmMgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDMgKwogeGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYyAgICAgICAgICAgICAgICAg
fCAgIDQgKy0KIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAgICAgICAgICAgICAgIHwgIDI0
ICstLQogeGVuL2FyY2gveDg2L2RvbWN0bC5jICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0K
IHhlbi9hcmNoL3g4Ni9odm0vaHZtLmMgICAgICAgICAgICAgICAgICAgIHwgICA2ICstCiB4ZW4v
YXJjaC94ODYvaHZtL210cnIuYyAgICAgICAgICAgICAgICAgICB8ICAgNSArLQogeGVuL2FyY2gv
eDg2L2h2bS92aW9hcGljLmMgICAgICAgICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni9o
dm0vdm14L3ZtY3MuYyAgICAgICAgICAgICAgIHwgICAyICstCiB4ZW4vYXJjaC94ODYvaHZtL3Zt
eC92bXguYyAgICAgICAgICAgICAgICB8ICAgMiArLQogeGVuL2FyY2gveDg2L21tL21lbV9zaGFy
aW5nLmMgICAgICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMgICAg
ICAgICAgICAgICAgIHwgICA0ICstCiB4ZW4vYXJjaC94ODYvbW0vcGFnaW5nLmMgICAgICAgICAg
ICAgICAgICB8ICAgNiArLQogeGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24uYyAgICAgICAg
ICAgfCAgIDcgKy0KIHhlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvbm9uZS5jICAgICAgICAgICAgIHwg
ICAyICstCiB4ZW4vYXJjaC94ODYvc2V0dXAuYyAgICAgICAgICAgICAgICAgICAgICB8ICAgNSAr
LQogeGVuL2FyY2gveDg2L3Rib290LmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIHhl
bi9hcmNoL3g4Ni94ODZfNjQvbW0uYyAgICAgICAgICAgICAgICAgIHwgICAyICstCiB4ZW4vY29t
bW9uL2RvbWFpbi5jICAgICAgICAgICAgICAgICAgICAgICB8ICA0MCArKysrLQogeGVuL2NvbW1v
bi9kb21jdGwuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgMTAgKy0KIHhlbi9jb21tb24vbWVt
b3J5LmMgICAgICAgICAgICAgICAgICAgICAgIHwgICA0ICstCiB4ZW4vY29tbW9uL3ZtX2V2ZW50
LmMgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
YW1kL2lvbW11X2d1ZXN0LmMgfCAgIDIgKy0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Rldmlj
ZV90cmVlLmMgICAgIHwgIDE4ICstLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW8uYyAgICAg
ICAgICAgICAgfCAgIDggKy0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMgICAgICAg
ICAgIHwgMTgyICsrKysrKystLS0tLS0tLS0tLS0tLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L3BjaS5jICAgICAgICAgICAgIHwgMTE5ICsrKysrKystLS0tLS0tCiB4ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC92dGQvaW9tbXUuYyAgICAgICB8ICAxMiArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvdnRkL3g4Ni9odm0uYyAgICAgfCAgIDIgKy0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4
Ni9pb21tdS5jICAgICAgIHwgIDk3ICstLS0tLS0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLWFybS9p
b21tdS5oICAgICAgICAgICAgICAgfCAgIDMgLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4u
aCAgICAgICAgICAgICAgfCAgIDMgLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vZG9tYWluLmgg
ICAgICAgICAgfCAgIDcgLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9pb21tdS5oICAgICAgICAgICAg
ICAgfCAgIDQgLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdpbmcuaCAgICAgICAgICAgICAgfCAg
IDIgKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvc2hhZG93LmggICAgICAgICAgICAgIHwgICAyICst
CiB4ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmggICAgICAgICAgICAgICB8ICAxMCArLQogeGVu
L2luY2x1ZGUveGVuL2lvbW11LmggICAgICAgICAgICAgICAgICAgfCAgNDEgKystLS0KIHhlbi9p
bmNsdWRlL3hlbi9zY2hlZC5oICAgICAgICAgICAgICAgICAgIHwgIDI2ICsrLS0KIHhlbi9pbmNs
dWRlL3hzbS9kdW1teS5oICAgICAgICAgICAgICAgICAgIHwgICAyICstCiB4ZW4veHNtL2ZsYXNr
L2hvb2tzLmMgICAgICAgICAgICAgICAgICAgICB8ICAxOCArLS0KIDQ3IGZpbGVzIGNoYW5nZWQs
IDM5OSBpbnNlcnRpb25zKCspLCA0MjIgZGVsZXRpb25zKC0pCi0tLQpDYzogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255
LnBlcmFyZEBjaXRyaXguY29tPgpDYzogQnJpYW4gV29vZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+
CkNjOiBEYW5pZWwgRGUgR3JhYWYgPGRnZGVncmFAdHljaG8ubnNhLmdvdj4KQ2M6IEdlb3JnZSBE
dW5sYXAgPGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4u
amFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEp1biBOYWthamlt
YSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT4KQ2M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50
ZWwuY29tPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29t
PgpDYzogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4KQ2M6IFJh
enZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KQ2M6ICJSb2dlciBQYXUg
TW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBTdXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUu
c3V0aGlrdWxwYW5pdEBhbWQuY29tPgpDYzogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5
ZWwuY29tPgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBWb2xvZHlteXIgQmFiY2h1
ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgot
LSAKMi4yMC4xLjIuZ2IyMWViYjY3MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

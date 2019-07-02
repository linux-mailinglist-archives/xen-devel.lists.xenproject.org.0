Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 104BF5D47B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 18:41:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiLnu-0001iw-95; Tue, 02 Jul 2019 16:38:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A/Ug=U7=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hiLnt-0001iQ-4s
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 16:38:49 +0000
X-Inumbo-ID: dd51bbb4-9ce7-11e9-8f5e-e796baa0a0a8
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd51bbb4-9ce7-11e9-8f5e-e796baa0a0a8;
 Tue, 02 Jul 2019 16:38:47 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: v14isdYEz+3Z7zP9Fvqo2WJDcQ4IDsS4awEXOKQkKY8K14Z+Vy61XFAS9EoH89HlGxrAPhy1BV
 1/RdCa35yEppB9ED5zTybYqa1YmTRDXqWNiKgnoXxNRh2KaNNypW9itXGcYFq3GFPCDF3WSeMb
 sy1oxxY4mLDho8JiWpla/EHw3V9oRXQhVFnbOfdy6tTVgVY2yqkGDtmzbsDaZFBixAlw01sx0k
 WDpFv5G2OxTG4vvktxngAEIhjqGFtM6ONvRinNEN8j9b2nhgKnmb7fF2EuKif5vdEHayB0Xg+/
 yB4=
X-SBRS: 2.7
X-MesageID: 2501601
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,443,1557201600"; 
   d="scan'208";a="2501601"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 2 Jul 2019 17:38:38 +0100
Message-ID: <20190702163840.2107-2-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190702163840.2107-1-paul.durrant@citrix.com>
References: <20190702163840.2107-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/3] xmalloc: stop using a magic '1' in
 alignment padding
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
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxpZ25tZW50IHBhZGRpbmcgaW5zZXJ0cyBhIHBzZXVkbyBibG9jayBoZWFkZXIgaW4gZnJvbnQg
b2YgdGhlIGFsbG9jYXRpb24sCnNldHMgaXRzIHNpemUgZmllbGQgdG8gdGhlIHBhZCBzaXplIGFu
ZCB0aGVuIE9ScyBpbiAxLCB3aGljaCBpcyBlcXVpdmFsZW50CnRvIG1hcmtpbmcgaXQgYXMgYSBm
cmVlIGJsb2NrLCBzbyB0aGF0IHhmcmVlKCkgY2FuIGRpc3Rpbmd1aXNoIGl0IGZyb20gYQpyZWFs
IGJsb2NrIGhlYWRlci4KClRoaXMgcGF0Y2ggc2ltcGx5IHJlcGxhY2VzIHRoZSBtYWdpYyAnMScg
d2l0aCB0aGUgZGVmaW5lZCAnRlJFRV9CTE9DSycgdG8KbWFrZSBpdCBtb3JlIG9idmlvdXMgd2hh
dCdzIGdvaW5nIG9uLiBBbHNvLCB3aGlsc3QgaW4gdGhlIG5laWdoYm91cmhvb2QsCml0IHJlbW92
ZXMgYSBzdHJheSBzcGFjZSBhZnRlciBhIGNhc3QuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJh
bnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgotLS0KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1
LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4K
Q2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxr
QG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+CkNjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+
Ci0tLQogeGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Nv
bW1vbi94bWFsbG9jX3Rsc2YuYyBiL3hlbi9jb21tb24veG1hbGxvY190bHNmLmMKaW5kZXggMjA3
Njk1M2FjNC4uNmQ4ODliN2JkYyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi94bWFsbG9jX3Rsc2Yu
YworKysgYi94ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jCkBAIC01OTUsNyArNTk1LDcgQEAgdm9p
ZCAqX3htYWxsb2ModW5zaWduZWQgbG9uZyBzaXplLCB1bnNpZ25lZCBsb25nIGFsaWduKQogICAg
ICAgICBjaGFyICpxID0gKGNoYXIgKilwICsgcGFkOwogICAgICAgICBzdHJ1Y3QgYmhkciAqYiA9
IChzdHJ1Y3QgYmhkciAqKShxIC0gQkhEUl9PVkVSSEVBRCk7CiAgICAgICAgIEFTU0VSVChxID4g
KGNoYXIgKilwKTsKLSAgICAgICAgYi0+c2l6ZSA9IHBhZCB8IDE7CisgICAgICAgIGItPnNpemUg
PSBwYWQgfCBGUkVFX0JMT0NLOwogICAgICAgICBwID0gcTsKICAgICB9CiAKQEAgLTYzOCwxMiAr
NjM4LDEyIEBAIHZvaWQgeGZyZWUodm9pZCAqcCkKICAgICB9CiAKICAgICAvKiBTdHJpcCBhbGln
bm1lbnQgcGFkZGluZy4gKi8KLSAgICBiID0gKHN0cnVjdCBiaGRyICopKChjaGFyICopIHAgLSBC
SERSX09WRVJIRUFEKTsKLSAgICBpZiAoIGItPnNpemUgJiAxICkKKyAgICBiID0gKHN0cnVjdCBi
aGRyICopKChjaGFyICopcCAtIEJIRFJfT1ZFUkhFQUQpOworICAgIGlmICggYi0+c2l6ZSAmIEZS
RUVfQkxPQ0sgKQogICAgIHsKICAgICAgICAgcCA9IChjaGFyICopcCAtIChiLT5zaXplICYgfjF1
KTsKICAgICAgICAgYiA9IChzdHJ1Y3QgYmhkciAqKSgoY2hhciAqKXAgLSBCSERSX09WRVJIRUFE
KTsKLSAgICAgICAgQVNTRVJUKCEoYi0+c2l6ZSAmIDEpKTsKKyAgICAgICAgQVNTRVJUKCEoYi0+
c2l6ZSAmIEZSRUVfQkxPQ0spKTsKICAgICB9CiAKICAgICB4bWVtX3Bvb2xfZnJlZShwLCB4ZW5w
b29sKTsKLS0gCjIuMjAuMS4yLmdiMjFlYmI2NzEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs

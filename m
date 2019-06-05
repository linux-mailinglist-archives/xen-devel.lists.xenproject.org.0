Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8820035B19
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 13:18:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYTsb-0002BP-5w; Wed, 05 Jun 2019 11:14:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UgCu=UE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hYTsZ-0002BH-VY
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 11:14:52 +0000
X-Inumbo-ID: 210c2670-8783-11e9-88c2-1bcf92622b9c
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 210c2670-8783-11e9-88c2-1bcf92622b9c;
 Wed, 05 Jun 2019 11:14:48 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TZA52qhsw94KXTs6q30khU5hnxo4a5Gj4OQkBk6jvjUR3gBJZpOD9uCDRnPzPU9eZ/HwkwYUOt
 63IteHFIjxPmQ6ad8LU7mkoRHqLa7ufgzHc0LFrmYw5gt4fQrd5XuLdycb5sKGo6RcWcVtDBru
 RGEjzHtxbtBFjQ5jxrvMhXue9SaR9FkoE4+xVvm3uXlMJhXJMzJqqulSvi656TMcD/2s/HYAg9
 nbYJvM74IbPj1oYs/gBEwB1ZRrikkLnacwUaV6eYylNKzVKKKh6gtpCd1JdYAiCsEU75QYFXFR
 hL4=
X-SBRS: 2.7
X-MesageID: 1337590
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1337590"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 5 Jun 2019 12:13:56 +0100
Message-ID: <20190605111356.10429-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <E3AA6DAA6DCE974798849C41CE0968F8@citrix.com>
References: <E3AA6DAA6DCE974798849C41CE0968F8@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 2/2] RFC: enable CONFIG_LIVEPATCH in all
 relevant arm64 builds
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmlnaHQgbm93IHRoZXJlIGlzIGEgYnVnIGluLCBhdCBsZWFzdCwgWGVuIDQuMTEsIHdoZXJlIGl0
IGRvZXMgbm90CmJvb3Qgb24gc29tZSBvZiBvdXIgQVJNNjQgbWFjaGluZXMgYnV0IG9ubHkgaWYg
Q09ORklHX0xJVkVQQVRDSAppcyAqZGlzKmFibGVkLgoKV2UgdGhpbmsgdGhpcyBpcyBkdWUgdG8g
WGVuIG5vdCBwbGF5aW5nIGJ5IHRoZSBwcm9wZXIgY2FjaGUgbWFuYWdlbWVudApydWxlcyBpbiB0
aGUgQVJNIEFSTS4gIFdlIHRoaW5rIHRoYXQgQ09ORklHX0xJVkVQQVRDSCBpcyBub3QgcmVhbGx5
CnJlbGV2YW50OiBpdCBqdXN0IGNhdXNlcyBzbGlnaHQgY2hhbmdlcyBpbiB0aW1pbmcgb3IgbWVt
b3J5IGFjY2Vzc2VzCm9yIGNvZGUgbGF5b3V0OiBzbywgYW5vdGhlciByb2xsIG9mIHRoZSBkaWNl
LiAgSWUgd2UgdGhpbmsgaXQgaXMKcmFuZG9tIGNvaW5jaWRlbmNlIHRoYXQgaXQgd29ya3Mgd2l0
aCBDT05GSUdfTElWRVBBVENIIGFuZCBmYWlscwp3aXRob3V0IGl0LgoKUmlnaHQgbm93IHRoZSBi
dWcgaXMgbWFza2VkIGluIHRoZSBvc3N0ZXN0IGZsaWdodHMgd2hpY2ggdGVzdCB0aGUgWGVuCmJy
YW5jaGVzIGJlY2F1c2UgdGhleSBhbGwgYXJlIGFsbCBidWlsdCB3aXRoIENPTkZJR19MSVZFUEFU
Q0ggZW5hYmxlZC4KVGhlIG5vbi1YZW4gYnJhbmNoZXMgdW50aWwgbm93IGhhdmUgYmVlbiBidWls
dCB3aXRoIENPTkZJR19MSVZFUEFUQ0gKZGlzYWJsZWQuCgpUaGUgb3ZlcmFsbCByZXN1bHQgaXMg
YmxvY2thZ2Ugb2YgdGhlIENJIGZvciwgY3VycmVudGx5LApxZW11LXhlbi00LjExLXRlc3Rpbmcu
ICBUaGlzIGJsb2NrYWdlIGlzIG5vdCBhIHRydWUgcmVncmVzc2lvbjsgdGhlCmNvZGUgd2FzIGFs
d2F5cyBidWdneS4gIEl0J3MganVzdCB0aGF0IHNvbWV0aGluZyBoYXMgY2hhbmdlZCBhbmQgbm93
CnRoZSBidWcgYml0ZXMuCgpTd2l0Y2hpbmcgb24gQ09ORklHX0xJVkVQQVRDSCBmb3IgdGhlIGFm
ZmVjdGVkIHRlc3RzIHdpbGwsIGhvcGVmdWxseSwKbWFrZSB0aGlzIHByb2JsZW0gImdvIGF3YXki
IGFnYWluLiAgVGhpcyBpcyBjbGVhcmx5IGEgYm9kZ2UuICBCdXQgaXQKaXMgYmV0dGVyIHRoYW4g
c2ltcGx5IGZvcmNlIHB1c2hpbmc6IGlmIHdlIGNhbiBnZXQgaXQgdG8gYm9vdCwgd2Ugd2lsbApi
ZSBhYmxlIHRvIHJ1biB0aGUgb3RoZXIgdGVzdHMuCgpJIGhhdmUgdXNlZCBzdGFuZGFsb25lLWdl
bmVyYXRlLWR1bXAtZmxpZ2h0LXJ1bnZhcnMgYW5kIHRoZSBlZmZlY3QgaXMKdG8gdHVybiBvbiBl
bmFibGVfbGl2ZXBhdGNoIGluIGJ1aWxkLWFybTY0IGluIHByZWNpc2VseQpxZW11LXVwc3RyZWFt
LXhlbi00LjExLXRlc3RpbmcuCgpBSVVJOgoKQW4gYWx0ZXJuYXRpdmUgd291bGQgYmUgdG8gYmFj
a3BvcnQgMDBjOTZkNzc0MiAieGVuL2FybTogbW06IFNldC11cApwYWdlIHBlcm1pc3Npb24gZm9y
IFhlbiBtYXBwaW5ncyBlYXJsaWVyIG9uIiwgdG8gYWZmZWN0ZWQgWGVuIHN0YWJsZQpicmFuY2hl
cy4gIFRoYXQgd291bGQgZGlmZmVyZW50bHkgcGVybXV0ZSB0aGUgY2FzZXMgd2hlcmUgdGhpbmdz
IGZhaWwuCkluIHBhcnRpY3VsYXIgb24gc29tZSBoYXJkd2FyZSwgaW5jbHVkaW5nICh3ZSB0aGlu
aykgYWxsIGhhcmR3YXJlIHdlCmFjdHVhbGx5IGhhdmUsIHRoZSB2aW9sYXRpb24gb2YgdGhlIGFy
Y2hpdGVjdHVyZSBjYWNoZSBydWxlcyB3b3VsZCBiZQphYnNvbHV0ZWx5IGlycmVsZXZhbnQgYmVj
YXVzZSBvZiBtaWNyb2FyY2hpdGVjdHVyYWwgZGV0YWlscy4gIEJ1dCBpdAptaWdodCBjYXVzZSBy
ZWdyZXNzaW9ucyBvbiBvdGhlciBoYXJkd2FyZS4KCkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+
CkNDOiBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbQpDQzogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogbWZpLWNvbW1vbiB8IDMgKystCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
bWZpLWNvbW1vbiBiL21maS1jb21tb24KaW5kZXggYjg2ZmViZGEuLjUyYTM4Y2I0IDEwMDY0NAot
LS0gYS9tZmktY29tbW9uCisrKyBiL21maS1jb21tb24KQEAgLTM3Myw3ICszNzMsOCBAQCBjcmVh
dGVfYnVpbGRfam9icyAoKSB7CiAgICAgICAgIGZpCiAgICAgZmkKIAotICAgIGlmIGJyYW5jaF93
YW50c19saXZlcGF0Y2g7IHRoZW4KKyAgICBpZiBicmFuY2hfd2FudHNfbGl2ZXBhdGNoIHx8Cisg
ICAgICAgICAgWyAkYXJjaCA9IGFybTY0IC1hICIkeGVuYnJhbmNoIiA9IHhlbi00LjExLXRlc3Rp
bmcgXTsgdGhlbgogICAgICAgIGxpdmVwYXRjaF9ydW52YXJzPSdlbmFibGVfbGl2ZXBhdGNoPXRy
dWUnCiAgICAgZmkKICAgICBldmFsICIKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

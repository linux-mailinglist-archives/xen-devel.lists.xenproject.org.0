Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9551E2CFEA
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 22:03:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hViGR-0001kF-9R; Tue, 28 May 2019 20:00:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1LUN=T4=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hViGP-0001YL-LW
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 20:00:01 +0000
X-Inumbo-ID: 2c651351-8183-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2c651351-8183-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 20:00:00 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: +7UgQAEQ5zCTTF0eqE+Mtoc5ecT+xtT9PIYiHmTKsjn8LqqOQZDK2VMSputPvlvUJvOoGmqkLC
 ioBo10sGT7M0s4QrldueYxYOWLWAgAx37d6EP9QpYBisJljzd/T2g5+Z/NxhxnCra1S6jfpKYf
 aEbKaV19Kh9oSptELdi8WKS9onXRPsUpxG1ruEiiAHcs2CN8JpPQu1PkH+nFJ9MhDMssrj9P4b
 3bRZU0etF76cMKth8TLaCNa7p+z5Jjb0TWFNymNFdncmQEFyQN1eEKsLgSUTi5OyxsYaMVyAn0
 jl0=
X-SBRS: 2.7
X-MesageID: 1008342
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,524,1549947600"; 
   d="scan'208";a="1008342"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23789.37660.726217.578999@mariner.uk.xensource.com>
Date: Tue, 28 May 2019 20:59:24 +0100
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <23751.6297.231034.162861@mariner.uk.xensource.com>
References: <23751.6062.590245.436664@mariner.uk.xensource.com>
 <23751.6297.231034.162861@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] Stable trees (4.6 and 4.7), building on stretch, osstest,
 redux
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Olaf
 Hering <olaf@aepfle.de>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiW1BBVENIIFNUQUJMRV0gdG9vbHMvZmlybXdhcmU6IHVwZGF0
ZSBPVk1GIE1ha2VmaWxlLCB3aGVuIG5lY2Vzc2FyeSIpOgo+IE5vdyBkb25lLCBpbmNsdWRpbmcg
Zm9yIHN0YWdpbmctNC42LiAgNC42IGlzIG91dCBvZiBzZWN1cml0eSBzdXBwb3J0LAo+IGJ1dCBv
c3N0ZXN0IHdhbnRzIHRvIGJlIGFibGUgdG8gYnVpbGQgNC42IHNvIHRoYXQgaXQgY2FuIHRlc3QK
PiBtaWdyYXRpb24gZnJvbSA0LjYgdG8gNC43LCBhbmQgNC43ICppcyogc3RpbGwgKGp1c3QgYWJv
dXQpIGluIHNlY3VyaXR5Cj4gc3VwcG9ydC4KPiAKPiBJIGV4cGVjdCB0aGUgNC42IHB1c2ggZ2F0
ZSB0byBmYWlsIGFuZCB0byBoYXZlIHRvIGZvcmNlIHB1c2ggaXQuCj4gCj4gSXQgaXMgYWxzbyBw
b3NzaWJsZSB0aGF0IHdlIHdpbGwgZXhwZXJpZW5jZSBvdGhlciBidWlsZCBmYWxsb3V0LgoKSSBh
bSBzdGlsbCBzdHJ1Z2dsaW5nIHdpdGggdGhpcy4gIDQuNyBhbmQgNC42IHN0aWxsIGRvIG5vdCBi
dWlsZC4KUmlnaHQgbm93IHRoZXJlIGFyZSB0d28gcHJvYmxlbXMgdGhhdCBuZWVkIHRob3VnaHQ6
CgoKMS4gVGhhdCBvbGQgaXB4ZSBpcyBqdXN0IHRvbyBiYWRseSBicm9rZW4uICBJIHNwZW50IGEg
bG9uZyB3aGlsZQp0cnlpbmcgdG8gYmFja3BvcnQgY29tcGlsZXIgZml4ZXMgYnV0IGl0IGlzIHRv
dGFsbHkgcmlkaWN1bG91cy4gIElNTwpvdXIgb25seSBzZW5zaWJsZSBvcHRpb24gaXMgdG8gdXBk
YXRlIGF0IGxlYXN0IG9zc3Rlc3QncyBidWlsZHN4IHRvIGEKbXVjaCBuZXdlciBpcHhlLgoKVGhp
cyBjb3VsZCBiZSBkb25lIGJ5IGNoZXJyeSBwaWNraW5nCiAgICAgMzhhYjk5YjI2YmY0Mjk4YTMz
MTA1ZWM2NmYzZjZhM2Y3ZTA1YTMyNgogICAgICAgaXB4ZTogdXBkYXRlIHRvIG5ld2VyIGNvbW1p
dAood2hpY2ggaXMgZnJvbSB4ZW4gNC44IGlzaCkgb250byBvdXIgNC43IGFuZCA0LjYgYnJhbmNo
ZXMuCgpJZiB0aGlzIGlzIGZlbHQgdG9vIGludHJ1c2l2ZSwgdGhlbiBJIGNvdWxkIHNvbWVob3cg
bWFrZSBpdApjb25kaXRpb25hbCBhbmQgaGF2ZSBvc3N0ZXN0IHVzZSBpdC4gIFRoaXMgaXMgbm90
IGVudGlyZWx5IHRyaXZpYWwKYmVjYXVzZSB3ZSBoYXZlIGFuIGFkIGhvYyBwYXRjaCBhcHBsaWNh
dGlvbiB0aGluZy4KCkknbSBzb3J0IG9mIHRlbXB0ZWQgdG8gaGF2ZSBvc3N0ZXN0IGFyYml0cmFy
aWx5IHJ1bgogICBnaXQgY2hlcnJ5LXBpY2sgMzhhYjk5YjI2YmY0Mjk4YTMzMTA1ZWM2NmYzZjZh
M2Y3ZTA1YTMyNgphdCBzb21lIGFwcHJvcHJpYXRlIHBvaW50Li4uCgoKMi4gaHZtbG9hZGVyIGZh
aWxzIHRvIGJ1aWxkLCBJIHRoaW5rIGJlY2F1c2Ugd2UgbmVlZAogICAgNzgyNWFlMTJkZjFmNmQ0
OGM0ZDAwOWNiYmRmNWE1NWFmZjI3MjkxYgogICAgICBlcnJubzogaW50cm9kdWNlIEVJU0RJUi9F
Uk9GUy9FTk9URU1QVFkgdG8gdGhlIEFCSQogICAgMDM3MjBlYTU0MTM4MmEzY2E4MGVhYWVjMmFh
MTE5MzJiMDNhYWNhZgogICAgICBlcnJubzogZGVjbGFyZSBhbGlhc2VzIHVzaW5nIFhFTl9FUlJO
TygpCiAgICA2Nzc5MDIwNWRmMjZlN2MzZGZlZWY4YjhlNjQxOTRlYmMyNzkyMjBkCiAgICAgIHB1
YmxpYy9lcnJubzogUmVkdWNlIGNvbXBsZXhpdHkgb2YgaW5jbHVzaW9uCiAgICAzMDVlOTU3ZmZl
ZTk0ZmMwNmM0YmE1M2VmNTU2MmYxYjhjMWM2YjAyCiAgICAgIGh2bWxvYWRlcjogdXNlIHhlbi9l
cnJuby5oIHJhdGhlciB0aGFuIHRoZSBob3N0IHN5c3RlbXMgZXJybm8uaAoKSXMgYmFja3BvcnRp
bmcgdGhhdCBsb3QgT0sgPwoKClRoZXJlIGFyZSBhbHNvIHNvbWUgc2ltcGxlIGJhY2twb3J0cyB3
ZSBuZWVkOgogICBjMmExNzg2OWQ1ZGNkODQ1ZDY0NmJmNGRiMTIyY2FkNzM1OTZhMmJlCiAgICAg
bGliZnNpbWFnZTogcmVwbGFjZSBkZXByZWNhdGVkIHJlYWRkaXJfcigpIHdpdGggcmVhZGRpcigp
CiAgIGI5ZGFmZjlkODExMjg1ZjFlNDA2NjliYzYyMWMyMjQxNzkzZjdhOTUKICAgICBsaWJ4bDog
cmVwbGFjZSBkZXByZWNhdGVkIHJlYWRkaXJfcigpIHdpdGggcmVhZGRpcigpCiAgIDY2OGU0ZWRm
OTJmY2Y3Y2I5MjllZWQyMjEwNTlhM2VlYjAyNzIyYzMKICAgICBzdHViZG9tOiBtYWtlIEdNUCBh
d2FyZSB0aGF0IGl0J3MgYmVpbmcgY3Jvc3MtY29tcGlsZWQKICAgMmY5ZWI3M2MyZTJkN2ZkZGE4
ZTI1ODZjMjBmN2RiZDg1NjAwMmViYQogICAgICBzdHViZG9tOiBmaXggc3R1YmRvbS12dHBtIGJ1
aWxkCgoKV2l0aCBhbGwgb2YgdGhlIGFib3ZlLCA0LjYgYnVpbGRzIGFnYWluLiAgSSBndWVzcyA0
Ljcgd2lsbCB0b28uCgpGaXhpbmcgdGhhdCB3aWxsIGFsc28gcHJvYmFibHkgZW5hYmxlIHRoZSA0
LjggcHVzaCBnYXRlIHRvIHBhc3MuICBJdAppcyBjdXJyZW50bHkgYmxvY2tlZCBiZWNhdXNlIGl0
IHdhbnRzIHRvIHRlc3QgNC43LT40LjggbWlncmF0aW9uIGFuZApjYW4ndCBidWlsZCA0LjcuCgpJ
YW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

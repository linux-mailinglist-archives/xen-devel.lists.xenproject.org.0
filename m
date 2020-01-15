Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAE213BE49
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 12:18:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irgeq-000873-90; Wed, 15 Jan 2020 11:16:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eK3x=3E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1irgeo-00086y-Q3
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 11:16:18 +0000
X-Inumbo-ID: 6e26009c-3788-11ea-a985-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e26009c-3788-11ea-a985-bc764e2007e4;
 Wed, 15 Jan 2020 11:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579086969;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=m/jXY28h5Tn6MU5jD9FE3O73wtHdPDdWQ+Bp3kDM9VU=;
 b=CSpbWwKHUaIkEDXoLiXyPYT652bX4jF4JkWD3TL79iLR6os44yqWwTQL
 pNo4QfBxvDklY1vgaksXxIdXtVkN3s3q3f18to41P5/WERf7UoWp/ls1H
 AjkOVWILgMg7kGgBEOOfyyvMBLkgdbUu/WuBDXyayGrrV140kORdEUk/n 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mZHQ+uJK7ucLLxxY4tkeQa974IVXCz/7hjlAl0wejDog/brKjwcg/264mXJesuETe83foH02zm
 PsSAPlcZ+K1ho4UBbaRYhi0UZ/AMa6hVUinfjuVDNBPP22F2fbvpZ4E0qYSaS528xmXZ+G5fbH
 UZKXP6MyAnGczBR2K3QX7/C/OITVz9mCA/xNLOc8G/9tEJDuPEGr5LV1mU4hHuR4rWveH9RDRz
 DQtO3/z1QPurdUbAKvGzhqr3fdaGNvPxaRKmc2zBOUCQgdXGpZ24MZziAqG+AdBz7qNuS/k/AF
 RD4=
X-SBRS: 2.7
X-MesageID: 11307032
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,322,1574139600"; d="scan'208";a="11307032"
Date: Wed, 15 Jan 2020 12:16:01 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Message-ID: <20200115111601.GN11738@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: [Xen-devel] Issues/improvements performing flush of guest TLBs
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpGb3IgdGhlIGxhc3QgZGF5cyBJJ3ZlIGJlZW4gdHJ5aW5nIHRvIGZpZ3VyZSBvdXQg
aG93IHRvIHByb3Blcmx5CnBlcmZvcm0gZmx1c2hlcyBvZiBndWVzdCBUTEJzIGZyb20gdGhlIGh5
cGVydmlzb3IuIFdlIGN1cnJlbnRseQpwcm92aWRlIGEgaHlwZXJjYWxsIHRvIEhWTSBndWVzdHMg
KEhWTU9QX2ZsdXNoX3RsYnMpLiBUaGUgaHlwZXJjYWxsCmhvd2V2ZXIgcGF1c2VzIGFsbCB2Q1BV
cyB0aGF0IHJlcXVpcmUgYSBmbHVzaCBhbmQgdGhlbiBjYWxsCnBhZ2luZ191cGRhdGVfY3IzLCB3
aGljaCBpcyBoaWdobHkgaW5lZmZpY2llbnQuIFRoZSBwZXJmb3JtYW5jZSBvZgpzdWNoIGltcGxl
bWVudGF0aW9uIG9uIGEgbm9uLW92ZXJsb2FkZWQgZW52aXJvbm1lbnQgc2VlbXMgdG8gYmUgb24g
cGFyCndpdGggdGhlIGd1ZXN0IGlzc3VpbmcgSVBJcyBhbmQgcGVyZm9ybWluZyBjcjMvY3I0IHdy
aXRlcyBpbiBvcmRlciB0bwpmbHVzaCwgd2hpY2ggbWFrZXMgdGhlIHBvaW50IG9mIHByb3ZpZGlu
ZyBzdWNoIGh5cGVyY2FsbCBtb290LgoKSSB3b3VsZCBsaWtlIHRvIHByb3ZpZGUgaG9va3MgKGlu
IHRoZSBwYWdpbmdfbW9kZSBzdHJ1Y3QpIGZvciB0aGUgSEFQCmFuZCBTaGFkb3cgcGFnaW5nIG1v
ZGVzIGluIG9yZGVyIHRvIHBlcmZvcm0gZ3Vlc3QgVExCIGZsdXNoZXM6CgogLSBIQVA6IGRlcGVu
ZHMgb24gd2hldGhlciBBU0lEL1ZQSUQgaXMgaW4gdXNlLiBJZiBub3QgaW4gdXNlIHRoZQogICBU
TEJzIHdpbGwgYmUgZmx1c2hlZCBvbiBlYWNoIHZtZXhpdC92bWVudGVyLiBJZiBpbiB1c2UgY2hh
bmdpbmcgdGhlCiAgIFZQSUQvQVNJRCBvciBmbHVzaGluZyB0aGUgc3BlY2lmaWMgVlBJRC9BU0lE
IHNob3VsZCBiZSBlbm91Z2guIFRoaXMKICAgcmVxdWlyZXMgY2FsbGluZyBodm1fYXNpZF9mbHVz
aF92Y3B1IGZvciBlYWNoIHZDUFUgdG8gYmUgZmx1c2hlZAogICBhbmQgaXNzdWluZyBhbiBJUEkg
dG8gdGhlIGN1cnJlbnRseSBydW5uaW5nIHZDUFVzIGluIG9yZGVyIHRvCiAgIHRyaWdnZXIgYSB2
bWV4aXQgdGhhdCB3aWxsIHN5bmMgdGhlIFZQSUQvQVNJRCB3aXRoIHRoZSB2YWx1ZSBpbiB0aGUK
ICAgdm1jcy92bWNiLiBJZToKCiAgICBmb3JfZWFjaF92Y3B1KCB2LCBkICkKICAgICAgICBodm1f
YXNpZF9mbHVzaF92Y3B1KHYpOwogICAgb25fc2VsZWN0ZWRfY3B1cyguLi4uKTsKCiAtIFNoYWRv
dzogaXQncyBub3QgY2xlYXIgdG8gbWUgZXhhY3RseSB3aGljaCBwYXJ0cyBvZiBzaF91cGRhdGVf
Y3IzCiAgIGFyZSBuZWVkZWQgaW4gb3JkZXIgdG8gcGVyZm9ybSBhIGd1ZXN0IFRMQiBmbHVzaC4g
SSB0aGluayBjYWxsaW5nOgoKI2lmIChTSEFET1dfT1BUSU1JWkFUSU9OUyAmIFNIT1BUX1ZJUlRV
QUxfVExCKQogICAgLyogTm8gbG9uZ2VyIHNhZmUgdG8gdXNlIGNhY2hlZCBndmEtPmdmbiB0cmFu
c2xhdGlvbnMgKi8KICAgIHZ0bGJfZmx1c2godik7CiNlbmRpZgojaWYgKFNIQURPV19PUFRJTUla
QVRJT05TICYgU0hPUFRfT1VUX09GX1NZTkMpCiAgICAvKiBOZWVkIHRvIHJlc3luYyBhbGwgdGhl
IHNoYWRvdyBlbnRyaWVzIG9uIGEgVExCIGZsdXNoLiAqLwogICAgc2hhZG93X3Jlc3luY19jdXJy
ZW50X3ZjcHUodik7CiNlbmRpZgoKICAgIGlmICggaXNfaHZtX2RvbWFpbihkKSApCiAgICAgICAg
LyoKICAgICAgICAgKiBMaW5lYXIgbWFwcGluZ3MgbWlnaHQgYmUgY2FjaGVkIGluIG5vbi1yb290
IG1vZGUgd2hlbiBBU0lEL1ZQSUQgaXMKICAgICAgICAgKiBpbiB1c2UgYW5kIGhlbmNlIHRoZXkg
bmVlZCB0byBiZSBmbHVzaGVkIGhlcmUuCiAgICAgICAgICovCiAgICAgICAgaHZtX2FzaWRfZmx1
c2hfdmNwdSh2KTsKCiAgIFNob3VsZCBiZSBlbm91Z2ggYnV0IEknbSBub3QgdmVyeSBmYW1pbGlh
ciB3aXRoIHRoZSBzaGFkb3cgY29kZSwKICAgYW5kIGhlbmNlIHdvdWxkIGxpa2Ugc29tZSBmZWVk
YmFjayBmcm9tIHNvbWVvbmUgbW9yZSBmYW1pbGlhciB3aXRoCiAgIHNoYWRvdyBpbiBvcmRlciB0
byBhc3NlcnQgZXhhY3RseSB3aGF0J3MgcmVxdWlyZWQgdG8gcGVyZm9ybSBhCiAgIGd1ZXN0IFRM
QiBmbHVzaC4KCiAgIEFsc28sIEFGQUlDVCBzaF91cGRhdGVfY3IzIGlzIG5vdCBzYWZlIHRvIGJl
IGNhbGxlZCBvbiB2Q1BVcwogICBjdXJyZW50bHkgcnVubmluZyBvbiByZW1vdGUgcENQVXMsIGFs
YmVpdCB0aGVyZSBhcmUgbm8gYXNzZXJ0aW9ucwogICB0byB0aGF0IGVuZC4gSXQncyBhbHNvIG5v
dCBjbGVhciB3aGljaCBwYXJ0cyBvZiBzaF91cGRhdGVfY3IzIGFyZQogICBzYWZlIHRvIGJlIGNh
bGxlZCB3aGlsZSB0aGUgdkNQVSBpcyBydW5uaW5nLgoKRldJVywgdGhlcmUgYWxzbyBzZWVtcyB0
byBiZSBhIGxvdCBvZiB1bm5lZWRlZCBmbHVzaGVzIG9mIEhWTSBndWVzdHMKVExCLCBhcyBkb190
bGJfZmx1c2ggd2lsbCB1bmNvbmRpdGlvbmFsbHkgY2xlYXIgYWxsIEhWTSBndWVzdCBUTEJzIG9u
CnRoZSBwQ1BVIGJ5IGNhbGxpbmcgaHZtX2FzaWRfZmx1c2hfY29yZSB3aGljaCBJIGRvbid0IHRo
aW5rIGl0J3MKbmVjZXNzYXJ5L2ludGVuZGVkIGJ5IHF1aXRlIGEgbG90IG9mIHRoZSBYZW4gVExC
IGZsdXNoIGNhbGxlcnMuIEkKZ3Vlc3MgdGhpcyB3b3VsZCBhbHNvIHdhcnJhbnQgYSBkaWZmZXJl
bnQgZGlzY3Vzc2lvbiwgYXMgdGhlcmUgc2VlbXMKdG8gYmUgcm9vbSBmb3IgaW1wcm92ZW1lbnQg
aW4gdGhpcyBhcmVhLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=

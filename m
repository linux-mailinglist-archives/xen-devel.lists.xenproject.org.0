Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD649C8D47
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 17:48:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFgn8-00073J-1d; Wed, 02 Oct 2019 15:43:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RLuE=X3=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iFgn5-00073E-SP
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 15:43:47 +0000
X-Inumbo-ID: 6b5cfe2e-e52b-11e9-97fb-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 6b5cfe2e-e52b-11e9-97fb-bc764e2007e4;
 Wed, 02 Oct 2019 15:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570031027;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=t8cc82Mbgycxgk9IqTjJj6d+4uJbueBy6X39Cas15Xo=;
 b=b3Hy5Gexpq7tWTVneRcx4Oa/F6ENuRhTVoHKzMxBATLssPfC+0dZ096/
 F27+pBMp3HfgyuMB1obw4kIstFCyC44vesJobP4mGKLClvRQVuex36Kqg
 bgaJMYxNQOVUJn/PEVlDtCDVfcJDUMaBwel7yD4oNOHhLImvGVdXIPUjm g=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Bfsabup1vLdSnDohqDoCsFPFPAqENv1H+FVRw45Gcy8Nq6o2GQm6pKGsd6HBcW2qvXKLDaecVK
 M+iS5KSoK1gbgcJAQBQ7AafnpNIbomwTUIjSGF+DQaQMOGUc3G9l7KzYwgNEeSUBI1+Yy1f71i
 Kbnbgp0yeN69oL6Q/psoZzVegO5WT2Lo3vIkL24ftkU7qvTEchrFZCiB0mXW63OT06qLFiRA9D
 RR9CQzQb9QrCorfJV16q99J1joSJ7YieIEgbSmHv57/lNIiJTNhi2TewjuJT0hHAYjLaoKIJPr
 JZc=
X-SBRS: 2.7
X-MesageID: 6376979
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,574,1566878400"; 
   d="scan'208";a="6376979"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23956.50605.996440.673345@mariner.uk.xensource.com>
Date: Wed, 2 Oct 2019 16:43:41 +0100
To: Juergen Gross <jgross@suse.com>
In-Reply-To: <9a61b361c46b5b1082ef47ac6aa25f8b5db7646b.1569680095.git-series.marmarek@invisiblethingslab.com>
References: <cover.ab9be47e05c2dc2aa047d0a810c29ecd14bfe463.1569680095.git-series.marmarek@invisiblethingslab.com>
 <9a61b361c46b5b1082ef47ac6aa25f8b5db7646b.1569680095.git-series.marmarek@invisiblethingslab.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v8 1/4] libxl: fix cold plugged PCI device
 with stubdomain
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVlcmdlbi4gIFRoaXMgc2VyaWVzCiAgaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9h
cmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA5L21zZzAzMDcyLmh0bWwKbmVlZHMgeW91ciBy
ZWxlYXNlIHJldmlldy4KCkhlcmUncyB0aGUgZmlyc3QgcGF0Y2guICBJIGNhbiBib3VuY2UgeW91
IGEgZGlnZXN0IGlmIHlvdSBsaWtlLgoKVGhhbmtzLApJYW4uCgpNYXJlayBNYXJjenlrb3dza2kt
R8OzcmVja2kgd3JpdGVzICgiW1BBVENIIHY4IDEvNF0gbGlieGw6IGZpeCBjb2xkIHBsdWdnZWQg
UENJIGRldmljZSB3aXRoIHN0dWJkb21haW4iKToKPiBXaGVuIGxpYnhsX19kZXZpY2VfcGNpX2Fk
ZCgpIGlzIGNhbGxlZCwgc3R1YmRvbWFpbiBpcyBhbHJlYWR5IHJ1bm5pbmcsCj4gZXZlbiB3aGVu
IHN0aWxsIGNvbnN0cnVjdGluZyB0aGUgdGFyZ2V0IGRvbWFpbi4gUHJldmlvdXNseSwgZG9fcGNp
X2FkZCgpCj4gd2FzIGNhbGxlZCB3aXRoICdzdGFydGluZycgaGFyZGNvZGVkIHRvIGZhbHNlLCBi
dXQgbm93IGRvX3BjaV9hZGQoKSBzaGFyZXMKPiAnc3RhcnRpbmcnIGZsYWcgaW4gcGNpX2FkZF9z
dGF0ZSBmb3IgYm90aCB0YXJnZXQgZG9tYWluIGFuZCBzdHViZG9tYWluLgo+IAo+IEZpeCB0aGlz
IGJ5IHJlc2V0dGluZyAobG9jYWwpICdzdGFydGluZycgdG8gZmFsc2UgaW4gcGNpX2FkZF9kbV9k
b25lKCkKPiAocHJldmlvdXNseSBwYXJ0IG9mIGRvX3BjaV9hZGQoKSkgd2hlbiBoYW5kbGluZyBz
dHViZG9tYWluLCByZWdhcmRsZXNzCj4gb2YgcGFzLT5zdGFydGluZyB2YWx1ZS4KPiAKPiBGaXhl
czogMTFkYjU2ZjlhNiAobGlieGxfcGNpOiBVc2UgbGlieGxfX2FvX2RldmljZSB3aXRoIGxpYnhs
X19kZXZpY2VfcGNpX2FkZCkKPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8Oz
cmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+Cj4gLS0tCj4gIHRvb2xzL2xp
YnhsL2xpYnhsX3BjaS5jIHwgNSArKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX3Bj
aS5jIGIvdG9vbHMvbGlieGwvbGlieGxfcGNpLmMKPiBpbmRleCA0NzI1ODE3Li4yZWRmZjY0IDEw
MDY0NAo+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5jCj4gKysrIGIvdG9vbHMvbGlieGwv
bGlieGxfcGNpLmMKPiBAQCAtMTMwMCw2ICsxMzAwLDEwIEBAIHN0YXRpYyB2b2lkIHBjaV9hZGRf
ZG1fZG9uZShsaWJ4bF9fZWdjICplZ2MsCj4gIAo+ICAgICAgaWYgKHJjKSBnb3RvIG91dDsKPiAg
Cj4gKyAgICAvKiBzdHViZG9tYWluIGlzIGFsd2F5cyBydW5uaW5nIGJ5IG5vdywgZXZlbiBhdCBj
cmVhdGUgdGltZSAqLwo+ICsgICAgaWYgKGlzc3R1YmRvbSkKPiArICAgICAgICBzdGFydGluZyA9
IGZhbHNlOwo+ICsKPiAgICAgIHN5c2ZzX3BhdGggPSBHQ1NQUklOVEYoU1lTRlNfUENJX0RFViIv
IlBDSV9CREYiL3Jlc291cmNlIiwgcGNpZGV2LT5kb21haW4sCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBjaWRldi0+YnVzLCBwY2lkZXYtPmRldiwgcGNpZGV2LT5mdW5jKTsKPiAgICAg
IGYgPSBmb3BlbihzeXNmc19wYXRoLCAiciIpOwo+IEBAIC0xNTU5LDcgKzE1NjMsNiBAQCB2b2lk
IGxpYnhsX19kZXZpY2VfcGNpX2FkZChsaWJ4bF9fZWdjICplZ2MsIHVpbnQzMl90IGRvbWlkLAo+
ICAgICAgICAgIEdDTkVXKHBjaWRldl9zKTsKPiAgICAgICAgICBsaWJ4bF9kZXZpY2VfcGNpX2lu
aXQocGNpZGV2X3MpOwo+ICAgICAgICAgIGxpYnhsX2RldmljZV9wY2lfY29weShDVFgsIHBjaWRl
dl9zLCBwY2lkZXYpOwo+IC0gICAgICAgIC8qIHN0dWJkb21haW4gaXMgYWx3YXlzIHJ1bm5pbmcg
Ynkgbm93LCBldmVuIGF0IGNyZWF0ZSB0aW1lICovCj4gICAgICAgICAgcGFzLT5jYWxsYmFjayA9
IGRldmljZV9wY2lfYWRkX3N0dWJkb21fZG9uZTsKPiAgICAgICAgICBkb19wY2lfYWRkKGVnYywg
c3R1YmRvbWlkLCBwY2lkZXZfcywgcGFzKTsgLyogbXVzdCBiZSBsYXN0ICovCj4gICAgICAgICAg
cmV0dXJuOwo+IC0tIAo+IGdpdC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=

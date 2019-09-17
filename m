Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D21B51C7
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 17:47:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAFfB-0004u2-83; Tue, 17 Sep 2019 15:45:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAFfA-0004tx-9C
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 15:45:08 +0000
X-Inumbo-ID: 1f41371e-d962-11e9-9619-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f41371e-d962-11e9-9619-12813bfff9fa;
 Tue, 17 Sep 2019 15:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568735107;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=AvKjTLNKSC8jry/wK7SkFr3wgJf4oElQsz2qFzNTcO4=;
 b=fCamkyP54KDsi0ryYTgFKjh86C+XZCvsQUfFtWgpq3o4wwxPpQkvtyfn
 yaAA7uRq//w7GfxGW199TuIhBrquKcGS8Mf6aNICZT6MZZzgYr4ns60sg
 WI//s8owncC/OGAmKg/iL/w6OSQr2G+hqeKGYFkZnqzxoF9ug6EHn2eYQ c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 76XWIbW+f7Sif9cqHzWbY9zrMBUmkwTX6s3QJjAkhdAJwDT/cUc8oJpnu46CLRtoyiUj36Q369
 UszrkuFgFSFyJn+Bgusi7MzGBTC4HXpQkK/sGhLREIPo/FeB1a4GM0bfFNeCw9gq/6zQKbtNxv
 7bPGuqp0nF40B4CeEHA1ZTpnNzBK/bwxMQm1fKVnBMO0zawtYymXtFsriRtBFWqftFZBsXkjg8
 7y/8Ka1wkJRtfZqIPYBYbRZcrPSBHnSCNJoR95i1Xk5exzg6pXVdO6soKRNX4UF/I+S4Fz+0OM
 eCg=
X-SBRS: 2.7
X-MesageID: 5881634
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5881634"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23936.65374.447070.19120@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 16:44:30 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190614103801.22619-4-anthony.perard@citrix.com>
References: <20190614103801.22619-1-anthony.perard@citrix.com>
 <20190614103801.22619-4-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 3/9] libxl_internal: Introduce
 libxl__ev_lock for devices hotplug via QMP
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYyIDMvOV0gbGlieGxfaW50ZXJuYWw6IElu
dHJvZHVjZSBsaWJ4bF9fZXZfbG9jayBmb3IgZGV2aWNlcyBob3RwbHVnIHZpYSBRTVAiKToKPiBU
aGUgY3VycmVudCBsb2NrIGBkb21haW5fdXNlcmRhdGFfbG9jaycgY2FuJ3QgYmUgdXNlZCB3aGVu
IG1vZGlmaWNhdGlvbgo+IHRvIGEgZ3Vlc3QgaXMgZG9uZSBieSBzZW5kaW5nIGNvbW1hbmQgdG8g
UUVNVSwgdGhpcyBpcyBhIHNsb3cgcHJvY2Vzcwo+IGFuZCByZXF1aXJlcyB0byBjYWxsIENUWF9V
TkxPQ0ssIHdoaWNoIGlzIG5vdCBwb3NzaWJsZSB3aGlsZSBob2xkaW5nCj4gdGhlIGBkb21haW5f
dXNlcmRhdGFfbG9jaycuCj4gCj4gVG8gcmVzb2x2ZSB0aGlzIGlzc3VlLCB3ZSBjcmVhdGUgYSBu
ZXcgbG9jayB3aGljaCBjYW4gdGFrZSBvdmVyIHBhcnQKPiBvZiB0aGUgam9iIG9mIHRoZSBqc29u
X2xvY2suCgpUaGFua3MuICBUaGlzIGlzIGJhc2ljYWxseSBmaW5lLiAgSSBoYXZlIG9ubHkgdHJp
dmlhbCBjb21tZW50cy4KCj4gK3ZvaWQgbGlieGxfX2V2X2xvY2tfZ2V0KGxpYnhsX19lZ2MgKmVn
YywgbGlieGxfX2V2X2xvY2sgKmxvY2spCgpJIHdvbmRlciBpZiB0aGlzIGlzIHRoZSByaWdodCBu
YW1lIGZvciB0aGlzLiAgRWZmZWN0aXZlbHkgeW91IGhhdmUKY2FsbGVkIHRoaXMgbG9jayAibG9j
ayIuICBNYXliZSAiZGxvY2siIG9yICJkZXZsb2NrIiBvciAic2Rsb2NrIiAoc2xvdwpkZXZpY2Ug
bG9jaykgb3Igc29tZXRoaW5nID8gIFNvcnJ5IGZvciBiaWtlc2hlZGRpbmcgYnV0IGhvcGVmdWxs
eQpzZWRkZXJ5IHdpbGwgYmUgZWFzeS4KCj4gK3N0YXRpYyB2b2lkIGV2X2xvY2tfcHJlcGFyZV9m
b3JrKGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX2V2X2xvY2sgKmxvY2spCj4gK3sKLi4uCj4gKyAg
ICAgICAgICAgICAgICAvKiBBbGwgb3RoZXIgZXJybm86IEVCQURGLCBFSU5WQUwsIEVOT0xDSywg
RVdPVUxEQkxPQ0sgKi8KPiArICAgICAgICAgICAgICAgIExPR0VEKEVSUk9SLCBkb21pZCwKPiAr
ICAgICAgICAgICAgICAgICAgICAgICJ1bmV4cGVjdGVkIGVycm9yIHdoaWxlIHRyeWluZyB0byBs
b2NrICVzLCBmZD0lZCwgZXJybm89JWQiLAo+ICsgICAgICAgICAgICAgICAgICAgICAgbG9ja2Zp
bGUsIGZkLCBlcnJubyk7CgpMT0dFRCBwcmludHMgc3RyZXJyb3IoZXJybm8pIHNvIHlvdSBkb24n
dCBuZWVkIHRvIHByaW50IHRoZSBudW1lcmljCnZhbHVlIHdpdGggJWQgdG9vLiAgVGhhdCdzIHdo
YXQgdGhlIEUgaW4gaXRzIG5hbWUgaXMuCgo+ICt2b2lkIGxpYnhsX19ldl91bmxvY2sobGlieGxf
X2djICpnYywgbGlieGxfX2V2X2xvY2sgKmxvY2spCj4gK3sKPiArICAgIGludCByOwo+ICsKPiAr
ICAgIGFzc2VydCghbGlieGxfX2V2X2NoaWxkX2ludXNlKCZsb2NrLT5jaGlsZCkpOwo+ICsKPiAr
ICAgIC8qIEl0J3MgaW1wb3J0YW50IHRvIHVubGluayB0aGUgZmlsZSBiZWZvcmUgcmVsZWFzaW5n
IHRoZSBsb2NrIHRvIGF2b2lkCj4gKyAgICAgKiB0aGUgZm9sbG93aW5nIHJhY2UgKGlmIHVubG9j
ay9jbG9zZSBiZWZvcmUgdW5saW5rKToKPiArICAgICAqCj4gKyAgICAgKiAgIFAxIExPQ0sgICAg
ICAgICAgICAgICAgICAgICAgICAgUDIgVU5MT0NLCj4gKyAgICAgKiAgIGZkMSA9IG9wZW4obG9j
a2ZpbGUpCj4gKyAgICAgKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5sb2Nr
KGZkMikKPiArICAgICAqICAgZmxvY2soZmQxKQo+ICsgICAgICogICBmc3RhdCBhbmQgc3RhdCBj
aGVjayBzdWNjZXNzCj4gKyAgICAgKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5saW5rKGxvY2tmaWxlKQo+ICsgICAgICogICByZXR1cm4gbG9jawo+ICsgICAgICoKPiArICAg
ICAqIEluIGFib3ZlIGNhc2UgUDEgdGhpbmtzIGl0IGhhcyBnb3QgaG9sZCBvZiB0aGUgbG9jayBi
dXQKPiArICAgICAqIGFjdHVhbGx5IGxvY2sgaXMgcmVsZWFzZWQgYnkgUDIgKGxvY2tmaWxlIHVu
bGlua2VkKS4KPiArICAgICAqLwoKSSB3b25kZXIgaWYgaXQgd291bGQgYmUgYmV0dGVyIHRvIHJl
ZmVyIHRvIHRoZSBvdGhlciBjb3B5IG9mIHRoaXMKY29tbWVudCBieSBsaWJ4bF9fdW5sb2NrX2Rv
bWFpbl91c2VyZGF0YS4KClJlZ2FyZHMsCklhbi4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs

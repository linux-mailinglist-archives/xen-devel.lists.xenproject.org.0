Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5770F35F5F
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 16:36:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYWyK-0007YT-5D; Wed, 05 Jun 2019 14:33:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UgCu=UE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hYWyI-0007YO-9a
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 14:32:58 +0000
X-Inumbo-ID: cd7c0cd4-879e-11e9-8d90-4fbaf5c3ffd7
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd7c0cd4-879e-11e9-8d90-4fbaf5c3ffd7;
 Wed, 05 Jun 2019 14:32:54 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0hyhe46P2hDWBmYb1zUh1tNTgkbWO9QPNZT5LvMpb++XgSEkwUk9JkVD1+y8ErrRyNn96iRvWh
 weHHbKA6RVE66MY+QGjr0uVQ14yMwY7hFqAfUcqpSPeXiHhwlO6XxPiiNZab4BqNf3eW9zA0IU
 7xkmietCZB3zTQyYDlir1ozecJYSgDDnRxh66YPX55b5KjM82h/wBTHfUmBCaAhRkdwH2jjZzP
 1ngTZ3+jV/JXtWR0nnFIOVi/YwIk22g+HJkt+C8WYZL7i3wdiCmzjTq1TfJ7MTPyY6StVUV0tn
 y/g=
X-SBRS: 2.7
X-MesageID: 1349274
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1349274"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23799.53876.440475.866985@mariner.uk.xensource.com>
Date: Wed, 5 Jun 2019 15:32:20 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190605141015.GJ2126@perard.uk.xensource.com>
References: <20190409164542.30274-1-anthony.perard@citrix.com>
 <20190409164542.30274-5-anthony.perard@citrix.com>
 <23798.42555.428964.824573@mariner.uk.xensource.com>
 <20190605141015.GJ2126@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 4/9] libxl_internal: Create new lock for
 devices hotplug via QMP
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
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCA0LzldIGxpYnhsX2ludGVybmFsOiBD
cmVhdGUgbmV3IGxvY2sgZm9yIGRldmljZXMgaG90cGx1ZyB2aWEgUU1QIik6Cj4gU28sIGluc3Rl
YWQgb2YgdGhhdCBpbnRlcmZhY2UsIGhvdyBhYm91dCBhIGRpZmZlcmVudCBvbmUgdGhhdCB1c2Vz
IHRoZQo+IHNhbWUgQyB0eXBlIGZvciBib3RoIGtpbmQgb2YgbG9jaz8KPiAKPiAgICAgbGlieGxf
X2xvY2sgKmxpYnhsX19sb2NrX2RvbWFpbl91c2VyZGF0YShsaWJ4bF9fZ2MgKiwgbGlieGxfZG9t
aWQpOwo+ICAgICBsaWJ4bF9fbG9jayAqbGlieGxfX2xvY2tfZG9tYWluX3FtcChsaWJ4bF9fZ2Mg
KiwgbGlieGxfZG9taWQpOwo+ICAgICB2b2lkIGxpYnhsX191bmxvY2sobGlieGxfX2xvY2sgKik7
CgpJIHRoaW5rIHRoYXQgd291bGQgYmUgZmluZS4KCj4gT3IgbWF5YmUgYXZvaWQgaGF2aW5nIHR3
byBmdW5jdGlvbnMgZm9yIGxvY2tpbmcgYW5kIHVzZSBhICNkZWZpbmUvZW51bQo+IGluc3RlYWQ6
Cj4gICAgIGxpYnhsX19sb2NrX2RvbWFpbihnYywgZG9taWQsIExPQ0tfVVNFUkRBVEEpOwo+ICAg
ICBsaWJ4bF9fbG9ja19kb21haW4oZ2MsIGRvbWlkLCBMT0NLX1FNUCk7CgpPciB0aGlzLgoKQnV0
IEkgdGhpbmsgbWF5YmUgdGhpcyBjb252ZXJzYXRpb24gd2lsbCBiZSBzdXBlcnNlZGVkIGJ5IHRo
ZSBuZWVkIHRvCnJlZG8gdGhlIGltcGxlbWVudGF0aW9uIHdoaWNoIHdpbGwgcmVzdWx0IGluIGEg
dG90YWxseSBkaWZmZXJlbnQgQVBJCmZvciB0aGUgc2xvdyBsb2NrLCBhbmQgcHJvYmFibHkgYSBk
aWZmZXJlbnQgc3RhdGUgc3RydWN0LgoKPiBXaGF0IGRvIHlvdSB0aGluaz8gV291bGQgdGhlIGZp
cnN0IHByb3Bvc2FsIGJlIGVub3VnaCB0byBhdm9pZCBoYXZpbmcgdG8KPiB3cml0ZSBgdXNlcmRh
dGEnIG9yIGBxbXAnIHR3aWNlIG9uIHVubG9jaz8KCkkgZG9uJ3QgKm1pbmQqIHRoZSB3cml0aW5n
IGB1c2VyZGF0YScgb3IgYHFtcCcgdHdpY2UuICBJIGp1c3QKZGlzY291bnRpbmcgaXQgYXMgYSAq
YmVuZWZpdCouICBJIG1pbmQgdGhlIGR1cGxpY2F0ZWQgaW1wbGVtZW50YXRpb24KY29kZS4KCj4g
PiBNYXliZSBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gdHJ5IG9uY2Ugd2l0aCBMT0NLX05CLCBhbmQg
dG8gZm9yayBpZiB0aGlzCj4gPiBpcyBub3Qgc3VjY2Vzc2Z1bC4gIEJ1dCBpdCB3b3VsZCBiZSBz
aW1wbGVyIHRvIGFsd2F5cyBmb3JrLi4uCj4gCj4gQWZ0ZXIgb3VyIHRhbGsgSVJMLCBJJ2xsIGdv
IHRoZSBmb3JrIHJvdXRlLgo+IEFsc28sIEknbSB0aGlua2luZyB0byBhbHdheXMgZm9yayB3aGVu
IGxpYnhsIGlzIGJ1aWx0IHdpdGggImRlYnVnPXkiLAo+IGFuZCBhbGxvdyB0aGUgb3B0aW1pc2F0
aW9uIG9mIHRyeWluZyBmaXJzdCB3aXRoIExPQ0tfTkIgd2hlbiBidWlsdCB3aXRoCj4gImRlYnVn
PW4iLCBzbyB0aGUgZm9ya2VkIGNvZGUgd2lsbCBhY3R1YWxseSBiZSB0ZXN0ZWQgcmVndWxhcnku
CgpHb29kIHBsYW4uCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1CA161672
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 16:44:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3iVc-0007wC-F9; Mon, 17 Feb 2020 15:40:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qCVl=4F=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j3iVb-0007w7-7q
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 15:40:31 +0000
X-Inumbo-ID: d3a0b764-519b-11ea-8008-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3a0b764-519b-11ea-8008-12813bfff9fa;
 Mon, 17 Feb 2020 15:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581954030;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Szb9pr5GF6RN30snS29W94Qr2RcHJI6dimVGDUUMqsU=;
 b=Y9LvLh6L4LU8IvzbJp1HY0rV6rSHVu6TLQmYmrwMcsiik/SIpUWDEoYJ
 i/TWbXYCQKAYmvcca5aU0MtoGNKQtHzEuLf+IlibPMaO70sFVrxvhQ/Ra
 49PAMNHDBe1HKjFwBYMosySqT/vIhxGTlI3xBS6bEdYe+fzX+zsd+f/+Q k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XvL4wYn+zyhfeVNu0Tbi2gmskJbP3oenByIif0vOSu719sraIR7LN6X3KX4HGyACAMxJDebiij
 8iG8giZpfR9g7tZQloPJg9F49tnLEr78rtV59Qp5ExOinkwNsNW89cbVgpkDuRxRKOUbCWzXvu
 aFzw+9KyltXrAPeKOWe/iRLqUcCDswPeeSMZT9WpHWR5a3+rqoL+ZFfG93KsMlJJt1Owhp34bi
 mYx9kuWn/CN8iOpTdJYaXROa7qn18Jc3mlggkcQoJLAcBWlu1qkff73rUXjEZZ1n5kjyk0VaUl
 fWI=
X-SBRS: 2.7
X-MesageID: 13003814
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,453,1574139600"; d="scan'208";a="13003814"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24138.46059.95105.526593@mariner.uk.xensource.com>
Date: Mon, 17 Feb 2020 15:40:27 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20200205165056.11734-6-andrew.cooper3@citrix.com>
References: <20200205165056.11734-1-andrew.cooper3@citrix.com>
 <20200205165056.11734-6-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 5/6] tools/libx[cl]: Don't use
 HVM_PARAM_PAE_ENABLED as a function parameter
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
Cc: Anthony
 Perard <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggNS82XSB0b29scy9saWJ4W2NsXTogRG9uJ3Qg
dXNlIEhWTV9QQVJBTV9QQUVfRU5BQkxFRCBhcyBhIGZ1bmN0aW9uIHBhcmFtZXRlciIpOgo+IFRo
ZSBzb2xlIHVzZSBvZiBIVk1fUEFSQU1fUEFFX0VOQUJMRUQgaXMgYXMgYSBub24tc3RhbmRhcmQg
Y2FsbGluZwo+IGNvbnZlbnRpb24gZm9yIHhjX2NwdWlkX2FwcGx5X3BvbGljeSgpLiAgUGFzcyBQ
QUUgYXMgYSByZWd1bGFyCj4gcGFyYW1ldGVyIGluc3RlYWQuCgpGb2xsb3dpbmcgb3VyIGNvbnZl
cnNhdGlvbiBvbiBpcmMsIEkgaGF2ZSB0cmllZCB0byB3cml0ZSBhbgpleHBsYW5hdGlvbiBpbiBt
eSBvd24gd29yZHMgb2Ygd2hhdCB0aGlzIGNvbW1pdCBpcyBkb2luZy4KCiAgVGhlIHZhbHVlIG9m
IEhWTV9QQVJBTV9QQUVfRU5BQkxFRCBpcyBzZXQgYnkgdGhlIHRvb2xzdGFjay4gIEFuZCB0aGUK
ICBvbmx5IHBsYWNlIHRoYXQgcmVhZHMgaXQgaXMgYWxzbyBpbiB0aGUgdG9vbHN0YWNrLCBpbgog
IHhjX2NwdWlkX2FwcGx5X3BvbGljeS4gIEVmZmVjdGl2ZWx5LCB0aGlzIGh5cGVydmlzb3IgZG9t
YWluCiAgcGFyYW1ldGVyIGlzIHVzZWQgc29sZWx5IGFzIGEgd2F5IHRvIHBhc3MgdGhpcyBib29s
ZWFuIHBhcmFtZXRlcgogIGZyb20gb25lIHBhcnQgb2YgdGhlIHRvb2xzdGFjayB0byBhbm90aGVy
LgoKICBUaGlzIGlzIG5vdCBzZW5zaWJsZS4KCiAgUmVwbGFjZSBpdHMgdXNlIGluIHhjX2NwdWlk
X2FwcGx5X3BvbGljeSB3aXRoIGEgcGxhaW4gYm9vbGVhbgogIHBhcmFtZXRlciwgcGFzc2VkIGRp
cmVjdGx5IGJ5IHRoZSBvbmUgKGluLXRyZWUpIGNhbGxlci4KICBUaGUgbm93LXJlZHVuZGFudCBj
b2RlIHRvIHNldCB0aGUgdmFsdWUgaW4gdGhlIGh5cGVydmlzb3Igd2lsbCBiZQogIGRlbGV0ZWQg
aW4gdGhlIG5leHQgcGF0Y2guCgo+IExlYXZlIGEgcmF0aGVyIGJldHRlciBleHBsYWluYXRpb24g
b2Ygd2h5IG9ubHkgSFZNIGd1ZXN0cyBoYXZlIGEKPiBjaG9pY2UgaW4gUEFFIHNldHRpbmcuCgpJ
IGFwcHJvdmUgb2YgdGhpcyBwYXJ0IG9mIHRoZSBjb21taXQgbWVzc2FnZS4KCj4gTm8gZnVuY3Rp
b25hbCBjaGFuZ2UuCgpJIHdvdWxkIHdyaXRlCgogICBObyBvdmVyYWxsIGZ1bmN0aW9uYWwgY2hh
bmdlLiAgVGhlIG5ldyBjb2RlIGZpb3IgY2FsY3VsYXRpbmcgdGhlCiAgIGBwYWUnIHZhbHVlIChp
biBsaWJ4bF9fY3B1aWRfbGVnYWN5KSBpcyBpc29tb3JwaGljIHRvIHRoZQogICBvYnNlbGVzY2Vu
dCBjb2RlIChpbiBsaWJ4bF94ODYuYykuCgpJIGhhZCBhIGxvb2sgdG8gc2VlIHdoZXRoZXIgdGhp
cyB3YXMgdHJ1ZSBhbmQgaXQgc2VlbWVkIHRvIGJlLgoKPiAgICAgICAgICAvKgo+IC0gICAgICAg
ICAqIEhWTV9QQVJBTV9QQUVfRU5BQkxFRCBpcyBhIHBhcmFtZXRlciB0byB0aGlzIGZ1bmN0aW9u
LCBzdGFzaGVkIGluCj4gLSAgICAgICAgICogWGVuLiAgTm90aGluZyBlbHNlIGhhcyBldmVyIHRh
a2VuIG5vdGljZSBvZiB0aGUgdmFsdWUuCj4gKyAgICAgICAgICogUEFFIHVzZWQgdG8gYmUgYSBw
YXJhbWV0ZXIgcGFzc2VkIHRvIHRoaXMgZnVuY3Rpb24gYnkKPiArICAgICAgICAgKiBIVk1fUEFS
QU1fUEFFX0VOQUJMRUQuICBJdCBpcyBub3cgcGFzc2VkIG5vcm1hbGx5Lgo+ICAgICAgICAgICAq
LwoKSSBmaW5kIHRoaXMgcGhyYXNpbmcgY29uZnVzaW5nLCBwYXJ0aWN1bGFybHkgdGhpcyB2ZXJ5
IGxvb3NlIHVzZSBvZgp0aGUgd29yZCBgcGFyYW1ldGVyJy4gIEkgd291bGQgZHJvcCB0aGlzIGNv
bW1lbnQgZW50aXJlbHkgYW5kIGxldCB0aGUKY29tbWl0IG1lc3NhZ2Ugc3RhbmQgYXMgdGhlIGhp
c3RvcmljYWwgZG9jdW1lbnRhdGlvbi4KCj4gICAgICBjaGFyICpjcHVpZF9yZXNbNF07Cj4gKyAg
ICBib29sIHBhZSA9IHRydWU7Cj4gKwo+ICsgICAgLyoKPiArICAgICAqIFBBRSBpcyBhIFhlbi1j
b250cm9sbGVkIGZvciBQViBndWVzdHMgKGl0IGlzIHRoZSAncCcgdGhhdCBjYXVzZXMgdGhlCj4g
KyAgICAgKiBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIHhlbi0zLjAteDg2XzMyIGFuZCB4ZW4tMy4w
LXg4Nl8zMnAgQUJJcykuICBJdFwKIGlzCj4gKyAgICAgKiBtYW5kYXRvcnkgYXMgWGVuIGlzIHJ1
bm5pbmcgaW4gNjRiaXQgbW9kZS4KPiArICAgICAqCj4gKyAgICAgKiBQVkggZ3Vlc3RzIGRvbid0
IGhhdmUgYSB0b3AtbGV2ZWwgUEFFIGNvbnRyb2wsIGFuZCBpcyB0cmVhdGVkIGFzCj4gKyAgICAg
KiBhdmFpbGFibGUuCj4gKyAgICAgKi8KCkkgYXBwcm92ZSBvZiBwdXR0aW5nIGEgbmV3IGNvbW1l
bnQgaGVyZSB3aXRoIGFuIGV4cGxhbmF0aW9uLiAgSG93ZXZlciwKaXQgc2hvdWxkIGJlIHdyYXBw
ZWQgcmF0aGVyIG1vcmUgdGlnaHRseSAoZWcsIGluIG15IE1VQSBpdCBpcyBub3cKc3VmZmVyaW5n
IGZyb20gd3JhcCBkYW1hZ2UgYXMgSSBkZW1vbnN0cmF0ZSBhYm92ZSkgYW5kIGl0IHNlZW1zIHRv
CmhhdmUgc29tZSBwcm9ibGVtcyB3aXRoIHRoZSBncmFtbWFyID8gIEFuZCBJIHRoaW5rIHRoZSAy
bmQgc2VudGVuY2UKIkl0IGlzIG1hbmRhdG9yeSIgY291bGQgdXNlZnVsbHkgYmUgcmUtcXVhbGlm
aWVkICJmb3IgUFYgZ3Vlc3RzIi4gIE9yCnlvdSBjb3VsZCB3cml0ZSBzb21ldGhpbmcgbGlrZSB0
aGlzLgoKICAgUFYgZ3Vlc3RzOiBQQUUgaXMgWGVuLWNvbnRyb2xsZWQgKGl0IGlzIHRoZSAncCcg
dGhhdCBjYXVzZXMgdGhlCiAgIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgeGVuLTMuMC14ODZfMzIg
YW5kIHhlbi0zLjAteDg2XzMycCBBQklzKTsKICAgWGVuIGlzIGluIDY0LWJpdCBtb2RlIHNvIFBB
RSBpcyBtYW5kYXRvcnkuCgogICBQVkggZ3Vlc3RzOiB0aGVyZSBpcyBubyB0b3AtbGV2ZWwgUEFF
IGNvbnRyb2wgaW4gdGhlIGxpYnggZG9tYWluCiAgIGNvbmZpZzsgd2UgYWx3YXlzIG1ha2UgaXQg
YXZhaWxhYmxlLgoKICAgU28gb25seSB0aGlzIHRlc3Qgb25seSBhcHBsaWVzIHRvIEhWTSBndWVz
dHM6CgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=

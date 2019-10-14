Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE58D66FB
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 18:13:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK2w2-00037c-ED; Mon, 14 Oct 2019 16:11:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fu8Z=YH=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iK2w1-00037U-3s
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 16:11:01 +0000
X-Inumbo-ID: 3614c8ac-ee9d-11e9-a531-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3614c8ac-ee9d-11e9-a531-bc764e2007e4;
 Mon, 14 Oct 2019 16:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571069461;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=KeyOqNOuDXin3IyktBJ7/icqWY5udklmmTCeO0/n5+Y=;
 b=hyYAiywevpt3uzdmGXTwLGps+/ZtfsWblEz6t5erGu+CR+OO2WD45lo1
 N6cH6qxMskDTajdIgpPMry0IR0faZnqXoocd+0o2OWQSl0tU9sv3RkaFR
 s1mW5cz9zwZVchJgvreRJV+TW+OKT5Sff6aosQQY/dF6IfbEICVYJg/wU c=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KS15PvN2QW6hPARIKVU58GuTscA0/Wz/X6hZsg5wmqWnBVQ9n/HrSf1D0z2lLaQO8GTEMT5xCr
 cXhhk9X/QCVf72ndnfFj7/Im9xm8cUoYQq0caV5kVv7VndyXQJchce1ia+7X8wkPiDmNbIqncL
 ge9dt3pzqmT25VMRD1YFJcFMN8vioIZFbBL6VBdL2EJyqRPGQ93p0TVEwBZAlLzLuVMJ9oZduP
 mql5Mlcwuz6zyT2b8qNzLAAlDUxeuo16+paCiB4E3AAASJSporGy6eNeJcsHUScCO4grHezL8p
 GLw=
X-SBRS: 2.7
X-MesageID: 6939216
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,296,1566878400"; 
   d="scan'208";a="6939216"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23972.40464.347413.779544@mariner.uk.xensource.com>
Date: Mon, 14 Oct 2019 17:10:56 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191014160550.GA1138@perard.uk.xensource.com>
References: <20191011165549.21639-1-ian.jackson@eu.citrix.com>
 <20191011165549.21639-7-ian.jackson@eu.citrix.com>
 <20191014160550.GA1138@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v3 10/10] libxl/xl: Overhaul
 passthrough setting logic
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@gmail.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtYRU4gUEFUQ0ggZm9yLTQu
MTMgdjMgMTAvMTBdIGxpYnhsL3hsOiBPdmVyaGF1bCBwYXNzdGhyb3VnaCBzZXR0aW5nIGxvZ2lj
Iik6Cj4gT24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDU6NTU6NDlQTSArMDEwMCwgSWFuIEphY2tz
b24gd3JvdGU6Cj4gPiBMSUJYTF9QQVNTVEhST1VHSF9VTktOT1dOIChha2EgIkVOQUJMRUQiIGlu
IGFuIGVhcmxpZXIgdW5jb21taXR0ZWQKPiAKPiBJIGd1ZXNzIHRoYXQncyBub3cgTElCWExfUEFT
U1RIUk9VR0hfVU5TUEVDSUZJRUQuCgpIZWgsIHNlZSBteSBvdGhlciBtYWlsLCBqdXN0IGNyb3Nz
ZWQgd2l0aCB5b3Vycy4KCj4gPiAraW50IGxpYnhsX19hcmNoX3Bhc3N0aHJvdWdoX21vZGVfc2V0
ZGVmYXVsdChsaWJ4bF9fZ2MgKmdjLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdWludDMyX3QgZG9taWQsCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kb21haW5fY29uZmlnICpkX2NvbmZpZywKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGxpYnhs
X3BoeXNpbmZvICpwaHlzaW5mbykKPiA+ICt7Cj4gCj4gWy4uLl0KPiAKPiA+ICt9Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+IAo+IFRoZXJlIGFyZSA0MCB0
cmFpbGluZyB3aGl0ZSBzcGFjZSBoZXJlLCBhbnkgcmVhc29uPyA6LSkuCgpOby4gIEkgd2lsbCBn
ZXQgcmlkIG9mIHRoZW0uICBNeSBlZGl0b3IgZG9lc24ndCBjb21wbGFpbiBhYm91dCB0aGVtCmFu
ZCBteSBwZXJzb25hbCB2aWV3IGlzIHRoYXQgdGhpcyBpcyBwb2ludGxlc3MgYnVyZWF1Y3JhY3kg
YnV0IGl0J3MKbm90IGp1c3QgdXAgdG8gbWUsIHNvIEknbGwgZml4IGl0LgoKPiBCZXNpZGUgYSBm
ZXcgdHlwb3MsIHRoZSBwYXRjaCBsb29rcyBmaW5lIHRvIG1lOgo+IFJldmlld2VkLWJ5OiBBbnRo
b255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KClRoYW5rcy4KCklmIEkgY2hh
bmdlICJ1bnNwZWNpZmllZCIgYmFjayB0byAidW5rbm93biIsIGFuZCBmaXggdGhlIHNwYWNlcyAo
YW5kCkknbGwgaGF2ZSBhIGxvb2sgZm9yIHR5cG9zKSwgc2hvdWxkIEkgcmV0YWluIHlvdXIgYWNr
ID8KClRoYW5rcywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==

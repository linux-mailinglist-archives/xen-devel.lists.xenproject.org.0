Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4A0AEEDD
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 17:47:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7iK1-0005jz-Jd; Tue, 10 Sep 2019 15:44:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G+U8=XF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i7iK0-0005ju-03
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 15:44:48 +0000
X-Inumbo-ID: e9d2bad8-d3e1-11e9-ac1f-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9d2bad8-d3e1-11e9-ac1f-12813bfff9fa;
 Tue, 10 Sep 2019 15:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568130286;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZFffKN/viwfRqJTlX9c1WncvqqA9hXjdPi/d0apoXzg=;
 b=gwm9MheioZ+zkD56/t8pGnSHTJrxSUuGYWMa7JoZUmJ040pg7yHb9JjO
 Zbm7jEvSOWIDYqhqVYYl8rgCNS20SgDh7YQOZuJ6iDX7Oejqp8NKQokre
 JpeLlyb3rTfh6uKX6jTUGgqwUalv1eF/ZwfnioJ7dxMDuoYdN/SwJGi1D c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JV6zW+hZysxlip1+jPLp/kVAqItov5OBCtyBm79uQbV302gkB3EVGRtXvm7WfbRCM3EZuT3RPJ
 B/MrEuOONIkFleglxhQf8XbSgQLxV8cJ6n4aftk5ukBjkU2vIYryar9xgaI6xvgRoIZfIRW5GQ
 be4TdlQictFOt3rG3BEEgmbDfDusU0i9RKlKl6FOyZtbJS7kkITluhjDFnz4KM9NK/DD1ZzzGQ
 JeLgtpMBGxN6FnTCoDo6MrhKALH+CL4wQRKordOyOpBSQ9Ot1qNl1fe9kRgFEq4MGgp2F6n/4I
 VK0=
X-SBRS: 2.7
X-MesageID: 5382530
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5382530"
Date: Tue, 10 Sep 2019 17:44:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190910154438.2ui4hdqwem7dxvvb@Air-de-Roger>
References: <20190910152538.36921-1-roger.pau@citrix.com>
 <962de8fd-6803-8f90-9690-232544032fa3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <962de8fd-6803-8f90-9690-232544032fa3@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v4 1/2] sysctl/libxl: choose a sane default
 for HAP
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMDQ6NDA6MzlQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxMC8wOS8yMDE5IDE2OjI1LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sIGIvdG9vbHMvb2NhbWwv
bGlicy94Yy94ZW5jdHJsLm1sCj4gPiBpbmRleCBlNTQ0ZWY4NGRhLi5hNWU3N2M5NDNhIDEwMDY0
NAo+ID4gLS0tIGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sCj4gPiArKysgYi90b29s
cy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwKPiA+IEBAIC0xMDcsNiArMTA3LDcgQEAgdHlwZSBw
aHlzaW5mb19jYXBfZmxhZyA9Cj4gPiAgCXwgQ0FQX0hWTQo+ID4gIAl8IENBUF9QVgo+ID4gIAl8
IENBUF9EaXJlY3RJTwo+ID4gKwl8IENBUF9oYXAKPiAKPiBIQVAgaXMgYW4gaW5pdGlhbGlzbSBq
dXN0IGxpa2UgSFZNLCBzbyBkZWZpbml0ZWx5IHNob3VsZCBiZSBjYXBpdGFsaXNlZC4KCkZ1bm55
IHRoaW5nLCBJIGhhZCBpdCBhbGwgY2FwcyBhbmQgdGhlbiBzd2l0Y2hlZCB0byB0aGlzIGZvcm0K
dG8gbWF0Y2ggdGhlIHN5c2N0bCBkZWZpbmUgKFhFTl9TWVNDVExfUEhZU0NBUF9oYXApLgoKV291
bGQgeW91IGxpa2UgbWUgdG8gcmVzZW5kIHdpdGggYWxsIGNhcHM/CgpUaGFua3MsIFJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

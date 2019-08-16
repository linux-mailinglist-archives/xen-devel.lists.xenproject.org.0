Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41972900A9
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 13:21:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyaEz-0003BY-SP; Fri, 16 Aug 2019 11:17:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SGx2=WM=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hyaEy-0003BT-M5
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 11:17:52 +0000
X-Inumbo-ID: 7bf9e4ba-c017-11e9-a661-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7bf9e4ba-c017-11e9-a661-bc764e2007e4;
 Fri, 16 Aug 2019 11:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565954271;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ROhQR+ZPyd/sK1bZAHGfBOr8QHIBjo4U9z+mPIkXHQE=;
 b=Tyd3qzEu9gXooKkiqrNhSbCmkYUA2HEIOvQzJjkmLZ1kcDOcJ72aRUz/
 QMZv3IRtzEBZTXdOujSh5tnw1tixIC2vB0PqMqD26f0Zbnv7V2dTeJZnR
 nx/2u9uo/vdiK5q8gOebtYcvZkAWincJI4iicFlXDAhFe9koQCgmYRVLf E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ize0VF+4ALQP3gxThZb8wkL2WgEdabWPgVA08foQw6O1FPgmvf0WvC5COZraCjCIMo/PO/ba1u
 Fy8+QlKaJJDb1o9iVH+9xkT3DhlteXExEDLotnMT3W5uDGJhTo7HE6XUk+mMy8FZOdrrxBU/+R
 Vy0gpKIg1k9ZvE4JTmdHNaecGUyu25SDXPZECSrcMORZDtJE5085yc0v3s+2NQ1GRzW2LKGA4y
 KhOqizg8dgGbv/J6eWrlG3ZQ9GQJFcE6VkyN1A6LoLq2iU0GD5ySq6Jcig9CBXs3C9oEdSNiUZ
 vk8=
X-SBRS: 2.7
X-MesageID: 4547606
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,393,1559534400"; 
   d="scan'208";a="4547606"
Date: Fri, 16 Aug 2019 12:17:47 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20190816111747.GB25409@perard.uk.xensource.com>
References: <4b535bb616f62ad685fef0f06d3b5138b1539688.1565951950.git.lars.kurth@citrix.com>
 <200d8505-6822-3d9f-98fe-e8d7e09d00b8@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200d8505-6822-3d9f-98fe-e8d7e09d00b8@arm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH] get_maintainers.pl: Enable running the
 script on unikraft repos
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
Cc: Felipe Huici <felipe.huici@neclab.eu>, Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Florian Schmidt <florian.schmidt@neclab.eu>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Simon Kuenzer <simon.kuenzer@neclab.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMTE6NTU6MTZBTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIExhcnMsCj4gCj4gT24gMTYvMDgvMjAxOSAxMTo0MiwgTGFycyBLdXJ0aCB3cm90
ZToKPiA+IFVuaWtyYWZ0IHJlcG9zIGZvbGxvdyB0aGUgc2FtZSBzeW50YXggYXMgeGVuLmdpdCB3
aXRoIHRoZQo+ID4gZm9sbG93aW5nIGV4Y2VwdGlvbnM6Cj4gPiAqIE1BSU5UQUlORVJTIGZpbGVz
IGFyZSBjYWxsZWQgTUFJTlRBSU5FUlMubWQKPiA+ICogTTogLi4uIGV0YyBibG9ja3MgYXJlIHBy
ZWNlZGVkIGJ5IHdoaXRlc3BhY2VzIGZvciByZW5kZXJpbmcgYXMKPiA+ICAgIG1hcmt1cCBmaWxl
cwo+IAo+IFRoZXJlIGlzIGFuIG90aGVyIGRpZmZlcmVuY2UuIFRoZSAiZmFsbGJhY2siIGNhdGVn
b3J5IGlzICJVTklLUkFGVCBHRU5FUkFMIgo+IGFuZCBub3QgIlRIRSBSRVNUIi4KPiAKPiA+IAo+
ID4gVGhpcyBjaGFuZ2Ugd2lsbAo+ID4gLSBsb2FkIE1BSU5UQUlORVJTLm1kIGlmIE1BSU5UQUlO
RVJTIGlzIG5vdCBwcmVzZW50Cj4gPiAtIGRlYWwgd2l0aCBpbmRlbnRlZCBNOiAuLi4gYmxvY2tz
Cj4gCj4gT25lIHByb2Nlc3MgcXVlc3Rpb24uIERvZXMgaXQgbWVhbiBVbmlrcmFmdCBmb2xrcyB3
aWxsIGhhdmUgdG8gY2hlY2tvdXQgWGVuCj4gaW4gb3JkZXIgdG8gdXNlIHthZGQsIGdldH1fbWFp
bnRhaW5lcnMucGw/IElmIHNvLCB3b3VsZCBpdCBtYWtlIHNlbnNlIHRvCj4gaGF2ZSBhZGRfbWFp
bnRhaW5lcnMucGwgYW5kIHNjcmlwdF9tYWludGFpbmVycy5wbCBpbiBhIHNlcGFyYXRlIHJlcG8g
dGhhdAo+IGNhbiBiZSBhZGRlZCBhcyBzdWJtb2R1bGU/CgpTaG91bGRuJ3QgaW5zdGVhZCB0aGUg
VW5pa3JhZnQgcmVwbyBoYXZlIGl0J3Mgb25lIGdldF9tYWludGFpbmVycwpzY3JpcHQ/IHhlbi5n
aXQncyBzY3JpcHQgZG9lc24ndCBuZWVkcyB0byBoYXZlIHN1cHBvcnQgZm9yIGV2ZXJ5IHNpbmds
ZQpyZXBvIGF2YWlsYWJsZSBvbiBlYXJ0aCBhbmQgVW5pa3JhZnQgaXMgYSBkaWZmZXJlbnQgcHJv
amVjdCBhbnl3YXkuCgpVc3VhbGx5LCBwcm9qZWN0cyB3aXRoIGEgTUFJTlRBSU5FUlMgZmlsZSBo
YXZlIHRoZXJlIG93biBnZXRfbWFpbnRhaW5lcnMKc2NyaXB0LgoKQ2hlZXJzLAoKLS0gCkFudGhv
bnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

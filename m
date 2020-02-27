Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECAF17186C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 14:18:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7J0J-00039N-5Y; Thu, 27 Feb 2020 13:15:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3dSL=4P=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7J0I-00039I-1d
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 13:15:02 +0000
X-Inumbo-ID: 28b1d714-5963-11ea-b7e8-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28b1d714-5963-11ea-b7e8-bc764e2007e4;
 Thu, 27 Feb 2020 13:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582809301;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ds++XOSfpgpuKpPwekWRFaioE+6sLJdR/jm5TuvHpTs=;
 b=fiN+wrfJAF+4uoE+VznS4KF+v3cVzR+B+dUkwWkIS2h1MZZVBFVjDxSc
 OY5YvasCBOfS1nIX8nMg10IDaEiPdEG+2wyS6Fb77uzOvOPlM7irn30BR
 L6BDTQsCmPiX7fTuy0IGq7osVQvRb+mrw2fNieUd9H76Un9AVuga6Nei6 Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mawhXjPcva+NbJJFfJTJQ6gAYQU4uZjgDBGeXUpEgcQDlzuq9+Ty9tkr25OQbdKQRJXg0i0uOF
 m6CmrCU5Q/ZMvw+dQH1HOFzKGX1TqC7jgkJcpir7f0xAZe4nlU1hQlEjTz0Picvh/kroAJk7vh
 P/Jbkw1ih7sJV5idkq00LSEWXJ63jtYX4uyQmNGiIYxW9+fwbfqnlcnpzjmhPbm9DtdFfRZIX7
 RCQig2SrEipQLaj5UuKONpQbw/yV1zcCh5SYa46QQggjUjaZgJW/rDHR/XQdtYyuNiiipw54la
 5LQ=
X-SBRS: 2.7
X-MesageID: 13280144
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,492,1574139600"; d="scan'208";a="13280144"
Date: Thu, 27 Feb 2020 14:14:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20200227131452.GP24458@Air-de-Roger.citrite.net>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-21-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226113355.2532224-21-anthony.perard@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [XEN PATCH v3 20/23] xen/build: factorise
 generation of the linker scripts
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMTE6MzM6NTJBTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gSW4gQXJtIGFuZCBYODYgbWFrZWZpbGUsIGdlbmVyYXRpbmcgdGhlIGxpbmtlciBz
Y3JpcHQgaXMgdGhlIHNhbWUsIHNvCj4gd2UgY2FuIHNpbXBseSBoYXZlIGJvdGggY2FsbCB0aGUg
c2FtZSBtYWNyby4KPiAKPiBXZSBuZWVkIHRvIGFkZCAqLmxkcyBmaWxlcyBpbnRvIGV4dHJhLXkg
c28gdGhhdCBSdWxlcy5tayBjYW4gZmluZCB0aGUKPiAuKi5jbWQgZGVwZW5kZW5jeSBmaWxlIGFu
ZCBsb2FkIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBl
cmFyZEBjaXRyaXguY29tPgo+IC0tLQo+ICB4ZW4vUnVsZXMubWsgICAgICAgICAgfCA4ICsrKysr
KysrCj4gIHhlbi9hcmNoL2FybS9NYWtlZmlsZSB8IDUgKystLS0KPiAgeGVuL2FyY2gveDg2L01h
a2VmaWxlIHwgNiArKystLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vUnVsZXMubWsgYi94ZW4vUnVsZXMu
bWsKPiBpbmRleCA4YzdkYmE5MjExZDEuLjAyY2QzN2QwNDA1NCAxMDA2NDQKPiAtLS0gYS94ZW4v
UnVsZXMubWsKPiArKysgYi94ZW4vUnVsZXMubWsKPiBAQCAtMjMwLDYgKzIzMCwxNCBAQCBjbWRf
c19TID0gJChDUFApICQoZmlsdGVyLW91dCAtV2EkKGNvbW1hKSUsJChhX2ZsYWdzKSkgJDwgLW8g
JEAKPiAgJS5zOiAlLlMgRk9SQ0UKPiAgCSQoY2FsbCBpZl9jaGFuZ2VkLGNwcF9zX1MpCj4gIAo+
ICsjIExpbmtlciBzY3JpcHRzLCAubGRzLlMgLT4gLmxkcwo+ICtxdWlldF9jbWRfY2NfbGRzX1Mg
PSBMRFMgICAgICRACj4gK2RlZmluZSBjbWRfY2NfbGRzX1MKPiArICAgICQoQ0MpIC1QIC1FIC1V
aTM4NiAkKGZpbHRlci1vdXQgLVdhJChjb21tYSklLCQoYV9mbGFncykpIC1vICRAICQ8OyBcCgpE
byB5b3Uga25vdyB3aHkgdGhlIC1VaTM4NiBpcyBuZWVkZWQ/CgpBbHNvLCBjYW4gdGhpcyB1c2Ug
dGhlIENQUCBydW5lPyBJIHdvdWxkIGF0IGxlYXN0IGNvbnNpZGVyIG5hbWluZyB0aGlzCkNQUCwg
YXMgaXQncyBwcmUtcHJvY2Vzc2luZyB0aGUgbGluayBzY3JpcHQsIExEUyBzZWVtcyBxdWl0ZSBv
YnNjdXJlLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

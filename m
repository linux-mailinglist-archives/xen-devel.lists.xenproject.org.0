Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA4E9E64E
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 13:02:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2ZCq-0000ON-Nf; Tue, 27 Aug 2019 11:00:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eSIj=WX=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i2ZCp-0000L0-Lx
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 11:00:07 +0000
X-Inumbo-ID: d3f4bcd0-c8b9-11e9-ae32-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3f4bcd0-c8b9-11e9-ae32-12813bfff9fa;
 Tue, 27 Aug 2019 11:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566903606;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=m7Z5IiuZ32u4t/KbSmiJi9kGhJny/PGEnoA7JBzLUFo=;
 b=DZcywNtMr1qtCVIU7dwGOak/amR8XhYR4VB+pBB4WKI3GgkK4TTF0R63
 3zQxj23YhV4HsegGwR35RfHETpMOIkSW5y2viOISK/gphdqs++AgvT0kO
 qBMTnFtiXAyHp/XfQJ3qLZS2CoyQOZrSZdpCz1HkQIqXh/xDxcIfx6KIo w=;
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
IronPort-SDR: yFhEdHhp8TPjO1IA/dEyAsT3Jqqa7IqsKznNvI8t/GDqvBPXiSsiLVJN19oM4iLrfcLiQj09AC
 foiHGb2mAj3twAZQiAf7kZsTGK6pFlpNgpmLBjRw69SyjcbTjHJGgsaqnsm5b3/cJfNjyDEYfI
 mErn7BVapLz8ObjxL5cUCsGGxS6bG+HP47Wo8AFqzOLAD9nMBzyyfGmDNeGs70aoc9VulYaiV9
 Ws/tNwzWlWzZxWZcftoQL23ilaEjsoawsWab2gYyFmxEqlwxjkgqM95/SVzWaZzds8Z78ZM3um
 Cqo=
X-SBRS: 2.7
X-MesageID: 4942362
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,436,1559534400"; 
   d="scan'208";a="4942362"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23909.3349.210995.572901@mariner.uk.xensource.com>
Date: Tue, 27 Aug 2019 11:59:33 +0100
To: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8722ee9d-aa68-2871-06d9-e4eedd7797dc@suse.com>
References: <20190726133331.91482-1-roger.pau@citrix.com>
 <20190726133331.91482-3-roger.pau@citrix.com>
 <f46656a6-22f7-bece-30c2-9be66ab36ef4@suse.com>
 <20190820075806.ukodfbsyg3u5winm@Air-de-Roger>
 <8722ee9d-aa68-2871-06d9-e4eedd7797dc@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 2/3] build: allow picking the env values for
 compiler variables
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George
 Dunlap <George.Dunlap@citrix.com>, JulienGrall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtQQVRDSCAyLzNdIGJ1aWxkOiBhbGxvdyBwaWNraW5n
IHRoZSBlbnYgdmFsdWVzIGZvciBjb21waWxlciB2YXJpYWJsZXMiKToKPiBPbiAyMC4wOC4yMDE5
IDA5OjU4LCBSb2dlciBQYXUgTW9ubsOpICB3cm90ZToKPiA+IEkgZG9uJ3QgaGF2ZSB0aGluZ3Mg
J2xlZnQnIGluIHRoZSBlbnZpcm9ubWVudCwgbmVpdGhlciBoYXZlIG1vc3QgYnVpbGQKPiA+IHN5
c3RlbXMgQUZBSUsuIEkgZG8gaGF2ZSB0aGluZ3Mgc2V0IHRoYXQgSSB3YW50IHRoZSBidWlsZCB0
bwo+ID4gYWNrbm93bGVkZ2UsIGluc3RlYWQgb2YgZmlnaHQgYWdhaW5zdCBpdC4KPiAKPiBNeSB2
aWV3IGlzIHRoaXM6IFhFTl8qIHRoaW5ncyBjb21pbmcgZnJvbSB0aGUgZW52aXJvbm1lbnQgYXJl
IGZpbmUuCj4gR2VuZXJpYyAoaS5lLiBwcm9qZWN0IGFnbm9zdGljKSB2YXJpYWJsZXMgKGxpa2Ug
Q0MpIG90b2ggd291bGQKPiBiZXR0ZXIgYmUgaWdub3JlZCwgYXMgaXQncyBub3QgY2xlYXIgZm9y
IHdoYXQgcHVycG9zZSB0aGV5J3ZlIGJlZW4KPiBzZXQuIChJc3RyIGEgY2FzZSB3aGVyZSBzb21l
IEZPUlRJRlkgb3B0aW9uIHdhcyBzZXQgYnkgUlBNIGJ1aWxkCj4gZW52aXJvbm1lbnRzLCBicmVh
a2luZyBvdXIgYnVpbGQuKSBUaGV5IG1heSB3ZWxsIGhhdmUgYmVlbiBtZWFudAo+IGZvciBzb21l
IG90aGVyIHByb2plY3QuCgpDQyBpcyBzZXQgKnNwZWNpZmljYWxseSB0byBjYXVzZSBidWlsZCBz
eXN0ZW1zJ3MgbGlrZSBYZW4ncyB0byB1c2UKdGhhdCBjb21waWxlciouICBUaGF0IGlzIGl0cyBw
dXJwb3NlLiAgSXQgc2hvdWxkIGJlIGhvbm91cmVkLCBub3QKaWdub3JlZC4KCkxpa2V3aXNlIEZP
UlRJRlksIGV2ZW4gdGhvdWdoIGl0IGJyb2tlIHNvbWV0aGluZy4gIEZPUlRJRllfU09VUkNFIHdh
cwpzZXQgc3BlY2lmaWNhbGx5IHRvIGNhdXNlIHRoZSBjaGFuZ2VzIGl0IGRpZC4gIFRoZSBwZW9w
bGUgd2hvIHNldCBpdApkaWRuJ3Qgc2VlIGFsbCB0aGUgaW1wbGljYXRpb25zLCBidXQgdGhhdCBj
aGFuZ2UgKndhcyogdGhlaXIgZGVzaWduCmludGVudCBhbmQgdGhlIGJ1Z3Mgd2VyZSByZWFsIGJ1
Z3MgaW4gd2hhdCB0aGV5IHdlcmUgdHJ5aW5nIHRvIGRvLgoKPiBRdWVzdGlvbiBpcyB3aGV0aGVy
IHRvIHRha2UgdGhlIGFib3ZlIGp1c3QgZm9yIHRoZSBoeXBlcnZpc29yIHBhcnQKPiBvZiB0aGUg
YnVpbGQsIG9yIGFsc28gdGhlIHRvb2wgc3RhY2sgZXRjIG9uZXMuCgoqRGVmaW5pdGVseSogZm9y
IHRoZSB0b29sc3RhY2sgYnVpbGQsIHdlIHNob3VsZCBob25vdXIgQ0MgZXQgYWwuCgpUaGUgaHlw
ZXJ2aXNvciBpcyBhIG1vcmUgc3VidGxlIHF1ZXN0aW9uIGJlY2F1c2UgcGVvcGxlIHdobyBzZXQg
dGhlc2UKdmFyaWFibGVzIG9mdGVuIGZvcmdldCB0byB0aGluayBhYm91dCBrZXJuZWwgY29kZSwg
ZW1iZWRkZWQgY29kZSwKZXRjLiAgVGhhdCdzIHdoYXQgaGFwcGVuZWQgd2l0aCBGT1JUSUZZX1NP
VVJDRS4gIEhvd2V2ZXIsIEkgd291bGQKYXJndWUgdGhhdCBpdCBpcyBiZXR0ZXIsIGluIHN1Y2gg
YSBzaXR1YXRpb24sIHRvIGhvbm91ciB0aGUgdmFyaWFibGUKYW5kIGJyZWFrIHRoZSBidWlsZCwg
dGhhbiBpdCBpcyB0byBzaW1wbHkgaWdub3JlIGl0LgoKSWFuLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

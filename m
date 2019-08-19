Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E552391EB2
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 10:19:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzcqP-0002EU-SZ; Mon, 19 Aug 2019 08:16:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2qpp=WP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hzcqO-0002EO-6i
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 08:16:48 +0000
X-Inumbo-ID: af350e7e-c259-11e9-8beb-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af350e7e-c259-11e9-8beb-12813bfff9fa;
 Mon, 19 Aug 2019 08:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566202606;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ls3j3qdkc+GyrZ/pERLjRGEEniq/rPnUliVGUEOQ6l4=;
 b=WKAZXx3AAfpcgIsK/S2E6L6yCH3hr7uafk15OXzpRPcVCGPrwCH7wtc/
 Sp80e4lMEsAFyUSvb9OFlE6Kfv0o4QKqaKZ5yU82coh9Ha4lIqUyZ4UQU
 sT05sMV1vKJgM4K0yOCmaDhRB4B2ln6i/NkEZ6oeyI1cRyXHUxF7p1J3j w=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pJCtocA76q8rf/DeOuEf9rYSTcyfwatrpLHIrq+D4LxmxPFNTpX5Br/lP65pqCk+BkJGlgzh5n
 KRouAllFByG8o6umKkQedbP4WTfceJH1ulw6YdYK3+oKnfLmSZfAU2i0hNGNnVGjUQ9rC72Yz+
 wfinW2vD8br0/gQKlpUwjuVkoRxp0207yXSNLpMPd8iPsRQsJoiGbao77SRllZAp1jt1YJYSKL
 YWf1izWz1nnkjT1C+xb24oLhni/8cu2VTVemnl+Zk0S85b9liW0etwS/GQgK4EFFYq4R1YgVug
 l8s=
X-SBRS: 2.7
X-MesageID: 4582888
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,403,1559534400"; 
   d="scan'208";a="4582888"
Date: Mon, 19 Aug 2019 10:16:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20190819081637.dg2k5kv54o72wrty@Air-de-Roger>
References: <20190801081559.wruxck32h5bum2va@Air-de-Roger>
 <CAMmSBy9y6hHQfDgcDFmKiRw9QiRSgcxHAq6Qo=o7apTR2EuusA@mail.gmail.com>
 <20190802080540.r4e3rrv3eit5yebt@Air-de-Roger>
 <20190806160644.adqzknxdfuwz4qaz@Air-de-Roger>
 <CAMmSBy91XfNz5DfbaL8OC7v1eYp7n_EKjGgSgAH+YBALh9HM-g@mail.gmail.com>
 <20190807073534.7uoqo7q7gno2ljyl@Air-de-Roger>
 <20190812085703.363a2xsypnacdpes@Air-de-Roger>
 <CAMmSBy_CfoRuJZjHT6bXk5zG5jeb8a6m7TK6+mAKtr+3TzS-Vw@mail.gmail.com>
 <20190814080614.m32cupba4f5jdlhs@Air-de-Roger>
 <CAMmSBy8Pcv4eyZPOf+0hEtCA4bb9+1SSgieLcvKor63UyUK4-g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMmSBy8Pcv4eyZPOf+0hEtCA4bb9+1SSgieLcvKor63UyUK4-g@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCBBdWcgMTgsIDIwMTkgYXQgMTA6MDA6MTdQTSAtMDcwMCwgUm9tYW4gU2hhcG9zaG5p
ayB3cm90ZToKPiBIaSBSb2dlciEKPiAKPiBTb21lIGdvb2QgbmV3cywgc29tZSBiYWQgbmV3cyA7
LSkKPiAKPiBHb29kIG5ld3MgaXMgdGhhdCBvbiB0aGUgbmV3ZXIgQklPUywgeW91ciBvcmlnaW5h
bCBwYXRjaCBzZWVtcyB0byB3b3JrIGZpbmUuCj4gCj4gSU9XLCB3aXRoIG5ld2VyIEJJT1M6Cj4g
ICAgIDEuIHdpdGhvdXQgeW91ciBvcmlnaW5hbCBwYXRjaCBJIHNlZSBnYXJibGVkIHNjcmVlbgo+
ICAgICAyLiB3aXRoIHlvdXIgb3JpZ2luYWwgcGF0Y2ggZXZlcnl0aGluZyBib290cyBub3JtYWxs
eS4KClRoYXQgd291bGQgYmUgbXkgZXhwZWN0YXRpb24uCgo+IEJhZCBuZXdzIGlzIHRoYXQgd2l0
aCBvbGRlciBCSU9TLCB5b3VyIG9yaWdpbmFsIHBhdGNoIHNlZW1zIHRvIGVpdGhlcgo+IHdvcmsg
b3Igbm90IGRlcGVuZGluZyBvbiB0aGUgQklPUyBzb21lIG9mIHRoZSBCSU9TIHNldHRpbmdzLgo+
IAo+IElPVywgd2l0aCBvbGRlciBCSU9TOgo+ICAgICAxLiB3aXRob3V0IHlvdXIgb3JpZ2luYWwg
cGF0Y2ggSSBzZWUgZ2FyYmxlZCBzY3JlZW4gKHJlZ2FyZGxlc3Mgb2YKPiBCSU9TIHNldHRpbmdz
KQo+ICAgICAyLiB3aXRoIHlvdXIgb3JpZ2luYWwgcGF0Y2ggQU5EIHJlc2V0dGluZyB0byBhIGZh
Y3RvcnkgZGVmYXVsdHMgb2YKPiBCSU9TIHNldHRpbmdzIC0tIGV2ZXJ5dGhpbmcgYm9vdHMgbm9y
bWFsbHkKPiAgICAgMy4gd2hlbiBJIGxvYWQgdXAgb3VyIGN1c3RvbSBzZXR0aW5ncyAtLSB0aGUg
b25seSB0aGluZyB0aGF0IGNhbgo+IGJvb3Qgbm9ybWFsbHkgaXMgdGhlIGxhdGVzdCBwYXRjaAo+
IAo+IFNvLCB3b3VsZCBpdCBtYWtlIHNlbnNlIGFuZCBjb21taXQgeW91ciBvcmlnaW5hbCBwYXRj
aCBmb3Igbm93PyBUaGlzCj4gd2lsbCB1bmxvY2sgbWUgd2l0aCBuZXdlciBCSU9TZXMgb24gdGhl
c2UgYm94ZXMuCgpJIHRoaW5rIHNvLCBjYW4geW91IHBsZWFzZSBwcm92aWRlIGEgdGVzdGVkLWJ5
IHRvIHRoZSBwYXRjaDoKCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRt
bC94ZW4tZGV2ZWwvMjAxOS0wNy9tc2cwMTU0Ny5odG1sCgpGZWVsIGZyZWUgdG8gYWxzbyBub3Rl
IHRoZSB3ZWlyZCBiZWhhdmlvdXIgeW91IGFyZSBzZWVpbmcgd2l0aCB0aGlzCmJveCBhbmQgZmly
bXdhcmUgdmVyc2lvbi4KCj4gQXMgZm9yIHRoZSBvbGRlciBCSU9TZXMsIEkgc3RpbGwgZmVlbCB0
aGF0IGl0IHdvdWxkIGJlIGdyZWF0IGZvciBYZW4KPiB0byBib290IG1vcmUgcmVsaWFibHkgLS0g
ZXNwZWNpYWxseSBzaW5jZSBYZW4gNC4xMCBzZWVtcyB0byBiZSBkb2luZwo+IGZpbmUgcmVnYXJk
bGVzcyBvZiBCSU9TIHZlcnNpb24gYW5kIHNldHRpbmdzLgo+IAo+IFdoYXQgZG8geW91IHRoaW5r
PwoKV2UgY291bGQgYWRkIGEgcXVpcmsgZm9yIHRoaXMgZmltcndhcmUgdmVyc2lvbiBhbmQgaGFy
ZHdhcmUgaWYgd2Uga25vdwpleGFjdGx5IHdoYXQgdGhlIGlzc3VlIGlzLiBIYXZlIHlvdSBmaWd1
cmVkIG91dCBpZiBpdCdzIHJlbGF0ZWQgdG8gdGhlCmZsdXNoPyBpZTogaW9tbXVfaW90bGJfZmx1
c2ggdnMgaW9tbXVfaW90bGJfZmx1c2hfYWxsIHZzIGlvbW11X2ZsdXNoX2FsbD8KClRoYW5rcywg
Um9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

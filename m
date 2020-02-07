Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B83E155523
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 10:55:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j00Jt-0003w7-Q4; Fri, 07 Feb 2020 09:53:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gniO=33=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j00Js-0003vw-EW
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 09:53:04 +0000
X-Inumbo-ID: a0cc19e6-498f-11ea-b11b-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0cc19e6-498f-11ea-b11b-12813bfff9fa;
 Fri, 07 Feb 2020 09:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581069181;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vwlReN3sFTejD/cJGkR6ry+NifEijf+EGYc1VzgX86w=;
 b=Vfz7cBE23M4WrNNYpPQxFsQKVLWcrTS7/acQa7bbsu23JzL+uKarxUFi
 LpkBea0bJ3J1buQtyEXcDgdwtCoDZi9E8ifXSvXOB7usj0/eQe+jGrdPS
 NekxCPiVAIT7uYzJo071yLwFjEsIxPyY44J+5rUjIYpa+svXEoG5lhsiU I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: u1vwo/EvErnYKUVdVgj844cYRGIA4O87NDQN70eItONyQ2xHwD1Jw2PjSty+N64x5p2TiKvEk8
 TEsYhwQh5MbZT4bi7e9acGmGpPft12XjELVXzoR0jdejDBtUSGpnWEdpwyJdA7MBMhmRHeuZA7
 5tPrP1Z6SZ/mFcimoXA2HZZTNFFsbMNq0ZwU6YbhHnbUKmbNsGc0y5z2QqAa9TA0JvRx8S1XKv
 UGQkxjLHgQ90cu5XXBgfCazjSnLjxXHFTClBcGHJ6xEUlmG9EEhakbuPNTTZv4IDGs7kzUSeq9
 OXw=
X-SBRS: 2.7
X-MesageID: 12536154
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,412,1574139600"; d="scan'208";a="12536154"
Date: Fri, 7 Feb 2020 10:52:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200207095249.GB4679@Air-de-Roger>
References: <da353fee-b7f7-73ab-9ebe-632b4ea4152d@suse.com>
 <5ecf685c-7109-4ad6-cba9-bb138f750268@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5ecf685c-7109-4ad6-cba9-bb138f750268@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/p2m: drop p2m_access_t parameter from
 set_mmio_p2m_entry()
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMDcsIDIwMjAgYXQgMDk6MDg6MTVBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDYuMDIuMjAyMCAxNjoyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiAtLS0gYS94
ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgv
dm14LmMKPiA+IEBAIC0zMDM3LDkgKzMwMzcsOCBAQCBzdGF0aWMgaW50IHZteF9hbGxvY192bGFw
aWNfbWFwcGluZyhzdHJ1Cj4gPiAgICAgIHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3QocGcsIGQs
IFNIQVJFX3J3KTsKPiA+ICAgICAgZC0+YXJjaC5odm0udm14LmFwaWNfYWNjZXNzX21mbiA9IG1m
bjsKPiA+ICAKPiA+IC0gICAgcmV0dXJuIHNldF9tbWlvX3AybV9lbnRyeShkLCBwYWRkcl90b19w
Zm4oQVBJQ19ERUZBVUxUX1BIWVNfQkFTRSksIG1mbiwKPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBQQUdFX09SREVSXzRLLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHAybV9nZXRfaG9zdHAybShkKS0+ZGVmYXVsdF9hY2Nlc3MpOwo+ID4gKyAgICByZXR1cm4g
c2V0X21taW9fcDJtX2VudHJ5KGQsIGdhZGRyX3RvX2dmbihBUElDX0RFRkFVTFRfUEhZU19CQVNF
KSwgbWZuLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBBR0VfT1JERVJfNEsp
Owo+ID4gIH0KPiAKPiBVcG9uIDJuZCB0aG91Z2h0IC0gZG9lcyB0aGlzIHJlYWxseSB3YW50IHRv
IHVzZSBkZWZhdWx0IGFjY2Vzcz8KPiBFeGVjdXRlIHBlcm1pc3Npb24gZm9yIHRoaXMgcGFnZSBs
b29rcyBhIGxpdHRsZSBzdXNwaWNpb3VzLgo+IElzbid0IGl0IHRoZSBjYXNlIHRoYXQgdGhpcyBw
YWdlIGRvZXNuJ3QgKG5vcm1hbGx5PykgZ2V0Cj4gYWNjZXNzZWQgYXQgYWxsLCBhbmQgaW5zdGVh
ZCBpdHMgYWRkcmVzcyBzZXJ2ZXMgYXMgYW4gaW5kaWNhdG9yCj4gdG8gdGhlIENQVT8gKEkgZXZl
biB2YWd1ZWx5IHJlY2FsbCBpdCBoYXZpbmcgYmVlbiBjb25zaWRlcmVkIHRvCj4gY29uc29saWRh
dGUgdGhpcywgdG8gZS5nLiBhIHNpbmdsZSBwYWdlIHBlciBkb21haW4uKSBJbiB3aGljaAo+IGNh
c2UgZXZlbiBwMm1fYWNjZXNzX24gbWlnaHQgYmUgZ29vZCBlbm91Z2g/CgpIbSwgSSB0aGluayBw
Mm1fYWNjZXNzX24gaXMgbm90IGVub3VnaCwgYXMgdGhhdCB3b3VsZCB0cmlnZ2VyIGFuIEVQVApm
YXVsdCB3aGljaCBoYXMgcHJlZmVyZW5jZSBvdmVyIHRoZSBBUElDIGFjY2VzcyBWTSBleGl0IChz
ZWUgMjkuNC4xClByaW9yaXR5IG9mIEFQSUMtQWNjZXNzIFZNIEV4aXRzKS4KCkkgdGhpbmsgc2V0
dGluZyBpdCB0byBwMm1fYWNjZXNzX3J3IHNob3VsZCBiZSBlbm91Z2gsIGFuZCB3ZSB3b3VsZCBn
ZXQKRVBUIGZhdWx0cyB3aGVuIHRyeWluZyB0byBleGVjdXRlIGZyb20gQVBJQyBwYWdlLgoKUm9n
ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

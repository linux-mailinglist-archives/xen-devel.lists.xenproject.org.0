Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C79181A95
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 14:59:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC1pu-0006dD-9i; Wed, 11 Mar 2020 13:55:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V419=44=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jC1ps-0006d8-3c
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 13:55:48 +0000
X-Inumbo-ID: 01e2e6b8-63a0-11ea-bec1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01e2e6b8-63a0-11ea-bec1-bc764e2007e4;
 Wed, 11 Mar 2020 13:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583934946;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=etALIky/rRrtU3/QFYHf81TqWsoYMNgp10q4qU8Tj/E=;
 b=b9nn1he5uxHp2T3kP3jFE7wsEx9HeEwDxsBFZvAjW/UPcCzF+Fp9t3oi
 0PA5BDicQEzd3ZdfS6CUUwLmkPm30ZnHOv633D0jYIPRmJYtW2Q65rkFg
 U3vwvAAyEf8dtOawDDv39HVhFpwACgHd+lj78oLJscDFKbT0PHSrkAdkq I=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5+J2NSTs7Ayf2CjSlUXJ0o3IN0F97hT/M5HuQKa24DWWI3GiSLITha86jcjTeArul3TlEX4Ofm
 ZCqtcyxO+CCZHDfdB6uBtq63e7p+IgyBqCEmH8VIyqVuLDKfINiI9ZcktgbJ44PGfBb7sf7jk2
 1mRxSNhMLxchToL+im4HkyltaNre+Vn4LAls0a2RMOm928UWhPEE6hdT0IyILcw+uaG9a/Ffv5
 pTSckqM1OGbXaL9JXNJ0K/kkH9fNUfSqbYW5ZLiHVy5YGiBHXet9GMqX4M4mfP+N3Hqzg3fqgr
 TO8=
X-SBRS: 2.7
X-MesageID: 14110334
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,541,1574139600"; d="scan'208";a="14110334"
Date: Wed, 11 Mar 2020 14:55:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20200311135517.GA24458@Air-de-Roger.citrite.net>
References: <20200310134635.99810-1-roger.pau@citrix.com>
 <24167.46982.390819.472400@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24167.46982.390819.472400@mariner.uk.xensource.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH OSSTEST v2 1/2] examine: detect IOMMU
 availability and add it as a hostflag
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXIgMTAsIDIwMjAgYXQgMDM6NTE6MzRQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gUm9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltQQVRDSCBPU1NURVNUIHYyIDEvMl0gZXhh
bWluZTogZGV0ZWN0IElPTU1VIGF2YWlsYWJpbGl0eSBhbmQgYWRkIGl0IGFzIGEgaG9zdGZsYWci
KToKPiA+IEludHJvZHVjZSBhIG5ldyB0ZXN0IHRvIGNoZWNrIGZvciBpb21tdSBhdmFpbGFiaWxp
dHkgYW5kIGFkZCBpdCBhcyBhCj4gPiBob3N0ZmxhZyBpZiBmb3VuZC4KPiAKPiBUaGFua3MuCj4g
Cj4gPiArc3ViIHNldF9mbGFnKCQkJCkgewo+IAo+IEZpcnN0bHksIGNhbiB5b3UgYnJlYWsgdGhp
cyBuZXcgY29kZSBvdXQgaW50byBpdHMgb3duIHBhdGNoID8KCkNhbiBkbywgYnV0IHRoZW4gdGhl
cmUgd2lsbCBiZSBubyB1c2VyIG9mIHRoZSBpbnRyb2R1Y2VkIGNvZGUgd2hpY2ggSQp0ZW5kIHRv
IGF2b2lkLgoKPiA+ICsgICAgbXkgKCRoZCwgJGhvLCAkZmxhZykgPSBAXzsKPiAKPiBTZWNvbmRs
eSwgdGhpcyBkb2Vzbid0IHRha2UgYSBib29sZWFuaXNoIGZvciB5ZXMvbm8uICBJIHRoaW5rIGl0
Cj4gc2hvdWxkLiAgSWUsIGl0IHNob3VsZCBiZSBjYXBhYmxlIG9mIGJvdGggc2V0dGluZyBhbmQg
Y2xlYXJpbmcuCj4gSSB0aGluayBsZWF2aW5nIHRoYXQgZnVuY3Rpb25hbGl0eSBvdXQgbm93IGlz
IHRvbyBjbG9zZSB0byBFeHRyZW1lCj4gUHJvZ3JhbW1pbmcgZm9yIG15IHRhc3RlLCBldmVuIGZv
ciBvc3N0ZXN0IDotKS4KPiAKPiA+ICsgICAgbXkgJHJtcSA9ICRkYmhfdGVzdHMtPnByZXBhcmUo
PDxFTkQpOwo+ID4gKyAgICAgICAgREVMRVRFIEZST00gaG9zdGZsYWdzIFdIRVJFIGhvc3RuYW1l
PT8gQU5EIGhvc3RmbGFnPT8KPiA+ICtFTkQKPiA+ICsgICAgbXkgJGFkZHEgPSAkZGJoX3Rlc3Rz
LT5wcmVwYXJlKDw8RU5EKTsKPiA+ICsgICAgICAgIElOU0VSVCBJTlRPIGhvc3RmbGFncyAoaG9z
dG5hbWUsaG9zdGZsYWcpIFZBTFVFUyAoPyw/KQo+ID4gK0VORAo+ID4gKyAgICBteSAkYmxlc3Np
bmcgPSBpbnRlbmRlZF9ibGVzc2luZygpOwo+ID4gKwo+ID4gKyAgICBkaWUgIkF0dGVtcHRpbmcg
dG8gbW9kaWZ5IGhvc3QgZmxhZ3Mgd2l0aCBpbnRlbmRlZCBibGVzc2luZyAkYmxlc3NpbmcgIT0g
cmVhbCIKPiA+ICsgICAgICAgIGlmICRibGVzc2luZyBuZSAicmVhbCI7Cj4gCj4gTXVjaCBvZiB0
aGlzIGNvZGUgaXMgaWRlbnRpY2FsIHRvIHRoYXQgaW4gc2V0X3Byb3BlcnR5Lgo+IEkgdGhpbmsg
bWF5YmUgeW91IGNvdWxkIGludHJvZHVjZQo+IAo+ICAgIHN1YiBtb2RpZnlfaG9zdCAoJCQkKSB7
Cj4gICAgICAgIG15ICgkaGQsICRobywgJGZuKSA9IEBfOwo+IAo+IHdoaWNoIGNvbnRhaW5zIHRo
ZSBjYWxsIHRvIGludGVuZGVkX2JsZXNzaW5nIGFuZCBwYXNzZXMgaXRzICRmbgo+IGFyZ3VtZW50
IHRvIGRiX3JldHJ5ID8KCkFjay4KCj4gCj4gPiArKysgYi9Pc3N0ZXN0L0hvc3REQi9TdGF0aWMu
cG0KPiAuLi4KPiA+ICtzdWIgc2V0X3Byb3BlcnR5KCQkJCkgewo+ID4gKyAgICBteSAoJGhkLCAk
aG8sICRmbGFnKSA9IEBfOwo+ID4gKwo+ID4gKyAgICBkaWUgIkNhbm5vdCBzZXQgZmxhZ3MgaW4g
c3RhbmRhbG9uZSBtb2RlIGZvciAkaG8tPntOYW1lfSAkZmxhZ1xuIjsKPiA+ICt9Cj4gCj4gSSBj
b25zaWRlcmVkIHdoZXRoZXIgdGhpcyBtZWFudCB0aGF0IG1vZGlmeV9ob3N0IG91Z2h0IHRvIGJl
IHBhcnQgb2YKPiBzb21lIGJhc2UgY2xhc3MgYnV0ICRybXEgZXRjLiB3b3VsZCBuZWVkIHNldHRp
bmcgdXAgYW5kIHBsdW1iaW5nCj4gdGhyb3VnaCBzbyB0aGF0IHNlZW1zIGJvdGggdG9vIGFubm95
aW5nIGFuZCB0byBtYWtlIHRoaW5ncyB0b28KPiBhYnN0cmFjdC4gIEJ1dCBpZiB5b3UgdGhpbmsg
eW91IGNhbiBhbmQgd291bGQgbGlrZSB0bywgcGxlYXNlIGRvLi4uCj4gCj4gPiBkaWZmIC0tZ2l0
IGEvdHMtZXhhbWluZS1pb21tdSBiL3RzLWV4YW1pbmUtaW9tbXUKPiA+IG5ldyBmaWxlIG1vZGUg
MTAwNzU1Cj4gPiBpbmRleCAwMDAwMDAwMC4uYWU5MWQ0ZDIKPiA+IC0tLSAvZGV2L251bGwKPiA+
ICsrKyBiL3RzLWV4YW1pbmUtaW9tbXUKPiA+IEBAIC0wLDAgKzEsMzEgQEAKPiA+ICsjIS91c3Iv
YmluL3BlcmwgLXcKPiAuLi4KPiA+ICtvdXIgJGhhc19pb21tdSA9ICF0YXJnZXRfY21kX3Jvb3Rf
c3RhdHVzKCRobywgJ3hsIGluZm98Z3JlcCBkaXJlY3RpbycsIDEwKTsKPiAKPiBQbGVhc2UgZmV0
Y2ggdGhlIG91dHB1dCBvZiB4bCBpbmZvIGFuZCBkbyB0aGUgZ3JlcHBpbmcgaW4gcGVybC4KPiAK
PiBUaGUgd2F5IHlvdSBkbyBpdCBoZXJlIHdpbGwgbWlzcyBhIHNpdHVhdGlvbiB3aGVyZSB4bCBp
bmZvIGZhaWxzCj4gY29tcGxldGVseSwgd2hpY2ggb3VnaHQgdG8gYmUgZmF0YWwsIG5vdCB0cmVh
dGVkIGFzICJubyBpb21tdSIuCgpTdXJlLgoKPiBBcGFydCBmcm9tIHRoZXNlIHRoaW5ncywgdGhl
IGNvZGUgYWxsIExHVE0uCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==

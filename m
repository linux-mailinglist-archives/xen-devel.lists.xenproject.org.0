Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A981DA593F
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 16:25:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4nF5-0003uP-Ti; Mon, 02 Sep 2019 14:23:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2SMQ=W5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i4nF3-0003uE-TX
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 14:23:37 +0000
X-Inumbo-ID: 4019ea66-cd8d-11e9-b95f-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4019ea66-cd8d-11e9-b95f-bc764e2007e4;
 Mon, 02 Sep 2019 14:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567434216;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=orOGleUvqNy1vUvLQkw37VfDM8uAWDt+InEc3f0+gI4=;
 b=eNu9snv7oZbB0II2HLPuK5/BL2W5kRQhDkeBW5DEDWua/R4U92g1OgX1
 w5sFQM+582J5bvyVS1O6NO3464riogQgzBbIhEjR/ggUERep2skKagqPJ
 5OSncERLkZnAZMxB32akw/ddM5zvSNz6yuImr9BxV98mYZ5pwqIsX/pkm E=;
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
IronPort-SDR: +IrF6fJwe8Uhres2O+LN3f1qySQ1hil/Eqwnf8ff28ZCnU/y2RPQN95eD9ldK2s2gJIcPSM+T/
 Y+I617xBdfni/lDcbCyaHklHucJnqZbtrTxr6kgSDax73wpFnVB736QMjKQcTx5w+OwIiWJgj3
 Zfqf+oZhzNp2quismSxD/qXjBFG65BpvuOrQRMu3rqAlH9StoB6SL/rbHE/fLVhHADEeB0k+sO
 5UmznzjQ/Iej5JWIGEN2DG4AEnm0lot7fthrq9pOxNBukCmj8aqB0G49HoN70ZjqSxrbgqqoW9
 F7o=
X-SBRS: 2.7
X-MesageID: 5206248
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,459,1559534400"; 
   d="scan'208";a="5206248"
Date: Mon, 2 Sep 2019 16:23:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190902142325.2na455eb75xy5kbp@Air-de-Roger>
References: <20190902113034.97934-1-roger.pau@citrix.com>
 <e4afc421-17ef-32a7-21f4-3ecb65ebb44a@suse.com>
 <20190902135813.tz64qcg5rxujis6j@Air-de-Roger>
 <386cdf66-f53a-555e-6fb9-1c60681ce082@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <386cdf66-f53a-555e-6fb9-1c60681ce082@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] vpci: don't allow access to devices not
 assigned to the domain
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMDIsIDIwMTkgYXQgMDQ6MTU6MDJQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDIuMDkuMjAxOSAxNTo1OCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBNb24sIFNlcCAwMiwgMjAxOSBhdCAwMTo1ODowN1BNICswMjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAwMi4wOS4yMDE5IDEzOjMwLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPj4+
IERvbid0IGFsbG93IHRoZSBoYXJkd2FyZSBkb21haW4gdG8gYWNjZXNzIHRoZSBQQ0kgY29uZmln
IHNwYWNlIG9mCj4gPj4+IGRldmljZXMgbm90IGFzc2lnbmVkIHRvIGl0LiBJZTogdGhlIGNvbmZp
ZyBzcGFjZSBvZiBpb21tdSBkZXZpY2VzCj4gPj4+IGluIHVzZSBieSBYZW4gc2hvdWxkIG5vdCBi
ZSBhY2Nlc3NpYmxlIHRvIHRoZSBoYXJkd2FyZSBkb21haW4uCj4gPj4KPiA+PiBXZWxsLCBJIGFn
cmVlIHdpdGggd2hhdCB5b3Ugc2F5IGFib3ZlLCBidXQgdGhlIGNvZGUgY2hhbmdlIGRpc2FsbG93
cwo+ID4+IG11Y2ggbW9yZSB0aGFuIHRoaXMuIEluIHBhcnRpY3VsYXIgRG9tMCAoYW5kIG1heWJl
IHN0dWIgZG9tYWlucyB0b28pCj4gPj4gbmVlZCB0byBiZSBhYmxlIHRvIGFjY2VzcyB0aGUgY29u
ZmlnIHNwYWNlIG9mIGRldmljZXMgYXNzaWduZWQgdG8KPiA+PiBndWVzdHMsIGUuZy4gZm9yIHFl
bXUgdG8gY29udHJvbCBNU0kgYW5kL29yIE1TSS1YLgo+ID4gCj4gPiBSaWdodCwgSSB3YXMgb3Zl
cmxvb2tpbmcgdGhlIGZhY3QgdGhhdCBhIGRvbWFpbiB1c2luZyB2UENJIGl0c2VsZgo+ID4gc2hv
dWxkIGJlIGFibGUgdG8gaGFuZGxlIHBhc3N0aHJvdWdoIGJhY2tlbmRzIGZvciBvdGhlciBkb21h
aW5zLgo+ID4gCj4gPiBJIHRoaW5rIHRoZSBjb25kaXRpb24gc2hvdWxkIGluc3RlYWQgY2hlY2sg
aWYgdGhlIGRldmljZSBpcyBhc3NpZ25lZAo+ID4gdG8gZG9tX3hlbiwgYW5kIGRvbid0IGFsbG93
IGRvbWFpbnMgYWNjZXNzIHRvIGRldmljZXMgYXNzaWduZWQgdG8KPiA+IGRvbV94ZW4uCj4gCj4g
RXZlbiB0aGF0IGdvZXMgdG9vIGZhciBpbW86IFdlIGRlbGliZXJhdGVseSBhbGxvdyByZWFkIGFj
Y2VzcyB0bwo+IHIvbyBkZXZpY2VzLCBpbiBvcmRlciB0byBhdm9pZCBhbm9tYWxpZXMgaW4gYnVz
IGVudW1lcmF0aW9uIGluCj4gRG9tMC4gQW5kIEknZCB2ZXJ5IG11Y2ggaG9wZSB3cml0ZSBhdHRl
bXB0cyBhbHJlYWR5IGhvbm9yIHRoZQo+IHBzZWctPnJvX21hcCBiaXQgZm9yIGEgZGV2aWNlLgoK
SG0sIG5vLCBBRkFJQ1QgdlBDSSB3YXMganVzdCBieXBhc3NpbmcgdGhlIHJvX21hcCBBVE0uCgpT
byB0aGUgcHJvYmxlbSBJIGZvdW5kLCBhbmQgdGhhdCBJIHdhcyB0cnlpbmcgdG8gYWRkcmVzcyB3
aXRoIHRoaXMKcGF0Y2ggaXMgdGhhdCBhIFBWSCBkb20wIG9uIEFNRCBoYXJkd2FyZSBmaW5kcyB0
aGUgaW9tbXVzIGJ5IHNjYW5uaW5nCnRoZSBQQ0kgYnVzLCBhbmQgYSBMaW51eCBkb20wIHNlZW1z
IHRvIGltbWVkaWF0ZWx5IHR1cm4gb2ZmIHRoZSBNU0kKZW5hYmxlIGNvbnRyb2wgYml0IG9uIGFu
eSBkZXZpY2VzIGl0IGZpbmRzLCB0aHVzIGxlYXZpbmcgdGhlIGlvbW11CndpdGhvdXQgYmVpbmcg
YWJsZSB0byBnZW5lcmF0ZSBpbnRlcnJ1cHRzLgoKSSBjYW4gaW1wbGVtZW50IHRoZSBSTyBzdHVm
ZiwgYnV0IGl0IHNlZW1zIHdlaXJkIHRvIG1lLiBBRkFJQ1QgdGhlCm9ubHkgZGV2aWNlcyBvd25l
ZCBieSBYZW4gc2hvdWxkIGJlIHRoZSBzZXJpYWwgY29uc29sZSwgdGhlIGlvbW11IGFuZAp0aGUg
SFBFVCBtYXliZS4gSG93IGNhbiBoaWRpbmcgdGhvc2UgY2F1c2UgYW5vbWFsaWVzIGluIGJ1cwpl
bnVtZXJhdGlvbj8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

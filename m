Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0458E14548D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 13:47:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuFMx-0005i6-7u; Wed, 22 Jan 2020 12:44:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zvfy=3L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iuFMv-0005i1-CN
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 12:44:25 +0000
X-Inumbo-ID: e62990f4-3d14-11ea-aecd-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e62990f4-3d14-11ea-aecd-bc764e2007e4;
 Wed, 22 Jan 2020 12:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579697056;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=kD2qOrLLf81PnJUjaX3qs4GaK1kM6Ophzxk+N96w2bo=;
 b=hVbAAqi62WBdDWybp83zwTxzg8xgp0K04u9/g4CJKl/vdmdXMgNffEtO
 g541XIRj31RpaWdOBkMX6EGdNXM8p/RHEdgU06taoyHrtoqzEv4ri3Van
 Nwylkv/mkzUIKh/AJGtDr00RJbJu9TmpF0jZKhign96zrLwXshzoET9cr k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sfLyvUt/x+a8BTQur/m9QX9enPJy7+E7stD0YsUDcV/leADtr1myQAjXyafR1djM+0+wqMhnbf
 BfKpRxjMC3Ar6SSMKSomQ1JF3GJ8YhIGaC1hKHXtL1hL1RsoM9v7Wps6xbgnXkY6sw0Yx9FgTD
 D8LBsf70k2UMjlYdWxT9pbPguNi8GJvtMFyNp17VidQklK1P771rpM00C9JQqbcUApzGSKhig2
 QOPELrb50pGtwPnD5v1BSjrKv64avX9Bdh8Fk1cNKIlGKdLrT7LvtOU53YFxqc5hkjJwuw0ViE
 cxU=
X-SBRS: 2.7
X-MesageID: 11860166
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,350,1574139600"; d="scan'208";a="11860166"
To: "Tian, Kevin" <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <8b611419-a0c7-743f-fec4-f02a04caf114@suse.com>
 <17723247-f12e-5a43-836b-6aff95a93ab1@citrix.com>
 <ab5cd434-0c9a-ca6e-f615-eea57ae40853@suse.com>
 <3b3cb270-7dfe-2f7b-bafc-48a30db12d55@citrix.com>
 <67acfb06-c095-9e8e-89f2-51cb16baabdd@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D739A07@SHSMSX104.ccr.corp.intel.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <78e852f5-faf8-d8e7-c131-9c8035850a86@citrix.com>
Date: Wed, 22 Jan 2020 12:44:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D739A07@SHSMSX104.ccr.corp.intel.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/EPT: adjustments for redundant function
 arguments
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDEvMjAyMCAwMjowOSwgVGlhbiwgS2V2aW4gd3JvdGU6Cj4+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gU2VudDogRnJpZGF5LCBEZWNlbWJlciAyMCwgMjAx
OSAxMTowMiBQTQo+Pgo+PiBPbiAyMC4xMi4yMDE5IDE1OjU4LCBHZW9yZ2UgRHVubGFwIHdyb3Rl
Ogo+Pj4gT24gMTIvMjAvMTkgMjo0MSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjAu
MTIuMjAxOSAxNToyNiwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4+Pj4gT24gMTIvMjAvMTkgMjoy
MSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBJbiBlcHRfcDJtX3R5cGVfdG9fZmxhZ3Mo
KSBwYXNzaW5nIGluIHR5cGUgYW5kIGFjY2VzcyBhcyBzZXBhcmF0ZQo+Pj4+Pj4gcGFyYW1ldGVy
cyBjYW4gYmUgY29uc2lkZXJlZCBhbiBvcHRpbWl6YXRpb24sIGFzIGFsbCBjYWxsZXJzIHNldCB0
aGUKPj4+Pj4+IHJlc3BlY3RpdmUgZmllbGRzIGluIHRoZSBlbnRyeSBiZWluZyB1cGRhdGVkIGJl
Zm9yZSB0aGUgY2FsbC4gUmV0YWluCj4+Pj4+PiB0aGlzIGJlaGF2aW9yIGJ1dCBhZGQgYXNzZXJ0
aW9ucy4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Cj4+Pj4+IEluIHdoYXQgd2F5IGlzIGl0IGFuIG9wdGltaXphdGlvbj8KPj4+PiBU
aGVyZSdzIG5vIHBvaW50ZXIgZGUtcmVmIG5lZWRlZDsgdGhlIHZhbHVlcyB3aWxsIGFscmVhZHkg
Y29tZSBpbgo+Pj4+IHZpYSByZWdpc3RlcnMuIEFuZCAiY2FuIGJlIGNvbnNpZGVyZWQiIGJlY2F1
c2UgcG9zc2libHkgc29tZQo+Pj4+IGNvbXBpbGVycyBhcmUgc21hcnQgZW5vdWdoIHRvIGVsaW1p
bmF0ZSB0aGUgcG9pbnRlciBkZS1yZWYgYWdhaW4KPj4+PiAoYnV0IHRoZW4gaXQnbGwgc3RpbGwg
YmUgYSBiaXRmaWVsZCBleHRyYWN0LCB3aGljaCBjYWxsZXJzIG1heQo+Pj4+IGJlIGFibGUgdG8g
YXZvaWQpLgo+Pj4gUmlnaHQ7IG9uIHRoZSB3aG9sZSBJJ2QgcmF0aGVyIGxldCBjb21waWxlcnMg
ZG8gdGhpcyBzb3J0IG9mCj4+PiBtaWNyby1vcHRpbWl6YXRpb24sIGFuZCBvbmx5IGRvIHRoaXMg
Im1hbnVhbCIgc29ydCBvZiBvcHRpbWl6YXRpb24gd2l0aAo+Pj4gc29tZSBzb3J0IG9mIGJlbmNo
bWFya3Mgc2hvd2luZyB0aGF0IGlzIGhhcyBzb21lIGtpbmQgb2YgZWZmZWN0Lgo+Pj4KPj4+Pj4g
SSBkb24ndCBuZWNlc3NhcmlseSBvcHBvc2UgdGhpcywgYnV0IGdpdmVuIHRoYXQgMyBvZiB0aGUg
NCBjYWxsZXJzCj4+Pj4+IGxpdGVyYWxseSBkbyBzb21ldGhpbmcgbGlrZToKPj4+Pj4KPj4+Pj4g
ICAgIGVwdF9wMm1fdHlwZV90b19mbGFncyhwMm0sICZlLCBlLnNhX3AybXQsIGUuYWNjZXNzKTsK
Pj4+Pj4KPj4+Pj4gSXQgc2VlbXMgbGlrZSBqdXN0IGdldHRpbmcgcmlkIG9mIHRoZSBleHRyYW5l
b3VzIGFyZ3VtZW50cyBtaWdodCBhIGJlCj4+Pj4+IGJldHRlciBvcHRpb24uCj4+Pj4gVGhhdCB3
YXMgbXkgb3JpZ2luYWwgaW50ZW50aW9uIGFzIHdlbGwsIGJ1dCBpaXJjIEFuZHJldyBkaWRuJ3Qg
bGlrZQo+Pj4+IGl0IHdoZW4gd2UgZGlzY3Vzc2VkIGl0IGJhY2sgdGhlbiAodGhlIGNvbnRleHQg
aGVyZSBiZWluZyBYU0EtMzA0KS4KPj4+IEkgZGlkIGEgcXVpY2sgc2tpbSB0aHJvdWdoIHRob3Nl
IHRocmVhZHMgYW5kIGNvdWxkbid0IGZpbmQgYW55IGNvbW1lbnQKPj4+IG9uIHRoaXMgaXNzdWUu
ICBDb3VsZCB5b3UgcG9pbnQgbWUgdG8gdGhlIG1haWwgd2l0aCBpdD8gIChPciBBbmR5LCB3b3Vs
ZAo+Pj4geW91IGNhcmUgdG8gcmVwZWF0IHlvdXIgYXJndW1lbnQ/KQo+PiBJIGd1ZXNzIGl0IG1h
eSBoYXZlIGJlZW4gYW4gaXJjIGRpc2N1c3Npb24sIHF1aXRlIHBvc3NpYmx5IGV2ZW4KPj4gYSBw
cml2YXRlIG9uZSBiZXR3ZWVuIGhpbSBhbmQgbWUuCj4+Cj4+PiBVbHRpbWF0ZWx5IHRoZSBwYXRj
aCBhcyBpdCBzdGFuZHMgaXMgb25seSBtYWtpbmcgdGhlIGV4aXN0aW5nIGNvZGUKPj4+IHNhZmVy
LCBzbyBJJ20gT0sgd2l0aCBnaXZpbmcgaXQgbXkgQWNrIGlmIHlvdSBkb24ndCB3YW50IHRvIHB1
cnN1ZSB0aGUKPj4+IG90aGVyIG9wdGlvbjsgYnV0IEknZCBwcmVmZXIgdHJ5aW5nIHRvIHVuZGVy
c3RhbmQgYW5kIHBvdGVudGlhbGx5Cj4+PiBpbXByb3ZlIHRoaW5ncyB3aGlsZSB3ZSdyZSBhdCBp
dC4gIChBbmQgaWYgdGhlcmUgKmlzKiBhIGdvb2QgcmVhc29uIGZvcgo+Pj4gcGFzc2luZyBpbiBw
YXJhbGxlbCBwYXJhbWV0ZXJzLCBpdCB3b3VsZCBiZSBnb29kIHRvIHJlY29yZCBpdCBpbiBhCj4+
PiBjb21tZW50IHNvIHdlIGRvbid0IGhhdmUgdGhpcyBjb252ZXJzYXRpb24gYWdhaW4gaW4gMyB5
ZWFycycgdGltZS4pCj4+IEknZCBiZSBoYXBweSB0byBnbyB0aGUgb3RoZXIgcm91dGUgLSBhcyBz
YWlkLCB0aGF0J3Mgd2hhdCBJIGhhZAo+PiBpbml0aWFsbHkuCj4+Cj4gQ2FuIEFuZHJldyBjaGlt
ZSBpbiBmb3IgaGlzIGNvbmNlcm4gb24gdGhpcyBhcHByb2FjaD8KClRoZSBmaXJzdCB2ZXJzaW9u
IG9mIHRoZSBYU0EtMzA0IHBhdGNoZXMgcGx1bWJlZCBhIG5ldyBsZXZlbCBwYXJhbWV0ZXIKZG93
bi7CoCBUaGlzIGlzIGJlY2F1c2UgSSBzYXcgdGhlIGZ1bmN0aW9uIGluIHRoaXMgZm9ybSwgYW5k
IHRob3VnaHQKInJpZ2h0IC0gJmUgd29uJ3QgYWx3YXlzIGJlIHJlbGF0ZWQgdG8gdGhlIHR5cGUv
YWNjZXNzIHBhcmFtZXRlcnMgYXMKdGhleSBhcmUgcGFzc2VkIHNlcGFyYXRlbHkiLsKgIGkuZS4g
ZW50cnktPnNwIGNvdWxkbid0IGJlIHJlbGllZCB1cG9uLgoKQXMgZmFyIGFzIEknbSBjb25jZXJu
ZWQsIGl0IGlzIGFuIG9iZnVzY2F0aW9uIG5vdCBhbiBvcHRpbWlzYXRpb24sIGFuZAp0aGUgY29k
ZSB3b3VsZCBiZSBtdWNoIGJldHRlciB3aXRoIHRoZSB0d28gcGFyYW1ldGVycyBkZWxldGVkLgoK
T2YgY291cnNlLCB0aGUgcmVhc29uIHdoeSB0aGUgZnVuY3Rpb24gaXMgYXMgaXQgaXMgaXMgdGhh
dCwgZGVzcGl0ZQpiZWluZyBzdGF0aWMsICZlIGlzIHVuY29uZGl0aW9uYWxseSBhIG1lbW9yeSBv
cGVyYW5kLCBtYWtpbmcgdGhlIHJlYWRzCmFuZCB3cml0ZXMgb24gaXQgcmVxdWlyZSBhIHNlbWFu
dGljIG9yZGVyIFdSVCBvdGhlciBmdW5jdGlvbiBjYWxscywKbWFraW5nIHRoZSBmdW5jdGlvbiB2
ZXJ5IGhhcmQgdG8gb3B0aW1pc2Ugb3ZlcmFsbC7CoCBBIGJldHRlciBhcHByb2FjaAp3b3VsZCBi
ZSB0byBwYXNzIGUgZGlyZWN0bHksIGFuZCByZXR1cm4gdGhlIG5ldyBwZXJtIGJpdHMgaW4gcGxh
Y2UsIGFuZApoYXZlIHRoZSBjYWxsZXIgIiY9IE1BU0s7IHw9IG5ld19wZXJtczsiIHdoaWNoIHdp
bGwgYmUgZmFyIGVhc2llciBmb3IKdGhlIGNvbXBpbGVyIHRvIG9wdGltaXNlLgoKfkFuZHJldwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

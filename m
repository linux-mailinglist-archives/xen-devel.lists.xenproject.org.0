Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B495EC892
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2019 19:37:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQblX-0007ro-6t; Fri, 01 Nov 2019 18:35:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6PC9=YZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iQblV-0007rd-K1
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2019 18:35:17 +0000
X-Inumbo-ID: 596ecc0c-fcd6-11e9-93da-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 596ecc0c-fcd6-11e9-93da-bc764e2007e4;
 Fri, 01 Nov 2019 18:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572633316;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=fEl97jn1W9QPYAVTIQuxGw9d3EiFnYpMn/n5YoUxNos=;
 b=T5EH2+0RzLEjZQpETQyOYDTeqpQdVxJygN/Zdm0kzVmqyWc93yfgzisx
 p1wbALjVOEglrTLSzcXoDXW/ang4xLX992knjfpNghO5zQqoalTvwINHY
 v+Z5D8hpOltW1R3wsSJrtuAjRCXbpqBq7/RJpr8cIMln9pUd0uaLN9Oca A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OVA7o77iXrUHneQEr1xGZtCBGTs0wjXyfNBEeVVXn2l16VqW9SzxOZa5u2+JalexaKHUUrrcO1
 0Vtxpr4C1eSariNpfJowxcBTv/iN6T9nnBbxS6SBWYcMjO845/O3JuxidoDXLPNBH7Kv8rf5DL
 zLsrhaW24OTSu2ZfaqGbd6qm6rGUQVjCiPAjGx3FnbAi/kaBz5b7VDA2KTnwtqMQMpW1ljNX8y
 LxMBpIPXA0VyANGLZdeJ9AxdkaT0cE+Gd01JVXyqNEGKCJW9oCM7cScuphKd7ff85OBc3pcRX2
 srw=
X-SBRS: 2.7
X-MesageID: 8123219
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,256,1569297600"; 
   d="scan'208";a="8123219"
To: Jan Beulich <jbeulich@suse.com>
References: <1e714166-ffeb-06a1-9caf-412eb040ac5a@suse.com>
 <005a7254-aae8-ec7c-6e65-9dfe06803208@suse.com>
 <2b7a7130-9532-82fe-c5fc-58745862e6dd@citrix.com>
 <8be656ff-d372-8e67-0732-e85ae0bab49c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <8ae24f32-9b30-a19f-d6ed-5136bbf87c8c@citrix.com>
Date: Fri, 1 Nov 2019 18:35:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8be656ff-d372-8e67-0732-e85ae0bab49c@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/2] x86: explicitly disallow guest access
 to PPIN
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMTAvMjAxOSAxMjowMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMzAuMTAuMjAxOSAx
Mjo0MywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMzAvMTAvMjAxOSAxMDozOSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBUbyBmdWxmaWxsIHRoZSAicHJvdGVjdGVkIiBpbiBpdHMgbmFtZSwg
ZG9uJ3QgbGV0IHRoZSByZWFsIGhhcmR3YXJlCj4+PiB2YWx1ZXMgInNoaW5lIHRocm91Z2giLiBS
ZXBvcnQgYSBjb250cm9sIHJlZ2lzdGVyIHZhbHVlIGV4cHJlc3NpbmcgdGhpcy4KPj4+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+PiAtLS0KPj4+
IFRCRDogRG8gd2Ugd2FudCB0byBwZXJtaXQgRG9tMCBhY2Nlc3M/Cj4+IEkgd291bGQgcmVjb21t
ZW5kIHJlb3JkZXJpbmcgdGhlIHR3byBwYXRjaGVzIGFuZCBwdXR0aW5nIHRoaXMgb25lIGZpcnN0
Cj4+IChhbG9uZyB3aXRoIHRoZSBlbnVtZXJhdGlvbiBkZXRhaWxzLCBhbG9uZyB3aXRoIGEgcGFp
ciBvZiBmZWF0dXJlCj4+IHN0cmluZ3MgaW4geGVuLWNwdWlkKS7CoCBUaGlzIHBhdGNoIGF0IGxl
YXN0IHdhbnRzIGJhY2twb3J0aW5nLgo+IFdlbGwsIHRoZSByZWFzb24gZm9yIHRoaXMgb3JkZXJp
bmcgaXMgYmVjYXVzZSB0aGlzIHdheSBEb20wCj4gZG9lc24ndCB0cmFuc2llbnRseSBsb3NlIGFs
bCBhY2Nlc3MuCgpOb3RoaW5nIHByZS1leGlzdGluZyBjYW4gYmUgdXNlZCByZWxpYWJseSBieSBk
b20wIGJlY2F1c2Ugb2YgdGhlCnJhei93cml0ZS1kaXNjYXJkIGJlaGF2aW91ci4KCkkgd291bGRu
J3QgY29tcGxpY2F0ZSBwYXRjaCBvcmRlcmluZyBiZWNhdXNlIG9mIHRoaXMuCgo+Cj4gQXMgdG8g
eGVuLWNwdWlkIC0gSSBhZG1pdCBJIHNpbXBseSBmb3Jnb3QgdG8gdXBkYXRlIGl0LCBsYXJnZWx5
Cj4gZHVlIHRvIHRoZXJlIG5vdCBiZWluZyBhbnkgQ1BVSUQgYml0IG9uIHRoZSBJbnRlbCBzaWRl
LiBUaGF0IHBhcnQKPiB3b3VsZCBvYnZpb3VzbHkgbGl2ZSBpbiB3aGljaGV2ZXIgcGF0Y2ggd2Ug
ZWxlY3QgdG8gYmUgZmlyc3QuCj4KPj4gVGhpcyB3b3VsZCBiZSBmYXIgbW9yZSBzaW1wbGUgaWYg
d2UgZG9uJ3QgcGVybWl0IGRvbTAgYWNjZXNzLsKgIFllcywgaXQKPj4gc2hhcmVzIHBsYXRmb3Jt
IHJlc3BvbnNpYmlsaXR5IHdpdGggWGVuLCBidXQgaXQgYWxzbyBjYW4ndCBkbyBhbnl0aGluZwo+
PiBtb3JlIHdpdGggdGhlIHZhbHVlIHRoYW4gWGVuIGNhbiwgd2hpY2ggaXMgdG8gc2ltcGx5IHBy
aW50IGl0IG91dCBmb3IgI01DRXMuCj4gT2theSwgdGhlbiBsZXQncyBub3QgZXhwb3NlIGl0LiBJ
J2xsIGRyb3AgdGhlIFRCRC4KCkknbGwgcmUtcmV2aWV3IHdpdGggZG9tMCBhY2Nlc3MgaW4gbWlu
ZCwgYnV0IHN0YXJ0IGEgbmV3IHRocmVhZC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

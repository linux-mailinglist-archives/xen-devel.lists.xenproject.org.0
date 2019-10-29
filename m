Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E095EE8A9E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 15:19:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPSJA-0006m4-EA; Tue, 29 Oct 2019 14:17:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lo1b=YW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iPSJ9-0006lz-9s
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 14:17:15 +0000
X-Inumbo-ID: c1d229a7-fa56-11e9-9513-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c1d229a7-fa56-11e9-9513-12813bfff9fa;
 Tue, 29 Oct 2019 14:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572358614;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Mv782HxGQE5iGCEhjn7DlhyXZmEaW+Ipy48Szr7W6hg=;
 b=ZVtvEfrriAGxvgVwgto94gBajS0icWHx4ktiNOixRTddsqsWh3y9aH3n
 5VIdqj1L/pO9Da8VRctVAClAIlTa993eVOK6C4L8bA7XxSASCUrcIRGNK
 2noTZPogbYC2lIZF2uav5aT4ym1Frrlp6acktNvQzjZ/cSHocYipbvzzz I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: g3MIj+74JBvdn9kBCtLtC8tizOA92TuA1pOhURvcDdzyNK0BnVgnPA4B4JUR3dcEKWsiYCRbUC
 3WEnTvQfesz/QC+mTVWEZavbfQs0VlIBXcg5LSgrRYQ44jvuHMdylAyhHbr3QCrKshm+MR61tO
 gaor776JVVyMxg7FICaJQ4oQpNPLQ4gDdbdeeViXImLdJg+58yT5jN1JmhJcvRC/i5ZPT6BhkP
 lWCw/VdM4lGqS8wxCA6c7Ewe83j9JtAHRzjBxw3rPimPmBuCzJ2qZHYrv5PAO07KknpvAO4yQv
 X6s=
X-SBRS: 2.7
X-MesageID: 7561326
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,244,1569297600"; 
   d="scan'208";a="7561326"
To: Jan Beulich <jbeulich@suse.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-3-andrew.cooper3@citrix.com>
 <9a76e252-b9a3-4454-6ca8-ab521276fc31@suse.com>
 <782089aa-7994-f471-3c52-2afb30f95812@citrix.com>
 <c12afdd1-c561-bc79-5c36-22ac2e994953@suse.com>
 <6d7c899e-81ab-bc61-a589-043b327b3137@citrix.com>
 <477a6513-0caf-fc4a-21cf-a3a101b6c5ca@suse.com>
 <5b6b2cd3-b8a5-7697-e6f4-f7c337242276@amazon.de>
 <5d075fd9-acbe-0fcd-8f22-9f49c61f657f@citrix.com>
 <15ce3d44-0eaf-c01b-8c80-b0067de9e249@amazon.de>
 <1924da4a-b2d7-456e-5276-6c33338ec86b@citrix.com>
 <ad9f735e-4c68-95f9-aa8d-44b5a09095ff@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <2a4d71e8-56f1-d7b6-b149-03745baa484c@citrix.com>
Date: Tue, 29 Oct 2019 14:16:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ad9f735e-4c68-95f9-aa8d-44b5a09095ff@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 2/7] xen/nospec: Use always_inline to fix
 code gen for evaluate_nospec
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Norbert Manthey <nmanthey@amazon.de>, Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMTAvMjAxOSAxNDowMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjkuMTAuMjAxOSAx
NDo0NiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gSWYgdGhpcyBwYXRjaCBzZXJpZXMgZG9lcyBu
b3QgYWdyZWVtZW50LCBJIHdpbGwgdW5ibG9jayBsaXZlcGF0Y2hpbmcgb24KPj4gNC4xMyBieSBj
b21taXR0aW5nIHRoZSB2MiBwYXRjaCB3aGljaCBjYXVzZXMgQlJBTkNIX0hBUkRFTiB0byBkZXBl
bmQgb24KPj4gQlJPS0VOIGFuZCBmb3JjZSBpdCB0byBiZSBjb21waWxlZCBvdXQgd2l0aCBubyB1
c2VyIGNob2ljZSBhdCBhbGwuCj4+Cj4+IFVuYnJlYWtpbmcgbGl2ZXBhdGNoaW5nIGlzIHN0cmlj
dGx5IG1vcmUgaW1wb3J0YW50IHRoYW4ga2VlcGluZyBhIGJyYW5kCj4+IG5ldyBmZWF0dXJlIGlu
IDQuMTMgaW4gYSBicm9rZW4gZm9ybS7CoCBJJ3ZlIHByb3ZpZGVkIHR3byBhbHRlcm5hdGl2ZQo+
PiBzdHJhdGVnaWVzIHRvIGZpeCB0aGUgNC4xMyBibG9ja2VycywgYnV0IGlmIG5vb25lIGNhbiBh
Z3JlZSBvbiB3aGljaAo+PiBhcHByb2FjaCB0byB1c2UsIEkgd2lsbCBjb21taXQgdGhlIHNpbXBs
ZXIgZml4Lgo+IEFzIHRvIHVuYmxvY2tpbmcgbGl2ZSBwYXRjaGluZyAtIG1heSBJIGFzayB5b3Ug
bG9vayBhdCB0aGUgc3ltYm9sCj4gZGlzYW1iaWd1YXRpb24gcGF0Y2ggSSBkaWQgc3VibWl0PyBU
aGUgdGhyZWFkIGhlcmUsIGFzIHN1Z2dlc3RlZAo+IGJlZm9yZSwgc2hvdWxkIG5vdyBiZSBzb2xl
bHkgYWJvdXQgY29kZSBnZW5lcmF0aW9uLgoKUmlnaHQsIGJ1dCB0aGUgY3VycmVudCBzdGF0ZSBv
ZiBsMXRmLWJhcnJpZXIgaXMgYWxzbyBhIDQuMTMgYmxvY2tlciB0b28KLSBpdCBpcyBub3QgaW4g
YSBzaGlwcGFibGUgc3RhdGUuCgpJdCBlaXRoZXIgd2FudHMgY29tcGlsaW5nIG91dCB0b3RhbGx5
ICh0aGUgdjIgcGF0Y2gpLCBvciBoYXZpbmcgdGhlIGNvZGUKZ2VuZXJhdGlvbiBmaXhpbmcgKHRo
aXMgdjMgc2VyaWVzKSwgb3Igc29tZSBjb25jcmV0ZSAzcmQgc3VnZ2VzdGlvbi4KCj4gQW5kIGp1
c3QgaW4KPiBjYXNlIHlvdSd2ZSBtaXNzZWQgdGhpczogSSBkaWQgaW5kaWNhdGUgSSdtIHdpbGxp
bmcgdG8gZ2l2ZSBteQo+IGFjayBvbiB0aGUgdjMgcGF0Y2ggaGVyZSwgcHJvdmlkZWQgeW91IGFk
anVzdCB0aGUgZGVzY3JpcHRpb24gYXMKPiBhc2tlZCBmb3IgaW4gbXkgaW5pdGlhbCg/KSByZXBs
eS4KCkkgaGFkIG1pc3NlZCB0aGF0LCB5ZXMuwqAgSSdsbCBzZWUgYWJvdXQgdHdlYWtpbmcgdGhl
IGNvbW1pdCBtZXNzYWdlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==

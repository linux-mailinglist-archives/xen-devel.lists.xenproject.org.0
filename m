Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE982152977
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 11:52:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izIGv-00086R-GG; Wed, 05 Feb 2020 10:51:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gd5K=3Z=amazon.co.uk=prvs=297b894c2=pdurrant@srs-us1.protection.inumbo.net>)
 id 1izIGu-00086K-9a
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 10:51:04 +0000
X-Inumbo-ID: 672576be-4805-11ea-90c7-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 672576be-4805-11ea-90c7-12813bfff9fa;
 Wed, 05 Feb 2020 10:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580899864; x=1612435864;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mdHqPa8CN/F+op8+hfqSK7PVs3TAG6GXK4gPti3fqwg=;
 b=WbE5/MRAAHvl8ZW3gXU5wysAOl0FwADM6UHKswtkOttqt+m7WJUAVbou
 4gW/ZQbWQzSSinphAZoE3kvFSKvtQyGJue/Q7+MdOIHcL6dlIKKgEVGpu
 dxwNSXcKtHC6IzNDR5yoiucBivvx3+p4IGAG10DHQl5L4oXc+g77BAOS3 Y=;
IronPort-SDR: H1tKIZEDdtRWxaZN458u4PqJ/Zg1yWOV3KYQu7zS8fNez+WvEsx+2LmE/kaJVkINw59kVgRgb9
 Ez6qPxSqutew==
X-IronPort-AV: E=Sophos;i="5.70,405,1574121600"; d="scan'208";a="23178276"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-81e76b79.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 05 Feb 2020 10:50:49 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-81e76b79.us-west-2.amazon.com (Postfix) with ESMTPS
 id B7626A1F2D; Wed,  5 Feb 2020 10:50:47 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 5 Feb 2020 10:50:47 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 5 Feb 2020 10:50:46 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 5 Feb 2020 10:50:46 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Anthony PERARD <anthony.perard@citrix.com>
Thread-Topic: [PATCH] libxl: fix assertion failure in stub domain creation
Thread-Index: AQHV3AfhEZbu6e8krkCMUosxSRPPX6gMazMAgAAAfnA=
Date: Wed, 5 Feb 2020 10:50:46 +0000
Message-ID: <822309f6c7ef4109b731d37efbad5793@EX13D32EUC003.ant.amazon.com>
References: <20200205093724.2854-1-pdurrant@amazon.com>
 <20200205104716.GA85066@perard.uk.xensource.com>
In-Reply-To: <20200205104716.GA85066@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.10]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] libxl: fix assertion failure in stub domain
 creation
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgo+IFNlbnQ6IDA1IEZlYnJ1YXJ5IDIwMjAgMTA6NDcKPiBU
bzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPgo+IENjOiB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmc7IElhbiBKYWNrc29uCj4gPGlhbi5qYWNrc29uQGV1LmNpdHJp
eC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqQo+IDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBsaWJ4bDogZml4IGFzc2VydGlv
biBmYWlsdXJlIGluIHN0dWIgZG9tYWluIGNyZWF0aW9uCj4gCj4gT24gV2VkLCBGZWIgMDUsIDIw
MjAgYXQgMDk6Mzc6MjRBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+ID4gQW4gYXNzZXJ0
aW9uIGluIGxpYnhsX19kb21haW5fbWFrZSgpOgo+ID4KPiA+ICdzb2Z0X3Jlc2V0IHx8ICpkb21p
ZCA9PSBJTlZBTElEX0RPTUlEJwo+ID4KPiA+IGRvZXMgbm90IGhvbGQgdHJ1ZSBmb3Igc3R1YiBk
b21haW4gY3JlYXRpb24sIHdoZXJlIHNvZnRfcmVzZXQgaXMgZmFsc2UKPiA+IGJ1dCB0aGUgcGFz
c2VkIGluIGRvbWlkID09IDAuIFRoaXMgaXMgZWFzaWx5IGZpeGVkIGJ5IGNoYW5naW5nIHRoZQo+
ID4gaW5pdGlhbGl6ZXIgaW4gbGlieGxfX3NwYXduX3N0dWJfZG0oKS4KPiA+Cj4gPiBGaXhlczog
NzUyNTkyMzlkODVkICgibGlieGxfY3JlYXRlOiBtYWtlICdzb2Z0IHJlc2V0JyBleHBsaWNpdCIp
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Cj4g
PiAtLS0KPiA+ICB0b29scy9saWJ4bC9saWJ4bF9kbS5jIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS90
b29scy9saWJ4bC9saWJ4bF9kbS5jIGIvdG9vbHMvbGlieGwvbGlieGxfZG0uYwo+ID4gaW5kZXgg
Zjc1OGRhZjNiNi4uM2IxZGE5MDE2NyAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhs
X2RtLmMKPiA+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKPiA+IEBAIC0yMTI3LDcgKzIx
MjcsNyBAQCB2b2lkIGxpYnhsX19zcGF3bl9zdHViX2RtKGxpYnhsX19lZ2MgKmVnYywKPiBsaWJ4
bF9fc3R1Yl9kbV9zcGF3bl9zdGF0ZSAqc2RzcykKPiA+ICAgICAgICAgIGdvdG8gb3V0Owo+ID4g
ICAgICB9Cj4gPgo+ID4gLSAgICBzZHNzLT5wdnFlbXUuZ3Vlc3RfZG9taWQgPSAwOwo+ID4gKyAg
ICBzZHNzLT5wdnFlbXUuZ3Vlc3RfZG9taWQgPSBJTlZBTElEX0RPTUlEOwo+IAo+IEhvdyB0aGlz
IHdvcmtzPyBJTlZBTElEX0RPTUlEIHNlZW1zIHRvIGJlIGRpcmVjdGx5IGZlZWQgdG8KPiB4Y19k
b21haW5fY3JlYXRlKCksIHdoaWNoIGlzIHVzaW5nIFhFTl9ET01DVExfY3JlYXRlZG9tYWluLgo+
IEJ1dCBhIGNvbW1lbnQgaW4gZG9tY3RsLmggZm9yIFhFTl9ET01DVExfY3JlYXRlZG9tYWluIHJl
YWQ6Cj4gICAgIE5CLiB4ZW5fZG9tY3RsLmRvbWFpbiBpcyBhbiBJTi9PVVQgcGFyYW1ldGVyIGZv
ciB0aGlzIG9wZXJhdGlvbi4KPiAgICAgSWYgaXQgaXMgc3BlY2lmaWVkIGFzIHplcm8sIGFuIGlk
IGlzIGF1dG8tYWxsb2NhdGVkIGFuZCByZXR1cm5lZC4KPiBTbywgaXMgeGNfZG9tYWluX2NyZWF0
ZSBnb2luZyB0byBjcmVhdGUgYSBuZXcgZG9tYWluIHdpdGgKPiBkb21pZD09SU5WQUxJRF9ET01J
RD8KPiAKCkFzIGl0IGhhcHBlbnMsIG5vLiBUaGF0IGNvbW1lbnQgaXMgd3JvbmcuIEl0IHNob3Vs
ZCByZWFkICJJZiBpdCBpcyBub3Qgc2V0IHRvIGEgdmFsaWQgdmFsdWUsIGFuIGlkIGlzIGF1dG8t
YWxsb2NhdGVkIGFuZCByZXR1cm5lZCIuCgogIFBhdWwKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAAE14E001
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 18:35:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixDgq-00060N-Gs; Thu, 30 Jan 2020 17:33:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EN2q=3T=amazon.co.uk=prvs=29183970d=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ixDgo-00060F-MA
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 17:33:14 +0000
X-Inumbo-ID: 97a3ed76-4386-11ea-8396-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97a3ed76-4386-11ea-8396-bc764e2007e4;
 Thu, 30 Jan 2020 17:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580405595; x=1611941595;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Dy1LMGUptVWn7rlpq0WuYyqlGqwSGJ+TlHnNji2oBhQ=;
 b=MBuxzzCDJndcMbkhFruhO+rLwShlHP0J8OkdAgTXBCOtVYwzkW32JgFf
 f1SmLdV0aF6+Kyge2Oy2VJfn2Qo3e/ur1fbXciz3GBmJM3zIfg/vUsmOY
 Pqw1rUTEhdeV7n1gywygxaaXDf/qr0Iwt3ZI4KuMa9TZpXlZPOZL2ETiq g=;
IronPort-SDR: 7ajgTsjvicelcobwSQw9PEaUHeYqTRofVgo35Xbu3edvr/XWZTCBbuQnaMqeD2CemW5HEr+WLh
 nLi1InRc5jYg==
X-IronPort-AV: E=Sophos;i="5.70,382,1574121600"; d="scan'208";a="22078712"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 30 Jan 2020 17:32:38 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com (Postfix) with ESMTPS
 id B7D17A2592; Thu, 30 Jan 2020 17:32:34 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 30 Jan 2020 17:32:34 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 30 Jan 2020 17:32:33 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 30 Jan 2020 17:32:32 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [PATCH v4 5/7] libxl: allow creation of domains with a specified
 or random domid
Thread-Index: AQHV0TKFO4Jmy5qcpU+jNVauOPOraqgDgkKAgAAA/wA=
Date: Thu, 30 Jan 2020 17:32:32 +0000
Message-ID: <2c568b50b55243efa0cfd32c7c999b0b@EX13D32EUC003.ant.amazon.com>
References: <20200122144446.919-1-pdurrant@amazon.com>
 <20200122144446.919-6-pdurrant@amazon.com>
 <24115.4515.335032.366833@mariner.uk.xensource.com>
In-Reply-To: <24115.4515.335032.366833@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 5/7] libxl: allow creation of domains
 with a specified or random domid
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBjaXRyaXguY29tPgo+IFNlbnQ6IDMwIEphbnVhcnkgMjAyMCAxNzoyNgo+IFRvOiBEdXJy
YW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEFudGhvbnkgUGVyYXJkCj4gPGFu
dGhvbnkucGVyYXJkQGNpdHJpeC5jb20+OyBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0Bj
aXRyaXguY29tPjsKPiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Owo+IEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsKPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47Cj4gSmFzb24gQW5k
cnl1ayA8amFuZHJ5dWtAZ21haWwuY29tPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgNS83XSBs
aWJ4bDogYWxsb3cgY3JlYXRpb24gb2YgZG9tYWlucyB3aXRoIGEKPiBzcGVjaWZpZWQgb3IgcmFu
ZG9tIGRvbWlkCj4gCj4gUGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCB2NCA1LzddIGxpYnhs
OiBhbGxvdyBjcmVhdGlvbiBvZiBkb21haW5zIHdpdGgKPiBhIHNwZWNpZmllZCBvciByYW5kb20g
ZG9taWQiKToKPiA+IFRoaXMgcGF0Y2ggYWRkcyBhICdkb21pZCcgZmllbGQgdG8gbGlieGxfZG9t
YWluX2NyZWF0ZV9pbmZvIGFuZCB0aGVuCj4gPiBtb2RpZmllcyBsaWJ4bF9fZG9tYWluX21ha2Uo
KSB0byBoYXZlIFhlbiB1c2UgdGhhdCB2YWx1ZSBpZiBpdCBpcyB2YWxpZC4KPiA+IElmIHRoZSBk
b21pZCB2YWx1ZSBpcyBpbnZhbGlkIHRoZW4gWGVuIHdpbGwgY2hvb3NlIHRoZSBkb21pZCwgYXMg
YmVmb3JlLAo+ID4gdW5sZXNzIHRoZSB2YWx1ZSBpcyB0aGUgbmV3IHNwZWNpYWwgUkFORE9NX0RP
TUlEIHZhbHVlIGFkZGVkIHRvIHRoZSBBUEkuCj4gPiBUaGlzIHZhbHVlIGluc3RydWN0cyBsaWJ4
bF9fZG9tYWluX21ha2UoKSB0byBjaG9vc2UgYSByYW5kb20gZG9taWQgdmFsdWUKPiA+IGZvciBY
ZW4gdG8gdXNlLgo+ID4KPiA+IElmIFhlbiBkZXRlcm1pbmVzIHRoYXQgYSBkb21pZCBzcGVjaWZp
ZWQgdG8gb3IgY2hvc2VuIGJ5Cj4gPiBsaWJ4bF9fZG9tYWluX21ha2UoKSBjby1pbmNpZGVzIHdp
dGggYW4gZXhpc3RpbmcgZG9tYWluIHRoZW4gdGhlIGNyZWF0ZQo+ID4gb3BlcmF0aW9uIHdpbGwg
ZmFpbC4gSW4gdGhpcyBjYXNlLCBpZiBSQU5ET01fRE9NSUQgd2FzIHNwZWNpZmllZCB0bwo+ID4g
bGlieGxfX2RvbWFpbl9tYWtlKCkgdGhlbiBhIG5ldyByYW5kb20gdmFsdWUgd2lsbCBiZSBjaG9z
ZW4gYW5kIHRoZQo+IGNyZWF0ZQo+ID4gb3BlcmF0aW9uIHdpbGwgYmUgcmUtdHJpZWQsIG90aGVy
d2lzZSBsaWJ4bF9fZG9tYWluX21ha2UoKSB3aWxsIGZhaWwuCj4gPgo+ID4gQWZ0ZXIgWGVuIGhh
cyBzdWNjZXNzZnVsbHkgY3JlYXRlZCBhIG5ldyBkb21haW4sIGxpYnhsX19kb21haW5fbWFrZSgp
Cj4gd2lsbAo+ID4gY2hlY2sgd2hldGhlciBpdHMgZG9taWQgbWF0Y2hlcyBhbnkgcmVjZW50bHkg
dXNlZCBkb21pZCB2YWx1ZXMuIElmIGl0Cj4gZG9lcwo+ID4gdGhlbiB0aGUgZG9tYWluIHdpbGwg
YmUgZGVzdHJveWVkLiBJZiB0aGUgZG9taWQgdXNlZCBpbiBjcmVhdGlvbiB3YXMKPiA+IHNwZWNp
ZmllZCB0byBsaWJ4bF9fZG9tYWluX21ha2UoKSB0aGVuIGl0IHdpbGwgZmFpbCBhdCB0aGlzIHBv
aW50LAo+ID4gb3RoZXJ3aXNlIHRoZSBjcmVhdGUgb3BlcmF0aW9uIHdpbGwgYmUgcmUtdHJpZWQg
d2l0aCBlaXRoZXIgYSBuZXcgcmFuZG9tCj4gPiBvciBYZW4tc2VsZWN0ZWQgZG9taWQgdmFsdWUu
Cj4gLi4uCj4gPiAtICAgICAgICByZXQgPSB4Y19kb21haW5fY3JlYXRlKGN0eC0+eGNoLCBkb21p
ZCwgJmNyZWF0ZSk7Cj4gPiArICAgICAgICBpZiAobGlieGxfZG9taWRfdmFsaWRfZ3Vlc3QoaW5m
by0+ZG9taWQpKQo+ID4gKyAgICAgICAgICAgICpkb21pZCA9IGluZm8tPmRvbWlkOwo+ID4gKwo+
ID4gKyAgICBhZ2FpbjoKPiA+ICsgICAgICAgIGZvciAoOzspIHsKPiA+ICsgICAgICAgICAgICBp
ZiAoaW5mby0+ZG9taWQgPT0gUkFORE9NX0RPTUlEKSB7Cj4gPiArICAgICAgICAgICAgICAgIHVp
bnQxNl90IHY7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgIHJldCA9IGxpYnhsX19yYW5kb21f
Ynl0ZXMoZ2MsICh2b2lkICopJnYsIHNpemVvZih2KSk7Cj4gPiArICAgICAgICAgICAgICAgIGlm
IChyZXQgPCAwKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiArCj4gPiArICAg
ICAgICAgICAgICAgIHYgJj0gRE9NSURfTUFTSzsKPiA+ICsgICAgICAgICAgICAgICAgaWYgKCFs
aWJ4bF9kb21pZF92YWxpZF9ndWVzdCh2KSkKPiA+ICsgICAgICAgICAgICAgICAgICAgIGNvbnRp
bnVlOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgICAqZG9taWQgPSB2Owo+ID4gKyAgICAgICAg
ICAgIH0KPiA+ICsKPiA+ICsgICAgICAgICAgICByZXQgPSB4Y19kb21haW5fY3JlYXRlKGN0eC0+
eGNoLCBkb21pZCwgJmNyZWF0ZSk7Cj4gPiArICAgICAgICAgICAgaWYgKHJldCA9PSAwIHx8IGVy
cm5vICE9IEVFWElTVCB8fCBpbmZvLT5kb21pZCAhPQo+IFJBTkRPTV9ET01JRCkKPiA+ICsgICAg
ICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICAgICB9Cj4gPiArCj4gPiAgICAgICAgICBpZiAo
cmV0IDwgMCkgewo+ID4gICAgICAgICAgICAgIExPR0VEKEVSUk9SLCAqZG9taWQsICJkb21haW4g
Y3JlYXRpb24gZmFpbCIpOwo+ID4gKyAgICAgICAgICAgICpkb21pZCA9IElOVkFMSURfRE9NSUQ7
Cj4gPiArICAgICAgICAgICAgcmMgPSBFUlJPUl9GQUlMOwo+ID4gKyAgICAgICAgICAgIGdvdG8g
b3V0Owo+ID4gKyAgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICAgaWYgKGxpYnhsX19pc19kb21p
ZF9yZWNlbnQoZ2MsICpkb21pZCkpIHsKPiA+ICsgICAgICAgICAgICBpZiAoKmRvbWlkID09IGlu
Zm8tPmRvbWlkKSAvKiBkb21pZCB3YXMgc3BlY2lmaWVkICovCj4gPiArICAgICAgICAgICAgICAg
IExPR0VEKEVSUk9SLCAqZG9taWQsICJkb21haW4gaWQgcmVjZW50bHkgdXNlZCIpOwo+ID4gKwo+
ID4gKyAgICAgICAgICAgIHJldCA9IHhjX2RvbWFpbl9kZXN0cm95KGN0eC0+eGNoLCAqZG9taWQp
Owo+ID4gKyAgICAgICAgICAgIGlmICghcmV0KSB7Cj4gPiArICAgICAgICAgICAgICAgICpkb21p
ZCA9IElOVkFMSURfRE9NSUQ7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgIC8qIElmIHRoZSBk
b21pZCB3YXMgbm90IHNwZWNpZmllZCB0aGVuIGhhdmUgYW5vdGhlciBnbwo+ICovCj4gPiArICAg
ICAgICAgICAgICAgIGlmICghbGlieGxfZG9taWRfdmFsaWRfZ3Vlc3QoaW5mby0+ZG9taWQpKQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgZ290byBhZ2FpbjsKPiA+ICsgICAgICAgICAgICB9Cj4g
Cj4gWW91IGhhdmUgd3JpdHRlbiB0aGlzIGFzIHR3byBuZXN0ZWQgbG9vcHMsIG9uZSBvZiB3aGlj
aCBpcyBpbXBsZW1lbnRlZAo+IGFzIGEgZ290bywgYnV0IGFjdHVhbGx5IGxvZ2ljYWxseSB0aGlz
IGlzIHN1cmVseSBvbmx5IG9uZSBsb29wID8KPiBQbGVhc2UgY291bGQgeW91IHJlb3JnYW5pc2Ug
dGhpcyBhbmQgdGhlbiBJJ2xsIHJlYWQgaXQgYWdhaW4uLi4KPiAKCk9rLCBJJ2xsIHRyeSB0byBz
cXVhc2ggaXQgZG93biB0byBvbmUuIEl0IHNob3VsZCBiZSBkby1hYmxlLgoKICBQYXVsCgo+IFRo
YW5rcywKPiBJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1839B12F605
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 10:22:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inJ7m-0000k5-3Z; Fri, 03 Jan 2020 09:20:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tmXo=2Y=amazon.com=prvs=264a10e96=pdurrant@srs-us1.protection.inumbo.net>)
 id 1inJ7k-0000Wn-Ev
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 09:20:04 +0000
X-Inumbo-ID: 34c6a20c-2e0a-11ea-a914-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34c6a20c-2e0a-11ea-a914-bc764e2007e4;
 Fri, 03 Jan 2020 09:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578043196; x=1609579196;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IH8mV+abSvFqfo1QuXYeiVM1S3su71k/Vqrr7x0QwDk=;
 b=JrXKjFOOs8+uSvs2amUKFGyYPhVb2Gru9jBO8RmPeKafUMU0zJZ0lgIq
 Y0FsaWH7yYyewInxwg6MAKP/xYwhIRGm0jGhT2n15j4RczzDAPBADgSKR
 VN1UbxFUMU71H+ESJImBWaHAYvFCY4zXC4lcIXwSV/FK8UDZzROaOh4JB 8=;
IronPort-SDR: 8V75Y8Hkv2ze63ql28BXSzA7VwF4lBSWWFYiLhnDqzzGPST/JZXQ8yn10EC/M3pm4hreuhWla9
 zlfz+W687ARw==
X-IronPort-AV: E=Sophos;i="5.69,390,1571702400"; d="scan'208";a="11381167"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 03 Jan 2020 09:19:56 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com (Postfix) with ESMTPS
 id DD484A050A; Fri,  3 Jan 2020 09:19:54 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 3 Jan 2020 09:19:54 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 3 Jan 2020 09:19:53 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 3 Jan 2020 09:19:52 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [PATCH 5/6] libxl: allow creation of domains with specified or
 random domid
Thread-Index: AQHVulqxAit74lI10kuhCdeppYRnCafXrwcAgAEH/VA=
Date: Fri, 3 Jan 2020 09:19:52 +0000
Message-ID: <4ca31bc32d4c4e7dbff3597be23f7ded@EX13D32EUC003.ant.amazon.com>
References: <20191224130416.3570-1-pdurrant@amazon.com>
 <20191224130416.3570-6-pdurrant@amazon.com>
 <24078.10224.157354.511825@mariner.uk.xensource.com>
In-Reply-To: <24078.10224.157354.511825@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.95]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 5/6] libxl: allow creation of domains with
 specified or random domid
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBjaXRyaXguY29tPgo+IFNlbnQ6IDAyIEphbnVhcnkgMjAyMCAxNzoyNwo+IFRvOiBEdXJy
YW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc7IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbnRob255IFBlcmFyZAo+IDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNS82XSBsaWJ4bDog
YWxsb3cgY3JlYXRpb24gb2YgZG9tYWlucyB3aXRoIHNwZWNpZmllZAo+IG9yIHJhbmRvbSBkb21p
ZAo+IAo+IFBhdWwgRHVycmFudCB3cml0ZXMgKCJbUEFUQ0ggNS82XSBsaWJ4bDogYWxsb3cgY3Jl
YXRpb24gb2YgZG9tYWlucyB3aXRoCj4gc3BlY2lmaWVkIG9yIHJhbmRvbSBkb21pZCIpOgo+ID4g
VGhpcyBwYXRjaCBtb2RpZmllcyBkb19kb21haW5fY3JlYXRlKCkgdG8gdXNlIHRoZSB2YWx1ZSBv
ZiBkb21pZCB0aGF0IGlzCj4gPiBwYXNzZWQgaW4uIEEgbmV3ICdzcGVjaWFsIHZhbHVlJyAtIFJB
TkRPTV9ET01JRCAtIGlzIGFkZGVkIGludG8gdGhlIEFQSQo+ID4gYW5kIHRoaXMsIElOVkFMSURf
RE9NSUQgb3IgYW55IHZhbGlkIGRvbWlkIGlzIHBhc3NlZCB1bm1vZGlmaWVkIHRvCj4gPiBsaWJ4
bF9fZG9tYWluX21ha2UoKS4gQW55IG90aGVyIGludmFsaWQgZG9taWQgdmFsdWUgd2lsbCBjYXVz
ZSBhbiBlcnJvci4KPiA+Cj4gPiBJZiBSQU5ET01fRE9NSUQgaXMgcGFzc2VkIGluIHRoZW4gbGli
eGxfX2RvbWFpbl9tYWtlKCkgd2lsbCB1c2UKPiA+IGxpYnhsX19yYW5kb21fYnl0ZXMoKSB0byBj
aG9vc2UgYSBkb21pZC4gSWYgdGhlIGNob3NlbiB2YWx1ZSBpcyBub3QgYQo+ID4gdmFsaWQgZG9t
aWQgdGhlbiB0aGlzIHN0ZXAgd2lsbCBiZSByZXBlYXRlZC4gT25jZSBhIHZhbGlkIHZhbHVlIGlz
Cj4gY2hvc2VuCj4gPiBpdCB3aWxsIGJlIHBhc3NlZCB0byB4Y19kb21haW5fY3JlYXRlKCkgYnV0
IGlmIHRoaXMgZmFpbHMgd2l0aCBhbiBlcnJubwo+ID4gdmFsdWUgb2YgRUVYSVNULCBhIG5ldyBy
YW5kb20gdmFsdWUgd2lsbCBiZSBjaG9zZW4gYW5kIHRoZSBvcGVyYXRpb24KPiB3aWxsCj4gPiBi
ZSByZXRyaWVkLgo+IAo+IFdoYXQgaXMgdGhlIHVzZSBjYXNlIGZvciB0aGlzID8KPiAKClRoZSB1
c2UtY2FzZSBpcyB0cnlpbmcgdG8gbWFrZSBzdXJlIHRoYXQsIGFjcm9zcyBhIHBvb2wgb2YgaG9z
dHMsIHRoZSBsaWtlbGlob29kIG9mIGNyZWF0aW5nIHR3byBkb21haW5zIHdpdGggdGhlIHNhbWUg
ZG9taWQgaXMgc21hbGwuIEJlY2F1c2UgYSB0cmFuc3BhcmVudCBtaWdyYXRpb24gcmVxdWlyZXMg
dGhhdCBkb21pZCBpcyBwZXJzaXN0ZWQsIG1pZ3JhdGlvbnMgYXJlIG1vcmUgbGlrZWx5IHRvIGZh
aWwgKGR1ZSB0byBhIGRvbWlkIGFscmVhZHkgYmVpbmcgaW4gdXNlKSBpZiBhIHNlcXVlbnRpYWwg
c2NoZW1lIGlzIHVzZWQuCgo+IEkgdGhpbmsgdXNpbmcgdGhpcyBpcyBoYXphcmRvdXMgaWYgeW91
IGV2ZXIgZGVzdHJveSBkb21haW5zLCBiZWNhdXNlCj4gaXQgd2lsbCBsZWFkIHRvIHJldXNlIG9m
IGRvbWlkcyBpbiBjaXJjdW1zdGFuY2VzWzFdIHdoZXJlIHJpZ2h0IG5vdwo+IHRoYXQgY2FuJ3Qg
aGFwcGVuLgo+IAo+IFsxXSBGZXdlciB0aGFuIH4yXjE2IGNyZWF0aW9ucyBwZXIgWGVuIGJvb3Qu
CgpBZ3JlZWQsIGJ1dCBpcyB0aGF0IGFjdHVhbGx5IGEgcHJvYmxlbT8gQSBkb21haW4gbXVzdCBi
ZSBmdWxseSBkZXN0cm95ZWQgKGkuZS4gYWxsIHBhZ2UgcmVmcyBkcm9wcGVkKSBiZWZvcmUgaXRz
IGlkIHdpbGwgYmVjb21lIGF2YWlsYWJsZSBmb3IgcmUtdXNlLiBXaGF0IGFyZSB3ZSBhY3R1YWxs
eSB0cnlpbmcgdG8gYXZvaWQgYnkgbm90IGltbWVkaWF0ZWx5IHJlY3ljbGluZz8gSSdkIGNlcnRh
aW5seSBiZSBvcGVuIHRvIGFkZGluZyBzb21lIHNvcnQgb2YgcmV0aXJlbWVudCBsaXN0IGZvciBk
b21pZHMgdGhhdCB3b3VsZCBwcmV2ZW50IHJlLXVzZSB3aXRoaW4gYSBzcGVjaWZpZWQgdGltZSwg
aWYgdGhhdCB3b3VsZCBoZWxwLgoKICBQYXVsCgo+IAo+IElhbi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

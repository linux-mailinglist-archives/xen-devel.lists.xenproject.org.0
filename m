Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 616FE12F5FB
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 10:14:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inIzi-0008NG-84; Fri, 03 Jan 2020 09:11:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tmXo=2Y=amazon.com=prvs=264a10e96=pdurrant@srs-us1.protection.inumbo.net>)
 id 1inIzh-0008NB-K9
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 09:11:45 +0000
X-Inumbo-ID: 1019a572-2e09-11ea-a42f-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1019a572-2e09-11ea-a42f-12813bfff9fa;
 Fri, 03 Jan 2020 09:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578042705; x=1609578705;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LVunF6LbMcpjMBSofo3+ifEGNMoktzwsoblYRq9pgSE=;
 b=CDZPIjdxkkZ2xwnEaHgtfJZ5COT12FDzs27dWYmhwdmpRDRAYaxAilvK
 dVQKw+Pkc4Pc9WkDtiBHYRSAWHdHNn/kcGXHV6MtkpEmuZpUvbUZQhn31
 YbAp9zFgGBzmKg14EEQApVyuqKZ/UBNzKzAEiVYxuJCD9mKsd35/yXu1f s=;
IronPort-SDR: dM7aRGMY4oLXUmJwANSoVdx0xrS+QmIs8ie838DI1Bxm7UQLAiY0FjpZun9xiW1YHjMI8NqYuJ
 moivaVuGaMCg==
X-IronPort-AV: E=Sophos;i="5.69,390,1571702400"; d="scan'208";a="11379936"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 03 Jan 2020 09:11:44 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com (Postfix) with ESMTPS
 id 70F73A20E8; Fri,  3 Jan 2020 09:11:42 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 3 Jan 2020 09:11:42 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 3 Jan 2020 09:11:40 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 3 Jan 2020 09:11:40 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [PATCH 4/6] domctl: set XEN_DOMCTL_createdomain 'rover' if valid
 domid is specified
Thread-Index: AQHVulqvz9FX/MMQbEqivLZI+l+b+qfXrmqAgAEGPyA=
Date: Fri, 3 Jan 2020 09:11:40 +0000
Message-ID: <aae92f7a96644b8bbb04cb0a73794300@EX13D32EUC003.ant.amazon.com>
References: <20191224130416.3570-1-pdurrant@amazon.com>
 <20191224130416.3570-5-pdurrant@amazon.com>
 <24078.10093.571397.417202@mariner.uk.xensource.com>
In-Reply-To: <24078.10093.571397.417202@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.95]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 4/6] domctl: set XEN_DOMCTL_createdomain
 'rover' if valid domid is specified
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBjaXRyaXguY29tPgo+IFNlbnQ6IDAyIEphbnVhcnkgMjAyMCAxNzoyNQo+IFRvOiBEdXJy
YW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc7IEFuZHJldyBDb29wZXIKPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47
IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IEphbgo+IEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IEtvbnJh
ZAo+IFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgU3RlZmFubyBTdGFi
ZWxsaW5pCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNC82XSBkb21jdGw6IHNldCBYRU5fRE9NQ1RMX2NyZWF0ZWRv
bWFpbiAncm92ZXInIGlmCj4gdmFsaWQgZG9taWQgaXMgc3BlY2lmaWVkCj4gCj4gUGF1bCBEdXJy
YW50IHdyaXRlcyAoIltQQVRDSCA0LzZdIGRvbWN0bDogc2V0IFhFTl9ET01DVExfY3JlYXRlZG9t
YWluCj4gJ3JvdmVyJyBpZiB2YWxpZCBkb21pZCBpcyBzcGVjaWZpZWQiKToKPiA+IFRoZSB2YWx1
ZSBvZiAncm92ZXInIGlzIHRoZSB2YWx1ZSBhdCB3aGljaCBYZW4gd2lsbCBzdGFydCBzZWFyY2hp
bmcgZm9yCj4gYW4KPiA+IHVudXNlZCBkb21pZCBpZiBub25lIGlzIHNwZWNpZmllZC4gQ3VycmVu
dGx5IGl0IGlzIG9ubHkgdXBkYXRlZCB3aGVuIGEKPiA+IGRvbWlkIGlzIGF1dG9tYXRpY2FsbHkg
Y2hvc2VuLCByYXRoZXIgdGhhbiBzcGVjaWZpZWQgYnkgdGhlIGNhbGxlciwKPiB3aGljaAo+ID4g
bWFrZXMgaXQgdmVyeSBoYXJkIHRvIGRlc2NyaWJlIFhlbidzIHJhdGlvbmFsZSBpbiBjaG9vc2lu
ZyBkb21pZHMgaW4gYW4KPiA+IGVudmlyb25tZW50IHdoZXJlIHNvbWUgZG9tYWluIGNyZWF0aW9u
cyBoYXZlIHNwZWNpZmllZCBkb21pZHMgYW5kIHNvbWUKPiA+IGRvbid0Lgo+ID4gVGhpcyBwYXRj
aCBhbHdheXMgdXBkYXRlcyAncm92ZXInIGFmdGVyIGEgc3VjY2Vzc2Z1bCBjcmVhdGlvbiwgZXZl
biBpbgo+IHRoZQo+ID4gY2FzZSB0aGF0IGRvbWlkIGlzIHNwZWNpZmllZCBieSB0aGUgY2FsbGVy
LiBUaGlzIGVuc3VyZXMgdGhhdCwgaWYgWGVuCj4gPiBhdXRvbWF0aWNhbGx5IGNob29zZXMgYSBk
b21pZCBmb3IgYSBzdWJzZXF1ZW50IGRvbWFpbiBjcmVhdGlvbiBpdCB3aWxsCj4gPiBhbHdheXMg
YmUgdGhlIG5leHQgYXZhaWxhYmxlIHZhbHVlIGFmdGVyIHRoZSBkb21pZCBvZiB0aGUgbW9zdCBy
ZWNlbnRseQo+ID4gY3JlYXRlZCBkb21haW4uCj4gCj4gSSdtIG5vdCB5ZXQgY29udmluY2VkIHRo
aXMgYmVoYXZpb3VyIGlzIGJldHRlciwgYnV0IEknbSBvcGVuIHRvCj4gcGVyc3Vhc2lvbi4KPiAK
PiBUaGUgZXhpc3RpbmcgYWxsb2NhdGlvbiBzeXN0ZW0gZmFsbHMgZG93biBpbiBhbnkgY2FzZSBp
ZiB0aGUgZG9taWQKPiBnZXRzIG5lYXIgdG8gd3JhcHBpbmcgcm91bmQuICBJZiBpdCBkb2Vzbid0
LCB0aGVuIHdpdGhvdXQgdGhpcyBwYXRjaAo+IGl0IGlzIHBvc3NpYmxlIHRvIGhhdmUgdHdvIHJh
bmdlcyBvZiBkb21pZHM6IGF1dG9tYXRpY2FsbHkgYWxsb2NhdGVkCj4gb25lcywgYW5kIHN0YXRp
Y2FsbHkgYWxsb2NhdGVkIGhpZ2ggb25lcy4KPiAKPiBXaXRoIHRoaXMgcGF0Y2gsIHN0YXRpY2Fs
bHkgYWxsb2NhdGluZyBhIGRvbWlkIHJlc2V0cyByb3ZlciBhbmQgY2F1c2VzCj4gdGhlIHJlbWFp
bmluZyBiaXRzIG9mIHN0YXRpYyBzcGFjZSB0byBiZSBwb2xsdXRlZC4KPiAKPiBXaGF0IGFtIEkg
bWlzc2luZyA/ICBXaGF0IGFyZSB0aGUgdXNlIGNhc2VzIGhlcmUgPwoKVGhlIHByb2JsZW0gSSB3
YXMgdGFja2xpbmcgd2FzIHRyeWluZyB0byBkb2N1bWVudCBob3cgWGVuIGNob29zZXMgYSBkb21p
ZC4gRS5nLiBpdCBpcyBub3QgY29ycmVjdCB0byBzYXkgdGhhdCBpdCBjaG9vc2VzIHRoZSBsb3dl
c3QgbnVtYmVyZWQgYXZhaWxhYmxlIGRvbWlkLiBUaGUgYmVzdCBJIGNvdWxkIGNvbWUgdXAgd2l0
aCB3YXMgJ3RoZSBuZXh0IGF2YWlsYWJsZSBkb21pZCBhZnRlciB0aGUgbGFzdCBvbmUgaXQgdGhv
dWdodCBvZicgd2hpY2ggaXMgcHJldHR5IHBvb3IuLi4gYW5kIGFsc28gYmVjb21lcyBoYXJkZXIg
dG8gZXhwbGFpbiBpZiBzb21lIGRvbWlkcyBhcmUgbm90IGFjdHVhbGx5IGNob3NlbiBieSBYZW4s
IGJlY2F1c2UgdGhlIHRvb2xzdGFjayBzcGVjaWZpZWQgdGhlbS4KClRoZSBlbmQgZ2FtZSB3aGlj
aCB0aGlzIHNlcmllcyBpcyB3b3JraW5nIHRvd2FyZHMgaXMgdHJhbnNwYXJlbnQgbWlncmF0aW9u
IHdoaWNoLCBiZWNhdXNlIG9mIHRoZSAnZGVzaWduJyBvZiBQViBwcm90b2NvbHMgYW5kIGNlcnRh
aW4gaHlwZXJjYWxscyBpbiB0aGUgZ3Vlc3QgQUJJLCByZXF1aXJlcyB0aGF0IHRoZSBkb21pZCBp
cyBwZXJzaXN0ZWQgb24gbWlncmF0aW9uLiBUaGlzIHBhdGNoIGlzIHNpbXBseSB0cnlpbmcgdG8g
bGF5IGdyb3VuZHdvcmsgZm9yIHRoZSBjby1leGlzdGVuY2Ugb2YgZG9tYWlucyB3aXRoIHNwZWNp
ZmllZCBkb21pZHMgYW5kIHRob3NlIHdpdGggYXV0b21hdGljYWxseSBhbGxvY2F0ZWQgZG9taWRz
LiAKCiAgUGF1bAoKPiAKPiBUaGFua3MsCj4gSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==

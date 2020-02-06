Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B6B154265
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 11:54:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izem2-0005gq-6T; Thu, 06 Feb 2020 10:52:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RI0J=32=amazon.co.uk=prvs=29855b991=pdurrant@srs-us1.protection.inumbo.net>)
 id 1izem0-0005g6-31
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 10:52:40 +0000
X-Inumbo-ID: caa9920a-48ce-11ea-8952-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id caa9920a-48ce-11ea-8952-bc764e2007e4;
 Thu, 06 Feb 2020 10:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580986360; x=1612522360;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wWES9IzQd5EmzDXvce/lGHRClrj+6nFdGyuuUqSo0qM=;
 b=ThWpL0YMQoGD+4VZcoUf4aFGr+VutpPCKRP6JZGqNKTsUnuZ4gdgS8Vl
 6B7c8HlzQGqKoygGYugjjrx35PgkIspj9+qak7HlA1igYRrmawVSWNTVZ
 nHVaMqtjnfCDO4IlVJvpa5+57Rp4dcEoB11Una6NiMKwq0DZKSAWWPqWi I=;
IronPort-SDR: GHAlpYm8zv9RlPb9+TKP0PnfdS5CKEWnuGdjnYgIluYtpttVB6aCHh//z6jMLueUpnzG4oLcTm
 +jEzR3ihMuBQ==
X-IronPort-AV: E=Sophos;i="5.70,409,1574121600"; d="scan'208";a="23404837"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 06 Feb 2020 10:52:29 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with ESMTPS
 id 1D45DC5B04; Thu,  6 Feb 2020 10:52:28 +0000 (UTC)
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 6 Feb 2020 10:52:27 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D37EUA003.ant.amazon.com (10.43.165.7) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 6 Feb 2020 10:52:26 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 6 Feb 2020 10:52:26 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] xen/mm: Avoid assuming the page is inuse in
 assign_pages()
Thread-Index: AQHV3Nm0k5iP3kZyl0WYA/ycra3uAqgN++Dg
Date: Thu, 6 Feb 2020 10:52:26 +0000
Message-ID: <d30a9c1b478c4e3a8b082fa625c8989a@EX13D32EUC003.ant.amazon.com>
References: <20200206103833.15355-1-julien@xen.org>
In-Reply-To: <20200206103833.15355-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.213]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] xen/mm: Avoid assuming the page is inuse
 in assign_pages()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Grall, Julien" <jgrall@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+Cj4gU2VudDogMDYgRmVicnVhcnkgMjAyMCAxMDozOQo+IFRvOiB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKPiBDYzoganVsaWVuQHhlbi5vcmc7IER1cnJhbnQsIFBhdWwg
PHBkdXJyYW50QGFtYXpvbi5jby51az47IEdyYWxsLCBKdWxpZW4KPiA8amdyYWxsQGFtYXpvbi5j
b20+Cj4gU3ViamVjdDogW1BBVENIIHYyXSB4ZW4vbW06IEF2b2lkIGFzc3VtaW5nIHRoZSBwYWdl
IGlzIGludXNlIGluCj4gYXNzaWduX3BhZ2VzKCkKPiAKPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGpn
cmFsbEBhbWF6b24uY29tPgo+IAo+IEF0IHRoZSBtb21lbnQsIGFzc2lnbl9wYWdlcygpIG9uIHRo
ZSBwYWdlIHRvIGJlIGludXNlIChQR0Nfc3RhdGVfaW51c2UpCj4gYW5kIHRoZSBzdGF0ZSB2YWx1
ZSB0byBiZSAwLgo+IAo+IEhvd2V2ZXIsIHRoZSBjb2RlIG1heSByYWNlIHdpdGggdGhlIHBhZ2Ug
b2ZmbGluaW5nIGNvZGUgKHNlZQo+IG9mZmxpbmVfcGFnZSgpKS4gRGVwZW5kaW5nIG9uIHRoZSBv
cmRlcmluZywgdGhlIHBhZ2UgbWF5IGJlIGluIG9mZmxpbmluZwo+IHN0YXRlIChQR0Nfc3RhdGVf
b2ZmbGluaW5nKSBiZWZvcmUgaXQgaXMgYXNzaWduZWQgdG8gYSBkb21haW4uCj4gCj4gT24gZGVi
dWcgYnVpbGQsIHRoaXMgbWF5IHJlc3VsdCB0byBoaXQgdGhlIGFzc2VydCBvciBqdXN0IGNsb2Ji
ZXIgdGhlCj4gc3RhdGUuIE9uIG5vbi1kZWJ1ZyBidWlsZCwgdGhlIHN0YXRlIHdpbGwgZ2V0IGNs
b2JiZXJlZC4KPiAKPiBJbmNpZGVudGFsbHkgdGhlIGZsYWcgUEdDX2Jyb2tlbiB3aWxsIGdldCBj
bG9iYmVyZWQgYXMgd2VsbC4KPiAKPiBHcmFiIHRoZSBoZWFwX2xvY2sgdG8gcHJldmVudCBhIHJh
Y2Ugd2l0aCBvZmZsaW5lX3BhZ2UoKSBhbmQga2VlcCB0aGUKPiBzdGF0ZSBhbmQgYnJva2VuIGZs
YWcgYXJvdW5kLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpv
bi5jb20+CgpUaGlzIHNlZW1zIGxpa2UgYSByZWFzb25hYmxlIGNoYW5nZS4gSSBndWVzcyBoYXZp
bmcgYXNzaWduX3BhZ2VzKCkgdGFrZSB0aGUgZ2xvYmFsIGxvY2sgaXMgbm8gbW9yZSBwcm9ibGVt
IHRoYW4gaXRzIGV4aXN0aW5nIGNhbGwgdG8gZG9tYWluX2FkanVzdF90b3RfcGFnZXMoKSB3aGlj
aCBhbHNvIHRha2VzIHRoZSBzYW1lIGxvY2suCgogIFBhdWwKCj4gCj4gLS0tCj4gICAgIENoYW5n
ZXMgaW4gdjI6Cj4gICAgICAgICAtIFN1cGVyc2VlZCA8MjAyMDAyMDQxMzMzNTcuMzIxMDEtMS1q
dWxpZW5AeGVuLm9yZz4KPiAgICAgICAgIC0gRml4IHRoZSByYWNlIHdpdGggb2ZmbGluZV9wYWdl
KCkKPiAtLS0KPiAgeGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgfCAxNiArKysrKysrKysrKysrKy0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyBiL3hlbi9jb21tb24vcGFnZV9h
bGxvYy5jCj4gaW5kZXggOTc5MDJkNDJjMS4uYTY4NGRiZjM3YyAxMDA2NDQKPiAtLS0gYS94ZW4v
Y29tbW9uL3BhZ2VfYWxsb2MuYwo+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4gQEAg
LTIyODMsMTUgKzIyODMsMjcgQEAgaW50IGFzc2lnbl9wYWdlcygKPiAgICAgICAgICAgICAgZ2V0
X2tub3duYWxpdmVfZG9tYWluKGQpOwo+ICAgICAgfQo+IAo+ICsgICAgc3Bpbl9sb2NrKCZoZWFw
X2xvY2spOwo+ICAgICAgZm9yICggaSA9IDA7IGkgPCAoMSA8PCBvcmRlcik7IGkrKyApCj4gICAg
ICB7Cj4gKyAgICAgICAgLyoKPiArICAgICAgICAgKiBXZSBzaG91bGQgb25seSBiZSBoZXJlIGlm
IHRoZSBwYWdlIGlzIGludXNlIG9yIG9mZmxpbmluZy4KPiArICAgICAgICAgKiBUaGUgbGF0dGVy
IGhhcHBlbiBpZiB3ZSByYWNlIHdpdGggbWFya19wYWdlX29mZmxpbmUoKSBhcyB3ZQo+ICsgICAg
ICAgICAqIGRvbid0IGhvbGQgdGhlIGhlYXBfbG9jay4KPiArICAgICAgICAgKi8KPiArICAgICAg
ICBBU1NFUlQocGFnZV9zdGF0ZV9pcygmcGdbaV0sIGludXNlKSB8fAo+ICsgICAgICAgICAgICAg
ICBwYWdlX3N0YXRlX2lzKCZwZ1tpXSwgb2ZmbGluaW5nKSk7Cj4gKyAgICAgICAgQVNTRVJUKCEo
cGdbaV0uY291bnRfaW5mbyAmIH4oUEdDX3N0YXRlIHwgUEdDX2Jyb2tlbikpKTsKPiAgICAgICAg
ICBBU1NFUlQocGFnZV9nZXRfb3duZXIoJnBnW2ldKSA9PSBOVUxMKTsKPiAtICAgICAgICBBU1NF
UlQoIXBnW2ldLmNvdW50X2luZm8pOwo+ICAgICAgICAgIHBhZ2Vfc2V0X293bmVyKCZwZ1tpXSwg
ZCk7Cj4gICAgICAgICAgc21wX3dtYigpOyAvKiBEb21haW4gcG9pbnRlciBtdXN0IGJlIHZpc2li
bGUgYmVmb3JlIHVwZGF0aW5nCj4gcmVmY250LiAqLwo+IC0gICAgICAgIHBnW2ldLmNvdW50X2lu
Zm8gPSBQR0NfYWxsb2NhdGVkIHwgMTsKPiArCj4gKyAgICAgICAgcGdbaV0uY291bnRfaW5mbyAm
PSBQR0Nfc3RhdGUgfCBQR0NfYnJva2VuOwo+ICsgICAgICAgIHBnW2ldLmNvdW50X2luZm8gfD0g
UEdDX2FsbG9jYXRlZCB8IDE7Cj4gKwo+ICAgICAgICAgIHBhZ2VfbGlzdF9hZGRfdGFpbCgmcGdb
aV0sICZkLT5wYWdlX2xpc3QpOwo+ICAgICAgfQo+ICsgICAgc3Bpbl91bmxvY2soJmhlYXBfbG9j
ayk7Cj4gCj4gICBvdXQ6Cj4gICAgICBzcGluX3VubG9jaygmZC0+cGFnZV9hbGxvY19sb2NrKTsK
PiAtLQo+IDIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=

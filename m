Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A400C14D87D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 10:59:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix6Zf-00084a-VB; Thu, 30 Jan 2020 09:57:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EN2q=3T=amazon.co.uk=prvs=29183970d=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ix6Ze-00084V-NX
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 09:57:22 +0000
X-Inumbo-ID: e885c705-4346-11ea-8a25-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e885c705-4346-11ea-8a25-12813bfff9fa;
 Thu, 30 Jan 2020 09:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580378242; x=1611914242;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XpPiblPyeQmRqmItVcBW8G1RDBcAloZh8HoOv31QP3A=;
 b=NYf/1VRSz6ewLezwLp3RkpIODrYwBQSaMZtI0R6mC3rUHpdbnIaXjhSo
 op62hkympeOZaXcalnzPdpQCwhNpT/BHeFXUxvzYdGBeBS7KZsris6Ye/
 FLIegfCUhhsww40iIR1RhlTmmgp16gaNkP6UQoE357i5GDU995yBsGgQK 4=;
IronPort-SDR: sgzZILgpw7WEwch4Emzo1MbHJxEMjfgGd/Pn9cWtGUUX86zFCfEo6/cdc3JJiRYNz2WfGqdy5g
 NV1AflcyEh7g==
X-IronPort-AV: E=Sophos;i="5.70,381,1574121600"; d="scan'208";a="13994546"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-62350142.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 30 Jan 2020 09:57:22 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-62350142.us-east-1.amazon.com (Postfix) with ESMTPS
 id 62521A1C1F; Thu, 30 Jan 2020 09:57:19 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 30 Jan 2020 09:57:18 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 30 Jan 2020 09:57:17 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 30 Jan 2020 09:57:17 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v5 07/12] x86/hyperv: setup hypercall page
Thread-Index: AQHV1uG+aFJI/FyxqkWRnQ2f3nxOkKgC9cXw
Date: Thu, 30 Jan 2020 09:57:17 +0000
Message-ID: <b4f88a8788a64ba2bbdc95a3812d9fa7@EX13D32EUC003.ant.amazon.com>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-8-liuwe@microsoft.com>
In-Reply-To: <20200129202034.15052-8-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v5 07/12] x86/hyperv: setup hypercall page
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgPHdlaS5saXUueGVu
QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIFdlaSBMaXUKPiBTZW50OiAyOSBKYW51YXJ5IDIwMjAg
MjA6MjAKPiBUbzogWGVuIERldmVsb3BtZW50IExpc3QgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZz4KPiBDYzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgTWlj
aGFlbCBLZWxsZXkKPiA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT47IFdlaSBMaXUgPGxpdXdlQG1p
Y3Jvc29mdC5jb20+OyBKYW4gQmV1bGljaAo+IDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1Cj4gPHdsQHhlbi5vcmc+
OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBTdWJqZWN0OiBbUEFU
Q0ggdjUgMDcvMTJdIHg4Ni9oeXBlcnY6IHNldHVwIGh5cGVyY2FsbCBwYWdlCj4gCj4gSHlwZXIt
ViB1c2VzIGEgdGVjaG5pcXVlIGNhbGxlZCBvdmVybGF5IHBhZ2UgZm9yIGl0cyBoeXBlcmNhbGwg
cGFnZS4gSXQKPiB3aWxsIGluc2VydCBhIGJhY2tpbmcgcGFnZSB0byB0aGUgZ3Vlc3Qgd2hlbiB0
aGUgaHlwZXJjYWxsIGZ1bmN0aW9uYWxpdHkKPiBpcyBlbmFibGVkLiBUaGF0IG1lYW5zIHdlIGNh
biB1c2UgYSBwYWdlIHRoYXQgaXMgbm90IGJhY2tlZCBieSByZWFsCj4gbWVtb3J5IGZvciBoeXBl
cmNhbGwgcGFnZS4KPiAKPiBVc2UgdGhlIHRvcC1tb3N0IGFkZHJlc3NhYmxlIHBhZ2UgZm9yIHRo
YXQgcHVycG9zZS4gQWRqdXN0IGU4MjAgY29kZQo+IGFjY29yZGluZ2x5Lgo+IAo+IFdlIGFsc28g
bmVlZCB0byByZWdpc3RlciBYZW4ncyBndWVzdCBPUyBJRCB0byBIeXBlci1WLiBVc2UgMHgzIGFz
IHRoZQo+IHZlbmRvciBJRC4gRml4IHRoZSBjb21tZW50IGluIGh5cGVydi10bGZzLmggd2hpbGUg
YXQgaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4K
PiAtLS0KPiB2NToKPiAxLiB1c2UgaHlwZXJ2aXNvcl9yZXNlcnZlX3RvcF9wYWdlcwo+IDIuIGFk
ZCBhIG1hY3JvIGZvciBoeXBlcmNhbGwgcGFnZSBtZm4KPiAzLiBhZGRyZXNzIG90aGVyIG1pc2Mg
Y29tbWVudHMKPiAKPiB2NDoKPiAxLiBVc2UgZml4bWFwCj4gMi4gRm9sbG93IHJvdXRpbmVzIGxp
c3RlZCBpbiBUTEZTCj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9lODIwLmMgICAgICAgICAgICAgICAg
ICAgICB8ICA1ICsrKwo+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jICAgICAg
fCA1NyArKysrKysrKysrKysrKysrKysrKysrKy0tCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vl
c3QvaHlwZXJ2LXRsZnMuaCB8ICA1ICsrLQo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5
cGVydi5oICAgICAgfCAgMyArKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9lODIwLmMgYi94
ZW4vYXJjaC94ODYvZTgyMC5jCj4gaW5kZXggMzg5MmM5Y2ZiNy4uOTk2NDNmM2VhMCAxMDA2NDQK
PiAtLS0gYS94ZW4vYXJjaC94ODYvZTgyMC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2U4MjAuYwo+
IEBAIC0zNDMsNiArMzQzLDcgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgX19pbml0IGZpbmRfbWF4
X3Bmbih2b2lkKQo+ICB7Cj4gICAgICB1bnNpZ25lZCBpbnQgaTsKPiAgICAgIHVuc2lnbmVkIGxv
bmcgbWF4X3BmbiA9IDA7Cj4gKyAgICB1bnNpZ25lZCBsb25nIHRvcF9wZm4gPSAoKDF1bGwgPDwg
cGFkZHJfYml0cykgLSAxKSA+PiBQQUdFX1NISUZUOwo+IAo+ICAgICAgZm9yIChpID0gMDsgaSA8
IGU4MjAubnJfbWFwOyBpKyspIHsKPiAgICAgICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0LCBlbmQ7
Cj4gQEAgLTM1Nyw2ICszNTgsMTAgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgX19pbml0IGZpbmRf
bWF4X3Bmbih2b2lkKQo+ICAgICAgICAgICAgICBtYXhfcGZuID0gZW5kOwo+ICAgICAgfQo+IAo+
ICsgICAgdG9wX3BmbiAtPSBoeXBlcnZpc29yX3Jlc2VydmVfdG9wX3BhZ2VzKCk7Cj4gKyAgICBp
ZiAoIG1heF9wZm4gPj0gdG9wX3BmbiApCj4gKyAgICAgICAgbWF4X3BmbiA9IHRvcF9wZm47Cj4g
Kwo+ICAgICAgcmV0dXJuIG1heF9wZm47Cj4gIH0KPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+IGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9o
eXBlcnYuYwo+IGluZGV4IDhkMzgzMTNkN2EuLjJiZWRjYzQzOGMgMTAwNjQ0Cj4gLS0tIGEveGVu
L2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVz
dC9oeXBlcnYvaHlwZXJ2LmMKPiBAQCAtMTksMTUgKzE5LDI2IEBACj4gICAqIENvcHlyaWdodCAo
YykgMjAxOSBNaWNyb3NvZnQuCj4gICAqLwo+ICAjaW5jbHVkZSA8eGVuL2luaXQuaD4KPiArI2lu
Y2x1ZGUgPHhlbi92ZXJzaW9uLmg+Cj4gCj4gKyNpbmNsdWRlIDxhc20vZml4bWFwLmg+Cj4gICNp
bmNsdWRlIDxhc20vZ3Vlc3QuaD4KPiAgI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnYtdGxmcy5o
Pgo+ICsjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgo+IAo+ICBzdHJ1Y3QgbXNfaHlwZXJ2X2lu
Zm8gX19yZWFkX21vc3RseSBtc19oeXBlcnY7Cj4gCj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgaHlw
ZXJ2aXNvcl9vcHMgb3BzID0gewo+IC0gICAgLm5hbWUgPSAiSHlwZXItViIsCj4gLX07Cj4gK3N0
YXRpYyB1aW50NjRfdCBnZW5lcmF0ZV9ndWVzdF9pZCh2b2lkKQo+ICt7Cj4gKyAgICB1aW50NjRf
dCBpZDsKPiArCj4gKyAgICBpZCA9ICh1aW50NjRfdClIVl9YRU5fVkVORE9SX0lEIDw8IDQ4Owo+
ICsgICAgaWQgfD0gKHhlbl9tYWpvcl92ZXJzaW9uKCkgPDwgMTYpIHwgeGVuX21pbm9yX3ZlcnNp
b24oKTsKPiArCj4gKyAgICByZXR1cm4gaWQ7CgpJIHRoaW5rIHRoaXMgc2hvdWxkIHVzZSB0aGUg
aHZfZ3Vlc3Rfb3NfaWQgdW5pb24uIFlvdSBjYW4gdGhlbiBzZXQgdGhlIHZhbHVlcyB1c2luZyB0
aGUgYml0LWZpZWxkcyBhbmQgcmV0dXJuIHRoZSByYXcuCgogIFBhdWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

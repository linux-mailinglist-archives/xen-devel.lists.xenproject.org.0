Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4B2161DB5
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 00:09:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3pSy-00086x-PY; Mon, 17 Feb 2020 23:06:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fQRb=4F=amazon.com=prvs=30975aa36=anchalag@srs-us1.protection.inumbo.net>)
 id 1j3pSw-00086s-Tp
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 23:06:14 +0000
X-Inumbo-ID: 1899405a-51da-11ea-ade5-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1899405a-51da-11ea-ade5-bc764e2007e4;
 Mon, 17 Feb 2020 23:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581980774; x=1613516774;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=i2HFd1yZvomBJYmaIlswXjk/acyKcvnHu1DS56/tQa4=;
 b=LstSTXK/TUVWyFn6qqUgTkQHCQ9kKn9tH5tUTiHtuqrghXm9uvk6lbiZ
 Aq+WYXol4Rdz1Vf8y9ngRw6u19dbI/yGCBIxL3ZutbEKX0st7zxRvggoO
 3MlhP5WqTxB4Ny91EHyVG8OwWr/U5tbdpDwhjzSOfD5m0VlvHtZswkNqG Q=;
IronPort-SDR: j7qMV2pLyqN3pGNWHxsVIYOQNWVF0Jsyb78CKdoIhZPT4IjRF1w0i5bCUpZX27JvuVwg9jBmIa
 eUNUi3dXBEsQ==
X-IronPort-AV: E=Sophos;i="5.70,454,1574121600"; d="scan'208";a="17406450"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 17 Feb 2020 23:06:01 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com (Postfix) with ESMTPS
 id 517B3A23D3; Mon, 17 Feb 2020 23:05:59 +0000 (UTC)
Received: from EX13D01UWB001.ant.amazon.com (10.43.161.75) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 17 Feb 2020 23:05:53 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13d01UWB001.ant.amazon.com (10.43.161.75) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 17 Feb 2020 23:05:53 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Mon, 17 Feb 2020 23:05:53 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 8382E401B0; Mon, 17 Feb 2020 23:05:53 +0000 (UTC)
Date: Mon, 17 Feb 2020 23:05:53 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>,
 <x86@kernel.org>, <boris.ostrovsky@oracle.com>, <jgross@suse.com>,
 <linux-pm@vger.kernel.org>, <linux-mm@kvack.org>, <kamatam@amazon.com>,
 <sstabellini@kernel.org>, <konrad.wilk@oracle.com>, <axboe@kernel.dk>,
 <davem@davemloft.net>, <rjw@rjwysocki.net>, <len.brown@intel.com>,
 <pavel@ucw.cz>, <peterz@infradead.org>, <eduval@amazon.com>,
 <sblbir@amazon.com>, <anchalag@amazon.com>, <xen-devel@lists.xenproject.org>, 
 <vkuznets@redhat.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dwmw@amazon.co.uk>, <fllinden@amaozn.com>,
 <benh@kernel.crashing.org>
Message-ID: <20200217230553.GA8100@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <cover.1581721799.git.anchalag@amazon.com>
 <890c404c585d7790514527f0c021056a7be6e748.1581721799.git.anchalag@amazon.com>
 <20200217100509.GE4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217100509.GE4679@Air-de-Roger>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: Re: [Xen-devel] [RFC PATCH v3 06/12] xen-blkfront: add callbacks
 for PM suspend and hibernation
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: eduval@amazon.com, len.brown@intel.com, peterz@infradead.org,
 benh@kernel.crashing.org, x86@kernel.org, linux-mm@kvack.org, pavel@ucw.cz,
 hpa@zytor.com, tglx@linutronix.de, sstabellini@kernel.org, fllinden@amaozn.com,
 kamatam@amazon.com, mingo@redhat.com, xen-devel@lists.xenproject.org,
 sblbir@amazon.com, axboe@kernel.dk, konrad.wilk@oracle.com, bp@alien8.de,
 boris.ostrovsky@oracle.com, jgross@suse.com, netdev@vger.kernel.org,
 linux-pm@vger.kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 vkuznets@redhat.com, davem@davemloft.net, dwmw@amazon.co.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMTE6MDU6MDlBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBGcmksIEZlYiAxNCwgMjAyMCBhdCAxMToyNTozNFBNICswMDAwLCBBbmNo
YWwgQWdhcndhbCB3cm90ZToKPiA+IEZyb206IE11bmVoaXNhIEthbWF0YSA8a2FtYXRhbUBhbWF6
b24uY29tCj4gPiAKPiA+IEFkZCBmcmVlemUsIHRoYXcgYW5kIHJlc3RvcmUgY2FsbGJhY2tzIGZv
ciBQTSBzdXNwZW5kIGFuZCBoaWJlcm5hdGlvbgo+ID4gc3VwcG9ydC4gQWxsIGZyb250ZW5kIGRy
aXZlcnMgdGhhdCBuZWVkcyB0byB1c2UgUE1fSElCRVJOQVRJT04vUE1fU1VTUEVORAo+ID4gZXZl
bnRzLCBuZWVkIHRvIGltcGxlbWVudCB0aGVzZSB4ZW5idXNfZHJpdmVyIGNhbGxiYWNrcy4KPiA+
IFRoZSBmcmVlemUgaGFuZGxlciBzdG9wcyBhIGJsb2NrLWxheWVyIHF1ZXVlIGFuZCBkaXNjb25u
ZWN0IHRoZQo+ID4gZnJvbnRlbmQgZnJvbSB0aGUgYmFja2VuZCB3aGlsZSBmcmVlaW5nIHJpbmdf
aW5mbyBhbmQgYXNzb2NpYXRlZCByZXNvdXJjZXMuCj4gPiBUaGUgcmVzdG9yZSBoYW5kbGVyIHJl
LWFsbG9jYXRlcyByaW5nX2luZm8gYW5kIHJlLWNvbm5lY3QgdG8gdGhlCj4gPiBiYWNrZW5kLCBz
byB0aGUgcmVzdCBvZiB0aGUga2VybmVsIGNhbiBjb250aW51ZSB0byB1c2UgdGhlIGJsb2NrIGRl
dmljZQo+ID4gdHJhbnNwYXJlbnRseS4gQWxzbywgdGhlIGhhbmRsZXJzIGFyZSB1c2VkIGZvciBi
b3RoIFBNIHN1c3BlbmQgYW5kCj4gPiBoaWJlcm5hdGlvbiBzbyB0aGF0IHdlIGNhbiBrZWVwIHRo
ZSBleGlzdGluZyBzdXNwZW5kL3Jlc3VtZSBjYWxsYmFja3MgZm9yCj4gPiBYZW4gc3VzcGVuZCB3
aXRob3V0IG1vZGlmaWNhdGlvbi4gQmVmb3JlIGRpc2Nvbm5lY3RpbmcgZnJvbSBiYWNrZW5kLAo+
ID4gd2UgbmVlZCB0byBwcmV2ZW50IGFueSBuZXcgSU8gZnJvbSBiZWluZyBxdWV1ZWQgYW5kIHdh
aXQgZm9yIGV4aXN0aW5nCj4gPiBJTyB0byBjb21wbGV0ZS4KPiAKPiBUaGlzIGlzIGRpZmZlcmVu
dCBmcm9tIFhlbiAoeGVuc3RvcmUpIGluaXRpYXRlZCBzdXNwZW5zaW9uLCBhcyBpbiB0aGF0Cj4g
Y2FzZSBMaW51eCBkb2Vzbid0IGZsdXNoIHRoZSByaW5ncyBvciBkaXNjb25uZWN0cyBmcm9tIHRo
ZSBiYWNrZW5kLgpZZXMsIEFGQUlLIGluIHhlbiBpbml0aWF0ZWQgc3VzcGVuc2lvbiBiYWNrZW5k
IHRha2VzIGNhcmUgb2YgaXQuIAo+IAo+IFRoaXMgaXMgZG9uZSBzbyB0aGF0IGluIGNhc2Ugc3Vz
cGVuc2lvbnMgZmFpbHMgdGhlIHJlY292ZXJ5IGRvZXNuJ3QKPiBuZWVkIHRvIHJlY29ubmVjdCB0
aGUgUFYgZGV2aWNlcywgYW5kIGluIG9yZGVyIHRvIHNwZWVkIHVwIHN1c3BlbnNpb24KPiB0aW1l
IChpZTogd2FpdGluZyBmb3IgYWxsIHF1ZXVlcyB0byBiZSBmbHVzaGVkIGNhbiB0YWtlIHRpbWUg
YXMgTGludXgKPiBzdXBwb3J0cyBtdWx0aXF1ZXVlLCBtdWx0aXBhZ2UgcmluZ3MgYW5kIGluZGly
ZWN0IGRlc2NyaXB0b3JzKSwgYW5kCj4gdGhlIGJhY2tlbmQgY291bGQgYmUgY29udGVuZGVkIGlm
IHRoZXJlJ3MgYSBsb3Qgb2YgSU8gcHJlc3N1cmUgZnJvbQo+IGd1ZXN0cy4KPiAKPiBMaW51eCBh
bHJlYWR5IGtlZXBzIGEgc2hhZG93IG9mIHRoZSByaW5nIGNvbnRlbnRzLCBzbyBpbi1mbGlnaHQK
PiByZXF1ZXN0cyBjYW4gYmUgcmUtaXNzdWVkIGFmdGVyIHRoZSBmcm9udGVuZCBoYXMgcmVjb25u
ZWN0ZWQgZHVyaW5nCj4gcmVzdW1lLgo+IAo+ID4gRnJlZXplL3VuZnJlZXplIG9mIHRoZSBxdWV1
ZXMgd2lsbCBndWFyYW50ZWUgdGhhdCB0aGVyZQo+ID4gYXJlIG5vIHJlcXVlc3RzIGluIHVzZSBv
biB0aGUgc2hhcmVkIHJpbmcuCj4gPiAKPiA+IE5vdGU6Rm9yIG9sZGVyIGJhY2tlbmRzLGlmIGEg
YmFja2VuZCBkb2Vzbid0IGhhdmUgY29tbWl0JzEyZWE3Mjk2NDVhY2UnCj4gPiB4ZW4vYmxrYmFj
azogdW5tYXAgYWxsIHBlcnNpc3RlbnQgZ3JhbnRzIHdoZW4gZnJvbnRlbmQgZ2V0cyBkaXNjb25u
ZWN0ZWQsCj4gPiB0aGUgZnJvbnRlbmQgbWF5IHNlZSBtYXNzaXZlIGFtb3VudCBvZiBncmFudCB0
YWJsZSB3YXJuaW5nIHdoZW4gZnJlZWluZwo+ID4gcmVzb3VyY2VzLgo+ID4gWyAgIDM2Ljg1MjY1
OV0gZGVmZXJyaW5nIGcuZS4gMHhmOSAocGZuIDB4ZmZmZmZmZmZmZmZmZmZmZikKPiA+IFsgICAz
Ni44NTUwODldIHhlbjpncmFudF90YWJsZTogV0FSTklORzplLmcuIDB4MTEyIHN0aWxsIGluIHVz
ZSEKPiA+IAo+ID4gSW4gdGhpcyBjYXNlLCBwZXJzaXN0ZW50IGdyYW50cyB3b3VsZCBuZWVkIHRv
IGJlIGRpc2FibGVkLgo+ID4gCj4gPiBbQW5jaGFsIENoYW5nZWxvZzogUmVtb3ZlZCB0aW1lb3V0
L3JlcXVlc3QgZHVyaW5nIGJsa2Zyb250IGZyZWV6ZS4KPiA+IEZpeGVkIG1ham9yIHBhcnQgb2Yg
dGhlIGNvZGUgdG8gd29yayB3aXRoIGJsay1tcV0KPiA+IFNpZ25lZC1vZmYtYnk6IEFuY2hhbCBB
Z2Fyd2FsIDxhbmNoYWxhZ0BhbWF6b24uY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogTXVuZWhpc2Eg
S2FtYXRhIDxrYW1hdGFtQGFtYXpvbi5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2Jsb2NrL3hl
bi1ibGtmcm9udC5jIHwgMTE5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDExMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4g
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYyBiL2RyaXZlcnMv
YmxvY2sveGVuLWJsa2Zyb250LmMKPiA+IGluZGV4IDQ3ODEyMDIzMzc1MC4uZDcxNWVkM2NiNjlh
IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYwo+ID4gKysrIGIv
ZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYwo+ID4gQEAgLTQ3LDYgKzQ3LDggQEAKPiA+ICAj
aW5jbHVkZSA8bGludXgvYml0bWFwLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2xpc3QuaD4KPiA+
ICAjaW5jbHVkZSA8bGludXgvd29ya3F1ZXVlLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2NvbXBs
ZXRpb24uaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KPiA+ICAKPiA+ICAjaW5jbHVk
ZSA8eGVuL3hlbi5oPgo+ID4gICNpbmNsdWRlIDx4ZW4veGVuYnVzLmg+Cj4gPiBAQCAtNzksNiAr
ODEsOCBAQCBlbnVtIGJsa2lmX3N0YXRlIHsKPiA+ICAJQkxLSUZfU1RBVEVfRElTQ09OTkVDVEVE
LAo+ID4gIAlCTEtJRl9TVEFURV9DT05ORUNURUQsCj4gPiAgCUJMS0lGX1NUQVRFX1NVU1BFTkRF
RCwKPiA+ICsJQkxLSUZfU1RBVEVfRlJFRVpJTkcsCj4gPiArCUJMS0lGX1NUQVRFX0ZST1pFTgo+
ID4gIH07Cj4gPiAgCj4gPiAgc3RydWN0IGdyYW50IHsKPiA+IEBAIC0yMjAsNiArMjI0LDcgQEAg
c3RydWN0IGJsa2Zyb250X2luZm8KPiA+ICAJc3RydWN0IGxpc3RfaGVhZCByZXF1ZXN0czsKPiA+
ICAJc3RydWN0IGJpb19saXN0IGJpb19saXN0Owo+ID4gIAlzdHJ1Y3QgbGlzdF9oZWFkIGluZm9f
bGlzdDsKPiA+ICsJc3RydWN0IGNvbXBsZXRpb24gd2FpdF9iYWNrZW5kX2Rpc2Nvbm5lY3RlZDsK
PiA+ICB9Owo+ID4gIAo+ID4gIHN0YXRpYyB1bnNpZ25lZCBpbnQgbnJfbWlub3JzOwo+ID4gQEAg
LTI2MSw2ICsyNjYsNyBAQCBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKG1pbm9yX2xvY2spOwo+ID4g
IHN0YXRpYyBpbnQgYmxrZnJvbnRfc2V0dXBfaW5kaXJlY3Qoc3RydWN0IGJsa2Zyb250X3Jpbmdf
aW5mbyAqcmluZm8pOwo+ID4gIHN0YXRpYyB2b2lkIGJsa2Zyb250X2dhdGhlcl9iYWNrZW5kX2Zl
YXR1cmVzKHN0cnVjdCBibGtmcm9udF9pbmZvICppbmZvKTsKPiA+ICBzdGF0aWMgaW50IG5lZ290
aWF0ZV9tcShzdHJ1Y3QgYmxrZnJvbnRfaW5mbyAqaW5mbyk7Cj4gPiArc3RhdGljIHZvaWQgX19i
bGtpZl9mcmVlKHN0cnVjdCBibGtmcm9udF9pbmZvICppbmZvKTsKPiA+ICAKPiA+ICBzdGF0aWMg
aW50IGdldF9pZF9mcm9tX2ZyZWVsaXN0KHN0cnVjdCBibGtmcm9udF9yaW5nX2luZm8gKnJpbmZv
KQo+ID4gIHsKPiA+IEBAIC05OTUsNiArMTAwMSw3IEBAIHN0YXRpYyBpbnQgeGx2YmRfaW5pdF9i
bGtfcXVldWUoc3RydWN0IGdlbmRpc2sgKmdkLCB1MTYgc2VjdG9yX3NpemUsCj4gPiAgCWluZm8t
PnNlY3Rvcl9zaXplID0gc2VjdG9yX3NpemU7Cj4gPiAgCWluZm8tPnBoeXNpY2FsX3NlY3Rvcl9z
aXplID0gcGh5c2ljYWxfc2VjdG9yX3NpemU7Cj4gPiAgCWJsa2lmX3NldF9xdWV1ZV9saW1pdHMo
aW5mbyk7Cj4gPiArCWluaXRfY29tcGxldGlvbigmaW5mby0+d2FpdF9iYWNrZW5kX2Rpc2Nvbm5l
Y3RlZCk7Cj4gPiAgCj4gPiAgCXJldHVybiAwOwo+ID4gIH0KPiA+IEBAIC0xMjE4LDYgKzEyMjUs
OCBAQCBzdGF0aWMgdm9pZCB4bHZiZF9yZWxlYXNlX2dlbmRpc2soc3RydWN0IGJsa2Zyb250X2lu
Zm8gKmluZm8pCj4gPiAgLyogQWxyZWFkeSBob2xkIHJpbmZvLT5yaW5nX2xvY2suICovCj4gPiAg
c3RhdGljIGlubGluZSB2b2lkIGtpY2tfcGVuZGluZ19yZXF1ZXN0X3F1ZXVlc19sb2NrZWQoc3Ry
dWN0IGJsa2Zyb250X3JpbmdfaW5mbyAqcmluZm8pCj4gPiAgewo+ID4gKwlpZiAodW5saWtlbHko
cmluZm8tPmRldl9pbmZvLT5jb25uZWN0ZWQgPT0gQkxLSUZfU1RBVEVfRlJFRVpJTkcpKQo+ID4g
KwkJcmV0dXJuOwo+ID4gIAlpZiAoIVJJTkdfRlVMTCgmcmluZm8tPnJpbmcpKQo+ID4gIAkJYmxr
X21xX3N0YXJ0X3N0b3BwZWRfaHdfcXVldWVzKHJpbmZvLT5kZXZfaW5mby0+cnEsIHRydWUpOwo+
ID4gIH0KPiA+IEBAIC0xMzQxLDggKzEzNTAsNiBAQCBzdGF0aWMgdm9pZCBibGtpZl9mcmVlX3Jp
bmcoc3RydWN0IGJsa2Zyb250X3JpbmdfaW5mbyAqcmluZm8pCj4gPiAgCj4gPiAgc3RhdGljIHZv
aWQgYmxraWZfZnJlZShzdHJ1Y3QgYmxrZnJvbnRfaW5mbyAqaW5mbywgaW50IHN1c3BlbmQpCj4g
PiAgewo+ID4gLQl1bnNpZ25lZCBpbnQgaTsKPiA+IC0KPiA+ICAJLyogUHJldmVudCBuZXcgcmVx
dWVzdHMgYmVpbmcgaXNzdWVkIHVudGlsIHdlIGZpeCB0aGluZ3MgdXAuICovCj4gPiAgCWluZm8t
PmNvbm5lY3RlZCA9IHN1c3BlbmQgPwo+ID4gIAkJQkxLSUZfU1RBVEVfU1VTUEVOREVEIDogQkxL
SUZfU1RBVEVfRElTQ09OTkVDVEVEOwo+ID4gQEAgLTEzNTAsNiArMTM1NywxMyBAQCBzdGF0aWMg
dm9pZCBibGtpZl9mcmVlKHN0cnVjdCBibGtmcm9udF9pbmZvICppbmZvLCBpbnQgc3VzcGVuZCkK
PiA+ICAJaWYgKGluZm8tPnJxKQo+ID4gIAkJYmxrX21xX3N0b3BfaHdfcXVldWVzKGluZm8tPnJx
KTsKPiA+ICAKPiA+ICsJX19ibGtpZl9mcmVlKGluZm8pOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0
aWMgdm9pZCBfX2Jsa2lmX2ZyZWUoc3RydWN0IGJsa2Zyb250X2luZm8gKmluZm8pCj4gPiArewo+
ID4gKwl1bnNpZ25lZCBpbnQgaTsKPiA+ICsKPiA+ICAJZm9yIChpID0gMDsgaSA8IGluZm8tPm5y
X3JpbmdzOyBpKyspCj4gPiAgCQlibGtpZl9mcmVlX3JpbmcoJmluZm8tPnJpbmZvW2ldKTsKPiA+
ICAKPiA+IEBAIC0xNTUzLDggKzE1NjcsMTAgQEAgc3RhdGljIGlycXJldHVybl90IGJsa2lmX2lu
dGVycnVwdChpbnQgaXJxLCB2b2lkICpkZXZfaWQpCj4gPiAgCXN0cnVjdCBibGtmcm9udF9yaW5n
X2luZm8gKnJpbmZvID0gKHN0cnVjdCBibGtmcm9udF9yaW5nX2luZm8gKilkZXZfaWQ7Cj4gPiAg
CXN0cnVjdCBibGtmcm9udF9pbmZvICppbmZvID0gcmluZm8tPmRldl9pbmZvOwo+ID4gIAo+ID4g
LQlpZiAodW5saWtlbHkoaW5mby0+Y29ubmVjdGVkICE9IEJMS0lGX1NUQVRFX0NPTk5FQ1RFRCkp
Cj4gPiAtCQlyZXR1cm4gSVJRX0hBTkRMRUQ7Cj4gPiArCWlmICh1bmxpa2VseShpbmZvLT5jb25u
ZWN0ZWQgIT0gQkxLSUZfU1RBVEVfQ09OTkVDVEVEKSkgewo+ID4gKwkJaWYgKGluZm8tPmNvbm5l
Y3RlZCAhPSBCTEtJRl9TVEFURV9GUkVFWklORykKPiA+ICsJCQlyZXR1cm4gSVJRX0hBTkRMRUQ7
Cj4gPiArCX0KPiA+ICAKPiA+ICAJc3Bpbl9sb2NrX2lycXNhdmUoJnJpbmZvLT5yaW5nX2xvY2ss
IGZsYWdzKTsKPiA+ICAgYWdhaW46Cj4gPiBAQCAtMjAyMCw2ICsyMDM2LDcgQEAgc3RhdGljIGlu
dCBibGtpZl9yZWNvdmVyKHN0cnVjdCBibGtmcm9udF9pbmZvICppbmZvKQo+ID4gIAlzdHJ1Y3Qg
YmlvICpiaW87Cj4gPiAgCXVuc2lnbmVkIGludCBzZWdzOwo+ID4gIAo+ID4gKwlib29sIGZyb3pl
biA9IGluZm8tPmNvbm5lY3RlZCA9PSBCTEtJRl9TVEFURV9GUk9aRU47Cj4gPiAgCWJsa2Zyb250
X2dhdGhlcl9iYWNrZW5kX2ZlYXR1cmVzKGluZm8pOwo+ID4gIAkvKiBSZXNldCBsaW1pdHMgY2hh
bmdlZCBieSBibGtfbXFfdXBkYXRlX25yX2h3X3F1ZXVlcygpLiAqLwo+ID4gIAlibGtpZl9zZXRf
cXVldWVfbGltaXRzKGluZm8pOwo+ID4gQEAgLTIwNDYsNiArMjA2Myw5IEBAIHN0YXRpYyBpbnQg
YmxraWZfcmVjb3ZlcihzdHJ1Y3QgYmxrZnJvbnRfaW5mbyAqaW5mbykKPiA+ICAJCWtpY2tfcGVu
ZGluZ19yZXF1ZXN0X3F1ZXVlcyhyaW5mbyk7Cj4gPiAgCX0KPiA+ICAKPiA+ICsJaWYgKGZyb3pl
bikKPiA+ICsJCXJldHVybiAwOwo+ID4gKwo+ID4gIAlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUo
cmVxLCBuLCAmaW5mby0+cmVxdWVzdHMsIHF1ZXVlbGlzdCkgewo+ID4gIAkJLyogUmVxdWV1ZSBw
ZW5kaW5nIHJlcXVlc3RzIChmbHVzaCBvciBkaXNjYXJkKSAqLwo+ID4gIAkJbGlzdF9kZWxfaW5p
dCgmcmVxLT5xdWV1ZWxpc3QpOwo+ID4gQEAgLTIzNTksNiArMjM3OSw3IEBAIHN0YXRpYyB2b2lk
IGJsa2Zyb250X2Nvbm5lY3Qoc3RydWN0IGJsa2Zyb250X2luZm8gKmluZm8pCj4gPiAgCj4gPiAg
CQlyZXR1cm47Cj4gPiAgCWNhc2UgQkxLSUZfU1RBVEVfU1VTUEVOREVEOgo+ID4gKwljYXNlIEJM
S0lGX1NUQVRFX0ZST1pFTjoKPiA+ICAJCS8qCj4gPiAgCQkgKiBJZiB3ZSBhcmUgcmVjb3Zlcmlu
ZyBmcm9tIHN1c3BlbnNpb24sIHdlIG5lZWQgdG8gd2FpdAo+ID4gIAkJICogZm9yIHRoZSBiYWNr
ZW5kIHRvIGFubm91bmNlIGl0J3MgZmVhdHVyZXMgYmVmb3JlCj4gPiBAQCAtMjQ3NiwxMiArMjQ5
NywzNyBAQCBzdGF0aWMgdm9pZCBibGtiYWNrX2NoYW5nZWQoc3RydWN0IHhlbmJ1c19kZXZpY2Ug
KmRldiwKPiA+ICAJCWJyZWFrOwo+ID4gIAo+ID4gIAljYXNlIFhlbmJ1c1N0YXRlQ2xvc2VkOgo+
ID4gLQkJaWYgKGRldi0+c3RhdGUgPT0gWGVuYnVzU3RhdGVDbG9zZWQpCj4gPiArCQlpZiAoZGV2
LT5zdGF0ZSA9PSBYZW5idXNTdGF0ZUNsb3NlZCkgewo+ID4gKwkJCWlmIChpbmZvLT5jb25uZWN0
ZWQgPT0gQkxLSUZfU1RBVEVfRlJFRVpJTkcpIHsKPiA+ICsJCQkJX19ibGtpZl9mcmVlKGluZm8p
Owo+ID4gKwkJCQlpbmZvLT5jb25uZWN0ZWQgPSBCTEtJRl9TVEFURV9GUk9aRU47Cj4gPiArCQkJ
CWNvbXBsZXRlKCZpbmZvLT53YWl0X2JhY2tlbmRfZGlzY29ubmVjdGVkKTsKPiA+ICsJCQkJYnJl
YWs7Cj4gPiArCQkJfQo+ID4gKwo+ID4gIAkJCWJyZWFrOwo+ID4gKwkJfQo+ID4gKwo+ID4gKwkJ
LyoKPiA+ICsJCSAqIFdlIG1heSBzb21laG93IHJlY2VpdmUgYmFja2VuZCdzIENsb3NlZCBhZ2Fp
biB3aGlsZSB0aGF3aW5nCj4gPiArCQkgKiBvciByZXN0b3JpbmcgYW5kIGl0IGNhdXNlcyB0aGF3
aW5nIG9yIHJlc3RvcmluZyB0byBmYWlsLgo+ID4gKwkJICogSWdub3JlIHN1Y2ggdW5leHBlY3Rl
ZCBzdGF0ZSBhbnl3YXkuCj4gPiArCQkgKi8KPiA+ICsJCWlmIChpbmZvLT5jb25uZWN0ZWQgPT0g
QkxLSUZfU1RBVEVfRlJPWkVOICYmCj4gPiArCQkJCWRldi0+c3RhdGUgPT0gWGVuYnVzU3RhdGVJ
bml0aWFsaXNlZCkgewo+ID4gKwkJCWRldl9kYmcoJmRldi0+ZGV2LAo+ID4gKwkJCQkJImlnbm9y
ZSB0aGUgYmFja2VuZCdzIENsb3NlZCBzdGF0ZTogJXMiLAo+ID4gKwkJCQkJZGV2LT5ub2RlbmFt
ZSk7Cj4gPiArCQkJYnJlYWs7Cj4gPiArCQl9Cj4gPiAgCQkvKiBmYWxsIHRocm91Z2ggKi8KPiA+
ICAJY2FzZSBYZW5idXNTdGF0ZUNsb3Npbmc6Cj4gPiAtCQlpZiAoaW5mbykKPiA+IC0JCQlibGtm
cm9udF9jbG9zaW5nKGluZm8pOwo+ID4gKwkJaWYgKGluZm8pIHsKPiA+ICsJCQlpZiAoaW5mby0+
Y29ubmVjdGVkID09IEJMS0lGX1NUQVRFX0ZSRUVaSU5HKQo+ID4gKwkJCQl4ZW5idXNfZnJvbnRl
bmRfY2xvc2VkKGRldik7Cj4gPiArCQkJZWxzZQo+ID4gKwkJCQlibGtmcm9udF9jbG9zaW5nKGlu
Zm8pOwo+ID4gKwkJfQo+ID4gIAkJYnJlYWs7Cj4gPiAgCX0KPiA+ICB9Cj4gPiBAQCAtMjYyNSw2
ICsyNjcxLDYyIEBAIHN0YXRpYyB2b2lkIGJsa2lmX3JlbGVhc2Uoc3RydWN0IGdlbmRpc2sgKmRp
c2ssIGZtb2RlX3QgbW9kZSkKPiA+ICAJbXV0ZXhfdW5sb2NrKCZibGtmcm9udF9tdXRleCk7Cj4g
PiAgfQo+ID4gIAo+ID4gK3N0YXRpYyBpbnQgYmxrZnJvbnRfZnJlZXplKHN0cnVjdCB4ZW5idXNf
ZGV2aWNlICpkZXYpCj4gPiArewo+ID4gKwl1bnNpZ25lZCBpbnQgaTsKPiA+ICsJc3RydWN0IGJs
a2Zyb250X2luZm8gKmluZm8gPSBkZXZfZ2V0X2RydmRhdGEoJmRldi0+ZGV2KTsKPiA+ICsJc3Ry
dWN0IGJsa2Zyb250X3JpbmdfaW5mbyAqcmluZm87Cj4gPiArCS8qIFRoaXMgd291bGQgYmUgcmVh
c29uYWJsZSB0aW1lb3V0IGFzIHVzZWQgaW4geGVuYnVzX2Rldl9zaHV0ZG93bigpICovCj4gPiAr
CXVuc2lnbmVkIGludCB0aW1lb3V0ID0gNSAqIEhaOwo+ID4gKwlpbnQgZXJyID0gMDsKPiA+ICsK
PiA+ICsJaW5mby0+Y29ubmVjdGVkID0gQkxLSUZfU1RBVEVfRlJFRVpJTkc7Cj4gPiArCj4gPiAr
CWJsa19tcV9mcmVlemVfcXVldWUoaW5mby0+cnEpOwo+ID4gKwlibGtfbXFfcXVpZXNjZV9xdWV1
ZShpbmZvLT5ycSk7Cj4gPiArCj4gPiArCWZvciAoaSA9IDA7IGkgPCBpbmZvLT5ucl9yaW5nczsg
aSsrKSB7Cj4gPiArCQlyaW5mbyA9ICZpbmZvLT5yaW5mb1tpXTsKPiA+ICsKPiA+ICsJCWdudHRh
Yl9jYW5jZWxfZnJlZV9jYWxsYmFjaygmcmluZm8tPmNhbGxiYWNrKTsKPiA+ICsJCWZsdXNoX3dv
cmsoJnJpbmZvLT53b3JrKTsKPiA+ICsJfQo+ID4gKwo+ID4gKwkvKiBLaWNrIHRoZSBiYWNrZW5k
IHRvIGRpc2Nvbm5lY3QgKi8KPiA+ICsJeGVuYnVzX3N3aXRjaF9zdGF0ZShkZXYsIFhlbmJ1c1N0
YXRlQ2xvc2luZyk7Cj4gCj4gQXJlIHlvdSBzdXJlIHRoaXMgaXMgc2FmZT8KPiAKSW4gbXkgdGVz
dGluZyBydW5uaW5nIG11bHRpcGxlIGZpbyBqb2JzLCBvdGhlciB0ZXN0IHNjZW5hcmlvcyBydW5u
aW5nCmEgbWVtb3J5IGxvYWRlciB3b3JrcyBmaW5lLiBJIGRpZCBub3QgY2FtZSBhY3Jvc3MgYSBz
Y2VuYXJpbyB0aGF0IHdvdWxkCmhhdmUgZmFpbGVkIHJlc3VtZSBkdWUgdG8gYmxrZnJvbnQgaXNz
dWVzIHVubGVzcyB5b3UgY2FuIHN1Z2VzdCBzb21lPwo+IEkgZG9uJ3QgdGhpbmsgeW91IHdhaXQg
Zm9yIGFsbCByZXF1ZXN0cyBwZW5kaW5nIG9uIHRoZSByaW5nIHRvIGJlCj4gZmluaXNoZWQgYnkg
dGhlIGJhY2tlbmQsIGFuZCBoZW5jZSB5b3UgbWlnaHQgbG9vc2UgcmVxdWVzdHMgYXMgdGhlCj4g
b25lcyBvbiB0aGUgcmluZyB3b3VsZCBub3QgYmUgcmUtaXNzdWVkIGJ5IGJsa2Zyb250X3Jlc3Rv
cmUgQUZBSUNULgo+IApBRkFJVSwgYmxrX21xX2ZyZWV6ZV9xdWV1ZS9ibGtfbXFfcXVpZXNjZV9x
dWV1ZSBzaG91bGQgdGFrZSBjYXJlIG9mIG5vIHVzZWQKcmVxdWVzdCBvbiB0aGUgc2hhcmVkIHJp
bmcuIEFsc28sIHdlIEkgd2FudCB0byBwYXVzZSB0aGUgcXVldWUgYW5kIGZsdXNoIGFsbAp0aGUg
cGVuZGluZyByZXF1ZXN0cyBpbiB0aGUgc2hhcmVkIHJpbmcgYmVmb3JlIGRpc2Nvbm5lY3Rpbmcg
ZnJvbSBiYWNrZW5kLgpRdWllc2NpbmcgdGhlIHF1ZXVlIHNlZW1lZCBhIGJldHRlciBvcHRpb24g
aGVyZSBhcyB3ZSB3YW50IHRvIG1ha2Ugc3VyZSBvbmdvaW5nCnJlcXVlc3RzIGRpc3BhdGNoZXMg
YXJlIHRvdGFsbHkgZHJhaW5lZC4KSSBzaG91bGQgYWNjZXB0IHRoYXQgc29tZSBvZiB0aGVzZSBu
b3Rpb24gaXMgYm9ycm93ZWQgZnJvbSBob3cgbnZtZSBmcmVlemUvdW5mcmVlemUgCmlzIGRvbmUg
YWx0aG91Z2ggaXRzIG5vdCBhcHBsZSB0byBhcHBsZSBjb21wYXJpc29uLgoKRG8geW91IGhhdmUg
YW55IHBhcnRpY3VsYXIgc2NlbmFyaW8gaW4gbWluZCB3aGljaCBtYXkgY2F1c2UgcmVzdW1lIHRv
IGZhaWw/Cj4gVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

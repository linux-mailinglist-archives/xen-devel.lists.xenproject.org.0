Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 954B816596E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 09:42:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4hMe-0005XV-3y; Thu, 20 Feb 2020 08:39:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rOW3=4I=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4hMc-0005XQ-71
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 08:39:18 +0000
X-Inumbo-ID: 7a6edf36-53bc-11ea-84e8-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a6edf36-53bc-11ea-84e8-12813bfff9fa;
 Thu, 20 Feb 2020 08:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582187957;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JwHl4quXWDG9itkjDYku543f/vfU0gx98KV7jgfEzIs=;
 b=QDUEJcgeWST5yRntYbahZONUA+VPL0R7KOiV4Nqfgh1sF52u7M/LuDhh
 jRChza0ZZF5x215zU6EZzyOeW4NIWg7E1Mwt3rSayQvBjBeF4syrSw5Uf
 I9+oiyt7TgEuQ7m405L9IkMdYpWwNuxkBndz+VMD1ptbuOBqtsQG2svFs E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MM0J4GlVDlB8jW19M11+P9HrOGhNxD8WXYL9vu3YBiAQ460tEWfz3gUg2Lw6ArGektClf8Nbag
 ZDMsNn+bIaHgvmiQrWsOTOXSdwNZIukFIJ+v8ThpcN5voCcqc9fpCjOv1dFXfaPkJlXRiaocNz
 Ey3nz+5z5gJ8Z3tkNDhfq+2pULZijq4YhGeqIYtykJ4RyOTbAeqOEVpuzrpMAKyUgCJObCNTDs
 ys4QXG50X3UKLzLY0I+Ya9hAkPZ3tBMhdhqXVkrciAd+JgmZ9nUhR/Mfl0wZ+8MU2oflNLNG06
 Zow=
X-SBRS: 2.7
X-MesageID: 12723432
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,463,1574139600"; d="scan'208";a="12723432"
Date: Thu, 20 Feb 2020 09:39:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anchal Agarwal <anchalag@amazon.com>
Message-ID: <20200220083904.GI4679@Air-de-Roger>
References: <cover.1581721799.git.anchalag@amazon.com>
 <890c404c585d7790514527f0c021056a7be6e748.1581721799.git.anchalag@amazon.com>
 <20200217100509.GE4679@Air-de-Roger>
 <20200217230553.GA8100@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200218091611.GN4679@Air-de-Roger>
 <20200219180424.GA17584@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219180424.GA17584@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [RFC PATCH v3 06/12] xen-blkfront: add callbacks
 for PM suspend and hibernation
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

VGhhbmtzIGZvciB0aGlzIHdvcmssIHBsZWFzZSBzZWUgYmVsb3cuCgpPbiBXZWQsIEZlYiAxOSwg
MjAyMCBhdCAwNjowNDoyNFBNICswMDAwLCBBbmNoYWwgQWdhcndhbCB3cm90ZToKPiBPbiBUdWUs
IEZlYiAxOCwgMjAyMCBhdCAxMDoxNjoxMUFNICswMTAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3Rl
Ogo+ID4gT24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMTE6MDU6NTNQTSArMDAwMCwgQW5jaGFsIEFn
YXJ3YWwgd3JvdGU6Cj4gPiA+IE9uIE1vbiwgRmViIDE3LCAyMDIwIGF0IDExOjA1OjA5QU0gKzAx
MDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiA+ID4gT24gRnJpLCBGZWIgMTQsIDIwMjAg
YXQgMTE6MjU6MzRQTSArMDAwMCwgQW5jaGFsIEFnYXJ3YWwgd3JvdGU6Cj4gPiA+ID4gPiBGcm9t
OiBNdW5laGlzYSBLYW1hdGEgPGthbWF0YW1AYW1hem9uLmNvbQo+ID4gPiA+ID4gCj4gPiA+ID4g
PiBBZGQgZnJlZXplLCB0aGF3IGFuZCByZXN0b3JlIGNhbGxiYWNrcyBmb3IgUE0gc3VzcGVuZCBh
bmQgaGliZXJuYXRpb24KPiA+ID4gPiA+IHN1cHBvcnQuIEFsbCBmcm9udGVuZCBkcml2ZXJzIHRo
YXQgbmVlZHMgdG8gdXNlIFBNX0hJQkVSTkFUSU9OL1BNX1NVU1BFTkQKPiA+ID4gPiA+IGV2ZW50
cywgbmVlZCB0byBpbXBsZW1lbnQgdGhlc2UgeGVuYnVzX2RyaXZlciBjYWxsYmFja3MuCj4gPiA+
ID4gPiBUaGUgZnJlZXplIGhhbmRsZXIgc3RvcHMgYSBibG9jay1sYXllciBxdWV1ZSBhbmQgZGlz
Y29ubmVjdCB0aGUKPiA+ID4gPiA+IGZyb250ZW5kIGZyb20gdGhlIGJhY2tlbmQgd2hpbGUgZnJl
ZWluZyByaW5nX2luZm8gYW5kIGFzc29jaWF0ZWQgcmVzb3VyY2VzLgo+ID4gPiA+ID4gVGhlIHJl
c3RvcmUgaGFuZGxlciByZS1hbGxvY2F0ZXMgcmluZ19pbmZvIGFuZCByZS1jb25uZWN0IHRvIHRo
ZQo+ID4gPiA+ID4gYmFja2VuZCwgc28gdGhlIHJlc3Qgb2YgdGhlIGtlcm5lbCBjYW4gY29udGlu
dWUgdG8gdXNlIHRoZSBibG9jayBkZXZpY2UKPiA+ID4gPiA+IHRyYW5zcGFyZW50bHkuIEFsc28s
IHRoZSBoYW5kbGVycyBhcmUgdXNlZCBmb3IgYm90aCBQTSBzdXNwZW5kIGFuZAo+ID4gPiA+ID4g
aGliZXJuYXRpb24gc28gdGhhdCB3ZSBjYW4ga2VlcCB0aGUgZXhpc3Rpbmcgc3VzcGVuZC9yZXN1
bWUgY2FsbGJhY2tzIGZvcgo+ID4gPiA+ID4gWGVuIHN1c3BlbmQgd2l0aG91dCBtb2RpZmljYXRp
b24uIEJlZm9yZSBkaXNjb25uZWN0aW5nIGZyb20gYmFja2VuZCwKPiA+ID4gPiA+IHdlIG5lZWQg
dG8gcHJldmVudCBhbnkgbmV3IElPIGZyb20gYmVpbmcgcXVldWVkIGFuZCB3YWl0IGZvciBleGlz
dGluZwo+ID4gPiA+ID4gSU8gdG8gY29tcGxldGUuCj4gPiA+ID4gCj4gPiA+ID4gVGhpcyBpcyBk
aWZmZXJlbnQgZnJvbSBYZW4gKHhlbnN0b3JlKSBpbml0aWF0ZWQgc3VzcGVuc2lvbiwgYXMgaW4g
dGhhdAo+ID4gPiA+IGNhc2UgTGludXggZG9lc24ndCBmbHVzaCB0aGUgcmluZ3Mgb3IgZGlzY29u
bmVjdHMgZnJvbSB0aGUgYmFja2VuZC4KPiA+ID4gWWVzLCBBRkFJSyBpbiB4ZW4gaW5pdGlhdGVk
IHN1c3BlbnNpb24gYmFja2VuZCB0YWtlcyBjYXJlIG9mIGl0LiAKPiA+IAo+ID4gTm8sIGluIFhl
biBpbml0aWF0ZWQgc3VzcGVuc2lvbiBiYWNrZW5kIGRvZXNuJ3QgdGFrZSBjYXJlIG9mIGZsdXNo
aW5nCj4gPiB0aGUgcmluZ3MsIHRoZSBmcm9udGVuZCBoYXMgYSBzaGFkb3cgY29weSBvZiB0aGUg
cmluZyBjb250ZW50cyBhbmQgaXQKPiA+IHJlLWlzc3VlcyB0aGUgcmVxdWVzdHMgb24gcmVzdW1l
Lgo+ID4gCj4gWWVzLCBJIG1lYW50IHN1c3BlbnNpb24gaW4gZ2VuZXJhbCB3aGVyZSBib3RoIHhl
bnN0b3JlIGFuZCBiYWNrZW5kIGtub3dzCj4gc3lzdGVtIGlzIGdvaW5nIHVuZGVyIHN1c3BlbnNp
b24gYW5kIG5vdCBmbHVzaGluZyBvZiByaW5ncy4KCmJhY2tlbmQgaGFzIG5vIGlkZWEgdGhlIGd1
ZXN0IGlzIGdvaW5nIHRvIGJlIHN1c3BlbmRlZC4gQmFja2VuZCBjb2RlCmlzIGNvbXBsZXRlbHkg
YWdub3N0aWMgdG8gc3VzcGVuc2lvbi9yZXN1bWUuCgo+IFRoYXQgaGFwcGVucwo+IGluIGZyb250
ZW5kIHdoZW4gYmFja2VuZCBpbmRpY2F0ZXMgdGhhdCBzdGF0ZSBpcyBjbG9zaW5nIGFuZCBzbyBv
bi4KPiBJIG1heSBoYXZlIHdyaXR0ZW4gaXQgaW4gd3JvbmcgY29udGV4dC4KCkknbSBhZnJhaWQg
SSdtIG5vdCBzdXJlIEkgZnVsbHkgdW5kZXJzdGFuZCB0aGlzIGxhc3Qgc2VudGVuY2UuCgo+ID4g
PiA+ID4gK3N0YXRpYyBpbnQgYmxrZnJvbnRfZnJlZXplKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpk
ZXYpCj4gPiA+ID4gPiArewo+ID4gPiA+ID4gKwl1bnNpZ25lZCBpbnQgaTsKPiA+ID4gPiA+ICsJ
c3RydWN0IGJsa2Zyb250X2luZm8gKmluZm8gPSBkZXZfZ2V0X2RydmRhdGEoJmRldi0+ZGV2KTsK
PiA+ID4gPiA+ICsJc3RydWN0IGJsa2Zyb250X3JpbmdfaW5mbyAqcmluZm87Cj4gPiA+ID4gPiAr
CS8qIFRoaXMgd291bGQgYmUgcmVhc29uYWJsZSB0aW1lb3V0IGFzIHVzZWQgaW4geGVuYnVzX2Rl
dl9zaHV0ZG93bigpICovCj4gPiA+ID4gPiArCXVuc2lnbmVkIGludCB0aW1lb3V0ID0gNSAqIEha
Owo+ID4gPiA+ID4gKwlpbnQgZXJyID0gMDsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsJaW5mby0+
Y29ubmVjdGVkID0gQkxLSUZfU1RBVEVfRlJFRVpJTkc7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAr
CWJsa19tcV9mcmVlemVfcXVldWUoaW5mby0+cnEpOwo+ID4gPiA+ID4gKwlibGtfbXFfcXVpZXNj
ZV9xdWV1ZShpbmZvLT5ycSk7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArCWZvciAoaSA9IDA7IGkg
PCBpbmZvLT5ucl9yaW5nczsgaSsrKSB7Cj4gPiA+ID4gPiArCQlyaW5mbyA9ICZpbmZvLT5yaW5m
b1tpXTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsJCWdudHRhYl9jYW5jZWxfZnJlZV9jYWxsYmFj
aygmcmluZm8tPmNhbGxiYWNrKTsKPiA+ID4gPiA+ICsJCWZsdXNoX3dvcmsoJnJpbmZvLT53b3Jr
KTsKPiA+ID4gPiA+ICsJfQo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKwkvKiBLaWNrIHRoZSBiYWNr
ZW5kIHRvIGRpc2Nvbm5lY3QgKi8KPiA+ID4gPiA+ICsJeGVuYnVzX3N3aXRjaF9zdGF0ZShkZXYs
IFhlbmJ1c1N0YXRlQ2xvc2luZyk7Cj4gPiA+ID4gCj4gPiA+ID4gQXJlIHlvdSBzdXJlIHRoaXMg
aXMgc2FmZT8KPiA+ID4gPiAKPiA+ID4gSW4gbXkgdGVzdGluZyBydW5uaW5nIG11bHRpcGxlIGZp
byBqb2JzLCBvdGhlciB0ZXN0IHNjZW5hcmlvcyBydW5uaW5nCj4gPiA+IGEgbWVtb3J5IGxvYWRl
ciB3b3JrcyBmaW5lLiBJIGRpZCBub3QgY2FtZSBhY3Jvc3MgYSBzY2VuYXJpbyB0aGF0IHdvdWxk
Cj4gPiA+IGhhdmUgZmFpbGVkIHJlc3VtZSBkdWUgdG8gYmxrZnJvbnQgaXNzdWVzIHVubGVzcyB5
b3UgY2FuIHN1Z2VzdCBzb21lPwo+ID4gCj4gPiBBRkFJQ1QgeW91IGRvbid0IHdhaXQgZm9yIHRo
ZSBpbi1mbGlnaHQgcmVxdWVzdHMgdG8gYmUgZmluaXNoZWQsIGFuZAo+ID4ganVzdCByZWx5IG9u
IGJsa2JhY2sgdG8gZmluaXNoIHByb2Nlc3NpbmcgdGhvc2UuIEknbSBub3Qgc3VyZSBhbGwKPiA+
IGJsa2JhY2sgaW1wbGVtZW50YXRpb25zIG91dCB0aGVyZSBjYW4gZ3VhcmFudGVlIHRoYXQuCj4g
PiAKPiA+IFRoZSBhcHByb2FjaCB1c2VkIGJ5IFhlbiBpbml0aWF0ZWQgc3VzcGVuc2lvbiBpcyB0
byByZS1pc3N1ZSB0aGUKPiA+IGluLWZsaWdodCByZXF1ZXN0cyB3aGVuIHJlc3VtaW5nLiBJIGhh
dmUgdG8gYWRtaXQgSSBkb24ndCB0aGluayB0aGlzCj4gPiBpcyB0aGUgYmVzdCBhcHByb2FjaCwg
YnV0IEkgd291bGQgbGlrZSB0byBrZWVwIGJvdGggdGhlIFhlbiBhbmQgdGhlIFBNCj4gPiBpbml0
aWF0ZWQgc3VzcGVuc2lvbiB1c2luZyB0aGUgc2FtZSBsb2dpYywgYW5kIGhlbmNlIEkgd291bGQg
cmVxdWVzdAo+ID4gdGhhdCB5b3UgdHJ5IHRvIHJlLXVzZSB0aGUgZXhpc3RpbmcgcmVzdW1lIGxv
Z2ljIChibGtmcm9udF9yZXN1bWUpLgo+ID4gCj4gPiA+ID4gSSBkb24ndCB0aGluayB5b3Ugd2Fp
dCBmb3IgYWxsIHJlcXVlc3RzIHBlbmRpbmcgb24gdGhlIHJpbmcgdG8gYmUKPiA+ID4gPiBmaW5p
c2hlZCBieSB0aGUgYmFja2VuZCwgYW5kIGhlbmNlIHlvdSBtaWdodCBsb29zZSByZXF1ZXN0cyBh
cyB0aGUKPiA+ID4gPiBvbmVzIG9uIHRoZSByaW5nIHdvdWxkIG5vdCBiZSByZS1pc3N1ZWQgYnkg
YmxrZnJvbnRfcmVzdG9yZSBBRkFJQ1QuCj4gPiA+ID4gCj4gPiA+IEFGQUlVLCBibGtfbXFfZnJl
ZXplX3F1ZXVlL2Jsa19tcV9xdWllc2NlX3F1ZXVlIHNob3VsZCB0YWtlIGNhcmUgb2Ygbm8gdXNl
ZAo+ID4gPiByZXF1ZXN0IG9uIHRoZSBzaGFyZWQgcmluZy4gQWxzbywgd2UgSSB3YW50IHRvIHBh
dXNlIHRoZSBxdWV1ZSBhbmQgZmx1c2ggYWxsCj4gPiA+IHRoZSBwZW5kaW5nIHJlcXVlc3RzIGlu
IHRoZSBzaGFyZWQgcmluZyBiZWZvcmUgZGlzY29ubmVjdGluZyBmcm9tIGJhY2tlbmQuCj4gPiAK
PiA+IE9oLCBzbyBibGtfbXFfZnJlZXplX3F1ZXVlIGRvZXMgd2FpdCBmb3IgaW4tZmxpZ2h0IHJl
cXVlc3RzIHRvIGJlCj4gPiBmaW5pc2hlZC4gSSBndWVzcyBpdCdzIGZpbmUgdGhlbi4KPiA+IAo+
IE9rLgo+ID4gPiBRdWllc2NpbmcgdGhlIHF1ZXVlIHNlZW1lZCBhIGJldHRlciBvcHRpb24gaGVy
ZSBhcyB3ZSB3YW50IHRvIG1ha2Ugc3VyZSBvbmdvaW5nCj4gPiA+IHJlcXVlc3RzIGRpc3BhdGNo
ZXMgYXJlIHRvdGFsbHkgZHJhaW5lZC4KPiA+ID4gSSBzaG91bGQgYWNjZXB0IHRoYXQgc29tZSBv
ZiB0aGVzZSBub3Rpb24gaXMgYm9ycm93ZWQgZnJvbSBob3cgbnZtZSBmcmVlemUvdW5mcmVlemUg
Cj4gPiA+IGlzIGRvbmUgYWx0aG91Z2ggaXRzIG5vdCBhcHBsZSB0byBhcHBsZSBjb21wYXJpc29u
Lgo+ID4gCj4gPiBUaGF0J3MgZmluZSwgYnV0IEkgd291bGQgc3RpbGwgbGlrZSB0byByZXF1ZXN0
cyB0aGF0IHlvdSB1c2UgdGhlIHNhbWUKPiA+IGxvZ2ljIChhcyBtdWNoIGFzIHBvc3NpYmxlKSBm
b3IgYm90aCB0aGUgWGVuIGFuZCB0aGUgUE0gaW5pdGlhdGVkCj4gPiBzdXNwZW5zaW9uLgo+ID4g
Cj4gPiBTbyB5b3UgZWl0aGVyIGFwcGx5IHRoaXMgZnJlZXplL3VuZnJlZXplIHRvIHRoZSBYZW4g
c3VzcGVuc2lvbiAoYW5kCj4gPiBkcm9wIHRoZSByZS1pc3N1aW5nIG9mIHJlcXVlc3RzIG9uIHJl
c3VtZSkgb3IgYWRhcHQgdGhlIHNhbWUgYXBwcm9hY2gKPiA+IGFzIHRoZSBYZW4gaW5pdGlhdGVk
IHN1c3BlbnNpb24uIEtlZXBpbmcgdHdvIGNvbXBsZXRlbHkgZGlmZmVyZW50Cj4gPiBhcHByb2Fj
aGVzIHRvIHN1c3BlbnNpb24gLyByZXN1bWUgb24gYmxrZnJvbnQgaXMgbm90IHN1aXRhYmxlIGxv
bmcKPiA+IHRlcm0uCj4gPiAKPiBJIGFncmVlIHdpdGggeW91IG9uIG92ZXJoYXVsIG9mIHhlbiBz
dXNwZW5kL3Jlc3VtZSB3cnQgYmxrZnJvbnQgaXMgYSBnb29kCj4gaWRlYSBob3dldmVyLCBJTU8g
dGhhdCBpcyBhIHdvcmsgZm9yIGZ1dHVyZSBhbmQgdGhpcyBwYXRjaCBzZXJpZXMgc2hvdWxkIAo+
IG5vdCBiZSBibG9ja2VkIGZvciBpdC4gV2hhdCBkbyB5b3UgdGhpbms/CgpJdCdzIG5vdCBzbyBt
dWNoIHRoYXQgSSB0aGluayBhbiBvdmVyaGF1bCBvZiBzdXNwZW5kL3Jlc3VtZSBpbgpibGtmcm9u
dCBpcyBuZWVkZWQsIGl0J3MganVzdCB0aGF0IEkgZG9uJ3Qgd2FudCB0byBoYXZlIHR3byBjb21w
bGV0ZWx5CmRpZmZlcmVudCBzdXNwZW5kL3Jlc3VtZSBwYXRocyBpbnNpZGUgYmxrZnJvbnQuCgpT
byBmcm9tIG15IFBvViBJIHRoaW5rIHRoZSByaWdodCBzb2x1dGlvbiBpcyB0byBlaXRoZXIgdXNl
IHRoZSBzYW1lCmNvZGUgKGFzIG11Y2ggYXMgcG9zc2libGUpIGFzIGl0J3MgY3VycmVudGx5IHVz
ZWQgYnkgWGVuIGluaXRpYXRlZApzdXNwZW5kL3Jlc3VtZSwgb3IgdG8gYWxzbyBzd2l0Y2ggWGVu
IGluaXRpYXRlZCBzdXNwZW5zaW9uIHRvIHVzZSB0aGUKbmV3bHkgaW50cm9kdWNlZCBjb2RlLgoK
SGF2aW5nIHR3byBkaWZmZXJlbnQgYXBwcm9hY2hlcyB0byBzdXNwZW5kL3Jlc3VtZSBpbiB0aGUg
c2FtZSBkcml2ZXIKaXMgYSByZWNpcGUgZm9yIGRpc2FzdGVyIElNTzogaXQgYWRkcyBjb21wbGV4
aXR5IGJ5IGZvcmNpbmcgZGV2ZWxvcGVycwp0byB0YWtlIGludG8gYWNjb3VudCB0d28gZGlmZmVy
ZW50IHN1c3BlbmQvcmVzdW1lIGFwcHJvYWNoZXMgd2hlbgp0aGVyZSdzIG5vIG5lZWQgZm9yIGl0
LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=

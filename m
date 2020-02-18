Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA29162341
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 10:19:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3yzT-0005Hl-B7; Tue, 18 Feb 2020 09:16:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NVht=4G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j3yzR-0005Hg-Rg
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 09:16:25 +0000
X-Inumbo-ID: 54e17622-522f-11ea-812a-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54e17622-522f-11ea-812a-12813bfff9fa;
 Tue, 18 Feb 2020 09:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582017383;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lcDVb9zXtKxtRtcOkp+nnORggRYgX9o2VvFOkpOp/P8=;
 b=doHcTDZhEleU4uF6W/p74teKIQ/PYkfaCOSXvzNM92ONn9vmtRMXaSdD
 GpGnh8UVkp0a9hwwkdxmw26pzIoBWUuNY8LRSWK/j/Z17+JGunJ0ak9bU
 gsmm2tUPzRBi2WzkErAM//SvchGitirwz2/bk7NCAgns8sKLCabA4gbx5 A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +NEaIej/3FoAmfEcfZRKSsrlG2EvLazi8i5c8rEat0w9DZFheqa79Nk6lGtTXdWahQxWJl2DCh
 tlH9OIp4sxxYTLOa3B/zsETTAUK8TdmCfj5QS1nbH7zQdOb38cbTB0gh9TwQ83rCNVxkZpFmoq
 j1LtHDChEp7jQ9ejWC3CN7k9hxaDnckSFEXLd4lOIy3xb5OQT9MQ0pZkm803x4ik86Fj0f3jA3
 liTdQc2+rRln3CHugnKLQ5/73TashOzsfWqyviP0SOWxvTvxXsU6PhJjMAiJRq9l7kT8QkhDY2
 q1o=
X-SBRS: 2.7
X-MesageID: 13228854
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,456,1574139600"; d="scan'208";a="13228854"
Date: Tue, 18 Feb 2020 10:16:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anchal Agarwal <anchalag@amazon.com>
Message-ID: <20200218091611.GN4679@Air-de-Roger>
References: <cover.1581721799.git.anchalag@amazon.com>
 <890c404c585d7790514527f0c021056a7be6e748.1581721799.git.anchalag@amazon.com>
 <20200217100509.GE4679@Air-de-Roger>
 <20200217230553.GA8100@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217230553.GA8100@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

T24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMTE6MDU6NTNQTSArMDAwMCwgQW5jaGFsIEFnYXJ3YWwg
d3JvdGU6Cj4gT24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMTE6MDU6MDlBTSArMDEwMCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPiA+IE9uIEZyaSwgRmViIDE0LCAyMDIwIGF0IDExOjI1OjM0UE0g
KzAwMDAsIEFuY2hhbCBBZ2Fyd2FsIHdyb3RlOgo+ID4gPiBGcm9tOiBNdW5laGlzYSBLYW1hdGEg
PGthbWF0YW1AYW1hem9uLmNvbQo+ID4gPiAKPiA+ID4gQWRkIGZyZWV6ZSwgdGhhdyBhbmQgcmVz
dG9yZSBjYWxsYmFja3MgZm9yIFBNIHN1c3BlbmQgYW5kIGhpYmVybmF0aW9uCj4gPiA+IHN1cHBv
cnQuIEFsbCBmcm9udGVuZCBkcml2ZXJzIHRoYXQgbmVlZHMgdG8gdXNlIFBNX0hJQkVSTkFUSU9O
L1BNX1NVU1BFTkQKPiA+ID4gZXZlbnRzLCBuZWVkIHRvIGltcGxlbWVudCB0aGVzZSB4ZW5idXNf
ZHJpdmVyIGNhbGxiYWNrcy4KPiA+ID4gVGhlIGZyZWV6ZSBoYW5kbGVyIHN0b3BzIGEgYmxvY2st
bGF5ZXIgcXVldWUgYW5kIGRpc2Nvbm5lY3QgdGhlCj4gPiA+IGZyb250ZW5kIGZyb20gdGhlIGJh
Y2tlbmQgd2hpbGUgZnJlZWluZyByaW5nX2luZm8gYW5kIGFzc29jaWF0ZWQgcmVzb3VyY2VzLgo+
ID4gPiBUaGUgcmVzdG9yZSBoYW5kbGVyIHJlLWFsbG9jYXRlcyByaW5nX2luZm8gYW5kIHJlLWNv
bm5lY3QgdG8gdGhlCj4gPiA+IGJhY2tlbmQsIHNvIHRoZSByZXN0IG9mIHRoZSBrZXJuZWwgY2Fu
IGNvbnRpbnVlIHRvIHVzZSB0aGUgYmxvY2sgZGV2aWNlCj4gPiA+IHRyYW5zcGFyZW50bHkuIEFs
c28sIHRoZSBoYW5kbGVycyBhcmUgdXNlZCBmb3IgYm90aCBQTSBzdXNwZW5kIGFuZAo+ID4gPiBo
aWJlcm5hdGlvbiBzbyB0aGF0IHdlIGNhbiBrZWVwIHRoZSBleGlzdGluZyBzdXNwZW5kL3Jlc3Vt
ZSBjYWxsYmFja3MgZm9yCj4gPiA+IFhlbiBzdXNwZW5kIHdpdGhvdXQgbW9kaWZpY2F0aW9uLiBC
ZWZvcmUgZGlzY29ubmVjdGluZyBmcm9tIGJhY2tlbmQsCj4gPiA+IHdlIG5lZWQgdG8gcHJldmVu
dCBhbnkgbmV3IElPIGZyb20gYmVpbmcgcXVldWVkIGFuZCB3YWl0IGZvciBleGlzdGluZwo+ID4g
PiBJTyB0byBjb21wbGV0ZS4KPiA+IAo+ID4gVGhpcyBpcyBkaWZmZXJlbnQgZnJvbSBYZW4gKHhl
bnN0b3JlKSBpbml0aWF0ZWQgc3VzcGVuc2lvbiwgYXMgaW4gdGhhdAo+ID4gY2FzZSBMaW51eCBk
b2Vzbid0IGZsdXNoIHRoZSByaW5ncyBvciBkaXNjb25uZWN0cyBmcm9tIHRoZSBiYWNrZW5kLgo+
IFllcywgQUZBSUsgaW4geGVuIGluaXRpYXRlZCBzdXNwZW5zaW9uIGJhY2tlbmQgdGFrZXMgY2Fy
ZSBvZiBpdC4gCgpObywgaW4gWGVuIGluaXRpYXRlZCBzdXNwZW5zaW9uIGJhY2tlbmQgZG9lc24n
dCB0YWtlIGNhcmUgb2YgZmx1c2hpbmcKdGhlIHJpbmdzLCB0aGUgZnJvbnRlbmQgaGFzIGEgc2hh
ZG93IGNvcHkgb2YgdGhlIHJpbmcgY29udGVudHMgYW5kIGl0CnJlLWlzc3VlcyB0aGUgcmVxdWVz
dHMgb24gcmVzdW1lLgoKPiA+ID4gK3N0YXRpYyBpbnQgYmxrZnJvbnRfZnJlZXplKHN0cnVjdCB4
ZW5idXNfZGV2aWNlICpkZXYpCj4gPiA+ICt7Cj4gPiA+ICsJdW5zaWduZWQgaW50IGk7Cj4gPiA+
ICsJc3RydWN0IGJsa2Zyb250X2luZm8gKmluZm8gPSBkZXZfZ2V0X2RydmRhdGEoJmRldi0+ZGV2
KTsKPiA+ID4gKwlzdHJ1Y3QgYmxrZnJvbnRfcmluZ19pbmZvICpyaW5mbzsKPiA+ID4gKwkvKiBU
aGlzIHdvdWxkIGJlIHJlYXNvbmFibGUgdGltZW91dCBhcyB1c2VkIGluIHhlbmJ1c19kZXZfc2h1
dGRvd24oKSAqLwo+ID4gPiArCXVuc2lnbmVkIGludCB0aW1lb3V0ID0gNSAqIEhaOwo+ID4gPiAr
CWludCBlcnIgPSAwOwo+ID4gPiArCj4gPiA+ICsJaW5mby0+Y29ubmVjdGVkID0gQkxLSUZfU1RB
VEVfRlJFRVpJTkc7Cj4gPiA+ICsKPiA+ID4gKwlibGtfbXFfZnJlZXplX3F1ZXVlKGluZm8tPnJx
KTsKPiA+ID4gKwlibGtfbXFfcXVpZXNjZV9xdWV1ZShpbmZvLT5ycSk7Cj4gPiA+ICsKPiA+ID4g
Kwlmb3IgKGkgPSAwOyBpIDwgaW5mby0+bnJfcmluZ3M7IGkrKykgewo+ID4gPiArCQlyaW5mbyA9
ICZpbmZvLT5yaW5mb1tpXTsKPiA+ID4gKwo+ID4gPiArCQlnbnR0YWJfY2FuY2VsX2ZyZWVfY2Fs
bGJhY2soJnJpbmZvLT5jYWxsYmFjayk7Cj4gPiA+ICsJCWZsdXNoX3dvcmsoJnJpbmZvLT53b3Jr
KTsKPiA+ID4gKwl9Cj4gPiA+ICsKPiA+ID4gKwkvKiBLaWNrIHRoZSBiYWNrZW5kIHRvIGRpc2Nv
bm5lY3QgKi8KPiA+ID4gKwl4ZW5idXNfc3dpdGNoX3N0YXRlKGRldiwgWGVuYnVzU3RhdGVDbG9z
aW5nKTsKPiA+IAo+ID4gQXJlIHlvdSBzdXJlIHRoaXMgaXMgc2FmZT8KPiA+IAo+IEluIG15IHRl
c3RpbmcgcnVubmluZyBtdWx0aXBsZSBmaW8gam9icywgb3RoZXIgdGVzdCBzY2VuYXJpb3MgcnVu
bmluZwo+IGEgbWVtb3J5IGxvYWRlciB3b3JrcyBmaW5lLiBJIGRpZCBub3QgY2FtZSBhY3Jvc3Mg
YSBzY2VuYXJpbyB0aGF0IHdvdWxkCj4gaGF2ZSBmYWlsZWQgcmVzdW1lIGR1ZSB0byBibGtmcm9u
dCBpc3N1ZXMgdW5sZXNzIHlvdSBjYW4gc3VnZXN0IHNvbWU/CgpBRkFJQ1QgeW91IGRvbid0IHdh
aXQgZm9yIHRoZSBpbi1mbGlnaHQgcmVxdWVzdHMgdG8gYmUgZmluaXNoZWQsIGFuZApqdXN0IHJl
bHkgb24gYmxrYmFjayB0byBmaW5pc2ggcHJvY2Vzc2luZyB0aG9zZS4gSSdtIG5vdCBzdXJlIGFs
bApibGtiYWNrIGltcGxlbWVudGF0aW9ucyBvdXQgdGhlcmUgY2FuIGd1YXJhbnRlZSB0aGF0LgoK
VGhlIGFwcHJvYWNoIHVzZWQgYnkgWGVuIGluaXRpYXRlZCBzdXNwZW5zaW9uIGlzIHRvIHJlLWlz
c3VlIHRoZQppbi1mbGlnaHQgcmVxdWVzdHMgd2hlbiByZXN1bWluZy4gSSBoYXZlIHRvIGFkbWl0
IEkgZG9uJ3QgdGhpbmsgdGhpcwppcyB0aGUgYmVzdCBhcHByb2FjaCwgYnV0IEkgd291bGQgbGlr
ZSB0byBrZWVwIGJvdGggdGhlIFhlbiBhbmQgdGhlIFBNCmluaXRpYXRlZCBzdXNwZW5zaW9uIHVz
aW5nIHRoZSBzYW1lIGxvZ2ljLCBhbmQgaGVuY2UgSSB3b3VsZCByZXF1ZXN0CnRoYXQgeW91IHRy
eSB0byByZS11c2UgdGhlIGV4aXN0aW5nIHJlc3VtZSBsb2dpYyAoYmxrZnJvbnRfcmVzdW1lKS4K
Cj4gPiBJIGRvbid0IHRoaW5rIHlvdSB3YWl0IGZvciBhbGwgcmVxdWVzdHMgcGVuZGluZyBvbiB0
aGUgcmluZyB0byBiZQo+ID4gZmluaXNoZWQgYnkgdGhlIGJhY2tlbmQsIGFuZCBoZW5jZSB5b3Ug
bWlnaHQgbG9vc2UgcmVxdWVzdHMgYXMgdGhlCj4gPiBvbmVzIG9uIHRoZSByaW5nIHdvdWxkIG5v
dCBiZSByZS1pc3N1ZWQgYnkgYmxrZnJvbnRfcmVzdG9yZSBBRkFJQ1QuCj4gPiAKPiBBRkFJVSwg
YmxrX21xX2ZyZWV6ZV9xdWV1ZS9ibGtfbXFfcXVpZXNjZV9xdWV1ZSBzaG91bGQgdGFrZSBjYXJl
IG9mIG5vIHVzZWQKPiByZXF1ZXN0IG9uIHRoZSBzaGFyZWQgcmluZy4gQWxzbywgd2UgSSB3YW50
IHRvIHBhdXNlIHRoZSBxdWV1ZSBhbmQgZmx1c2ggYWxsCj4gdGhlIHBlbmRpbmcgcmVxdWVzdHMg
aW4gdGhlIHNoYXJlZCByaW5nIGJlZm9yZSBkaXNjb25uZWN0aW5nIGZyb20gYmFja2VuZC4KCk9o
LCBzbyBibGtfbXFfZnJlZXplX3F1ZXVlIGRvZXMgd2FpdCBmb3IgaW4tZmxpZ2h0IHJlcXVlc3Rz
IHRvIGJlCmZpbmlzaGVkLiBJIGd1ZXNzIGl0J3MgZmluZSB0aGVuLgoKPiBRdWllc2NpbmcgdGhl
IHF1ZXVlIHNlZW1lZCBhIGJldHRlciBvcHRpb24gaGVyZSBhcyB3ZSB3YW50IHRvIG1ha2Ugc3Vy
ZSBvbmdvaW5nCj4gcmVxdWVzdHMgZGlzcGF0Y2hlcyBhcmUgdG90YWxseSBkcmFpbmVkLgo+IEkg
c2hvdWxkIGFjY2VwdCB0aGF0IHNvbWUgb2YgdGhlc2Ugbm90aW9uIGlzIGJvcnJvd2VkIGZyb20g
aG93IG52bWUgZnJlZXplL3VuZnJlZXplIAo+IGlzIGRvbmUgYWx0aG91Z2ggaXRzIG5vdCBhcHBs
ZSB0byBhcHBsZSBjb21wYXJpc29uLgoKVGhhdCdzIGZpbmUsIGJ1dCBJIHdvdWxkIHN0aWxsIGxp
a2UgdG8gcmVxdWVzdHMgdGhhdCB5b3UgdXNlIHRoZSBzYW1lCmxvZ2ljIChhcyBtdWNoIGFzIHBv
c3NpYmxlKSBmb3IgYm90aCB0aGUgWGVuIGFuZCB0aGUgUE0gaW5pdGlhdGVkCnN1c3BlbnNpb24u
CgpTbyB5b3UgZWl0aGVyIGFwcGx5IHRoaXMgZnJlZXplL3VuZnJlZXplIHRvIHRoZSBYZW4gc3Vz
cGVuc2lvbiAoYW5kCmRyb3AgdGhlIHJlLWlzc3Vpbmcgb2YgcmVxdWVzdHMgb24gcmVzdW1lKSBv
ciBhZGFwdCB0aGUgc2FtZSBhcHByb2FjaAphcyB0aGUgWGVuIGluaXRpYXRlZCBzdXNwZW5zaW9u
LiBLZWVwaW5nIHR3byBjb21wbGV0ZWx5IGRpZmZlcmVudAphcHByb2FjaGVzIHRvIHN1c3BlbnNp
b24gLyByZXN1bWUgb24gYmxrZnJvbnQgaXMgbm90IHN1aXRhYmxlIGxvbmcKdGVybS4KClRoYW5r
cywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

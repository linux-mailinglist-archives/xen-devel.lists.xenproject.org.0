Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF2517DCCB
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 10:57:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBF74-0005Qr-SH; Mon, 09 Mar 2020 09:54:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rDIu=42=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jBF73-0005Qm-Sa
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 09:54:17 +0000
X-Inumbo-ID: f0420fd4-61eb-11ea-b52f-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0420fd4-61eb-11ea-b52f-bc764e2007e4;
 Mon, 09 Mar 2020 09:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583747657;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zNNy4OU4z799DFnGrpM43KDZz+dFPqGX2kfMxUq+JC4=;
 b=a2U6IkVKlgzZQeI6bAG58NAgwPUmz/xvCmc2INJPLS9UORxO3QzZDiBG
 KLP7WfyJgOmS66F3vi6G/gqoMZnZKlwHodzzE+yPIIOEdv8D72JoewyEo
 8i6ZnSn/POJvtcsdu5/lpLwucrzK/k9tdP1RtDxpcXKQybT7df0qLASaT U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: do3ZdpTCHyvaP5/SysNyQ6OvX1Aj0Ge4f7a/KYeItfaoREnOoclQ+3UyK3UmAERmfHfgoT/FiQ
 LR9MObLUIfhV2BPRhBPXshsMWzuwO3v4tN81Aoi937geQXN+15Jjn0MKQSjxZacs9yopW4nPAZ
 uDUMrTz2AwTvII9JUzZilZZKcERwlF4UumWQAdnHNAvCe+/bSVdDDablLPGbDI7n3on4l9R4+J
 +es1+SHgHi13FosRMxuLOY1+8VoFhR3maY5sz1tdbvfoZ26Su//Y7lr5QmSGj1zs92DuWGF43J
 BJY=
X-SBRS: 2.7
X-MesageID: 13805261
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,532,1574139600"; d="scan'208";a="13805261"
Date: Mon, 9 Mar 2020 10:54:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anchal Agarwal <anchalag@amazon.com>
Message-ID: <20200309095245.GY24458@Air-de-Roger.citrite.net>
References: <cover.1581721799.git.anchalag@amazon.com>
 <890c404c585d7790514527f0c021056a7be6e748.1581721799.git.anchalag@amazon.com>
 <20200221142445.GZ4679@Air-de-Roger>
 <20200306184033.GA25358@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200306184033.GA25358@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
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

T24gRnJpLCBNYXIgMDYsIDIwMjAgYXQgMDY6NDA6MzNQTSArMDAwMCwgQW5jaGFsIEFnYXJ3YWwg
d3JvdGU6Cj4gT24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMDM6MjQ6NDVQTSArMDEwMCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPiA+IE9uIEZyaSwgRmViIDE0LCAyMDIwIGF0IDExOjI1OjM0UE0g
KzAwMDAsIEFuY2hhbCBBZ2Fyd2FsIHdyb3RlOgo+ID4gPiAgCWJsa2Zyb250X2dhdGhlcl9iYWNr
ZW5kX2ZlYXR1cmVzKGluZm8pOwo+ID4gPiAgCS8qIFJlc2V0IGxpbWl0cyBjaGFuZ2VkIGJ5IGJs
a19tcV91cGRhdGVfbnJfaHdfcXVldWVzKCkuICovCj4gPiA+ICAJYmxraWZfc2V0X3F1ZXVlX2xp
bWl0cyhpbmZvKTsKPiA+ID4gQEAgLTIwNDYsNiArMjA2Myw5IEBAIHN0YXRpYyBpbnQgYmxraWZf
cmVjb3ZlcihzdHJ1Y3QgYmxrZnJvbnRfaW5mbyAqaW5mbykKPiA+ID4gIAkJa2lja19wZW5kaW5n
X3JlcXVlc3RfcXVldWVzKHJpbmZvKTsKPiA+ID4gIAl9Cj4gPiA+ICAKPiA+ID4gKwlpZiAoZnJv
emVuKQo+ID4gPiArCQlyZXR1cm4gMDsKPiA+IAo+ID4gSSBoYXZlIHRvIGFkbWl0IG15IG1lbW9y
eSBpcyBmdXp6eSBoZXJlLCBidXQgZG9uJ3QgeW91IG5lZWQgdG8KPiA+IHJlLXF1ZXVlIHJlcXVl
c3RzIGluIGNhc2UgdGhlIGJhY2tlbmQgaGFzIGRpZmZlcmVudCBsaW1pdHMgb2YgaW5kaXJlY3QK
PiA+IGRlc2NyaXB0b3JzIHBlciByZXF1ZXN0IGZvciBleGFtcGxlPwo+ID4gCj4gPiBPciBkbyB3
ZSBleHBlY3QgdGhhdCB0aGUgZnJvbnRlbmQgaXMgYWx3YXlzIGdvaW5nIHRvIGJlIHJlc3VtZWQg
b24gdGhlCj4gPiBzYW1lIGJhY2tlbmQsIGFuZCB0aHVzIGZlYXR1cmVzIHdvbid0IGNoYW5nZT8K
PiA+IAo+IFNvIHRvIHVuZGVyc3RhbmQgeW91ciBxdWVzdGlvbiBiZXR0ZXIgaGVyZSwgQUZBSVUg
dGhlICBtYXhpbXVtIG51bWJlciBvZiBpbmRpcmVjdCAKPiBncmVmcyBpcyBmaXhlZCBieSB0aGUg
YmFja2VuZCwgYnV0IHRoZSBmcm9udGVuZCBjYW4gaXNzdWUgcmVxdWVzdHMgd2l0aCBhbnkgCj4g
bnVtYmVyIG9mIGluZGlyZWN0IHNlZ21lbnRzIGFzIGxvbmcgYXMgaXQncyBsZXNzIHRoYW4gdGhl
IG51bWJlciBwcm92aWRlZCBieSAKPiB0aGUgYmFja2VuZC4gU28gYnkgeW91ciBxdWVzdGlvbiB5
b3UgbWVhbiB0aGlzIG1heCBudW1iZXIgb2YgTUFYX0lORElSRUNUX1NFR01FTlRTIAo+IDI1NiBv
biBiYWNrZW5kIGNhbiBjaGFuZ2UgPwoKWWVzLCBudW1iZXIgb2YgaW5kaXJlY3QgZGVzY3JpcHRv
cnMgc3VwcG9ydGVkIGJ5IHRoZSBiYWNrZW5kIGNhbgpjaGFuZ2UsIGJlY2F1c2UgeW91IG1vdmVk
IHRvIGEgZGlmZmVyZW50IGJhY2tlbmQsIG9yIGJlY2F1c2UgdGhlCm1heGltdW0gc3VwcG9ydGVk
IGJ5IHRoZSBiYWNrZW5kIGhhcyBjaGFuZ2VkLiBJdCdzIGFsc28gcG9zc2libGUgdG8KcmVzdW1l
IG9uIGEgYmFja2VuZCB0aGF0IGhhcyBubyBpbmRpcmVjdCBkZXNjcmlwdG9ycyBzdXBwb3J0IGF0
IGFsbC4KCj4gPiA+IEBAIC0yNjI1LDYgKzI2NzEsNjIgQEAgc3RhdGljIHZvaWQgYmxraWZfcmVs
ZWFzZShzdHJ1Y3QgZ2VuZGlzayAqZGlzaywgZm1vZGVfdCBtb2RlKQo+ID4gPiAgCW11dGV4X3Vu
bG9jaygmYmxrZnJvbnRfbXV0ZXgpOwo+ID4gPiAgfQo+ID4gPiAgCj4gPiA+ICtzdGF0aWMgaW50
IGJsa2Zyb250X2ZyZWV6ZShzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2KQo+ID4gPiArewo+ID4g
PiArCXVuc2lnbmVkIGludCBpOwo+ID4gPiArCXN0cnVjdCBibGtmcm9udF9pbmZvICppbmZvID0g
ZGV2X2dldF9kcnZkYXRhKCZkZXYtPmRldik7Cj4gPiA+ICsJc3RydWN0IGJsa2Zyb250X3Jpbmdf
aW5mbyAqcmluZm87Cj4gPiA+ICsJLyogVGhpcyB3b3VsZCBiZSByZWFzb25hYmxlIHRpbWVvdXQg
YXMgdXNlZCBpbiB4ZW5idXNfZGV2X3NodXRkb3duKCkgKi8KPiA+ID4gKwl1bnNpZ25lZCBpbnQg
dGltZW91dCA9IDUgKiBIWjsKPiA+ID4gKwlpbnQgZXJyID0gMDsKPiA+ID4gKwo+ID4gPiArCWlu
Zm8tPmNvbm5lY3RlZCA9IEJMS0lGX1NUQVRFX0ZSRUVaSU5HOwo+ID4gPiArCj4gPiA+ICsJYmxr
X21xX2ZyZWV6ZV9xdWV1ZShpbmZvLT5ycSk7Cj4gPiA+ICsJYmxrX21xX3F1aWVzY2VfcXVldWUo
aW5mby0+cnEpOwo+ID4gCj4gPiBEb24ndCB5b3UgbmVlZCB0byBhbHNvIGRyYWluIHRoZSBxdWV1
ZSBhbmQgbWFrZSBzdXJlIGl0J3MgZW1wdHk/Cj4gPiAKPiBibGtfbXFfZnJlZXplX3F1ZXVlIGFu
ZCBibGtfbXFfcXVpZXNjZV9xdWV1ZSBzaG91bGQgdGFrZSBjYXJlIG9mIHJ1bm5pbmcgSFcgcXVl
dWVzIHN5bmNocm9ub3VzbHkKPiBhbmQgbWFraW5nIHN1cmUgYWxsIHRoZSBvbmdvaW5nIGRpc3Bh
dGNoZXMgaGF2ZSBmaW5pc2hlZC4gRGlkIEkgdW5kZXJzdGFuZCB5b3VyIHF1ZXN0aW9uIHJpZ2h0
PwoKQ2FuIHlvdSBwbGVhc2UgYWRkIHNvbWUgY2hlY2sgdG8gdGhhdCBlbmQ/IChpZTogdGhhdCB0
aGVyZSBhcmUgbm8KcGVuZGluZyByZXF1ZXN0cyBvbiBhbnkgcXVldWU/KQoKVGhhbmtzLCBSb2dl
ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

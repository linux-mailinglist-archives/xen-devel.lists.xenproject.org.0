Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B76132DE9
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 19:04:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iotAu-0007Hg-A5; Tue, 07 Jan 2020 18:01:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cF2B=24=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iotAt-0007Ha-3S
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 18:01:51 +0000
X-Inumbo-ID: c6ec739e-3177-11ea-ac96-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6ec739e-3177-11ea-ac96-12813bfff9fa;
 Tue, 07 Jan 2020 18:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578420111;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=y+Tz0ruTS0q/6PxMta+ZjfoQjR7VxykbySLaDCweh80=;
 b=Qpx2MtOHdcigGkPnvJTpYM8vz+CqB8W2WifLKzl6KBCdrXNqOGd4VFo5
 hr0cMyHK0aVzy0CGbLaP6sEsQm8jVyq6suHjPE8h+fmKRDfycn3dFe/4u
 9SEzoOt6ydFoeK2kumtsJrUfftheDO9efl1w2xZOSGN9FHE+AquxPXvC3 k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: E1lEAoTXRKRH64HwQohUdmksqRr1I8Dxq0e8ZzbWAk2OY+wVKpBMupzvnsToh81KIMoheqN/Xy
 +HZPsoF4s7JrpaE/Y+3uzcqSftWTRls5f3s4+jqdztPFoOw0TP6cPUxBlweggasPYcUIv3lhyL
 7hDRP+AcIaNvGNdCI7I49gPsnmVssfHbtjZNevGpe/arVaQcUhBSR9WhwXhrNH2h8L4AAHg5ZL
 ZMl9nV1PkWAGORU1gz/IWqtZMtb+piPDQ/Fg7FvJWo909B3w9k2NfInXSano5D5Ac88z3LKzgN
 fdk=
X-SBRS: 2.7
X-MesageID: 10569359
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,406,1571716800"; d="scan'208";a="10569359"
To: Jan Beulich <jbeulich@suse.com>
References: <20200106155423.9508-1-andrew.cooper3@citrix.com>
 <20200106155423.9508-5-andrew.cooper3@citrix.com>
 <3601fa20-ba6a-78d6-62a2-a204ee49021e@suse.com>
 <e52491a3-da1e-5c86-8038-f008d181c3a8@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <31c8a309-0e3c-7244-166a-839c886fb611@citrix.com>
Date: Tue, 7 Jan 2020 18:01:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e52491a3-da1e-5c86-8038-f008d181c3a8@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 4/6] x86/boot: Clean up l?_bootmap[]
 construction
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDEvMjAyMCAxNjozMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiAgICAgIGZvciAoIGkg
PSAwOyBpIDwgODsgKytpICkKPj4+ICAgICAgewo+Pj4gICAgICAgICAgdW5zaWduZWQgaW50IHNs
b3QgPSAoeGVuX3BoeXNfc3RhcnQgPj4gTDJfUEFHRVRBQkxFX1NISUZUKSArIGk7Cj4+PiAgICAg
ICAgICBwYWRkcl90IGFkZHIgPSBzbG90IDw8IEwyX1BBR0VUQUJMRV9TSElGVDsKPj4+ICAKPj4+
ICAgICAgICAgIGwyX2lkZW50bWFwW3Nsb3RdID0gbDJlX2Zyb21fcGFkZHIoYWRkciwgUEFHRV9I
WVBFUlZJU09SfF9QQUdFX1BTRSk7Cj4+PiAtICAgICAgICBzbG90ICY9IEwyX1BBR0VUQUJMRV9F
TlRSSUVTIC0gMTsKPj4+ICAgICAgICAgIGwyX2Jvb3RtYXBbc2xvdF0gPSBsMmVfZnJvbV9wYWRk
cihhZGRyLCBfX1BBR0VfSFlQRVJWSVNPUnxfUEFHRV9QU0UpOwo+Pj4gICAgICB9Cj4+PiAtICAg
IC8qIEluaXRpYWxpc2UgTDMgYm9vdC1tYXAgcGFnZSBkaXJlY3RvcnkgZW50cmllcy4gKi8KPj4+
IC0gICAgbDNfYm9vdG1hcFtsM190YWJsZV9vZmZzZXQoeGVuX3BoeXNfc3RhcnQpXSA9Cj4+PiAt
ICAgICAgICBsM2VfZnJvbV9wYWRkcigoVUlOVE4pbDJfYm9vdG1hcCwgX19QQUdFX0hZUEVSVklT
T1IpOwo+Pj4gLSAgICBsM19ib290bWFwW2wzX3RhYmxlX29mZnNldCh4ZW5fcGh5c19zdGFydCAr
ICg4IDw8IEwyX1BBR0VUQUJMRV9TSElGVCkgLSAxKV0gPQo+Pj4gLSAgICAgICAgbDNlX2Zyb21f
cGFkZHIoKFVJTlROKWwyX2Jvb3RtYXAsIF9fUEFHRV9IWVBFUlZJU09SKTsKPj4+ICsKPj4+ICsg
ICAgLyogSW5pdGlhbGl6ZSBMMyBib290LW1hcCBwYWdlIGRpcmVjdG9yeSBlbnRyaWVzLiAqLwo+
Pj4gKyAgICBmb3IgKCBpID0gMDsgaSA8IDQ7ICsraSApCj4+PiArICAgICAgICBsM19ib290bWFw
W2ldID0gbDNlX2Zyb21fcGFkZHIoKFVJTlROKWwyX2Jvb3RtYXAgKyBpICogUEFHRV9TSVpFLAo+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fUEFHRV9IWVBFUlZJ
U09SKTsKPj4gVGhlIGlkZWEgYmVoaW5kIHRoZSBvcmlnaW5hbCBjb2RlIHdhcyB0byBiZSBpbW11
bmUgdG8gdGhlIG51bWJlcgo+PiBvZiBwYWdlcyBsMl9ib290bWFwW10gY292ZXJzLCBhcyBsb25n
IGFzIGl0J3MgYXQgbGVhc3Qgb25lICh3aGljaAo+PiBpdCdsbCBhbHdheXMgYmUsIEkgd291bGQg
c2F5KS4gVGhlIG1pbmltdW0gcmVxdWlyZW1lbnQgdG8gYW55Cj4+IGNoYW5nZSB0byB0aGlzIEkg
aGF2ZSBpcyB0aGF0IHRoZSBidWlsZCBtdXN0IGJyZWFrIGlmIHRoZSBzaXplCj4+IGFzc3VtcHRp
b24gaGVyZSBpcyB2aW9sYXRlZC4gSS5lLiB0aGVyZSBtYXkgbm90IGJlIGEgbGl0ZXJhbCA0IGFz
Cj4+IHRoZSB1cHBlciBsb29wIGJvdW5kIGhlcmUsIG9yIHRoZXJlIHdvdWxkIG5lZWQgdG8gYmUg
YQo+PiBCVUlMRF9CVUdfT04oKSByaWdodCBuZXh0IHRvIGl0LiBCdXQgSSdkIHJlYWxseSBwcmVm
ZXIgaWYgdGhlCj4+IGNvZGUgd2FzIGxlZnQgYXMgaXMgKHBlcmhhcHMgd2l0aCBhIGNvbW1lbnQg
YWRkZWQpLCB1bmxlc3MgeW91Cj4+IGNhbiBwb2ludCBvdXQgYWN0dWFsIGlzc3VlcyB3aXRoIGl0
ICh3aGljaCBJIGNhbid0IHNlZSBpbiB0aGUKPj4gZGVzY3JpcHRpb24pLCBvciB5b3UgY2FuIG90
aGVyd2lzZSBqdXN0aWZ5IHRoZSBjaGFuZ2Ugd2l0aCBiZXR0ZXIKPj4gdGhhbiAidGhlIEVGSSBz
aWRlIGlzIGZ1cnRoZXIgY29tcGxpY2F0ZWQgYnkgc3ByYXlpbmcgbm9uLWlkZW50aXR5Cj4+IGFs
aWFzZXMgaW50byB0aGUgbWl4LiIKPiBBbmQgaWYgdGhpcyBjaGFuZ2UgaXMgdG8gYmUgbWFkZSwg
d29uJ3QgaXQgbWVhbiB0aGUgY29kZSBpbiBzZXR1cC5jCj4gY29tbWVudGVkIHdpdGggIk1ha2Ug
Ym9vdCBwYWdlIHRhYmxlcyBtYXRjaCBub24tRUZJIGJvb3QiIGNhbiB0aGVuCj4gZ28gYXdheSBh
dCB0aGUgc2FtZSB0aW1lPwoKV2hlbiBJJ3ZlIGZpZ3VyZWQgb3V0IHdoeSBhbHRlcmluZyB0aGF0
IGNhdXNlcyB0aGUgRUZJIGJvb3QgdG8gZmFpbCwgeWVzCi0gdGhhdCB3YXMgdGhlIHBsYW4uLi4K
Cn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

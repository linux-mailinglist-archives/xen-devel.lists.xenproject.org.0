Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA0D186C0D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2020 14:30:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDpmR-0001U6-Ug; Mon, 16 Mar 2020 13:27:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JvoA=5B=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jDpmQ-0001U1-A7
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2020 13:27:42 +0000
X-Inumbo-ID: e92aac30-6789-11ea-b34e-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e92aac30-6789-11ea-b34e-bc764e2007e4;
 Mon, 16 Mar 2020 13:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584365261;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=z+Z78JN95rwmGFcclO26A+qe8EJ/61drwqkl/LxhNFw=;
 b=JVdHrxm4TaQheUli29Lu9GKMBgzwd7rcp81I0gGFJdrIDARwx/xnDcbC
 aypE8FaIcOpQfYwjlBImEk9G0NY195weuf7WfCzem7gAu0cEzGfnokwfo
 mQJFZu+5Ew0FZVjd+UuCwjBSDWHOvpDYZP8MrpwfSLC9qgW/f/WcGRqp2 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tQ2cczI4uVirfc0nz4W5yfdpHojveZXy3J9r8Ky8jRGpgkA8Jo3MTtbkiJYpW//24ec1b+QD16
 Ug0nIcGQ44Q8PcQsOLymHZ+ObxIPezpEhBYJkrUU9Vd111gUJAxr2MfiMTR8/fAfnSgdPY5leh
 ipO122sf3XBUqyRTBYDj0jBJ1c8dIvwu1BCfJmuaYVI6bH0OxJipq3xD7hEDoBLzVmjj51sreM
 UqD3rPhHmKswVlyjFFn+8e2wKlYbIJA2bALJ9YrHwfK7Bb9RnV/cPjDBdtBCgvDs8I/wmB1DAI
 1XU=
X-SBRS: 2.7
X-MesageID: 14668799
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,560,1574139600"; d="scan'208";a="14668799"
To: Jan Beulich <jbeulich@suse.com>
References: <60130f14-3fc5-e40d-fec6-2448fefa6fc4@suse.com>
 <9460a5f8-5b6e-bba9-79fc-dae54cc6b348@suse.com>
 <7b6e7266-7550-17c5-2edb-825e0fbf5b80@citrix.com>
 <7cdf953c-1726-0b36-0387-3a834b6c39c4@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <14a890a3-0a0e-018e-71a9-218b68c402ca@citrix.com>
Date: Mon, 16 Mar 2020 13:27:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7cdf953c-1726-0b36-0387-3a834b6c39c4@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/4] x86/time: reduce rounding errors in
 calculations
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDMvMjAyMCAwODo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTMuMDMuMjAyMCAx
NjoxNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTMvMDMvMjAyMCAwOToyNSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBQbGFpbiAodW5zaWduZWQpIGludGVnZXIgZGl2aXNpb24gc2ltcGx5
IHRydW5jYXRlcyB0aGUgcmVzdWx0cy4gVGhlCj4+PiBvdmVyYWxsIGVycm9ycyBhcmUgc21hbGxl
ciB0aG91Z2ggaWYgd2UgdXNlIHByb3BlciByb3VuZGluZy4gKEV4dGVuZAo+Pj4gdGhpcyB0byB0
aGUgcHVyZWx5IGNvc21ldGljIGFzcGVjdCBvZiB0aW1lLmMncyBmcmVxX3N0cmluZygpLCB3aGlj
aAo+Pj4gYmVmb3JlIHRoaXMgY2hhbmdlIEkndmUgZnJlcXVlbnRseSBvYnNlcnZlZCB0byByZXBv
cnQgZS5nLiBOTi45OTlNSHoKPj4+IEhQRVQgY2xvY2sgc3BlZWRzLikKPj4+Cj4+PiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+PiAtLS0KPj4+IFdlIGNv
dWxkIHN3aXRjaCBhdCBsZWFzdCB0aGUgZmlyc3QgZGl2L3JlbSBwYWlyIGluIGNhbGlicmF0ZV9B
UElDX2Nsb2NrKCkKPj4+IHRvIHVzZSBkb19kaXYoKSwgYnV0IHRoaXMgd291bGQgaW1wbHkgc3dp
dGNoaW5nIGJ1c19mcmVxIChhbmQgdGhlbiBhbHNvCj4+PiByZXN1bHQpIHRvIHVuc2lnbmVkIGlu
dCAoYXMgdGhlIGRpdmlzb3IgaGFzIHRvIGJlIDMyLWJpdCkuIFdoaWxlIEkgdGhpbmsKPj4+IHRo
ZXJlJ3MgcHJldHR5IGxpdHRsZSByaXNrIGZvciBidXMgZnJlcXVlbmNpZXMgdG8gZ28gYmV5b25k
IDRHSHogaW4gdGhlCj4+PiBuZXh0IHNvIG1hbnkgeWVhcnMsIEkgc3RpbGwgd2Fzbid0IGNlcnRh
aW4gZW5vdWdoIHRoaXMgd291bGQgYmUgYSB3ZWxjb21lCj4+PiBjaGFuZ2UuCj4+Cj4+IEhvbmVz
dGx5LCBkb19kaXYoKSBpcyB2ZXJ5IGVhc3kgdG8gZ2V0IHdyb25nIChhbmQgaW4gc2VjdXJpdHkg
cmVsZXZhbnQKPj4gd2F5cyBpbiBMaW51eCkuwqAgSSdkIGFkdm9jYXRlIGZvciBwaGFzaW5nIGl0
cyB1c2Ugb3V0LCBpcnJlc3BlY3RpdmUgb2YKPj4gdGhpcyBmcmVxdWVuY3kgY29uY2Vybi4KPj4K
Pj4gQXMgZm9yIDRHSHosIEkgdGhpbmsgaXRzIHVubGlrZWx5LCBidXQgYmV0dGVyIHRvIGJlIHNh
ZmUgaW4gdGhlIGNvZGUuCj4+Cj4+Pgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2FwaWMuYwo+Pj4g
KysrIGIveGVuL2FyY2gveDg2L2FwaWMuYwo+Pj4gQEAgLTEyNjEsNyArMTI2MSw5IEBAIHN0YXRp
YyBpbnQgX19pbml0IGNhbGlicmF0ZV9BUElDX2Nsb2NrKHYKPj4+ICAgICAgLyogc2V0IHVwIG11
bHRpcGxpZXJzIGZvciBhY2N1cmF0ZSB0aW1lciBjb2RlICovCj4+PiAgICAgIGJ1c19mcmVxICAg
PSByZXN1bHQqSFo7Cj4+PiAgICAgIGJ1c19jeWNsZSAgPSAodTMyKSAoMTAwMDAwMDAwMDAwMExM
L2J1c19mcmVxKTsgLyogaW4gcGljbyBzZWNvbmRzICovCj4+PiArICAgIGJ1c19jeWNsZSArPSAo
MTAwMDAwMDAwMDAwMFVMICUgYnVzX2ZyZXEpICogMiA+IGJ1c19mcmVxOwo+Pgo+PiBUaGVzZSB0
d28gZGlmZmVyIGluIHNpZ25lZG5lc3Mgb2YgdGhlIG51bWVyYXRvci7CoCBHQ0Mgc2VlbXMgdG8g
Y29wZSB3aXRoCj4+IGNvbWJpbmluZyB0aGUgdHdvIGludG8gYSBzaW5nbGUgZGl2IGluc3RydWN0
aW9uLCBidXQgSSB0aGluayB3ZSBzaG91bGQKPj4gYmUgY29uc2lzdGVudCB3aXRoIHRoZSBjb25z
dGFudCBuZXZlcnRoZWxlc3MuCj4gCj4gSU9XIHlvdSdkIGxpa2UgbWUgdG8gY2hhbmdlIHRoZSBv
dGhlciBsaW5lIHRvbywgdG8gaGF2ZSBhIFVMCj4gc3VmZml4PyBJZiBzbywgYXQgdGhhdCBwb2lu
dCBJJ2QgZHJvcCB0aGUgc3RyYXkgY2FzdCwgdG9vLgoKVGhhdCB3b3VsZCBiZSBmaW5lIHllcy4K
Cn5BbmRyZXcKCj4gCj4+IE90aGVyd2lzZSwgQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gCj4gVGhhbmtzLCBidXQgcGxlYXNlIGxldCBtZSBrbm93
IGlmIHRoZSBhYm92ZSBpcyBhIGNvcnJlY3QKPiB1bmRlcnN0YW5kaW5nIG9mIG1pbmUuCj4gCj4g
SmFuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

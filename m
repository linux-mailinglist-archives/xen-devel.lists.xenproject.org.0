Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A28318674C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2020 10:02:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDla1-0004BT-CM; Mon, 16 Mar 2020 08:58:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+XhT=5B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jDla0-0004BO-1b
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2020 08:58:36 +0000
X-Inumbo-ID: 50d034ca-6764-11ea-b7ce-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50d034ca-6764-11ea-b7ce-12813bfff9fa;
 Mon, 16 Mar 2020 08:58:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3E3BBAE84;
 Mon, 16 Mar 2020 08:58:33 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <60130f14-3fc5-e40d-fec6-2448fefa6fc4@suse.com>
 <9460a5f8-5b6e-bba9-79fc-dae54cc6b348@suse.com>
 <7b6e7266-7550-17c5-2edb-825e0fbf5b80@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7cdf953c-1726-0b36-0387-3a834b6c39c4@suse.com>
Date: Mon, 16 Mar 2020 09:58:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7b6e7266-7550-17c5-2edb-825e0fbf5b80@citrix.com>
Content-Language: en-US
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

T24gMTMuMDMuMjAyMCAxNjoxNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMy8wMy8yMDIw
IDA5OjI1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gUGxhaW4gKHVuc2lnbmVkKSBpbnRlZ2VyIGRp
dmlzaW9uIHNpbXBseSB0cnVuY2F0ZXMgdGhlIHJlc3VsdHMuIFRoZQo+PiBvdmVyYWxsIGVycm9y
cyBhcmUgc21hbGxlciB0aG91Z2ggaWYgd2UgdXNlIHByb3BlciByb3VuZGluZy4gKEV4dGVuZAo+
PiB0aGlzIHRvIHRoZSBwdXJlbHkgY29zbWV0aWMgYXNwZWN0IG9mIHRpbWUuYydzIGZyZXFfc3Ry
aW5nKCksIHdoaWNoCj4+IGJlZm9yZSB0aGlzIGNoYW5nZSBJJ3ZlIGZyZXF1ZW50bHkgb2JzZXJ2
ZWQgdG8gcmVwb3J0IGUuZy4gTk4uOTk5TUh6Cj4+IEhQRVQgY2xvY2sgc3BlZWRzLikKPj4KPj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiAtLS0KPj4g
V2UgY291bGQgc3dpdGNoIGF0IGxlYXN0IHRoZSBmaXJzdCBkaXYvcmVtIHBhaXIgaW4gY2FsaWJy
YXRlX0FQSUNfY2xvY2soKQo+PiB0byB1c2UgZG9fZGl2KCksIGJ1dCB0aGlzIHdvdWxkIGltcGx5
IHN3aXRjaGluZyBidXNfZnJlcSAoYW5kIHRoZW4gYWxzbwo+PiByZXN1bHQpIHRvIHVuc2lnbmVk
IGludCAoYXMgdGhlIGRpdmlzb3IgaGFzIHRvIGJlIDMyLWJpdCkuIFdoaWxlIEkgdGhpbmsKPj4g
dGhlcmUncyBwcmV0dHkgbGl0dGxlIHJpc2sgZm9yIGJ1cyBmcmVxdWVuY2llcyB0byBnbyBiZXlv
bmQgNEdIeiBpbiB0aGUKPj4gbmV4dCBzbyBtYW55IHllYXJzLCBJIHN0aWxsIHdhc24ndCBjZXJ0
YWluIGVub3VnaCB0aGlzIHdvdWxkIGJlIGEgd2VsY29tZQo+PiBjaGFuZ2UuCj4gCj4gSG9uZXN0
bHksIGRvX2RpdigpIGlzIHZlcnkgZWFzeSB0byBnZXQgd3JvbmcgKGFuZCBpbiBzZWN1cml0eSBy
ZWxldmFudAo+IHdheXMgaW4gTGludXgpLsKgIEknZCBhZHZvY2F0ZSBmb3IgcGhhc2luZyBpdHMg
dXNlIG91dCwgaXJyZXNwZWN0aXZlIG9mCj4gdGhpcyBmcmVxdWVuY3kgY29uY2Vybi4KPiAKPiBB
cyBmb3IgNEdIeiwgSSB0aGluayBpdHMgdW5saWtlbHksIGJ1dCBiZXR0ZXIgdG8gYmUgc2FmZSBp
biB0aGUgY29kZS4KPiAKPj4KPj4gLS0tIGEveGVuL2FyY2gveDg2L2FwaWMuYwo+PiArKysgYi94
ZW4vYXJjaC94ODYvYXBpYy5jCj4+IEBAIC0xMjYxLDcgKzEyNjEsOSBAQCBzdGF0aWMgaW50IF9f
aW5pdCBjYWxpYnJhdGVfQVBJQ19jbG9jayh2Cj4+ICAgICAgLyogc2V0IHVwIG11bHRpcGxpZXJz
IGZvciBhY2N1cmF0ZSB0aW1lciBjb2RlICovCj4+ICAgICAgYnVzX2ZyZXEgICA9IHJlc3VsdCpI
WjsKPj4gICAgICBidXNfY3ljbGUgID0gKHUzMikgKDEwMDAwMDAwMDAwMDBMTC9idXNfZnJlcSk7
IC8qIGluIHBpY28gc2Vjb25kcyAqLwo+PiArICAgIGJ1c19jeWNsZSArPSAoMTAwMDAwMDAwMDAw
MFVMICUgYnVzX2ZyZXEpICogMiA+IGJ1c19mcmVxOwo+IAo+IFRoZXNlIHR3byBkaWZmZXIgaW4g
c2lnbmVkbmVzcyBvZiB0aGUgbnVtZXJhdG9yLsKgIEdDQyBzZWVtcyB0byBjb3BlIHdpdGgKPiBj
b21iaW5pbmcgdGhlIHR3byBpbnRvIGEgc2luZ2xlIGRpdiBpbnN0cnVjdGlvbiwgYnV0IEkgdGhp
bmsgd2Ugc2hvdWxkCj4gYmUgY29uc2lzdGVudCB3aXRoIHRoZSBjb25zdGFudCBuZXZlcnRoZWxl
c3MuCgpJT1cgeW91J2QgbGlrZSBtZSB0byBjaGFuZ2UgdGhlIG90aGVyIGxpbmUgdG9vLCB0byBo
YXZlIGEgVUwKc3VmZml4PyBJZiBzbywgYXQgdGhhdCBwb2ludCBJJ2QgZHJvcCB0aGUgc3RyYXkg
Y2FzdCwgdG9vLgoKPiBPdGhlcndpc2UsIEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgoKVGhhbmtzLCBidXQgcGxlYXNlIGxldCBtZSBrbm93IGlmIHRo
ZSBhYm92ZSBpcyBhIGNvcnJlY3QKdW5kZXJzdGFuZGluZyBvZiBtaW5lLgoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

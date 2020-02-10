Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E22157D0F
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 15:09:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j19ha-00039U-Mq; Mon, 10 Feb 2020 14:06:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qaH/=36=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j19hZ-00039P-Ev
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 14:06:17 +0000
X-Inumbo-ID: 80d76df8-4c0e-11ea-b472-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80d76df8-4c0e-11ea-b472-bc764e2007e4;
 Mon, 10 Feb 2020 14:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581343576;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=HivllXAKN/tRw0Q57NJUWWiGO0qGDJXhfCyEW0e2/1k=;
 b=Z0Gk3TGln/hOxhqHNGiXDYCQ/scdyc5rgMkVa5X0E8TckLSzRCi026//
 yti+O6Ucc/tClxOvI2gHnf8rtQufABj2DeDrnUdRRPzt9UBZ3doy5Z6oL
 lSX1SAZljeznGmxxjDS4KN1Zk9iULi+Dgh+nLuMdYF/2EGy+Iqd8d2w0e U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: eacMoGjHeO2PFAvKKn4GNrDG6sGoubIpbnoDRr2hjiG7c0T9JMNwN1HKsn2zp2g8dyLKPgw8Fs
 Y2tNd8Gr5tHSKkRmEr+CZic5PR1v4P30MpkxoNR1hAEg68xL7+068XICXh2mqfII1wyji1h1iM
 cPtQNgLrtZhHJ6VAD8HMhD9gEouH/KKwGkN2Wbiful0IsGg5PlCJGrYBAW4+YXN57t8lpBTNZX
 6V7b8iigpAFcSTGC2m55YewrdGBe/BkJ3Ry1zyVWArX0sXMwa1GrFqpOzXkXHZLXB+lFJEkPyv
 PUc=
X-SBRS: 2.7
X-MesageID: 12574609
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,425,1574139600"; d="scan'208";a="12574609"
To: Jan Beulich <jbeulich@suse.com>
References: <20200208151939.31691-1-andrew.cooper3@citrix.com>
 <43b54452-b4e8-eaca-466b-f79480f0b2c4@suse.com>
 <cd5a5f78-8cef-88b0-51e3-9367bb7df063@citrix.com>
 <6f4fc0f8-6d3a-58f6-5a13-e9b14ca3c3cc@suse.com>
 <b9e1cc74-0d5a-53dd-3a3c-485438bb6b24@citrix.com>
 <76066c63-2536-8fac-b7b1-ee2aaae532fc@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <388ca644-ce0f-8ddd-4db2-31be232af6e6@citrix.com>
Date: Mon, 10 Feb 2020 14:06:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <76066c63-2536-8fac-b7b1-ee2aaae532fc@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] xen/pvh: Fix segment selector ABI
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMDIvMjAyMCAxNDowMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTAuMDIuMjAyMCAx
NDo1NiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTAvMDIvMjAyMCAxMzo0NywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAxMC4wMi4yMDIwIDE0OjI5LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IE9uIDEwLzAyLzIwMjAgMTM6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAw
OC4wMi4yMDIwIDE2OjE5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+Pj4gLS0tIGEvZG9jcy9t
aXNjL3B2aC5wYW5kb2MKPj4+Pj4+ICsrKyBiL2RvY3MvbWlzYy9wdmgucGFuZG9jCj4+Pj4+PiBA
QCAtMjMsNyArMjMsNyBAQCBmb2xsb3dpbmcgbWFjaGluZSBzdGF0ZToKPj4+Pj4+ICAgKiBgY3Ng
OiBtdXN0IGJlIGEgMzItYml0IHJlYWQvZXhlY3V0ZSBjb2RlIHNlZ21lbnQgd2l0aCBhIGJhc2Ug
b2Yg4oCYMOKAmQo+Pj4+Pj4gICAgIGFuZCBhIGxpbWl0IG9mIOKAmDB4RkZGRkZGRkbigJkuIFRo
ZSBzZWxlY3RvciB2YWx1ZSBpcyB1bnNwZWNpZmllZC4KPj4+Pj4+ICAKPj4+Pj4+IC0gKiBgZHNg
LCBgZXNgOiBtdXN0IGJlIGEgMzItYml0IHJlYWQvd3JpdGUgZGF0YSBzZWdtZW50IHdpdGggYSBi
YXNlIG9mCj4+Pj4+PiArICogYGRzYCwgYGVzYCwgYHNzYDogbXVzdCBiZSBhIDMyLWJpdCByZWFk
L3dyaXRlIGRhdGEgc2VnbWVudCB3aXRoIGEgYmFzZSBvZgo+Pj4+Pj4gICAgIOKAmDDigJkgYW5k
IGEgbGltaXQgb2Yg4oCYMHhGRkZGRkZGRuKAmS4gVGhlIHNlbGVjdG9yIHZhbHVlcyBhcmUgYWxs
IHVuc3BlY2lmaWVkLgo+Pj4+PiBXb3VsZG4ndCB0aGlzIHdhbnQgYWNjb21wYW55aW5nIHdpdGgg
YW4gYWRqdXN0bWVudCB0bwo+Pj4+PiB4ZW4vYXJjaC94ODYvaHZtL2RvbWFpbi5jOmNoZWNrX3Nl
Z21lbnQoKSwgd2hpY2ggcmlnaHQgbm93Cj4+Pj4+IGlzbid0IGluIGxpbmUgd2l0aCBlaXRoZXIg
b2xkIG9yIG5ldyB2ZXJzaW9uIG9mIHRoaXMgZG9jPwo+Pj4+IFdoYXQgZG8geW91IHRoaW5nIGlz
IG1pc3Npbmc/wqAgSXQgdG9vIGlzIHdyaXR0ZW4gd2l0aCB0aGUgZXhwZWN0YXRpb24gb2YKPj4+
PiAlZXMgYmVpbmcgc2V0IHVwLCB3aGljaCBJIGNoZWNrZWQgYmVmb3JlIHNlbmRpbmcgdGhpcyBw
YXRjaC4KPj4+IFRoZSBmdW5jdGlvbiBmb3IgZXhhbXBsZSBsb29rcyB0byBwZXJtaXQgemVybyBz
ZWdtZW50IGF0dHJpYnV0ZXMKPj4+IGZvciBib3RoIERTIGFuZCBFUy4gSXQgYWxzbyBsb29rcyB0
byBwZXJtaXQgbm9uLXdyaXRhYmxlCj4+PiBhdHRyaWJ1dGVzIGZvciBib3RoLCBhbmQgYSBub24t
cmVhZGFibGUgQ1MuCj4+IEl0IGlzIG5vdCBhIFBWSC1hdWRpdGluZyBmdW5jdGlvbi4KPj4KPj4g
SXQgaXMgcmVhY2hhYmxlIGZyb20gcGxhaW4gSFZNIGd1ZXN0cywgYW5kIGlzIG9ubHkgc3VwcG9z
ZWQgdG8gYmUgYQo+PiBtaW5pbXVtIHNldCBvZiBjaGVja3MgdG8gcHJldmVudCBhIHZtZW50cnkg
ZmFpbHVyZSBvZiB0aGUKPj4gbmV3bHktaW5pdGlhbGlzZWQgdmNwdSBzdGF0ZS7CoCAoV2hldGhl
ciBpdCBhY3R1YWxseSBtZWV0cyB0aGlzIGdvYWwgaXMgYQo+PiBzZXBhcmF0ZSBtYXR0ZXIuKQo+
IFdlbGwsIHRoYXQncyBmaW5lLCBidXQgd2hhdCBvdGhlciBwbGFjZSBhbSBJIG1pc3NpbmcgdGhl
biB3aGVyZSB0aGUKPiBkb2N1bWVudGVkIHJlc3RyaWN0aW9ucyBhY3R1YWxseSBnZXQgZW5mb3Jj
ZWQ/IE9yIGlmIHdlIGRvbid0IG1lYW4KPiB0byBlbmZvcmNlIHRoZW0sIHRoZW4gcGVyaGFwcyB0
aGVyZSBzaG91bGQgYmUgYSBkaXN0aW5jdGlvbiBpbiB0aGUKPiBkb2MgYmV0d2VlbiAibXVzdCIg
YW5kICJzaG91bGQiPwoKVGhlIHdyaXR0ZW4gQUJJIGlzIHRoZSBBQkkuwqAgQ29uZm9ybWluZyBp
bXBsZW1lbnRhdGlvbnMgbXVzdCAoYXMgaW4KbXVzdCkgZm9sbG93IHRoZSBydWxlcy4KClRoZSBk
b21haW4gYnVpbGRlcihzKSBhcmUgdGhlIG9ubHkgcGxhY2VzIHdoaWNoIGtub3dzIHRoYXQgdGhl
IFBWSCBzdGFydApBQkkgaXMgaW4gdXNlLgoKWGVuIGRvZXMgbm90IGtub3csIGFuZCB0aGVyZWZv
cmUgY2Fubm90IGxlZ2l0aW1hdGVseSBjaGVjay7CoCBUaGlzCmh5cGVyY2FsbCBpcyB1c2VkIGZv
ciBtb3JlIHRoYW4ganVzdCB0aGUgUFZIIHN0YXJ0aW5nIEFCSSwgc28gbXVzdCAoYXMKaXQgbXVz
dCkgbm90IGhhdmUgYW55IFBWSC1BQkkgY2hlY2tzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

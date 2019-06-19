Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA244C347
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 23:50:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdiRO-0002tD-Rv; Wed, 19 Jun 2019 21:48:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iLMg=US=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hdiRN-0002t4-11
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 21:48:25 +0000
X-Inumbo-ID: f4846900-92db-11e9-9c44-cfd45517075f
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4846900-92db-11e9-9c44-cfd45517075f;
 Wed, 19 Jun 2019 21:48:21 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ixBe3RpUyZpmb3jkbT2FsEW2H91cf7p+iTx/wOeOJq7JX/gyufnBfdn8qmzxA63rLYdewSBhqu
 0uXdpgeJrmKyEyWP+qwT2ZFy/p8gDlSFgaFzW680/Kepv3keGTsvZRZNqtpXYfhmBu1L9nTyaa
 f5TxZ3glz8yIfbkBFiHkmYQTgY3Lwvq28W1sMNUugZ4XF9hQPo1VJKVfDvfT8qudKRw4fGQ8qE
 OXcUFQeK1PYgO8N2YQA8epTKH48/oGU3vOoG2bk+AN4liK9TuTGyRSZOKPu43BW0ub4/O0FGKI
 7WI=
X-SBRS: 2.7
X-MesageID: 1963233
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,394,1557201600"; 
   d="scan'208";a="1963233"
To: Julien Grall <julien.grall@arm.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
References: <1560975087-25632-1-git-send-email-andrew.cooper3@citrix.com>
 <1560975087-25632-4-git-send-email-andrew.cooper3@citrix.com>
 <3e5cb174-d83f-e1a1-1d6e-4e0073fa9956@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <5cb62752-e2a1-444e-e3e4-98b25dcfb626@citrix.com>
Date: Wed, 19 Jun 2019 22:48:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <3e5cb174-d83f-e1a1-1d6e-4e0073fa9956@arm.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 3/4] xen/link: Fold .data.read_mostly into
 .data
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDYvMjAxOSAyMjoyOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDYvMTkvMTkgOTox
MSBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gLmRhdGEucmVhZF9tb3N0bHkgb25seSBuZWVk
cyBzZXBhcmF0aW5nIGZyb20gYWRqYWNlbnQgZGF0YSBieSBvbmUKPj4gY2FjaGUgbGluZQo+PiB0
byBiZSBlZmZlY3RpdmUsIGFuZCBwbGFjaW5nIGl0IGFkamFjZW50IHRvIC5kYXRhLnBhZ2VfYWxp
Z25lZAo+PiBmdWxmaWxscyB0aGlzCj4+IHJlcXVpcmVtZW50Lgo+Pgo+PiBGb3IgQVJNLCAuZXhf
dGFibGUgYXBwZWFycyB0byBiZSBhIHZlc3RpZ2lhbCByZW1uYW50LsKgIE5vdGhpbmcgaW4gdGhl
Cj4+IHJlc3VsdGluZyBidWlsZCBldmVyIGluc3BlY3RzIG9yIGFjdHMgb24gdGhlIGNvbnRlbnRz
IG9mIHRoZSB0YWJsZS7CoAo+PiBUaGUgYXJtMzIKPj4gYnVpbGQgZG9lcyBob3dldmVyIGhhdmUg
c29tZSBhc3NlbWJseSByb3V0aW5lcyB3aGljaCBmaWxsIC5leF90YWJsZS4KPj4KPj4gRHJvcCBh
bGwgb2YgQVJNJ3MgLmV4X3RhYmxlIGluZnJhc3RydWN0dXJlLCB0byByZWR1Y2UgdGhlIHNpemUg
b2YgdGhlCj4+IGNvbXBpbGVkCj4+IGJpbmFyeSwgYW5kIGF2b2lkIGdpdmluZyB0aGUgaWxsdXNp
b24gb2YgZXhjZXB0aW9uIGhhbmRsaW5nIHdvcmtpbmcuCj4KPiBJIGFtIG5vdCBpbiBmYXZvciBv
ZiB0aGlzIGNoYW5nZS4gYXNzZW1ibGVyLmggaXMgbWVhbnQgdG8gYmUgYQo+IHZlcmJhdGltIGNv
cHkgb2YgdGhlIExpbnV4IGNvdW50ZXJwYXJ0LgoKV2hhdCBhbHRlcm5hdGl2ZSBkbyB5b3UgcHJv
cG9zZSB0aGVuLCBiZWNhdXNlIGhhdmluZyBpbmZyYXN0cnVjdHVyZSB0aGF0CmdpdmVzIHRoZSBp
bGx1c2lvbiBvZiBleGNlcHRpb24gcmVjb3Zlcnkgd29ya2luZyBpcyBhIGZhciB3b3JzZSBvcHRp
b24KdGhhbiBkZXZpYXRpbmcgZnJvbSBMaW51eC4KCj4KPiBbLi4uXQo+Cj4+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0veGVuLmxkcy5TIGIveGVuL2FyY2gvYXJtL3hlbi5sZHMuUwo+PiBpbmRl
eCAyYjQ0ZTVkLi4zZGM1MTE3IDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC9hcm0veGVuLmxkcy5T
Cj4+ICsrKyBiL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMKPj4gQEAgLTk0LDI3ICs5NCwxMyBAQCBT
RUNUSU9OUwo+PiDCoMKgwqAgX2Vyb2RhdGEgPSAuO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAvKiBFbmQgb2YgcmVhZC1vbmx5IGRhdGEgKi8KPj4gwqAgwqDCoMKgIC5kYXRhIDoge8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIERhdGEgKi8KPj4gK8KgwqDC
oMKgwqDCoCAqKC5kYXRhLnJlYWRfbW9zdGx5KQo+Cj4gQmVmb3JlLCAuZGF0YS5yZWFkX21vc3Rs
eSB3YXMgU01QX0NBQ0hFX0JZVEVTIGFsaWduZWQuIE5vdywgaXQgc2VlbXMKPiB0aGVyZSBhcmUg
bm8gYWxpZ25tZW50Lgo+Cj4gVGhpcyBtYXkgZW5kIHVwIHRvIGhhdmUgX2Vyb2RhdGEgYW5kIC5k
YXRhLnJlYWRfbW9zdGx5IHRvIGJlIHBhcnQgb2YKPiB0aGUgc2FtZSBwYWdlLiBBcyBBcm0gZW5m
b3JjZSByZWFkLW9ubHksIHlvdSBtYXkgY3Jhc2ggb24gYWNjZXNzIHRvCj4gLmRhdGEucmVhZF9t
b3N0bHkuCj4KPiBTbyBJIHRoaW5rIHlvdSBoYXZlCj4gLiA9IEFMSUdOKFBBR0VfU0laRSkKPiAq
KC5kYXRhLnJlYWRfbW9zdGx5KQo+IC5hbGlnbihTTVBfQ0FDSEVfQllURVMpLgoKVGhlc2UgYm90
aCBuZWVkIHRvIGJlIFBBR0VfU0laRSwgb3IgLmRhdGEucGFnZV9hbGlnbmVkIGNhbiBlbmQgdXAg
aGF2aW5nCnByb2JsZW1zLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==

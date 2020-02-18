Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C753162586
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 12:31:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j413F-00011o-Je; Tue, 18 Feb 2020 11:28:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=u3z7=4G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j413E-00011i-Qa
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 11:28:28 +0000
X-Inumbo-ID: c801b4de-5241-11ea-8156-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c801b4de-5241-11ea-8156-12813bfff9fa;
 Tue, 18 Feb 2020 11:28:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5EDA3B18F;
 Tue, 18 Feb 2020 11:28:26 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200217184324.73762-1-roger.pau@citrix.com>
 <20200217184324.73762-6-roger.pau@citrix.com>
 <8faffe76-2ab2-170a-4d42-228254fc57ed@citrix.com>
 <20200218111039.GS4679@Air-de-Roger>
 <1071be16-b929-a251-f2f9-a55d40ce2e53@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <14cd7c7a-85ac-6a6a-36ce-4df5a80c6a1f@suse.com>
Date: Tue, 18 Feb 2020 12:28:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1071be16-b929-a251-f2f9-a55d40ce2e53@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 5/6] x86/smp: use a dedicated scratch
 cpumask in send_IPI_mask
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Sander Eikelenboom <linux@eikelenboom.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDIuMjAyMCAxMjoyMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOC8wMi8yMDIw
IDExOjEwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+PiBPbiBUdWUsIEZlYiAxOCwgMjAyMCBh
dCAxMDo1Mzo0NUFNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gT24gMTcvMDIvMjAy
MCAxODo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4+IEBAIC02Nyw3ICs2OCwyMCBAQCBz
dGF0aWMgdm9pZCBzZW5kX0lQSV9zaG9ydGN1dCh1bnNpZ25lZCBpbnQgc2hvcnRjdXQsIGludCB2
ZWN0b3IsCj4+Pj4gIHZvaWQgc2VuZF9JUElfbWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGlu
dCB2ZWN0b3IpCj4+Pj4gIHsKPj4+PiAgICAgIGJvb2wgY3B1c19sb2NrZWQgPSBmYWxzZTsKPj4+
PiAtICAgIGNwdW1hc2tfdCAqc2NyYXRjaCA9IHRoaXNfY3B1KHNjcmF0Y2hfY3B1bWFzayk7Cj4+
Pj4gKyAgICBjcHVtYXNrX3QgKnNjcmF0Y2ggPSB0aGlzX2NwdShzZW5kX2lwaV9jcHVtYXNrKTsK
Pj4+PiArICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4+Pj4gKwo+Pj4+ICsgICAgaWYgKCBpbl9t
YygpIHx8IGluX25taSgpICkKPj4+PiArICAgIHsKPj4+PiArICAgICAgICAvKgo+Pj4+ICsgICAg
ICAgICAqIFdoZW4gaW4gI01DIG9yICNNTkkgY29udGV4dCBYZW4gY2Fubm90IHVzZSB0aGUgcGVy
LUNQVSBzY3JhdGNoIG1hc2sKPj4+PiArICAgICAgICAgKiBiZWNhdXNlIHdlIGhhdmUgbm8gd2F5
IHRvIGF2b2lkIHJlZW50cnksIHNvIGRvIG5vdCB1c2UgdGhlIEFQSUMKPj4+PiArICAgICAgICAg
KiBzaG9ydGhhbmQuCj4+Pj4gKyAgICAgICAgICovCj4+Pj4gKyAgICAgICAgYWx0ZXJuYXRpdmVf
dmNhbGwoZ2VuYXBpYy5zZW5kX0lQSV9tYXNrLCBtYXNrLCB2ZWN0b3IpOwo+Pj4+ICsgICAgICAg
IHJldHVybjsKPj4+IFRoZSBzZXQgb2YgdGhpbmdzIHlvdSBjYW4gc2FmZWx5IGRvIGluIGFuIE5N
SS9NQ0UgaGFuZGxlciBpcyBzbWFsbCwgYW5kCj4+PiBkb2VzIG5vdCBpbmNsdWRlIHNlbmRpbmcg
SVBJcy7CoCAoSW4gcmVhbGl0eSwgaWYgeW91J3JlIHVzaW5nIHgyYXBpYywgaXQKPj4+IGlzIHNh
ZmUgdG8gc2VuZCBhbiBJUEkgYmVjYXVzZSB0aGVyZSBpcyBubyByaXNrIG9mIGNsb2JiZXJpbmcg
SUNSMgo+Pj4gYmVoaW5kIHlvdXIgb3V0ZXIgY29udGV4dCdzIGJhY2spLgo+Pj4KPj4+IEhvd2V2
ZXIsIGlmIHdlIGVzY2FsYXRlIGZyb20gTk1JL01DRSBjb250ZXh0IGludG8gY3Jhc2ggY29udGV4
dCwgdGhlbgo+Pj4gYW55dGhpbmcgZ29lcy7CoCBJbiByZWFsaXR5LCB3ZSBvbmx5IGV2ZXIgc2Vu
ZCBOTUlzIGZyb20gdGhlIGNyYXNoIHBhdGgsCj4+PiBhbmQgdGhhdCBpcyBub3QgcGVybWl0dGVk
IHRvIHVzZSBhIHNob3J0aGFuZCwgbWFraW5nIHRoaXMgY29kZSBkZWFkLgo+PiBUaGlzIHdhcyBy
ZXF1ZXN0ZWQgYnkgSmFuLCBhcyBzYWZldHkgbWVhc3VyZQo+IAo+IFRoYXQgbWF5IGJlLCBidXQg
aXQgZG9lc24ndCBtZWFuIGl0IGlzIGNvcnJlY3QuwqAgSWYgZXhlY3V0aW9uIGV2ZXIKPiBlbnRl
cnMgdGhpcyBmdW5jdGlvbiBpbiBOTUkvTUNFIGNvbnRleHQsIHRoZXJlIGlzIGEgcmVhbCwKPiBz
dGF0ZS1jb3JydXB0aW5nIGJ1ZywgaGlnaGVyIHVwIHRoZSBjYWxsIHN0YWNrLgoKQmVzaWRlcyB0
aGUgaXNzdWUgb2YgYW55IGxvY2tzIG5lZWRpbmcgdGFraW5nIG9uIHN1Y2ggcGF0aHMgKHdoaWNo
Cm11c3Qgbm90IGhhcHBlbiBpbiBOTUkvI01DIGNvbnRleHQpLCB0aGUgb25seSB0aGluZyBnZXR0
aW5nIGluIHRoZQp3YXkgb2YgSVBJIHNlbmRpbmcgaXMgLSBhZmFpY3MgLSBJQ1IyLCB3aGljaCBj
b3VsZCBiZSBzYXZlZCAvCnJlc3RvcmVkIGFyb3VuZCBzdWNoIG9wZXJhdGlvbnMuIFRoYXQgc2Fp
ZCwgQlVHKClpbmcgb3IgcGFuaWMoKWluZwppZiB3ZSBnZXQgaW4gaGVyZSBmcm9tIHN1Y2ggYSBj
b250ZXh0IHdvdWxkIGFsc28gYmUgc3VmZmljaWVudCB0bwpzYXRpc2Z5IHRoZSAic2FmZXR5IG1l
YXN1cmUiIGFzcGVjdC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D5A140EF4
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 17:27:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isUQr-0006gl-OY; Fri, 17 Jan 2020 16:25:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1isUQq-0006gg-Sx
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 16:25:12 +0000
X-Inumbo-ID: edd97e40-3945-11ea-b589-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id edd97e40-3945-11ea-b589-12813bfff9fa;
 Fri, 17 Jan 2020 16:25:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 09950AAC2;
 Fri, 17 Jan 2020 16:25:09 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200117150948.45014-1-roger.pau@citrix.com>
 <27d19d98-2209-8add-c66c-e06e51834172@suse.com>
 <20200117160822.GT11756@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e65506b5-4795-201a-fb5c-a14acb0181ad@suse.com>
Date: Fri, 17 Jan 2020 17:25:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200117160822.GT11756@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/apic: fix disabling LVT0 in
 disconnect_bsp_APIC
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
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAyMCAxNzowOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIEph
biAxNywgMjAyMCBhdCAwNDo1NjowMFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MTcuMDEuMjAyMCAxNjowOSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gVGhlIEludGVsIFNE
TSBzdGF0ZXM6Cj4+Pgo+Pj4gIldoZW4gYW4gaWxsZWdhbCB2ZWN0b3IgdmFsdWUgKDAgdG8gMTUp
IGlzIHdyaXR0ZW4gdG8gYSBMVlQgZW50cnkgYW5kCj4+PiB0aGUgZGVsaXZlcnkgbW9kZSBpcyBG
aXhlZCAoYml0cyA4LTExIGVxdWFsIDApLCB0aGUgQVBJQyBtYXkgc2lnbmFsIGFuCj4+PiBpbGxl
Z2FsIHZlY3RvciBlcnJvciwgd2l0aG91dCByZWdhcmQgdG8gd2hldGhlciB0aGUgbWFzayBiaXQg
aXMgc2V0IG9yCj4+PiB3aGV0aGVyIGFuIGludGVycnVwdCBpcyBhY3R1YWxseSBzZWVuIG9uIHRo
ZSBpbnB1dC4iCj4+Pgo+Pj4gQW5kIHRoYXQncyBleGFjdGx5IHdoYXQncyBjdXJyZW50bHkgZG9u
ZSBpbiBkaXNjb25uZWN0X2JzcF9BUElDIHdoZW4KPj4+IHZpcnRfd2lyZV9zZXR1cCBpcyB0cnVl
IGFuZCBMVlQgTElOVDAgaXMgYmVpbmcgbWFza2VkLiBCeSB3cml0aW5nIG9ubHkKPj4+IEFQSUNf
TFZUX01BU0tFRCBYZW4gaXMgYWN0dWFsbHkgc2V0dGluZyB0aGUgdmVjdG9yIHRvIDAgYW5kIHRo
ZQo+Pj4gZGVsaXZlcnkgbW9kZSB0byBGaXhlZCAoMCksIGFuZCBoZW5jZSBpdCB0cmlnZ2VycyBh
biBBUElDIGVycm9yIGV2ZW4KPj4+IHdoZW4gdGhlIExWVCBlbnRyeSBpcyBtYXNrZWQuCj4+Cj4+
IEJ1dCB0aGVyZSBhcmUgbWFueSBtb3JlIGluc3RhbmNlcyB3aGVyZSB3ZSAoaGF2ZSBhIHJpc2sg
dG8pIGRvIHNvLAo+PiBtb3N0IG5vdGFibHkgaW4gY2xlYXJfbG9jYWxfQVBJQygpLiBUaGUgdHdv
IHN0ZXAgbG9naWMgdGhlcmUgaXMKPj4gYW55d2F5IHNvbWV3aGF0IGluIGNvbmZsaWN0IHdpdGgg
dGhlIGNpdGF0aW9uIGFib3ZlLgo+IAo+IGNsZWFyX2xvY2FsX0FQSUMgbWFza3MgdGhlIGVycm9y
IHZlY3RvciBiZWZvcmUgZG9pbmcgYW55IHdyaXRlLCBhbmQKPiBjbGVhcnMgRVNSIGFmdGVyd2Fy
ZHMsIHRoZXJlJ3MgYSBjb21tZW50IGF0IHRoZSB0b3A6Cj4gCj4gIk1hc2tpbmcgYW4gTFZUIGVu
dHJ5IG9uIGEgUDYgY2FuIHRyaWdnZXIgYSBsb2NhbCBBUElDIGVycm9yCj4gaWYgdGhlIHZlY3Rv
ciBpcyB6ZXJvLiBNYXNrIExWVEVSUiBmaXJzdCB0byBwcmV2ZW50IHRoaXMuIgo+IAo+IFdlIGNv
dWxkIGRvIHRoZSBzYW1lIChpZTogbWFzayBMVlRFUlIgZmlyc3QgYW5kIGNsZWFyIEVTUiBhZnRl
cndhcmRzKQo+IGlmIHRoYXQgc2VlbXMgcHJlZmVyYWJsZS4gVGhlcmUncyBhIG1heGx2dCBjaGVj
ayBpbiBjbGVhcl9sb2NhbF9BUElDLAo+IGJ1dCB0aGUgc2RtIGRvZXNuJ3Qgc3BlY2lmeSBhbnl3
YXkgdG8gY2hlY2sgaWYgdGhlIGxhcGljIHdpbGwgYWNjZXB0IGEKPiBtYXNrZWQgdmVjdG9yIDAg
d3JpdGUgb3Igbm90LCBzbyBub3Qgc3VyZSB3aGV0aGVyIHdlIHNob3VsZCByZXBsaWNhdGUKPiB0
aGF0IGNoZWNrIG9yIGp1c3QgZG8gaXQgdW5jb25kaXRpb25hbGx5IG9uIGJvdGggZGlzY29ubmVj
dF9ic3BfQVBJQwo+IGFuZCBjbGVhcl9sb2NhbF9BUElDLgoKSSB0aGluayBkb2luZyBpdCB0aGUg
bW9zdCBjYXJlZnVsIHdheSBpcyBnb2luZyB0byBiZSBiZXN0LiBJIGZpbmQgaXQKc3VycHJpc2lu
ZyBhbnl3YXkgdGhhdCBkaXNjb25uZWN0X2JzcF9BUElDKCkgZG9lc24ndCB3cml0ZSBMVlRFUlIK
KG9yIG90aGVyIExWVHMgZXhjZXB0IGZvciBMVlQxKSBhdCBhbGwuIFRoZSBmdW5jdGlvbiBsb29r
cyB0byBoYXZlIGEKZ29hbCBvZiBwdXR0aW5nIHRoZSBBUElDIGJhY2sgaW50byB0aGUgc3RhdGUg
dGhhdCB3ZSBmb3VuZCBpdCB3aGVuCmJvb3RpbmcuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

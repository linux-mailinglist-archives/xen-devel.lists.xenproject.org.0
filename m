Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D40612808C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 17:22:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiL0Q-0001UU-62; Fri, 20 Dec 2019 16:19:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiL0O-0001UP-IU
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 16:19:56 +0000
X-Inumbo-ID: 8a2e66d8-2344-11ea-a1e1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a2e66d8-2344-11ea-a1e1-bc764e2007e4;
 Fri, 20 Dec 2019 16:19:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A21FAB15F;
 Fri, 20 Dec 2019 16:19:46 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <7f7a6ba3-7308-b079-2df1-f5b8501b3cc6@suse.com>
 <87154c20-c60e-a215-f7f4-0290fadd90e4@suse.com>
 <dbc03c9d-bfc2-3313-1ffe-8ffe79b2c1e1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <97c93132-8037-3e41-52ca-1afc2444f0b4@suse.com>
Date: Fri, 20 Dec 2019 17:20:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <dbc03c9d-bfc2-3313-1ffe-8ffe79b2c1e1@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/5] x86emul: disable FPU/MMX/SIMD insn
 emulation when !HVM
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

T24gMjAuMTIuMjAxOSAxNzowMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMC8xMi8yMDE5
IDEzOjQxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gSW4gYSBwdXJlIFBWIGVudmlyb25tZW50ICh0
aGUgUFYgc2hpbSBpbiBwYXJ0aWN1bGFyKSB3ZSBkb24ndCByZWFsbHkKPj4gbmVlZCBlbXVsYXRp
b24gb2YgYWxsIHRoZXNlLiBUbyBsaW1pdCAjaWZkZWYtYXJ5IHV0aWxpemUgc29tZSBvZiB0aGUK
Pj4gQ0FTRV8qKCkgbWFjcm9zIHdlIGhhdmUsIGJ5IHByb3ZpZGluZyB2YXJpYW50cyBleHBhbmRp
bmcgdG8KPj4gKGVmZmVjdGl2ZWx5KSBub3RoaW5nIChyZWFsbHkgYSBsYWJlbCwgd2hpY2ggaW4g
dHVybiByZXF1aXJlcyBwYXNzaW5nCj4+IC1Xbm8tdW51c2VkLWxhYmVsIHRvIHRoZSBjb21waWxl
ciB3aGVuIGJ1aWxkIHN1Y2ggY29uZmlndXJhdGlvbnMpLgo+Pgo+PiBEdWUgdG8gdGhlIG1peHR1
cmUgb2YgbWFjcm8gYW5kICNpZmRlZiB1c2UsIHRoZSBwbGFjZW1lbnQgb2Ygc29tZSBvZgo+PiB0
aGUgI2lmZGVmLXMgaXMgYSBsaXR0bGUgYXJiaXRyYXJ5Lgo+Pgo+PiBUaGUgcmVzdWx0aW5nIG9i
amVjdCBmaWxlJ3MgLnRleHQgaXMgbGVzcyB0aGFuIGhhbGYgdGhlIHNpemUgb2YgdGhlCj4+IG9y
aWdpbmFsLCBhbmQgbG9va3MgdG8gYWxzbyBiZSBjb21waWxpbmcgYSBsaXR0bGUgbW9yZSBxdWlj
a2x5Lgo+Pgo+PiBUaGlzIGlzIG1lYW50IGFzIGEgZmlyc3Qgc3RlcDsgbW9yZSBwYXJ0cyBjYW4g
bGlrZWx5IGJlIGRpc2FibGVkIGRvd24KPj4gdGhlIHJvYWQuCj4gCj4gUHJlc3VtYWJseSB3ZSBj
YW4gZHJvcCBldmVyeXRoaW5nIGJ1dCB0aGUgb25lYnl0ZSBhbmQgdHdvYnl0ZSB0YWJsZXMsCj4g
YW5kIFZFWC9FVkVYIHByZWZpeCBwYXJzaW5nIGxvZ2ljPwoKRGVwZW5kcyBvbiB3aGF0IHdlIGV4
cGVjdCBWRVgtZW5jb2RlZCBHUFIgaW5zbnMgdG8gYmUgdXNlZCBvbi4KSSB3b3VsZG4ndCB3YW50
IHRvIGZvcmJpZCB0aGVpciB1c2Ugb24gTU1JTywgZm9yIGV4YW1wbGUuIEkgZGlkCmFjdHVhbGx5
IHRha2UgYSBmZXcgaW5pdGlhbCBzdGVwcyB0byBoaWRlIHRoZSBFVkVYIHBhcnNpbmcKYmVoaW5k
IGFuICNpZmRlZiwgYnV0IHNvbWV0aGluZyB0aGVuIG1hZGUgbWUgdW5kbyB0aGlzIGF0IGxlYXN0
CmZvciBub3cgKEkgZG9uJ3QgcmVjYWxsIHdoYXQgZXhhY3RseSBpdCB3YXMpLgoKPj4gLS0tIGEv
eGVuL2FyY2gveDg2L01ha2VmaWxlCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+PiBA
QCAtNzksNiArNzksOSBAQCBvYmoteSArPSBocGV0Lm8KPj4gIG9iai15ICs9IHZtX2V2ZW50Lm8K
Pj4gIG9iai15ICs9IHhzdGF0ZS5vCj4+ICAKPj4gK2lmbmVxICgkKENPTkZJR19IVk0pLHkpCj4+
ICt4ODZfZW11bGF0ZS5vOiBDRkxBR1MgKz0gLVduby11bnVzZWQtbGFiZWwKPj4gK2VuZGlmCj4+
ICB4ODZfZW11bGF0ZS5vOiB4ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jIHg4Nl9lbXVsYXRlL3g4
Nl9lbXVsYXRlLmgKPj4gIAo+PiAgZWZpLXkgOj0gJChzaGVsbCBpZiBbICEgLXIgJChCQVNFRElS
KS9pbmNsdWRlL3hlbi9jb21waWxlLmggLW8gXAo+PiAtLS0gYS94ZW4vYXJjaC94ODYveDg2X2Vt
dWxhdGUuYwo+PiArKysgYi94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUuYwo+PiBAQCAtNDIsNiAr
NDIsMTIgQEAKPj4gICAgICB9ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+PiAgfSkKPj4gIAo+PiArI2lmbmRlZiBDT05GSUdfSFZNCj4+ICsj
IGRlZmluZSBYODZFTVVMX05PX0ZQVQo+PiArIyBkZWZpbmUgWDg2RU1VTF9OT19NTVgKPj4gKyMg
ZGVmaW5lIFg4NkVNVUxfTk9fU0lNRAo+PiArI2VuZGlmCj4gCj4gLi4uIGlzbid0IHRoaXMgZ29p
bmcgdG8gY2F1c2UgcHJvYmxlbXMgZm9yIHRoZSBlbXVsYXRvci9mdXp6ZXIgYnVpbGRzPwoKTm8s
IHRoaXMgZmlsZSBkb2Vzbid0IGdldCB1c2VkIGJ5IHRoZW0uIFRoYXQncyB3aHkgSSBwbGFjZWQg
dGhlc2UKaGVyZSwgcmF0aGVyIHRoYW4gZS5nLiBpbiB4ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5o
IG9yIGluCng4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMgaXRzZWxmLgoKPiBPbiB0aGF0IHN1Ympl
Y3QsIGl0IHdvdWxkIGJlIHZlcnkgaGVscGZ1bCB0byBhdCBsZWFzdCBiZSBhYmxlIHRvCj4gY29u
ZmlndXJlIHJlZHVjZWQgYnVpbGRzIGZyb20gdGhlc2UgdXRpbGl0aWVzLgoKWWVzLCBJIHRvbyBo
YXZlIGJlZW4gdGhpbmtpbmcgdGhpcyB3YXkuIEkgbWF5IGdldCB0aGVyZSBldmVudHVhbGx5LgoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

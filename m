Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1CE10430A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 19:11:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXUOl-0002Es-JO; Wed, 20 Nov 2019 18:08:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zo+T=ZM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iXUOk-0002En-B2
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 18:08:14 +0000
X-Inumbo-ID: b761b16e-0bc0-11ea-a31b-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b761b16e-0bc0-11ea-a31b-12813bfff9fa;
 Wed, 20 Nov 2019 18:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574273293;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=34Cz75JTquL/MoNspNyxL6F3kb+jvPCtt7NL7o1llPA=;
 b=Sjd5T5P48Td+zA4CPyBNPFNkdfp8lZtnjYuUVb104bKs/+0IRZr7+zxw
 E22azlhB46j8phid6h3FCKDKsdBVHv5SxCjyNdu+eBY2bHIuaE0Wu1bdB
 03fGp2Ewp8xXx+vSham6/mNSkNvHhfgEAif/S4sHlSKNgmWFjeuPw8kca I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iBHWHljSCfLtvxuA0HnZFPwi2DGxfUfYKN5GfYZ6x4V8TW/vpej2KIumdv2e1VPFIrjmDN/Ok6
 3E8tOtDHHPOv9+WiSh5dGK8gxlrxp10RLtweqagMjErugOD+dufwIxb7DuhRjE6t5qIvaBPeKW
 5Y/3XX9ZDicIZYi126AmO3ELbM9d0hRDnZBHSNgPW+XVqFNyLeOQ0UMjAJGsrtO+rMYj3upiFS
 svifmo0OfYSYuhpqKAry/kDkukY6XMp4lY2sdFNOAJUOrz3Vm2Q91Gvc109b7jt2EJiZIy9pQ7
 Zdg=
X-SBRS: 2.7
X-MesageID: 8729216
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,222,1571716800"; 
   d="scan'208";a="8729216"
To: Jan Beulich <jbeulich@suse.com>
References: <7e28eb9e-f15a-af61-aad5-1ea80876fbe3@suse.com>
 <41a60a35-3413-5e33-47ea-60a8864224e1@suse.com>
 <4c2222e1-23b7-609d-1a72-7ee193182815@suse.com>
 <cb0c6279-278f-e037-53ef-e5514742842e@citrix.com>
 <5f8f7f52-8d9e-5882-8ee4-5205a9c1a79d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <e66284d9-b1e3-f6ad-dd5f-9823f9a50368@citrix.com>
Date: Wed, 20 Nov 2019 18:08:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5f8f7f52-8d9e-5882-8ee4-5205a9c1a79d@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Ping: [PATCH v2] build: provide option to
 disambiguate symbol names
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
Cc: Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, KonradWilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAvMTEvMjAxOSAxNzoxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjAuMTEuMjAxOSAx
ODoxMywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjAvMTEvMjAxOSAxNjo0MCwgSsO8cmdl
biBHcm/DnyB3cm90ZToKPj4+IE9uIDIwLjExLjE5IDE3OjMwLCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4+PiBPbiAwOC4xMS4yMDE5IDEyOjE4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gVGhlIC5m
aWxlIGFzc2VtYmxlciBkaXJlY3RpdmVzIGdlbmVyYXRlZCBieSB0aGUgY29tcGlsZXIgZG8gbm90
IGluY2x1ZGUKPj4+Pj4gYW55IHBhdGggY29tcG9uZW50cyAoZ2NjKSBvciBqdXN0IHRoZSBvbmVz
IHNwZWNpZmllZCBvbiB0aGUgY29tbWFuZAo+Pj4+PiBsaW5lCj4+Pj4+IChjbGFuZywgYXQgbGVh
c3QgdmVyc2lvbiA1KSwgYW5kIGhlbmNlIG11bHRpcGxlIGlkZW50aWNhbGx5IG5hbWVkCj4+Pj4+
IHNvdXJjZQo+Pj4+PiBmaWxlcyAoaW4gZGlmZmVyZW50IGRpcmVjdG9yaWVzKSBtYXkgcHJvZHVj
ZSBpZGVudGljYWxseSBuYW1lZCBzdGF0aWMKPj4+Pj4gc3ltYm9scyAoaW4gdGhlaXIga2FsbHN5
bXMgcmVwcmVzZW50YXRpb24pLiBUaGUgYmluYXJ5IGRpZmZpbmcKPj4+Pj4gYWxnb3JpdGhtCj4+
Pj4+IHVzZWQgYnkgeGVuLWxpdmVwYXRjaCwgaG93ZXZlciwgZGVwZW5kcyBvbiBoYXZpbmcgdW5p
cXVlIHN5bWJvbHMuCj4+Pj4+Cj4+Pj4+IE1ha2UgdGhlIEVORk9SQ0VfVU5JUVVFX1NZTUJPTFMg
S2NvbmZpZyBvcHRpb24gY29udHJvbCB0aGUgKGJ1aWxkKQo+Pj4+PiBiZWhhdmlvciwgYW5kIGlm
IGVuYWJsZWQgdXNlIG9iamNvcHkgdG8gcHJlcGVuZCB0aGUgKHJlbGF0aXZlIHRvIHRoZQo+Pj4+
PiB4ZW4vIHN1YmRpcmVjdG9yeSkgcGF0aCB0byB0aGUgY29tcGlsZXIgaW52b2tlZCBTVFRfRklM
RSBzeW1ib2xzLiBOb3RlCj4+Pj4+IHRoYXQgdGhpcyBidWlsZCBvcHRpb24gaXMgbWFkZSBubyBs
b25nZXIgZGVwZW5kIG9uIExJVkVQQVRDSCwgYnV0Cj4+Pj4+IG1lcmVseQo+Pj4+PiBkZWZhdWx0
cyB0byBpdHMgc2V0dGluZyBub3cuCj4+Pj4+Cj4+Pj4+IENvbmRpdGlvbmFsaXplIGV4cGxpY2l0
IC5maWxlIGRpcmVjdGl2ZSBpbnNlcnRpb24gaW4gQyBmaWxlcyB3aGVyZSBpdAo+Pj4+PiBleGlz
dHMganVzdCB0byBkaXNhbWJpZ3VhdGUgbmFtZXMgaW4gYSBsZXNzIGdlbmVyaWMgbWFubmVyOyBu
b3RlIHRoYXQKPj4+Pj4gYXQgdGhlIHNhbWUgdGltZSB0aGUgcmVkdW5kYW50IGVtaXNzaW9uIG9m
IFNUVF9GSUxFIHN5bWJvbHMgZ2V0cwo+Pj4+PiBzdXBwcmVzc2VkIGZvciBjbGFuZy4gQXNzZW1i
bGVyIGZpbGVzIGFzIHdlbGwgYXMgbXVsdGlwbHkgY29tcGlsZWQgQwo+Pj4+PiBvbmVzIHVzaW5n
IF9fT0JKRUNUX0ZJTEVfXyBhcmUgbGVmdCBhbG9uZSBmb3IgdGhlIHRpbWUgYmVpbmcuCj4+Pj4+
Cj4+Pj4+IFNpbmNlIHdlIG5vdyBleHBlY3QgdGhlcmUgbm90IHRvIGJlIGFueSBkdXBsaWNhdGVz
IGFueW1vcmUsIGFsc28gZG9uJ3QKPj4+Pj4gZm9yY2UgdGhlIHNlbGVjdGlvbiBvZiB0aGUgb3B0
aW9uIHRvICduJyBhbnltb3JlIGluIGFsbHJhbmRvbS5jb25maWcuCj4+Pj4+IFNpbWlsYXJseSBD
T1ZFUkFHRSBubyBsb25nZXIgc3VwcHJlc3NlcyBkdXBsaWNhdGUgc3ltYm9sIHdhcm5pbmdzIGlm
Cj4+Pj4+IGVuZm9yY2VtZW50IGlzIGluIGVmZmVjdCwgd2hpY2ggaW4gdHVybiBhbGxvd3MKPj4+
Pj4gU1VQUFJFU1NfRFVQTElDQVRFX1NZTUJPTF9XQVJOSU5HUyB0byBzaW1wbHkgZGVwZW5kIG9u
Cj4+Pj4+ICFFTkZPUkNFX1VOSVFVRV9TWU1CT0xTLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Pj4gSSd2ZSBnb3QgYWNrcyBmcm9t
IEtvbnJhZCBhbmQgV2VpLCBidXQgc3RpbGwgbmVlZCBhbiB4ODYgYW5kIGEgcmVsZWFzZQo+Pj4+
IG9uZSBoZXJlLiBBbmRyZXc/IE9yIGFsdGVybmF0aXZlbHkgLSBKw7xyZ2VuLCB3b3VsZCB5b3Ug
cmF0aGVyIG5vdCBzZWUKPj4+PiB0aGlzIGdvIGluIGFueW1vcmU/Cj4+PiBJbiBjYXNlIHRoZSBu
ZWVkZWQgeDg2IEFjayBpcyBjb21pbmcgaW4gYmVmb3JlIFJDMyBJJ20gZmluZSB0byBnaXZlIG15
Cj4+PiBSZWxlYXNlLWFjaywgYnV0IEknbSBoZXNpdGFudCB0byB0YWtlIGl0IGxhdGVyLgo+PiBI
YXMgYW55b25lIGFjdHVhbGx5IHRyaWVkIGJ1aWxkaW5nIGEgbGl2ZXBhdGNoIHdpdGggdGhpcyBj
aGFuZ2UgaW4gcGxhY2U/Cj4gSSd2ZSBuZXZlciB0cmllZCBidWlsZGluZyBhbnkgbGl2ZSBwYXRj
aCwgc28gSSBhbHNvIGRpZG4ndCB0ZXN0Cj4gdGhpcyBhbmdsZSBvZiB0aGlzIGNoYW5nZS4gQnV0
IEkgZGlkIHZlcmlmeSB0aGUgcmVzdWx0cyBvZiB3aGF0Cj4gdGhlIGNoYW5nZSBoZXJlIGRvZXMu
Cj4KPiBJJ20gYWxzbyBhIGxpdHRsZSBwdXp6bGVkIGFib3V0IHRoaXMgcmVzcG9uc2UgYmVjYXVz
ZSBJIGRpZCB0aGUKPiBjaGFuZ2UgdXBvbiB5b3VyIHJlcXVlc3QuCj4KPj4gSSBhc2ssIGJlY2F1
c2UgdGhlcmUgaXMgMCB0ZXN0aW5nIG9mIGxpdmVwYXRjaGVzLCBhbmQgYWxyZWFkeSBvbmUgbWFq
b3IKPj4gcmVncmVzc2lvbiBpbiA0LjEzIHdoaWNoIGZvcmNlcyBYZW5TZXJ2ZXIgdG8gcmV2ZXJ0
IGJhY2sgdG8gb2xkZXIgYnVpbGQKPj4gdG9vbHMuCj4gVGhhdCdzIGEgYnVpbGQgdG9vbHMgcmVn
cmVzc2lvbiwgaXNuJ3QgaXQ/IEkuZS4gbm90IHJlYWxseSByZWxhdGVkCj4gdG8gNC4xMz8KCkkg
YmVsaWV2ZSBpdCBpcyBhIGJ1aWxkIHRvb2xzIHJlZ3Jlc3Npb24sIHJhdGhlciB0aGFuIGEgNC4x
MyByZWdyZXNzaW9uLgoKSG93ZXZlciwgd2UgYXJlIGluIHRoZSBwb3NpdGlvbiB0aGF0IHRoZXJl
IGlzIGEgc3VwcG9ydGVkIHRvb2wgd2l0aCBubwphZGVxdWF0ZSB0ZXN0aW5nIGluIHBsYWNlLCB3
aXRoIG9uZSByYXRoZXIgdGVybWluYWwgcmVncmVzc2lvbiBpbiB0aGUKNC4xMyB0aW1lZnJhbWUu
wqAgQWxsIEknbSBkb2luZyBpcyBiZWluZyBjYXV0aW91cyBhYm91dCBtYWtpbmcgY2hhbmdlcwp3
aGljaCBoYXZlIGEgcmVhbCBsaWtlbGlob29kIG9mIGFmZmVjdGluZyB0aGUgc3RhdHVzIHF1by4K
Cn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

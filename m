Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CF5969FC
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 22:14:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0ATn-0000jk-9E; Tue, 20 Aug 2019 20:11:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IYD1=WQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i0ATl-0000jf-HS
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 20:11:41 +0000
X-Inumbo-ID: b84485a2-c386-11e9-8980-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b84485a2-c386-11e9-8980-bc764e2007e4;
 Tue, 20 Aug 2019 20:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566331900;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=UZDmyzhB46DFOQkyh2Ac3pg0L/9zoKmqGbFzVVNYCBY=;
 b=as5L0X+99KDcmwKhF+PVr642EFep3TIV5066x9g0hqSx/fgKVm1l5G16
 2mF3DKh/5y0QgUyTzcBK82VRO9YMYZXl3jDUthD1CY8uyFWLvmU8Ck/J3
 eAxG0T/lOs0V7IhCkirmFxWbkLhTqvdlrtl+zTFodAVyE10hdzN4MfDI9 0=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iZl94buKhmsQ9+3jV9rvvI9RmEuwElpzhaOyWNShBoATMDTd1abHHVoU26ybutYpNRk2IOXuLw
 QvdQV7aqHBw7VNBk9xQRCOdpIxQLrfH+643EIRGVYiIzQwsvEqUzuP3Q2VPCALTB4duXxQkM67
 65R+P7rp0jc30IGJjwW4XZ80i5Gz+HlWleUslKp/S4/ilrDfrofYC5eFmZXTx3UI06uNRMDFf8
 D8pX98Odz5HJm5yYetM4RIfSSQXJsgT7EywfmmgZTryAj7kBOeH2K2kOVWk+kmOMQuUjx7LM7b
 E4k=
X-SBRS: 2.7
X-MesageID: 4743479
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,408,1559534400"; 
   d="scan'208";a="4743479"
To: Jan Beulich <JBeulich@suse.com>, Alexandru Stefan ISAILA
 <aisaila@bitdefender.com>
References: <20190703105639.23081-1-aisaila@bitdefender.com>
 <7a4c824d-3ccd-b289-3e8e-ff94ea916b3e@suse.com>
 <0d1ab92f-171b-98d9-a69e-5aa7cfbe0d85@bitdefender.com>
 <e61a882e-d2ea-a03d-fde8-2c2befd865da@suse.com>
 <23cebb01-38fc-ba49-5a71-e6129152e488@bitdefender.com>
 <1bdaee7b-a01f-7be8-426f-fe6c678c2859@bitdefender.com>
 <60651ad5-f0bd-caad-77f6-5f8fb71a8319@suse.com>
 <c7060d91-851a-ba04-56c3-90f1aed65913@bitdefender.com>
 <b7c16027-2f50-4011-3866-0b4904596249@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7d8888b6-ae1b-d059-938e-14fb72e6f9bc@citrix.com>
Date: Tue, 20 Aug 2019 21:11:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b7c16027-2f50-4011-3866-0b4904596249@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v7] x86/emulate: Send vm_event from emulate
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMDcvMjAxOSAxNTo1NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEBAIC02MjIsMTQgKzYy
MiwyMiBAQCBzdGF0aWMgdm9pZCAqaHZtZW11bF9tYXBfbGluZWFyX2FkZHIoCj4+ICAgICAgICAg
ICAgICAgIH0KPj4KPj4gICAgICAgICAgICAgICAgaWYgKCBwMm10ID09IHAybV9pb3JlcV9zZXJ2
ZXIgKQo+PiAtICAgICAgICAgICAgewo+PiAtICAgICAgICAgICAgICAgIGVyciA9IE5VTEw7Cj4+
ICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPj4gLSAgICAgICAgICAgIH0KPj4KPj4gICAg
ICAgICAgICAgICAgQVNTRVJUKHAybXQgPT0gcDJtX3JhbV9sb2dkaXJ0eSB8fCAhcDJtX2lzX3Jl
YWRvbmx5KHAybXQpKTsKPj4gKwo+PiArICAgICAgICAgICAgaWYgKCBjdXJyLT5hcmNoLnZtX2V2
ZW50ICYmCj4+ICsgICAgICAgICAgICAgICAgIGN1cnItPmFyY2gudm1fZXZlbnQtPnNlbmRfZXZl
bnQgJiYKPj4gKyAgICAgICAgICAgICAgICAgaHZtX2VtdWxhdGVfc2VuZF92bV9ldmVudChhZGRy
LCBnZm4sIHBmZWMpICkKPj4gKyAgICAgICAgICAgICAgICBlcnIgPSBFUlJfUFRSKH5YODZFTVVM
X1JFVFJZKTsKPj4gICAgICAgICAgICB9Cj4+ICAgICAgICB9Cj4+ICsgICAgLyogQ2hlY2sgaWYg
YW55IHZtX2V2ZW50IHdhcyBzZW50ICovCj4+ICsgICAgaWYgKCBlcnIgKQo+PiArICAgICAgICBn
b3RvIG91dDsKPj4KPj4gICAgICAgIC8qIEVudGlyZSBhY2Nlc3Mgd2l0aGluIGEgc2luZ2xlIGZy
YW1lPyAqLwo+PiAgICAgICAgaWYgKCBucl9mcmFtZXMgPT0gMSApCj4gRmlyc3Qgb2YgYWxsIEkg
aGF2ZSB0byBhcG9sb2dpemU6IEluIGVhcmxpZXIgcmVwbGllcyBJIHJlZmVycmVkCj4gdG8gdXBk
YXRlX21hcF9lcnIoKS4gSSBub3RpY2Ugb25seSBub3cgdGhhdCB0aGlzIGlzIGEgc3RpbGwKPiBw
ZW5kaW5nIGNoYW5nZSBvZiBtaW5lLCB3aGljaCBBbmRyZXcgY29udGludWVzIHRvIG9iamVjdCB0
bywKPiB3aGlsZSBJIGNvbnRpbnVlIHRvIHRoaW5rIGl0IChpbiBvbmUgZm9ybSBvciBhbm90aGVy
KSBpcyBuZWVkZWQ6Cj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1s
L3hlbi1kZXZlbC8yMDE4LTA5L21zZzAxMjUwLmh0bWwKPgo+IEdpdmVuIHRoZSB1bnBhdGNoZWQg
Y29kZSwgSSB0aGluayB5b3VyIGNoYW5nZSBpcyBjb3JyZWN0LCBidXQKPiBxdWl0ZSBwb3NzaWJs
eSB5b3VyIGVhcmxpZXIgdmFyaWFudCB3YXMsIHRvby4gQnV0IHNpbmNlIHRoZQo+IHVucGF0Y2hl
ZCBjb2RlIGlzIGltbyB3cm9uZywgSSdkIHByZWZlciBpZiB0aGUgVk0gZXZlbnQgc2lkZQo+IGNo
YW5nZSB3YXMgcHV0IG9uIHRvcCBvZiB0aGUgZml4ZWQgY29kZSwgaW4gb3JkZXIgdG8gbm90IGZ1
cnRoZXIKPiBjb21wbGljYXRlIHRoZSBhY3R1YWwgZml4ICh3aGljaCB3ZSBtYXkgYWxzbyB3YW50
IHRvIGJhY2twb3J0KS4KPgo+IEFuZHJldywgYXMgdG8gdGhhdCBvbGQgcGVuZGluZyBwYXRjaCwg
SSdtIGFmcmFpZCBJIGhhdmVuJ3QgYmVlbgo+IGNvbnZpbmNlZCBpbiB0aGUgc2xpZ2h0ZXN0IGJ5
IHlvdXIgYXJndW1lbnRhdGlvbiwgcmVnYXJkbGVzcyBvZgo+IHRoZSBhY3R1YWwgYmVoYXZpb3Ig
b2YgdGhlIFhURiB0ZXN0IHlvdSd2ZSBjcmVhdGVkLgoKU28gd2hhdD/CoCBZb3Ugd2FudCB5b3Vy
IGNoYW5nZSB0YWtlbiBhbnl3YXkgZGVzcGl0ZSBldmlkZW5jZSB0aGF0IGl0IGlzCndyb25nPwoK
PiAgVGhlcmUgYXJlCj4gdHdvIGZ1bmRhbWVudGFsIHBvaW50cyB5b3UndmUgbm90IGFkZHJlc3Nl
ZCBkdXJpbmcgdGhlIGVhcmxpZXIKPiBkaXNjdXNzaW9uOgo+IDEpIEZvciBhIGd1ZXN0IGJlaGF2
aW9yIHNob3VsZCBiZSBlbnRpcmVseSB0cmFuc3BhcmVudCBhcyBmYXIgYXMKPiAybmQgbGV2ZWwg
dHJhbnNsYXRpb24gZ29lcywgdW5sZXNzIHRoZSBfb25seV8gaXNzdWUgcmVzdWx0cyBmcm9tCj4g
aXQuIFRoYXQncyBiZWNhdXNlIG9uIGJhcmUgaGFyZHdhcmUgdGhlcmUgc2ltcGx5IGlzIG5vIDJu
ZCBsZXZlbAo+IHRyYW5zbGF0aW9uLgo+IDIpIFNvbWV3aGF0IHJlbGF0ZWQsIGNvbnNpZGVyIHRo
ZSBjYXNlIG9mIHRoZSBndWVzdCBoYW5kbGluZyB0aGUKPiAjUEYgb24gdGhlIHNlY29uZCBoYWxm
IG9mIHRoZSBhY2Nlc3MgYnkgYSBtZWFucyB3aGljaCBtYWtlcyB0aGUKPiByZWFzb24gZm9yIHRo
ZSAybmQgc3RhZ2UgImZhdWx0IiBnbyBhd2F5LCBvciBub3QgcmVjdXIuIEluIHRoYXQKPiBjYXNl
IHdlJ3ZlIHdyb25nbHkgKGkuZS4gYXQgbGVhc3QgbmVlZGxlc3NseSkgZGVhbHQgd2l0aCB0aGUg
Mm5kCj4gc3RhZ2UgImZhdWx0Ii4KCkZvciBib3RoIG9mIHRoZXNlLCBkbyB5b3UgYWN0dWFsbHkg
aGF2ZSBhbiBleGFtcGxlIHdoZXJlIHlvdSBiZWxpZXZlClhlbidzIGxvZ2ljIGN1cnJlbnRseSBn
b2VzIHdyb25nP8KgIEFsbCBJIHNlZSwgbG9va2luZyB0aG91Z2ggdGhlCnRocmVhZHMsIGlzIHVu
c3Vic3RhbnRpYXRlZCBjbGFpbXMgdGhhdCB0aGUgY3VycmVudCBiZWhhdmlvdXIgaXMgd3Jvbmcu
Cgo+IEkgYW0sIGJ0dywgbm90IGNvbnZpbmNlZCB0aGF0IHRoZSBiZWhhdmlvciBhcyB5b3UndmUg
b2JzZXJ2ZWQgaXQKPiBpcyBhY3R1YWxseSAiY29ycmVjdCIgaW4gdGhlIHNlbnNlIG9mICJzZW5z
aWJsZSIuCgpZb3UncmUgZW50aXRsZWQgdG8gdGhlIGJlbGlldmUgdGhhdCB0aGlzIGlzbid0IHNl
bnNpYmxlIGlmIHlvdSB3aXNoLgoKSXQgZG9lc24ndCBtYWtlIGl0IHJlbGV2YW50IHRvIHRoZSBh
cmd1bWVudC7CoCBSZWxldmFudCBhcmd1bWVudHMgd291bGQKYmUgaWRlbnRpZnlpbmcsIGEgYnVn
IGluIG15IFhURiB0ZXN0LCBvciBjb3VudGVyZXhhbXBsZSB3aGVyZSB0aGUgQ1BVcwpkbyBhbiBv
cHBvc2l0ZSB0aGluZywgb3IgYSBwYXNzYWdlIGluIGEgc3BlYyB3aGljaCBtYWtlIGEgc3RhdGVt
ZW50CnN1cHBvcnRpbmcgeW91ciBjbGFpbS4KCkFzIGZhciBhcyBJIGFtIGNvbmNlcm5lZCwgaXQg
aXMgcGVyZmVjdGx5IHNlbnNpYmxlIGFuZCBsb2dpY2FsCmJlaGF2aW91ci7CoCBUbyBjb21wbGV0
ZSBhbiBpbnN0cnVjdGlvbiB3aGljaCBzdHJhZGRsZXMgYSBwYWdlIGJvdW5kYXJ5LAppdCBpcyBu
ZWNlc3NhcnkgdG8gaGF2ZSBib3RoIHRyYW5zbGF0aW9ucyBhdmFpbGFibGUgaW4gdGhlIFRMQiwg
d2hpY2gKcmVxdWlyZXMgdHdvIEVQVC13YWxrcyB0byBoYXZlIGFscmVhZHkgY29tcGxldGVkIGNv
cnJlY3RseS4KClNETSBWb2wgMyAyOC4yLjMuMyBpcyB2ZXJ5IGNsZWFyIG9uIHRoZSBtYXR0ZXIu
wqAgQWxsIHRyYW5zbGF0aW9ucyB0byB0aGUKdWx0aW1hdGUgcGh5c2ljYWwgYWRkcmVzc2VzIGdl
dCBlc3RhYmxpc2hlZCBmaXJzdCAoSS5lLiB0aGUgVExCIGZpbGxzCmNvbXBsZXRlKSBiZWZvcmUg
YW55IGFjY2VzcyByaWdodHMgZ2V0IGNvbnNpZGVyZWQuwqAgVGhpcyBtZWFucyB0aGF0Cm9yZGVy
aW5nIG9mICNQRiBhbmQgRVBUIG1pc2NvbmZpZy92aW9sYXRpb24gaXMgY29tcGxpY2F0ZWQgYnkg
dGhlaXIgZHVhbApuYXR1cmUgZm9yIGZhaWx1cmVzLgoKSW4gcmVhbGl0eSwgSSB0aGluayB0aGUg
Y3VycmVudCBjb2RlIGluIFhlbiB3aWxsIGdldCB0aGUgcHJpb3JpdHkgb2YKc2Vjb25kIGFuZCBm
aXJzdCBzdGFnZSBhY2Nlc3MgcmlnaHQgZmF1bHQgaW52ZXJ0ZWQsIGJ1dCBpdHMgYSBkYW1uIHNp
Z2h0CmNsb3NlciB0byBob3cgdGhlIENQVSBiZWhhdmVzIHRoYW4gdGhlIHByb3Bvc2VkIHBhdGNo
LCB3aGljaCB3b3VsZCBnZXQKZmlyc3Qgc3RhZ2VkIGFjY2VzcyByaWdodHMgbWl4ZWQgdXAgd2l0
aCBzZWNvbmQgc3RhZ2UgdHJhbnNsYXRpb24gZmF1bHRzLgoKSGF2aW5nIGxvb2tlZCBvdmVyIGV2
ZXJ5dGhpbmcgeWV0IGFnYWluLCBJIHN0YW5kIGJ5IG15IHZlcnkgZmlyc3QKY29uY2x1c2lvbiBv
ZiB0aGF0IGNoYW5nZSBiZWluZyBpbmNvcnJlY3QuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEA010CB5A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 16:09:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaLNK-0002DI-02; Thu, 28 Nov 2019 15:06:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fBjq=ZU=bitdefender.com=apop@srs-us1.protection.inumbo.net>)
 id 1iaLNJ-0002DD-Eb
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 15:06:33 +0000
X-Inumbo-ID: a92b287e-11f0-11ea-a3d3-12813bfff9fa
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a92b287e-11f0-11ea-a3d3-12813bfff9fa;
 Thu, 28 Nov 2019 15:06:32 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 26F37307483A; Thu, 28 Nov 2019 17:06:31 +0200 (EET)
Received: from age.bitdefender.com (unknown [10.220.12.74])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id D662F303EF07;
 Thu, 28 Nov 2019 17:06:30 +0200 (EET)
References: <20191128114414.21716-1-andrew.cooper3@citrix.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Adrian Pop <apop@bitdefender.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-reply-to: <20191128114414.21716-1-andrew.cooper3@citrix.com>
Date: Thu, 28 Nov 2019 17:06:30 +0200
Message-ID: <87r21s2g7d.fsf@bitdefender.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-next] x86/svm: Correct vm_event API for
 descriptor accesses
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <JBeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhlbGxvLAoKQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JpdGVz
OgoKPiBjL3MgZDBhNjk5YTM4OWYxICJ4ODYvbW9uaXRvcjogYWRkIHN1cHBvcnQgZm9yIGRlc2Ny
aXB0b3IgYWNjZXNzIGV2ZW50cyIKPiBpbnRyb2R1Y2VkIGxvZ2ljIGxvb2tpbmcgZm9yIHdoYXQg
YXBwZWFyZWQgdG8gYmUgZXhpdGluZm8gKG5vdCB0aGF0IHRoaXMKPiBleGlzdHMgaW4gU1ZNIC0g
ZXhpdGluZm8xIG9yIDIgZG8pLCBidXQgYWN0dWFsbHkgcGFzc2VkIHRoZSBleGl0IElEVCB2ZWN0
b3JpbmcKPiBpbmZvcm1hdGlvbi4gIFRoZXJlIGlzIG5ldmVyIGFueSBJRFQgdmVjdG9yaW5nIGlu
dm9sdmVkIGluIHRoZXNlIGludGVyY2VwdHMgc28KPiB0aGUgdmFsdWUgcGFzc2VkIGlzIGFsd2F5
cyB6ZXJvLgo+Cj4gSW4gZmFjdCwgU1ZNIGRvZXNuJ3QgcHJvdmlkZSBhbnkgaW5mb3JtYXRpb24s
IGV2ZW4gaW4gZXhpdGluZm8xIGFuZCAyLiAgTm90ZQo+IHRoZSBlcnJvciBpbiB0aGUgcHVibGlj
IEFQSSBhbmQgc3RhdGUgdGhhdCB0aGlzIGZpZWxkIGlzIGFsd2F5cyAwLCBhbmQgZHJvcAo+IHRo
ZSBTVk0gbG9naWMgaW4gaHZtX21vbml0b3JfZGVzY3JpcHRvcl9hY2Nlc3MoKS4KPgo+IEluIHRo
ZSBTVk0gdm1leGl0IGhhbmRsZXIgaXRzZWxmLCBvcHRpbWlzZSB0aGUgc3dpdGNoIHN0YXRlbWVu
dCBieSBvYnNlcnZpbmcKPiB0aGF0IHRoZXJlIGlzIGEgbGluZWFyIHRyYW5zZm9ybWF0aW9uIGJl
dHdlZW4gdGhlIFNWTSBleGl0X3JlYXNvbiBhbmQKPiBWTV9FVkVOVF9ERVNDXyogdmFsdWVzLiAg
KEJsb2F0LW8tbWV0ZXIgcmVwb3J0cyA2MDI4ID0+IDU4NzcgZm9yIGEgc2F2aW5nIG9mCj4gMTUx
IGJ5dGVzKS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Cj4gLS0tCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4K
PiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+Cj4gQ0M6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVu
ZGVyLmNvbT4KPiBDQzogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgo+IEND
OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KPiBDQzogUGV0cmUg
UGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4KPiBDQzogQWRyaWFuIFBvcCA8
YXBvcEBiaXRkZWZlbmRlci5jb20+Cj4KPiBBZHJpYW46IERvIHlvdSByZWNhbGwgd2hhdCBpbmZv
cm1hdGlvbiB5b3Ugd2VyZSBhdHRlbXB0aW5nIHRvIGZvcndhcmQgZnJvbSB0aGUKPiBWTUNCPyAg
SSBjYW4ndCBsb2NhdGUgYW55dGhpbmcgd2hpY2ggd291bGQgcGxhdXNpYmx5IGJlIGludGVyZXN0
aW5nLgoKVGhlIFNWTSBwYXJ0IHdhcyBtb3N0IGxpa2VseSBtZWFudCB0byBtaXJyb3IgdGhlIGxv
Z2ljIGZyb20gVk1YLiAgQnV0LAphcyBJIHJlY2FsbCwgbW9uaXRvcmluZyBoYWRuJ3QgYmVlbiBp
bXBsZW1lbnRlZCB3aXRoIFNWTSBzbyB0aGlzCmNvdWxkbid0IHJlYWxseSBiZSB1c2VkIG9uIEFN
RC4gIFVuZm9ydHVuYXRlbHkgSSdtIG5vdCBzdXJlIHdoYXQKaW5mb3JtYXRpb24gd2FzIHN1cHBv
c2VkIHRvIGJlIGZvcndhcmRlZC4KClRoZSBjbGVhbnVwIGxvb2tzIGdvb2QgdG8gbWUuCgpBY2tl
ZC1ieTogQWRyaWFuIFBvcCA8YXBvcEBiaXRkZWZlbmRlci5jb20+Cgo+IFRoaXMgaXMgcGFydCBv
ZiBhIGxvbmdlciBjbGVhbnVwIHNlcmllcyBJIGdhdGhlcmVkIGluIHRoZSB3YWtlIG9mIHRoZSB0
YXNrCj4gc3dpdGNoIGlzc3VlcywgYnV0IGl0IGlzIHB1bGxlZCBvdXQgYWhlYWQgZHVlIHRvIGl0
cyBpbnRlcmFjdGlvbiB3aXRoIHRoZQo+IHB1YmxpYyBpbnRlcmZhY2UuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

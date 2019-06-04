Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D1B34CEC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 18:10:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYByg-0007D4-2H; Tue, 04 Jun 2019 16:07:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KH14=UD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hYByf-0007Cy-Ad
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 16:07:57 +0000
X-Inumbo-ID: e94921de-86e2-11e9-a133-17ba2d3278b7
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e94921de-86e2-11e9-a133-17ba2d3278b7;
 Tue, 04 Jun 2019 16:07:55 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: JwNPdoxqmtD9bLAE45769vTlwapCrdhLrsEJxAbbfJ4fZ1qS9EicNB6DfDtbfLgkZ7WayOSma0
 uz+g3G4MA9EE11UHIOpTqMg0Zfs52/OlBtuSZXLWzQgffeJ0HwjIvhcEEy6yoCYtdiMVaJgMJz
 ci+ZxXAAA5dh8VbERN7+UPMHq022nEneSGIyNerEjpKXhx4uhyCZFN4fiHq2jPMja6/kDZx2Ei
 YW5VC908VxvSvK59Q+xZblw8BCHEbNVutm2FWXp62yw4XAVuwi+/vVjohT7NunQgDMOYVODTXm
 9Pk=
X-SBRS: 2.7
X-MesageID: 1308995
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1308995"
To: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <a7acd18a3c4bcd288338de12d13ce1cb9fb6d8b2.1559224640.git.ppircalabu@bitdefender.com>
 <9119ed35-e90c-c91e-2138-e2f9afa17d6f@citrix.com>
 <5ef191be3afcaad4596c1b24b6c50dcddd20b16a.camel@bitdefender.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <867e8420-befc-0374-c5c1-8df40c8fb93c@citrix.com>
Date: Tue, 4 Jun 2019 17:07:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5ef191be3afcaad4596c1b24b6c50dcddd20b16a.camel@bitdefender.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/9] tools/libxc: Consistent usage of
 xc_vm_event_* interface
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMDYvMjAxOSAxNToyMywgUGV0cmUgT3ZpZGl1IFBJUkNBTEFCVSB3cm90ZToKPiBPbiBG
cmksIDIwMTktMDUtMzEgYXQgMTY6MDEgLTA3MDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9u
IDMwLzA1LzIwMTkgMDc6MTgsIFBldHJlIFBpcmNhbGFidSB3cm90ZToKPj4+IE1vZGlmaWVkIHhj
X21lbV9wYWdpbmdfZW5hYmxlIHRvIHVzZSBkaXJlY3RseSB4Y192bV9ldmVudF9lbmFibGUKPj4+
IGFuZAo+Pj4gbW92ZWQgdGhlIHJpbmdfcGFnZSBoYW5kbGluZyBmcm9tIGNsaWVudCB0byBsaWJ4
YyAoeGVucGFnaW5nKS4KPj4+Cj4+PiBSZXN0cmljdGVkIHZtX2V2ZW50X2NvbnRyb2wgdXNhZ2Ug
b25seSB0byBzaW1wbGVzdCBkb21jdGxzIHdoaWNoIGRvCj4+PiBub3QgZXhwZWN0IGFueSByZXR1
cm4gdmFsdWVzIGFuZCBjaGFuZ2UgeGNfdm1fZXZlbnRfZW5hYmxlIHRvIGNhbGwKPj4+IGRvX2Rv
bWN0bAo+Pj4gZGlyZWN0bHkuCj4+Pgo+Pj4gUmVtb3ZlZCB4Y19tZW1zaHJfcmluZ19lbmFibGUv
ZGlzYWJsZSBhbmQgeGNfbWVtc2hyX2RvbWFpbl9yZXN1bWUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1i
eTogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4KPj4+IC0tLQo+
Pj4gIHRvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oIHwgNDkgKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPj4+IC0tLS0KPj4+ICB0b29scy9saWJ4Yy94Y19tZW1fcGFnaW5nLmMgICB8
IDIzICsrKysrLS0tLS0tLS0tLS0KPj4+ICB0b29scy9saWJ4Yy94Y19tZW1zaHIuYyAgICAgICB8
IDM0IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+PiAgdG9vbHMvbGlieGMveGNfbW9uaXRvci5j
ICAgICAgfCAzMSArKysrKysrKysrKysrKysrKy0tLS0KPj4+ICB0b29scy9saWJ4Yy94Y19wcml2
YXRlLmggICAgICB8ICAyICstCj4+PiAgdG9vbHMvbGlieGMveGNfdm1fZXZlbnQuYyAgICAgfCA2
NCArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4+PiAtLS0tLS0tLS0tLS0KPj4+ICB0
b29scy94ZW5wYWdpbmcveGVucGFnaW5nLmMgICB8IDQyICsrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPj4gU28sIHRoZSBkaWZmc3RhdCBoZXJlIGlzIHZlcnkgaW1wcmVzc2l2ZSwgYW5kIGp1
ZGdpbmcgYnkgdGhlIGRlbHRhLAo+PiBpdHMKPj4gYWxsIGFib3V0IG5vdCBvcGVuY29kaW5nIHRo
ZSB1c2Ugb2YgdGhlIEhWTV9QQVJBTSBpbnRlcmZhY2UuIAo+PiBPdmVyYWxsLAo+PiB0aGlzIGlz
IGNsZWFybHkgYSBnb29kIHRoaW5nLgo+Pgo+PiBIb3dldmVyLCBpdCBpcyBxdWl0ZSBkaWZmaWN1
bHQgdG8gZm9sbG93IGV4YWN0bHkgd2hhdCBpcyBnb2luZyBvbi4KPj4KPj4gQUZBSUNULCB0aGlz
IHdhbnRzIHNwbGl0dGluZyBpbnRvICROIHBhdGNoZXMuCj4+Cj4+IE9uZSBwYXRjaCBzaG91bGQg
cmVmYWN0b3IgeGNfbWVtX3BhZ2luZ19lbmFibGUoKSB0byB1c2UKPj4geGNfdm1fZXZlbnRfZW5h
YmxlKCksIHdpdGggdGhlIGFzc29jaWF0ZWQgeGVucGFnaW5nIGNsZWFudXAuCj4+Cj4+IE9uZSBw
YXRjaCBzaG91bGQgYmUgdGhlIGRlbGV0aW9uIG9mIHhjX21lbXNocl8qIG9uIGl0cyBvd24sIGJl
Y2F1c2UKPj4gQUZBSUNUIGl0IGlzIGFuIGlzb2xhdGVkIGNoYW5nZS4gIEl0IGFsc28gbmVlZHMg
c29tZSBqdXN0aWZpY2F0aW9uLAo+PiBldmVuCj4+IGlmIGl0IGlzICJpbnRlcmZhY2UgaXMgdW51
c2VkIGFuZC9vciByZWR1bmRhbnQgd2l0aCAkWCIuCj4+Cj4+IE9uZSBwYXRjaCAoYWxvbmUpIHNo
b3VsZCBiZSB0aGUgcmVwb3NpdGlvbmluZyBvZiB0aGUgZG9tYWluX3BhdXNlKCkKPj4gY2FsbHMu
ICBUaGlzIGRvZXMgY2VydGFpbmx5IGxvb2sgbGlrZSBhIHZhc3QgaW1wcm92ZW1lbnQgV1JUIGVy
cm9yCj4+IGhhbmRsaW5nIGluIHhjX3ZtX2V2ZW50X2VuYWJsZSgpLCBidXQgeW91J3ZlIGRlZmlu
aXRlbHkgY2hhbmdlZCB0aGUKPj4gQVBJCj4+IChpbnNvZmFyIGFzIHRoZSBleHBlY3RhdGlvbiB0
aGF0IHRoZSBjYWxsZXIgaGFzIHBhdXNlZCB0aGUgZG9tYWluKQo+PiBnb2VzLAo+PiBhbmQgaXRz
IG5vdCBhdCBhbGwgb2J2aW91cyB0aGF0IHRoaXMgY2hhbmdlIGlzIHNhZmUuICBJdCBtYXkgdmVy
eQo+PiB3ZWxsCj4+IGJlLCBidXQgeW91IG5lZWQgdG8gY29udmluY2UgcGVvcGxlIGFzIHRvIHdo
eSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCj4+Cj4+Cj4+IEkgc3RpbGwgaGF2ZW4ndCBmaWd1cmVk
IG91dCB3aGF0IHRoZSBwdXJwb3NlIGJlaGluZCBkcm9wcGluZyB0aGUgcG9ydAo+PiBwYXJhbWV0
ZXIgZnJvbSB4Y192bV9ldmVudF9jb250cm9sKCkgaXMuCj4+Cj4+IH5BbmRyZXcKPiBUaGUgbWFp
biByZWFzb24gZm9yIHRoaXMgcGF0Y2ggd2FzIHRvIHVzZSBhbiB1bmlmb3JtIGNhbGxpbmcgY29u
dmVudGlvbgo+IGZvciBhbGwgeGNfdm1fZXZlbnQgd3JhcHBlcnMuCgpUaGUgY2xlYW51cCBpcyBh
IGdyZWF0LCBidXQgaXQgbmVlZHMgdG8gYmUgaW4gZmluZXIgZ3JhaW5lZCBwYXRjaGVzIHNvCml0
IGNhbiBiZSBmb2xsb3dlZCBtb3JlIGVhc2lseS4KCj4gSG93ZXZlciwgYXQgdGhpcyBzdGFnZSBJ
IHRoaW5rIGl0J3MgYmVzdCB0byBkcm9wIGl0IGFsdG9naGV0ZXIgYXMgaXQncwo+IG5vdCBhIHJl
cXVpcmVtZW50IGZvciB0aGUgbmV3IHZtX2V2ZW50IGludGVyZmFjZSAobmV3IGRvbWN0bHMgYXJl
IHVzZWQKPiBhbG9uZyB3aXRoIHRoZWlyIG93biBzZXBhcmF0ZSB3cmFwcGVycykuCgpTZWUgcGF0
Y2ggOCBmb3IgdGhlIGRpc2N1c3Npb24gb24gd2h5IGEgbmV3IGRvbWN0bCBwcm9iYWJseSBpc24n
dCB0aGUKcmlnaHQgY291cnNlIG9mIGFjdGlvbi4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

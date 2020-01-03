Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A612312F9F1
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 16:45:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inP69-000327-Gr; Fri, 03 Jan 2020 15:42:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inP68-000322-2g
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 15:42:48 +0000
X-Inumbo-ID: abced89e-2e3f-11ea-a1e1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abced89e-2e3f-11ea-a1e1-bc764e2007e4;
 Fri, 03 Jan 2020 15:42:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7C7B7AF8A;
 Fri,  3 Jan 2020 15:42:38 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20191223164329.3113378-1-george.dunlap@citrix.com>
 <20191223164329.3113378-4-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6a88c687-79ff-464e-2150-f839349acad6@suse.com>
Date: Fri, 3 Jan 2020 16:43:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191223164329.3113378-4-george.dunlap@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/4] mm: Use put_old_guest_table for
 relinquish_pages
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTIuMjAxOSAxNzo0MywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBAQCAtMTk2Nyw0MiAr
MTk3MSwzMiBAQCBzdGF0aWMgaW50IHJlbGlucXVpc2hfbWVtb3J5KAo+ICAgICAgICAgIH0KPiAg
Cj4gICAgICAgICAgaWYgKCB0ZXN0X2FuZF9jbGVhcl9iaXQoX1BHVF9waW5uZWQsICZwYWdlLT51
LmludXNlLnR5cGVfaW5mbykgKQo+IC0gICAgICAgICAgICByZXQgPSBwdXRfcGFnZV9hbmRfdHlw
ZV9wcmVlbXB0aWJsZShwYWdlKTsKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIC8qIEFsd2F5
cyBkcm9wIHRoZSBwYWdlIHJlZiBhc3NvY2lhdGVkIHdpdGggUEdUX3Bpbm5lZCAqLwo+ICsgICAg
ICAgICAgICBwdXRfcGFnZShwYWdlKTsKPiArICAgICAgICAgICAgcmV0ID0gcHV0X3BhZ2VfdHlw
ZV9wcmVlbXB0aWJsZShwYWdlKTsKPiArICAgICAgICB9Cj4gICAgICAgICAgc3dpdGNoICggcmV0
ICkKPiAgICAgICAgICB7Cj4gICAgICAgICAgY2FzZSAwOgo+ICAgICAgICAgICAgICBicmVhazsK
PiAtICAgICAgICBjYXNlIC1FUkVTVEFSVDoKPiAgICAgICAgICBjYXNlIC1FSU5UUjoKPiAtICAg
ICAgICAgICAgLyoKPiAtICAgICAgICAgICAgICogLUVJTlRSIG1lYW5zIFBHVF92YWxpZGF0ZWQg
aGFzIGJlZW4gcmUtc2V0OyByZS1zZXQKPiAtICAgICAgICAgICAgICogUEdUX3Bpbm5lZCBhZ2Fp
biBzbyB0aGF0IGl0IGdldHMgcGlja2VkIHVwIG5leHQgdGltZQo+IC0gICAgICAgICAgICAgKiBh
cm91bmQuCj4gLSAgICAgICAgICAgICAqCj4gLSAgICAgICAgICAgICAqIC1FUkVTVEFSVCwgT1RP
SCwgbWVhbnMgUEdUX3BhcnRpYWwgaXMgc2V0IGluc3RlYWQuICBQdXQKPiAtICAgICAgICAgICAg
ICogaXQgYmFjayBvbiB0aGUgbGlzdCwgYnV0IGRvbid0IHNldCBQR1RfcGlubmVkOyB0aGUKPiAt
ICAgICAgICAgICAgICogc2VjdGlvbiBiZWxvdyB3aWxsIGZpbmlzaCBvZmYgZGUtdmFsaWRhdGlv
bi4gIEJ1dCB3ZSBkbwo+IC0gICAgICAgICAgICAgKiBuZWVkIHRvIGRyb3AgdGhlIGdlbmVyYWwg
cmVmIGFzc29jaWF0ZWQgd2l0aAo+IC0gICAgICAgICAgICAgKiBQR1RfcGlubmVkLCBzaW5jZSBw
dXRfcGFnZV9hbmRfdHlwZV9wcmVlbXB0aWJsZSgpCj4gLSAgICAgICAgICAgICAqIGRpZG4ndCBk
byBpdC4KPiAtICAgICAgICAgICAgICoKPiAtICAgICAgICAgICAgICogTkIgd2UgY2FuIGRvIGFu
IEFTU0VSVCBmb3IgUEdUX3ZhbGlkYXRlZCwgc2luY2Ugd2UKPiAtICAgICAgICAgICAgICogIm93
biIgdGhlIHR5cGUgcmVmOyBidXQgdGhlb3JldGljYWxseSwgdGhlIFBHVF9wYXJ0aWFsCj4gLSAg
ICAgICAgICAgICAqIGNvdWxkIGJlIGNsZWFyZWQgYnkgc29tZW9uZSBlbHNlLgo+IC0gICAgICAg
ICAgICAgKi8KPiAtICAgICAgICAgICAgaWYgKCByZXQgPT0gLUVJTlRSICkKPiAtICAgICAgICAg
ICAgewo+IC0gICAgICAgICAgICAgICAgQVNTRVJUKHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvICYg
UEdUX3ZhbGlkYXRlZCk7Cj4gLSAgICAgICAgICAgICAgICBzZXRfYml0KF9QR1RfcGlubmVkLCAm
cGFnZS0+dS5pbnVzZS50eXBlX2luZm8pOwo+IC0gICAgICAgICAgICB9Cj4gLSAgICAgICAgICAg
IGVsc2UKPiAtICAgICAgICAgICAgICAgIHB1dF9wYWdlKHBhZ2UpOwo+ICsgICAgICAgICAgICBB
U1NFUlQocGFnZS0+dS5pbnVzZS50eXBlX2luZm8gJiBQR1RfdmFsaWRhdGVkKTsKPiArICAgICAg
ICAgICAgLyogRmFsbHRocm91Z2ggKi8KPiArICAgICAgICBjYXNlIC1FUkVTVEFSVDoKPiArICAg
ICAgICAgICAgY3VycmVudC0+YXJjaC5vbGRfZ3Vlc3RfcHRwZyA9IE5VTEw7Cj4gKyAgICAgICAg
ICAgIGN1cnJlbnQtPmFyY2gub2xkX2d1ZXN0X3RhYmxlID0gcGFnZTsKPiArICAgICAgICAgICAg
Y3VycmVudC0+YXJjaC5vbGRfZ3Vlc3RfdGFibGVfcGFydGlhbCA9IChyZXQgPT0gLUVSRVNUQVJU
KTsKPiAgCj4gICAgICAgICAgICAgIHJldCA9IC1FUkVTVEFSVDsKPiAgCj4gLSAgICAgICAgICAg
IC8qIFB1dCB0aGUgcGFnZSBiYWNrIG9uIHRoZSBsaXN0IGFuZCBkcm9wIHRoZSByZWYgd2UgZ3Jh
YmJlZCBhYm92ZSAqLwo+IC0gICAgICAgICAgICBwYWdlX2xpc3RfYWRkKHBhZ2UsIGxpc3QpOwo+
IC0gICAgICAgICAgICBwdXRfcGFnZShwYWdlKTsKPiArICAgICAgICAgICAgLyogTWFrZSBzdXJl
IHdlIGRvbid0IGxvc2UgdHJhY2sgb2YgdGhlIHBhZ2UgKi8KPiArICAgICAgICAgICAgcGFnZV9s
aXN0X2FkZF90YWlsKHBhZ2UsICZkLT5hcmNoLnJlbG1lbV9saXN0KTsKCldoeSBhdCB0aGUgdGFp
bD8gVGhlIHByaW9yIHBhZ2VfbGlzdF9hZGQoKSBtYWRlIHN1cmUgd2UnZCBlbmNvdW50ZXIKdGhp
cyBwYWdlIGZpcnN0IG9uIHRoZSBzdWJzZXF1ZW50IGNvbnRpbnVhdGlvbi4gTm8gbmVlZCB0byBr
ZWVwCihwZXJoYXBzIHZlcnkpIG1hbnkgcGFnZXMgaW4gcGFydGlhbGx5IGRlc3RydWN0ZWQgc3Rh
dGUuIFdpdGggdGhpcwpjaGFuZ2VkIGJhY2sgKG9yIHRoZSB0YWlsIGluc2VydGlvbiBzdWl0YWJs
eSBleHBsYWluZWQgaW4gdGhlCmRlc2NyaXB0aW9uKQpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKT24gdG9wIG9mIHRoaXMgcGxlYXNlIGNvbnNpZGVyIGxhdGNo
aW5nIGN1cnJlbnQgaW50byBhIGxvY2FsCnZhcmlhYmxlLgoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

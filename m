Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B59951008F8
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 17:14:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWjcr-0000JV-C6; Mon, 18 Nov 2019 16:11:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2ywg=ZK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iWjcq-0000JP-4e
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 16:11:40 +0000
X-Inumbo-ID: 19cef856-0a1e-11ea-a2d9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19cef856-0a1e-11ea-a2d9-12813bfff9fa;
 Mon, 18 Nov 2019 16:11:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C4BBFAF19;
 Mon, 18 Nov 2019 16:11:37 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191118101600.94645-1-roger.pau@citrix.com>
 <14ccf9a0-ecb4-6e09-6461-99f989353f34@suse.com>
 <20191118140302.GL72134@Air-de-Roger>
 <3e543cfd-d81a-1a4b-0268-7b121ae23c23@suse.com>
 <20191118145554.GN72134@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <41f54c5b-78b1-7c2b-d9be-a88c09968836@suse.com>
Date: Mon, 18 Nov 2019 17:11:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191118145554.GN72134@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/vmx: always sync PIR to IRR
 before vmentry
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Joe Jin <joe.jin@oracle.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTEuMjAxOSAxNTo1NSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gTW9uLCBO
b3YgMTgsIDIwMTkgYXQgMDM6MTk6NTBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDE4LjExLjIwMTkgMTU6MDMsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+Pj4gT24gTW9uLCBO
b3YgMTgsIDIwMTkgYXQgMDE6MjY6NDZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4g
T24gMTguMTEuMjAxOSAxMToxNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4+PiBAQCAtMTk1
NCw0OCArMTk1MiwyOCBAQCBzdGF0aWMgdm9pZCBfX3ZteF9kZWxpdmVyX3Bvc3RlZF9pbnRlcnJ1
cHQoc3RydWN0IHZjcHUgKnYpCj4+Pj4+ICAgICAgICogMi4gVGhlIHRhcmdldCB2Q1BVIGlzIHRo
ZSBjdXJyZW50IHZDUFUgYW5kIHdlJ3JlIGluIG5vbi1pbnRlcnJ1cHQKPj4+Pj4gICAgICAgKiBj
b250ZXh0Lgo+Pj4+PiAgICAgICAqLwo+Pj4+PiAtICAgIGlmICggcnVubmluZyAmJiAoaW5faXJx
KCkgfHwgKHYgIT0gY3VycmVudCkpICkKPj4+Pj4gLSAgICB7Cj4+Pj4+ICsgICAgaWYgKCB2Y3B1
X3J1bm5hYmxlKHYpICYmIHYgIT0gY3VycmVudCApCj4+Pj4KPj4+PiBJJ20gYWZyYWlkIHlvdSBu
ZWVkIHRvIGJlIG1vcmUgY2FyZWZ1bCB3aXRoIHRoZSBydW5uaW5nIHZzIHJ1bm5hYmxlCj4+Pj4g
ZGlzdGluY3Rpb24gaGVyZS4gVGhlIGNvbW1lbnQgYWJvdmUgaGVyZSBiZWNvbWVzIHN0YWxlIHdp
dGggdGhlCj4+Pj4gY2hhbmdlIChhbHNvIHdydCB0aGUgcmVtb3ZhbCBvZiBpbl9pcnEoKSwgd2hp
Y2ggSSdtIGF0IGxlYXN0IHVuZWFzeQo+Pj4+IGFib3V0KSwgYW5kIHRoZSBuZXcgY29tbWVudGFy
eSBiZWxvdyBhbHNvIGxhcmdlbHkgc2F5cy9hc3N1bWVzCj4+Pj4gInJ1bm5pbmciLCBub3QgInJ1
bm5hYmxlIi4KPj4+Cj4+PiBJJ3ZlIG1pc3NlZCB0byBmaXggdGhhdCBjb21tZW50LCB3aWxsIHRh
a2UgY2FyZSBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+Pj4gTm90ZSBhbHNvIHRoYXQgdGhlIGNvbW1l
bnQgaXMgcXVpdGUgcG9pbnRsZXNzLCBpdCBvbmx5IHN0YXRlcyB3aGF0IHRoZQo+Pj4gY29kZSBi
ZWxvdyBpcyBzdXBwb3NlZCB0byBkbywgYnV0IGRvZXNuJ3QgZ2l2ZSBhbnkgcmVhc29uaW5nIGFz
IHRvIHdoeQo+Pj4gaW5faXJxIGlzIHJlbGV2YW50IGhlcmUuCj4+Cj4+IEl0J3MgbWFpbiAidmFs
dWUiIGlzIHRvIHJlZmVyIHRvIHZjcHVfa2ljaygpLCB3aGljaCBoYXMgLi4uCj4+Cj4+PiBUQkgg
SSdtIG5vdCBzdXJlIG9mIHRoZSBwb2ludCBvZiB0aGUgaW5faXJxIGNoZWNrLCBJIGRvbid0IHRo
aW5rIGl0J3MKPj4+IHJlbGV2YW50IGZvciB0aGUgY29kZSBoZXJlLgo+Pgo+PiAuLi4gYSBzaW1p
bGFyIGluX2lycSgpIGNoZWNrLiBTYWRseSB0aGF0IG9uZSwgd2hpbGUgaGF2aW5nIGEgYmlnZ2Vy
Cj4+IGNvbW1lbnQsIGFsc28gZG9lc24ndCBleHBsYWluIHdoYXQgaXQncyBuZWVkZWQgZm9yLiBJ
dCBsb29rcyBsaWtlIEkKPj4gc2hvdWxkIHJlY2FsbCB0aGUgcmVhc29uLCBidXQgSSdtIHNvcnJ5
IC0gSSBkb24ndCByaWdodCBub3cuCj4gCj4gQnkgcmVhZGluZyB0aGUgbWVzc2FnZSBvZiB0aGUg
Y29tbWl0IHRoYXQgaW50cm9kdWNlZCB0aGUgaW5faXJxIGNoZWNrCj4gaW4gdmNwdV9raWNrOgo+
IAo+ICJUaGUgZHJhd2JhY2sgaXMgdGhhdCB7dm14LHN2bX1faW50cl9hc3Npc3QoKSBub3cgcmFj
ZXMgbmV3IGV2ZW50Cj4gbm90aWZpY2F0aW9ucyBkZWxpdmVyZWQgYnkgSVJRIG9yIElQSS4gV2Ug
Y2xvc2UgZG93biB0aGlzIHJhY2UgYnkKPiBoYXZpbmcgdmNwdV9raWNrKCkgc2VuZCBhIGR1bW15
IHNvZnRpcnEgLS0gdGhpcyBnZXRzIHBpY2tlZCB1cCBpbgo+IElSUS1zYWdlIGNvbnRleHQgYW5k
IHdpbGwgY2F1c2UgcmV0cnkgb2YgKl9pbnRyX2Fzc2lzdCgpLiBXZSBhdm9pZAo+IGRlbGl2ZXJp
bmcgdGhlIHNvZnRpcnEgd2hlcmUgcG9zc2libGUgYnkgYXZvaWRpbmcgaXQgd2hlbiB3ZSBhcmUK
PiBydW5uaW5nIGluIHRoZSBub24tSVJRIGNvbnRleHQgb2YgdGhlIFZDUFUgdG8gYmUga2lja2Vk
LiIKPiAKPiBBRkFJQ1QgaW4gdGhlIHZjcHVfa2ljayBjYXNlIHRoaXMgaXMgZG9uZSBiZWNhdXNl
IHRoZSBzb2Z0aXJxIHNob3VsZAo+IG9ubHkgYmUgcmFpc2VkIHdoZW4gaW4gSVJRIGNvbnRleHQg
aW4gb3JkZXIgdG8gdHJpZ2dlciB0aGUgY29kZSBpbgo+IHZteF9kb192bWVudHJ5IHRvIHJldHJ5
IHRoZSBjYWxsIHRvIHZteF9pbnRyX2Fzc2lzdCAodGhpcyBpcyByZWxldmFudAo+IGlmIHZjcHVf
a2ljayBpcyBpc3N1ZWQgZnJvbSBhbiBpcnEgaGFuZGxlciBleGVjdXRlZCBhZnRlcgo+IHZteF9p
bnRyX2Fzc2lzdCBhbmQgYmVmb3JlIHRoZSBkaXNhYmxpbmcgaW50ZXJydXB0cyBpbgo+IHZteF9k
b192bWVudHJ5Lgo+IAo+IEkgdGhpbmsgd2UgbmVlZCBzb21ldGhpbmcgYWxvbmcgdGhlIGxpbmVz
IG9mOgo+IAo+IGlmICggdi0+aXNfcnVubmluZyAmJiB2ICE9IGN1cnJlbnQgKQo+ICAgICBzZW5k
X0lQSV9tYXNrKGNwdW1hc2tfb2Yodi0+cHJvY2Vzc29yKSwgcG9zdGVkX2ludHJfdmVjdG9yKTsK
PiBlbHNlIGlmICggdiA9PSBjdXJyZW50ICYmIGluX2lycSgpICYmICFzb2Z0aXJxX3BlbmRpbmco
c21wX3Byb2Nlc3Nvcl9pZCgpKSApCj4gICAgIHJhaXNlX3NvZnRpcnEoVkNQVV9LSUNLX1NPRlRJ
UlEpOwo+IAo+IFNvIHRoYXQgdm14X2ludHJfYXNzaXN0IGlzIGFsc28gcmV0cmllZCBpZiBhIHZl
Y3RvciBpcyBzaWduYWxlZCBpbiBQSVIKPiBvbiB0aGUgdkNQVSBjdXJyZW50bHkgcnVubmluZyBi
ZXR3ZWVuIHRoZSBjYWxsIHRvIHZteF9pbnRyX2Fzc2lzdCBhbmQKPiB0aGUgZGlzYWJsaW5nIG9m
IGludGVycnVwdHMgaW4gdm14X2RvX3ZtZW50cnkuCgpMb29rcyBwbGF1c2libGUuCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

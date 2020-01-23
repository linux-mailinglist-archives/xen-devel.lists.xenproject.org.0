Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B18D7146DB0
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 17:00:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuesC-0003bt-LC; Thu, 23 Jan 2020 15:58:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuesB-0003bl-Qq
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 15:58:23 +0000
X-Inumbo-ID: 29e86f24-3df9-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29e86f24-3df9-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 15:58:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4A21CAD7B;
 Thu, 23 Jan 2020 15:58:14 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200117150948.45014-1-roger.pau@citrix.com>
 <27d19d98-2209-8add-c66c-e06e51834172@suse.com>
 <20200117160822.GT11756@Air-de-Roger>
 <e65506b5-4795-201a-fb5c-a14acb0181ad@suse.com>
 <20200123154341.GD57924@desktop-tdan49n.eng.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <49a5bc68-e023-c528-cfd3-26edf396fdc0@suse.com>
Date: Thu, 23 Jan 2020 16:58:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200123154341.GD57924@desktop-tdan49n.eng.citrite.net>
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

T24gMjMuMDEuMjAyMCAxNjo0MywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIEph
biAxNywgMjAyMCBhdCAwNToyNToxMlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MTcuMDEuMjAyMCAxNzowOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIEZyaSwgSmFu
IDE3LCAyMDIwIGF0IDA0OjU2OjAwUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9u
IDE3LjAxLjIwMjAgMTY6MDksIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4gVGhlIEludGVs
IFNETSBzdGF0ZXM6Cj4+Pj4+Cj4+Pj4+ICJXaGVuIGFuIGlsbGVnYWwgdmVjdG9yIHZhbHVlICgw
IHRvIDE1KSBpcyB3cml0dGVuIHRvIGEgTFZUIGVudHJ5IGFuZAo+Pj4+PiB0aGUgZGVsaXZlcnkg
bW9kZSBpcyBGaXhlZCAoYml0cyA4LTExIGVxdWFsIDApLCB0aGUgQVBJQyBtYXkgc2lnbmFsIGFu
Cj4+Pj4+IGlsbGVnYWwgdmVjdG9yIGVycm9yLCB3aXRob3V0IHJlZ2FyZCB0byB3aGV0aGVyIHRo
ZSBtYXNrIGJpdCBpcyBzZXQgb3IKPj4+Pj4gd2hldGhlciBhbiBpbnRlcnJ1cHQgaXMgYWN0dWFs
bHkgc2VlbiBvbiB0aGUgaW5wdXQuIgo+Pj4+Pgo+Pj4+PiBBbmQgdGhhdCdzIGV4YWN0bHkgd2hh
dCdzIGN1cnJlbnRseSBkb25lIGluIGRpc2Nvbm5lY3RfYnNwX0FQSUMgd2hlbgo+Pj4+PiB2aXJ0
X3dpcmVfc2V0dXAgaXMgdHJ1ZSBhbmQgTFZUIExJTlQwIGlzIGJlaW5nIG1hc2tlZC4gQnkgd3Jp
dGluZyBvbmx5Cj4+Pj4+IEFQSUNfTFZUX01BU0tFRCBYZW4gaXMgYWN0dWFsbHkgc2V0dGluZyB0
aGUgdmVjdG9yIHRvIDAgYW5kIHRoZQo+Pj4+PiBkZWxpdmVyeSBtb2RlIHRvIEZpeGVkICgwKSwg
YW5kIGhlbmNlIGl0IHRyaWdnZXJzIGFuIEFQSUMgZXJyb3IgZXZlbgo+Pj4+PiB3aGVuIHRoZSBM
VlQgZW50cnkgaXMgbWFza2VkLgo+Pj4+Cj4+Pj4gQnV0IHRoZXJlIGFyZSBtYW55IG1vcmUgaW5z
dGFuY2VzIHdoZXJlIHdlIChoYXZlIGEgcmlzayB0bykgZG8gc28sCj4+Pj4gbW9zdCBub3RhYmx5
IGluIGNsZWFyX2xvY2FsX0FQSUMoKS4gVGhlIHR3byBzdGVwIGxvZ2ljIHRoZXJlIGlzCj4+Pj4g
YW55d2F5IHNvbWV3aGF0IGluIGNvbmZsaWN0IHdpdGggdGhlIGNpdGF0aW9uIGFib3ZlLgo+Pj4K
Pj4+IGNsZWFyX2xvY2FsX0FQSUMgbWFza3MgdGhlIGVycm9yIHZlY3RvciBiZWZvcmUgZG9pbmcg
YW55IHdyaXRlLCBhbmQKPj4+IGNsZWFycyBFU1IgYWZ0ZXJ3YXJkcywgdGhlcmUncyBhIGNvbW1l
bnQgYXQgdGhlIHRvcDoKPj4+Cj4+PiAiTWFza2luZyBhbiBMVlQgZW50cnkgb24gYSBQNiBjYW4g
dHJpZ2dlciBhIGxvY2FsIEFQSUMgZXJyb3IKPj4+IGlmIHRoZSB2ZWN0b3IgaXMgemVyby4gTWFz
ayBMVlRFUlIgZmlyc3QgdG8gcHJldmVudCB0aGlzLiIKPj4+Cj4+PiBXZSBjb3VsZCBkbyB0aGUg
c2FtZSAoaWU6IG1hc2sgTFZURVJSIGZpcnN0IGFuZCBjbGVhciBFU1IgYWZ0ZXJ3YXJkcykKPj4+
IGlmIHRoYXQgc2VlbXMgcHJlZmVyYWJsZS4gVGhlcmUncyBhIG1heGx2dCBjaGVjayBpbiBjbGVh
cl9sb2NhbF9BUElDLAo+Pj4gYnV0IHRoZSBzZG0gZG9lc24ndCBzcGVjaWZ5IGFueXdheSB0byBj
aGVjayBpZiB0aGUgbGFwaWMgd2lsbCBhY2NlcHQgYQo+Pj4gbWFza2VkIHZlY3RvciAwIHdyaXRl
IG9yIG5vdCwgc28gbm90IHN1cmUgd2hldGhlciB3ZSBzaG91bGQgcmVwbGljYXRlCj4+PiB0aGF0
IGNoZWNrIG9yIGp1c3QgZG8gaXQgdW5jb25kaXRpb25hbGx5IG9uIGJvdGggZGlzY29ubmVjdF9i
c3BfQVBJQwo+Pj4gYW5kIGNsZWFyX2xvY2FsX0FQSUMuCj4+Cj4+IEkgdGhpbmsgZG9pbmcgaXQg
dGhlIG1vc3QgY2FyZWZ1bCB3YXkgaXMgZ29pbmcgdG8gYmUgYmVzdC4gSSBmaW5kIGl0Cj4+IHN1
cnByaXNpbmcgYW55d2F5IHRoYXQgZGlzY29ubmVjdF9ic3BfQVBJQygpIGRvZXNuJ3Qgd3JpdGUg
TFZURVJSCj4+IChvciBvdGhlciBMVlRzIGV4Y2VwdCBmb3IgTFZUMSkgYXQgYWxsLiBUaGUgZnVu
Y3Rpb24gbG9va3MgdG8gaGF2ZSBhCj4+IGdvYWwgb2YgcHV0dGluZyB0aGUgQVBJQyBiYWNrIGlu
dG8gdGhlIHN0YXRlIHRoYXQgd2UgZm91bmQgaXQgd2hlbgo+PiBib290aW5nLgo+IAo+IE1heWJl
IGl0IHdvdWxkIGJlIGJldHRlciB0byBqdXN0IGNhbGwgY2xlYXJfbG9jYWxfQVBJQyBiZWZvcmUg
dHJ5aW5nCj4gdG8gY29uZmlndXJlIExWVHswLzF9LCB3aGljaCB3aWxsIGxlYXZlIExWVDAgaW4g
YSByZXNldCBzdGF0ZSBhbmQgdGh1cwo+IG5vIHdyaXRlIHdvdWxkIGJlIHJlcXVpcmVkIGluIHRo
ZSAhdmlydF93aXJlX3NldHVwIGNhc2U/CgpIYWxmIG9mIG1lIHdhcyBpbXBseWluZyB0aGlzIGFz
IG9uIG9wdGlvbiBmcm9tIHRoZSBlYXJsaWVyIHJlcGx5LgpUaGUgb3RoZXIgaGFsZiB3YXMgdGhp
bmtpbmcgdGhhdCB0aGlzIHdvdWxkIGJlIHF1aXRlIGEgbG90IG9mCmJlaGF2aW9yYWwgY2hhbmdl
IGluIG9uZSBzdGVwLiBCdXQgc2luY2UgeW91IHRoaW5rIHNvIHRvbywgd2h5CmRvbid0IHdlIGdp
dmUgdGhpcyBhIHRyeT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==

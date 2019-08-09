Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB2387E6F
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 17:48:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw765-0007n3-Rk; Fri, 09 Aug 2019 15:46:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hw764-0007my-5r
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 15:46:28 +0000
X-Inumbo-ID: d855db0c-babc-11e9-ad41-c3fbb3a8d053
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d855db0c-babc-11e9-ad41-c3fbb3a8d053;
 Fri, 09 Aug 2019 15:46:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5DFBFAD23;
 Fri,  9 Aug 2019 15:46:25 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <d1ae0cb5-2dfb-7984-62ec-19f7f5a5abaf@suse.com>
 <307c0b92-040a-14d1-eef0-3235c0498751@suse.com>
 <6e849dec-0a0a-27d7-5186-9f994d5f8019@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d3ec7d69-d1d3-3387-8cdc-d03b7cd6c33e@suse.com>
Date: Fri, 9 Aug 2019 17:46:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6e849dec-0a0a-27d7-5186-9f994d5f8019@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/2] x86/xpti: Don't leak TSS-adjacent
 percpu data via Meltdown
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNjo1OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOS8wOC8yMDE5
IDEzOjMyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+PiAtLS0KPj4gVEJEOiBFc3BlY2lhbGx5IHdpdGggaG93IHRo
ZSBwcmV2aW91cyBwYXRjaCBub3cgd29ya3MgSSdtIHVuY29udmluY2VkIG9mCj4+ICDCoMKgwqDC
oCB0aGUgdXRpbGl0eSBvZiB0aGUgbGlua2VyIHNjcmlwdCBhbGlnbm1lbnQgY2hlY2suIEl0IGlu
IHBhcnRpY3VsYXIKPj4gIMKgwqDCoMKgIGRvZXNuJ3QgY2hlY2sgdGhlIHByb3BlcnR5IHdlJ3Jl
IGFmdGVyIGluIHRoaXMgcGF0Y2gsIGkuZS4gdGhlIGZhY3QKPj4gIMKgwqDCoMKgIHRoYXQgdGhl
cmUncyBub3RoaW5nIGVsc2UgaW4gdGhlIHNhbWUgcGFnZS4KPiAKPiBJdCBzaG91bGQgbm93IHBy
b2JhYmx5IGJlIGEgQlVJTERfQlVHX09OKCkgY2hlY2tpbmcgc2l6ZW9mKHRzc19wYWdlKQo+IGJl
aW5nIGV4YWN0bHkgYSBwYWdlLCBnaXZlbiB0aGF0IHRoZXJlIGlzIGFsc28gYSBjb21waWxlIHRp
bWUgYWxpZ25tZW50Cj4gYXNzZXJ0aW9uLgoKV2lsbCBkby4KCj4+IE5COiBTYWRseSBnZXRfcGVy
X2NwdV92YXIoKSBjYW4ndCBhbHNvIGJlIHVzZWQgb24gdGhlICJsZWZ0IiBzaWRlIG9mIGEKPj4g
IMKgwqDCoCAjZGVmaW5lLgo+IAo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IHlvdSBhcmUgdHJ5
aW5nIHRvIGltcGx5IHdpdGggdGhpcy4KCkl0IHdvdWxkIGJlIG5pY2UgdG8gYmUgYWJsZSB0byBz
YXkKCiNkZWZpbmUgZ2V0X3Blcl9jcHVfdmFyKGluaXRfdHNzKSBnZXRfcGVyX2NwdV92YXIoaW5p
dF90c3NfcGFnZS50c3MpCgo+wqAgVGhhdCBzYWlkLCAuLi4KPiAKPj4gLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9wcm9jZXNzb3IuaAo+PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nl
c3Nvci5oCj4+IEBAIC00MTEsNyArNDExLDcgQEAgc3RhdGljIGFsd2F5c19pbmxpbmUgdm9pZCBf
X213YWl0KHVuc2lnbgo+PiAgwqAjZGVmaW5lIElPQk1QX0JZVEVTwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDgxOTIKPj4gIMKgI2RlZmluZSBJT0JNUF9JTlZBTElEX09GRlNFVMKgwqDCoCAweDgw
MDAKPj4gICAKPj4gLXN0cnVjdCBfX3BhY2tlZCBfX2NhY2hlbGluZV9hbGlnbmVkIHRzc19zdHJ1
Y3Qgewo+PiArc3RydWN0IF9fcGFja2VkIHRzc19zdHJ1Y3Qgewo+PiAgwqDCoMKgwqAgdWludDMy
X3QgOjMyOwo+PiAgwqDCoMKgwqAgdWludDY0X3QgcnNwMCwgcnNwMSwgcnNwMjsKPj4gIMKgwqDC
oMKgIHVpbnQ2NF90IDo2NDsKPj4gQEAgLTQyNSw2ICs0MjUsMTEgQEAgc3RydWN0IF9fcGFja2Vk
IF9fY2FjaGVsaW5lX2FsaWduZWQgdHNzXwo+PiAgwqDCoMKgwqAgLyogUGFkcyB0aGUgVFNTIHRv
IGJlIGNhY2hlbGluZS1hbGlnbmVkICh0b3RhbCBzaXplIGlzIDB4ODApLiAqLwo+PiAgwqDCoMKg
wqAgdWludDhfdCBfX2NhY2hlbGluZV9maWxsZXJbMjRdOwo+PiAgwqB9Owo+PiArc3RydWN0IHRz
c19wYWdlIHsKPj4gK8KgwqDCoCBzdHJ1Y3QgdHNzX3N0cnVjdCBfX2FsaWduZWQoUEFHRV9TSVpF
KSB0c3M7Cj4+ICt9Owo+PiArREVDTEFSRV9QRVJfQ1BVKHN0cnVjdCB0c3NfcGFnZSwgaW5pdF90
c3NfcGFnZSk7Cj4+ICsjZGVmaW5lIHBlcl9jcHVfX2luaXRfdHNzIGdldF9wZXJfY3B1X3Zhcihp
bml0X3Rzc19wYWdlLnRzcykKPiAKPiAuLi4gbXkgZmlyc3QgYXR0ZW1wdCBzdGFydGVkIGJ5IHJl
bmFtaW5nIGluaXRfdHNzIGJlY2F1c2UgdGhlIGluaXQgcGFydAo+IGlzIGJvZ3VzLsKgIEkgYmVs
aWV2ZSB3ZSBpbmhlcml0ZWQgdGhpcyBub21lbmNsYXR1cmUgZnJvbSBMaW51eCwgYnV0IHRoYXQK
PiBkb2Vzbid0IG1ha2UgaXQgcmlnaHQuCj4gCj4gSSByZWZlcnJlZCB0aGUgcmVuYW1pbmcgcGF0
Y2ggc3BlY2lmaWNhbGx5IHRvIGFpZCBpbiBiYWNrcG9ydGFiaWxpdHksCj4gYnV0IGdpdmVuIHRo
ZXNlIGNoYW5nZXMgdG8gdGhlIHR5cGUsIGxlYXZpbmcgaXQgYWxvbmUgaXNuJ3QgYW4gb3B0aW9u
Lgo+IAo+IEknbSBub3QgaGFwcHkgd2l0aCBpbnRyb2R1Y2luZyB0aGlzIGRpdmVyc2lvbiwgYmVj
YXVzZSBpdCBtZWFucyB0aGF0IGFsbAo+IHVzZXJzIG9mIHBlcl9jcHUoaW5pdF90c3MpIG5vdyBo
YXZlIHRoZSB3cm9uZyB0eXBlcyBpbiB0aGVpciBoYW5kIGZyb20KPiB0aGUgcG9pbnQgb2Ygdmll
dyBvZiByZWFkaW5nIHRoZSBjb2RlLgo+IAo+IEknbSBzdGlsbCB1bmNlcnRhaW4gd2hpY2ggaXMg
dGhlIGxlYXN0IGJhZCBvcHRpb24gYmV0d2VlbiBiYWNrcG9ydGluZwo+IHRoaXMgdmVyc2lvbiwg
YW5kIGJhY2twb3J0aW5nIHRoZSB2ZXJzaW9uIHdoaWNoIGFkanVzdHMgYWxsIHVzZXJzIC0KPiB0
aGVyZSBhcmVuJ3QgdG9vIG1hbnksIGFuZCBpdHMgZGVmaW5pdGVseSBub3QgdGhlIG1vc3QgYXdr
d2FyZCBiYWNrcG9ydAo+IHdlJ3ZlIGV2ZXIgaGFkIHRvIGRvLgo+IAo+IEkgY291bGQgYmUgcGVy
c3VhZGVkIGludG8ga2VlcGluZyB0aGlzIHZlcnNpb24gZm9yIGxlZ2FjeSB0cmVlcywgc28gbG9u
Zwo+IGFzIGl0IGRvZXNuJ3QgcHJvcGFnYXRlIGludG8gbWFzdGVyLsKgIGkuZS4gdGhpcyBwYXRj
aCBkcm9wcyB0aGUgaW5pdF8KPiBwcmVmaXgsIGFuZCBJJ2xsIHJlYmFzZSBteSByZW5hbWluZyBh
cyBhIDMvMiBhZ2FpbiB3aGljaCBnZXRzIGNvbW1pdHRlZAo+IGF0IGFyb3VuZCBhYm91dCB0aGUg
c2FtZSB0aW1lLgo+IAo+IFRoYXQgd2F5IHdlIHJldGFpbiBhIG5vbi1kZWNlcHRpdmUgY29kZSBp
biBtYXN0ZXIuCj4gCj4gVGhvdWdodHM/CgpJIGhhdmUgbm8gcHJvYmxlbSBhdCBhbGwgZHJvcHBp
bmcgdGhlIGluaXRfIGhlcmUuIEl0J3Mgbm90IGNsZWFyIHRvIG1lCnRob3VnaCB3aGV0aGVyIHlv
dSBzYXlpbmcgIkknbSBub3QgaGFwcHkgd2l0aCBpbnRyb2R1Y2luZyB0aGlzIGRpdmVyc2lvbiIK
aW1wbGllcyBhbnl0aGluZyBmdXJ0aGVyIHRoYXQgeW91J2Qgd2FudCBvciBldmVuIGV4cGVjdCBt
ZSB0byBjaGFuZ2UuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=

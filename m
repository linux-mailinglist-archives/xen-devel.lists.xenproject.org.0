Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 945E013C1AD
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 13:51:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iri72-0000I9-Ac; Wed, 15 Jan 2020 12:49:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wJf7=3E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iri71-0000HN-EH
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 12:49:31 +0000
X-Inumbo-ID: 73ea3e82-3795-11ea-b89f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73ea3e82-3795-11ea-b89f-bc764e2007e4;
 Wed, 15 Jan 2020 12:49:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9906DAF05;
 Wed, 15 Jan 2020 12:49:21 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
 <20200115094703.GH11756@Air-de-Roger>
 <f9b7c06e-54df-bfb2-44d5-b3ef38f2a725@suse.com>
 <20200115115338.GL11756@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c13cbf1e-2e1d-dc17-ec90-a1098a11ec58@suse.com>
Date: Wed, 15 Jan 2020 13:49:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200115115338.GL11756@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/time: update TSC stamp on restore from
 deep C-state
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, andrew.cooper3@citrix.com,
 wl@xen.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDEuMjAyMCAxMjo1MywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEph
biAxNSwgMjAyMCBhdCAxMjo0MDoyN1BNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MTUuMDEuMjAyMCAxMDo0NywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFR1ZSwgSmFu
IDE0LCAyMDIwIGF0IDA3OjM2OjIxUE0gKzAwMDAsIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+Pj4+
IC0tLSBhL3hlbi9hcmNoL3g4Ni90aW1lLmMKPj4+PiArKysgYi94ZW4vYXJjaC94ODYvdGltZS5j
Cj4+Pj4gQEAgLTk1NSwxMCArOTU1LDE2IEBAIHU2NCBzdGltZTJ0c2Moc190aW1lX3Qgc3RpbWUp
Cj4+Pj4gIAo+Pj4+ICB2b2lkIGNzdGF0ZV9yZXN0b3JlX3RzYyh2b2lkKQo+Pj4+ICB7Cj4+Pj4g
KyAgICBzdHJ1Y3QgY3B1X3RpbWUgKnQgPSAmdGhpc19jcHUoY3B1X3RpbWUpOwo+Pj4+ICsKPj4+
PiAgICAgIGlmICggYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX05PTlNUT1BfVFNDKSApCj4+Pj4g
ICAgICAgICAgcmV0dXJuOwo+Pj4+ICAKPj4+PiAtICAgIHdyaXRlX3RzYyhzdGltZTJ0c2MocmVh
ZF9wbGF0Zm9ybV9zdGltZShOVUxMKSkpOwo+Pj4+ICsgICAgdC0+c3RhbXAubWFzdGVyX3N0aW1l
ID0gcmVhZF9wbGF0Zm9ybV9zdGltZShOVUxMKTsKPj4+PiArICAgIHQtPnN0YW1wLmxvY2FsX3Rz
YyA9IHN0aW1lMnRzYyh0LT5zdGFtcC5tYXN0ZXJfc3RpbWUpOwo+Pj4+ICsgICAgdC0+c3RhbXAu
bG9jYWxfc3RpbWUgPSB0LT5zdGFtcC5tYXN0ZXJfc3RpbWU7Cj4+Pj4gKwo+Pj4+ICsgICAgd3Jp
dGVfdHNjKHQtPnN0YW1wLmxvY2FsX3RzYyk7Cj4+Pgo+Pj4gSW4gb3JkZXIgdG8gYXZvaWQgdGhl
IFRTQyB3cml0ZSAoYW5kIHRoZSBsaWtlbHkgYXNzb2NpYXRlZCB2bWV4aXQpLAo+Pj4gY291bGQg
eW91IGluc3RlYWQgZG86Cj4+Pgo+Pj4gdC0+c3RhbXAubG9jYWxfc3RpbWUgPSB0LT5zdGFtcC5t
YXN0ZXJfc3RpbWUgPSByZWFkX3BsYXRmb3JtX3N0aW1lKE5VTEwpOwo+Pj4gdC0+c3RhbXAubG9j
YWxfdHNjID0gcmR0c2Nfb3JkZXJlZCgpOwo+Pj4KPj4+IEkgdGhpbmsgaXQgc2hvdWxkIGFjaGll
dmUgdGhlIHNhbWUgYXMgaXQgc3luY3MgdGhlIGxvY2FsIFRTQyBzdGFtcCBhbmQKPj4+IHRpbWVz
LCB3b3VsZCBhdm9pZCB0aGUgVFNDIHdyaXRlIGFuZCBzbGlnaHRseSBzaW1wbGlmaWVzIHRoZSBs
b2dpYy4KPj4KPj4gV291bGRuJ3QgdGhpcyByZXN1bHQgaW4gZ3Vlc3RzIHBvc3NpYmx5IG9ic2Vy
dmluZyB0aGUgVFNDIG1vdmluZwo+PiBiYWNrd2FyZHM/Cj4gCj4gSXNuJ3QgbG9jYWxfdHNjIHN0
b3JpbmcgYSBUU0MgdmFsdWUgcmVhZCBmcm9tIHRoZSBzYW1lIENQVSBhbHdheXMsIGFuZAo+IGhl
bmNlIGNvdWxkIG9ubHkgZ28gYmFja3dhcmRzIGlmIHJkdHNjIGFjdHVhbGx5IGdvZXMgYmFja3dh
cmRzPwoKRm9yIG9uZSBJIGhhdmUgdG8gYWRtaXQgSSB3YXMgKG1pc3Rha2VubHkpIHRoaW5raW5n
IG9mIHdha2V1cApmcm9tIFMgc3RhdGVzIG1vcmUgdGhhbiB0aGF0IGZyb20gQyBzdGF0ZXMuIFNv
IGFzc3VtaW5nIHRoZQpUU0MgaW5kZWVkIG9ubHkgc3RvcHMgKGJ1dCB3b24ndCBnZXQgZS5nLiBy
ZXN0YXJ0ZWQpLCBiYWNrd2FyZHMKbW92ZXMgb3VnaHQgdG8gYmUgZXhjbHVkZWQuIFdoYXQgSSdt
IHRoZW4gd29ycmllZCBhYm91dCBpcyB0b28KbGl0dGxlIHByb2dyZXNzIG9ic2VydmFibGUgYnkg
Z3Vlc3RzLiBUaGUgUFYgdGltZSBwcm90b2NvbApvdWdodCB0byBiZSBmaW5lIGluIHRoaXMgcmVn
YXJkIChhbmQgY29uc3VtZXJzIG9mIHJhdyBUU0MgdmFsdWVzCmFyZSBvbiB0aGVpciBvd24gYW55
d2F5KSwgYnV0IHdvdWxkbid0IHlvdSBuZWVkIHRvIHVwZGF0ZSBUU0MKb2Zmc2V0cyBvZiBIVk0g
Z3Vlc3RzIGluIG9yZGVyIHRvIGNvbXBlbnNhdGUgZm9yIHRoZSBlbGFwc2VkCnRpbWU/Cgo+IEll
OiBjcHVfZnJlcXVlbmN5X2NoYW5nZSBzZWVtcyB0byBkbyBzb21ldGhpbmcgc2ltaWxhciwgdG9n
ZXRoZXIgd2l0aAo+IGEgcmUtYWRqdXN0aW5nIG9mIHRoZSB0aW1lIHNjYWxlLCBidXQgZG9lc24n
dCBwZXJmb3JtIGFueSBUU0Mgd3JpdGUuCgpBIFAtc3RhdGUgY2hhbmdlIGF0IG1vc3QgYWx0ZXJz
IHRoZSB0aGUgdGljayByYXRlLCBidXQgd291bGRuJ3QKc3RvcCBvciBldmVuIHJlc2V0IHRoZSBU
U0MgKGFmYWljdCkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=

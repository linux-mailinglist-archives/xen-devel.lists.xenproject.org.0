Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC55884A21
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 12:53:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvJWk-0007Jm-UO; Wed, 07 Aug 2019 10:50:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvJWj-0007Jh-HB
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 10:50:41 +0000
X-Inumbo-ID: 307afb7c-b901-11e9-bf64-130769d783cd
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 307afb7c-b901-11e9-bf64-130769d783cd;
 Wed, 07 Aug 2019 10:50:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B8F6DAE48;
 Wed,  7 Aug 2019 10:50:36 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190805124301.12887-1-andrew.cooper3@citrix.com>
 <20190805124301.12887-3-andrew.cooper3@citrix.com>
 <873a4d08-82c7-0342-7576-ba5cb2b8ae45@suse.com>
 <f594ca01-b0ee-b577-b53b-ae92694b99de@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a5ec34fe-9984-4c94-8d2d-7dc3619facc6@suse.com>
Date: Wed, 7 Aug 2019 12:50:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f594ca01-b0ee-b577-b53b-ae92694b99de@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/4] x86/boot: Minor improvements to
 efi_arch_post_exit_boot()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMjAxOSAxMjozMywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNi8wOC8yMDE5
IDE2OjIwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDUuMDguMjAxOSAxNDo0MiwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IFNwbGl0IHVwIHRoZSBsb25nIGFzbSBibG9jayBieSBjb21tZW50
aW5nIHRoZSBsb2dpY2FsIHN1YnNlY3Rpb25zLgo+Pj4KPj4+IFRoZSBtb3ZhYnMgZm9yIG9idGFp
bmluZyBfX3N0YXJ0X3hlbiBjYW4gYmUgYSByaXAtcmVsYXRpdmUgbGVhCj4+PiBpbnN0ZWFkLsKg
IFRoaXMKPj4+IGhhcyB0aGUgYWRkZWQgYWR2YW50YWdlIHRoYXQgb2JqZHVtcCBjYW4gbm93IGNy
b3NzIHJlZmVyZW5jZSBpdCBkdXJpbmcKPj4+IGRpc2Fzc2VtYmx5Lgo+Pgo+PiBJJ20gc3VycHJp
c2VkIHRoaXMgd29ya3MsIGJ1dCBJIHRha2UgaXQgdGhhdCB5b3UndmUgdGVzdGVkIGl0Ogo+IAo+
IFNvIEkgZGlkIHNwZWNpZmljYWxseSB0ZXN0IGl0LCBidXQgaXQgbm93IG9jY3VycyB0byBtZSB0
aGF0IHRoZSB0ZXN0IEkKPiBkaWQgd2FzIHZpYSB0aGUgTUIyIDY0LWJpdCBFRkkgcGF0aCwgd2hp
Y2ggaXNuJ3QgdGhpcyBwYXRoLsKgIC9zaWdoCj4gCj4+IEF0IHRoZSB0aW1lIHRoZSBhc20oKSBl
eGVjdXRlcywgSSB0aG91Z2h0IHdlJ3JlIHN0aWxsIGluICh3aGF0IEVGSQo+PiBjYWxscykgcGh5
c2ljYWwgbW9kZSwgaS5lLiAlcmlwIGhvbGRpbmcgYSB2YWx1ZSBsZXNzIHRoYW4gNEdiLgo+IAo+
IEluIHdoaWNoIGNhc2UsIHdoYXQgaXMgdGhlIHBvaW50IG9mIHVzaW5nIGEgZmlsZSBmb3JtYXQg
d2hpY2ggZG9lcwo+IGlkZW50aWZ5IHRoZSB2aXJ0dWFsIGFkZHJlc3MgaXQgd291bGQgcHJlZmVy
IHRvIHJ1biBhdC4uLgo+IAo+IChUaGlzIGlzIGEgcmhldG9yaWNhbCBxdWVzdGlvbi7CoCBUaGUg
YW5zd2VyIGlzICJiZWNhdXNlIEVGSSBzZWVtcyB0bwo+IGFsd2F5cyBkbyB0aGUgdW5oZWxwZnVs
IHRoaW5nLCBnaXZlbiB0aGUgY2hvaWNlIi4pCgpOb3QgYSByaGV0b3JpY2FsIHF1ZXN0aW9uIGF0
IGFsbC4gQXMgc2FpZCAtIHRoZSBwcmUtT1MgZW52aXJvbm1lbnQKaXMgYSBwaHlzaWNhbCBvbmUs
IGhlbmNlIHJlbG9jYXRpbmcgYmluYXJpZXMgdG8gdGhlaXIgcHJlZmVycmVkCmFkZHJlc3NlcyBt
YXkgKGFuZCB3aXRoIHRoZSBhZGRyZXNzZXMgd2UgdXNlIGRlZmluaXRlbHkgaXMpIG5vdApwb3Nz
aWJsZS4gSGVuY2UgdGhlbSByZWxvY2F0aW5nIGltYWdlcyBieSBkZWZhdWx0LgoKPj4gQWNjZXNz
aW5nIG1lbW9yeSB1c2luZyAlcmlwLXJlbGF0aXZlIGFkZHJlc3NpbmcgaXMgZmluZSwgc2luY2UK
Pj4gdGhlIFhlbiBpbWFnZSBpcyBtYXBwZWQgaW4gYm90aCBwbGFjZXMsIGJ1dCBvYnRhaW5pbmcg
dGhlIG5ldwo+PiBsaW5lYXIgYWRkcmVzcyBmb3IgJXJpcCB0aGlzIHdheSB2aWEgbGVhIHNob3Vs
ZCBub3QgYmUsIGFzIHRoaXMKPj4gd291bGRuJ3QgbW92ZSB1cyB0byB0aGUgWEVOX1ZJUlRfe1NU
QVJULEVORH0gcmFuZ2UuIEknbSBjdXJpb3VzCj4+IHRvIGxlYXJuIHdoaWNoIHBhcnQgb2YgbXkg
dW5kZXJzdGFuZGluZyBpcyB3cm9uZyBoZXJlLgo+Pgo+Pj4gVGhlIHN0YWNrIGhhbmRpbmcgaXMg
Y29uZnVzaW5nIHRvIGZvbGxvdy7CoCAlcnNwIGlzIHNldCB1cCBieSByZWFkaW5nCj4+PiBzdGFj
a19zdGFydCB3aGljaCBpcyBhIHBvaW50ZXIgdG8gY3B1MF9zdGFjaywgdGhlbiBjb25zdHJ1Y3Rp
bmcgYW4KPj4+IGxyZXQgZnJhbWUKPj4+IHVuZGVyICVyc3AgKHRvIGF2b2lkIGNsb2JiZXJpbmcg
d2hhdGV2ZXIgaXMgYWRqYWNlbnQgdG8gY3B1MF9zdGFjayksCj4+PiBhbmQgdXNlcwo+Pj4gdGhl
IFBhc2NhbCBmb3JtIG9mIGxyZXQgdG8gbW92ZSAlcnNwIHRvIHRoZSBiYXNlIG9mIGNwdTBfc3Rh
Y2suCj4+Pgo+Pj4gUmVtb3ZlIHN0YWNrX3N0YXJ0IGZyb20gdGhlIG1peCBhbmQgdXNlIGEgc2lu
Z2xlIGxlYSB0byBsb2FkCj4+PiBjcHUwX3N0YWNrIGJhc2UKPj4+IGRpcmVjdGx5LAo+Pgo+PiBJ
IGRpc2FncmVlIHdpdGggdGhpcyBjaGFuZ2UsIGF0IGxlYXN0IGFzIGxvbmcgYXMKPj4geGVuL2Fy
Y2gveDg2L2Jvb3QveDg2XzY0LlMgYWxzbyByZWFkcyBmcm9tIHN0YWNrX3N0YXJ0LCByYXRoZXIg
dGhhbgo+PiBhY2Nlc3NpbmcgY3B1MF9zdGFjayBkaXJlY3RseS4KPiAKPiBUaGF0IGRvZXNuJ3Qg
bWVhbiB0aGF0IGEpIGl0cyBjb25jZXB0dWFsbHkgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIC4uLgo+
IAo+PiBUaGUgY29kZSBoZXJlIGlzIGludGVuZGVkIHRvIG1pcnJvcgo+PiB3aGF0J3MgYmVpbmcg
ZG9uZSBvbiB0aGUgbm9uLUVGSSBwYXRoLsKgIEFuZCBpdCB3YXMgYWx3YXlzIG15Cj4+IHVuZGVy
c3RhbmRpbmcgdGhhdCBpdCdzIGRvbmUgdGhpcyB3YXkgc3VjaCB0aGF0IG9uZSB3b3VsZCBuZWVk
IHRvIGdvCj4+IGh1bnQgZm9yIHVzZXMgaWYgb25lIHdhbnRlZCB0byBjaGFuZ2Ugd2hhdCAocmln
aHQgbm93KSBzdGFja19zdGFydAo+PiBwb2ludHMgYXQgZHVyaW5nIHByZS1TTVAgYm9vdC4gT3Ro
ZXJ3aXNlIHN0YWNrX3N0YXJ0IHdvdWxkbid0IG5lZWQKPj4gYW4gaW5pdGlhbGl6ZXIgYW55bW9y
ZSwgYW5kIGhlbmNlIGNvdWxkIG1vdmUgdG8gLmJzcy4KPiAKPiAuLi4gb3IgYikgdGhhdCBJIGhh
dmUgYW55IGludGVudGlvbiBvZiBsZXR0aW5nIHN0YWNrX3N0YXJ0IHN1cnZpdmUuCj4gU3BlY2lm
aWNhbGx5LCBpdCBpcyBhbiB1bm5lY2Vzc2FyeSBwb2ludCBvZiBzZXJpYWxpc2F0aW9uIGZvciBB
UHMsIHdoaWNoCj4gbmVlZHMgdG8gZGlzYXBwZWFyLgo+IAo+IGNwdTBfc3RhY2sgaXMgd2hlcmUg
Y3B1MCBzaG91bGQgaGF2ZSBpdHMgc3RhY2ssIGFuZCB0aGlzIHBhdGggaXMKPiBleGNsdXNpdmUg
dG8gY3B1MC4KCkFuZCBJJ2QgYmUgb2theSAoYnV0IG5vdCBlbnRodXNpYXN0aWMpIHRvIHNlZSB0
aGUgb3RoZXIgQ1BVMCB1c2UKZGlzYXBwZWFyIGF0IHRoZSBzYW1lIHRpbWUgKHNhbWUgc2VyaWVz
IGF0IGxlYXN0LCBub3QgbmVjZXNzYXJpbHkKc2FtZSBwYXRjaCkuCgo+Pj4gYW5kIHVzZSB0aGUg
bW9yZSBjb21tb24gcHVzaC9wdXNoL2xyZXRxIHNlcXVlbmNlIGZvciByZWxvYWRpbmcgJWNzLgo+
Pgo+PiBJIGRvbid0IHNlZSB3aGF0J3Mgd3Jvbmcgd2l0aCB3aGF0IHlvdSBjYWxsICJQYXNjYWwg
Zm9ybSIgb2YgbHJldAo+PiAoQydzIF9fc3RkY2FsbCB1c2VzIHRoaXMgYXMgd2VsbCwgZm9yIGV4
YW1wbGUpLgo+IAo+IEknbSBhZnJhaWQgdGhhdCB0aGlzIHN0YXRlbWVudCBjbGVhcmx5IGhpZ2hs
aWdodHMgdGhlIHByb2JsZW0gSSdtIHRyeWluZwo+IHRvIHNvbHZlLgoKPz8/Cgo+PiBJIGRvbid0
IGhlYXZpbHkKPj4gbWluZCB0aGlzIHRyYW5zZm9ybWF0aW9uLCBidXQgKEknbSBzb3JyeSB0byBz
YXkgdGhhdCkgaXQgbG9va3MgdG8KPj4gbWUgYXMgaWYgdGhpcyB3YXMgYSBjaGFuZ2UgZm9yIHRo
ZSBzYWtlIG9mIGNoYW5naW5nIHRoZSBjb2RlLCBub3QKPj4gZm9yIG1ha2luZyBpdCBhbnkgImJl
dHRlciIgKGZvciB3aGF0ZXZlciBkZWZpbml0aW9uIG9mICJiZXR0ZXIiKS4KPiAKPiBJdCByZWFs
bHkgZG9lc24ndCBtYXR0ZXIgaWYgeW91IGNhbiBmb2xsb3cgdGhlIGNvZGUsIG9yIHdoZXRoZXIg
SSBjYW4KPiBmb2xsb3cgaXQgd2hlbiBJJ3ZlIGRvdWJsZSBjaGVja2VkIHRoZSBpbnN0cnVjdGlv
biBiZWhhdmlvdXIgYmVjYXVzZSwKPiB3aGlsZSBJJ20gYXdhcmUgdGhpcyBmb3JtIGV4aXN0cywg
ZnJhbmtseSBJJ20gYSBsaXR0bGUgcnVzdHkgb24gUGFzY2FsCj4gaXQgaGF2aW5nIGNlYXNlZCB0
byBiZSBhIGRvbWluYW50IHByb2dyYW1taW5nIGxhbmd1YWdlIGJlZm9yZSBJIHdhcyBib3JuLi4u
CgpTdGlsbCwgSSBkb24ndCBzZWUgd2hhdCBQYXNjYWwgaGFzIGdvdCB0byBkbyB3aXRoIGl0IG90
aGVyIHRoYW4gaXQKYmVpbmcgKGhhdmluZyBiZWVuKSBvbmUgb2YgdGhlIHVzZXJzIG9mIGl0LiBJ
IGRvbid0IHRoaW5rIGluc24gdXNlCmluIG91ciBjb2RlIGJhc2Ugc2hvdWxkIGJlIGluZmx1ZW5j
ZWQgYnkgd2hhdCBsYW5ndWFnZXMgb3Igb3RoZXIKZW52aXJvbm1lbnRzIHVzZSB0aGVtLiBJZiB0
aGV5J3JlIHN1aXRhYmxlIGZvciB0aGUgcHVycG9zZSwgdGhleSdyZQpmaW5lIHRvIHVzZS4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

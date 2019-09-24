Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2747CBCB3F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 17:24:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCmeQ-0006k2-VO; Tue, 24 Sep 2019 15:22:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCmeO-0006jh-Ry
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:22:48 +0000
X-Inumbo-ID: 29294f50-dedf-11e9-9621-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 29294f50-dedf-11e9-9621-12813bfff9fa;
 Tue, 24 Sep 2019 15:22:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B6DC2B62F;
 Tue, 24 Sep 2019 15:22:45 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-31-jgross@suse.com>
 <2ad8a8ce-4530-93c7-0161-9b806a38b05d@suse.com>
 <0e4a75eb-61cc-2c9c-0d8a-f854163acd57@suse.com>
 <6288a88b-a5d8-dbd6-15c7-45ed19324510@suse.com>
 <29772d95-7528-2902-890a-1a11235f5b2e@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e00a1ec0-63ba-d2b6-9bb8-7695cd8bd7fd@suse.com>
Date: Tue, 24 Sep 2019 17:22:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <29772d95-7528-2902-890a-1a11235f5b2e@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 30/47] xen/sched: add support for
 multiple vcpus per sched unit where missing
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMjAxOSAxNzowOSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyNC4wOS4xOSAx
NzowMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI0LjA5LjIwMTkgMTY6NDEsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAyMy4wOS4xOSAxNzo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMTQuMDkuMjAxOSAxMDo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4gQEAgLTE4
NTEsNyArMTg1Miw3IEBAIHZvaWQgc2NoZWRfY29udGV4dF9zd2l0Y2hlZChzdHJ1Y3QgdmNwdSAq
dnByZXYsIHN0cnVjdCB2Y3B1ICp2bmV4dCkKPj4+Pj4gICAgICAgICAgICAgICAgd2hpbGUgKCBh
dG9taWNfcmVhZCgmbmV4dC0+cmVuZGV6dm91c19vdXRfY250KSApCj4+Pj4+ICAgICAgICAgICAg
ICAgICAgICBjcHVfcmVsYXgoKTsKPj4+Pj4gICAgICAgIH0KPj4+Pj4gLSAgICBlbHNlIGlmICgg
dnByZXYgIT0gdm5leHQgKQo+Pj4+PiArICAgIGVsc2UgaWYgKCB2cHJldiAhPSB2bmV4dCAmJiBz
Y2hlZF9ncmFudWxhcml0eSA9PSAxICkKPj4+Pj4gICAgICAgICAgICBjb250ZXh0X3NhdmVkKHZw
cmV2KTsKPj4+Pj4gICAgfQo+Pj4+Cj4+Pj4gV291bGQgeW91IG1pbmQgaGVscGluZyBtZSB3aXRo
IHVuZGVyc3RhbmRpbmcgd2h5IHRoaXMgY2FsbCBpcwo+Pj4+IG5lZWRlZCB3aXRoIGEgZ3JhbnVs
YXJpdHkgb2YgMSBvbmx5Pwo+Pj4KPj4+IE90aGVyd2lzZSBpdCBpcyBkb25lIGp1c3QgYSBmZXcg
bGluZXMgdXAgKGdyYW51bGFyaXR5IDEgd2lsbCByZXN1bHQKPj4+IGluIHJlbmRlenZvdXNfb3V0
X2NudCBiZWluZyB6ZXJvKS4KPj4KPj4gSS5lLiBpZiBpcyByZW5kZXp2b3VzX291dF9jbnQgaXMg
emVybyBhbmQgdnByZXYgIT0gdm5leHQgYnV0Cj4+IHNjaGVkX2dyYW51bGFyaXR5ID4gMSB0aGUg
Y2FsbCBpc24ndCBuZWVkZWQ/IFdoeT8gQXQgdGhlIGVuZCBvZgo+IAo+IEkgY2FuIGFkZCBhbiBB
U1NFUlQoKSBoZXJlLiBUaGlzIHNob3VsZCBuZXZlciBoYXBwZW4uCgpBaCB5ZXMsIHRoaXMgd291
bGQgYWRkcmVzcyBteSBxdWVzdGlvbi4KCj4+IHRoZSBzZXJpZXMgdmNwdV9jb250ZXh0X3NhdmVk
KCkgZ2V0cyBjYWxsZWQgaW4gYWxsIGNhc2VzOyB3aGF0J3MKPj4gY29uZGl0aW9uYWwgdXBvbiBn
cmFudWxhcml0eSBiZWluZyAxIHRoZXJlIGlzIHRoZSBjYWxsIHRvCj4+IHVuaXRfY29udGV4dF9z
YXZlZCgpLgo+IAo+IHZjcHVfY29udGV4dF9zYXZlZCgpIGF0IHRoZSBlbmQgb2YgdGhlIHNlcmll
cyBpcyB0ZXN0aW5nIHZwcmV2ICE9IHZuZXh0LgoKQnV0IHRoYXQgcGFydCBvZiB0aGUgY29uZGl0
aW9uYWwgd2FzIG5vdCB1bmRlciBxdWVzdGlvbi4KCj4+PiBmb3JfZWFjaF9zY2hlZF91bml0X3Zj
cHUoKSBmb3IgYW4gaWRsZQo+Pj4gdW5pdCBtaWdodCBlbmQgcHJlbWF0dXJlIHdoZW4gb25lIG9m
IHRoZSB2Y3B1cyBpcyBydW5uaW5nIGluIGFub3RoZXIKPj4+IHVuaXQgKGlkbGVfdmNwdS0+c2No
ZWRfdW5pdCAhPSBpZGxlX3VuaXQpLgo+Pgo+PiBPaCwgdGhhdCAodiktPnNjaGVkX3VuaXQgPT0g
KGkpIGluIHRoZSBjb25zdHJ1Y3QgaXMgY2xlYXJseSB1bmV4cGVjdGVkLgo+PiBJcyB0aGlzIHJl
YWxseSBzdGlsbCBuZWVkZWQgYnkgdGhlIGVuZCBvZiB0aGUgc2VyaWVzPyBJIHJlYWxpemUgdGhh
dAo+PiBfc29tZV8gY2hlY2sgaXMgbmVlZGVkLCBidXQgY291bGQgdGhpcyBwZXJoYXBzIGJlIGFy
cmFuZ2VkIGluIGEgd2F5Cj4+IHRoYXQgeW91J2Qgc3RpbGwgaGl0IGFsbCB2Q1BVLXMgd2hlbiB1
c2luZyBpdCBvbiBhbiBpZGxlIHVuaXQsIG5vCj4+IG1hdHRlciB3aGV0aGVyIHRoZXkncmUgaW4g
dXNlIGFzIGEgc3Vic3RpdHV0ZSBpbiBhICJyZWFsIiB1bml0Pwo+IAo+IEkgY291bGQgZG8gdGhh
dCBieSBoYXZpbmcgYW5vdGhlciBsaW5rZWQgbGlzdCBpbiBzdHJ1Y3QgdmNwdS4gVGhpcyB3YXkK
PiBJIGNhbiBhdm9pZCBpdC4KCk9oLCBubywgbm90IGFub3RoZXIgbGlzdCBqdXN0IGZvciB0aGlz
IHB1cnBvc2UuIEkgd2FzIHJhdGhlciB0aGlua2luZwpvZiBlLmcuIGEgY29tcGFyaXNvbiBvZiBJ
RHMuCgo+PiBBcyB0byB0aGF0IGNvbnN0cnVjdCAtIHdoeSBpcyB0aGUgcGFyYW1ldGVyIG5hbWVk
ICJpIiByYXRoZXIgdGhhbiAidSI/Cj4+IEFuZCB3aHkgImUiIGluIGZvcl9lYWNoX3NjaGVkX3Vu
aXQoKT8KPiAKPiAiaSIgbGlrZSAiaXRlbSIgKHNvbWVob3cgdGhpcyBzdXJ2aXZlZCB0aGUgYmln
IHJlbmFtZSkuIENhbiBjaGFuZ2UgaXQuCj4gImUiIGxpa2UgImVsZW1lbnQiLiBJIHRoaW5rIHRo
aXMgaXMgYW5vdGhlciByZWxpYy4gQ2FuIGNoYW5nZSBpdCwgdG9vLgoKSSdkIGFwcHJlY2lhdGUg
dGhpcywgYXMgaXQgd291bGQgZ2V0IHRoaXMgbW9yZSBpbiBsaW5lIHdpdGggdGhlIG90aGVyCnNp
bWlsYXIgbWFjcm9zLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 462A9A81BA
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 14:05:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5TzY-0001oP-EJ; Wed, 04 Sep 2019 12:02:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5TzX-0001oJ-1g
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 12:02:27 +0000
X-Inumbo-ID: dc3ff42e-cf0b-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc3ff42e-cf0b-11e9-978d-bc764e2007e4;
 Wed, 04 Sep 2019 12:02:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4B81EB623;
 Wed,  4 Sep 2019 12:02:25 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <23892a29-60ef-b1e4-9e19-024559e0d2a0@suse.com>
 <8cca5d7f-5a6b-0826-b15d-2a5f42d1a3f2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1a3daf98-fa1c-de45-2c1e-54840b1e3ba8@suse.com>
Date: Wed, 4 Sep 2019 14:02:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8cca5d7f-5a6b-0826-b15d-2a5f42d1a3f2@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/shadow: don't enable shadow mode with
 too small a shadow allocation (part 2)
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Tim Deegan <tim@xen.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMjAxOSAxMzoyOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNC8wOS8yMDE5
IDA4OjU1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gQ29tbWl0IDI2MzRiOTk3YWYgKCJ4ODYvc2hh
ZG93OiBkb24ndCBlbmFibGUgc2hhZG93IG1vZGUgd2l0aCB0b28gc21hbGwKPj4gYSBzaGFkb3cg
YWxsb2NhdGlvbiIpIHdhcyBpbmNvbXBsZXRlOiBUaGUgYWRqdXN0bWVudCBkb25lIHRoZXJlIHRv
Cj4+IHNoYWRvd19lbmFibGUoKSBpcyBhbHNvIG5lZWRlZCBpbiBzaGFkb3dfb25lX2JpdF9lbmFi
bGUoKS4gVGhlIChuZXcpCj4+IHByb2JsZW0gcmVwb3J0IHdhcyAoYXBwYXJlbnRseSkgYSBmYWls
ZWQgUFYgZ3Vlc3QgbWlncmF0aW9uIGZvbGxvd2VkIGJ5Cj4+IGFub3RoZXIgbWlncmF0aW9uIGF0
dGVtcHQgZm9yIHRoYXQgc2FtZSBndWVzdC4gRGlzYWJsaW5nIGxvZy1kaXJ0eSBtb2RlCj4+IGFm
dGVyIHRoZSBmaXJzdCBvbmUgaGFkIGxlZnQgYSBjb3VwbGUgb2Ygc2hhZG93IHBhZ2VzIGFsbG9j
YXRlZCAocGVyaGFwcwo+PiBzb21ldGhpbmcgdGhhdCBhbHNvIHdhbnRzIGZpeGluZyksIGFuZCBo
ZW5jZSB0aGUgc2Vjb25kIGVuYWJsaW5nIG9mCj4+IGxvZy1kaXJ0eSBtb2RlIHdvdWxkbid0IGhh
dmUgYWxsb2NhdGVkIGFueXRoaW5nIGZ1cnRoZXIuCj4+Cj4+IFJlcG9ydGVkLWJ5OiBKYW1lcyBX
YW5nIDxqbndhbmdAc3VzZS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPj4KPj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24u
Ywo+PiArKysgYi94ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jCj4+IEBAIC0yODY0LDcg
KzI4NjQsOCBAQCBzdGF0aWMgaW50IHNoYWRvd19vbmVfYml0X2VuYWJsZShzdHJ1Y3QKPj4gIAo+
PiAgICAgIG1vZGUgfD0gUEdfU0hfZW5hYmxlOwo+PiAgCj4+IC0gICAgaWYgKCBkLT5hcmNoLnBh
Z2luZy5zaGFkb3cudG90YWxfcGFnZXMgPT0gMCApCj4+ICsgICAgaWYgKCBkLT5hcmNoLnBhZ2lu
Zy5zaGFkb3cudG90YWxfcGFnZXMgPAo+PiArICAgICAgICAgc2hfbWluX2FsbG9jYXRpb24oZCkg
KyBkLT5hcmNoLnBhZ2luZy5zaGFkb3cucDJtX3BhZ2VzICkKPiAKPiBUaGlzIGxvZ2ljIGxvb2tz
IHN1c3BlY3QuwqAgVGhlIGNoYW5nZSBmcm9tID09IDAgdG8gPCBtaW4gbG9va3MgZmluZSwgYW5k
Cj4gZmVlbHMgbGlrZSB0aGUgcmlnaHQgdGhpbmcgdG8gZG8uCj4gCj4gSG93ZXZlcizCoCBzaF9t
aW5fYWxsb2NhdGlvbigpIHNob3VsZCBieSBkZWZpbml0aW9uIGJlIHRoZSBtaW5pbXVtCj4gcXVh
bnRpdHkgb2YgcGFnZXMgbmVjZXNzYXJ5IGZvciB0aGluZ3MgdG8gZnVuY3Rpb24sIHdoaWNoIG1h
a2VzIHRoZSArIG9uCj4gdGhlIGVuZCBsb29rIHdyb25nLgoKV2VsbCwgdGhlIGNoYW5nZSBoZXJl
IGJyaW5ncyBzaGFkb3dfb25lX2JpdF9lbmFibGUoKSBpbiBsaW5lIHdpdGgKc2hhZG93X2VuYWJs
ZSgpLiBXaGF0IHlvdSBzdWdnZXN0IGlzIGEgMm5kIGNoYW5nZSwgYWxzbyByZXF1aXJpbmcKYW4g
YWRqdXN0bWVudCB0byBzaGFkb3dfc2V0X2FsbG9jYXRpb24oKS4gQmFjayB3aGVuIHB1dHRpbmcK
dG9nZXRoZXIgMjYzNGI5OTdhZiBmb3Igc29tZSByZWFzb24gSSB0aG91Z2h0IGl0IHdvdWxkIGJl
CmNvcnJlY3QgdG8gbW92ZSB0aGUgcDJtX3BhZ2VzIGFkZGl0aW9uIGludG8gc2hfbWluX2FsbG9j
YXRpb24oKSwKYnV0IGxvb2tpbmcgYWdhaW4gbm93IEkgdGhpbmsgdGhpcyBvdWdodCB0byBiZSBx
dWl0ZSBmaW5lLgoKVGhlcmUncyBhIHBvc3NpYmxlIGFyZ3VtZW50IGFnYWluc3QgZG9pbmcgdGhp
cyAob3IgYWdhaW5zdCBpdApiZWluZyBjb3JyZWN0KSwgdGhvdWdoOiBXaGVuIHAybV9wYWdlcyBp
cyBhbHJlYWR5IG5vbi16ZXJvLCB3aHkKd291bGQgaXQgYmUgY29ycmVjdCBmb3Igc2hfbWluX2Fs
bG9jYXRpb24oKSB0byBhZGQgaW4gdGhhdCB2YWx1ZQpfYW5kXyBhbHNvIGFjY291bnQgZm9yIHRv
LWJlLWFsbG9jYXRlZCBQMk0gcGFnZXMgaXRzZWxmPwpTaG91bGRuJ3QgaXQgdGhlbiByYXRoZXIg
YmUgdGhlIG1heGltdW0gb2YgdGhlIGN1cnJlbnQgYW5kCnByb3NwZWN0ZWQgdmFsdWVzPyAoVG8g
bWUgdGhpcyBpcyBhIGNsZWFyIGFyZ3VtZW50IGZvciBub3QKZm9sZGluZyBpbiBzdWNoIGFuIGFk
anVzdG1lbnQgaW50byB0aGUgcGF0Y2ggaGVyZS4pCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

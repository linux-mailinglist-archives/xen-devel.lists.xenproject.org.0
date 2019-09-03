Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE60EA69E2
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 15:31:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i58pZ-0002xY-5C; Tue, 03 Sep 2019 13:26:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j28/=W6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i58pX-0002xH-1g
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 13:26:43 +0000
X-Inumbo-ID: 7707fec0-ce4e-11e9-ab94-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7707fec0-ce4e-11e9-ab94-12813bfff9fa;
 Tue, 03 Sep 2019 13:26:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 95297B11B;
 Tue,  3 Sep 2019 13:26:40 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190828080028.18205-1-jgross@suse.com>
 <20190828080028.18205-4-jgross@suse.com>
 <46c66d92-87c0-d90f-921d-68082d52c798@suse.com>
 <fb6cf90c-6ddc-f605-8b18-06010f17fbb4@suse.com>
 <8c915d3c-c022-a397-bf43-db98111ffd0a@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <439c045b-127b-1944-a47d-4d33a0e42773@suse.com>
Date: Tue, 3 Sep 2019 15:26:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8c915d3c-c022-a397-bf43-db98111ffd0a@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v3 3/4] xen: refactor debugtrace data
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMTkgMTM6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDAzLjA5LjIwMTkgMTI6
MzEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDAzLjA5LjE5IDEyOjE2LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDI4LjA4LjIwMTkgMTA6MDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgZGVidWd0cmFjZV9raWxvYnl0ZXMgPSAxMjg7Cj4+Pgo+
Pj4gU2luY2UgeW91IHRvdWNoIHRoaXMgYW55d2F5LCBhZGQgX19pbml0ZGF0YT8gTWF5YmUgYWxz
byBtb3ZlIGl0Cj4+PiBuZXh0IHRvIGl0cyBpbnRlZ2VyX3BhcmFtKCk/Cj4+Cj4+IFRoaXMgaXMg
bW9kaWZpZWQgaW4gcGF0Y2ggNCBhZ2FpbiwgYW5kIHRoZXJlIEkgbmVlZCBpdCBpbiB0aGUgcnVu
bmluZwo+PiBzeXN0ZW0gZm9yIHN1cHBvcnQgb2YgY3B1IGhvdHBsdWcgd2l0aCBwZXItY3B1IGJ1
ZmZlcnMuCj4gCj4gUmlnaHQsIEkndmUgbWVhbndoaWxlIG5vdGljZWQgdGhpcy4gSGVuY2UgaXQn
cyBmaW5lIHRvIGtlZXAgYXMgaXMuCj4gCj4+Pj4gQEAgLTE2NSwxMiArMTcxLDE0IEBAIHN0YXRp
YyBpbnQgX19pbml0IGRlYnVndHJhY2VfaW5pdCh2b2lkKQo+Pj4+ICAgICAgICAgICAgcmV0dXJu
IDA7Cj4+Pj4gICAgCj4+Pj4gICAgICAgIG9yZGVyID0gZ2V0X29yZGVyX2Zyb21fYnl0ZXMoYnl0
ZXMpOwo+Pj4+IC0gICAgZGVidWd0cmFjZV9idWYgPSBhbGxvY194ZW5oZWFwX3BhZ2VzKG9yZGVy
LCAwKTsKPj4+PiAtICAgIEFTU0VSVChkZWJ1Z3RyYWNlX2J1ZiAhPSBOVUxMKTsKPj4+PiArICAg
IGRhdGEgPSBhbGxvY194ZW5oZWFwX3BhZ2VzKG9yZGVyLCAwKTsKPj4+PiArICAgIGlmICggIWRh
dGEgKQo+Pj4+ICsgICAgICAgIHJldHVybiAtRU5PTUVNOwo+Pj4+ICAgIAo+Pj4+IC0gICAgbWVt
c2V0KGRlYnVndHJhY2VfYnVmLCAnXDAnLCBieXRlcyk7Cj4+Pj4gKyAgICBtZW1zZXQoZGF0YSwg
J1wwJywgYnl0ZXMpOwo+Pj4+ICAgIAo+Pj4+IC0gICAgZGVidWd0cmFjZV9ieXRlcyA9IGJ5dGVz
Owo+Pj4+ICsgICAgZGF0YS0+Ynl0ZXMgPSBieXRlcyAtIHNpemVvZigqZGF0YSk7Cj4+Pj4gKyAg
ICBkZWJ0cl9kYXRhID0gZGF0YTsKPj4+Cj4+PiBUaGUgYWxsb2NhdGlvbiBtYXkgZW5kIHVwIGJl
aW5nIGFsbW9zdCB0d2ljZSBhcyBiaWcgYXMgd2hhdCBnZXRzCj4+PiBhY3R1YWxseSB1c2VkIHRo
aXMgd2F5LiBXb3VsZG4ndCBpdCBtYWtlIHNlbnNlIHRvIHJlLWNhbGN1bGF0ZQo+Pj4gImJ5dGVz
IiBmcm9tICJvcmRlciI/Cj4+Cj4+IFllcywgeW91IGFyZSByaWdodC4KPiAKPiBBY3R1YWxseSBJ
IHdhc24ndCwgd2hpY2ggSSBkaWQgbm90aWNlIHNlZWluZyB0aGUgcmVsZXZhbnQgcGllY2UKPiBv
ZiBjb2RlIGdldHRpbmcgdG91Y2hlZCBpbiBwYXRjaCA0Ogo+IAo+ICAgICAgd2hpbGUgKCAoa2J5
dGVzID0gKGRlYnVndHJhY2Vfa2lsb2J5dGVzICYgKGRlYnVndHJhY2Vfa2lsb2J5dGVzLTEpKSkg
IT0gMCApCj4gICAgICAgICAgZGVidWd0cmFjZV9raWxvYnl0ZXMgPSBrYnl0ZXM7CgpGb3Iga2J5
dGVzIDwgNCB5b3Ugc3RpbGwgd2VyZSByaWdodC4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

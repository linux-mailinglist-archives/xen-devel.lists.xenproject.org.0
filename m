Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84126B116C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 16:49:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8QNP-0005c6-UW; Thu, 12 Sep 2019 14:47:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pap2=XH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i8QNO-0005by-F2
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 14:47:14 +0000
X-Inumbo-ID: 34d671ba-d56c-11e9-959b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34d671ba-d56c-11e9-959b-12813bfff9fa;
 Thu, 12 Sep 2019 14:47:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9F1C3AC26;
 Thu, 12 Sep 2019 14:47:12 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-25-jgross@suse.com>
 <de1280ef-a2f0-b96c-8c7a-049027cf1b34@suse.com>
 <4fa2cb71-5b66-b344-6ab2-502008ba5f69@suse.com>
 <7556923e-c32a-7ab2-4c53-43605a1d62db@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <41f9ad40-8374-8d93-eccd-fb2462c6aac3@suse.com>
Date: Thu, 12 Sep 2019 16:47:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7556923e-c32a-7ab2-4c53-43605a1d62db@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 24/48] xen: switch from for_each_vcpu()
 to for_each_sched_unit()
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMTkgMTY6NDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEyLjA5LjIwMTkgMTY6
MDIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDA5LjA5LjE5IDE3OjE0LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDA5LjA4LjIwMTkgMTY6NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gQEAgLTEwMDIsMTcgKzEwMzIsMTcgQEAgaW50IGNwdV9kaXNhYmxlX3NjaGVkdWxlcih1bnNp
Z25lZCBpbnQgY3B1KQo+Pj4+ICAgICAgICAgICAgICAgICAqICAqIHRoZSBzY2hlZHVsZXIgd2ls
bCBhbHdheXMgZmluZCBhIHN1aXRhYmxlIHNvbHV0aW9uLCBvcgo+Pj4+ICAgICAgICAgICAgICAg
ICAqICAgIHRoaW5ncyB3b3VsZCBoYXZlIGZhaWxlZCBiZWZvcmUgZ2V0dGluZyBpbiBoZXJlLgo+
Pj4+ICAgICAgICAgICAgICAgICAqLwo+Pj4+IC0gICAgICAgICAgICB2Y3B1X21pZ3JhdGVfc3Rh
cnQodik7Cj4+Pj4gKyAgICAgICAgICAgIHZjcHVfbWlncmF0ZV9zdGFydCh1bml0LT52Y3B1X2xp
c3QpOwo+Pj4+ICAgICAgICAgICAgICAgIHVuaXRfc2NoZWR1bGVfdW5sb2NrX2lycXJlc3RvcmUo
bG9jaywgZmxhZ3MsIHVuaXQpOwo+Pj4+ICAgIAo+Pj4+IC0gICAgICAgICAgICB2Y3B1X21pZ3Jh
dGVfZmluaXNoKHYpOwo+Pj4+ICsgICAgICAgICAgICB2Y3B1X21pZ3JhdGVfZmluaXNoKHVuaXQt
PnZjcHVfbGlzdCk7Cj4+Pgo+Pj4gQWxsIHRoZSAtPnZjcHVfbGlzdCByZWZlcmVuY2VzIGxvb2sg
Ym9ndXMgY29uc2lkZXJpbmcgd2hlcmUgeW91J3JlCj4+PiBtb3ZpbmcsIGJ1dCBJIGNhbiBvbmx5
IGd1ZXNzIHRoYXQgYWxsIG9mIHRoaXMgd2lsbCBuZWVkIHRvdWNoaW5nCj4+PiBhZ2FpbiBsYXRl
ciBpbiB0aGUgc2VyaWVzLiBJIHdvbmRlciB0aG91Z2ggd2hldGhlciB0aGVzZSB3b3VsZG4ndAo+
Pj4gYmV0dGVyIGNoYW5nZSBpbnRvIGZvci1lYWNoLXZDUFUtaW4tdW5pdCBsb29wcyByaWdodCBh
d2F5Lgo+Pgo+PiBFc3BlY2lhbGx5IHRoZSB2Y3B1X21pZ3JhdGUgcGFydCBpcyBtb3JlIGNvbXBs
aWNhdGVkLiBJIHRoaW5rIGl0IGlzCj4+IG11Y2ggZWFzaWVyIHRvIHJldmlldyB3aXRoIHRoZSBt
b3JlIG1lY2hhbmljYWwgY2hhbmdlcyBzcGxpdCBmcm9tIHRoZQo+PiBsb2dpY2FsIGNoYW5nZXMu
Cj4gCj4gWWVzLCBhbmQgSSBhcHByZWNpYXRlIHlvdSBzZXBhcmF0aW5nIG1lY2hhbmljYWwgZnJv
bSBsb2dpY2FsIGNoYW5nZXMuCj4gSG93ZXZlciwgYXMgYWxyZWFkeSBwb2ludGVkIG91dCBpbiB0
aGUgY29udGV4dCB3aGVyZSBJIGhhZCBjb252aW5jZWQKPiB5b3Ugb2YgdXNpbmcgInZjcHVfbGlz
dCIgYXMgYSBuYW1lLCBpbmRpdmlkdWFsIGFjdGlvbnMgb24gdmNwdV9saXN0Cj4gbm93IGxvb2sg
Ym9ndXMgdGhyb3VnaG91dCB0aGUgc2VyaWVzLiBUaGV5IHNob3VsZCByZWFsbHkgKGFsbW9zdD8p
Cj4gYWxsIGJlIGxvb3BzIG92ZXIgdGhlIGVudGlyZSBsaXN0OyBJIGhhdmUgYSBoYXJkIHRpbWUg
aW1hZ2luaW5nCj4gcG9zc2libGUgZXhjZXB0aW9ucywgYnV0IEknbSBub3QgZ29pbmcgdG8gZXhj
bHVkZSB0aGVyZSBtYXkgYmUgb25lCj4gb3IgYSBmZXcuIEludHJvZHVjaW5nIHN1Y2ggbG9vcHMg
c2hvdWxkLCBhcyBsb25nIGFzIHRoZXJlJ3Mgb25seQo+IGV2ZXIgb24gdkNQVSBvbiBzdWNoIGEg
bGlzdCwgdG9vIGJlIGEgbW9zdGx5IG1lY2hhbmljYWwgc3RlcCwgd2hpY2gKPiBpbW8gc2hvdWxk
IGhhdmUgaGFwcGVuZWQgYmVmb3JlIChvciB3aXRoKSBjaGFuZ2VzIGxpa2UgdGhpcyBvbmUuCgpJ
IHRoaW5rIHRoZSBlYXNpZXN0IHdheSB0byBoYW5kbGUgdGhhdCBpcyB0byBhZGQgYSBjb21tZW50
IGxpa2U6CgovKiBUT0RPOiBzd2l0Y2ggdG8gZm9yX2VhY2hfc2NoZWRfdW5pdF92Y3B1KCkgKi8K
ClRoaXMgd2lsbCBzaG93IHRoZSBuZWVkIGZvciB0aGUgbG9vcCB3aXRob3V0IGhhdmluZyB0byBk
byBsb2dpYwpjaGFuZ2VzLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

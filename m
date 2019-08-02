Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CE97F02C
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 11:17:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htTec-0006de-Gy; Fri, 02 Aug 2019 09:15:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s405=V6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1htTeb-0006dY-3S
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 09:15:13 +0000
X-Inumbo-ID: 056730e4-b506-11e9-a460-8b3926bfd139
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 056730e4-b506-11e9-a460-8b3926bfd139;
 Fri, 02 Aug 2019 09:15:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 662FE344;
 Fri,  2 Aug 2019 02:15:07 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D4F23F575;
 Fri,  2 Aug 2019 02:15:06 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-2-git-send-email-andrii.anisov@gmail.com>
 <ad2a343e-1a65-6569-17a2-e5b676908e49@arm.com>
 <de4feda4-d8b6-4922-26f5-ea3d3f940563@gmail.com>
 <2da153e4-2e11-18af-5a0d-cdc12beaf858@arm.com>
 <be1d31db-60d6-6e05-e50d-d5bc6963d9e7@gmail.com>
 <3d07492e9a9e1ebb1bff17a4f42afa2bd9ec1723.camel@suse.com>
 <a71ddd42-173d-32be-0674-47818316232e@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <189da8d7-dee8-18f8-fbbf-699761f0b656@arm.com>
Date: Fri, 2 Aug 2019 10:15:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a71ddd42-173d-32be-0674-47818316232e@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 1/6] xen/arm: Re-enable interrupt later in the
 trap path
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
Cc: Andrii Anisov <andrii_anisov@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwMi8wOC8yMDE5IDA4OjUwLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIERh
cmlvCj4gCj4gT24gMDEuMDguMTkgMTQ6MTksIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+PiBPbiBU
aHUsIDIwMTktMDgtMDEgYXQgMDk6NDUgKzAzMDAsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4+PiBI
ZWxsbyBKdWxpZW4sCj4+Pgo+Pj4gT24gMzAuMDcuMTkgMjM6MTAsIEp1bGllbiBHcmFsbCB3cm90
ZToKPj4+Cj4+Pj4+IEluIHRoaXMgc2VyaWVzIEkgdGhpbmsgSSBuZWVkIGludGVycnVwdHMgbG9j
a2VkIHVudGlsIEkgc3RhcnQKPj4+Pj4gdGltZSBhY2NvdW50aW5nIGZvciBoeXBlcnZpc29yLiBU
aW1lIGFjY291bnRpbmcgaXMgc3RhcnRlZCBieQo+Pj4+PiBgdGFjY19oZWFkKClgIGZ1bmN0aW9u
LiBJIHByZWZlciB0byBoYXZlIGl0IGNhbGxlZCBmcm9tIEMsCj4+Pj4+IGJlY2F1c2UgaXQgaXMg
bW9yZSBjb252ZW5pZW50IGFuZCBvYnZpb3VzIGZvciB0aG9zZSB3aG8gYXJlIGxlc3MKPj4+Pj4g
ZmFtaWxpYXIgd2l0aCB0aGUgQVJNIGNvZGUuCj4+Pgo+Pj4gSGVyZSBpcyB0aGUgcXVlc3Rpb24g
dG8geW91OiB3aGF0IGlzIHRoZSBiZXN0IHBsYWNlIChhbmQgd2F5KSB0bwo+Pj4gc3RhcnQgaHlw
ZXJ2aXNvciB0aW1lIHRyYWNraW5nPwo+Pj4KPj4gVGhpcyBpcyBhY3R1YWxseSBxdWl0ZSBhbiBp
bXBvcnRhbnQgcXVlc3Rpb24uLi4gQW5kIEknZCBsaWtlIHRvIHRocm93Cj4+IGl0IGJhY2sgYXQg
eW91IChBbmRyaWkpISA6LUQgOi1QIDotKQo+IAo+IEF0IHRoaXMgc2VyaWVzIEkgc3RhcnQgdGlt
ZSBhY2NvdW50aW5nIGZvciBoeXBlcnZpc29yIGFmdGVyIHRoZSB0cmFwLCBiZWZvcmUgCj4gaW50
ZXJydXB0cyBiZWluZyBlbmFibGVkLiBJdCBpcyBkb25lIGZvciBhbGwgdHJhcHMgZXhjZXB0IHN5
bmNocm9ub3VzIHRyYXBzIGZyb20gCj4gZ3Vlc3QsIHdoYXQgYXJlIGh5cGVjYWxscyBhbmQgaW8g
ZW11bGF0aW9uLiBGb3Igc3luY2hyb25vdXMgdHJhcHMsIEkgc3RhcnQgaHlwIAo+IGFjY291bnRp
bmcgYWZ0ZXIgdGhlIGd1ZXN0J3MgcmVxdWVzdCBoYXMgYmVlbiBzZXJ2ZWQsIGFuZCB3ZSBzdGFy
dCBzb2Z0aXJxIAo+IHByb2Nlc3NpbmcgKGFjdHVhbGx5IGFsbCB0aGUgc3R1ZmYgYGxlYXZlX2h5
cGVydmlzb3JfdGFpbCgpYCBkb2VzKS4gSSBiZWxpZXZlIGl0IAo+IHNob3VsZCBiZSBzby4KPiAK
Pj4gSW4gZmFjdCwgSSB3YXMgYWJvdXQgdG8gYXNrIG15c2VsZiBzb21ldGhpbmcgc2ltaWxhciwg
c3VjaCBhcywgY2FuIHdlCj4+IHRha2UgYSBiaXQgb2YgYSBzdGVwIGJhY2sgYW5kIGRlZmluZToK
Pj4KPj4gLSB3aGF0J3MgdGhlLCBsZXQncyBzYXksIGFjY291bnRpbmcgZ3JhbnVsYXJpdHkgd2Ug
d2FudD8gIkp1c3QiIGd1ZXN0Cj4+IGFuZCBoeXBlcnZpc29yPyBPciBtb3JlIGZpbmUgZ3JhaW5l
ZD8KPiAKPiBBcyBmb3IgbWUgaHlwZXJ2aXNvci9ndWVzdC9pZGxlIGlzIHF1aXRlIGZpbmUgZ3Jh
bnVsYXJpdHkgZm9yIHRoZSBiZWdpbm5pbmcuCj4gU3VjaCBhcHByb2FjaCBtaWdodCBiZSBlbm91
Z2ggdG8gaW1wbGVtZW50IGZhaXIgdGltZSBhY2NvdW50aW5nLgo+IFlldCB3ZSBtaWdodCBuZWVk
IHNvbWV0aGluZyBtb3JlIHNvcGhpc3RpY2F0ZWQgZm9yIFJUIHNjaGVkdWxpbmcuIEUuZy4gZ3Vl
c3QncyAKPiBJUlEgdGltZSB0cmFja2luZywgdG8gbm90IGxldCBzb21lIGd1ZXN0IHRvIHNwYW0g
dGhlIHN5c3RlbSB3aXRoIGl0cyBJUlFzLgo+IAo+PiAtIGFzc3VtaW5nIHdlICJqdXN0IiB3YW50
IGh5cGVydmlzb3IgYW5kIGd1ZXN0LCB3aGljaCBhcmUgdGhlCj4+IGV2ZW50cy90dXJuaW5nIHBv
aW50cyBhdCB3aGljaCB3ZSBzaG91bGQgc3dpdGNoICJ0aW1pbmcgYWNjb3VudGluZwo+PiBidWNr
ZXQiPyBDYW4gd2UgbWFrZSBhIGxpc3Q/Cj4+IEFuZCBJJ2QgYmUgZmluZSBmb3Igc3VjaCBsaXN0
IHRvIGJlIGdlbmVyaWMsIGluIHRoZSBmaXJzdCBwbGFjZSAoZS5nLiwKPj4gaHlwZXJjYWxsLCBJ
UlEsIGV0YykuLi4gVGhlbiB3ZSdsbCB0dXJuIHRoZSBlbnRyaWVzIGludG8gYWN0dWFsCj4+IGxv
Y2F0aW9ucyBpbiB0aGUgY29kZSwgYXMgYSBzZWNvbmQgc3RlcC4KPiAKPiAKPiBJIGNhbiBtYWtl
IHN1Y2ggYSBsaXN0LCBob3cgaXQgaXMgZG9uZSBpbiB0aGlzIHNlcmllczoKCiBGcm9tIHRoZSBs
aXN0IGJlbG93IGl0IGlzIG5vdCBjbGVhciB3aGF0IGlzIHRoZSBzcGxpdCBiZXR3ZWVuIGh5cGVy
dmlzb3IgdGltZSAKYW5kIGd1ZXN0IHRpbWUuIFNlZSBzb21lIG9mIHRoZSBleGFtcGxlcyBiZWxv
dy4KCj4gCj4gR3Vlc3QgLVthc3luYyB0cmFwIChJUlEpXS0+IEh5cCA6IHN3aXRjaCB0byBoeXAg
dGltZSBhY2NvdW50aW5nCgpXaHkgYWxsIHRoZSBpbnRlcnJ1cHRzIHNob3VsZCBiZSBhY2NvdW50
ZWQgdG8gdGhlIGh5cGVydmlzb3I/IFdoeSBub3QgYWNjb3VudGluZyAKZ3Vlc3QgdGltZSBmb3Ig
YW55IGludGVycnVwdCByb3V0ZWQgdG8gdGhlIGN1cnJlbnQgZ3Vlc3Q/Cgo+IEd1ZXN0IC1bc3lu
YyB0cmFwIChoeXBlcmNhbGwsIGlvIGVtdWxhdGlvbildLT4gSFlQIDogc3dpdGNoIHRvIGh5cCB0
aW1lIAo+IGFjY291bnRpbmcgKmFmdGVyKiBzZXJ2aW5nIHN5bmMgdHJhcCAoaHlwZXJjYWxsLCBp
byBlbXVsYXRpb24pCgpXaHkgc28/IFNvbWUgb2YgdGhlIHdvcmsgYWZ0ZXIgc2VydmljaW5nIGFu
IGh5cGVyY2FsbC9JTyBlbXVsYXRpb24gYXJlIHN0aWxsIApndWVzdCBzcGVjaWZpYy4gRm9yIGlu
c3RhbmNlLCB3ZSBtYXkgdXBkYXRlIHRoZSBoYXJkd2FyZSBzdGF0ZSBmb3IgdGhlIGd1ZXN0IAoo
c2VlIHZnaWNfc3luY190b19scnMoKSkuIFdlIG1heSBhbHNvIGhhdmUgZGVmZXIgd29yayB0aGF0
IHRha2UgYSBsb25nIHRpbWUgKHNlZSAKY2hlY2tfZm9yX3BjcHVfd29yaygpKS4KCklITU8sIHRo
ZSBvbmx5IHBhcnQgd29ydGggYWNjb3VudGluZyB0byB0aGUgaHlwZXJ2aXNvciBtb2RlIGlzIApj
aGVja19mb3JfcGNwdV93b3JrKCkuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

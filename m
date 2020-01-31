Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B24C714EE98
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 15:38:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixXN8-0003Ad-Cs; Fri, 31 Jan 2020 14:34:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixXN6-0003AY-Qk
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 14:34:12 +0000
X-Inumbo-ID: bee829d2-4436-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bee829d2-4436-11ea-b211-bc764e2007e4;
 Fri, 31 Jan 2020 14:34:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6D520AD85;
 Fri, 31 Jan 2020 14:34:10 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-4-liuwe@microsoft.com>
 <26802cc1-6d3a-8038-a38b-b7edf2dde3e7@suse.com>
 <20200131141001.ysx67kpxsh2zftuz@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e18684c8-f6a3-a691-bcd0-7d600b101fcd@suse.com>
Date: Fri, 31 Jan 2020 15:34:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200131141001.ysx67kpxsh2zftuz@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 03/12] x86/smp: don't online cpu if
 hypervisor_ap_setup fails
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMDEuMjAyMCAxNToxMCwgV2VpIExpdSB3cm90ZToKPiBPbiBGcmksIEphbiAzMSwgMjAy
MCBhdCAwMjo1Mzo0NVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjkuMDEuMjAy
MCAyMToyMCwgV2VpIExpdSB3cm90ZToKPj4+IFB1c2ggaHlwZXJ2aXNvcl9hcF9zZXR1cCBkb3du
IHRvIHNtcF9jYWxsaW4uCj4+Pgo+Pj4gVGFrZSB0aGUgY2hhbmNlIHRvIHJlcGxhY2UgeGVuX2d1
ZXN0IHdpdGggY3B1X2hhc19oeXBlcnZpc29yLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4+PiAtLS0KPj4+ICB4ZW4vYXJjaC94ODYvc21wYm9v
dC5jIHwgMTAgKysrKysrKy0tLQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zbXBib290
LmMgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCj4+PiBpbmRleCBjOWQxYWI0NDIzLi45M2I4NmEw
OWU5IDEwMDY0NAo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+Pj4gKysrIGIveGVu
L2FyY2gveDg2L3NtcGJvb3QuYwo+Pj4gQEAgLTE5OSw2ICsxOTksMTMgQEAgc3RhdGljIHZvaWQg
c21wX2NhbGxpbih2b2lkKQo+Pj4gICAgICAgICAgZ290byBoYWx0Owo+Pj4gICAgICB9Cj4+PiAg
Cj4+PiArICAgIGlmICggY3B1X2hhc19oeXBlcnZpc29yICYmIChyYyA9IGh5cGVydmlzb3JfYXBf
c2V0dXAoKSkgIT0gMCApCj4+PiArICAgIHsKPj4+ICsgICAgICAgIHByaW50aygiQ1BVJWQ6IEZh
aWxlZCB0byBpbml0aWFsaXNlIGh5cGVydmlzb3IgZnVuY3Rpb25zLiBOb3QgY29taW5nIG9ubGlu
ZS5cbiIsIGNwdSk7Cj4+PiArICAgICAgICBjcHVfZXJyb3IgPSByYzsKPj4+ICsgICAgICAgIGdv
dG8gaGFsdDsKPj4+ICsgICAgfQo+Pgo+PiBUaGVyZSBhcmUgYSBmZXcgdGhpbmdzIGRvbmUgdXAg
ZnJvbSBoZXJlIHdoaWNoIG1heSBwb3NzaWJseQo+PiBiZXR0ZXIgY29tZSBhZnRlciBoeXBlcnZp
c29yIGludGVyZmFjZSBzZXR1cCAodGhlIHR3byBBUElDCj4+IHJlbGF0ZWQgY2FsbHMgaW4gcGFy
dGljdWxhcikuIEFyZSB5b3Ugc3VyZSB5b3UgY2FuIHNhZmVseQo+PiBtb3ZlIGl0IHRoaXMgZmFy
IGRvd24gaW4gdGhlIGZ1bmN0aW9uPwo+IAo+IFhlbiBndWVzdCdzIHVzYWdlIG9mIEFQSUMgaXMg
bm8gZGlmZmVyZW50IHRoYW4sIHNheSwgaHZtJ3MgdXNhZ2UuIElmIGh2bQo+IGNhbiBiZSB0aGlz
IGZhciBkb3duLCBYZW4gLyBIeXBlci1WIGNhbiwgdG9vLgo+IAo+IEZ1cnRoZXJtb3JlLCBBUElD
IGNvZGUgaGFzIG5vIGRlcGVuZGVuY3kgb24gZ3Vlc3QgY29kZS4KCkhtbSwgb2theSwgdGhlcmUn
cyBubyB3YXkgZm9yIGEgSFZNIGd1ZXN0IHRvIHJ1biB3aXRob3V0IExBUElDCmVtdWxhdGlvbiBy
aWdodCBub3cuIFRoaXMgc2hvdWxkIGJlIGZpbmUgdGhlbjoKUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==

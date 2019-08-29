Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 417EBA19B1
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 14:14:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3JGi-0006Ro-Vo; Thu, 29 Aug 2019 12:11:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3JGh-0006Rj-UC
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 12:11:11 +0000
X-Inumbo-ID: 1670dcd6-ca56-11e9-ae65-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1670dcd6-ca56-11e9-ae65-12813bfff9fa;
 Thu, 29 Aug 2019 12:11:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CB123B071;
 Thu, 29 Aug 2019 12:11:09 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-16-git-send-email-chao.gao@intel.com>
 <3b455c41-b5a3-2533-99a8-2200def4b19f@citrix.com>
 <20190826080759.GB11910@gao-cwp> <20190827045159.GA28509@gao-cwp>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d95a5b28-04c6-dcc6-8b16-fc4ade330c15@suse.com>
Date: Thu, 29 Aug 2019 14:11:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827045159.GA28509@gao-cwp>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 15/15] microcode: block #NMI handling
 when loading an ucode
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDguMjAxOSAwNjo1MiwgQ2hhbyBHYW8gd3JvdGU6Cj4gT24gTW9uLCBBdWcgMjYsIDIw
MTkgYXQgMDQ6MDc6NTlQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6Cj4+IE9uIEZyaSwgQXVnIDIz
LCAyMDE5IGF0IDA5OjQ2OjM3QU0gKzAxMDAsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4+PiBPbiAx
OS8wOC8yMDE5IDAyOjI1LCBDaGFvIEdhbyB3cm90ZToKPj4+PiByZWdpc3RlciBhbiBubWkgY2Fs
bGJhY2suIEFuZCB0aGlzIGNhbGxiYWNrIGRvZXMgYnVzeS1sb29wIG9uIHRocmVhZHMKPj4+PiB3
aGljaCBhcmUgd2FpdGluZyBmb3IgbG9hZGluZyBjb21wbGV0aW9uLiBDb250cm9sIHRocmVhZHMg
c2VuZCBOTUkgdG8KPj4+PiBzbGF2ZSB0aHJlYWRzIHRvIHByZXZlbnQgTk1JIGFjY2VwdGFuY2Ug
ZHVyaW5nIHVjb2RlIGxvYWRpbmcuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIEdhbyA8
Y2hhby5nYW9AaW50ZWwuY29tPgo+Pj4+IC0tLQo+Pj4+IENoYW5nZXMgaW4gdjk6Cj4+Pj4gIC0g
Y29udHJvbCB0aHJlYWRzIHNlbmQgTk1JIHRvIGFsbCBvdGhlciB0aHJlYWRzLiBTbGF2ZSB0aHJl
YWRzIHdpbGwKPj4+PiAgc3RheSBpbiB0aGUgTk1JIGhhbmRsaW5nIHRvIHByZXZlbnQgTk1JIGFj
Y2VwdGFuY2UgZHVyaW5nIHVjb2RlCj4+Pj4gIGxvYWRpbmcuIE5vdGUgdGhhdCBzZWxmLW5taSBp
cyBpbnZhbGlkIGFjY29yZGluZyB0byBTRE0uCj4+Pgo+Pj4gVG8gbWUgdGhpcyBsb29rcyBsaWtl
IGEgaGFsZi1tZWFzdXJlOiB3aHkga2VlcCBvbmx5IHNsYXZlIHRocmVhZHMgaW4KPj4+IHRoZSBO
TUkgaGFuZGxlciwgd2hlbiBtYXN0ZXIgdGhyZWFkcyBjYW4gdXBkYXRlIHRoZSBtaWNyb2NvZGUg
ZnJvbQo+Pj4gaW5zaWRlIHRoZSBOTUkgaGFuZGxlciBhcyB3ZWxsPwo+Pgo+PiBObyBzcGVjaWFs
IHJlYXNvbi4gQmVjYXVzZSB0aGUgaXNzdWUgd2Ugd2FudCB0byBhZGRyZXNzIGlzIHRoYXQgc2xh
dmUKPj4gdGhyZWFkcyBtaWdodCBnbyB0byBoYW5kbGUgTk1JIGFuZCBhY2Nlc3MgTVNScyB3aGVu
IG1hc3RlciB0aHJlYWQgaXMKPj4gbG9hZGluZyB1Y29kZS4gU28gd2Ugb25seSBrZWVwIHNsYXZl
IHRocmVhZHMgaW4gdGhlIE5NSSBoYW5kbGVyLgo+Pgo+Pj4KPj4+IFlvdSBtZW50aW9uIHRoYXQg
c2VsZi1ubWkgaXMgaW52YWxpZCwgYnV0IFhlbiBoYXMgc2VsZl9ubWkoKSB3aGljaCBpcwo+Pj4g
dXNlZCBmb3IgYXBwbHlfYWx0ZXJuYXRpdmVzKCkgZHVyaW5nIGJvb3QsIHNvIGNhbiBiZSB0cnVz
dGVkIHRvIHdvcmsuCj4+Cj4+IFNvcnJ5LCBJIG1lYW50IHVzaW5nIHNlbGYgc2hvcnRoYW5kIHRv
IHNlbmQgc2VsZi1ubWkuIEkgdHJpZWQgdG8gdXNlCj4+IHNlbGYgc2hvcnRoYW5kIGJ1dCBnb3Qg
QVBJQyBlcnJvci4gQW5kIEkgYWdyZWUgdGhhdCBpdCBpcyBiZXR0ZXIgdG8KPj4gbWFrZSBzbGF2
ZSB0aHJlYWQgY2FsbCBzZWxmX25taSgpIGl0c2VsZi4KPj4KPj4+Cj4+PiBJIGV4cGVyaW1lbnRl
ZCBhIGJpdCB3aXRoIHRoZSBmb2xsb3dpbmcgYXBwcm9hY2g6IGFmdGVyIGxvYWRpbmdfc3RhdGUK
Pj4+IGJlY29tZXMgTE9BRElOR19DQUxMSU4sIGVhY2ggY3B1IGlzc3VlcyBhIHNlbGZfbm1pKCkg
YW5kIHJlbmRlenZvdXMKPj4+IHZpYSBjcHVfY2FsbGluX21hcCBpbnRvIExPQURJTkdfRU5URVIg
dG8gZG8gYSB1Y29kZSB1cGRhdGUgZGlyZWN0bHkgaW4KPj4+IHRoZSBOTUkgaGFuZGxlci4gQW5k
IGl0IHNlZW1zIHRvIHdvcmsuCj4+Pgo+Pj4gU2VwYXJhdGUgcXVlc3Rpb24gaXMgYWJvdXQgdGhl
IHNhZmV0eSBvZiB0aGlzIGFwcHJvYWNoOiBjYW4gd2UgYmUgc3VyZQo+Pj4gdGhhdCBhIHVjb2Rl
IHVwZGF0ZSB3b3VsZCBub3QgcmVzZXQgdGhlIHN0YXR1cyBvZiB0aGUgTk1JIGxhdGNoPyBJLmUu
Cj4+PiBjYW4gaXQgY2F1c2UgYW5vdGhlciBOTUkgdG8gYmUgZGVsaXZlcmVkIHdoaWxlIFhlbiBh
bHJlYWR5IGhhbmRsZXMgb25lPwo+Pgo+PiBBc2hvaywgd2hhdCdzIHlvdXIgb3BpbmlvbiBvbiBT
ZXJnZXkncyBhcHByb2FjaCBhbmQgaGlzIGNvbmNlcm4/Cj4gCj4gSSB0YWxrZWQgd2l0aCBBc2hv
ay4gV2UgdGhpbmsgeW91ciBhcHByb2FjaCBpcyBiZXR0ZXIuIEkgd2lsbCBmb2xsb3cKPiB5b3Vy
IGFwcHJvYWNoIGluIHYxMC4gSXQgd291bGQgYmUgbXVjaCBoZWxwZnVsIGlmIHlvdSBwb3N0IHlv
dXIgcGF0Y2gKPiBzbyB0aGF0IEkgY2FuIGp1c3QgcmViYXNlIGl0IG9udG8gb3RoZXIgcGF0Y2hl
cy4KCkRvaW5nIHRoZSBhY3R1YWwgdWNvZGUgdXBkYXRlIGluc2lkZSBhbiBOTUkgaGFuZGxlciBz
ZWVtcyByYXRoZXIgcmlza3kKdG8gbWUuIEV2ZW4gaWYgQXNob2sgY29uZmlybWVkIGl0IHdvdWxk
IG5vdCBiZSBhbiBpc3N1ZSBvbiBwYXN0IGFuZApjdXJyZW50IEludGVsIENQVXMgLSB3aGF0IGFi
b3V0IGZ1dHVyZSBvbmVzLCBvciBvbmVzIGZyb20gb3RoZXIgdmVuZG9ycz8KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

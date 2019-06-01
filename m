Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C830231FB3
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2019 16:48:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hX5FM-0001kb-Qz; Sat, 01 Jun 2019 14:44:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BqHO=UA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hX5FL-0001kW-1p
 for xen-devel@lists.xenproject.org; Sat, 01 Jun 2019 14:44:35 +0000
X-Inumbo-ID: c5453676-847b-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id c5453676-847b-11e9-8980-bc764e045a96;
 Sat, 01 Jun 2019 14:44:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86428374;
 Sat,  1 Jun 2019 07:44:33 -0700 (PDT)
Received: from [10.37.12.21] (unknown [10.37.12.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10E523F5AF;
 Sat,  1 Jun 2019 07:44:30 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5700200007800233DB4@prv1-mh.provo.novell.com>
 <f78f627c-753f-a162-14a1-b193908f673a@arm.com>
 <5CF0F8BE0200007800233DE3@prv1-mh.provo.novell.com>
 <f8edeb03-b223-e723-0b02-9ca565fe8055@arm.com>
 <5CF0FC080200007800233E50@prv1-mh.provo.novell.com>
 <7ca91b27-1c37-70ab-e367-494603e4464d@arm.com>
 <5CF1026F0200007800233ED8@prv1-mh.provo.novell.com>
 <aa27503b-7fcb-dbf0-1f69-6aae35b6f4c1@arm.com>
 <5CF105FD0200007800233F31@prv1-mh.provo.novell.com>
 <60e875e1-a0fa-9c3d-0bfc-55ae567d409f@arm.com>
 <alpine.DEB.2.21.1905311022220.20498@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f3da02b7-e3a8-ca40-e36d-08bba802ee45@arm.com>
Date: Sat, 1 Jun 2019 15:44:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1905311022220.20498@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] dom_cow is needed for mem-sharing only
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
Cc: lars.kurth@citrix.com, Tamas K Lengyel <tamas@tklengyel.com>,
 WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA1LzMxLzE5IDY6MjcgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBG
cmksIDMxIE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIEphbiwKPj4KPj4gT24g
MzEvMDUvMjAxOSAxMTo0NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAzMS4wNS4xOSBh
dCAxMjozNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+PiBObyBpdCB3YXMgYSBt
b3JlIGdlbmVyaWMgc3RhdGVtZW50IG9uIHRoZSBzdGFuY2UgIkl0IGFscmVhZHkgZXhpc3RzIGlu
Cj4+Pj4gWGVuIHNvIGl0IGlzIGZpbmUgdG8gc3ByZWFkIHRoZW0gYSBiaXQgbW9yZSIuCj4+Pgo+
Pj4gT2gsIEkgc2VlLiBPZiBjb3Vyc2UgSSdtIG1ha2luZyByZW1hcmtzIHdoZW4gd2hhdCdzIGlu
IHRoZSB0cmVlIGlzCj4+PiBiYWQgKGFzIHBlciBlLmcuIGNvZGluZyBzdHlsZSwgb3IgaWYgbm90
IG1lbnRpb25lZCB0aGVyZSB0aGFuIGluIG15Cj4+PiBwZXJzb25hbCBvcGluaW9uKS4gQXMgYSBy
ZXN1bHQgSSB0YWtlIG5vdGUgb2YgeW91IHRoaW5raW5nIHRoaXMgYmVpbmcKPj4+IGJhZCBwcmFj
dGljZSwgYW5kIHRoZSB0d28gb2YgdXMgZGlzYWdyZWVpbmcuIEknbSBjZXJ0YWlubHkgd2lsbGlu
ZyB0bwo+Pj4gYWRqdXN0IG5vbi1vYnZpb3VzIGNvZGUgdG8gYSBtb3JlIG9idmlvdXMgc2hhcGUg
aW4gdmFyaW91cyBjYXNlcywKPj4+IGJ1dCBJIHRoaW5rIHRoZXJlIG5lZWRzIHRvIGJlIGEgbGlt
aXQgYXMgdG8gd2hhdCBsYW5ndWFnZSBmZWF0dXJlcwo+Pj4gd2UgZGVjaWRlIHNob3VsZCBub3Qg
YmUgdXNlZCBpbiB0aGUgY29kZSBiYXNlLiBPdmVycmlkaW5nCj4+PiBkZWNsYXJhdGlvbnMgKGFu
ZCBpbiBzb21lIGNhc2VzIGV2ZW4gZGVmaW5pdGlvbnMpIGJ5IG1hY3JvcyBpcyBhCj4+PiB1c2Vm
dWwgdGhpbmcgZm9yIGdlbmVyYWwgcmVhZGFiaWxpdHkgaW4gY2VydGFpbiBjYXNlcyBpbiBteSBv
cGluaW9uLAo+Pj4gYW5kIHdoaWxlIGl0J3Mgbm90IG1ha2luZyBtdWNoIG9mIGRpZmZlcmVuY2Ug
aGVyZSBJJ2Qgc3RpbGwgcHJlZmVyIGlmCj4+PiBJIHdhcyBhbGxvd2VkIHRvIGdldCBhd2F5IHdp
dGggdGhpcywgdW5sZXNzIGEgbWFqb3JpdHkgc3VwcG9ydHMKPj4+IHlvdXIgdmlldy4gSU9XIC0g
eW91ciBjaGFuZ2UgcmVxdWVzdCBpcywgYXMgcGVyIG15IG93bgo+Pj4gcGVyc3BlY3RpdmUsIG1h
a2luZyB0aGUgY29kZSBsZXNzIGVhc3kgdG8gcmVhZCwgZXZlbiBpZiBub3QgYnkKPj4+IG11Y2gu
Cj4+Cj4+IExldCB3aWxsIHdhaXQgdGhlIG9waW5pb24gZnJvbSB0aGUgb3RoZXJzIGhlcmUuCj4g
Cj4gTXkgcHJlZmVyZW5jZSBpcyB3aGF0IEFuZHJldyBzdWdnZXN0ZWQ6Cj4gCj4gICAjaWZkZWYg
Q09ORklHX0hBU19NRU1fU0hBUklORwo+ICAgIGV4dGVybiBzdHJ1Y3QgZG9tYWluICpkb21fY293
Owo+ICAgI2Vsc2UKPiAgICBkZWZpbmUgZG9tX2NvdyBOVUxMCj4gICAjZW5kaWYKPiAKPiBhbmQg
SSBmaW5kIEphbidzIG9yaWdpbmFsIHZlcnNpb24gaGFyZGVyIHRvIHJlYWQuIEhvd2V2ZXIsIGZv
ciBjb2RlCj4gc3R5bGUgcmVsYXRlZCB0aGluZ3MsIEkgcHJlZmVyIHRvICJzdWdnZXN0IiB0byBv
dGhlciBtYWludGFpbmVycyBvbmUgd2F5Cj4gb3IgdGhlIG90aGVyLCByYXRoZXIgdGhhbiAicmVx
dWVzdCIgZm9yIGEgY2hhbmdlLgoKTm90ZSB0aGF0IEkgd3JvdGUgIkkgd291bGQgcHJlZmVyIiBp
biBteSBlLW1haWwgYW5kIHRoZSBhZ3JlZW1lbnQgd2FzIHRvIAp3YWl0IG9uIG90aGVyIHZpZXcu
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

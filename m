Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60966C30A9
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 11:53:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFEmY-00080d-Mt; Tue, 01 Oct 2019 09:49:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/b7=X2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFEmX-00080V-Gj
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 09:49:21 +0000
X-Inumbo-ID: bd822d74-e430-11e9-96f7-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id bd822d74-e430-11e9-96f7-12813bfff9fa;
 Tue, 01 Oct 2019 09:49:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8FF61000;
 Tue,  1 Oct 2019 02:49:19 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 960003F739;
 Tue,  1 Oct 2019 02:49:18 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-3-julien.grall@arm.com>
 <alpine.DEB.2.10.1904171340390.1370@sstabellini-ThinkPad-X260>
 <be790e9c-75bb-b38b-9a01-8c586580ed1a@arm.com>
 <alpine.DEB.2.10.1904181056410.1370@sstabellini-ThinkPad-X260>
 <441ce7f6-7907-dc23-b0e6-7503ba888953@arm.com>
 <alpine.DEB.2.21.1909301808070.2594@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1909301821550.2594@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <399c438c-5786-d9d7-75a6-9bf9f2bf3e74@arm.com>
Date: Tue, 1 Oct 2019 10:49:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1909301821550.2594@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 02/12] xen/arm: fix get_cpu_info() when
 built with clang
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
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org,
 Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwMS8xMC8yMDE5IDAyOjIyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gTW9u
LCAzMCBTZXAgMjAxOSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+PiBPbiBTdW4sIDI5IFNl
cCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBIaSwKPj4+Cj4+PiBTb3JyeSwgSSBhbSBw
aWNraW5nIHVwIHRoaXMgc2VyaWVzIGFnYWluLgo+Pj4KPj4+IE9uIDQvMTgvMTkgNzowMyBQTSwg
U3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4+IE9uIFdlZCwgMTcgQXByIDIwMTksIEp1bGll
biBHcmFsbCB3cm90ZToKPj4+Pj4gSGksCj4+Pj4+Cj4+Pj4+IE9uIDQvMTcvMTkgOTo0NSBQTSwg
U3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4+Pj4gT24gV2VkLCAyNyBNYXIgMjAxOSwgSnVs
aWVuIEdyYWxsIHdyb3RlOgo+Pj4+Pj4+IENsYW5nIHVuZGVyc3RhbmRzIHRoZSBHQ0Npc20gaW4g
dXNlIGhlcmUsIGJ1dCBzdGlsbCBjb21wbGFpbnMgdGhhdCBzcAo+Pj4+Pj4+IGlzCj4+Pj4+Pj4g
dW5pdGlhbGlzZWQuIEluIHN1Y2ggY2FzZXMsIHJlc29ydCB0byB0aGUgb2xkZXIgdmVyc2lvbnMg
b2YgdGhpcyBjb2RlLAo+Pj4+Pj4+IHdoaWNoIGRpcmVjdGx5IHJlYWQgc3AgaW50byB0aGUgdGVt
cG9yYXJ5IHZhcmlhYmxlLgo+Pj4+Pj4+Cj4+Pj4+Pj4gTm90ZSB0aGF0IHdlIHN0aWxsIGtlZXAg
dGhlIEdDQ2lzbSBpbiB0aGUgZGVmYXVsdCBjYXNlLCBhcyBpdCBjYXVzZXMKPj4+Pj4+PiBHQ0MK
Pj4+Pj4+PiB0byBjcmVhdGUgcmF0aGVyIGJldHRlciBhc3NlbWJseS4KPj4+Pj4+Pgo+Pj4+Pj4+
IFRoaXMgaXMgYmFzZWQgb24gdGhlIHg4NiBjb3VudGVycGFydC4KPj4+Pj4+Cj4+Pj4+PiBJIHVu
ZGVyc3RhbmQgdGhpcyBpcyBiYXNlZCBvbiBhbiBleGlzdGluZyBhcHByb2FjaCBidXQgd2hhdCBh
Ym91dCBvdGhlcgo+Pj4+Pj4gY29tcGlsZXJzPyBJIGhhdmUgYSBzdWdnZXN0aW9uIGJlbG93Lgo+
Pj4+Pgo+Pj4+PiBXaGF0IGlmIHRoZSBjb21waWxlciBhY3R1YWxseSBzdXBwb3J0IG5hbWVkIHJl
Z2lzdGVycz8gV2h5IHdvdWxkIHdlIG1ha2UKPj4+Pj4gdGhlCj4+Pj4+IGNvZGUgbGVzcyBlZmZp
Y2llbnQ/Cj4+Pj4KPj4+PiBJdCBpcyBub3QgbXkgaW50ZW50aW9uIHRvIG1ha2UgdGhlIGNvZGUg
bGVzcyBlZmZpY2llbnQgZm9yIG90aGVyCj4+Pj4gY29tcGlsZXJzLiBIb3dldmVyLCByZWFkaW5n
IHRoZSBjb21taXQgbWVzc2FnZSBhbmQgdGhlIHBhdGNoIEkgaGF2ZSB0aGUKPj4+PiBpbXByZXNz
aW9uIHRoYXQgdGhlIGNsYW5nIHZlcnNpb24gaXMgbW9yZSBsaWtlbHkgdG8gYmUgYXBwbGljYWJs
ZSB0bwo+Pj4+IG90aGVyIGNvbXBpbGVycywgY29tcGFyZWQgdG8gdGhlIGdjYyB2ZXJzaW9uLiBN
b3JlICJzdGFuZGFyZCIuIFRoZQo+Pj4+IHJlYXNvbiBpcyB0aGF0IHRoZSBjbGFuZyB2ZXJzaW9u
IG9ubHkgcmVxdWlyZXMgYXNtIGlubGluZSwgd2hpbGUgdGhlIGdjYwo+Pj4+IHZlcnNpb24gcmVx
dWlyZXMgYm90aCBhc20gaW5saW5lIGFuZCBuYW1lZCByZWdpc3RlcnMuIEZvciB0aGUgc2FrZSBv
Zgo+Pj4+IGdldHRpbmcgWGVuIHRvIGNvbXBpbGUgb3V0IG9mIHRoZSBib3ggd2l0aCBhbnkgQyBj
b21waWxlciwgSSB0aGluayBpdCBpcwo+Pj4+IGJlc3QgaWYgd2UgZGVmYXVsdCB0byB0aGUgbGVz
cyBkZW1hbmRpbmcgdmVyc2lvbiBvZiB0aGUgaW1wbGVtZW50YXRpb24KPj4+PiBmb3IgdW5rbm93
biBjb21waWxlcnMuCj4+PiBXaGlsZSBidWlsZGluZyBYZW4gb3V0IG9mIGJveCBpcyBuaWNlIGdv
YWwgdG8gaGF2ZSwgdGhpcyBpcyBsaWtlbHkgYmUgdmVyeQo+Pj4gaGFyZCB0byByZWFjaCBvdXQg
YmVjYXVzZSBYZW4gaXMgdXNpbmcgYSBsb3Qgb2YgR0NDaXNtLiBJdCBtb3N0bHkgd29yayB3aXRo
Cj4+PiBDbGFuZyBiZWNhdXNlIHRoZXkgaGF2ZSBhZG9wdGVkIHNvbWUgb2YgdGhlbS4KPj4+Cj4+
PiBJIHdvdWxkIGJlIGhhcHB5IHRvIHJldmVydCB0aGUgY29uZGl0aW9uLCBidXQgdGhlbiBBRkFJ
Q1QgdGhlcmUgYXJlIG5vIHByZXR0eQo+Pj4gd2F5IHRvIG5vdyB0aGF0IHdlIGFyZSB1c2luZyBH
Q0MuIFdoaWxlIHRoZSBkZWZpbmUgX19HTlVDX18gaXMgbWVhbnQgdG8gdGVsbAo+Pj4geW91IHRo
aXMgaXMgY29tcGlsZWQgd2l0aCBHQ0MsIGNsYW5nIGlzIGFsc28gZGVmaW5pbmcgaXQuCj4+Cj4+
IFRoYXQncyBob3JyaWJsZSwgSSBkaWRuJ3Qga25vdyBhYm91dCB0aGF0IQo+Pgo+Pgo+Pj4gU28g
dGhlIGNvbmRpdGlvbiB3b3VsZCBoYXZlIHRvIGJlCj4+Pgo+Pj4gI2lmICFkZWZpbmVkKF9fY2xh
bmdfXykgJiYgZGVmaW5lZChfX0dOVUNfXykKPj4KPj4gOi0oCj4+Cj4+Cj4+PiBCdXQgdGhlbiBp
ZiBjbGFuZyBpcyBhbHJlYWR5IGRlZmluaW5nIF9fR05VQ19fLCB3aGF0IGFjdHVhbGx5IHByZXZl
bnRzIGFueQo+Pj4gb3RoZXIgdG8gZG8gaXQ/Cj4+Pgo+Pj4gSSBoYXZlIHlldCB0byBzZWUgYW55
b25lIHdhbnRlZCB0byBidWlsZCBYZW4gd2l0aCBhbm90aGVyIGNvbXBpbGVyIG90aGVyIHRoYW4K
Pj4+IGNsYW5nIGFuZCBHQ0MuIFNvIEkgd2lsbCBsZWF2ZSB0aGlzIHBhdGNoIGFzIGlzLiBGZWVs
IGZyZWUgdG8gc3VnZ2VzdCBhCj4+PiBkaWZmZXJlbnQgYXBwcm9hY2ggaWYgeW91IGFyZSBub3Qg
aGFwcHkgd2l0aCB0aGlzLgo+Pgo+PiBJcyB0aGVyZSBhIF9fUkVBTExZX1JFQUxMWV9HVU5DX18g
dmFyaWFibGU/IEkgZ3Vlc3Mgbm90LCBzbyBJIGRvbid0IGhhdmUKPj4gYSBiZXR0ZXIgc3VnZ2Vz
dGlvbi4gVGhpcyBwcm9ibGVtIGlzIHF1aXRlIGFubm95aW5nIChub3QgeW91ciBmYXVsdCBvZgo+
PiBjb3Vyc2UpIEkgd29uZGVyIGhvdyBvdGhlciBwcm9qZWN0cyBkZWFsIHdpdGggaXQuIFRoZXJl
IG11c3QgYmUgYQo+PiAiY2xlYW4iIHdheSB0byBkaXN0aW5ndWlzaCBnY2MgZnJvbSBvdGhlcnM/
Cj4+Cj4+IEZvciBub3csIEkgYW0gT0sgd2l0aCB0aGlzIHBhdGNoIGFzIGlzIGJlY2F1c2UgSSB3
b3VsZG4ndCBrbm93IHdoYXQgZWxzZQo+PiB0byBzdWdnZXN0LCBhbmQgSSBhZ3JlZSB0aGF0ICFk
ZWZpbmVkKF9fY2xhbmdfXykgJiYgZGVmaW5lZChfX0dOVUNfXykgaXMKPj4gYmFkLgo+IAo+IGFu
ZCB5b3UgY2FuIGFkZDoKPiAKPiBBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPgoKVGhhbmsgeW91LiBJIGhhdmUgYWxzbyB1cGRhdGVkIHRoZSBjb21t
aXQgbWVzc2FnZSB0byByZWZsZWN0IHRoZSBkaXNjdXNzaW9uOgoKCiAgICAgeGVuL2FybTogZml4
IGdldF9jcHVfaW5mbygpIHdoZW4gYnVpbHQgd2l0aCBjbGFuZwoKICAgICBDbGFuZyB1bmRlcnN0
YW5kcyB0aGUgR0NDaXNtIGluIHVzZSBoZXJlLCBidXQgc3RpbGwgY29tcGxhaW5zIHRoYXQgc3Ag
aXMKICAgICB1bml0aWFsaXNlZC4gSW4gc3VjaCBjYXNlcywgcmVzb3J0IHRvIHRoZSBvbGRlciB2
ZXJzaW9ucyBvZiB0aGlzIGNvZGUsCiAgICAgd2hpY2ggZGlyZWN0bHkgcmVhZCBzcCBpbnRvIHRo
ZSB0ZW1wb3JhcnkgdmFyaWFibGUuCgogICAgIE5vdGUgdGhhdCBHQ0Npc20gaXMgc3RpbGwga2Vw
dCBpbiBkZWZhdWx0IGJlY2F1c2Ugb3RoZXIgY29tcGlsZXJzIChlLmcuCiAgICAgY2xhbmcpIG1h
eSBhbHNvIGRlZmluZSBfX0dOVUNfXywgc28gQUZBSUsgdGhlcmUgYXJlIG5vIHByb3BlciB3YXkg
dG8KICAgICBkZXRlY3QgcHJvcGVybHkgR0NDLgoKICAgICBUaGlzIG1lYW5zIHRoYXQgaW4gdGhl
IGV2ZW50IFhlbiBpcyBwb3J0ZWQgdG8gYSBuZXcgY29tcGlsZXIsIHRoZSBjb2RlCiAgICAgd2ls
bCBuZWVkIHRvIGJlIHVwZGF0ZWQuIEJ1dCB0aGF0IGxpa2VseSBub3QgZ29pbmcgdG8gYmUgdGhl
IG9ubHkgcGxhY2UKICAgICB3aGVyZSBYZW4gd2lsbCBuZWVkIHRvIGJlIGFkYXB0ZWQuLi4KCiAg
ICAgVGhpcyBpcyBiYXNlZCBvbiB0aGUgeDg2IGNvdW50ZXJwYXJ0LgoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

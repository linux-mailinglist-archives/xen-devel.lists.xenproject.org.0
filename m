Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE883FBE0
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 16:49:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLU2M-0000x2-D9; Tue, 30 Apr 2019 14:47:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9xZw=TA=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hLU2K-0000wx-Jb
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 14:47:12 +0000
X-Inumbo-ID: d5e27c80-6b56-11e9-843c-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d5e27c80-6b56-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 14:47:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556635631; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=gDJQqIttG7YSx/K1VGmE43FA3RSUpQZLniPcobb70wE=;
 b=GP0gCzevyhSto2BFe3hCrMLxUVi2NzQlq/KtncO3W/M2K+eN7oSKH8p/bpCslQ4Mbp9RWkve
 v/fBiq+NpNs93bQwr+MyE9GNKPExcV5/IYBa0ij6heYwFlg+iIZ6wDkTzYDU8WI0lZDR6ZQb
 n3kHh3F0mm1e1KivkqS265mBmOY=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mxa.mailgun.org with ESMTP id 5cc85fee.7fd3c89b95b0-smtp-out-n01;
 Tue, 30 Apr 2019 14:47:10 -0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id t76so251048wmt.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2019 07:47:10 -0700 (PDT)
X-Gm-Message-State: APjAAAWZXgzeplxED3Y+zglO6GK/Q4BH3W/ejdXLKDwdgp25GDJDfF/B
 jiLBOm/8fInm01qSVJAsfWxkGieMoDzvo4SF6Pg=
X-Google-Smtp-Source: APXvYqw0rO/6VARfI/u5/+FbdWClh62aB0P0WBQLCvcDz55t0Rw1wVgjwaCpv0EO4awlNp7akemsJ+SENZ7HTQxC/nA=
X-Received: by 2002:a1c:35c3:: with SMTP id c186mr3620464wma.135.1556635629020; 
 Tue, 30 Apr 2019 07:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <20190426172138.14669-2-tamas@tklengyel.com>
 <5CC715D7020000780022A158@prv1-mh.provo.novell.com>
 <CABfawhmuCWcixtbcvs-7Psc3JGaUrWs50Dr4-aKgHVMYJXp+Rw@mail.gmail.com>
 <5CC7F611020000780022A3DF@prv1-mh.provo.novell.com>
 <CABfawhnjK-6KtLQx_bKngHg6+nHdjEMDYoSGErOGL5581JyZHw@mail.gmail.com>
 <5CC80AE3020000780022A44D@prv1-mh.provo.novell.com>
 <3c95a2b1-11bf-faff-5c55-99e517c56a48@citrix.com>
In-Reply-To: <3c95a2b1-11bf-faff-5c55-99e517c56a48@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 30 Apr 2019 08:46:33 -0600
X-Gmail-Original-Message-ID: <CABfawhn15m4n1OR95=-=-QRNfWaurShzV888GsUqtBoLr+LVHg@mail.gmail.com>
Message-ID: <CABfawhn15m4n1OR95=-=-QRNfWaurShzV888GsUqtBoLr+LVHg@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v3 2/4] x86/mem_sharing: introduce and use
 page_lock_memshr instead of page_lock
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
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgODo0MyBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gNC8zMC8xOSA5OjQ0IEFNLCBKYW4gQmV1bGlj
aCB3cm90ZToKPiA+Pj4+IE9uIDMwLjA0LjE5IGF0IDEwOjI4LCA8dGFtYXNAdGtsZW5neWVsLmNv
bT4gd3JvdGU6Cj4gPj4gT24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMToxNSBBTSBKYW4gQmV1bGlj
aCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4+Pgo+ID4+Pj4+PiBPbiAyOS4wNC4xOSBh
dCAxODozNSwgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+ID4+Pj4gT24gTW9uLCBBcHIg
MjksIDIwMTkgYXQgOToxOCBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3Rl
Ogo+ID4+Pj4+Pj4+IE9uIDI2LjA0LjE5IGF0IDE5OjIxLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4g
d3JvdGU6Cj4gPj4+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4gPj4+Pj4+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9tbS5jCj4gPj4+Pj4+IEBAIC0yMDMwLDEyICsyMDMwLDExIEBAIHN0YXRpYyBp
bmxpbmUgYm9vbAo+ID4+IGN1cnJlbnRfbG9ja2VkX3BhZ2VfbmVfY2hlY2soc3RydWN0IHBhZ2Vf
aW5mbyAqcGFnZSkgewo+ID4+Pj4+PiAgI2RlZmluZSBjdXJyZW50X2xvY2tlZF9wYWdlX25lX2No
ZWNrKHgpIHRydWUKPiA+Pj4+Pj4gICNlbmRpZgo+ID4+Pj4+Pgo+ID4+Pj4+PiAtaW50IHBhZ2Vf
bG9jayhzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQo+ID4+Pj4+PiArI2lmIGRlZmluZWQoQ09ORklH
X1BWKSB8fCBkZWZpbmVkKENPTkZJR19IQVNfTUVNX1NIQVJJTkcpCj4gPj4+Pj4+ICtzdGF0aWMg
aW50IF9wYWdlX2xvY2soc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkKPiA+Pj4+Pgo+ID4+Pj4+IEFz
IHBlciBhYm92ZSwgcGVyc29uYWxseSBJJ20gYWdhaW5zdCBpbnRyb2R1Y2luZwo+ID4+Pj4+IHBh
Z2Vfeyx1bn1sb2NrX21lbXNocigpLCBhcyB0aGF0IG1ha2VzIHRoZSBhYnVzZSBldmVuIG1vcmUK
PiA+Pj4+PiBsb29rIGxpa2UgcHJvcGVyIHVzZS4gQnV0IGlmIHRoaXMgd2FzIHRvIGJlIGtlcHQg
dGhpcyB3YXksIG1heSBJCj4gPj4+Pj4gYXNrIHRoYXQgeW91IHN3aXRjaCBpbnQgLT4gYm9vbCBp
biB0aGUgcmV0dXJuIHR5cGVzIGF0IHRoaXMgb2NjYXNpb24/Cj4gPj4+Pgo+ID4+Pj4gU3dpdGNo
aW5nIHRoZW0gdG8gYm9vbCB3b3VsZCBiZSBmaW5lLiBSZXBsYWNpbmcgdGhlbSB3aXRoIHNvbWV0
aGluZwo+ID4+Pj4gc2FuZXIgaXMgdW5mb3J0dW5hdGVseSBvdXQtb2Ytc2NvcGUgYXQgdGhlIG1v
bWVudC4gVW5sZXNzIHNvbWVvbmUgaGFzCj4gPj4+PiBhIHNwZWNpZmljIHNvbHV0aW9uIHRoYXQg
Y2FuIGJlIHB1dCBpbiBwbGFjZS4gSSBkb24ndCBoYXZlIG9uZS4KPiA+Pj4KPiA+Pj4gSSd2ZSBv
dXRsaW5lZCBhIHNvbHV0aW9uIGFscmVhZHk6IE1ha2UgYSBtZW0tc2hhcmluZyBwcml2YXRlIHZh
cmlhbnQKPiA+Pj4gb2YgcGFnZV97LHVufWxvY2soKSwgZGVyaXZlZCBmcm9tIHRoZSBQViBvbmVz
IChidXQgd2l0aCBwaWVjZXMKPiA+Pj4gZHJvcHBlZCB5b3UgZG9uJ3Qgd2FudC9uZWVkKS4KPiA+
Pgo+ID4+IFdlbGwsIHRoYXQncyB3aGF0IEkgYWxyZWFkeSBkaWQgaGVyZSBpbiB0aGlzIHBhdGNo
LiBObz8KPiA+Cj4gPiBObyAtIHlvdSd2ZSByZXRhaW5lZCBhIHNoYXJlZCBfcGFnZV97LHVufWxv
Y2soKSwgd2hlcmVhcyBteQo+ID4gc3VnZ2VzdGlvbiB3YXMgdG8gaGF2ZSBhIGNvbXBsZXRlbHkg
aW5kZXBlbmRlbnQgcGFpciBvZgo+ID4gZnVuY3Rpb25zIGluIG1lbV9zaGFyaW5nLmMuIFRoZSBv
bmx5IHRoaW5nIG5lZWRlZCBieSBib3RoIFBWCj4gPiBhbmQgSFZNIHdvdWxkIHRoZW4gYmUgdGhl
IFBHVF9sb2NrZWQgZmxhZy4KPgo+IEJ1dCBpdCB3YXNuJ3Qgb2J2aW91cyB0byBtZSBob3cgdGhl
IGltcGxlbWVudGF0aW9ucyBvZiB0aGUgYWN0dWFsIGxvY2sKPiBmdW5jdGlvbiB3b3VsZCBiZSBi
ZSBkaWZmZXJlbnQuICBBbmQgdGhlcmUncyBubyBwb2ludCBpbiBoYXZpbmcgdHdvCj4gaWRlbnRp
Y2FsIGltcGxlbWVudGF0aW9uczsgaW4gZmFjdCwgaXQgd291bGQgYmUgaGFybWZ1bC4KCkkgYWxz
byB0aGluayBpdCdzIHdhc3RlZnVsIGFuZCBhbiBpbnZpdGF0aW9uIGZvciBmdXR1cmUgYnJlYWth
Z2UuIEJ1dApyaWdodCBub3cgSSBqdXN0IHdhbnQgdGhlIGZ1bmN0aW9ucyB3b3JraW5nIHdpdGhv
dXQgdGhlbSBpbnRlbnRpb25hbGx5CmNyYXNoaW5nIHRoZSBoeXBlcnZpc29yIHVuZGVyIG1lIC0g
d2hpY2ggaXMgdGhlIGNhc2UgcmlnaHQgbm93LgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

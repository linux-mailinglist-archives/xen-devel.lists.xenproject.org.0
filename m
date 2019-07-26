Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F6B76C13
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 16:52:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr1Xy-0006wK-62; Fri, 26 Jul 2019 14:50:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yHJP=VX=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hr1Xw-0006wF-T0
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:50:12 +0000
X-Inumbo-ID: ab558956-afb4-11e9-8980-bc764e045a96
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ab558956-afb4-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 14:50:11 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id i10so105255941iol.13
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 07:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZxvZ7EB+kEV9KYXY7u6vBp+IRxRacAV6PALQNg4DqPI=;
 b=l8C/6OBkV71akdtcAAub8HgDJe3o1byU2oYtMBYNmHjFAD15qACXTw7tdrfYPSh/XZ
 z7EecApXxGq3yyQjSs22s0HpQ/M93yjErnCq9ouQBYRUL76upFtmHpDscFBFqH3UXl2y
 ho40ovOv3UnxjREA/z65Ofuq5VetSV6+qPrpltJszDaLdlh+TBOm0MhjNt7SajvkMBs3
 65AqyJueu0qrwYFL3hdfXnB+aJAzffoHbX7PlILyOKq/56a+Ju+wsXDdSYx0S3NqGMDC
 /kGNam3QFSF9d53JUCspiDbbteR9gLm8j1gLF1EqRVONWp/C9teEOy52gG1OjMnI88OZ
 4pEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZxvZ7EB+kEV9KYXY7u6vBp+IRxRacAV6PALQNg4DqPI=;
 b=Sw/Wkln5kHuDaYVZnDHKMXSx0H3m4+9Mue2UNVBEUNM9Tq2OOMxNFPBv1+oiye7cTW
 rWLOM83pwgoegMUlFlJuipG18mEZi6XOAPl0vLrte7G7YWIO0Obwc5KR10EYSHgQX2Fu
 0BCBBE3HZwSvGjwKZFVo0Cyocc1AyqaBaZPaKOYK62MgYNFkRHdgIHxZGg5XVkUNay/2
 1JRi2nJi3Oxio8ahx5PFHZczO/r0rEXVXM2vJIrsFKzWr/8+QbCFN0ND2tSkLACgSuTs
 KE+0o+1nhZaKtnc0v8z4pbySXB8e02ZfqWQ46hecnlPBYrEhgSmKoru+IcFKcbjUfWCo
 sqxQ==
X-Gm-Message-State: APjAAAVyUObGFzmKcV+0mNK99porsofn8GHBgbrIrEgOACU90epbjoNo
 Rdrq2bOEjQtlnV5wM8MouPnpUxAGTeIoTXeqfVc=
X-Google-Smtp-Source: APXvYqxOj+/ZbvuPpImEt+skvRcZh+V6VA+plJ9F5iI+XueaKFePCHQ5DHxdll4gF5Ee5b+JI9gBxVkaeGD+ux6voTk=
X-Received: by 2002:a6b:8b8b:: with SMTP id
 n133mr13654922iod.183.1564152611176; 
 Fri, 26 Jul 2019 07:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
In-Reply-To: <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Fri, 26 Jul 2019 17:49:59 +0300
Message-ID: <CAOcoXZYfJ--zTmU5SDWM0zV71-dcp=iPfO56noktf=j+MMLLVw@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>, Lars Kurth <lars.kurth@citrix.com>, 
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLCBBbGwsCgpPbiBUaHUsIEp1bCAxOCwgMjAxOSBhdCA2OjQ0IFBNIEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Cj4gSGkgVGFtYXMsCj4KPiBPbiA3
LzE4LzE5IDQ6MTQgUE0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+IE9uIFRodSwgSnVsIDE4
LCAyMDE5IGF0IDk6MDIgQU0gSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3Jv
dGU6Cj4gPj4KPiA+PiBIaSBUYW1hcywKPiA+Pgo+ID4+IEFkZGluZyBMYXJzLCBBcnRlbSBhbmQg
SXVyaWkuIEl1cmlpIGhhcyBiZWVuIHdvcmtpbmcgb24gYSB2ZXJzaW9uIGZvcgo+ID4+IGNsYW5n
LWZvcm1hdCByZWNlbnRseS4KPiA+Pgo+ID4+IE9uIDcvMTgvMTkgMzo0MyBQTSwgVGFtYXMgSyBM
ZW5neWVsIHdyb3RlOgo+ID4+PiBVc2luZyBhc3R5bGUgKGh0dHA6Ly9hc3R5bGUuc291cmNlZm9y
Z2UubmV0KSBjYW4gZ3JlYXRseSByZWR1Y2UgdGhlIG92ZXJoZWFkIG9mCj4gPj4+IG1hbnVhbGx5
IGNoZWNraW5nIGFuZCBhcHBseWluZyBzdHlsZS1maXhlcyB0byBzb3VyY2UtY29kZS4gVGhlIGlu
Y2x1ZGVkCj4gPj4+IC5hc3R5bGVyYyBpcyB0aGUgY2xvc2VzdCBhcHByb3hpbWF0aW9uIG9mIHRo
ZSBlc3RhYmxpc2hlZCBYZW4gc3R5bGUgKGluY2x1ZGluZwo+ID4+PiBzdHlsZXMgbm90IGZvcm1h
bGx5IHNwZWxsZWQgb3V0IGJ5IENPRElOR19TVFlMRSBidXQgY29tbW9ubHkgcmVxdWVzdGVkKS4K
PiA+Pj4KPiA+Pj4gQ2hlY2tpbmcgdGhlIGNvbW1lbnQgc3R5bGVzIGFyZSBub3QgaW5jbHVkZWQg
aW4gdGhlIGF1dG9tYXRpb24uCj4gPj4+Cj4gPj4+IEluY29ycG9yYXRpbmcgWGVuJ3MgZXhjZXB0
aW9uIHRvIHRoZSBkby13aGlsZSBzdHlsZSBpcyBvbmx5IHBhcnRpYWxseSBwb3NzaWJsZSwKPiA+
Pj4gdGh1cyBhIGNoYW5nZSBpcyBwcm9wb3NlZCB0byB0aGUgQ09ESU5HX1NUWUxFIG9mIG1vdmlu
ZyB0aGUgYnJhY2UgZnJvbSAiZG8geyIKPiA+Pj4gdG8gdGhlIG5leHQgbGluZS4KPiA+Pj4KPiA+
Pj4gTW9zdCBvZiBYZW4ncyBjb2RlLWJhc2UgaXMgbm9uLWNvbmZvcm1pbmcgYXQgdGhlIG1vbWVu
dDogMjg5IGZpbGVzIHBhc3MKPiA+Pj4gdW5jaGFuZ2VkLCA4NzYgaGF2ZSBzb21lIHN0eWxlIGlz
c3VlCj4gPj4+Cj4gPj4+IElkZWFsbHkgd2UgY2FuIHNsb3dseSBtaWdyYXRlIHRoZSBlbnRpcmUg
Y29kZS1iYXNlIHRvIGJlIGNvbmZvcm1pbmcsIHRodXMKPiA+Pj4gZWxpbWluYXRpbmcgdGhlIG5l
ZWQgb2YgZGlzY3Vzc2luZyBhbmQgZW5mb3JjaW5nIHN0eWxlIGlzc3VlcyBtYW51YWxseSBvbiB0
aGUKPiA+Pj4gbWFpbGluZ2xpc3QuCj4gPj4KPiA+PiBJIHF1aXRlIGxpa2UgdGhlIGlkZWEgb2Yg
YW4gYXV0b21hdGljIGNvZGluZyBzdHlsZSBjaGVja2VyLiBIb3dldmVyLCBpdAo+ID4+IGlzIGEg
Yml0IGNvbmNlcm5pbmcgdGhhdCBub3QgZXZlbiBhIDEvMyBvZiB0aGUgZmlsZXMgYXJlIGFibGUg
dG8gcGFzcwo+ID4+IHRoZSBjb2Rpbmcgc3R5bGUgeW91IHN1Z2dlc3QuIENvdWxkIHlvdSBleHBs
YWluIHdoZXRoZXIgdGhpcyBpcyBiZWNhdXNlCj4gPj4gdGhlIGZpbGVzIGRvZXMgbm90IGFscmVh
ZHkgZm9sbG93IFhlbiBjb2Rpbmcgc3R5bGUgb3IgaXMgaXQganVzdCB0aGUKPiA+PiBkaWZmZXJl
bmNlIHdpdGggYXN0eWxlPwo+ID4+Cj4gPj4gV2hhdCBhcmUgdGhlIG1haW4gc3R5bGUgaXNzdWVz
Pwo+ID4KPiA+IExvb2tzIGxpa2UgYSBsb3Qgb2YgZmlsZXMgdGhhdCBkb24ndCBmb2xsb3cgdGhl
IFhlbiBjb2Rpbmcgc3R5bGUKPiA+IGFzLWlzLiBBbGlnbm1lbnQgaXNzdWVzIHNlZW0gdG8gbWUg
dG8gYmUgdGhlIG1vc3QgY29tbW9uIGVycm9ycy4gU2VlCj4gPiB0aGUgZnVsbCBkaWZmIGhlcmU6
Cj4gPgo+ID4gaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vdGtsZW5neWVsL2M1Y2FjMTRhMGQ1N2Yx
MTlkZDc3NDdhMWJlNmZiMjYwCj4gPgo+ID4gV2UgY2FuIHBlcmhhcHMgdHVuZSBzb21lIGFzcGVj
dHMgb2YgaXQgd2UgZGlzYWdyZWUgd2l0aCB0aGUgYXN0eWxlCj4gPiBnZW5lcmF0ZWQgc3R5bGUg
YW5kIHRyeSB0byBvdmVycmlkZSBpdC4gSSBkaWQgbXkgYmVzdCB0byBtYWtlIGl0Cj4gPiBjb25m
b3JtIHRvIHRoZSBleGlzdGluZyBYZW4gc3R5bGUgYnV0IGNlcnRhaW5seSB0aGVyZSBjb3VsZCBi
ZSBvdGhlcgo+ID4gdHdlYWtzIG1hZGUgdG8gcmVkdWNlIHRoZSBjaHVybi4KPgo+IEkgdGhpbmsg
d2UgZGVmaW5pdGVseSB3YW50IHRvIGF2b2lkIGNodXJuIGFzIHRoaXMgaXMgZ29pbmcgdG8gdGFr
ZSBhIGxvdAo+IG9mIHRpbWUgdG8gZml4IGFsbCB0aGUgcGxhY2VzIHRvIHRoZSBuZXcgaW5kZW50
YXRpb24uCj4KPiBHb2luZyB0aHJvdWdoIHRoZSBkaWZmIEkgY2FuIHNlZSBtYWpvciBkaWZmZXJl
bmNlcyB3aXRoIHRoZSBYZW4gQ29kaW5nCj4gc3R5bGUgYW5kIGFsc28gd2hhdCBsb29rcyBsaWtl
IGluY29uc2lzdGVuY2llcyBmcm9tIHRoZSB0b29scyBpdHNlbGY6Cj4gICAgLSBMaW5lIDU4OiBU
aGlzIGlzIGZhaXJseSBjb21tb24gdG8gaW5kZW50IHRoZSBwYXJhbWV0ZXJzIGFzIGl0IGlzCj4g
dG9kYXkuIEJ1dCB0aGVuIG9uIGxpbmUgMTU4LzI3MiBpdCBpbmRlbnRzIGFzIHdlIGRvIHRvZGF5
LiBTbyBJIGFtIG5vdAo+IHN1cmUgd2hhdCB0aGUgZXhwZWN0ZWQgY29kaW5nIHN0eWxlIGZyb20g
dGhlIHRvb2xzLgo+ICAgIC0gTGluZSA2NzogSSBiZWxpZXZlIEphbiByZXF1ZXN0IHRoZSBzcGFj
ZSBiZWZvcmUgbGFiZWwKU2VlbXMgYWdyZWVkIG5vdCB0byBhZGQgdGhlIHNwYWNlcyBiZWZvcmUg
bGFiZWwuIFJpZ2h0PwoKPiAgICAtIExpbmUgMTM5OiBUaGUgeyBhcmUgY29tbW9ubHkgb24gdGhl
IHNhbWUgbGluZSBhcyBzdHJ1Y3Qgb3IgZGVmaW5pdGlvbi4KVGhpcyBzaG91bGQgYmUgc3RhdGVk
IGluIHRoZSBDb2Rpbmcgc3R5bGUgZXhwbGljaXRseS4KCj4gICAgLSBMaW5lIDI3NjogVGhlIHN3
aXRjaCBjYXNlIGluZGVudGF0aW9uIHdhcyBjb3JyZWN0IGZyb20gWGVuIFBvViBiZWZvcmUKPiAg
ICAtIExpbmUgMjg5OiBGaWxlcyBpbXBvcnRlZCBmcm9tIExpbnV4IHNob3VsZCBub3QgYmUgdG91
Y2ggaGVyZS4KClRoZSBjb2RlIGZpbGVzIHRvIHN0eWxlIG1hcHBpbmcgdG8gYmUgYXV0b21hdGVk
IG91dHNpZGUgb2YgY2xhbmctZm9ybWF0IHRvb2wuCkNsYW5nLWZvcm1hdCB0b29sIHN1cHBvcnRz
ICAzIG5ldyBmb3JtYXR0aW5nIHN0eWxlcyB0byBjb3ZlciBhbGwgdGhlCmNhc2VzIG1lbnRpb25l
ZCBpbiBYZW4gY29kaW5nIHN0eWxlIGRvY3VtZW50OiBYZW4sIExpYnhsLExpbnV4Cgo+ICAgIC0g
TGluZSAxMDI1OiBUaGUgdG9vbHMgbmVlZHMgdG8gYmUgYWJsZSB0byBkZWFsIGZvcl9lYWNoX3Zj
cHUoLi4uKSAmIGNvLgpDbGFuZy1mb3JtYXQgdG9vbCBzdXBwb3J0cyBzdWNoIGNhc2VzLgoKPiAg
ICAtIExpbmUgODczNTogSXQgbG9va3MgbGlrZSB0byBtZSB0aGUgdG9vbHMgcG9saWN5IGlzIHF1
aXRlCj4gaW5jb25zaXN0ZW50LiBJbiBwcmV2aW91cyBwbGFjZSBpdCBrZWVwcyBpdCBwcm9wZXJs
eSBhbGlnbmVkIHNlZSBsaW5lIDU3NzcuCj4KPiBJIGhhdmUgb25seSBsb29rZWQgcXVpY2tseSB0
aHJvdWdoIHRoZSBkaWZmLCBidXQgSSB0aGluayB0aGV5IGFyZSB0aGUKPiBtYWluIG9uZSB0aGF0
IHNob3VsZCBwcm9iYWJseSBiZSByZXNvbHZlZC4KPgoKUGxlYXNlIGJlIGF3YXJlIHRoYXQgaXQg
aXMgaW1wb3J0YW50IHRvIGFkZCBhbGwgdGhlIGNhc2VzIG1lbnRpb25lZAphYm92ZSAoYW5kIGFs
bCB0aGUgb3RoZXIpIHRvIHRoZSBYZW4gQ29kaW5nIHN0eWxlIGRvY3VtZW50IGV4cGxpY2l0bHku
ClRoaXMgc2VlbXMgdGhlIGJpZ2dlc3Qgbm9uLXRlY2huaWNhbCBpc3N1ZSB0byBvdmVyY29tZS4u
LgoKPiBDaGVlcnMsCj4KPiAtLQo+IEp1bGllbiBHcmFsbAo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==

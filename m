Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B69666E6EA
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:54:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoTJT-0005Cz-R2; Fri, 19 Jul 2019 13:52:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EVsN=VQ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hoTJS-0005Cu-FI
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:52:42 +0000
X-Inumbo-ID: 79de4c6a-aa2c-11e9-8980-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 79de4c6a-aa2c-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 13:52:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563544361; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=CjAyoZ9zSrmgSIY98K9WrmJtUBNKzKfzLLINg+uli6I=;
 b=QJ0+EV84BB2ZfbNVgnWtZL9muGRy6+YkxvzLKGmPnSK++lzbjF9WYdcshb92opR+RTV28kBN
 W9FZIeT0lTOXU9vFAwE8N4SpPDFkmRmOfrzlvqDeZWg+mwpcW4GrO4p+n8IE3mUH/2s0P/dC
 1C6kqrjmLc39ZN5+ikaUXWiK/kQ=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mxa.mailgun.org with ESMTP id 5d31cb28.7f02c5662a30-smtp-out-n03;
 Fri, 19 Jul 2019 13:52:40 -0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id p74so28879514wme.4
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jul 2019 06:52:40 -0700 (PDT)
X-Gm-Message-State: APjAAAV+hNB3/rXL8M3TgsXaD/KYEt2lNRVu5TOcakj0mXAWsuIhTo16
 UmqZbYEebpxSMF19X1/onxmugJCTM4/nOZGr6Fs=
X-Google-Smtp-Source: APXvYqxP5oKFQkhdCUcrjt5KJ0zM87zsw3BNgp7GRWOAxZbyor8S9k3yDMQMVuf12Qc7imIs5E9KvS3DEJLzgdLZS4Y=
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr48883356wmc.169.1563544359836; 
 Fri, 19 Jul 2019 06:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CABfawh=R-K3nje0gdsi-26Zj7-y6=KkiW=-s0TLK1o3QgVXLmw@mail.gmail.com>
 <27973ea5-a0d4-0ca4-fd3f-9680f179b283@arm.com>
 <CABfawhk4TzQemnG+3XwtQ4SGmquufOd4nFGajEWJJ++YFuqfZw@mail.gmail.com>
 <a0c71023-2546-d7c4-771c-02a944c93d90@arm.com>
 <CABfawhm+e4YfnPGT9K-aWqipAFJp1tqfFr9dNDm6g0Twb2gGoA@mail.gmail.com>
 <d9f6faf8-c784-7998-e184-19702a625ca9@arm.com>
 <6cabe11e-af20-2096-5516-02c0deaf6fca@arm.com>
In-Reply-To: <6cabe11e-af20-2096-5516-02c0deaf6fca@arm.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 19 Jul 2019 07:52:03 -0600
X-Gmail-Original-Message-ID: <CABfawh=LXyOYDXC5DhRRC-EWqNaz--sYGS0sCWkp6-ajRa4Tpw@mail.gmail.com>
Message-ID: <CABfawh=LXyOYDXC5DhRRC-EWqNaz--sYGS0sCWkp6-ajRa4Tpw@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgNzozMSBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPiB3cm90ZToKPgo+Cj4KPiBPbiAxOS8wNy8yMDE5IDE0OjI0LCBKdWxpZW4gR3Jh
bGwgd3JvdGU6Cj4gPiBIaSBUYW1hcywKPiA+Cj4gPiBPbiAxOS8wNy8yMDE5IDE0OjE0LCBUYW1h
cyBLIExlbmd5ZWwgd3JvdGU6Cj4gPj4gT24gRnJpLCBKdWwgMTksIDIwMTkgYXQgNzoxMSBBTSBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPiA+Pj4KPiA+Pj4gSGkg
VGFtYXMsCj4gPj4+Cj4gPj4+IE9uIDE5LzA3LzIwMTkgMTQ6MDAsIFRhbWFzIEsgTGVuZ3llbCB3
cm90ZToKPiA+Pj4+IE9uIEZyaSwgSnVsIDE5LCAyMDE5IGF0IDI6NDMgQU0gSnVsaWVuIEdyYWxs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4gPj4+Pj4KPiA+Pj4+PiBIaSBUYW1hcywK
PiA+Pj4+Pgo+ID4+Pj4+IE9uIDE4LzA3LzIwMTkgMTg6NDgsIFRhbWFzIEsgTGVuZ3llbCB3cm90
ZToKPiA+Pj4+Pj4+ICAgICAgIC0gTGluZSAxMDI1OiBUaGUgdG9vbHMgbmVlZHMgdG8gYmUgYWJs
ZSB0byBkZWFsIGZvcl9lYWNoX3ZjcHUoLi4uKQo+ID4+Pj4+Pj4gJiBjby4KPiA+Pj4+Pj4KPiA+
Pj4+Pj4gVGhlc2UgY2FuIGJlIG1hZGUgT0sgYnkgYWRkaW5nIGJyYWNlcy4gT3RoZXIgdGhhbiB0
aGF0IHRoZSBvbmx5IHdheSBJCj4gPj4+Pj4+IGZvdW5kIHRvIG1ha2UgaXQgbm90IGNoYW5nZSB0
aGUgaW5kZW50YXRpb24gaXMgdG8gYWRkIHRoZSBjb21tZW50ICIvKgo+ID4+Pj4+PiAqSU5ERU5U
LU9GRiogKi8iIGJlZm9yZSB0aGUgYmxvY2sgYW5kICIvKiAqSU5ERU5ULU9OKiAqLyIgYWZ0ZXJ3
YXJkcy4KPiA+Pj4+Pgo+ID4+Pj4+IE5vbmUgb2YgdGhlbSBsb29rcyByZWFsbHkgYXBwZWFsaW5n
IGJlY2F1c2UgaXQgbWVhbnMgYXN0eWxlIHdpbGwgbm90IGNvcnJlY3RseQo+ID4+Pj4+IGluZGVu
dCBpZiB0aGUgdXNlciBkb2VzIG5vdCBhZGQgYnJhY2VzIG9yIGNvbW1lbnRzLgo+ID4+Pj4+Cj4g
Pj4+Pj4gQ291bGQgYXN0eWxlIGJlIGVhc2lseSBtb2RpZmllZCB0byByZWNvZ25pemUgZm9yZWFj
aCBtYWNyb3M/Cj4gPj4+Pgo+ID4+Pj4gTm90IHRoYXQgSSdtIGF3YXJlIG9mLiBJZiB5b3UgZG9u
J3Qgd2FudCB0byBtYW51YWxseSBhbm5vdGF0ZSBmaWxlcwo+ID4+Pj4gd2l0aCB1bnN1cHBvcnRl
ZCBtYWNyb3MgdGhlbiBqdXN0IGV4Y2x1ZGUgdGhvc2UgZmlsZXMgZnJvbSBhc3R5bGUuIEkKPiA+
Pj4+IHdvdWxkbid0IHJlY29tbWVuZCBhZGRpbmcgdGhpcyB0byB0aGUgQ0kgZm9yIGFsbCBmaWxl
cywgb25seSBmb3IgdGhvc2UKPiA+Pj4+IHRoYXQgdGhlaXIgcmVzcGVjdGl2ZSBtYWludGFpbmVy
cyBoYXZlIGNvbmZpcm1lZCB0byBjb25mb3JtIHRvIHRoZQo+ID4+Pj4gc3R5bGUgYW5kIHdhbnQg
dG8gZW5mb3JjZSBpdCBnb2luZyBmb3J3YXJkLgo+ID4+Pgo+ID4+PiBTbyBhIGNvdXBsZSB1c2Ug
b2YgYW4gdW5zdXBwb3J0ZWQgbWFjcm9zIHdvdWxkIG1ha2UgaW1wb3NzaWJsZSB0byBlbmZvcmNl
IHRoZQo+ID4+PiBjb2Rpbmcgc3R5bGUuIFRoaXMgaXMgbm90IGEgdmVyeSBpZGVhbCBwb3NpdGlv
biB0byBiZSBpbi4KPiA+Pj4KPiA+Pj4gX2lmXyB3ZSBhcmUgZ29pbmcgdG8gYWRvcHQgYXN0eWxl
IHRoZW4gd2UgbmVlZCB0byBiZSBhYmxlIHRvIGVuZm9yY2UgaXQgb24gZXZlcnkKPiA+Pj4gWGVu
IGZpbGVzIGxvbmctdGVybS4gSWYgaXQgaXMgbm90IHBvc3NpYmxlIHRvIGRvIGl0IHdpdGggYXN0
eWxlLCB0aGVuIG1heWJlIHRoaXMKPiA+Pj4gaXMgbm90IHRoZSByaWdodCB0b29sIHRvIHVzZS4K
PiA+Pj4KPiA+Pj4gRm9yIGluc3RhbmNlLCBJIGtub3cgdGhhdCB0b29scyBzdWNoIGFzIGNsYW5n
LWZvcm1hdCBpcyBhYmxlIHRvIGRlYWwgd2l0aAo+ID4+PiBmb3JlYWNoIG1hY3Jvcy4KPiA+Pgo+
ID4+IElmIHRoZXJlIGFyZSBiZXR0ZXIgdG9vbHMgdGhlbiBzdXJlLCBJIGRvbid0IHJlYWxseSBt
aW5kIHVzaW5nCj4gPj4gc29tZXRoaW5nIGVsc2UuIEkganVzdCBkb24ndCBoYXZlIHRpbWUgdG8g
ZG8gdGhlIG1hbnVhbCBzdHlsZSBjaGVjawo+ID4+IGJhY2stYW5kLWZvcnRoIGFueW1vcmUsIHNv
IHRoZSBzb29uZXIgd2UgaGF2ZSBzb21ldGhpbmcgaW4gcGxhY2UgdGhlCj4gPj4gYmV0dGVyLgo+
ID4KPiA+IEkgdG90YWxseSBhZ3JlZSB3ZSBuZWVkIGEgdG9vbCBzbyB0aGUgcmV2aWV3ZXIgY2Fu
IGZyZWUtdXAgc29tZSB0aW1lIHRvIGZvY3VzIG9uCj4gPiBtb3JlIGltcG9ydGFudCB0aGluZ3Mu
IEhvd2V2ZXIsIEkgdGhpbmsgd2Ugc2hvdWxkIGJlIGNhcmVmdWwgb24gd2hhdCB3ZSBhZG9wdCBo
ZXJlLgo+ID4KPiA+IFNpbWlsYXIgdG8gQW5kcmV3LCBJIGFtIG9wZW4gd2l0aCBtb2RpZnlpbmcg
dGhlIGNvZGluZyBzdHlsZSB0byBoZWxwIHRoZQo+ID4gYXV0b21hdGljIHN0eWxlIGNoZWNrLiBC
dXQgSSBhbSBub3QgaGFwcHkgdG8gZGlzYWJsZSBhdXRvbWF0aWMgc3R5bGUgb24gcGFydCAob3IK
PiA+IGVudGlyZSkgb2YgZmlsZXMgZm9yZXZlci4KPiA+Cj4gPiBBdCB0aGUgbW9tZW50LCBjbGFu
Zy1mb3JtYXQgZmVlbHMgbW9yZSBwb3dlcmZ1bCBhbmQgdGhlcmUgYXJlIHBlb3BsZSB3b3JraW5n
IG9uIGl0Lgo+Cj4gRllJLCBiZWxvdyBhIGxpbmsgdG8gdGhlIGNsYW5nLWZvcm1hdCBjaGFuZ2Vz
Ogo+Cj4gaHR0cHM6Ly9naXRodWIuY29tL3hlbi10cm9vcHMvWGVuLUNsYW5nLWZvcm1hdC9ibG9i
L2RldmVsL2NsYW5nLWZvcm1hdC5wYXRjaAo+CgpUaGFua3MsIEknbGwgZ2l2ZSB0aGlzIGEgc2hv
dC4gU2luY2UgdGhpcyByZXF1aXJlcyBwYXRjaGluZyBjbGFuZyBpdApsb29rcyB0byBtZSBsaWtl
IGl0IG1heSBiZSBhIHdoaWxlIGJlZm9yZSBpdCdzIGdlbmVyYWxseSBhdmFpbGFibGUKZG93bnN0
cmVhbS4gUGVyaGFwcyBpdCdzIHN0aWxsIHdvcnRoIGV4cGxvcmluZyBhZGRpbmcgLmFzdHlsZXJj
IGFuZApoYXZlIGF0IGxlYXN0IHBhcnRpYWwgY292ZXJhZ2UgZm9yIHRoZSBhdXRvbWF0ZWQgc3R5
bGUgY2hlY2tzIGZvciB0aGUKaW50ZXJpbS4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs

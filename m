Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 105D1119D8
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 15:12:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMBTs-0002Lq-Td; Thu, 02 May 2019 13:10:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bVeI=TC=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hMBTr-0002Lf-7w
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 13:10:31 +0000
X-Inumbo-ID: a27be898-6cdb-11e9-9cf5-f72cdc17e15b
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a27be898-6cdb-11e9-9cf5-f72cdc17e15b;
 Thu, 02 May 2019 13:10:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556802619; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=oRFN1zhxqJhWRYCPvE4O4SZBhc6K0XlBgP36PW0422o=;
 b=mhcJjtqpsnsiDUaLwBpCvj70kd24soCAuu487lsSUdS6GKF++nXyAWl4xD/xt1txtrHw/7HH
 Ij1dm9U0b56/H1vjTDP9IHxwemok8ex/xS0tOiryxHploywEYHHkGuyiNdKN3BNLjRC9+og9
 VTLyXVZ2H2QcNEXBrWZXX5OexGg=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mxa.mailgun.org with ESMTP id 5ccaec3a.7f35af54ee70-smtp-out-n03;
 Thu, 02 May 2019 13:10:18 -0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id k23so3296924wrd.4
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2019 06:10:18 -0700 (PDT)
X-Gm-Message-State: APjAAAV22Bd8Jdub5tS7g4uQ6vHdn7nNs/QaDbLULXJx+OfrHU2HTGnc
 6qQaSr9blMwUhuanBQF/UQkfMz+NytIUjzRcl60=
X-Google-Smtp-Source: APXvYqxJEhw6bH2XkismT5gYyIQDWNrxo06g7lkBKg8yebMoZcIiZBSPkq3U/HqGAsRHmHchh2oPfOpAwjEwNyygvBs=
X-Received: by 2002:adf:e989:: with SMTP id h9mr2597562wrm.157.1556802617595; 
 Thu, 02 May 2019 06:10:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190501235731.1486-1-tamas@tklengyel.com>
 <59f57a48-b1da-7362-4024-c890cf357bf0@bitdefender.com>
 <5CCAB0FC020000780022B12F@prv1-mh.provo.novell.com>
In-Reply-To: <5CCAB0FC020000780022B12F@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 2 May 2019 07:09:40 -0600
X-Gmail-Original-Message-ID: <CABfawh=Kmsj=y1XcV8fiqbCZ6_bDp2-E+OoQHr_+_NCAy4OeSw@mail.gmail.com>
Message-ID: <CABfawh=Kmsj=y1XcV8fiqbCZ6_bDp2-E+OoQHr_+_NCAy4OeSw@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH] x86/vm_event: add gdtr_base to the vm_event
 structure
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wei.liu2@citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCAyOjU3IEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiA+Pj4gT24gMDIuMDUuMTkgYXQgMTA6MjUsIDxyY29qb2NhcnVAYml0
ZGVmZW5kZXIuY29tPiB3cm90ZToKPiA+IE9uIDUvMi8xOSAyOjU3IEFNLCBUYW1hcyBLIExlbmd5
ZWwgd3JvdGU6Cj4gPj4gUmVjZWl2aW5nIHRoaXMgcmVnaXN0ZXIgaXMgdXNlZnVsIGZvciBpbnRy
b3NwZWN0aW5nIDMyLWJpdCBXaW5kb3dzIHdoZW4gdGhlCj4gPj4gZXZlbnQgYmVpbmcgdHJhcHBl
ZCBoYXBwZW5lZCB3aGlsZSBpbiByaW5nMy4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFRhbWFz
IEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KPiA+PiBDYzogUmF6dmFuIENvam9jYXJ1
IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+ID4+IENjOiBUYW1hcyBLIExlbmd5ZWwgPHRh
bWFzQHRrbGVuZ3llbC5jb20+Cj4gPj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KPiA+PiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiA+
PiBDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+PiBDYzogUm9nZXIgUGF1IE1v
bm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+PiAtLS0KPiA+PiAgIHhlbi9hcmNoL3g4Ni92
bV9ldmVudC5jICAgICAgIHwgNSArKysrKwo+ID4+ICAgeGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2
ZW50LmggfCAzICsrLQo+ID4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvdm1fZXZlbnQu
YyBiL3hlbi9hcmNoL3g4Ni92bV9ldmVudC5jCj4gPj4gaW5kZXggNTFjMzQ5M2IxZC4uODczNzg4
ZTMyZiAxMDA2NDQKPiA+PiAtLS0gYS94ZW4vYXJjaC94ODYvdm1fZXZlbnQuYwo+ID4+ICsrKyBi
L3hlbi9hcmNoL3g4Ni92bV9ldmVudC5jCj4gPj4gQEAgLTE3OSw2ICsxNzksMTAgQEAgc3RhdGlj
IHZvaWQgdm1fZXZlbnRfcGFja19zZWdtZW50X3JlZ2lzdGVyKGVudW0KPiA+IHg4Nl9zZWdtZW50
IHNlZ21lbnQsCj4gPj4gICAgICAgICAgIHJlZy0+ZXNfc2VsID0gc2VnLnNlbDsKPiA+PiAgICAg
ICAgICAgYnJlYWs7Cj4gPj4KPiA+PiArICAgIGNhc2UgeDg2X3NlZ19nZHRyOgo+ID4+ICsgICAg
ICAgIHJlZy0+Z2R0cl9iYXNlID0gc2VnLmJhc2U7Cj4gPj4gKyAgICAgICAgYnJlYWs7Cj4gPgo+
ID4gUGxlYXNlIGFsc28gYWRkIGxpbWl0LCBhciwgc2VsLCBsaWtlIHRoZSBvdGhlcnMgZG8uCj4K
PiBUaGVyZSdzIG5vIGFyIG9yIHNlbCBmb3IgR0RUIChhbmQgSURUKS4gSW5zdGVhZCwgYmVjYXVz
ZSBvZiAuLi4KPgo+ID4gSW4gYWRkaXRpb24gdG8KPiA+IG1ha2luZyB0aGlzIG1vZGlmaWNhdGlv
biBsb29rIGxlc3Mgc3RyYW5nZSAoc2luY2UsIGluIGNvbnRyYXN0IHRvIHRoZQo+ID4gZnVuY3Rp
b24gbmFtZSwgbm90aGluZyBpcyBwYWNrZWQgZm9yIGdkdHJfYmFzZSksIGl0IHdpbGwgYWxzbyBz
YXZlCj4gPiBmdXR1cmUgd29yayBmb3IgYXBwbGljYXRpb25zIHdhbnRpbmcgdG8gdXNlIGdkdHIg
d2hpY2ggYWxzbyByZXF1aXJlCj4gPiBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eSB3aXRoIHByZXZp
b3VzIHZtX2V2ZW50IHZlcnNpb25zLgo+ID4KPiA+IEFzIHlvdSBrbm93LCBmb3IgZWFjaCBzdWNo
IG1vZGlmaWNhdGlvbiB3ZSBuZWVkIHRvIGhhdmUgYSBzZXBhcmF0ZQo+ID4gdm1fZXZlbnRfdlgg
aGVhZGVyIGluIG91ciBhcHBsaWNhdGlvbnMgc28gdGhhdCB3ZSdyZSByZWFkeSB0byBjcmVhdGUg
YQo+ID4gcmluZyBidWZmZXIgdXNpbmcgcmVxdWVzdHMgYW5kIHJlcGxpZXMgb2YgdGhlIHJpZ2h0
IHNpemUsIGFuZCBhbHNvIHRvIGJlCj4gPiBhYmxlIHRvIHByb3Blcmx5IGludGVycHJldCB0aGUg
cmluZyBidWZmZXIgZGF0YSwgc28gdGhlIGxlYXN0IGZyZXF1ZW50Cj4gPiBjaGFuZ2VzIHRvIHRo
ZSB2bV9ldmVudCBzdHJ1Y3QsIHRoZSBiZXR0ZXIuCj4KPiAuLi4gdGhpcyBJIHdvbmRlciB3aGV0
aGVyIHRoZSBJRFQgZGV0YWlscyBzaG91bGRuJ3QgZ2V0IGFkZGVkIGF0Cj4gdGhlIHNhbWUgdGlt
ZS4KClRoZSBjaHVybiBvZiB0aGUgaGVhZGVyIGlzIG5vdCB0aGF0IGJpZyBvZiBhIGRlYWwgLSBJ
IGRvIHRoZSBzYW1lIGluCkxpYlZNSSBhbmQgaXQncyBhIGxhcmdlbHkgY29weS1wYXN0ZSBqb2Ig
dGhhdCB0YWtlcyBwZXJoYXBzIH41bSB0byBhZGQKKHNlZSBodHRwczovL2dpdGh1Yi5jb20vdGts
ZW5neWVsL2xpYnZtaS9jb21taXQvNzUwOWNlNTZkMDQwOGRiZWM0ZTM3NGI4NzgwZGE2OWE3YmQy
MTJlOCkuClNvIHRoYXQgc2hvdWxkIG5vdCBiZSBhIGZhY3RvciBpbiBkZWNpZGluZyB3aGV0aGVy
IHdlIGFkZCBhIG5lZWRlZApleHRyYSBwaWVjZSBvciBub3QuIFNpbmNlIHRoZSB2bV9ldmVudCBB
QkkgaXMgY2hhbmdpbmcgZm9yIFhlbiA0LjEzCm5vdyB0aGUgQUJJIHZlcnNpb24gd2lsbCBvbmx5
IGJlIGJ1bXBlZCBvbmNlIGZvciA0LjEzLiBTbyB3ZSBzaG91bGQgYmUKYWJsZSB0byBhZGQvcmVt
b3ZlL3NodWZmbGUgd2hhdGV2ZXIgd2Ugd2FudCB3aGlsZSA0LjEzIG1lcmdlIHdpbmRvdyBpcwpv
cGVuLgoKVGhhdCBzYWlkIEkgZG9uJ3QgaGF2ZSBhIHVzZSBmb3IgaWR0IGFuZCBnZHRyX2xpbWl0
IHRoYXQgd2FycmFudHMKaGF2aW5nIHRvIHJlY2VpdmUgaXQgdmlhIHRoZSB2bV9ldmVudCBzdHJ1
Y3R1cmUgLSB0aG9zZSBwaWVjZXMgYXJlCmFsd2F5cyBqdXN0IGEgaHlwZXJjYWxsIGF3YXkgaWYg
bmVlZGVkLiBTbyBpbiB0aGUgdm1fZXZlbnQgc3RydWN0dXJlIEkKdGVuZCB0byBqdXN0IHB1dCB0
aGUgcmVnaXN0ZXJzIG5lZWRlZCBvZnRlbiBlbm91Z2ggdG8gd2FycmFudCBhdm9pZGluZwp0aGF0
IGV4dHJhIGh5cGVyY2FsbC4gQnV0IGlmIFJhenZhbiBzYXlzIGhlIGhhcyBhIHVzZSBmb3IgdGhl
bSwgSSBjYW4KYWRkIHRoZW0gaGVyZS4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs

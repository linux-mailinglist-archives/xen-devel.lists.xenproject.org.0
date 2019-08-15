Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE388F057
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 18:20:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyIRU-0008BS-7i; Thu, 15 Aug 2019 16:17:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T442=WL=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hyIRS-0008BI-Fz
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 16:17:34 +0000
X-Inumbo-ID: 2fbdf162-bf78-11e9-a661-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fbdf162-bf78-11e9-a661-bc764e2007e4;
 Thu, 15 Aug 2019 16:17:33 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g67so1727811wme.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2019 09:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=XiRUKLRcL+Du6B3qDHCgu1/fHX5FlZzmyxVghExoBoQ=;
 b=Pmyt5Rx5mZbi+lFdJ34yUUw+4jdeFqxHIuTyEyKRx1iO17Q1TgyEoj0vZLZnKZWbo8
 YHOKnbRPJsUbWJSmGOMUNHEDBo9Lju4Q4sT9XYTfEvw0WCgGsazgrfknxj7zV/r3ufA4
 BIJzKHb6PVFg0DPHWquskqf/mjRef14jZ0FVaKS/b//eEjZR82MhDe510HSVlvaOMzJH
 AcPDPgKnc79gB6qSxibAnhKvB1ayVrdjMNw7OmDlZydTAoPzHrAhCBfaoWB5ehqkl3lT
 grKrXgNssR6xp4WkwQkxsl8zhwP+xbsSYyf7Ny/2Fp4rGroAKFRqpTXu9Mx+ONwX5tF9
 DX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=XiRUKLRcL+Du6B3qDHCgu1/fHX5FlZzmyxVghExoBoQ=;
 b=VKI7bnvrdvntpA961HgDOqxODHOoeXiuh1RHF8X8WRZ6pAxPFftvH5nBvW/uzS08NO
 yp0fvv00u9teAezcSbEKByFraYf9sWmL8xl5xHYikA2FkPW1DHWhQTbOiEXXmRoF/QHD
 jzem/N4JJW7Id1DSfJbUOq3NPrmhxaYzRGcbY5nocmUt35L6qBjxC7HANuwJvjCC/Zzw
 jPKVuUOgxcyDPKAPcfM6s0xM2wSAQ/k0mN2fssWOcBP3JyzZtR8tjVm//Z3BxtEvv+UG
 s3wnEQh41I5d7ZAVNQCfRClR2cS21P3rLqb6gPcyksFCNjw95v999BDivifP+IKMrjTD
 JHFw==
X-Gm-Message-State: APjAAAUoEPS2AFzt4H2gm0dGE/n+BPfC/YL/iv1tgflVaMutl9vLZgAA
 hMmoeab8mJxb/6ziwFyNe4I=
X-Google-Smtp-Source: APXvYqxKAB05kMl4Tviaeq65xEjYz2VGgPsQlDePk/DqBNO1lYeHgVrquZX5eIVJK4phphLcBmBqww==
X-Received: by 2002:a1c:cb0b:: with SMTP id b11mr3527578wmg.128.1565885852023; 
 Thu, 15 Aug 2019 09:17:32 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:ac18:da00:401e:f277:3894:a225?
 ([2a02:c7f:ac18:da00:401e:f277:3894:a225])
 by smtp.gmail.com with ESMTPSA id g7sm3385974wmg.8.2019.08.15.09.17.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Aug 2019 09:17:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
From: Lars Kurth <lars.kurth.xen@gmail.com>
In-Reply-To: <7308f1a7-ceaf-d0e3-b425-bbd8049d5007@arm.com>
Date: Thu, 15 Aug 2019 17:17:30 +0100
Message-Id: <916BF4B8-1902-4FCA-B6D2-C914470CC79D@gmail.com>
References: <20190815112708.11474-1-wipawel@amazon.de>
 <8d5350af-2ca8-a651-c43c-07372779322d@arm.com>
 <3E431F27-7D89-4CE8-8FBA-86A38EBA580F@xenproject.org>
 <A373327B-1B2B-4892-97DB-132D1EA7084E@amazon.com>
 <18CBBC37-9027-41B7-8375-44FE3E56F79F@gmail.com>
 <C3D44CDE-E1C3-404D-852E-FDA691F09B82@gmail.com>
 <7308f1a7-ceaf-d0e3-b425-bbd8049d5007@arm.com>
To: Julien Grall <julien.grall@arm.com>
X-Mailer: Apple Mail (2.3445.104.11)
Subject: Re: [Xen-devel] [PATCH lp-metadata 2/3] livepatch: Handle arbitrary
 size names with the list operation
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
Cc: "Tim \(Xen.org\)" <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, 'Jan Beulich' <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDE1IEF1ZyAyMDE5LCBhdCAxNjo1OCwgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4gd3JvdGU6Cj4gCj4gSGkgTGFycywKPiAKPiBPbiAxNS8wOC8yMDE5IDE2OjQ2LCBM
YXJzIEt1cnRoIHdyb3RlOgo+Pj4gT24gMTUgQXVnIDIwMTksIGF0IDE2OjMzLCBMYXJzIEt1cnRo
IDxsYXJzLmt1cnRoLnhlbkBnbWFpbC5jb20gPG1haWx0bzpsYXJzLmt1cnRoLnhlbkBnbWFpbC5j
b20+PiB3cm90ZToKPj4+IAo+Pj4gCj4+PiAKPj4+PiBPbiAxNSBBdWcgMjAxOSwgYXQgMTY6MTks
IFdpZWN6b3JraWV3aWN6LCBQYXdlbCA8d2lwYXdlbEBhbWF6b24uZGUgPG1haWx0bzp3aXBhd2Vs
QGFtYXpvbi5kZT4+IHdyb3RlOgo+Pj4+IAo+Pj4+IEhpIExhcnMsIEp1bGllbiwKPj4+PiAKPj4+
PiBUaGFua3MgZm9yIHRoZSBwb2ludGVycywgSSB3aWxsIHJlYWQgdGhlbSB1cCBhbmQgZm9sbG93
IHRoZSByZWNvbW1lbmRhdGlvbnMgd2l0aCBteSBmdXR1cmUgY29udHJpYnV0aW9ucy4KPj4+PiBT
b3JyeSBmb3IgdGhlIG1lc3PigKYKPj4+IAo+Pj4gSXQncyBub3QgcmVhbGx5IGEgbWVzczogaXQg
bXVzdCBoYXZlIGJlZW4gcXVpdGUgYSBwYWluIHRvIHB1dCB0aGUgbWFpbHMgdG9nZXRoZXIgbWFu
dWFsbHkKPj4+IEFuZCBpdCB3b3VsZCBiZWNvbWUgbW9yZSBwYWluZnVsIGZvciBhIHNlY29uZCBy
ZXZpc2lvbgo+Pj4gSSBoYXZlIGJlZW4gdGhyb3VnaCB0aGlzIG15c2VsZgo+Pj4gCj4+Pj4gQnV0
LCBsZXQgbWUgYXNrIGZpcnN0IGJlZm9yZSByZWFkaW5nIHRoZSB3aWtpcywgaG93IGRvIHlvdSBw
cmVmZXIgc3VibWl0dGluZyBzZXJpZXMgdGhhdCBjb250YWluIHBhdGNoZXMgYmVsb25naW5nIHRv
IDIgZGlzdGluY3QgcmVwb3MgKGUuZy4geGVuIGFuZCBsaXZlcGF0Y2gtYnVpbGQtdG9vbHMpPwo+
Pj4gCj4+PiBUaGF0J3MgYSBnb29kIHF1ZXN0aW9uIGFuZCBhIHZlcnkgcmFyZSB1c2UtY2FzZS4g
V2Ugc3BsaXQgdGhlbSwgYXMgYWxsIHRoZSB0b29scyBzdWNoIGFzIGdpdCBmb3JtYXQtcGF0Y2gg
b25seSB3b3JrIG9uIG9uZSByZXBvCj4+PiBBcHBseWluZyBwYXRjaGVzIGFsc28gb25seSB3b3Jr
cyBvbiBhIHBlciByZXBvIGJhc2lzCj4+PiAKPj4+IFNvLCBJIHdvdWxkIHNlbmQgdHdvIHNlcmll
cy4gQnV0IG1lbnRpb24gdGhlIHJlbGF0aW9uc2hpcCBpbiB0aGUgY292ZXIgbGV0dGVyIChhbmQv
b3IgcGF0Y2ggaWYgaXQgaXMgYSBzaW5nbGUgb25lKQo+Pj4gCj4+PiBUaGUgdG9vbHMgaW4gdGhl
IGRvY3MgY3VycmVudGx5IG1heSBub3Qgd29yayBvbiBsaXZlcGF0Y2gtYnVpbGQtdG9vbHMuZ2l0
Cj4+PiAqIEZpcnN0OiB0aGVyZSBpcyBubyBNQUlOVEFJTkVSUyBmaWxlIGluIGxpdmVwYXRjaC1i
dWlsZC10b29scy5naXQsIHdoaWNoIHJlYWxseSBzaG91bGQgYmUgYWRkZWQKPj4+ICogU2Vjb25k
OiB1c2luZyB4ZW4uZ2l0Oi9zY3JpcHRzL2FkZF9tYWludGFpbmVycy5wbCBtYXkgbm90IHdvcmsg
d2hlbiBjYWxsZWQgZnJvbSB3aXRoaW4gbGl2ZXBhdGNoLWJ1aWxkLXRvb2xzLmdpdAo+Pj4gCj4+
PiBJIGFtIGdvaW5nIHRvIHBsYXkgd2l0aCB0aGlzIGFuZCB1cGRhdGUgdGhlIGRvY3MgYW5kIGlm
IG5lZWRlZCB0aGUgdG9vbHMgYWNjb3JkaW5nbHkKPj4+IFlvdSBtYXkgaGF2ZSB0byBpbXByb3Zp
c2UgaW4gdGhlIG1lYW50aW1lOgo+Pj4gKiBTdGVwIDEgJiAzIHdpbGwgd29yazogU3RlcCAyLCBv
cHRpb24gMSB3aWxsIHByb2JhYmx5IG5vdCAod2hpY2ggbWVhbnMgdW50aWwgSSBoYXZlIGRvbmUg
dGhpcywgeW91IG1heSBoYXZlIHRvIGZvbGxvdyBvcHRpb24gMiBhbmQgbWFrZSBzdXJlIHRoYXQg
dGhlIHJpZ2h0IHBlb3BsZSBhcmUgQ0MnZWQpCj4+IEkgY2FuIGNvbmZpcm0gdGhhdCBTdGVwIDIg
ZG9lcyBub3Qgd29yayB3aXRob3V0IHNvbWUgdG9vbHMgY2hhbmdlcyB0byBzY3JpcHRzL2FkZF9t
YWludGFpbmVycy5wbCB3aGVuIGNhbGxlZCBmcm9tIHdpdGhpbiBhIG5vbi14ZW4uZ2l0IHJlcG8K
Pj4gQW5kCj4+IGdpdCBzZW5kLWVtYWlsIC0tdG8geGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnIDxtYWlsdG86eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPiAtLWNjLWNtZD0iLi4v
eGVuLmdpdC9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIiAtLWRyeS1ydW4gLTEKPj4gZXJyb3Jz
IHdpdGgKPj4gLi4veGVuLmdpdC9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsOiBUaGUgY3VycmVu
dCBkaXJlY3RvcnkgZG9lcyBub3QgYXBwZWFyIHRvIGJlIGEgWGVuIHNvdXJjZSB0cmVlLgo+PiBJ
IG5lZWQgdG8gZml4IHRoaXMuIEhvcGVmdWxseSBnZXRfbWFpbnRhaW5lci5wbCBpc24ndCB0b28g
ZGVwZW5kYW50IG9uIHRoZSBhY3R1YWwgWGVuIHRyZWUKPiAKPiBnZXRfbWFpbnRhaW5lci5wbCBy
ZWxpZXMgb24gdGhlIGN1cnJlbnQgd29ya2luZyBkaXJlY3RvcnkgdG8gYmUgdGhlIHRvcCBvZiB0
cmVlLgo+IAo+IEF0IHRoZSBtb21lbnQsIGl0IGNoZWNrcyB2YXJpb3VzIGZpbGUgYXJlIHByZXNl
bnQgKHNlZSB0b3Bfb2ZfdHJlZSkgYnV0IEkgdGhpbmsgaXQgc2hvdWxkIGJlIGZlYXNpYmxlIHRv
IGp1c3QgcmVsYXggaXQgdG8ganVzdCBNQUlOVEFJTkVSUy4KPiAKPiBUaGUgcmlzayBpcyBhIHVz
ZXIgbWF5IGVuZCB1cCB0byBjYWxsIHRoZSB3cm9uZyBNQUlOVEFJTkVSUyBmaWxlIGlmIGl0IG1l
c3NlcyB1cCB0aGUgY3VycmVudCB3b3JraW5nIGRpcmVjdG9yeSAoaS5lIGNhbGxpbmcgZm9yIFhl
biBwYXRjaGVzIGZyb20gbGl2ZXBhdGNoLXRvb2xzKS4gTm90IHN1cmUgaWYgdGhpcyBpcyBhIHJl
YWwgY29uY2VybiB0aG91Z2guLi4KPiAKPiBOb3RlIHRoYXQgTGludXggaGFzIGEgc2ltaWxhciBj
aGVjayB0byBlbnN1cmUgdGhlIHVzZXIgaXMgb24gdGhlIHJpZ2h0IGRpcmVjdG9yeSAoaS5lCgpJ
IGtub3csIHRoYXQncyB3aGVyZSB3ZSBpbmhlcml0ZWQgdGhhdCBmcm9tLiBJIHN1cHBvc2UgdGhl
IGlzc3VlIGlzIHRoYXQgdGhlIE1BSU5UQUlORVJTIGZpbGUgZm9ybWF0IG1heSBiZSBkaWZmZXJl
bnQgaW4gYW5vdGhlciB0cmVlIGFuZCB0aHVzIHRoZSB0b29sIG1heSBmYWxsIG92ZXIuCgpJbiBh
bnkgY2FzZTogSSBoYXZlIGEgcGF0Y2ggd2hpY2ggcHJpbnRzIG91dCBhIHdhcm5pbmcgcmF0aGVy
IHRoYW4gYWJvcnQKCkkgd2lsbCBzZW5kIG9uY2UgSSBtYWRlIGNvcnJlc3BvbmRpbmcgY2hhbmdl
IHRvIGdldF9tYWludGFpbmVycy5wbCwgd2hpY2ggc2VlbXMgdG8gaGF2ZSBjYWxsIGxvY2F0aW9u
cyB0byBhZGRfbWFpbnRhaW5lcnMucGwgaGFyZGNvZGVkIGluIGl0CgpMYXJzCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

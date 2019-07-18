Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC5F6D095
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 16:59:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho7q4-0000Sa-Rn; Thu, 18 Jul 2019 14:56:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B+y+=VP=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ho7q3-0000SU-M1
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 14:56:55 +0000
X-Inumbo-ID: 47e34dea-a96c-11e9-8980-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 47e34dea-a96c-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 14:56:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563461813; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=Jo/AGgFrcQVm6rAs6FJeEHRY5834jlXbI6FVR588wGE=;
 b=nSRsYSOrq9IZlDyedph6pt5MeApP3PNbCmbGdqhbxWyc3B0kxXy0/lMg77Wywbf75s6bkLjv
 4INUNmMdh0TRTWl0Ph5HQIvie61SfKKoTQAsu76kWHvK/TYgDm0IT0rU9ZyEwiSnfnKHyjmP
 GvKa8c1UDqWq1DsAibjkcfpEEFg=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mxa.mailgun.org with ESMTP id 5d3088b5.7fd68e40d070-smtp-out-n03;
 Thu, 18 Jul 2019 14:56:53 -0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id s3so25914685wms.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 07:56:52 -0700 (PDT)
X-Gm-Message-State: APjAAAUyPhcdNAAUdmSF6kREVItZiGLbAVrvKWSplAM09AI+0CpGv98R
 VVFe305I/mTujAIEpgl5L3xdbAxcLeZ7cCoHgvk=
X-Google-Smtp-Source: APXvYqxL9uoeXwE14ikyhdODKbqDpZrhOu6CyIHU4xgh/3cqMZalcPfmOgWT91eNEbeV862vP6lN2z3vf5651A3g9UQ=
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr43360560wmc.169.1563461812116; 
 Thu, 18 Jul 2019 07:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190717193335.11991-1-tamas@tklengyel.com>
 <20190717193335.11991-2-tamas@tklengyel.com>
 <66bbd9f7-12f9-b654-555d-a02d5f4f0dba@suse.com>
 <CABfawhkJR8sz8cVCfcuxQ-4+xoQOSTs-XQuow-qzPyd4xZwq0g@mail.gmail.com>
 <b6cdc457-01e8-03cf-5408-11337e5a10d9@suse.com>
 <CABfawhkAcoHm_+5ob6nge4xELUvpb4kZXoC+n_7sF-PNK+untQ@mail.gmail.com>
 <6e2986dd-5416-4ef3-c00b-eca4db578e7c@suse.com>
 <CABfawh=6vwfcRqHMrbgojduvvAk5jMJ_u=vOt=r-3sCiYGapoA@mail.gmail.com>
 <f3fc709b-d959-07f3-c047-a1da24816e09@suse.com>
 <CABfawhkvmiUoRLJaiCU4RwNpCRpcqRthTW9xZ0NLc6CCbS8-uQ@mail.gmail.com>
 <92678567-f9d1-aea4-52e8-d9e1fb6c12e2@suse.com>
In-Reply-To: <92678567-f9d1-aea4-52e8-d9e1fb6c12e2@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 18 Jul 2019 08:56:15 -0600
X-Gmail-Original-Message-ID: <CABfawhnZ-a3ddc6r+qDTcT7r6_A81_L+8_ychqQeyLjJ3hw1aA@mail.gmail.com>
Message-ID: <CABfawhnZ-a3ddc6r+qDTcT7r6_A81_L+8_ychqQeyLjJ3hw1aA@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v6 1/5] x86/mem_sharing: reorder when pages
 are unlocked and released
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgODo0NyBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTguMDcuMjAxOSAxNjozNSwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gT24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgODoyOCBBTSBKYW4gQmV1bGljaCA8SkJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4+IE9uIDE4LjA3LjIwMTkgMTU6NDcsIFRhbWFzIEsg
TGVuZ3llbCB3cm90ZToKPiA+Pj4gSSBmZWVsIGxpa2Ugd2UgYXJlIGdvaW5nIGluIGNpcmNsZXMg
YW5kIGhhdmluZyB0aGUgc2FtZSBjb252ZXJzYXRpb25zCj4gPj4+IG92ZXIgYW5kIG92ZXIgd2l0
aG91dCByZWFsbHkgbWFraW5nIGFueSBoZWFkd2F5LiBZb3UgaW50cm9kdWNlZAo+ID4+PiBncmFi
YmluZyB0aGUgYnJva2VuIGV4dHJhIHJlZmVyZW5jZSBpbiAwNTAyZTBhZGFlMi4gSXQgaXMgYW5k
IHdhcwo+ID4+PiBhY3R1YWxseSB1bm5lZWRlZCB0byBzdGFydCB3aXRoIGlmIHRoZSBwcm9wZXIg
c29sdXRpb24gd2FzIHB1dCBpbgo+ID4+PiBwbGFjZSwgd2hpY2ggaXMgd2hhdCB0aGlzIHBhdGNo
IGRvZXMsIHJlb3JkZXJpbmcgdGhpbmdzLgo+ID4+Cj4gPj4gSSdtIG5vdCBjb21wbGFpbmluZyBh
Ym91dCB0aGUgY2hhbmdlczsgSSdkIG1lcmVseSBsaWtlIHRoZSBkZXNjcmlwdGlvbgo+ID4+IHN0
YXRlIHdoeSB0aGV5J3JlIG5lZWRlZC4KPiA+Cj4gPiBPSy4KPiA+Cj4gPj4+IEl0J3MgcG9zc2li
bGUgdGhlcmUgYXJlIG90aGVyIGluc3RhbmNlcyB3aGVyZSB0aGlzIG1heSBzdGlsbCBiZQo+ID4+
PiBicm9rZW4uIFJpZ2h0IG5vdyBJIG9ubHkgaGF2ZSBiYW5kd2lkdGggdG8gdGVzdCBhbmQgZml4
IHRoZSBwYXRocyBJCj4gPj4+IHVzZS4gSWYgdGhhdCdzIHVuYWNjZXB0YWJsZSBJJ20gaGFwcHkg
dG8gY29udGludWUgZGV2ZWxvcG1lbnQgaW4gbXkKPiA+Pj4gcHJpdmF0ZSBmb3JrIGFuZCBsZWF2
ZSB0aGluZ3MgYXMtaXMgdXBzdHJlYW0uCj4gPj4KPiA+PiBTaW1pbGFybHksIGlmIHRoZXJlIGFy
ZSBsaW1pdGF0aW9ucyAtIGZpbmUuIEJ1dCBwbGVhc2Ugc2F5IHNvIGluIHRoZQo+ID4+IGRlc2Ny
aXB0aW9uLCB0byBhdm9pZCBnaXZpbmcgdGhlIGltcHJlc3Npb24gdGhhdCB0aGUgaXNzdWVzIGhh
dmUgYmVlbgo+ID4+IHRha2VuIGNhcmUgb2YgYWx0b2dldGhlci4KPiA+Cj4gPiBGYWlyIGVub3Vn
aC4KPgo+IEFuZCBidHcgLSBpZiB5b3UganVzdCBzZW50IGFuIHVwZGF0ZWQgZGVzY3JpcHRpb24s
IEkgdGhpbmsgSSdkIGNvbW1pdAo+IHRoaXMgd2l0aG91dCBmdXJ0aGVyIHdhaXRpbmcgZm9yIEdl
b3JnZSB0byBmaW5kIHRpbWUgdG8gZXZlbnR1YWxseSBhY2sKPiBpdC4KClRoYXQgd291bGQgYmUg
Z3JlYXQuIFRoaXMgaXMgdGhlIG1lc3NhZ2UgSSB0eXBlZCBvdXQgZm9yIHY3OgoKICAgIHg4Ni9t
ZW1fc2hhcmluZzogcmVvcmRlciB3aGVuIHBhZ2VzIGFyZSB1bmxvY2tlZCBhbmQgcmVsZWFzZWQK
CiAgICBDYWxsaW5nIF9wdXRfcGFnZV90eXBlIHdoaWxlIGFsc28gaG9sZGluZyB0aGUgcGFnZV9s
b2NrIGZvciB0aGF0CnBhZ2UgY2FuIGNhdXNlCiAgICBhIGRlYWRsb2NrLiBUaGVyZSBtYXkgYmUg
Y29kZS1wYXRocyBzdGlsbCBpbiBwbGFjZSB3aGVyZSB0aGlzIGlzCmFuIGlzc3VlLCBidXQKICAg
IGZvciBub3JtYWwgc2hhcmluZyBwdXJwb3NlcyB0aGlzIGhhcyBiZWVuIHRlc3RlZCBhbmQgd29y
a3MuCgogICAgUmVtb3ZpbmcgZ3JhYmJpbmcgdGhlIGV4dHJhIHBhZ2UgcmVmZXJlbmNlIGF0IGNl
cnRhaW4gcG9pbnRzIGlzCmRvbmUgYmVjYXVzZSBpdAogICAgaXMgbm8gbG9uZ2VyIG5lZWRlZCwg
YSByZWZlcmVuY2UgaXMgaGVsZCB0aWxsIG5lY2Vzc2FyeSB3aXRoIHRoaXMKcmVvcmRlciB0aHVz
CiAgICB0aGUgZXh0cmEgcmVmZXJlbmNlIGlzIHJlZHVuZGFudC4KCiAgICBUaGUgY29tbWVudCBi
ZWluZyBkcm9wcGVkIGlzIGluY29ycmVjdCBzaW5jZSBpdCdzIG5vdyBvdXQtb2YtZGF0ZS4KClRh
bWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

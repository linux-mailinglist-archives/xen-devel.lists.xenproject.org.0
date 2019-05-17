Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255E821EE4
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 22:09:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRj6M-0005Ev-M9; Fri, 17 May 2019 20:05:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hBe+=TR=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hRj6L-0005Eq-C0
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 20:05:09 +0000
X-Inumbo-ID: 118102c8-78df-11e9-a0f8-0305030d0c1d
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 118102c8-78df-11e9-a0f8-0305030d0c1d;
 Fri, 17 May 2019 20:05:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1558123508; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=rkYIrI0WUciLJMeiVW0hjeFbky3z65CvdtCSacwtxNE=;
 b=AI/oQfUZVm0nXkkGi79Tjx4s7g3XOSG5dJv/HeopMeJ2HHqeaTCPRYpHgFZcFPJ88TFAyDRr
 3Cy0RJZbvX8/dVa1Mytu8bcv1SnRWjOOSdNXp6MzpHozNeHSOsNzFO5fASp1HqlMRdbs38Em
 5cUnq76Jwmd95mww9UPfmyRc/kw=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mxa.mailgun.org with ESMTP id 5cdf13f2.7f566864b530-smtp-out-n01;
 Fri, 17 May 2019 20:05:06 -0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 15so3777949wmg.5
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2019 13:05:06 -0700 (PDT)
X-Gm-Message-State: APjAAAVQ5e09MhKotFaWjXc/LSYcj9KCuiTGxksLSrxDSuHygZrnNv1C
 3KOC6V2SEOTMYA9L3kWXWuarZwgaP0SFbiccIHI=
X-Google-Smtp-Source: APXvYqxqMRBzcEsoq3n1RrIrsNR7VOhJv0XTag/HLBTj3BQLye3b0gfXxuAkox8AmN19kpWOZESmbRofLAOGqvnwdeU=
X-Received: by 2002:a7b:c7c7:: with SMTP id z7mr3667022wmk.72.1558123505264;
 Fri, 17 May 2019 13:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190516213752.1701-1-tamas@tklengyel.com>
 <20190516213752.1701-2-tamas@tklengyel.com>
 <5CDE610D020000780022FF42@prv1-mh.provo.novell.com>
In-Reply-To: <5CDE610D020000780022FF42@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 17 May 2019 14:04:28 -0600
X-Gmail-Original-Message-ID: <CABfawhnu91Qjy+DHcoBC4zG5rF8LurCZ1=kMXT2aHg0qg8f7vQ@mail.gmail.com>
Message-ID: <CABfawhnu91Qjy+DHcoBC4zG5rF8LurCZ1=kMXT2aHg0qg8f7vQ@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v5 2/4] x86/mem_sharing: copy a page_lock
 version to be internal to memshr
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMToyMSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDE2LjA1LjE5IGF0IDIzOjM3LCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKPiA+ICsr
KyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAo+ID4gQEAgLTM1NiwyNCArMzU2LDE1IEBAIHN0
cnVjdCBwbGF0Zm9ybV9iYWRfcGFnZSB7Cj4gPiAgY29uc3Qgc3RydWN0IHBsYXRmb3JtX2JhZF9w
YWdlICpnZXRfcGxhdGZvcm1fYmFkcGFnZXModW5zaWduZWQgaW50ICphcnJheV9zaXplKTsKPiA+
Cj4gPiAgLyogUGVyIHBhZ2UgbG9ja3M6Cj4gPiAtICogcGFnZV9sb2NrKCkgaXMgdXNlZCBmb3Ig
dHdvIHB1cnBvc2VzOiBwdGUgc2VyaWFsaXphdGlvbiwgYW5kIG1lbW9yeSBzaGFyaW5nLgo+ID4g
KyAqIHBhZ2VfbG9jaygpIGlzIHVzZWQgZm9yIHB0ZSBzZXJpYWxpemF0aW9uLgo+ID4gICAqCj4g
PiAgICogQWxsIHVzZXJzIG9mIHBhZ2UgbG9jayBmb3IgcHRlIHNlcmlhbGl6YXRpb24gbGl2ZSBp
biBtbS5jLCB1c2UgaXQKPiA+ICAgKiB0byBsb2NrIGEgcGFnZSB0YWJsZSBwYWdlIGR1cmluZyBw
dGUgdXBkYXRlcywgZG8gbm90IHRha2Ugb3RoZXIgbG9ja3Mgd2l0aGluCj4gPiAgICogdGhlIGNy
aXRpY2FsIHNlY3Rpb24gZGVsaW1pdGVkIGJ5IHBhZ2VfbG9jay91bmxvY2ssIGFuZCBwZXJmb3Jt
IG5vCj4gPiAgICogbmVzdGluZy4KPiA+ICAgKgo+ID4gLSAqIEFsbCB1c2VycyBvZiBwYWdlIGxv
Y2sgZm9yIG1lbW9yeSBzaGFyaW5nIGxpdmUgaW4gbW0vbWVtX3NoYXJpbmcuYy4gUGFnZV9sb2Nr
Cj4gPiAtICogaXMgdXNlZCBpbiBtZW1vcnkgc2hhcmluZyB0byBwcm90ZWN0IGFkZGl0aW9uIChz
aGFyZSkgYW5kIHJlbW92YWwgKHVuc2hhcmUpCj4gPiAtICogb2YgKGdmbixkb21haW4pIHR1cHBs
ZXMgdG8gYSBsaXN0IG9mIGdmbidzIHRoYXQgdGhlIHNoYXJlZCBwYWdlIGlzIGN1cnJlbnRseQo+
ID4gLSAqIGJhY2tpbmcuIE5lc3RpbmcgbWF5IGhhcHBlbiB3aGVuIHNoYXJpbmcgKGFuZCBsb2Nr
aW5nKSB0d28gcGFnZXMgLS0gZGVhZGxvY2sKPiA+IC0gKiBpcyBhdm9pZGVkIGJ5IGxvY2tpbmcg
cGFnZXMgaW4gaW5jcmVhc2luZyBvcmRlci4KPiA+IC0gKiBBbGwgbWVtb3J5IHNoYXJpbmcgY29k
ZSBwYXRocyB0YWtlIHRoZSBwMm0gbG9jayBvZiB0aGUgYWZmZWN0ZWQgZ2ZuIGJlZm9yZQo+ID4g
LSAqIHRha2luZyB0aGUgbG9jayBmb3IgdGhlIHVuZGVybHlpbmcgcGFnZS4gV2UgZW5mb3JjZSBv
cmRlcmluZyBiZXR3ZWVuIHBhZ2VfbG9jawo+ID4gLSAqIGFuZCBwMm1fbG9jayB1c2luZyBhbiBt
bS1sb2Nrcy5oIGNvbnN0cnVjdC4KPiA+IC0gKgo+ID4gLSAqIFRoZXNlIHR3byB1c2VycyAocHRl
IHNlcmlhbGl6YXRpb24gYW5kIG1lbW9yeSBzaGFyaW5nKSBkbyBub3QgY29sbGlkZSwgc2luY2UK
PiA+IC0gKiBzaGFyaW5nIGlzIG9ubHkgc3VwcG9ydGVkIGZvciBodm0gZ3Vlc3RzLCB3aGljaCBk
byBub3QgcGVyZm9ybSBwdiBwdGUgdXBkYXRlcy4KPiA+ICsgKiBUaGUgdXNlIG9mIFBHVF9sb2Nr
ZWQgaW4gbWVtX3NoYXJpbmcgZG9lcyBub3QgY29sbGlkZSwgc2luY2UgbWVtX3NoYXJpbmcgaXMK
PiA+ICsgKiBvbmx5IHN1cHBvcnRlZCBmb3IgaHZtIGd1ZXN0cywgd2hpY2ggZG8gbm90IHBlcmZv
cm0gcHYgcHRlIHVwZGF0ZXMuCj4KPiBIbW0sIEkgdGhvdWdodCB3ZSBoYWQgYWdyZWVkIG9uIHlv
dSBhbHNvIGNvcnJlY3RpbmcgdGhlIHdvcmRpbmcgb2YKPiB0aGUgc2VudGVuY2UgeW91IG5vdyBy
ZXRhaW4gKGFzIHJlcXVlc3RlZCkuIEFzIHNhaWQgYmVmb3JlLCBhIEhWTQo+IChQVkggdG8gYmUg
cHJlY2lzZSkgRG9tMCBjYW4gdmVyeSB3ZWxsIHBlcmZvcm0gUFYgUFRFIHVwZGF0ZXMsIGp1c3QK
PiBub3Qgb24gaXRzZWxmLiBJIGhhZCBzdWdnZXN0ZWQgdGhlIHdvcmRpbmcgIndoaWNoIGRvIG5v
dCBoYXZlIFBWIFBURXMKPiB1cGRhdGVkIiAtIEknZCBiZSBmaW5lIGZvciB0aGlzIHRvIGJlIGZv
bGRlZCBpbiB3aGlsZSBjb21taXR0aW5nLCB0byBhdm9pZAo+IGFub3RoZXIgcm91bmQgdHJpcC4g
V2l0aCB0aGlzCgpUaGFua3MsIEkgZG8gc2VlbSB0byBoYXZlIG1pc3NlZCB0aGF0LgoKVGFtYXMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

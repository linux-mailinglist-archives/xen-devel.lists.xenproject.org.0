Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D00168A71
	for <lists+xen-devel@lfdr.de>; Sat, 22 Feb 2020 00:34:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5Hlp-0001hz-2a; Fri, 21 Feb 2020 23:31:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IZZ7=4J=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1j5Hln-0001hu-Hl
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 23:31:43 +0000
X-Inumbo-ID: 50e02160-5502-11ea-b0fd-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50e02160-5502-11ea-b0fd-bc764e2007e4;
 Fri, 21 Feb 2020 23:31:42 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id t23so3442443wmi.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 15:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UCOmlLdWdie01OpLIkTJe3lFeiwrF081tIOThqMvT2U=;
 b=KLw5c7ErykrPuIL4H64JHe8RDq8cWeSl/XFuTlFzGOzL4A9pBLJn6XkeGpNrIRi/lp
 fem/A5jYzRESkziSNXbpRaB6br3UDpxoUHuUOarFebLdYe8RzDSRzCdX0sJhqUgDWUWM
 bGwtPHomfbchZ7YVR9mp5PXlv0t1AOFWUcNzvULhC8+O69HlaQN8SsiA3DmxH0cYcM6k
 tGsjAeCROQPvLoLkZqO3SdcrNVEgslnAt6fgL7GvLvwGCBlmrXyFEm8+19pftsMCCinL
 qHid3M7SOuv3+h2zrs4s19wh42C6nzlfBDV4lak78zhRaNnHTB1+D8W+wwMklW4+K3Yt
 +n9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UCOmlLdWdie01OpLIkTJe3lFeiwrF081tIOThqMvT2U=;
 b=tjKklkoOV0Wh8//SsWs94F+AOj7omz8/HzGMuVo3mr/QbyaftVs6chSarHw2nFL7QE
 rS9UwBymMrDEyqnAEfHWaDsXpS0iYdEwvxz1cktDKCShR91tRDcar37OK03daNgCM4vd
 LTdDNqcsnBF/D46kah+B32KAt8mLF6SgDnJkQ3oywcjSNTuiCNgx9uLbEaNF8BNPGDMM
 LGy1ifsOpz2U49QVBGQK5jCcRI0KVRGFToQ2JBGitXhzJnUryiU7dK1SBfoMLjAW8p5/
 YTTQVyffYLsZ0ekmigb/co6B/jI6KbMLMLiN4aTv8485SWLZJTs0scNlHaZ+QssKlQSI
 ZWIw==
X-Gm-Message-State: APjAAAUsIMakHpBenwHM+sIq+agCCaM9AgEEwGWZG/L5u2Ha5T5tQ3lY
 oJzbdgZruhPHQU9bJjBnYV6ogdSNAdudrIEUFuk=
X-Google-Smtp-Source: APXvYqyv41sZxjaNBpWhb6fR6i0/JzEHqhmHpQKdqQ77s+XM7n60nFcDhd7F/bdHbMq86Hj1nKB4njfap7ozQFvFllM=
X-Received: by 2002:a05:600c:2503:: with SMTP id
 d3mr5961385wma.84.1582327901846; 
 Fri, 21 Feb 2020 15:31:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <08d22ed5ffef1d947b819606aafa6414a16bed0b.1582310142.git.tamas.lengyel@intel.com>
 <4b27cc09-8578-8fa1-2a7e-858d1767353a@xen.org>
 <CABfawhmN=93bF3-qz-b7r7U6xuq9=OOFFzJ88PcM4dwXJpkL=g@mail.gmail.com>
 <00efc255-1941-2dd2-2ddd-2f2e25af7d32@xen.org>
 <CABfawhn4N=nFVj1koV-0pt2m0=Fh6tX5Zswepen69-=zFm0dgA@mail.gmail.com>
 <CAJ=z9a05pqEhwfsXL=P9U6Ge_7JXtv=Qt0dpF4X3abViWDjzhg@mail.gmail.com>
In-Reply-To: <CAJ=z9a05pqEhwfsXL=P9U6Ge_7JXtv=Qt0dpF4X3abViWDjzhg@mail.gmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 21 Feb 2020 16:31:05 -0700
Message-ID: <CABfawhnuzBdhJpAfG7fJkQ9PFPfUdX_TQjwj54uOgrEz8j_STA@mail.gmail.com>
To: Julien Grall <julien.grall.oss@gmail.com>
Subject: Re: [Xen-devel] [PATCH v9 2/5] xen: add parent_domid field to
 createdomain domctl
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgNDoxOCBQTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bC5vc3NAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgMjEgRmViIDIwMjAgYXQgMjI6NTMs
IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXMuay5sZW5neWVsQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+
ID4gT24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMzozNCBQTSBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgVGFtYXMsCj4gPiA+Cj4gPiA+IE9uIDIxLzAy
LzIwMjAgMjE6MzUsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+ID4gPiBPbiBGcmksIEZlYiAy
MSwgMjAyMCBhdCAyOjAzIFBNIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOgo+
ID4gPiA+Pgo+ID4gPiA+PiBIaSBUYW1hcywKPiA+ID4gPj4KPiA+ID4gPj4gT24gMjEvMDIvMjAy
MCAxODo0OSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4gPiA+Pj4gV2hlbiBjcmVhdGluZyBh
IGRvbWFpbiB0aGF0IHdpbGwgYmUgdXNlZCBhcyBhIFZNIGZvcmsgc29tZSBpbmZvcm1hdGlvbiBp
cwo+ID4gPiA+Pj4gcmVxdWlyZWQgdG8gc2V0IHRoaW5ncyB1cCBwcm9wZXJseSwgbGlrZSB0aGUg
bWF4X3ZjcHVzIGNvdW50LiBJbnN0ZWFkIG9mIHRoZQo+ID4gPiA+Pj4gdG9vbHN0YWNrIGhhdmlu
ZyB0byBnYXRoZXIgdGhpcyBpbmZvcm1hdGlvbiBmb3IgZWFjaCBmb3JrIGluIGEgc2VwYXJhdGUK
PiA+ID4gPj4+IGh5cGVyY2FsbCB3ZSBjYW4ganVzdCBpbmNsdWRlIHRoZSBwYXJlbnQgZG9tYWlu
J3MgaWQgaW4gdGhlIGNyZWF0ZWRvbWFpbiBkb21jdGwKPiA+ID4gPj4+IHNvIHRoYXQgWGVuIGNh
biBjb3B5IHRoZSBzZXR0aW5nIHdpdGhvdXQgdGhlIGV4dHJhIHRvb2xzdGFjayBxdWVyaWVzLgo+
ID4gPiA+Pgo+ID4gPiA+PiBJdCBpcyBub3QgZW50aXJlbHkgY2xlYXIgd2h5IHlvdSBvbmx5IHdh
bnQgdG8gY29weSBtYXhfdmNwdXMuIEZyb20gbXkKPiA+ID4gPj4gdW5kZXJzdGFuZGluZywgIHdo
ZW4geW91IGFyZSBnb2luZyB0byBmb3JrIGEgZG9tYWluIHlvdSB3aWxsIHdhbnQgdGhlCj4gPiA+
ID4+IGRvbWFpbiB0byBiZSBuZWFybHkgaWRlbnRpY2FsLiBTbyBob3cgZG8geW91IGRlY2lkZSB3
aGF0IHRvIGNvcHk/Cj4gPiA+ID4KPiA+ID4gPiBBbGwgcGFyYW1ldGVycyBvZiB0aGUgcGFyZW50
IGRvbWFpbiBuZWVkIHRvIGJlIGNvcGllZCwgYnV0IGR1cmluZwo+ID4gPiA+IGNyZWF0ZWRvbWFp
biBkb21jdGwgb25seSBtYXhfdmNwdXMgaXMgcmVxdWlyZWQuIFRoZSByZXN0IGFyZSBjb3BpZWQK
PiA+ID4gPiBkdXJpbmcgWEVOTUVNX3NoYXJpbmdfb3BfZm9yay4KPiA+ID4KPiA+ID4gSSBkb24n
dCBiZWxpZXZlIG1heF92Y3B1cyBpcyB0aGUgb25seSBmaWVsZCByZXF1aXJlZCBoZXJlLiBNb3N0
IG9mIHRoZQo+ID4gPiBpbmZvcm1hdGlvbiBob2xkIGluIHRoZSBzdHJ1Y3R1cmUgYXJlIHJlcXVp
cmVkIGF0IGNyZWF0aW9uIHRpbWUgc28gdGhlCj4gPiA+IGRvbWFpbiBpcyBjb25maWd1cmVkIGNv
cnJlY3RseS4gRm9yIGluc3RhbmNlLCBvbiBBcm0sIHRoZSB2ZXJzaW9uIG9mCj4gPiA+IGludGVy
cnVwdCBjb250cm9sbGVyIGNhbiBvbmx5IGJlIGNvbmZpZ3VyZWQgYXQgY3JlYXRpb24gdGltZS4g
Rm9yIHg4NiwgSQo+ID4gPiBhbSBwcmV0dHkgc3VyZSB0aGUgZW11ZmxhZ3MgaGF2ZSB0byBiZSBj
b3JyZWN0IGF0IGNyZWF0aW9uIHRpbWUgYXMgd2VsbC4KPiA+ID4KPiA+ID4gU28gaXQgZmVlbHMg
d2VpcmQgdG8gbWUgdGhhdCB5b3Ugb25seSBuZWVkIHRvIGNvcHkgbWF4X3ZjcHVzIGhlcmUuCj4g
PiA+IEJlY2F1c2UgaWYgeW91IGFyZSBhYmxlIHRvIGZpbGwgdXAgdGhlIG90aGVyIGZpZWxkcyBv
ZiB0aGUgc3RydWN0dXJlLAo+ID4gPiB0aGVuIG1vc3QgbGlrZWx5IHlvdSBoYXZlIHRoZSBtYXhf
dmNwdXMgaW4gaGFuZCBhcyB3ZWxsLgo+ID4KPiA+IExvb2sgYXQgcGF0Y2ggNSBhbmQgc2VlIGhv
dyBsaWJ4bCBzdGF0aWNhbGx5IGRlZmluZSBtb3N0IG9mIHRoZXNlCj4gPiB2YWx1ZXMgYW5kIHdo
eSB3ZSBkb24ndCBuZWVkIHRvIGNvcHkgdGhlbS4KPgo+IEkgbG9va2VkIGF0IHBhdGNoIDUsIHRo
aXMgaXMgYW4gZXhhbXBsZSBvZiB0aGUgaW1wbGVtZW50YXRpb24uCj4gWW91IGxpbWl0IHlvdXJz
ZWxmIHF1aXRlIGEgYml0IGFuZCB0aGF0J3MgeW91ciBjaG9pY2UuIEJ1dCBJIGFtIGFmcmFpZAo+
IHRoaXMgZG9lcyBub3QgbWVhbiB0aGUgaW50ZXJmYWNlIHdpdGggdGhlIGh5cGVydmlzb3Igc2hv
dWxkIGRvIHRoZQo+IHNhbWUuCj4KPiBbLi4uXQo+Cj4gPiBKdWxpZW4sCj4gPiB5b3UgaGF2ZSB2
YWxpZCBwb2ludHMgYnV0IGF0IHRoaXMgdGltZSBJIHdvbid0IGJlIGFibGUgdG8gcmVmYWN0b3IK
PiA+IHRoaXMgc2VyaWVzIGFueSBtb3JlLiBUaGlzIHBhdGNoIHNlcmllcyB3YXMgZmlyc3QgcG9z
dGVkIGluIFNlcHRlbWJlciwKPiA+IGl0J3Mgbm93IGFsbW9zdCBNYXJjaC4gU28gYXQgdGhpcyBw
b2ludCBJJ20ganVzdCBnb2luZyB0byBzYXkgZHJvcAo+ID4gdGhpcyBwYXRjaCBhbmQgd2UnbGwg
bGl2ZSB3aXRoIHRoZSBsaW1pdGF0aW9uIHRoYXQgVk0gZm9ya2luZyBvbmx5Cj4gPiB3b3JrcyB3
aXRoIHNpbmdsZSB2Q1BVIGRvbWFpbnMgdW50aWwgYXQgc29tZSBsYXRlciB0aW1lIHNvbWVvbmUg
bmVlZHMKPiA+IGl0IHRvIHdvcmsgd2l0aCBndWVzdHMgdGhhdCBoYXZlIG1vcmUgdGhlbiAxIHZD
UFVzLgo+Cj4gVG8gYmUgaG9uZXN0LCBJIGRvbid0IGhhdmUgYSB2ZXN0ZWQgaW50ZXJlc3QgZm9y
IHRoZSBWTSBmb3JraW5nLiBTbwo+IHRoZSBsaW1pdGF0aW9uCj4gb2YgMSB2Q1BVIGlzIGZpbmUg
d2l0aCBtZS4KPgo+IEFueW9uZSB3aG8gd2lsbCB3YW50IHRvIHN1cHBvcnQgbW9yZSB0aGFuIDEg
dkNQVSB3aXRoIGZvcmtpbmcgd2lsbCBoYXZlIHRvCj4gY29tZSB1cCB3aXRoIGEgcHJvcGVyIGlu
dGVyZmFjZS4gSWYgeW91IGRvbid0IHdhbnQgdG8gaW52ZXN0IHRpbWUgb24gaXQgdGhhdCdzCj4g
ZmluZSwgdGhlIHJlc3Qgb2YgdGhlIGNvZGUgaXMgc3RpbGwgdXNlZnVsIHRvIGhhdmUuCgpUaGUg
dG9vbHN0YWNrIGNhbiBhbHdheXMganVzdCBkZWNpZGUgdG8gZG8gdGhlIGV4dHJhIGh5cGVyY2Fs
bCBxdWVyeQpmb3IgdGhlIG1heF92Y3B1cyBhbmQgbWFrZSB0aGluZ3Mgd29yayB0aGF0IHdheS4g
SW4gb3VyIHVzZWNhc2Ugd2UKaGF2ZSBzaW5nbGUgdkNQVSBkb21haW5zIHNvIGRvaW5nIHRoYXQg
ZXh0cmEgcXVlcnkgaXMgc29tZXRoaW5nIEkgd2FudAp0byBhdm9pZC4KClRhbWFzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

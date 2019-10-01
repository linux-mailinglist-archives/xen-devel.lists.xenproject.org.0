Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BCBC3484
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 14:41:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFHPx-0007bU-9l; Tue, 01 Oct 2019 12:38:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GEcb=X2=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iFHPv-0007bL-EB
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 12:38:11 +0000
X-Inumbo-ID: 537d4e50-e448-11e9-b588-bc764e2007e4
Received: from mail-pf1-x444.google.com (unknown [2607:f8b0:4864:20::444])
 by localhost (Halon) with ESMTPS
 id 537d4e50-e448-11e9-b588-bc764e2007e4;
 Tue, 01 Oct 2019 12:38:10 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id b128so7901893pfa.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2019 05:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oqX6MhKxLe/NeQGYNy3KsleTPFE2fAhEEpeYYMBNOjg=;
 b=fU/SbNUHYeP6ljFaPxe16i5ziCv/wsIc4OmcR9s7Mx+HJVfnllznEJidrpcukUQUmM
 yhpyFJ3E6g9hOFX581mnamPo8pYNp5TPwhBp4Q7QbuDZjpyy/E42+98BbzvBUSG7sNYo
 dcAnCFPjU3vTPj0LB0Yz4wGhsqb7UXro495HPT610RmVroCd7LOKqSTyKfbmzp8915PM
 WhnohjgolLoPdFud+fSraYIg66AYBvs9Pl1Ooj29wQSwoL8d2ixlEnZPiR9MjFkA83Vp
 XofTjy+iHHZT2V4FCHI/5E8vyQ0a4v/A4Y4HEFFY6OCEjVbpxnMYwGCVobnU41aI6pau
 6oug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oqX6MhKxLe/NeQGYNy3KsleTPFE2fAhEEpeYYMBNOjg=;
 b=gzVbVoLCT809PcM1Y++VhMgc6uhgfsJ5Qtnx/aP7DYqxO4QVkClscpcudeirFdaLfK
 GAU1n4Q0b7mwRCB8zYacNyOJatKsmPcmJdERjpEbFEoxi+9PuAerOiR19HPjG07nCUYC
 fPYyO/1SDknUnHUjMxzj4EE66QoRh2t89ZWNqO4LOhFerjSAW2VZqedmL4KHRpl0HEaq
 G2Kd1/Yd29YL4Anm4d3KPEuX2vsCEKMPwJEfm6eZZoBdS3fz1WqPZ9qWuvkOrw6W32yj
 oDbEaAqpPxQ6+Z/A3rMok7Cj/5QnpRxIrHIrdNnK93nivaZECE2UcNez3LoG/+kHXsa7
 Dj+w==
X-Gm-Message-State: APjAAAXjazc6H6JmO9N2MEczDehgSPwl8S990Fow33NFhgZrv41WzEiG
 uhc3Xrt3NWBtkkXaZuc/4GrQnrtX9N0Hq/Yftv4=
X-Google-Smtp-Source: APXvYqzIIVJBHZ/aQo7wHPH4F14pFF/ZwDSEnf5a2qfr+HRSmUzOk/cQPjw7VbaylFWh7sNX1BvxqVVQU90hSvV4AE0=
X-Received: by 2002:aa7:9a5b:: with SMTP id x27mr26782037pfj.232.1569933489520; 
 Tue, 01 Oct 2019 05:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191001091214.3287-1-paul.durrant@citrix.com>
 <23955.11471.728957.434428@mariner.uk.xensource.com>
 <045e191e8d1b4e9b9e131921dc865483@AMSPEX02CL03.citrite.net>
In-Reply-To: <045e191e8d1b4e9b9e131921dc865483@AMSPEX02CL03.citrite.net>
From: Paul Durrant <pdurrant@gmail.com>
Date: Tue, 1 Oct 2019 13:37:57 +0100
Message-ID: <CACCGGhC78VVFo3XGOH0Xn32TRWjbqz7_npHjtLgWtP1A=YJdgg@mail.gmail.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [Xen-devel] [PATCH-for-4.13] libxl: choose an appropriate
 default for passthrough...
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGluZz8gQ2FuIEkgZ2V0IGEgcmVzcG9uc2Ugb24gdGhpcyAody5yLnQuICdlbmFibGVkJyB2cy4g
J3Vua25vd24nKQpiZWZvcmUgZG9pbmcgYSB2Mj8gVGhpcyBpc3N1ZSBpcyBjdXJyZW50bHkgYmxv
Y2tpbmcgYSBwdXNoLCBJIGJlbGlldmUuCgpPbiBUdWUsIDEgT2N0IDIwMTkgYXQgMTE6NDgsIFBh
dWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gRnJvbTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNp
dHJpeC5jb20+Cj4gPiBTZW50OiAwMSBPY3RvYmVyIDIwMTkgMTE6MzkKPiA+IFRvOiBQYXVsIER1
cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+ID4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEFudGhvbnkgUGVyYXJkIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPjsKPiA+IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0gtZm9yLTQuMTNdIGxpYnhsOiBjaG9vc2UgYW4gYXBw
cm9wcmlhdGUgZGVmYXVsdCBmb3IgcGFzc3Rocm91Z2guLi4KPiA+Cj4gPiBQYXVsIER1cnJhbnQg
d3JpdGVzICgiW1BBVENILWZvci00LjEzXSBsaWJ4bDogY2hvb3NlIGFuIGFwcHJvcHJpYXRlIGRl
ZmF1bHQgZm9yIHBhc3N0aHJvdWdoLi4uIik6Cj4gPiA+IC4uLmlmIHRoZXJlIGlzIG5vIElPTU1V
IG9yIGl0IGlzIGdsb2JhbGx5IGRpc2FibGVkLgo+ID4gPgo+ID4gPiBXaXRob3V0IHRoaXMgcGF0
Y2gsIHRoZSBmb2xsb3dpbmcgYXNzZXJ0aW9uIG1heSBiZSBoaXQ6Cj4gPiA+Cj4gPiA+IHhsOiBs
aWJ4bF9jcmVhdGUuYzo1ODk6IGxpYnhsX19kb21haW5fbWFrZTogQXNzZXJ0aW9uIGBpbmZvLT5w
YXNzdGhyb3VnaCAhPQo+ID4gTElCWExfUEFTU1RIUk9VR0hfRU5BQkxFRCcgZmFpbGVkLgo+ID4g
Pgo+ID4gPiBUaGlzIGlzIGJlY2F1c2UgbGlieGxfX2RvbWFpbl9jcmVhdGVfaW5mb19zZXRkZWZh
dWx0KCkgY3VycmVudGx5IG9ubHkgc2V0cwo+ID4gPiBhbiBhcHByb3ByaWF0ZSB2YWx1ZSBmb3Ig
J3Bhc3N0aHJvdWdoJyBpbiB0aGUgY2FzZSB0aGF0ICdjYXBfaHZtX2RpcmVjdGlvJwo+ID4gPiBp
cyB0cnVlLCB3aGljaCBpcyBub3QgdGhlIGNhc2UgdW5sZXNzIGFuIElPTU1VIGlzIHByZXNlbnQg
YW5kIGVuYWJsZWQgaW4KPiA+ID4gdGhlIHN5c3RlbS4gVGhpcyBpcyBub3JtYWxseSBtYXNrZWQg
YnkgeGwgY2hvb3NpbmcgYSBkZWZhdWx0IHZhbHVlLCBidXQKPiA+ID4gdGhhdCB3aWxsIG5vdCBo
YXBwZW4gaWYgeGwgaXMgbm90IHVzZWQgKGUuZy4gd2hlbiB1c2luZyBsaWJ2aXJ0KSBvciB3aGVu
Cj4gPiA+IGEgc3R1YiBkb21haW4gaXMgYmVpbmcgY3JlYXRlZC4KPiA+Cj4gPiBJdCdzIHdlaXJk
IHRoYXQgYWZ0ZXIgdGhpcyBwYXRjaCAiZW5hYmxlZCIgY2FuIG1lYW4gRElTQUJMRUQuIFN1cmVs
eQo+ID4gaWYgeW91IHNheSBgcGFzc3Rocm91Z2g9ImVuYWJsZWQiJyBhbmQgdGhlIGhvc3QgaGFz
IG5vIFBUIHN1cHBvcnQgKGVnCj4gPiBpdCdzIGRpc2FibGVkIGluIHRoZSBiaW9zKSBpdCBzaG91
bGQgZmFpbCA/Cj4KPiBJbmRlZWQsIGFuZCB4bCB3aWxsIGRvIGV4YWN0bHkgdGhhdC4KPgo+ID4K
PiA+IE5vcm1hbGx5IGxpYnhsIGNvbmZpZyBvcHRpb25zIGhhdmUgYW4gInVua25vd24iIG9yICJk
ZWZhdWx0IiBvcHRpb24uCj4gPgo+ID4gQWxzbyBpdCBpcyBhbm9tYWxvdXMgdGhhdCB4bCBpcyBk
b2luZyB0aGUgY29tcGxleCB3b3JrIG9mIGNob29zaW5nIGEKPiA+IGRlZmF1bHQuICBJIHRoaW5r
IGFsbCB0aGUgY29tcGxleCBjb2RlCj4gPgo+ID4gKyAgICBzd2l0Y2ggKGNfaW5mby0+cGFzc3Ro
cm91Z2gpIHsKPiA+ICsgICAgY2FzZSBMSUJYTF9QQVNTVEhST1VHSF9FTkFCTEVEOgo+ID4KPiA+
IGluIHhsX3BhcnNlLmMgc2hvdWxkIGJlIGluIGxpYnhsLiAgKFNvbWUgb2YgaXQgaXMgdGhlcmUg
YWxyZWFkeS4pCj4gPgo+ID4gSSdtIHNvcnJ5IHRoYXQgSSB3YXNuJ3QgZGlkbid0IHJldmlldyBi
YWJkZTQ3YTNmZWQuLi4KPiA+Cj4KPiBTbywgd291bGQgeW91IGFkdm9jYXRlIGFuICd1bmtub3du
JyB2YWx1ZSB0aGVuPyBUaGF0J3MgZXNzZW50aWFsbHkganVzdCBhIHJlbmFtZSBvcGVyYXRpb24g
b24gJ2VuYWJsZWQnLgo+Cj4gVGhlIGNvZGUgaW4geGxfcGFyc2UuYyBpcyB0aGVyZSBmb3IgYSBy
ZWFzb24gdGhvdWdoOyB0aGUgYXBwcm9wcmlhdGUgYW1vdW50IG9mIGV4dHJhIG1lbW9yeSBmb3Ig
dGhlIElPTU1VIHBhZ2UgdGFibGVzIGhhcyB0byBiZSBkZXRlcm1pbmVkIHRoZXJlIGJlY2F1c2Ug
dGhlICdidWlsZCcgcGFydHMgb2YgbGlieGwgc2VlbSB0byBiZSBsYXJnZWx5IGZpcmV3YWxsZWQg
ZnJvbSB0aGUgJ2NyZWF0ZScgcGFydHMgYW5kIHRodXMgdGhlIHJlbGV2YW50IGluZm9ybWF0aW9u
IGlzIG5vdCBhdmFpbGFibGUgdG8gZGVjaWRlIHRoZSBhcHByb3ByaWF0ZSBvdmVyaGVhZC4KPgo+
ICAgUGF1bAo+Cj4gPiBJYW4uCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPiBYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs

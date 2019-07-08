Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A48A61B51
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 09:42:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkOF4-0006Fj-6h; Mon, 08 Jul 2019 07:39:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tA2P=VF=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hkOF1-0006Fe-PH
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 07:39:15 +0000
X-Inumbo-ID: 7b4c3bd9-a153-11e9-8980-bc764e045a96
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7b4c3bd9-a153-11e9-8980-bc764e045a96;
 Mon, 08 Jul 2019 07:39:13 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id i10so32926551iol.13
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2019 00:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7rpf/FwvkvJymJa9zDFuhBFHeMfygYH+sqSyp0NbR40=;
 b=DHk9/afcFstqgXFpcCdTqrSEfs1Thhtgl2qnsZG2smyOgFUdvwh4GgbLWduVB2LId/
 AcMZHCEgmrzbd7XgJlYISRtRLuWxPLh7iuX77Z8dOmPPkNbgfiWHKeTf4B5lL1OmbG0V
 Ik4CW6H2SUCYgsbsWSeUqOMXPmkQrv1d4Z52WoD49UxDUlQsxbe++TJV67yfpczUrpgv
 MJ+LUjjgrcOmj2pPHHU7BcuTJOD+gYGYU2168Q0jUEmJpZnrCOr0xfA6PeZ5LPqa7frN
 bQDP189Y36t178AwkYjdrEfiVZjUpsP+p70JWutYdpIVw7S0lxlY62UoedsAEH3omTFF
 bPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7rpf/FwvkvJymJa9zDFuhBFHeMfygYH+sqSyp0NbR40=;
 b=RGby+uK2up6j7Ia68phSH47//SFs3tugy8539fsypqnUe7BIYKSpkmc2MScgDryXiH
 ZIPSonHc+BaqXVxGKFvNUO+bFZ4KMz2XioEv063HAitVFy9HlhJW+va94oKfC5PteNcm
 HBr12tbpXNFlV8Rz0ODqkrEUDcTH5fQPX+CUquhJO1RDKoOOQbjpQ8O0FoyekJQHXUxy
 qlc4ezNGCWCdgGYpFqZ3ktXrMhQpKvYQTtCctA8fH1Zlhjz/yQ+36jHFHA7uHFeqJ/U7
 dg8Iz6t7CHUnyI/hF88HCDgEU/oBS6zMmP3LSjSOL6jeyzhGWMsjwhhqEDo0nEbDSy/I
 PNRw==
X-Gm-Message-State: APjAAAVmxo3i9HuOGX5S++j3C6HxRv3uPqNuJe0yDKzMCgnGsZyUhHzH
 JFmMycGkvAQMCFm6xb19Q7De5EzMbKWZt3+dpEg=
X-Google-Smtp-Source: APXvYqwu4jPqK9VpUC9A0OIa/WPmL20XUb1tIg6jydHxDvOHDATBdf/yEhAcxS2bCJxhZ4tB7XjS+auOdYp+1U7qgS4=
X-Received: by 2002:a6b:b206:: with SMTP id b6mr19016793iof.286.1562571553128; 
 Mon, 08 Jul 2019 00:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1562435004.git.will.abele@starlab.io>
 <41ff241e-aa17-6033-25b0-80da519cd444@arm.com>
 <c3dd311a-732a-68e8-5b3d-0aa7dd8773c7@arm.com>
 <20190706211048.uvilbrefroxroli3@starlab.io>
In-Reply-To: <20190706211048.uvilbrefroxroli3@starlab.io>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Mon, 8 Jul 2019 10:39:02 +0300
Message-ID: <CAOcoXZZKwavN2YEExk4hEEy=hy6gFykx0ZW4gJ9j8n5kCf=2Fw@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Will Abele <will.abele@starlab.io>, Julien Grall <Julien.Grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [Xen-devel] [PATCH 0/1] Dom0less guest device tree format
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, andrii.anisov@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQWxsLAoKUGxlYXNlIGJlIGF3YXJlIHRoYXQgSSBjYW4gY29uZmlybSB0aGUgaXNzdWUuCkN1
cnJlbnQgZG9tMGxlc3MgZG9tVSBjb2RlIG5lZWRzIHRvIGJlIGZpeGVkLgpUaGUgaXNzdWUgaGFz
IGJlZW4gcmVwcm9kdWNlZCB3aXRoIHNldmVyYWwga2VybmVsIGltYWdlcyA0LjE0Ljc1LgpMaW51
eCBrZXJuZWwgNC4xNSBpbWFnZSB3b3JrcyB3ZWxsIHdpdGhvdXQgdGhpcyBmaXguCktlcm5lbCBp
bWFnZXMgNC4xNC43NSBhbmQgNC4xNSB3b3JrcyBmaW5lIHdpdGggdGhpcyBmaXguCgpUaGFua3MK
Ck9uIFN1biwgSnVsIDcsIDIwMTkgYXQgMTI6MTIgQU0gV2lsbCBBYmVsZSA8d2lsbC5hYmVsZUBz
dGFybGFiLmlvPiB3cm90ZToKPgo+IFRoZSAwNy8wNi8yMDE5IDE4OjE5LCBKdWxpZW4gR3JhbGwg
d3JvdGU6Cj4gPgo+ID4KPiA+IE9uIDA2LzA3LzIwMTkgMTk6MTcsIEp1bGllbiBHcmFsbCB3cm90
ZToKPiA+ID4KPiA+ID4KPiA+ID4gT24gMDYvMDcvMjAxOSAxOTowMiwgV2lsbCBBYmVsZSB3cm90
ZToKPiA+ID4+IEZyb206IFdpbGwgQWJlbGUgPHdpbGwuYWJlbGVAc3RhcmxhYi5pbz4KPiA+ID4+
Cj4gPiA+PiBIaSwKPiA+ID4KPiA+ID4gSGksCj4gPiA+Cj4gPiA+PiBJJ3ZlIGJlZW4gdXNpbmcg
ZG9tMGxlc3MgWGVuIG9uIHRoZSBIaWtleSA5NjAgd2l0aCBhIDQuMTQgTGludXgKPiA+ID4+IEtl
cm5lbC4gSSBoYWQKPiA+ID4+IHRyb3VibGUgZ2V0dGluZyB0aGUgNC4xNCBMaW51eCBLZXJuZWwg
dG8gYm9vdCBhcyBhIGRvbTBsZXNzIGRvbVUKPiA+ID4+IGJlY2F1c2UgaXQgd2FzCj4gPiA+PiBt
aXNpbnRlcnByZXRpbmcgdGhlIGRldmljZSB0cmVlIHZlcnNpb24uIExpbnV4IDQuMTQgYW5kIGVh
cmxpZXIKPiA+ID4+IGludGVycHJldCBkZXZpY2UKPiA+ID4+IHRyZWVzIHdpdGggYSAiLyIgaW4g
dGhlIHJvb3Qgbm9kZSBhcyB2ZXJzaW9uIDE2LiBYZW4gcHJvZHVjZXMgYQo+ID4gPj4gdmVyc2lv
biAxNwo+ID4gPj4gZGV2aWNlIHRyZWUsIHNvIHRoZSByb290IG5vZGUgbmVlZHMgdG8gYmUgIiIg
dG8gd29yayB3aXRoIDQuMTQgYW5kCj4gPiA+PiBlYXJsaWVyIExpbnV4Cj4gPiA+PiBLZXJuZWxz
LiBMaW51eCA0LjE1IGFuZCBsYXRlciBhc3N1bWUgdGhhdCB0aGUgdmVyc2lvbiBpcyAxNywgc28g
dGhpcwo+ID4gPj4gcGF0Y2ggZG9lcwo+ID4gPj4gbm90IGhhdmUgYW55IGltcGFjdC4KPiA+ID4+
Cj4gPiA+PiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IG5lZWQgYW55IG1vcmUgaW5mb3JtYXRp
b24gb3IgaGF2ZQo+ID4gPj4gc3VnZ2VzdGlvbnMgZm9yCj4gPiA+PiBvdGhlciB3YXlzIHRvIGhh
bmRsZSB0aGlzLgo+ID4gPgo+ID4gPiBJIGRvbid0IHVuZGVyc3RhbmQgd2hlcmUgdGhlIHZlcnNp
b24gY29tZXMgZnJvbS4gSSBhbHNvIGRvbid0IHVuZGVyc3RhbmQKPiA+ID4gaG93IHlvdSBpbmZl
cnJlZCB0aGF0IFhlbiBpcyBjcmVhdGluZyBhIHZlcnNpb24gMTcgZGV2aWNlLXRyZWUuCj4gPiA+
Cj4gPiA+IERvIHlvdSBoYXZlIGxpbmsgdG8gdGhlIHBhcmFncmFwaCBpbiB0aGUgc3BlY2lmaWNh
dGlvbnM/Cj4gPgo+ID4gQWxzbywgcGxlYXNlIGV4cGFuZCB3aGF0IGlzIHRoZSBleGFjdCBlcnJv
ci4gU28gd2UgY2FuIHVuZGVyc3RhbmQKPiA+IHdoZXRoZXIgdGhpcyBpcyB0aGUgcmlnaHQgZml4
Lgo+ID4KPiA+IENoZWVycywKPiA+Cj4gPiAtLQo+ID4gSnVsaWVuIEdyYWxsCj4KPiAtLQo+Cj4g
SGkgSnVsaWVuLAo+Cj4gVGhhbmtzIGZvciB0aGUgcHJvbXB0IHJlc3BvbnNlLgo+Cj4gSSBzYWlk
IGluIG15IG1lc3NhZ2UgdGhhdCBMaW51eCB3YXMgaW50ZXJwcmV0aW5nIHRoZSBkZXZpY2UgdHJl
ZSBhcyB2ZXJzaW9uIDE2Lgo+IExvb2tpbmcgdGhyb3VnaCB0aGUgY29kZSBhZ2FpbiwgSSByZWFs
aXplIGl0IHdhcyBiZWluZyBpbnRlcnByZXRlZCBhcyBlYXJsaWVyCj4gdGhhbiAxNi4gQXMgbWVu
dGlvbmVkIGluIExpbnV4IGNvbW1pdCBhN2U0Y2ZiMGE3Y2E0NzczZTdkMGRkMWQ5YzAxOGFiMjdh
MTUzNjBlLAo+IExpbnV4IGhhZCBhbHJlYWR5IGJyb2tlbiBzdXBwb3J0IGZvciBGRFQgdmVyc2lv
bnMgZWFybGllciB0aGFuIDE2Lgo+IHBvcHVsYXRlX25vZGUoKSBpbiBkcml2ZXJzL29mL2ZkdC5j
IHdvdWxkIHN0b3AgcGFyc2luZyB0aGUgZmR0IGF0IHRoZSByb290IG5vZGUKPiBpZiBpdCB0aG91
Z2h0IHRoZSBmZHQgdmVyc2lvbiB3YXMgZWFybGllciB0aGFuIDE2Lgo+Cj4gWGVuIHNldHMgdGhl
IEZEVCB2ZXJzaW9uIHRvIDE3IGluIGZkdF9jcmVhdGUoKS4KPgo+IFRoZSBpc3N1ZSBJIHdhcyBo
YXZpbmcgd2FzIHRoYXQgTGludXggcGFuaWNrZWQgd2hpbGUgaW5pdGlhbGl6aW5nIGludGVycnVw
dHMKPiBiZWNhdXNlIGl0IGNvdWxkIG5vdCBmaW5kIGFuIGludGVycnVwdCBjb250cm9sbGVyLiBJ
dCBjb3VsZG4ndCBmaW5kIHRoZQo+IGludGVycnVwdCBjb250cm9sbGVyIGJlY2F1c2UgaXQgZGlk
bid0IHByb2Nlc3MgdGhhdCBwYXJ0IG9mIHRoZSBkZXZpY2UgdHJlZS4KPgo+IFRoYW5rcywKPiBX
aWxsCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

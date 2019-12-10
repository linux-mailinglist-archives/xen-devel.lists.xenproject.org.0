Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E54E111807F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 07:33:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieZ2M-00021B-IO; Tue, 10 Dec 2019 06:30:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DUzY=2A=gmail.com=sj38.park@srs-us1.protection.inumbo.net>)
 id 1ieZ2L-000216-9i
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 06:30:21 +0000
X-Inumbo-ID: 8969c7c8-1b16-11ea-88e7-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8969c7c8-1b16-11ea-88e7-bc764e2007e4;
 Tue, 10 Dec 2019 06:30:20 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 203so12682883lfa.12
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2019 22:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L6jPrprQadsFkjVs7M2+ie2lIeuZ6l3uv7h9nAdlHbw=;
 b=s+GxJASGfcqo4Y05xsFfbX4tcLxCj+iwnRJiBr/iHHhb4uRsZapDn7+vEYTR3vh+Jz
 3VxGVR7HU/AydAY8pCCPb4nMT4/Cwoe1pkQKODR9ItMVv7R4yOKU0gJItqdy4xlzAjUK
 iJuBl+dBsbo8s0UPvioaE3qlSErwLOAV0ykhSyCcK2pytQcJWXESDqVEvPwbRNrYphWD
 7f+uhTogTx/+uCG3RxUjCk8DdfpHTBbUG28dRBUKWHkmTljXNDWDNHSoHuZR2Tx9Lmhp
 R9vSjzJ/kVpZzDp+SnfbaKjfwp64xn8jeQRggrjO656ysnNZEgkhXgWdmj2CfRSZT2yq
 7R2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L6jPrprQadsFkjVs7M2+ie2lIeuZ6l3uv7h9nAdlHbw=;
 b=I3WrFdSweD9Rdb+iUvxYAB1lHRC3cDWKT31jPIcqoJHgkIySxRnaoUbim85c8xS3ki
 KLE/apykXmUXy80o9U43PfqyuoCs6hwFWnPCIUN0y4hPBIiGq7SFVSzP0/tMCcV6ZRcy
 29yRJU4CyLqO/XXYaTm88cQdCJPpccY9CeieWslMjWJFlAUIPwumqUgVVimu3gFij9Yy
 +LmI33/H7HrCG1qFY7SSsdErEw58GoAY/injhK+0jgLzwqsxQjQuvxsr0psWYMP3jBWB
 SuEeIeJ0i1ZvQ6JvPsmJ/Ozpl6d4JvchdR8Jqkvtiul4ATOXDj+rcaOwaos3KBhnXn9p
 Ctlw==
X-Gm-Message-State: APjAAAViRxHKPWxNkm2Mtlj4zMd6mFX3wCh1yXUjzRoSAcL1H3n6G80q
 IDBMnjHxyz0rcRlxHPGfa1bxpQ7WjLuDajDFQdI=
X-Google-Smtp-Source: APXvYqzS4WEz7RM60ft05c4AwdsFFB4/bWr5skRRN3mawetMj/dt4wZA9rJUWPkadh3DzPQSOuvRKTAMgCaPCGRCvfk=
X-Received: by 2002:ac2:531b:: with SMTP id c27mr17324318lfh.91.1575959419127; 
 Mon, 09 Dec 2019 22:30:19 -0800 (PST)
MIME-Version: 1.0
References: <20191209194305.20828-1-sjpark@amazon.com>
 <20191209194305.20828-2-sjpark@amazon.com>
 <4be85067-a1cc-224e-6629-06034df2b7e6@suse.com>
In-Reply-To: <4be85067-a1cc-224e-6629-06034df2b7e6@suse.com>
From: SeongJae Park <sj38.park@gmail.com>
Date: Tue, 10 Dec 2019 07:29:52 +0100
Message-ID: <CAEjAshrUp-uZL4fWTMEWQ3T=kB=vsUCKOdUE2rRFDMNjuCfdQw@mail.gmail.com>
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [Xen-devel] [PATCH v4 1/2] xenbus/backend: Add memory pressure
 handler callback
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
Cc: Jens Axboe <axboe@kernel.dk>, SeongJae Park <sjpark@amazon.com>,
 konrad.wilk@oracle.com, pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTAsIDIwMTkgYXQgNzoyMyBBTSBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMDkuMTIuMTkgMjA6NDMsIFNlb25nSmFlIFBhcmsgd3JvdGU6
Cj4gPiBGcm9tOiBTZW9uZ0phZSBQYXJrIDxzanBhcmtAYW1hem9uLmRlPgo+ID4KPiA+IEdyYW50
aW5nIHBhZ2VzIGNvbnN1bWVzIGJhY2tlbmQgc3lzdGVtIG1lbW9yeS4gIEluIHN5c3RlbXMgY29u
ZmlndXJlZAo+ID4gd2l0aCBpbnN1ZmZpY2llbnQgc3BhcmUgbWVtb3J5IGZvciB0aG9zZSBwYWdl
cywgaXQgY2FuIGNhdXNlIGEgbWVtb3J5Cj4gPiBwcmVzc3VyZSBzaXR1YXRpb24uICBIb3dldmVy
LCBmaW5kaW5nIHRoZSBvcHRpbWFsIGFtb3VudCBvZiB0aGUgc3BhcmUKPiA+IG1lbW9yeSBpcyBj
aGFsbGVuZ2luZyBmb3IgbGFyZ2Ugc3lzdGVtcyBoYXZpbmcgZHluYW1pYyByZXNvdXJjZQo+ID4g
dXRpbGl6YXRpb24gcGF0dGVybnMuICBBbHNvLCBzdWNoIGEgc3RhdGljIGNvbmZpZ3VyYXRpb24g
bWlnaHQgbGFja3MgYQo+ID4gZmxleGliaWxpdHkuCj4gPgo+ID4gVG8gbWl0aWdhdGUgc3VjaCBw
cm9ibGVtcywgdGhpcyBjb21taXQgYWRkcyBhIG1lbW9yeSByZWNsYWltIGNhbGxiYWNrIHRvCj4g
PiAneGVuYnVzX2RyaXZlcicuICBVc2luZyB0aGlzIGZhY2lsaXR5LCAneGVuYnVzJyB3b3VsZCBi
ZSBhYmxlIHRvIG1vbml0b3IKPiA+IGEgbWVtb3J5IHByZXNzdXJlIGFuZCByZXF1ZXN0IHNwZWNp
ZmljIGRvbWFpbnMgb2Ygc3BlY2lmaWMgYmFja2VuZAo+ID4gZHJpdmVycyB3aGljaCBjYXVzaW5n
IHRoZSBnaXZlbiBwcmVzc3VyZSB0byB2b2x1bnRhcmlseSByZWxlYXNlIGl0cwo+ID4gbWVtb3J5
Lgo+ID4KPiA+IFRoYXQgc2FpZCwgdGhpcyBjb21taXQgc2ltcGx5IHJlcXVlc3RzIGV2ZXJ5IGNh
bGxiYWNrIHJlZ2lzdGVyZWQgZHJpdmVyCj4gPiB0byByZWxlYXNlIGl0cyBtZW1vcnkgZm9yIGV2
ZXJ5IGRvbWFpbiwgcmF0aGVyIHRoYW4gaXNzdWVpbmcgdGhlCj4gPiByZXF1ZXN0cyB0byB0aGUg
ZHJpdmVycyBhbmQgZG9tYWluIGluIGNoYXJnZS4gIFN1Y2ggdGhpbmdzIHdvdWxkIGJlIGEKPiA+
IGZ1dHVyZSB3b3JrLiAgQWxzbywgdGhpcyBjb21taXQgZm9jdXNlcyBvbiBtZW1vcnkgb25seS4g
IEhvd2V2ZXIsIGl0Cj4gPiB3b3VsZCBiZSBhYmx0IHRvIGJlIGV4dGVuZGVkIGZvciBnZW5lcmFs
IHJlc291cmNlcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTZW9uZ0phZSBQYXJrIDxzanBhcmtA
YW1hem9uLmRlPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVf
YmFja2VuZC5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAgaW5jbHVkZS94ZW4v
eGVuYnVzLmggICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gPiAgIDIgZmlsZXMgY2hhbmdl
ZCwgMzIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW5i
dXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJv
YmVfYmFja2VuZC5jCj4gPiBpbmRleCBiMGJlZDRmYWY0NGMuLmNkNWZkMWNkOGRlMyAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfYmFja2VuZC5jCj4gPiAr
KysgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYwo+ID4gQEAgLTI0
OCw2ICsyNDgsMzQgQEAgc3RhdGljIGludCBiYWNrZW5kX3Byb2JlX2FuZF93YXRjaChzdHJ1Y3Qg
bm90aWZpZXJfYmxvY2sgKm5vdGlmaWVyLAo+ID4gICAgICAgcmV0dXJuIE5PVElGWV9ET05FOwo+
ID4gICB9Cj4gPgo+ID4gK3N0YXRpYyBpbnQgeGVuYnVzX2JhY2tlbmRfcmVjbGFpbShzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IHhlbmJ1c19k
cml2ZXIgKmRydjsKPiA+ICsgICAgIGlmICghZGV2LT5kcml2ZXIpCj4gPiArICAgICAgICAgICAg
IHJldHVybiAtRU5PRU5UOwo+ID4gKyAgICAgZHJ2ID0gdG9feGVuYnVzX2RyaXZlcihkZXYtPmRy
aXZlcik7Cj4gPiArICAgICBpZiAoZHJ2ICYmIGRydi0+cmVjbGFpbSkKPiA+ICsgICAgICAgICAg
ICAgZHJ2LT5yZWNsYWltKHRvX3hlbmJ1c19kZXZpY2UoZGV2KSwgRE9NSURfSU5WQUxJRCk7Cj4K
PiBPaCwgc29ycnkgZm9yIGZpcnN0IHJlcXVlc3RpbmcgeW91IHRvIGFkZCB0aGUgZG9taWQgYXMg
YSBwYXJhbWV0ZXIsCj4gYnV0IG5vdyBJIHJlYWxpemUgdGhpcyBjb3VsZCBiZSBoYW5kbGVkIGlu
IHRoZSB4ZW5idXMgZHJpdmVyLCBhcwo+IHN0cnVjdCB4ZW5idXNfZGV2aWNlIGFscmVhZHkgY29u
dGFpbnMgdGhlIG90aGVyZW5kX2lkLgo+Cj4gV291bGQgeW91IG1pbmQgZHJvcHBpbmcgdGhlIHBh
cmFtZXRlciBhZ2FpbiwgcGxlYXNlPwoKT2gsIEkgYWxzbyBtaXNzZWQgaXQhICBXaWxsIGRvIQoK
ClRoYW5rcywKU2VvbmdKYWUgUGFyawoKPgo+Cj4gSnVlcmdlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

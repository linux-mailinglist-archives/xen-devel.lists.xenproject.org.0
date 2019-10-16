Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F8ED9403
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 16:37:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKkOH-0004c3-4V; Wed, 16 Oct 2019 14:35:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kVf2=YJ=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1iKkOF-0004bx-Ls
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 14:35:03 +0000
X-Inumbo-ID: 236646fa-f022-11e9-bbab-bc764e2007e4
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 236646fa-f022-11e9-bbab-bc764e2007e4;
 Wed, 16 Oct 2019 14:35:02 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id z19so54194391ior.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2019 07:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZxctzKnTf7w+5C9FA5tSTA0x6ZYemLWLCHAPO5SlEI0=;
 b=lnmroHqpayv459c0pGksJhEfoOItojRgiPUI57bjemQdrDHnbCjIzoIMrCVR5ja6ya
 p9jVuQkPA7XLY5+HP7SAlCkwtgnAYWVqtVR7BEzQHoFUJUb0zc2soyjpPDayD8yhGvAW
 CUpSmESvaDaIoqUUL8Dit5PKbahqgivMXMP+IQ2iPP6mxHIZi5+9uoib5wYxMTOcpoRR
 k1JGjDUcu0zEzkv5vJ7hVHuOIMbtsnNTxmseAImlPl8WbTZjtcMtyoYczqGufFj4lCmt
 oXb/zTZthAexNusMwku9rC/k9rgGrZwyMk8jn9LzEYuWc1RKNn0AqrwUJ5QoylUvEvLP
 bx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZxctzKnTf7w+5C9FA5tSTA0x6ZYemLWLCHAPO5SlEI0=;
 b=h7TXFjNsJs/zBijiEP3PZOfju2QB4r6oVZfRDBzpJcRWYv+KT6/O7/F0E3C34uQSAB
 dMgyCGHx/dfisYR+1rYAyY1rfTDp6tLQ79acM4ovORgxhZSPBribEl9pQbpu+tuQSCNI
 CDZxsbaSdJUleIqlF0udHN8vD8B84Srf0VPk0HNce6RZMyLls9Pd1CP2tHxEJC7OP0mu
 QB8h6CCOKtLRv8MlYfmKJVtOluSAVe0+rv45GdGivmcdz3o5qsw/+ojSK3V1CWec9hyJ
 hqBD0BZJ/fAqVzPbxeizCEWQO9gmSmZr2jS0BIRMTKiToHJI2U4thqcXfpsq3LxcjXgD
 z/ow==
X-Gm-Message-State: APjAAAW7AN4xkgPQ8wP1DLF2KoOg3c2AH/4ph38aSh2VJp7u4JnKsd5W
 LQ1HVCIXrIvRI2NTD7n2dOqT4mn2gGm6Tbaot7Q=
X-Google-Smtp-Source: APXvYqzw8kZU88PFJEOUws6ztKFs2CasKRCBZszOP4MtbuzYVmMLi9l3YZxVvje6UZlTGTYR6iR//HVzyV7Wsok4t4c=
X-Received: by 2002:a5e:c20c:: with SMTP id v12mr4223157iop.251.1571236502038; 
 Wed, 16 Oct 2019 07:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191010141231.25363-1-al1img@gmail.com>
 <23968.40555.917945.129929@mariner.uk.xensource.com>
 <8413c89d-3495-6407-f1a9-6eb9aff24e47@arm.com>
 <alpine.DEB.2.21.1910111017050.6326@sstabellini-ThinkPad-T480s>
 <CACvf2oWENPf27aqQdve6StQOBv_TitKF_HSxhqFTcfJtmkL6eg@mail.gmail.com>
 <950c69d8-8f0c-b3f7-11da-9accef793c37@arm.com>
In-Reply-To: <950c69d8-8f0c-b3f7-11da-9accef793c37@arm.com>
From: Oleksandr Grytsov <al1img@gmail.com>
Date: Wed, 16 Oct 2019 17:34:50 +0300
Message-ID: <CACvf2oVCL_FMkHS82p=hKhRq4xUPyLT_qhDd3dTicTWU-yWPGw@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [XEN PATCH v1] libxl: Add DTB compatible list to
 config file
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
Cc: Iurii Konovalenko <iurii.konovalenko@globallogic.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "wl@xen.org" <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgNToxMiBQTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPiB3cm90ZToKPgo+IEhpIE9sZWtzYW5kciwKPgo+IE9uIDE2LzEwLzIwMTkgMTU6
MDQsIE9sZWtzYW5kciBHcnl0c292IHdyb3RlOgo+ID4gT24gRnJpLCBPY3QgMTEsIDIwMTkgYXQg
ODoyMSBQTSBTdGVmYW5vIFN0YWJlbGxpbmkKPiA+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3
cm90ZToKPiA+Pgo+ID4+IE9uIEZyaSwgMTEgT2N0IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToK
PiA+Pj4gSGksCj4gPj4+Cj4gPj4+IE9uIDExLzEwLzIwMTkgMTY6MjMsIElhbiBKYWNrc29uIHdy
b3RlOgo+ID4+Pj4gT2xla3NhbmRyIEdyeXRzb3Ygd3JpdGVzICgiW1BBVENIIHYxXSBsaWJ4bDog
QWRkIERUQiBjb21wYXRpYmxlIGxpc3QgdG8KPiA+Pj4+IGNvbmZpZyBmaWxlIik6Cj4gPj4+Pj4g
RnJvbTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVwYW0uY29tPgo+ID4+
Pj4+Cj4gPj4+Pj4gU29tZSBwbGF0Zm9ybXMgbmVlZCBtb3JlIGNvbXBhdGlibGUgcHJvcGVydHkg
dmFsdWVzIGluIGRldmljZQo+ID4+Pj4+IHRyZWUgcm9vdCBub2RlIGluIGFkZGl0aW9uIHRvICJ4
ZW4seGVudm0tJWQuJWQiIGFuZCAieGVuLHhlbnZtIgo+ID4+Pj4+IHZhbHVlcyB0aGF0IGFyZSBn
aXZlbiBieSBYZW4gYnkgZGVmYXVsdC4KPiA+Pj4KPiA+Pj4gSSBhbSBwcmV0dHkgc3VyZSBJIGhh
dmUgc2VlbiB0aGlzIHBhdGNoIGEgZmV3IHllYXJzIGFnbywgYnV0IEkgY2FuJ3QgZmluZCBpdAo+
ID4+PiBpbiBteSBpbmJveC4gV2hhdCBpcyB0aGUgZXhhY3QgcHJvYmxlbSBoZXJlPwo+ID4+Pgo+
ID4+Pj4+IFNwZWNpZnkgaW4gZG9tYWluIGNvbmZpZ3VyYXRpb24gZmlsZSB3aGljaCB2YWx1ZXMg
c2hvdWxkIGJlIGFkZGVkCj4gPj4+Pj4gYnkgcHJvdmlkaW5nICJkdGJfY29tcGF0aWJsZSIgbGlz
dCBvZiBzdHJpbmdzIHNlcGFyYXRlZCBieSBjb21hcy4KPiA+Pj4+Cj4gPj4+PiBIaSwgdGhhbmtz
Lgo+ID4+Pj4KPiA+Pj4+IEkgZG9uJ3QgaGF2ZSBhbiBvcGluaW9uIGFib3V0IHRoZSBwcmluY2lw
bGUgb2YgdGhpcyBhbmQgd291bGQgbGlrZSB0bwo+ID4+Pj4gaGVhciBmcm9tIEFSTSBmb2xrcyBh
Ym91dCB0aGF0Lgo+ID4+Pj4KPiA+Pj4+IEFsc28sIFN0ZWZhbm8sIEp1bGllbjogc2hvdWxkIHdl
IGJlIGFza2luZyBmb3IgYSBmcmVlemUgZXhjZXB0aW9uIGZvcgo+ID4+Pj4gdGhpcyBmb3IgNC4x
MyA/Cj4gPj4+Cj4gPj4+IEkgZG9uJ3QgaGF2ZSBlbm91Z2ggY29udGV4dCB0byB1bmRlcnN0YW5k
IHRoZSBleGFjdCBpc3N1ZSBoZSBpcyB0cnlpbmcgdG8KPiA+Pj4gc29sdmUuCj4gPj4KPiA+PiBT
YW1lIGhlcmUuIElzIHRoaXMgcGF0Y2ggbmVlZGVkIGJlY2F1c2Ugb24gc29tZSBwbGF0Zm9ybSB0
aGUgT1MgY2hlY2tzCj4gPj4gZm9yIHRoZSBwbGF0Zm9ybSAibW9kZWwiIChhbHNvIGtub3duIGFz
ICJtYWNoaW5lIG5hbWUiKSBvbiBkZXZpY2UgdHJlZQo+ID4+IGJlZm9yZSBjb250aW51aW5nIG9y
IHRvIHRyaWdnZXIgYSBkaWZmZXJlbmNlIGJlaGF2aW9yPwo+ID4KPiA+IFllcywgZXhhY3RseS4K
PiA+Cj4gPiBJIHdpbGwgcmVkbyB0aGUgcGF0Y2ggd2l0aCBJYW4ncyBjb21tZW50cyBpZiBpdCBp
cyBvayBpbiBnZW5lcmFsLgo+Cj4gQnkgc3BlY2lmeWluZyBhIGRpZmZlcmVudCBjb21wYXRpYmxl
IChsZXQgc2F5ICJyZW5lc2FzLHI4YTc3NGExIiksIHRoZW4geW91Cj4gY2xhaW0gdGhhdCB5b3Vy
IHZpcnR1YWwgbWFjaGluZSBpcyBleGFjdGx5IHRoZSBzYW1lIGFzIHRoYXQgYm9hcmQuCj4KPiBU
aGlzIG1lYW5zLCB0aGUgT1MgaXMgZnJlZSB0byBhc3N1bWUgdGhhdCB0aGUgbWVtb3J5IGxheW91
dCBhbmQgYWxsIHRoZSBkZXZpY2VzCj4gYXJlIGV4YWN0bHkgdGhlIHNhbWUuIFRoaXMgaXMgZGVm
aW5pdGVseSBub3QgdHJ1ZSBhcyB0aGUgdmlydHVhbCBtYWNoaW5lIHdlCj4gZXhwb3NlIGlzIHNw
ZWNpZmljIHRvIFhlbi4KPgo+IFNvIEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyB0aGUgY29ycmVjdCBh
cHByb2FjaCBoZXJlLiBDYW4geW91IHByb3ZpZGUgYSByZWFsLWxpZmUKPiBleGFtcGxlIG9uIHdo
eSB5b3UgbmVlZCB0aGlzPwo+Cj4gQ2hlZXJzLAo+Cj4gLS0KPiBKdWxpZW4gR3JhbGwKClRoaXMg
aXMgcmVxdWlyZWQgZm9yIEhXIGRvbWFpbnMuIFNvbWUgZHJpdmVycyBvciBpbml0aWFsaXphdGlv
biByb3V0aW5lcyBjaGVjawpjb21wYXRpYmxlLiBCZWxvdyBpcyBleGFtcGxlIGZyb20gbGludXgg
a2VybmVsIHNvdXJjZXM6CgpsaW51eC9zb3VuZC9wcGMvYXdhY3MuYzo3NDE6ICAgIGlmIChvZl9t
YWNoaW5lX2lzX2NvbXBhdGlibGUoIlBvd2VyQm9vazMsMSIpCmxpbnV4L3NvdW5kL3BwYy9hd2Fj
cy5jOjc0MjogICAgICAgIHx8Cm9mX21hY2hpbmVfaXNfY29tcGF0aWJsZSgiUG93ZXJCb29rMywy
IikpIHsKbGludXgvc291bmQvcHBjL2F3YWNzLmM6NzcwOiNkZWZpbmUgSVNfUE03NTAwCihvZl9t
YWNoaW5lX2lzX2NvbXBhdGlibGUoIkFBUEwsNzUwMCIpIFwKbGludXgvc291bmQvcHBjL2F3YWNz
LmM6NzcxOiAgICAgICAgfHwgb2ZfbWFjaGluZV9pc19jb21wYXRpYmxlKCJBQVBMLDg1MDAiKSBc
CmxpbnV4L3NvdW5kL3BwYy9hd2Fjcy5jOjc3MjogICAgICAgIHx8IG9mX21hY2hpbmVfaXNfY29t
cGF0aWJsZSgiQUFQTCw5NTAwIikpCi4uLgpsaW51eC9hcmNoL2FybS9tYWNoLW9tYXAyL3BkYXRh
LXF1aXJrcy5jOjcwMzogICAgICAgIGlmCihvZl9tYWNoaW5lX2lzX2NvbXBhdGlibGUocXVpcmtz
LT5jb21wYXRpYmxlKSkgewpsaW51eC9hcmNoL2FybS9tYWNoLW9tYXAyL3BkYXRhLXF1aXJrcy5j
OjcxNzogICAgaWYKKG9mX21hY2hpbmVfaXNfY29tcGF0aWJsZSgidGksb21hcDI0MjAiKSB8fAps
aW51eC9hcmNoL2FybS9tYWNoLW9tYXAyL3BkYXRhLXF1aXJrcy5jOjcxODoKb2ZfbWFjaGluZV9p
c19jb21wYXRpYmxlKCJ0aSxvbWFwMyIpKQpsaW51eC9hcmNoL2FybS9tYWNoLW9tYXAyL3BkYXRh
LXF1aXJrcy5jOjcyMTogICAgaWYKKG9mX21hY2hpbmVfaXNfY29tcGF0aWJsZSgidGksb21hcDMi
KSkKLi4uCgpBbHNvIHNlZSBbMV0KClsxXSBodHRwczovL3NvdXJjZS5jb2RlYXVyb3JhLm9yZy9l
eHRlcm5hbC9pbXgvaW14LXhlbi9jb21taXQvP2g9aW14XzQuMTQuOThfMi4wLjBfZ2EmaWQ9NmU1
OGQ0NzgyMDM2MzllNzFkYTNkYTY5ZmZlYWUzZmE1ZGMwMTk3YgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

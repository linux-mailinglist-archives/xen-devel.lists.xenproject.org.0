Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CC2BFA18
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 21:31:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDZQx-0007zx-SW; Thu, 26 Sep 2019 19:28:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MJWK=XV=kernel.org=robh@srs-us1.protection.inumbo.net>)
 id 1iDZQw-0007zs-Aj
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 19:28:10 +0000
X-Inumbo-ID: c5692d76-e093-11e9-bf31-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id c5692d76-e093-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 19:28:09 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6CA2F22466
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 19:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569526088;
 bh=Q3HgT1S8hRne5x66P6TKM4ZffmG6vbM0NvPQTtsTBi8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rIfKSl2BwfyIcUbpqBQgqxtP17/hvL3KUUO+cw6Z+SP/zd1Mihq6rV/CWdBoJtJIA
 mgKNRikoTV8ejS6zgX/5QL06BPuRRGdP0a/Z9hh0XByKU/Q02D+NUVnMm9IeTA8nuE
 yIF5a9HyQwO6X9+IZEymJpCtjCobxHnIXCFbjIiY=
Received: by mail-qt1-f180.google.com with SMTP id c21so4261237qtj.12
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 12:28:08 -0700 (PDT)
X-Gm-Message-State: APjAAAW/n4H58Tb4uJzWsE+Lv4Ov4qsRkSN2xQ9XwOU+7pdfiaI3xuOg
 Ryn3U8iXC0cTpTgDI9RS6/JDL+3uIso510YRfg==
X-Google-Smtp-Source: APXvYqz1Trwf6INqRqIjdxgP2sU3qQFOjF7D+XJ82dz5/HGpBEy1TyXgmXd7PISmFfl2z4F+lPm3NwAot2+vuKrkR98=
X-Received: by 2002:a0c:8a6d:: with SMTP id 42mr4369110qvu.138.1569526087509; 
 Thu, 26 Sep 2019 12:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190925215006.12056-1-robh@kernel.org>
 <e898c025-32a7-1d2c-3501-c99556f7cdd4@arm.com>
 <1ae7f42e-bf93-b335-b543-653fae5cf49f@epam.com>
 <28440326-ed76-b014-c1b8-02125c3214b9@arm.com>
 <f63f55eb-969e-6364-5781-a227d0c04e4c@epam.com>
In-Reply-To: <f63f55eb-969e-6364-5781-a227d0c04e4c@epam.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 26 Sep 2019 14:27:56 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKJP3itMOueZD7fGH2b6VNFrTuozW5tWyKN3uBg4gYMzA@mail.gmail.com>
Message-ID: <CAL_JsqKJP3itMOueZD7fGH2b6VNFrTuozW5tWyKN3uBg4gYMzA@mail.gmail.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [Xen-devel] [RFC PATCH] xen/gntdev: Stop abusing DT
 of_dma_configure API
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgNjoxNiBBTSBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbwo8
T2xla3NhbmRyX0FuZHJ1c2hjaGVua29AZXBhbS5jb20+IHdyb3RlOgo+Cj4gT24gOS8yNi8xOSAx
OjQ2IFBNLCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4gPiBPbiAyMDE5LTA5LTI2IDExOjE3IGFtLCBP
bGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPiA+Pgo+ID4+IE9uIDkvMjYvMTkgMTI6NDkg
UE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+Pj4gSGkgUm9iLAo+ID4+Pgo+ID4+Pgo+ID4+PiBP
biA5LzI1LzE5IDEwOjUwIFBNLCBSb2IgSGVycmluZyB3cm90ZToKPiA+Pj4+IEFzIHRoZSBjb21t
ZW50IHNheXMsIHRoaXMgaXNuJ3QgYSBEVCBiYXNlZCBkZXZpY2UuIG9mX2RtYV9jb25maWd1cmUo
KQo+ID4+Pj4gaXMgZ29pbmcgdG8gc3RvcCBhbGxvd2luZyBhIE5VTEwgRFQgbm9kZSwgc28gdGhp
cyBuZWVkcyB0byBiZSBmaXhlZC4KPiA+Pj4KPiA+Pj4gQW5kIHRoaXMgY2FuJ3Qgd29yayBvbiBh
cmNoIG5vdCBzZWxlY3RpbmcgQ09ORklHX09GIGFuZCBjYW4gc2VsZWN0Cj4gPj4+IENPTkZJR19Y
RU5fR1JBTlRfRE1BX0FMTE9DLgo+ID4+Pgo+ID4+PiBXZSBhcmUgbHVja3kgZW5vdWdoIG9uIHg4
NiBiZWNhdXNlLCBBRkFJQ1QsIGFyY2hfc2V0dXBfZG1hX29wcyBpcyBqdXN0Cj4gPj4+IGEgbm9w
Lgo+ID4+Pgo+ID4+IE5vIGx1Y2sgaXMgbmVlZGVkIGFzIFsxXSBkb2VzIG5vdGhpbmcgZm9yIHRo
b3NlIHBsYXRmb3JtcyBub3QgdXNpbmcKPiA+PiBDT05GSUdfT0YKPiA+Pj4+Cj4gPj4+PiBOb3Qg
c3VyZSBleGFjdGx5IHdoYXQgc2V0dXAgYmVzaWRlcyBhcmNoX3NldHVwX2RtYV9vcHMgaXMgbmVl
ZGVkLi4uCj4gPj4+Cj4gPj4+IFdlIHByb2JhYmx5IHdhbnQgdG8gdXBkYXRlIGRtYV9tYXNrLCBj
b2hlcmVudF9kbWFfbWFzayBhbmQKPiA+Pj4gZG1hX3Bmbl9vZmZzZXQuCj4gPj4+Cj4gPj4+IEFs
c28sIHdoaWxlIGxvb2sgYXQgb2ZfY29uZmlndXJlX2RtYSwgSSBub3RpY2VkIHRoYXQgd2UgY29u
c2lkZXIgdGhlCj4gPj4+IERNQSB3aWxsIG5vdCBiZSBjb2hlcmVudCBmb3IgdGhlIGdyYW50LXRh
YmxlLiBPbGVrc2FuZHIsIGRvIHlvdSBrbm93Cj4gPj4+IHdoeSB0aGV5IGNhbid0IGJlIGNvaGVy
ZW50Pwo+ID4+IFRoZSBtYWluIGFuZCB0aGUgb25seSByZWFzb24gdG8gdXNlIG9mX2NvbmZpZ3Vy
ZV9kbWEgaXMgdGhhdCBpZiB3ZSBkb24ndAo+ID4+IHRoZW4gd2UKPiA+PiBhcmUgYWJvdXQgdG8g
c3RheSB3aXRoIGRtYV9kdW1teV9vcHMgWzJdLiBJdCBlZmZlY3RpdmVseSBtZWFucyB0aGF0Cj4g
Pj4gb3BlcmF0aW9ucyBvbiBkbWEtYnVmcwo+ID4+IHdpbGwgZW5kIHVwIHJldHVybmluZyBlcnJv
cnMsIGxpa2UgWzNdLCBbNF0sIHRodXMgbm90IG1ha2luZyBpdCBwb3NzaWJsZQo+ID4+IGZvciBY
ZW4gUFYgRFJNIGFuZCBETUEKPiA+PiBwYXJ0IG9mIGdudGRldiBkcml2ZXIgdG8gZG8gd2hhdCB3
ZSBuZWVkIChkbWEtYnVmcyBpbiBvdXIgdXNlLWNhc2VzCj4gPj4gYWxsb3cgemVyby1jb3B5aW5n
Cj4gPj4gd2hpbGUgdXNpbmcgZ3JhcGhpY3MgYnVmZmVycyBhbmQgbWFueSBtb3JlKS4KPiA+Pgo+
ID4+IEkgZGlkbid0IGZpbmQgYW55IGJldHRlciB3YXkgb2YgYWNoaWV2aW5nIHRoYXQsIGJ1dCBv
Zl9jb25maWd1cmVfZG1hLi4uCj4gPj4gSWYgdGhlcmUgaXMgYW55IGJldHRlciBzb2x1dGlvbiB3
aGljaCB3aWxsIG5vdCBicmVhayB0aGUgZXhpc3RpbmcKPiA+PiBmdW5jdGlvbmFsaXR5IHRoZW4K
PiA+PiBJIHdpbGwgZGVmaW5pdGVseSBjaGFuZ2UgdGhlIGRyaXZlcnMgc28gd2UgZG8gbm90IGFi
dXNlIERUICkKPiA+PiBCZWZvcmUgdGhhdCwgcGxlYXNlIGtlZXAgaW4gbWluZCB0aGF0IG1lcmdp
bmcgdGhpcyBSRkMgd2lsbCBicmVhayBYZW4gUFYKPiA+PiBEUk0gKwo+ID4+IERNQSBidWYgc3Vw
cG9ydCBpbiBnbnRkZXYuLi4KPiA+PiBIb3BlIHdlIGNhbiB3b3JrIG91dCBzb21lIGFjY2VwdGFi
bGUgc29sdXRpb24sIHNvIGV2ZXJ5b25lIGlzIGhhcHB5Cj4gPgo+ID4gQXMgSSBtZW50aW9uZWQg
ZWxzZXdoZXJlLCB0aGUgcmVjZW50IGRtYS1kaXJlY3QgcmV3b3JrIG1lYW5zIHRoYXQKPiA+IGRt
YV9kdW1teV9vcHMgYXJlIG5vdyBvbmx5IGV4cGxpY2l0bHkgaW5zdGFsbGVkIGZvciB0aGUgQUNQ
SSBlcnJvcgo+ID4gY2FzZSwgc28gLSBtdWNoIGFzIEkgbWF5IGRpc2xpa2UgaXQgLSB5b3Ugc2hv
dWxkIGdldCByZWd1bGFyCj4gPiAoZGlyZWN0L1NXSU9UTEIpIG9wcyBieSBkZWZhdWx0IGFnYWlu
Lgo+IEFoLCBteSBiYWQsIEkgbWlzc2VkIHRoYXQgY2hhbmdlLiBTbywgaWYgbm8gZHVtbXkgZG1h
IG9wcyBhcmUgdG8gYmUgdXNlZAo+IHRoZW4KPiBJIGJlbGlldmUgd2UgY2FuIGFwcGx5IGJvdGgg
Y2hhbmdlcywgZS5nLiByZW1vdmUgb2ZfZG1hX2NvbmZpZ3VyZSBmcm9tCj4gYm90aCBvZiB0aGUg
ZHJpdmVycy4KCldoYXQgYWJvdXQgdGhlIGRtYSBtYXNrcz8gSSB0aGluayB0aGVyZSdzIGEgZGVm
YXVsdCBzZXR1cCwgYnV0IGl0IGlzCmNvbnNpZGVyZWQgYSBkcml2ZXIgYnVnIHRvIG5vdCBzZXQg
aXRzIG1hc2suIHhlbl9kcm1fZnJvbnQgc2V0cyB0aGUKY29oZXJlbnRfZG1hX21hc2sgKHdoeSBv
bmx5IDMyLWJpdHMgdGhvdWdoPyksIGJ1dCBub3QgdGhlIGRtYV9tYXNrLgpnbnRkZXYgaXMgZG9p
bmcgbmVpdGhlci4gSSBjb3VsZCBjb3B5IG91dCB3aGF0IG9mX2RtYV9jb25maWd1cmUgZG9lcwpi
dXQgYmV0dGVyIGZvciB0aGUgWGVuIGZvbGtzIHRvIGRlY2lkZSB3aGF0IGlzIG5lZWRlZCBvciBu
b3QgYW5kIHRlc3QKdGhlIGNoYW5nZS4gSSdtIG5vdCBzZXR1cCB0byB0ZXN0IGFueSBvZiB0aGlz
LgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

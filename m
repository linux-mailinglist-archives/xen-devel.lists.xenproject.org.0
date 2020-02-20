Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B436D166ACB
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 00:09:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4ut3-0005d7-6t; Thu, 20 Feb 2020 23:05:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ySgZ=4I=chromium.org=keescook@srs-us1.protection.inumbo.net>)
 id 1j4ut1-0005d2-QJ
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 23:05:39 +0000
X-Inumbo-ID: 82799c92-5435-11ea-bc8e-bc764e2007e4
Received: from mail-pf1-x442.google.com (unknown [2607:f8b0:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82799c92-5435-11ea-bc8e-bc764e2007e4;
 Thu, 20 Feb 2020 23:05:39 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id i6so155579pfc.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 15:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=c0kZSeFM/+814IXGYlA2mUh7BiAgeVF3A/1ZFnTcsZc=;
 b=oNgGUgcXPIIzpKoyYuQCg2iZgDGOqNq2Nuywq1XBACo+UkBmEshyJJcH4Rq/FYPAyV
 wmpxnA+i3Uj2NsKgZB7+n+cELRd+40ZezWMN3LL3O7GAvIzFSkQ7jxZrbtedJlR/P5zc
 qznGHo5Zt1TIpx7dru+9PdeL5yFGhMh8D4Ztc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=c0kZSeFM/+814IXGYlA2mUh7BiAgeVF3A/1ZFnTcsZc=;
 b=CMd0d3fEUL90cAKVMaaalfZi0DzcODEYLRI2shWRqlJqz/RpodkGIJvWma/ZZ4IJRg
 ltp42fhbct5ETHnuz2SSTb6Tq+pCL/hUVRSZKMwLcpTBlvQPuDiP5br4CQ5MbS5lAKcv
 K3ex8INwj2bd9uGbJwoDjx69CRsqWQkqfY5NnP2gWJ3hXOmVYVFVIymGcFONrBsPJUG7
 pfjsy0ddaxpyT2u1mDEWhHx+vFjg+pB030RvKs1ORZpX8utCZmnweXhmg6fhgMRZPZMF
 m3hbv1gWobAfXzkMcVxnUY/a9Gm+1ICS2XZedUxK/3HHbXl6RPbF3H7tbUrCQabFF1H2
 SlqA==
X-Gm-Message-State: APjAAAVPaSfcI0yQucU+kag33+NsyvHU3MvksfEM4vrM+sx1IMEzT/Di
 ZSzb9RNxvc9UO5fzhw2czNUehA==
X-Google-Smtp-Source: APXvYqxk+KNXpddw0Soriz9dh3hS8Ty+wHgvXPj77cXIpL/9OafL5vZZNFJjY0dqa57hetm/W/6LdA==
X-Received: by 2002:aa7:8f33:: with SMTP id y19mr32954425pfr.47.1582239938288; 
 Thu, 20 Feb 2020 15:05:38 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id g7sm660356pfq.33.2020.02.20.15.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 15:05:37 -0800 (PST)
Date: Thu, 20 Feb 2020 15:05:36 -0800
From: Kees Cook <keescook@chromium.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <202002201505.C3863B2D0@keescook>
References: <20200220062318.69299-1-keescook@chromium.org>
 <16a166da-c6e7-aa36-53a0-1b56197c8fc0@suse.com>
 <8a7f5bd7-2bb6-d187-cc6e-87ff01c440ce@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8a7f5bd7-2bb6-d187-cc6e-87ff01c440ce@oracle.com>
Subject: Re: [Xen-devel] [PATCH] x86/xen: Distribute switch variables for
 initialization
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Alexander Potapenko <glider@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMTE6MzM6NDFBTSAtMDUwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IAo+IAo+IE9uIDIvMjAvMjAgMTozNyBBTSwgSsO8cmdlbiBHcm/DnyB3cm90ZToK
PiA+IE9uIDIwLjAyLjIwIDA3OjIzLCBLZWVzIENvb2sgd3JvdGU6Cj4gPj4gVmFyaWFibGVzIGRl
Y2xhcmVkIGluIGEgc3dpdGNoIHN0YXRlbWVudCBiZWZvcmUgYW55IGNhc2Ugc3RhdGVtZW50cwo+
ID4+IGNhbm5vdCBiZSBhdXRvbWF0aWNhbGx5IGluaXRpYWxpemVkIHdpdGggY29tcGlsZXIgaW5z
dHJ1bWVudGF0aW9uIChhcwo+ID4+IHRoZXkgYXJlIG5vdCBwYXJ0IG9mIGFueSBleGVjdXRpb24g
ZmxvdykuIFdpdGggR0NDJ3MgcHJvcG9zZWQgYXV0b21hdGljCj4gPj4gc3RhY2sgdmFyaWFibGUg
aW5pdGlhbGl6YXRpb24gZmVhdHVyZSwgdGhpcyB0cmlnZ2VycyBhIHdhcm5pbmcgKGFuZCB0aGV5
Cj4gPj4gZG9uJ3QgZ2V0IGluaXRpYWxpemVkKS4gQ2xhbmcncyBhdXRvbWF0aWMgc3RhY2sgdmFy
aWFibGUgaW5pdGlhbGl6YXRpb24KPiA+PiAodmlhIENPTkZJR19JTklUX1NUQUNLX0FMTD15KSBk
b2Vzbid0IHRocm93IGEgd2FybmluZywgYnV0IGl0IGFsc28KPiA+PiBkb2Vzbid0IGluaXRpYWxp
emUgc3VjaCB2YXJpYWJsZXNbMV0uIE5vdGUgdGhhdCB0aGVzZSB3YXJuaW5ncyAob3IKPiA+PiBz
aWxlbnQKPiA+PiBza2lwcGluZykgaGFwcGVuIGJlZm9yZSB0aGUgZGVhZC1zdG9yZSBlbGltaW5h
dGlvbiBvcHRpbWl6YXRpb24gcGhhc2UsCj4gPj4gc28gZXZlbiB3aGVuIHRoZSBhdXRvbWF0aWMg
aW5pdGlhbGl6YXRpb25zIGFyZSBsYXRlciBlbGlkZWQgaW4gZmF2b3Igb2YKPiA+PiBkaXJlY3Qg
aW5pdGlhbGl6YXRpb25zLCB0aGUgd2FybmluZ3MgcmVtYWluLgo+ID4+Cj4gPj4gVG8gYXZvaWQg
dGhlc2UgcHJvYmxlbXMsIG1vdmUgc3VjaCB2YXJpYWJsZXMgaW50byB0aGUgImNhc2UiIHdoZXJl
Cj4gPj4gdGhleSdyZSB1c2VkIG9yIGxpZnQgdGhlbSB1cCBpbnRvIHRoZSBtYWluIGZ1bmN0aW9u
IGJvZHkuCj4gPj4KPiA+PiBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmM6IEluIGZ1bmN0aW9u
IOKAmHhlbl93cml0ZV9tc3Jfc2FmZeKAmToKPiA+PiBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2
LmM6OTA0OjEyOiB3YXJuaW5nOiBzdGF0ZW1lbnQgd2lsbCBuZXZlciBiZQo+ID4+IGV4ZWN1dGVk
IFstV3N3aXRjaC11bnJlYWNoYWJsZV0KPiA+PiDCoMKgIDkwNCB8wqDCoCB1bnNpZ25lZCB3aGlj
aDsKPiA+PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+fn4KPiA+Pgo+
ID4+IFsxXSBodHRwczovL2J1Z3MubGx2bS5vcmcvc2hvd19idWcuY2dpP2lkPTQ0OTE2Cj4gPj4K
PiA+PiBTaWduZWQtb2ZmLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KPiA+
Cj4gPiBSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+ID4KPiAK
PiBBcHBsaWVkIHRvIGZvci1saW51cy01LjYuCj4gCj4gKEkgcmVwbGFjZWQgJ3Vuc2lnbmVkJyB3
aXRoICd1bnNpZ25lZCBpbnQnIHRvIHF1aWV0IGRvd24gY2hlY2twYXRjaCApCgpPaCwgZ29vZCBj
YWxsLiBTb3JyeSBJIG1pc3NlZCB0aGF0IQoKVGhhbmtzIQoKLS0gCktlZXMgQ29vawoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

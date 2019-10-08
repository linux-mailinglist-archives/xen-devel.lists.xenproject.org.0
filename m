Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 722D4CF698
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 11:57:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHmCw-0001p8-Gs; Tue, 08 Oct 2019 09:55:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gFom=YB=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iHmCv-0001p3-5x
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 09:55:05 +0000
X-Inumbo-ID: b3746a78-e9b1-11e9-96dc-bc764e2007e4
Received: from mail-pg1-x544.google.com (unknown [2607:f8b0:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3746a78-e9b1-11e9-96dc-bc764e2007e4;
 Tue, 08 Oct 2019 09:55:04 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id y35so10006625pgl.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2019 02:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fizmm7znpKCE70r/1oq/2EF6OsMX9NSaWPol6MaMess=;
 b=XpFYh0qCfPcOXDPcz+5TvzLyqi/XZxVC8h2p6XRrGbc9CTgjI+D1nb6zhuSJzmu+A8
 hMr98Ti6eoNSruQmYWBYZr+6PoVCnJO8s/re5WcHsxOE8Y+2bPlmLvo+kiNeVuEHYgJo
 CzK8ZsT5LbSaqj/DByb+2fE/8I0TMyJ7H6JbMBoKCD/c6xqZfzT98WZItwslkHgRkY9z
 hgFCQCDqGPUZ1jXbk+wxbjhUIdrTc4Sc9lrDJLamzky4JJuxBwyqc/lCzwYmtKuHd9hu
 J0p/xe63nRptlnLmYKXBngPLX0S65V8nW4qIL7d8N/vTUeE4jQWP4xwqrkwDxHDWbXmo
 TBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fizmm7znpKCE70r/1oq/2EF6OsMX9NSaWPol6MaMess=;
 b=QTyuETZRRFAnWPcr+EZAsewCMM6nB4pt1AxIQv60HNUGZz1SWQWEiCEvjUOUptY1Dk
 Wtx3398GVXSIaYN9v+FysNX7rg8pSCAdNfldSQtQo8QdbyNs1ZJWgGVXcFkKeFZvw6O/
 T+e/hGTJaXBKOg1iXmdg4D+KJNTtnI2Tb0PqEIYLW5ctyCFq2TbjR53RMbUD88mxB1gy
 QtU3Adc3n6gtqTZNRyQ6Uiu3ASA0BKQigGRbeH1fvvoljzDn9CAcKXbzzdogGU2NHv5j
 u/89HR2U1RpDVuE6ooz+VRIVgXfHrU0dJCdA466L85bxbK/iSc5Ba8dMKi5kSRc9II1v
 16yw==
X-Gm-Message-State: APjAAAU8rLvyIcT0P2CznajEXzY03swNUP+nk26ozrHKrLc6SZMNK4Qk
 tcqXFhW1y3eS94+hChZkob21uEMmWwtkGVwLJiA=
X-Google-Smtp-Source: APXvYqxJ7CWtEUVdxRCyzpALHHNwClech+9B8KrhEB2Y8YTO5MGdFH1LOV22JEfecPjlw23Z+rWszRL2NSJaczhNhMs=
X-Received: by 2002:a17:90a:e001:: with SMTP id
 u1mr4829110pjy.102.1570528503358; 
 Tue, 08 Oct 2019 02:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <20191001151159.861-1-paul.durrant@citrix.com>
 <597ea92f-fa61-b47b-448a-1e6f4aebe994@suse.com>
In-Reply-To: <597ea92f-fa61-b47b-448a-1e6f4aebe994@suse.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Tue, 8 Oct 2019 10:54:52 +0100
Message-ID: <CACCGGhAff-k2rDQ5rEz=yPUXNO5rLjFVq1t6S=mwXXNVkE+_vQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH-for-4.13 v2] x86/mm: don't needlessly veto
 migration
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCA4IE9jdCAyMDE5IGF0IDA5OjI1LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+IHdyb3RlOgo+Cj4gT24gMDEuMTAuMjAxOSAxNzoxMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+
ID4gLS0tIGEveGVuL2FyY2gveDg2L21tL3BhZ2luZy5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYv
bW0vcGFnaW5nLmMKPiA+IEBAIC0yMDksMTUgKzIwOSwxNSBAQCBzdGF0aWMgaW50IHBhZ2luZ19m
cmVlX2xvZ19kaXJ0eV9iaXRtYXAoc3RydWN0IGRvbWFpbiAqZCwgaW50IHJjKQo+ID4gICAgICBy
ZXR1cm4gcmM7Cj4gPiAgfQo+ID4KPiA+IC1pbnQgcGFnaW5nX2xvZ19kaXJ0eV9lbmFibGUoc3Ry
dWN0IGRvbWFpbiAqZCwgYm9vbF90IGxvZ19nbG9iYWwpCj4gPiAraW50IHBhZ2luZ19sb2dfZGly
dHlfZW5hYmxlKHN0cnVjdCBkb21haW4gKmQsIGJvb2wgbG9nX2dsb2JhbCkKPiA+ICB7Cj4gPiAg
ICAgIGludCByZXQ7Cj4gPgo+ID4gLSAgICBpZiAoIGlzX2lvbW11X2VuYWJsZWQoZCkgJiYgbG9n
X2dsb2JhbCApCj4gPiArICAgIGlmICggaGFzX2FyY2hfcGRldnMoZCkgJiYgaW9tbXVfdXNlX2hh
cF9wdChkKSAmJiBsb2dfZ2xvYmFsICkKPgo+IFRvIHVuYmxvY2sgYSBwdXNoIHRvIG1hc3Rlciwg
dGhlIGlzX2lvbW11X2VuYWJsZWQoKSAtPiBoYXNfYXJjaF9wZGV2cygpCj4gdHJhbnNmb3JtYXRp
b24gaGVyZSBpcyBuZWVkZWQgYWZhaWN0LiBTaW5jZSB0aGUgb3RoZXIgaGFsZiBvZiB0aGUKPiBj
aGFuZ2UgaGVyZSAoYW5kIGEgY29ycmVzcG9uZGluZyBjaGFuZ2UgdG8gYXNzaWduX2RldmljZSgp
KSBjb250aW51ZXMKPiB0byBiZSBjb250cm92ZXJzaWFsLCBjb3VsZCB3ZSBhZ3JlZSBvbiBzcGxp
dHRpbmcgdGhpcyBwYXRjaCBpbnRvIHR3bz8KPiAoSSdkIGJlIGZpbmUgZG9pbmcgdGhlIGxlZ3dv
cmsuKQoKWWVzLCBwbGVhc2UuIEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBhIHJlYWxpc3RpYyBjaGFu
Y2Ugb2YgbWUgZ2V0dGluZwpiYWNrIHRvIHRoaXMgaW4gdGltZSBmb3IgNC4xMy4gSG9wZWZ1bGx5
IHNob3J0bHkgdGhlcmVhZnRlciBJJ2xsIGJlCmFibGUgdG8gZGVhbCB3aXRoIGl0IHRob3VnaC4K
CiAgUGF1bAoKPgo+IEphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
